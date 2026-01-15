Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA36D240C4
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 12:03:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7403010E73B;
	Thu, 15 Jan 2026 11:03:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=rsg.ci.i.u-tokyo.ac.jp header.i=@rsg.ci.i.u-tokyo.ac.jp header.b="Yi7RdSec";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 4020 seconds by postgrey-1.36 at gabe;
 Thu, 15 Jan 2026 10:29:23 UTC
Received: from www3579.sakura.ne.jp (www3579.sakura.ne.jp [49.212.243.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DC3C10E023
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 10:29:23 +0000 (UTC)
Received: from [133.11.54.205] (h205.csg.ci.i.u-tokyo.ac.jp [133.11.54.205])
 (authenticated bits=0)
 by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 60F9KMVP007868
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 15 Jan 2026 18:21:42 +0900 (JST)
 (envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=LGFqAj8v6WdBrMCPG//9ioSBolgDFMSOBS8r4ka1X7I=; 
 c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
 h=Message-ID:Date:Subject:To:From;
 s=rs20250326; t=1768468903; v=1;
 b=Yi7RdSecJdFrZZL7vMGyntOcDjsBWle2MiT4qx7eyGuD9ySh3SMH1X4bdrLTXHcw
 3ENzByecMhDe0I8Fq0uu+Rt62R/ZhwVWaAKPqiR015qAOmOjym/a2Oj26RBYLhxV
 6geAw/Nz81K8tAhsDh+LsDV6QP9LadpsKiNf5Yrlof5J4J6Pw6bRbYXrxm2pEL9R
 VqjGHnh2h1it+xHC9FpZ+PSdT/vbvRiwhReoUtCS141atxTu4KFmU29gnlgYjaLT
 +Qb9ZnczL0y98QEqx8EC6r6XtNDP1W6wFvQ/JmXL0YwzPhvRgiUVm0wIkrXOQE4L
 cD5hSa6n3dzBh8ryPoCsVA==
Message-ID: <5b66df7d-374c-4e9c-88d5-bb514f9a7725@rsg.ci.i.u-tokyo.ac.jp>
Date: Thu, 15 Jan 2026 18:20:22 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] virtio-gpu: Add userptr support for compute
 workloads
To: Honglei Huang <honglei1.huang@amd.com>, David Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, Ray.Huang@amd.com
Cc: Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
 Honglei Huang <honghuan@amd.com>
References: <20260115075851.173318-1-honglei1.huang@amd.com>
Content-Language: en-US
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260115075851.173318-1-honglei1.huang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 15 Jan 2026 11:03:08 +0000
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

On 2026/01/15 16:58, Honglei Huang wrote:
> From: Honglei Huang <honghuan@amd.com>
> 
> Hello,
> 
> This series adds virtio-gpu userptr support to enable ROCm native
> context for compute workloads. The userptr feature allows the host to
> directly access guest userspace memory without memcpy overhead, which is
> essential for GPU compute performance.
> 
> The userptr implementation provides buffer-based zero-copy memory access.
> This approach pins guest userspace pages and exposes them to the host
> via scatter-gather tables, enabling efficient compute operations.

This description looks identical with what 
VIRTIO_GPU_BLOB_MEM_HOST3D_GUEST does so there should be some 
explanation how it makes difference.

I have already pointed out this when reviewing the QEMU patches[1], but 
I note that here too, since QEMU is just a middleman and this matter is 
better discussed by Linux and virglrenderer developers.

[1] 
https://lore.kernel.org/qemu-devel/35a8add7-da49-4833-9e69-d213f52c771a@amd.com/

> 
> Key features:
> - Zero-copy memory access between guest userspace and host GPU
> - Read-only and read-write userptr support
> - Runtime feature detection via VIRTGPU_PARAM_RESOURCE_USERPTR
> - ROCm capset support for ROCm stack integration
> - Proper page lifecycle management with FOLL_LONGTERM pinning
> 
> Patches overview:
> 1. Add VIRTIO_GPU_CAPSET_ROCM capability for compute workloads
> 2. Add virtio-gpu API definitions for userptr blob resources
> 3. Extend DRM UAPI with comprehensive userptr support
> 4. Implement core userptr functionality with page management
> 5. Integrate userptr into blob resource creation and advertise to userspace
> 
> Performance: In popular compute benchmarks, this implementation achieves
> approximately 70% efficiency compared to bare metal OpenCL performance on
> AMD V2000 hardware, achieves 92% efficiency on AMD W7900 hardware.
> 
> Testing: Verified with ROCm stack and OpenCL applications in VIRTIO virtualized
> environments.
> - Full OPENCL CTS tests passed on ROCm 5.7.0 in V2000 platform.
> - Near 70% percentage of OPENCL CTS tests passed on ROCm 7.0 W7900 platform.
> - most HIP catch tests passed on ROCm 7.0 W7900 platform.
> - Some AI applications enabled on ROCm 7.0 W7900 platform.
> 
> V4 changes:
>      - Renamed VIRTIO_GPU_CAPSET_HSAKMT to VIRTIO_GPU_CAPSET_ROCM
>      - Remove userptr feature probing cause it can reuse the guest
>        blob resource code path, reduce patch count from 6 to 5
>      - Updated corresponding commit messages
>      - Consolidated userptr feature detection in final patch
>      - Update corresponding cover letter content
> 
> V3 changes:
>      - Split into focused patches for easier review
>      - Removed complex interval tree userptr management
>      - Simplified resource creation without deduplication
>      - Added VIRTGPU_PARAM_RESOURCE_USERPTR for feature detection
>      - Improved UAPI documentation and error handling
>      - Enhanced code quality with proper cleanup paths
>      - Removed MMU notifier dependencies for simplicity
>      - Fixed resource lifecycle management issues
> 
> V2: - Split add HSAKMT context and blob userptr resource to two patches.
>      - Remove MMU notifier related patches, cause use not moveable user space
>        memory with MMU notifier is not a good idea.
>      - Remove HSAKMT context check when create context, let all the context
>        support the userptr feature.
>      - Remove MMU notifier related content in cover letter.
>      - Add more comments  for patch 6 in cover letter.
> 
> Honglei Huang (5):
>    drm/virtio-gpu: Add VIRTIO_GPU_CAPSET_ROCM capability
>    virtio-gpu api: add blob userptr resource
>    drm/virtgpu api: add blob userptr resource
>    drm/virtio: implement userptr support for zero-copy memory access
>    drm/virtio: advertise base userptr feature to userspace
> 
>   drivers/gpu/drm/virtio/Makefile          |   3 +-
>   drivers/gpu/drm/virtio/virtgpu_drv.h     |  33 ++++
>   drivers/gpu/drm/virtio/virtgpu_ioctl.c   |   9 +-
>   drivers/gpu/drm/virtio/virtgpu_object.c  |   6 +
>   drivers/gpu/drm/virtio/virtgpu_userptr.c | 231 +++++++++++++++++++++++
>   include/uapi/drm/virtgpu_drm.h           |   9 +
>   include/uapi/linux/virtio_gpu.h          |   7 +
>   7 files changed, 295 insertions(+), 3 deletions(-)
>   create mode 100644 drivers/gpu/drm/virtio/virtgpu_userptr.c
> 

