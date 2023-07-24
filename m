Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B6575F4E4
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 13:26:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E4CD10E08E;
	Mon, 24 Jul 2023 11:26:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7215F10E08E
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 11:26:15 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id F22F66607033;
 Mon, 24 Jul 2023 12:26:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1690197974;
 bh=FPzsokEq60QB6Lq1genijHT7LF37FBTgPWRm/+4nsuE=;
 h=From:To:Cc:Subject:Date:From;
 b=Ga8jaWgB+NGUZHu4RL6KXDwhNU0oK/06Jvv3v7J5z0maoLVTMvA2oDsp7hJQkH8Ci
 pz2y3H1oNVccDKzt0TxIbuMiNfaRFtCupsnaMezxxSzFgv6R9awOEDekQidW64qrq1
 mpzMjvy2BMZUV4vf9i/EG33/rMDnp1zn8Ks4hU1zZFn5RmZEKfvEqKFvOFGi0SaH8F
 Jy6aKXSfwmDt0S8ejvJcdRnZwKZ8pNO15zSsQrFyGYaVn7uyCblxEUo5LSWBRSRlmz
 6NG1U/I131tskiNqFGsUpOT/6BCDkhz1NZDaqhRPsRSeArX7Cq6dceH/4VU7IPV1BN
 gp2oh5TdYlQuA==
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/shmem-helper: Reset vma->vm_ops before calling
 dma_buf_mmap()
Date: Mon, 24 Jul 2023 13:26:10 +0200
Message-ID: <20230724112610.60974-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.41.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>, stable@vger.kernel.org,
 Roman Stratiienko <roman.stratiienko@globallogic.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The dma-buf backend is supposed to provide its own vm_ops, but some
implementation just have nothing special to do and leave vm_ops
untouched, probably expecting this field to be zero initialized (this
is the case with the system_heap implementation for instance).
Let's reset vma->vm_ops to NULL to keep things working with these
implementations.

Fixes: 26d3ac3cb04d ("drm/shmem-helpers: Redirect mmap for imported dma-buf")
Cc: <stable@vger.kernel.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Reported-by: Roman Stratiienko <roman.stratiienko@globallogic.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 4ea6507a77e5..baaf0e0feb06 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -623,7 +623,13 @@ int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct
 	int ret;
 
 	if (obj->import_attach) {
+		/* Reset both vm_ops and vm_private_data, so we don't end up with
+		 * vm_ops pointing to our implementation if the dma-buf backend
+		 * doesn't set those fields.
+		 */
 		vma->vm_private_data = NULL;
+		vma->vm_ops = NULL;
+
 		ret = dma_buf_mmap(obj->dma_buf, vma, 0);
 
 		/* Drop the reference drm_gem_mmap_obj() acquired.*/
-- 
2.41.0

