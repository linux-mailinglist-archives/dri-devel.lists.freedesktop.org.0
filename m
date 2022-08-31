Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 656FB5A7C05
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 13:13:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E34C10E31A;
	Wed, 31 Aug 2022 11:13:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 327E810E31A
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Aug 2022 11:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661944375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=USB8h2BMQ0I24TO04KeG3lsFoMe632Y1I1xHU109ulU=;
 b=BiDjlsIqjwLYqcDX4GlR7zocK2oI0qpiiqbGOWlNASzG+86T9Nw1tSVhMf2QAGDuYd6EDg
 wp/s1QL3JbpFBA3Hj9SwdyLvHzNXmcBTMBY3oJX43n2+F9GE0zDBF6qjVLcdJhzz69pqqd
 Hz3qn9MS97dUGxncBu7JYuxK5dytPt0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-402-I4Cjn2-gOOWT9JOFgG4hpw-1; Wed, 31 Aug 2022 07:12:54 -0400
X-MC-Unique: I4Cjn2-gOOWT9JOFgG4hpw-1
Received: by mail-wr1-f69.google.com with SMTP id
 x3-20020adfbb43000000b002258c0751c2so2292141wrg.16
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Aug 2022 04:12:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=USB8h2BMQ0I24TO04KeG3lsFoMe632Y1I1xHU109ulU=;
 b=Th39wY9Bb9DVwcyvd3QLGUMJU8nN27hVrQhqQGu5jxcvzauDluak1fL/xJVB/GGyed
 3lB2USrFBIwcvWt7rXzi2sEnJWZ7GJXMJSjMYEyqn3S6R0iomG4QX30iolfFiArDPnzZ
 D8TRJzkUv9Pggra9k/wyIVEQ5kUtafgRsZbBrvjMGdzXDCEbpcZ2samSkSg4+UUboGsT
 LRAhgjPdrDI9YHZQC198c0h3pzPWQMbNhFi9H/2nKiXB6Yg5frcb0gkDee8mr57oIDeW
 VK3UEcULRi6SlBgkirs3WNkCXgcHpnOcbHiA65cK/LitP8qFhPcKwvsFKfzfkBbcPgnb
 xX7w==
X-Gm-Message-State: ACgBeo0UX1zF+LowDfOrdfhkhHhqWjLXqjzO6Mwij2Zi94zZMdkRt9su
 w5GTHNM3qPmmlPEeO+uAPZD0qqx8n+52W2DeGnqLbLoUpONfw1kl7Gc9OA1DZTwPB4ELLyXUjLE
 Ka6e1PP83i3ZEKcwdUOGuwDGw+h4h
X-Received: by 2002:a05:6000:1e18:b0:226:e095:a98c with SMTP id
 bj24-20020a0560001e1800b00226e095a98cmr5123163wrb.235.1661944372398; 
 Wed, 31 Aug 2022 04:12:52 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7MLzM43BMadh9MDmVHhKCnDr9/uiKXZwJnIT9SD0vG1W6oIuYqjfK3qOR+cK45WBdZ15aCwg==
X-Received: by 2002:a05:6000:1e18:b0:226:e095:a98c with SMTP id
 bj24-20020a0560001e1800b00226e095a98cmr5123155wrb.235.1661944372208; 
 Wed, 31 Aug 2022 04:12:52 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 ay19-20020a05600c1e1300b003a682354f63sm2054876wmb.11.2022.08.31.04.12.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 04:12:51 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/simpledrm: Drop superfluous primary plane .atomic_check
 return logic
Date: Wed, 31 Aug 2022 13:12:43 +0200
Message-Id: <20220831111243.1530620-1-javierm@redhat.com>
X-Mailer: git-send-email 2.37.1
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
Cc: David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The simpledrm_primary_plane_helper_atomic_check() function is more complex
than needed. It first checks drm_atomic_helper_check_plane_state() returns
value to decide whether to return this or zero.

But it could just return that function return value directly. It also does
a check if new_plane_state->visible isn't set, but returns zero regardless.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/tiny/simpledrm.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index a81f91814595..0be47f40247a 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -485,21 +485,14 @@ static int simpledrm_primary_plane_helper_atomic_check(struct drm_plane *plane,
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(new_state, plane);
 	struct drm_crtc *new_crtc = new_plane_state->crtc;
 	struct drm_crtc_state *new_crtc_state = NULL;
-	int ret;
 
 	if (new_crtc)
 		new_crtc_state = drm_atomic_get_new_crtc_state(new_state, new_crtc);
 
-	ret = drm_atomic_helper_check_plane_state(new_plane_state, new_crtc_state,
-						  DRM_PLANE_NO_SCALING,
-						  DRM_PLANE_NO_SCALING,
-						  false, false);
-	if (ret)
-		return ret;
-	else if (!new_plane_state->visible)
-		return 0;
-
-	return 0;
+	return drm_atomic_helper_check_plane_state(new_plane_state, new_crtc_state,
+						   DRM_PLANE_NO_SCALING,
+						   DRM_PLANE_NO_SCALING,
+						   false, false);
 }
 
 static void simpledrm_primary_plane_helper_atomic_update(struct drm_plane *plane,
-- 
2.37.1

