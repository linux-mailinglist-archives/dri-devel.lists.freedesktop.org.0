Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F10E59FF42
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 18:14:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8D41BA111;
	Wed, 24 Aug 2022 16:14:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B679B9FC9
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 16:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661357621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=shnv9nDHn9uoBkujzrrhLdUD67s9BTHB9Z1Ctk5SIAU=;
 b=Zq4nFlr7SaFgj1oYWXw9tGDx0rOl2nctt9PXYhJPBiCd+SK4g8rXETx6RYAnGEql1wCS7v
 R1ihd8v0hhSBqqPojfHC8ityJuPd13px6Rj1FhJhKBLOnMo45Ckxh3NSjkYcXIxf7poQao
 HxR+kSk6RBeryX2MTCnxEK7ZLzJP4Kc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-637-DHPYrg-XMauS8e75Kqcz2w-1; Wed, 24 Aug 2022 12:13:39 -0400
X-MC-Unique: DHPYrg-XMauS8e75Kqcz2w-1
Received: by mail-ed1-f69.google.com with SMTP id
 f20-20020a05640214d400b004470930f180so4057047edx.10
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 09:13:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=shnv9nDHn9uoBkujzrrhLdUD67s9BTHB9Z1Ctk5SIAU=;
 b=25bR4X6md5FiKo53UQcM63ymWyV1JumkYe2ORDu3Nvj0vs+qTlxn1ggvTsgWLZOdaa
 4GaEEAWKjkIAZXgxJbI3zw6YDePClC9X58sdqtGY5EE4aAV9Z5HNGAN0hN5kIX2zsp8I
 MZqPZ2eBLz8X8IZ+VyEXuQIK4eOd2Av1DlBz02Ub3PjVq/eQO5f3NXhDkTGNND3oj35r
 3qxCd5cNVB3hoWaEt9TlP6u8vx7NBbI/YviD7KJ7qOVgOyEqYhDbaLE7Xj4J28wlFg56
 IMBounOX+meN7U3llVw/WLexgJnQ+uNH+s2f+MWKPuh9q97CmSnN00G7hdkKj9vNe9L/
 bfFA==
X-Gm-Message-State: ACgBeo3QbeEXEJ8PMtkaF5qLlAX+Uc0b6tJltU2001Wq5uCViRgtmBl/
 AKrxVDu8AcEc4c4h6eTgjQbFFtsEuA4dATMenWncShY4IxaaMRepuKKGy9QQh0D/khU11t634ga
 zeOku4Ee2hyRmYsmSUJ/3Pj1UgmUq
X-Received: by 2002:a17:907:b06:b0:73d:c534:1ac3 with SMTP id
 h6-20020a1709070b0600b0073dc5341ac3mr1007067ejl.194.1661357618755; 
 Wed, 24 Aug 2022 09:13:38 -0700 (PDT)
X-Google-Smtp-Source: AA6agR51vE5rD3Cnr43VGXz6apFS+AbCm8Q7NybadVKzLFntNtPDrnwpSizgYigjC19GqW+ewQ6s0Q==
X-Received: by 2002:a17:907:b06:b0:73d:c534:1ac3 with SMTP id
 h6-20020a1709070b0600b0073dc5341ac3mr1007059ejl.194.1661357618587; 
 Wed, 24 Aug 2022 09:13:38 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 j2-20020a170906410200b007308bdef04bsm1359102ejk.103.2022.08.24.09.13.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 09:13:38 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org
Subject: [PATCH drm-misc-next v3 2/4] drm/vc4: plane: protect device resources
 after removal
Date: Wed, 24 Aug 2022 18:13:25 +0200
Message-Id: <20220824161327.330627-3-dakr@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220824161327.330627-1-dakr@redhat.com>
References: <20220824161327.330627-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

(Hardware) resources which are bound to the driver and device lifecycle
must not be accessed after the device and driver are unbound.

However, the DRM device isn't freed as long as the last user closed it,
hence userspace can still call into the driver.

Therefore protect the critical sections which are accessing those
resources with drm_dev_enter() and drm_dev_exit().

Fixes: 9872c7a31921 ("drm/vc4: plane: Switch to drmm_universal_plane_alloc()")
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/vc4/vc4_plane.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index eff9c63adfa7..8b92a45a3c89 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -19,6 +19,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_atomic_uapi.h>
 #include <drm/drm_blend.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
@@ -1219,6 +1220,10 @@ u32 vc4_plane_write_dlist(struct drm_plane *plane, u32 __iomem *dlist)
 {
 	struct vc4_plane_state *vc4_state = to_vc4_plane_state(plane->state);
 	int i;
+	int idx;
+
+	if (!drm_dev_enter(plane->dev, &idx))
+		goto out;
 
 	vc4_state->hw_dlist = dlist;
 
@@ -1226,6 +1231,9 @@ u32 vc4_plane_write_dlist(struct drm_plane *plane, u32 __iomem *dlist)
 	for (i = 0; i < vc4_state->dlist_count; i++)
 		writel(vc4_state->dlist[i], &dlist[i]);
 
+	drm_dev_exit(idx);
+
+out:
 	return vc4_state->dlist_count;
 }
 
@@ -1245,6 +1253,10 @@ void vc4_plane_async_set_fb(struct drm_plane *plane, struct drm_framebuffer *fb)
 	struct vc4_plane_state *vc4_state = to_vc4_plane_state(plane->state);
 	struct drm_gem_dma_object *bo = drm_fb_dma_get_gem_obj(fb, 0);
 	uint32_t addr;
+	int idx;
+
+	if (!drm_dev_enter(plane->dev, &idx))
+		return;
 
 	/* We're skipping the address adjustment for negative origin,
 	 * because this is only called on the primary plane.
@@ -1263,6 +1275,8 @@ void vc4_plane_async_set_fb(struct drm_plane *plane, struct drm_framebuffer *fb)
 	 * also use our updated address.
 	 */
 	vc4_state->dlist[vc4_state->ptr0_offset] = addr;
+
+	drm_dev_exit(idx);
 }
 
 static void vc4_plane_atomic_async_update(struct drm_plane *plane,
@@ -1271,6 +1285,10 @@ static void vc4_plane_atomic_async_update(struct drm_plane *plane,
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
 										 plane);
 	struct vc4_plane_state *vc4_state, *new_vc4_state;
+	int idx;
+
+	if (!drm_dev_enter(plane->dev, &idx))
+		return;
 
 	swap(plane->state->fb, new_plane_state->fb);
 	plane->state->crtc_x = new_plane_state->crtc_x;
@@ -1333,6 +1351,8 @@ static void vc4_plane_atomic_async_update(struct drm_plane *plane,
 	       &vc4_state->hw_dlist[vc4_state->pos2_offset]);
 	writel(vc4_state->dlist[vc4_state->ptr0_offset],
 	       &vc4_state->hw_dlist[vc4_state->ptr0_offset]);
+
+	drm_dev_exit(idx);
 }
 
 static int vc4_plane_atomic_async_check(struct drm_plane *plane,
-- 
2.37.2

