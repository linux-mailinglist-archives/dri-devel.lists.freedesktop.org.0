Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D857175BF
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 06:39:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B10910E15E;
	Wed, 31 May 2023 04:38:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.nfschina.com (unknown [42.101.60.195])
 by gabe.freedesktop.org (Postfix) with SMTP id ECAF510E15E;
 Wed, 31 May 2023 04:38:53 +0000 (UTC)
Received: from localhost.localdomain (unknown [180.167.10.98])
 by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id 26EE7180106EEA; 
 Wed, 31 May 2023 12:38:29 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/nouveau/nvif: use struct_size()
Date: Wed, 31 May 2023 12:38:26 +0800
Message-Id: <20230531043826.991183-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
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
Cc: Su Hui <suhui@nfschina.com>, nouveau@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use struct_size() instead of hand writing it.
This is less verbose and more informative.

Signed-off-by: Su Hui <suhui@nfschina.com>
---
 drivers/gpu/drm/nouveau/nvif/object.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvif/object.c b/drivers/gpu/drm/nouveau/nvif/object.c
index 4d1aaee8fe15..4bd693aa4ee0 100644
--- a/drivers/gpu/drm/nouveau/nvif/object.c
+++ b/drivers/gpu/drm/nouveau/nvif/object.c
@@ -65,7 +65,7 @@ nvif_object_sclass_get(struct nvif_object *object, struct nvif_sclass **psclass)
 	u32 size;
 
 	while (1) {
-		size = sizeof(*args) + cnt * sizeof(args->sclass.oclass[0]);
+		size = struct_size(args, sclass.oclass, cnt);
 		if (!(args = kmalloc(size, GFP_KERNEL)))
 			return -ENOMEM;
 		args->ioctl.version = 0;
-- 
2.30.2

