Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF862A3874
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 02:19:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0320E6E7D4;
	Tue,  3 Nov 2020 01:19:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B82026E7D4;
 Tue,  3 Nov 2020 01:19:24 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B0EAD223C7;
 Tue,  3 Nov 2020 01:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604366364;
 bh=99bqU9YnZZeya7Q8pD2A8nL0JndviI2vVwrA03SaOCQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=O4YnoCojjMwJg9jwjgAMEBSmlAT/SZC5tk3LYvpvkHKbNyY9XiwOWALzQhcAILbM8
 TTONZs8OGZ3K2silyCpw3mkvwV+C60I5YdG0hxU8MIN2h/xshWm1gS8AEzS7zc/GVo
 coqhFVyDWsgWhlikWnbCKOT8tT38mh0vKspDQhnQ=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.9 33/35] drm/nouveau/nouveau: fix the start/end
 range for migration
Date: Mon,  2 Nov 2020 20:18:38 -0500
Message-Id: <20201103011840.182814-33-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201103011840.182814-1-sashal@kernel.org>
References: <20201103011840.182814-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, nouveau@lists.freedesktop.org,
 Ralph Campbell <rcampbell@nvidia.com>, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ralph Campbell <rcampbell@nvidia.com>

[ Upstream commit cfa736f5a6f31ca8a05459b5720aac030247ad1b ]

The user level OpenCL code shouldn't have to align start and end
addresses to a page boundary. That is better handled in the nouveau
driver. The npages field is also redundant since it can be computed
from the start and end addresses.

Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/nouveau/nouveau_svm.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index 2df1c04605594..4f69e4c3dafde 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -105,11 +105,11 @@ nouveau_svmm_bind(struct drm_device *dev, void *data,
 	struct nouveau_cli *cli = nouveau_cli(file_priv);
 	struct drm_nouveau_svm_bind *args = data;
 	unsigned target, cmd, priority;
-	unsigned long addr, end, size;
+	unsigned long addr, end;
 	struct mm_struct *mm;
 
 	args->va_start &= PAGE_MASK;
-	args->va_end &= PAGE_MASK;
+	args->va_end = ALIGN(args->va_end, PAGE_SIZE);
 
 	/* Sanity check arguments */
 	if (args->reserved0 || args->reserved1)
@@ -118,8 +118,6 @@ nouveau_svmm_bind(struct drm_device *dev, void *data,
 		return -EINVAL;
 	if (args->va_start >= args->va_end)
 		return -EINVAL;
-	if (!args->npages)
-		return -EINVAL;
 
 	cmd = args->header >> NOUVEAU_SVM_BIND_COMMAND_SHIFT;
 	cmd &= NOUVEAU_SVM_BIND_COMMAND_MASK;
@@ -151,12 +149,6 @@ nouveau_svmm_bind(struct drm_device *dev, void *data,
 	if (args->stride)
 		return -EINVAL;
 
-	size = ((unsigned long)args->npages) << PAGE_SHIFT;
-	if ((args->va_start + size) <= args->va_start)
-		return -EINVAL;
-	if ((args->va_start + size) > args->va_end)
-		return -EINVAL;
-
 	/*
 	 * Ok we are ask to do something sane, for now we only support migrate
 	 * commands but we will add things like memory policy (what to do on
@@ -171,7 +163,7 @@ nouveau_svmm_bind(struct drm_device *dev, void *data,
 		return -EINVAL;
 	}
 
-	for (addr = args->va_start, end = args->va_start + size; addr < end;) {
+	for (addr = args->va_start, end = args->va_end; addr < end;) {
 		struct vm_area_struct *vma;
 		unsigned long next;
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
