Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B2D11E92C
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 18:26:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB81C6EB6F;
	Fri, 13 Dec 2019 17:26:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3DD66EB66
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 17:26:27 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id g17so290086wro.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 09:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v2QQo2XB7NXwvW9lnZFYF7ZZ3DNShcC4KCT5UdTmJbg=;
 b=IkTuiXLCwMl5X6aSrAX2aAlYlfwvvlp6WhvuBzrSHu5i5Pkjt2f+lE62nHWnM7GTxA
 4RwLuaP8Edc/XfXBIDUQ2J6v6ROM0WE2Aqfb7rqiyKjzlVq/hHBSaqTfgoYbmmE7jnbR
 M6bz0mx19JEEERFXSknFWQzeV5ly+mh9dbg6g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v2QQo2XB7NXwvW9lnZFYF7ZZ3DNShcC4KCT5UdTmJbg=;
 b=O3AqqFEYwdDKCSeHlL5/gpMvK+RM/N2NK64s8cibBcrep0d4sMFfFtyYlvYQoGsL3J
 tOmszzz2gTGWenB78XI8I5YXhKwTElNTNrlFygplwz7FhXyoskQGbSk+J69dS5cUVB1O
 toRccaEOQt2MfYuSUm7knuVzSSCPPgOP4pAWk3qrgOd4yQG90XrXMyJhiCaI34ZXgCEw
 NdGexWLLlDnSFNJaG2puvm2jdYSk/DY70a9RJxsdm74mlkz7AwgibXjsj5E5pAgPSr3I
 ZQWsFGXtwBcg+i+xQPWBGHrk0h71FdjWKuAe3vbrfTB69FRIWwmnVspCRfTzi8YLDmqg
 cmhg==
X-Gm-Message-State: APjAAAXBHuAEO5fTuTavChB5VycnOTHUTNMBqswvhFENs8ip4GU2H7zC
 U9SdjTayNt+z6euAD1UZlzVOamUMoi8=
X-Google-Smtp-Source: APXvYqxbjJsIIrae6ucYxC8SHS+iLhc+EAdv+i5QRVToz5+KDdFk5pSV7I1tisG7+zyWPdF8ERx+SQ==
X-Received: by 2002:a5d:4d4a:: with SMTP id a10mr14211332wru.220.1576257986276; 
 Fri, 13 Dec 2019 09:26:26 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
 by smtp.gmail.com with ESMTPSA id q15sm10689669wrr.11.2019.12.13.09.26.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 09:26:25 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 08/10] drm/virtio: plane_state->fb iff plane_state->crtc
Date: Fri, 13 Dec 2019 18:26:10 +0100
Message-Id: <20191213172612.1514842-8-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191213172612.1514842-1-daniel.vetter@ffwll.ch>
References: <20191213172612.1514842-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Checking both is one too much, so wrap a WARN_ON around it to stope
the copypasta.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: virtualization@lists.linux-foundation.org
---
 drivers/gpu/drm/virtio/virtgpu_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index bc4bc4475a8c..947e65b51555 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -88,7 +88,7 @@ static int virtio_gpu_plane_atomic_check(struct drm_plane *plane,
 	struct drm_crtc_state *crtc_state;
 	int ret;
 
-	if (!state->fb || !state->crtc)
+	if (!state->fb || WARN_ON(!state->crtc))
 		return 0;
 
 	crtc_state = drm_atomic_get_crtc_state(state->state, state->crtc);
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
