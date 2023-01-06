Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A106D65F93D
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 02:40:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D7BC10E81C;
	Fri,  6 Jan 2023 01:40:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9860310E81C
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 01:40:27 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id q64so103372pjq.4
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jan 2023 17:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Vd1mAgVVTT449fHfx2SSArigVZjhQAUUxQLxBkWmUZY=;
 b=DPHGui8QRmvaHU3DjCknrlpCldx/5v2OWyAyXICYBob9XLXk8DRWNug04ad+L+D6QF
 yQtKJe2REavJ/0MCusreMlT5MSx/4G0eq24SxO0ufeBTun+1XdP7BTN6KqtS2fV34YPD
 cvqScEg2/NatNc3sAr34tTgsDmpFnKUJ2dcqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Vd1mAgVVTT449fHfx2SSArigVZjhQAUUxQLxBkWmUZY=;
 b=fLXs6+f5QuPHqszhvvBS4CKj9bkxumK7nQQAKc9HUPKPKHm2AD5b6MosUaq0CZ0WRU
 ZITquyWLdw+RAFQXQ8+J4B1MIPOl0oWcX9WS0V9mVEIlTnlfyA2rpUZz4IqbdLZkYcbk
 cesPFx7qWE3z0hK/2sN3o+PIgk4vxKwuoaGS3q58nb0UU/Ur8dawFRxGwY0DzB2JalZR
 nGL5Nw4vAi0Lv9Iimq29hQNyUxU4xGzDQJ/SaT3y/QkNEdH9SGYPKK4RIrrJiGCx5IkM
 hwuxQk4hbT/l/ZYhMcBAp2qp6iwuoS4h/Mxk/D+ILd0nj/uGRA5iDQkz2KTe0JDuianB
 LS6Q==
X-Gm-Message-State: AFqh2kpH9NlzEeQAPycR+sEHSqslqu8OYN9HiDeNrxjKMpDz33xA7l1p
 Ai9Tl3nR5qkeKUL7tBVNLYaSfQ==
X-Google-Smtp-Source: AMrXdXuA+H0C6hhXoQgKWSW+0hWutAD/Rw5+F2uGIQXQ1RV5rw8QgVaH85iAhFDqCwDsueI7WxmVcw==
X-Received: by 2002:a05:6a20:429f:b0:ad:bd55:6dcf with SMTP id
 o31-20020a056a20429f00b000adbd556dcfmr79280084pzj.28.1672969227205; 
 Thu, 05 Jan 2023 17:40:27 -0800 (PST)
Received: from localhost ([2620:15c:9d:2:5567:fb20:aa4f:352])
 by smtp.gmail.com with UTF8SMTPSA id
 i1-20020a6551c1000000b00478f87eaa44sm22461638pgq.35.2023.01.05.17.40.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 17:40:26 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Sean Paul <seanpaul@chromium.org>
Subject: [PATCH 1/2] drm/atomic: Allow vblank-enabled + self-refresh "disable"
Date: Thu,  5 Jan 2023 17:40:17 -0800
Message-Id: <20230105174001.1.I3904f697863649eb1be540ecca147a66e42bfad7@changeid>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
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
Cc: =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Brian Norris <briannorris@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sandy Huang <hjc@rock-chips.com>,
 linux-rockchip@lists.infradead.org, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The self-refresh helper framework overloads "disable" to sometimes mean
"go into self-refresh mode," and this mode activates automatically
(e.g., after some period of unchanging display output). In such cases,
the display pipe is still considered "on", and user-space is not aware
that we went into self-refresh mode. Thus, users may expect that
vblank-related features (such as DRM_IOCTL_WAIT_VBLANK) still work
properly.

However, we trigger the WARN_ONCE() here if a CRTC driver tries to leave
vblank enabled here.

Add a new exception, such that we allow CRTCs to be "disabled" (with
self-refresh active) with vblank interrupts still enabled.

Cc: <stable@vger.kernel.org> # dependency for subsequent patch
Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 drivers/gpu/drm/drm_atomic_helper.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index d579fd8f7cb8..7b5eddadebd5 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1207,6 +1207,12 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
 
 		if (!drm_dev_has_vblank(dev))
 			continue;
+		/*
+		 * Self-refresh is not a true "disable"; let vblank remain
+		 * enabled.
+		 */
+		if (new_crtc_state->self_refresh_active)
+			continue;
 
 		ret = drm_crtc_vblank_get(crtc);
 		WARN_ONCE(ret != -EINVAL, "driver forgot to call drm_crtc_vblank_off()\n");
-- 
2.39.0.314.g84b9a713c41-goog

