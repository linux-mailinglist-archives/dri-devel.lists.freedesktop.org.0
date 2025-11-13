Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3053FC57326
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 12:32:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 564BC10E7FF;
	Thu, 13 Nov 2025 11:32:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="g13zL3BR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-130.freemail.mail.aliyun.com
 (out30-130.freemail.mail.aliyun.com [115.124.30.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93E2910E7FF
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 11:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1763033569; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
 bh=iK7SyfUTYZ0NY7SlAfoVfPpY/ANu8iSrVtPJybO+c20=;
 b=g13zL3BR/IRDL8HxGPpmn9ygdShOp3+akM9kULJuNnG4Z2lXA4jeQhs4W4b6PaHUBAlbpzBJFWkIgrtFG0/lY69KiIgeffE5zWqZjJX2sj09LbTw0Q4CEh9ODaBw3yWyD9RoeYr/ddUjjXV20MeK2L6VhAKAoupdXK0Mo5bzMWM=
Received: from 30.246.165.27(mailfrom:xueshuai@linux.alibaba.com
 fp:SMTPD_---0WsJcCiM_1763033566 cluster:ay36) by smtp.aliyun-inc.com;
 Thu, 13 Nov 2025 19:32:47 +0800
Message-ID: <37715c7b-8914-4ce7-84a7-288a808d7933@linux.alibaba.com>
Date: Thu, 13 Nov 2025 19:32:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] Initial DMABUF support for iommufd
To: Nicolin Chen <nicolinc@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>
Cc: Alex Williamson <alex@shazbot.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
 Joerg Roedel <joro@8bytes.org>, Kevin Tian <kevin.tian@intel.com>,
 kvm@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, Shuah Khan <shuah@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Will Deacon <will@kernel.org>,
 Krishnakant Jaju <kjaju@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
 Matt Ochs <mochs@nvidia.com>, patches@lists.linux.dev,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Xu Yilun <yilun.xu@linux.intel.com>
References: <0-v1-af84a3ab44f5+f68-iommufd_buf_jgg@nvidia.com>
 <aQ4x7UiMMCB0m0dH@Asurada-Nvidia>
 <29f0cddc-3c23-4ab1-92d9-8c9918ddc187@linux.alibaba.com>
 <aRWKA4zBwi+JagaT@Asurada-Nvidia>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <aRWKA4zBwi+JagaT@Asurada-Nvidia>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Nicolin,

在 2025/11/13 15:34, Nicolin Chen 写道:
> On Thu, Nov 13, 2025 at 02:33:01PM +0800, Shuai Xue wrote:
>> Could you share more details for testing?, e.g. QEMU cmdline,
>> Guest kernel version.
> 
> My v6.8 and v6.14 kernels can boot cleanly in the VM.
> 
> vm_image=PATH-to-FILE
> e1000_rom=PATH-to-FILE
> qemu-system-aarch64 \
> 	-object iommufd,id=iommufd0 \
> 	-machine hmat=on -machine virt,accel=kvm,gic-version=3,ras=on,highmem-mmio-size=4T \
> 	-cpu host -smp cpus=62 -m size=16G,slots=2,maxmem=256G -nographic \
> 	-object memory-backend-ram,size=8G,id=m0 -object memory-backend-ram,size=8G,id=m1 \
> 	-numa node,memdev=m0,cpus=0-61,nodeid=0 -numa node,memdev=m1,nodeid=1 \
> 	-numa node,nodeid=2 -numa node,nodeid=3 -numa node,nodeid=4 -numa node,nodeid=5 \
> 	-numa node,nodeid=6 -numa node,nodeid=7 -numa node,nodeid=8 -numa node,nodeid=9 \
> 	-device pxb-pcie,id=pcie.1,bus_nr=1,bus=pcie.0 -device arm-smmuv3,primary-bus=pcie.1,id=smmuv3.1,accel=on,ats=on,ril=off,pasid=on,oas=48 \
> 	-device pcie-root-port,id=pcie.port1,bus=pcie.1,chassis=1,io-reserve=0 \
> 	-device vfio-pci-nohotplug,host=0009:01:00.0,bus=pcie.port1,rombar=0,id=dev0,iommufd=iommufd0 \
> 	-object acpi-generic-initiator,id=gi0,pci-dev=dev0,node=2 \
> 	-object acpi-generic-initiator,id=gi1,pci-dev=dev0,node=3 \
> 	-object acpi-generic-initiator,id=gi2,pci-dev=dev0,node=4 \
> 	-object acpi-generic-initiator,id=gi3,pci-dev=dev0,node=5 \
> 	-object acpi-generic-initiator,id=gi4,pci-dev=dev0,node=6 \
> 	-object acpi-generic-initiator,id=gi5,pci-dev=dev0,node=7 \
> 	-object acpi-generic-initiator,id=gi6,pci-dev=dev0,node=8 \
> 	-object acpi-generic-initiator,id=gi7,pci-dev=dev0,node=9 \
> 	-bios /usr/share/AAVMF/AAVMF_CODE.fd \
> 	-device nvme,drive=nvme0,serial=deadbeaf1,bus=pcie.0 \
> 	-drive file=${vm_image},index=0,media=disk,format=qcow2,if=none,id=nvme0 \
> 	-device e1000,romfile=${e1000_rom},netdev=net0,bus=pcie.0 \
> 	-netdev user,id=net0,hostfwd=tcp::5558-:22,hostfwd=tcp::5586-:5586
> 

Thanks for sharing the command line. The issue was with my QEMU command
line configuration.

Using your command line, I can now boot my v6.6 kernel cleanly in the
VM, and the PCIe passthrough device works correctly.

Tested-by: Shuai Xue <xueshuai@linux.alibaba.com>

Thanks.
Shuai
