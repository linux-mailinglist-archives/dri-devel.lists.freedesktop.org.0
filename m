Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7B71D9CBF
	for <lists+dri-devel@lfdr.de>; Tue, 19 May 2020 18:33:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BABA889F63;
	Tue, 19 May 2020 16:33:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3F7689F63
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 16:33:08 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EA79220709;
 Tue, 19 May 2020 16:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589905988;
 bh=N1UCw97sxHv6NCUr3SlLAqzW3zL/V10Dg2KZ3SMQItM=;
 h=From:To:Cc:Subject:Date:From;
 b=YEFfxu+DKUF3cUmlvwThQFr8L4FVPQT4GNnD9NrOAAxftkTN/wVInEBVVzV+vmz3g
 SpRhjgh8NoEYtVwmEPwfJcjvb7AmnzpsTEVGJddF0ZEcBEUqFinzvjuxALD9HWs+qa
 kguy5MvWcaAv+bpW2Mw5fhZ+Lem2P3AcOqCVE1kg=
From: Sasha Levin <sashal@kernel.org>
To: alexander.deucher@amd.com, chris@chris-wilson.co.uk,
 ville.syrjala@linux.intel.com, Hawking.Zhang@amd.com,
 tvrtko.ursulin@intel.com
Subject: [RFC PATCH 0/4] DirectX on Linux
Date: Tue, 19 May 2020 12:32:30 -0400
Message-Id: <20200519163234.226513-1-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>, linux-hyperv@vger.kernel.org,
 sthemmin@microsoft.com, gregkh@linuxfoundation.org, haiyangz@microsoft.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 spronovo@microsoft.com, wei.liu@kernel.org, linux-fbdev@vger.kernel.org,
 iourit@microsoft.com, kys@microsoft.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is a blog post that goes into more detail about the bigger
picture, and walks through all the required pieces to make this work. It
is available here:
https://devblogs.microsoft.com/directx/directx-heart-linux . The rest of
this cover letter will focus on the Linux Kernel bits.

Overview
========

This is the first draft of the Microsoft Virtual GPU (vGPU) driver. The
driver exposes a paravirtualized GPU to user mode applications running
in a virtual machine on a Windows host. This enables hardware
acceleration in environment such as WSL (Windows Subsystem for Linux)
where the Linux virtual machine is able to share the GPU with the
Windows host.

The projection is accomplished by exposing the WDDM (Windows Display
Driver Model) interface as a set of IOCTL. This allows APIs and user
mode driver written against the WDDM GPU abstraction on Windows to be
ported to run within a Linux environment. This enables the port of the
D3D12 and DirectML APIs as well as their associated user mode driver to
Linux. This also enables third party APIs, such as the popular NVIDIA
Cuda compute API, to be hardware accelerated within a WSL environment.

Only the rendering/compute aspect of the GPU are projected to the
virtual machine, no display functionality is exposed. Further, at this
time there are no presentation integration. So although the D3D12 API
can be use to render graphics offscreen, there is no path (yet) for
pixel to flow from the Linux environment back onto the Windows host
desktop. This GPU stack is effectively side-by-side with the native
Linux graphics stack.

The driver creates the /dev/dxg device, which can be opened by user mode
application and handles their ioctls. The IOCTL interface to the driver
is defined in dxgkmthk.h (Dxgkrnl Graphics Port Driver ioctl
definitions). The interface matches the D3DKMT interface on Windows.
Ioctls are implemented in ioctl.c.

When a VM starts, hyper-v on the host adds virtual GPU devices to the VM
via the hyper-v driver. The host offers several VM bus channels to the
VM: the global channel and one channel per virtual GPU, assigned to the
VM.

The driver registers with the hyper-v driver (hv_driver) for the arrival
of VM bus channels. dxg_probe_device recognizes the vGPU channels and
creates the corresponding objects (dxgadapter for vGPUs and dxgglobal
for the global channel).

The driver uses the hyper-V VM bus interface to communicate with the
host. dxgvmbus.c implements the communication interface.

The global channel has 8GB of IO space assigned by the host. This space
is managed by the host and used to give the guest direct CPU access to
some allocations. Video memory is allocated on the host except in the
case of existing_sysmem allocations. The Windows host allocates memory
for the GPU on behalf of the guest. The Linux guest can access that
memory by mapping GPU virtual address to allocations and then
referencing those GPU virtual address from within GPU command buffers
submitted to the GPU. For allocations which require CPU access, the
allocation is mapped by the host into a location in the 8GB of IO space
reserved in the guest for that purpose. The Windows host uses the nested
CPU page table to ensure that this guest IO space always map to the
correct location for the allocation as it may migrate between dedicated
GPU memory (e.g. VRAM, firmware reserved DDR) and shared system memory
(regular DDR) over its lifetime. The Linux guest maps a user mode CPU
virtual address to an allocation IO space range for direct access by
user mode APIs and drivers.

 

Implementation of LX_DXLOCK2 ioctl
==================================

We would appreciate your feedback on the implementation of the
LX_DXLOCK2 ioctl.

This ioctl is used to get a CPU address to an allocation, which is
resident in video/system memory on the host. The way it works:

1. The driver sends the Lock message to the host

2. The host allocates space in the VM IO space and maps it to the
allocation memory

3. The host returns the address in IO space for the mapped allocation

4. The driver (in dxg_map_iospace) allocates a user mode virtual address
range using vm_mmap and maps it to the IO space using
io_remap_ofn_range)

5. The VA is returned to the application

 

Internal objects
================

The following objects are created by the driver (defined in dxgkrnl.h):

- dxgadapter - represents a virtual GPU

- dxgprocess - tracks per process state (handle table of created
  objects, list of objects, etc.)

- dxgdevice - a container for other objects (contexts, paging queues,
  allocations, GPU synchronization objects)

- dxgcontext - represents thread of GPU execution for packet
  scheduling.

- dxghwqueue - represents thread of GPU execution of hardware scheduling

- dxgallocation - represents a GPU accessible allocation

- dxgsyncobject - represents a GPU synchronization object

- dxgresource - collection of dxgalloction objects

- dxgsharedresource, dxgsharedsyncobj - helper objects to share objects
  between different dxgdevice objects, which can belong to different
processes


 
Object handles
==============

All GPU objects, created by the driver, are accessible by a handle
(d3dkmt_handle). Each process has its own handle table, which is
implemented in hmgr.c. For each API visible object, created by the
driver, there is an object, created on the host. For example, the is a
dxgprocess object on the host for each dxgprocess object in the VM, etc.
The object handles have the same value in the host and the VM, which is
done to avoid translation from the guest handles to the host handles.
 


Signaling CPU events by the host
================================

The WDDM interface provides a way to signal CPU event objects when
execution of a context reached certain point. The way it is implemented:

- application sends an event_fd via ioctl to the driver

- eventfd_ctx_get is used to get a pointer to the file object
  (eventfd_ctx)

- the pointer to sent the host via a VM bus message

- when GPU execution reaches a certain point, the host sends a message
  to the VM with the event pointer

- signal_guest_event() handles the messages and eventually
  eventfd_signal() is called.


Sasha Levin (4):
  gpu: dxgkrnl: core code
  gpu: dxgkrnl: hook up dxgkrnl
  Drivers: hv: vmbus: hook up dxgkrnl
  gpu: dxgkrnl: create a MAINTAINERS entry

 MAINTAINERS                      |    7 +
 drivers/gpu/Makefile             |    2 +-
 drivers/gpu/dxgkrnl/Kconfig      |   10 +
 drivers/gpu/dxgkrnl/Makefile     |   12 +
 drivers/gpu/dxgkrnl/d3dkmthk.h   | 1635 +++++++++
 drivers/gpu/dxgkrnl/dxgadapter.c | 1399 ++++++++
 drivers/gpu/dxgkrnl/dxgkrnl.h    |  913 ++++++
 drivers/gpu/dxgkrnl/dxgmodule.c  |  692 ++++
 drivers/gpu/dxgkrnl/dxgprocess.c |  355 ++
 drivers/gpu/dxgkrnl/dxgvmbus.c   | 2955 +++++++++++++++++
 drivers/gpu/dxgkrnl/dxgvmbus.h   |  859 +++++
 drivers/gpu/dxgkrnl/hmgr.c       |  593 ++++
 drivers/gpu/dxgkrnl/hmgr.h       |  107 +
 drivers/gpu/dxgkrnl/ioctl.c      | 5269 ++++++++++++++++++++++++++++++
 drivers/gpu/dxgkrnl/misc.c       |  280 ++
 drivers/gpu/dxgkrnl/misc.h       |  288 ++
 drivers/video/Kconfig            |    2 +
 include/linux/hyperv.h           |   16 +
 18 files changed, 15393 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/dxgkrnl/Kconfig
 create mode 100644 drivers/gpu/dxgkrnl/Makefile
 create mode 100644 drivers/gpu/dxgkrnl/d3dkmthk.h
 create mode 100644 drivers/gpu/dxgkrnl/dxgadapter.c
 create mode 100644 drivers/gpu/dxgkrnl/dxgkrnl.h
 create mode 100644 drivers/gpu/dxgkrnl/dxgmodule.c
 create mode 100644 drivers/gpu/dxgkrnl/dxgprocess.c
 create mode 100644 drivers/gpu/dxgkrnl/dxgvmbus.c
 create mode 100644 drivers/gpu/dxgkrnl/dxgvmbus.h
 create mode 100644 drivers/gpu/dxgkrnl/hmgr.c
 create mode 100644 drivers/gpu/dxgkrnl/hmgr.h
 create mode 100644 drivers/gpu/dxgkrnl/ioctl.c
 create mode 100644 drivers/gpu/dxgkrnl/misc.c
 create mode 100644 drivers/gpu/dxgkrnl/misc.h

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
