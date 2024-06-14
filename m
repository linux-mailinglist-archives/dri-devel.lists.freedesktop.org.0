Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C61C6908B08
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 13:47:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FA5C10E24C;
	Fri, 14 Jun 2024 11:47:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 953E210E1F5
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 11:47:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E7EF3FEC;
 Fri, 14 Jun 2024 04:47:24 -0700 (PDT)
Received: from e126387.arm.com (unknown [10.57.7.81])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4F03F3F5A1;
 Fri, 14 Jun 2024 04:46:58 -0700 (PDT)
From: carsten.haitzler@foss.arm.com
To: dri-devel@lists.freedesktop.org
Cc: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com,
 Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com,
 christian.koenig@amd.com, Felix.Kuehling@amd.com,
 alexander.deucher@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de
Subject: [PATCH v2] drm: Fix alignment of temporary stack ioctl buffers
Date: Fri, 14 Jun 2024 12:46:02 +0100
Message-Id: <20240614114602.3187710-1-carsten.haitzler@foss.arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240611093441.200910-1-carsten.haitzler@foss.arm.com>
References: <20240611093441.200910-1-carsten.haitzler@foss.arm.com>
MIME-Version: 1.0
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

From: Carsten Haitzler <carsten.haitzler@foss.arm.com>

In a few places (core drm + AMD kfd driver), the ioctl handling uses a
temporary 128 byte buffer on the stack to copy to/from user. ioctl data
can have structs with types of much larger sizes than a byte and a
system may require alignment of types in these. At the same time the
compiler may align a char buf to something else as it has no idea that
this buffer is used for storing structs with such alignment
requirements. At a minimum putting in alignment information as an
attribute should be a warning in future if an architecture that needs
more alignment appears.

This was discovered while implementing capability ABI support in Linux
on ARM's Morello CPU (128 bit capability "pointers" in userspace, with
a 64bit non-capability kernel (hybrid) setup). In this, userspace
ioctl structs now had to transport capabilities that needed 16 byte
alignment, but the kernel was not putting these data buffers on that
alignment boundary.

Currently the largest type that is needed is a u64 so the alignment
only asks for that.

Signed-off-by: Carsten Haitzler <carsten.haitzler@foss.arm.com>
---
 drivers/dma-buf/dma-heap.c               | 2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 2 +-
 drivers/gpu/drm/drm_ioctl.c              | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index 84ae708fafe7..8fa68b8a9b60 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -126,7 +126,7 @@ static unsigned int dma_heap_ioctl_cmds[] = {
 static long dma_heap_ioctl(struct file *file, unsigned int ucmd,
 			   unsigned long arg)
 {
-	char stack_kdata[128];
+	_Alignas(u64) char stack_kdata[128];
 	char *kdata = stack_kdata;
 	unsigned int kcmd;
 	unsigned int in_size, out_size, drv_size, ksize;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index fdf171ad4a3c..201a5c0227ec 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -3236,7 +3236,7 @@ static long kfd_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
 	amdkfd_ioctl_t *func;
 	const struct amdkfd_ioctl_desc *ioctl = NULL;
 	unsigned int nr = _IOC_NR(cmd);
-	char stack_kdata[128];
+	_Alignas(u64) char stack_kdata[128];
 	char *kdata = NULL;
 	unsigned int usize, asize;
 	int retcode = -EINVAL;
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index e368fc084c77..77a88b597c0b 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -767,7 +767,7 @@ long drm_ioctl(struct file *filp,
 	drm_ioctl_t *func;
 	unsigned int nr = DRM_IOCTL_NR(cmd);
 	int retcode = -EINVAL;
-	char stack_kdata[128];
+	_Alignas(u64) char stack_kdata[128];
 	char *kdata = NULL;
 	unsigned int in_size, out_size, drv_size, ksize;
 	bool is_driver_ioctl;
-- 
2.25.1

