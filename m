Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEDBC69A13
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 14:39:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A16A10E4B0;
	Tue, 18 Nov 2025 13:39:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ikqO0xlZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F4DB10E4B0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 13:39:20 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-37b8aa5adf9so48053921fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 05:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763473158; x=1764077958; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FaTe+b1ye5h/AwfFGLANzjH/J5A7rL3yeYNV/rVxI2I=;
 b=ikqO0xlZECUMlMI97YxYahUfCXx+IzgJG2Qp8XkXbUVuyYXRWUdjqHxgdqEIXHf91S
 rAatnHa4bp+gZ8e2SXlnAHtEkmJpbyA/HrVV1j2D/L/HCfp2i+PqMo/7aoQIhuM40Ag+
 RFxZGkUvYvIwwLAyhGBZ+LT5h7nDuOJ/eJj6Hi/WRZKl+NQQuxPUYw0uFFBnlb4aWVXh
 sBb+/UV58V6jR6F21ky27JSYswCLwf39ITeILR5svXrqgDHFS0UJUnQNbnAAYoZnxLCf
 c+I28xaA0P5ak9cxKp+R8yLUSuk+guqqQ+rad9xRc6KWf9n3fRwb6kYzZZaip/v4zNV/
 ZTZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763473158; x=1764077958;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FaTe+b1ye5h/AwfFGLANzjH/J5A7rL3yeYNV/rVxI2I=;
 b=LQLEKYNKSN7GibigZtkos55Rr2VafzKMVBRHzNa1QFip9dNb9VSAvxMZvF5eMgKBCX
 Wm3QhKnt+7ZVYq9I6NrqJv/XjuK4KFoPSBZzP//aIJ0NKpaZ2gVmJpLOf42qSTF1wLJT
 y8WxiYaI0zu5jRNUfjcTgpMAE4U6Eu0qKlQAIC8tZLMMm6bMUs2olF78Vf0I5U9Z67tV
 4UFwMidawZHceZp0XPN7bDXP3u1uyzg7SOM+vKMgN9raqSvAMJ3GXF+ocSJOxd6zCOGz
 U6YyISYJC5e5z82O+gFkGK9AmnSTIYd3DAi3JfxJ1Wx9GvxMiQn/TIm60zG2BgkIi3Cn
 QNLw==
X-Gm-Message-State: AOJu0Yy9gCBg3izG7p+q5totDqaveShHdCcazh87RtN/NaqlSBqAr85W
 Q2SkrzYesfwALbyqhMIgoJMS/HgaX5uuFOYwvxYUO9uFSSghklKQym7Q80bc2iZTipSa71Hb9wj
 esWgi8+DNDQ==
X-Gm-Gg: ASbGncvjMYW9YMouZTxyxZQ0MN+BLZKGcMiCjCUD2WGjZEPH8QYYigA/AjXp7mWlAHo
 kh8H7PA5U1c3/bJqE4cKLi/ntf/rlBwJ+/ja2Zaslyv2qoDD6qFq2k9DHCzFsC2v/23AWf60LkB
 QMSqFLVfZqjSnUm57wUYm9llz2OveskvRe1Z3K/yvNS/rcLemzStxmwJEs8FlVO5vI8d8vW+ox9
 bP6rWusM37U+iI76qpUDzQiYZQ8IqdAgQ0qt6hOckm6lTYAFMrek4SSQ7sxvxSzh920ou55X8f4
 TihvU5w2ydc/5shwJ6u+OI2bhkPDc+MGm5DtuOJWrTk+Q/qjLXLbTEvJcxCTpOKRzLggl0UvRkd
 IKhtbWLvInWeDESUIFjAf5CEKxlDYNDuWEmREafQCZ7IWAgeQv6oyj3Gx1Hxa/VImneUbDtNT3P
 oHtdh72U3vY0qRlhQ5Q1h5gf/9T7csxLPb3cBisEA9QBAULMM/SFG8siQ=
X-Google-Smtp-Source: AGHT+IFaM18nTVu333bbUCq7VxC1brsVvz9U5JSgeOsz389jmfv/SgEaP5v2AVDm854VlQ/Cs6q0xw==
X-Received: by 2002:a05:6512:1250:b0:594:54ec:92e7 with SMTP id
 2adb3069b0e04-595842523bfmr5002142e87.28.1763473157864; 
 Tue, 18 Nov 2025 05:39:17 -0800 (PST)
Received: from [192.168.1.2] (c-92-34-217-190.bbcust.telenor.se.
 [92.34.217.190]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5958040c55fsm3963391e87.98.2025.11.18.05.39.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 05:39:14 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 Nov 2025 14:39:12 +0100
Subject: [PATCH] drm: atomic helper: Add special quirk tail function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-mcde-drm-regression-v1-1-ed5583efbd68@linaro.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MzQ5AMBAGX0X2bBPVoLyKOKAf9uAn20Qk4t2V4
 yQzc1OACgI1yU2KU4LsWwSTJjQu/TaDxUemPMsLY4zjdfRgrysrZkX4fLbWY6hcX5duolgeikm
 u/9p2z/MC4g+P4WUAAAA=
X-Change-ID: 20251118-mcde-drm-regression-33deb78a968f
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Aradhya Bhatia <a-bhatia1@ti.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.3
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

This adds (yet another) variant of the
drm_atomic_helper_commit_tail() helper function to deal
with regressions caused by reordering the bridge
prepare/enablement sequence.

commit c9b1150a68d9362a0827609fc0dc1664c0d8bfe1
"drm/atomic-helper: Re-order bridge chain pre-enable and post-disable"
caused a series of regressions in all panels that send
DSI commands in their .prepare() and .unprepare()
callbacks.

As the CRTC is no longer online at bridge_pre_enable()
and gone at brige_post_disable() which maps to the panel
bridge .prepare()/.unprepare() callbacks, any CRTC that
enable/disable the DSI transmitter in it's enable/disable
callbacks will be unable to send any DSI commands in the
.prepare() and .unprepare() callbacks.

However the MCDE driver definitely need the CRTC to be
enabled during .prepare()/.unprepare().

This patch from Marek Vasut:
https://lore.kernel.org/all/20251107230517.471894-1-marek.vasut%2Brenesas%40mailbox.org/
solves part of the problem for drivers using custom
tail functions, since MCDE is using helpers only, we
add a new helper function that exploits the new
drm_atomic_helper_commit_modeset_enables_crtc_early()
and use that in MCDE.

Link: https://lore.kernel.org/dri-devel/20251026-fix-mcde-drm-regression-v2-0-8d799e488cf9@linaro.org/
Link: https://lore.kernel.org/all/20251107230517.471894-1-marek.vasut%2Brenesas%40mailbox.org/
Fixes: c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable and post-disable")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
This obviously needs Marek's patch to be applied first, as
it is a prerequisite.
---
 drivers/gpu/drm/drm_atomic_helper.c | 32 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/mcde/mcde_drv.c     |  5 +++--
 include/drm/drm_atomic_helper.h     |  1 +
 3 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index f03b93c72b8f..fe30159d13b1 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1976,6 +1976,38 @@ void drm_atomic_helper_commit_tail_rpm(struct drm_atomic_state *state)
 }
 EXPORT_SYMBOL(drm_atomic_helper_commit_tail_rpm);
 
+/**
+ * drm_atomic_helper_commit_tail_early - commit atomic update to hardware
+ * @state: new modeset state to be committed
+ *
+ * This is an alternative implementation for the
+ * &drm_mode_config_helper_funcs.atomic_commit_tail hook, for drivers
+ * that support runtime_pm or need the CRTC to be enabled to perform a
+ * commit, and also need the CRTC to be enabled before preparing any
+ * bridhes. Otherwise, one should use the default implementation
+ * drm_atomic_helper_commit_tail().
+ */
+void drm_atomic_helper_commit_tail_early(struct drm_atomic_state *state)
+{
+	struct drm_device *dev = state->dev;
+
+	drm_atomic_helper_commit_modeset_disables(dev, state);
+
+	drm_atomic_helper_commit_modeset_enables_crtc_early(dev, state);
+
+	drm_atomic_helper_commit_planes(dev, state,
+					DRM_PLANE_COMMIT_ACTIVE_ONLY);
+
+	drm_atomic_helper_fake_vblank(state);
+
+	drm_atomic_helper_commit_hw_done(state);
+
+	drm_atomic_helper_wait_for_vblanks(dev, state);
+
+	drm_atomic_helper_cleanup_planes(dev, state);
+}
+EXPORT_SYMBOL(drm_atomic_helper_commit_tail_early);
+
 static void commit_tail(struct drm_atomic_state *state)
 {
 	struct drm_device *dev = state->dev;
diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_drv.c
index 5f2c462bad7e..4d88b342ed9e 100644
--- a/drivers/gpu/drm/mcde/mcde_drv.c
+++ b/drivers/gpu/drm/mcde/mcde_drv.c
@@ -104,9 +104,10 @@ static const struct drm_mode_config_helper_funcs mcde_mode_config_helpers = {
 	/*
 	 * Using this function is necessary to commit atomic updates
 	 * that need the CRTC to be enabled before a commit, as is
-	 * the case with e.g. DSI displays.
+	 * the case with e.g. DSI displays, and also make sure that the
+	 * CRTC is enabled before any bridges are prepared.
 	 */
-	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
+	.atomic_commit_tail = drm_atomic_helper_commit_tail_early,
 };
 
 static irqreturn_t mcde_irq(int irq, void *data)
diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
index d7fb473db343..75e480760313 100644
--- a/include/drm/drm_atomic_helper.h
+++ b/include/drm/drm_atomic_helper.h
@@ -64,6 +64,7 @@ int drm_atomic_helper_check(struct drm_device *dev,
 			    struct drm_atomic_state *state);
 void drm_atomic_helper_commit_tail(struct drm_atomic_state *state);
 void drm_atomic_helper_commit_tail_rpm(struct drm_atomic_state *state);
+void drm_atomic_helper_commit_tail_early(struct drm_atomic_state *state);
 int drm_atomic_helper_commit(struct drm_device *dev,
 			     struct drm_atomic_state *state,
 			     bool nonblock);

---
base-commit: 643e6ae9e34fc3a87c7953b6929265e93b9c38e1
change-id: 20251118-mcde-drm-regression-33deb78a968f

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

