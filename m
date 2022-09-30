Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F245F0625
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 10:01:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B95410EBA6;
	Fri, 30 Sep 2022 08:01:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1515610EBA6
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 08:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664524907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BhMohZdHv/NYPGl/GfX50VKPfe6Ysje6teOKPsKsTuI=;
 b=E2eEMFNzyhspawrQ6Iqqiz7X/6v7bLOzfljlZ4KWME7Yprjga8GUGqB2OxZKZGuLJTHWYq
 dTwIJk6mEGQudnKxjZTf9uCZtj9puA85hWbTFyboaDml9Kdogr2/nDNLkfFpzKYduntu1j
 K0W0NddZggipcwj0ZKnBk+AUAFSUx0c=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-611-lNgMF9F6Pa2a0W0k-SY1qQ-1; Fri, 30 Sep 2022 04:01:35 -0400
X-MC-Unique: lNgMF9F6Pa2a0W0k-SY1qQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 t12-20020adfa2cc000000b0022adcbb248bso1274883wra.1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 01:01:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=BhMohZdHv/NYPGl/GfX50VKPfe6Ysje6teOKPsKsTuI=;
 b=J5O9pX3zntL5TkdvV2zxajTO2ApUs7bF7WBfhxdJBsIGr187P7M36S1ycuNHJB03qL
 TPfalM8ekbkzkbMHaDbol9+Q7aI/N0DASpvxIxP/+4nF5veL1WGXd0/WBGLwLT9vdIVm
 ddPkNfgsRkc6F49grc6hLbliQnQJVqvjO5Zq9tny3hFJGa6UV2bZjk6LpI4nPtXFYKIg
 me5zhwnHKabbDp71O5WuLyNozFBKWnvo3Hwvz/XZdi19w/B/nfD3P6PJ8dvIkfsjvxzg
 QCmUbh5Zae7g6xa89NIFhMXY5f7NCfxzyBOt8KTLqU2OkaJDIvkgjrwL2kZ2ypkKHfTU
 BLlg==
X-Gm-Message-State: ACrzQf0mvYMHKtofyFz/Vmb18W2pe4L7wiP3QHs1cFlFHOcFCtx3MF/m
 p0v0tOiZAK/7cVgD8OdYXT6IciPV+OTiN5Sd819D6JHOGU0dprCv7O47nzP/GRuevMRlW0SGpLv
 ogazrOVbSYAEsx9wrSobfFzQTdXoI
X-Received: by 2002:a05:600c:154a:b0:3b4:c9ec:41df with SMTP id
 f10-20020a05600c154a00b003b4c9ec41dfmr12720734wmg.109.1664524894673; 
 Fri, 30 Sep 2022 01:01:34 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5yGOaIy8DNTYzVg8FcSH6ScnegHTEU3zr2MDt+3PC8y6XOkIEELa+/IJHNpMMyC7BlucDtDA==
X-Received: by 2002:a05:600c:154a:b0:3b4:c9ec:41df with SMTP id
 f10-20020a05600c154a00b003b4c9ec41dfmr12720716wmg.109.1664524894427; 
 Fri, 30 Sep 2022 01:01:34 -0700 (PDT)
Received: from minerva.. ([90.167.94.196]) by smtp.gmail.com with ESMTPSA id
 l18-20020a05600c1d1200b003a601a1c2f7sm6474711wms.19.2022.09.30.01.01.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 01:01:33 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/ssd130x: Iterate over damage clips instead of using a
 merged rect
Date: Fri, 30 Sep 2022 10:01:23 +0200
Message-Id: <20220930080123.2441629-1-javierm@redhat.com>
X-Mailer: git-send-email 2.37.3
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm_atomic_helper_damage_merged() helper merges all the damage clips
into one rectangle. If there are multiple damage clips that aren't close
to each other, the resulting rectangle could be quite big.

Instead of using that function helper, iterate over all the damage clips
and update them one by one.

Suggested-by: Jocelyn Falempe <jfalempe@redhat.com>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/solomon/ssd130x.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index bc41a5ae810a..2428f1813a8d 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -578,21 +578,23 @@ static void ssd130x_primary_plane_helper_atomic_update(struct drm_plane *plane,
 	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
 	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
+	struct drm_atomic_helper_damage_iter iter;
 	struct drm_device *drm = plane->dev;
-	struct drm_rect src_clip, dst_clip;
+	struct drm_rect dst_clip;
+	struct drm_rect damage;
 	int idx;
 
-	if (!drm_atomic_helper_damage_merged(old_plane_state, plane_state, &src_clip))
-		return;
-
 	dst_clip = plane_state->dst;
-	if (!drm_rect_intersect(&dst_clip, &src_clip))
-		return;
-
 	if (!drm_dev_enter(drm, &idx))
 		return;
 
-	ssd130x_fb_blit_rect(plane_state->fb, &shadow_plane_state->data[0], &dst_clip);
+	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
+	drm_atomic_for_each_plane_damage(&iter, &damage) {
+		if (!drm_rect_intersect(&dst_clip, &damage))
+			continue;
+
+		ssd130x_fb_blit_rect(plane_state->fb, &shadow_plane_state->data[0], &damage);
+	}
 
 	drm_dev_exit(idx);
 }
-- 
2.37.3

