Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAE81FD7EA
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 23:51:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 676356E1D6;
	Wed, 17 Jun 2020 21:51:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED0156E1D6
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 21:51:46 +0000 (UTC)
Received: from embeddedor (unknown [189.207.59.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0DF01206E2;
 Wed, 17 Jun 2020 21:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592430706;
 bh=hrwO+kM2wjdv4ncpwZvo+b5b3WHUo+MGuqTylhXVPl0=;
 h=Date:From:To:Cc:Subject:From;
 b=wOvVB9WRLIrXD8MQwrapjXinSs4LiDjJ7u55Xp+IoiyLP2GO8SLUdrW6D5I3MgKA1
 LsJQNuCBi7vqBj//p7VGZfp22VxRulyVkV1e6ItN96ebmCyA0o8VCIbZZg4odtpM2s
 cpnan2bw7kAgVz0oxEU9boM+CRm/i7ekGT8Ygcxs=
Date: Wed, 17 Jun 2020 16:57:07 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH][next] drm/virtio: Use struct_size() helper in kmalloc()
Message-ID: <20200617215707.GA16785@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make use of the struct_size() helper instead of an open-coded version
in order to avoid any potential type mistakes.

This code was detected with the help of Coccinelle and, audited and
fixed manually.

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/gpu/drm/virtio/virtgpu_gem.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
index 24ffacac99e4..c30c75ee83fc 100644
--- a/drivers/gpu/drm/virtio/virtgpu_gem.c
+++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
@@ -154,9 +154,8 @@ void virtio_gpu_gem_object_close(struct drm_gem_object *obj,
 struct virtio_gpu_object_array *virtio_gpu_array_alloc(u32 nents)
 {
 	struct virtio_gpu_object_array *objs;
-	size_t size = sizeof(*objs) + sizeof(objs->objs[0]) * nents;
 
-	objs = kmalloc(size, GFP_KERNEL);
+	objs = kmalloc(struct_size(objs, objs, nents), GFP_KERNEL);
 	if (!objs)
 		return NULL;
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
