Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5AD6636A0
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 02:19:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 285DA10E0E7;
	Tue, 10 Jan 2023 01:19:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1EF010E0EC
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 01:19:15 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 o7-20020a17090a0a0700b00226c9b82c3aso11697207pjo.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 17:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XYUtIGSdiXv+1u4fwXxMmXFQoGZCC8A3hPLYtYLpNZQ=;
 b=Bmk2SAk4VLW306BHVtiboysQjz5H/DFJf0Tjh0hvrntMIxLtck9ATcuiUFhmj7LHNL
 B2lYETyD1f5zrcSLwCFTSAlf7/2XYNt9xuJqUxURQT7gjmsPAV0cEbg1BsWx9KUl86lc
 IzdBVOADWqnelw8o3fWnEGPECU4Vf3WBPVXls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XYUtIGSdiXv+1u4fwXxMmXFQoGZCC8A3hPLYtYLpNZQ=;
 b=O2mRldKVKEztjEQKITlXD/k504mNOiYTkrktgSzG6xIjQ3rR/dKrmfpAH3kc/KMXei
 x/YsnxIxeqFw6nP0vx7W4GNNEjPoP8NLGWb5NVZ33Wag+C4qoJYPVJvJQJYpohuRrzTV
 rVZ5I1YoRSldKS0mjwVgCEFu3TYv9uhHEu2mePhtWq46oONlI105BrX2CRP/OP1PC6p9
 8yBnOJTVf5MYV/k+Bb4QB02Fcv8hsIQdN8lcIn69Yzwt5VJzHy2uVegAZWKgBqZf8WDd
 KZWnHWParyub3IvHMEeLal+c35eAaFgl8uSsdIvTTSnJ5JgYSjr3nHLP69bBGeG9hMe6
 SFGQ==
X-Gm-Message-State: AFqh2kpGp0pNNWK9qdf3+BH+AQJuAWR4xO/YowIOLCCaltxiL3PUegxc
 +Rr7vVsirIk+ysslapOKtxhCBA==
X-Google-Smtp-Source: AMrXdXtC5EUTKJLeK/jZ2SnSPdj4TAQrYDbyicW7TAjCMQdn4sHpMINHMClNMz/+JBeoOEMkxs7HIw==
X-Received: by 2002:a05:6a21:999d:b0:9e:9685:f15e with SMTP id
 ve29-20020a056a21999d00b0009e9685f15emr100766242pzb.0.1673313555362; 
 Mon, 09 Jan 2023 17:19:15 -0800 (PST)
Received: from localhost ([2620:15c:9d:2:99d8:feca:9efd:a216])
 by smtp.gmail.com with UTF8SMTPSA id
 j1-20020a170902c3c100b0018853416bbcsm6827097plj.7.2023.01.09.17.19.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 17:19:14 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <seanpaul@chromium.org>
Subject: [PATCH v3 2/2] drm/rockchip: vop: Leave vblank enabled in self-refresh
Date: Mon,  9 Jan 2023 17:18:17 -0800
Message-Id: <20230109171809.v3.2.Ic07cba4ab9a7bd3618a9e4258b8f92ea7d10ae5a@changeid>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
In-Reply-To: <20230109171809.v3.1.I3904f697863649eb1be540ecca147a66e42bfad7@changeid>
References: <20230109171809.v3.1.I3904f697863649eb1be540ecca147a66e42bfad7@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: "kernelci.org bot" <bot@kernelci.org>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Brian Norris <briannorris@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sandy Huang <hjc@rock-chips.com>,
 linux-rockchip@lists.infradead.org, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If we disable vblank when entering self-refresh, vblank APIs (like
DRM_IOCTL_WAIT_VBLANK) no longer work. But user space is not aware when
we enter self-refresh, so this appears to be an API violation -- that
DRM_IOCTL_WAIT_VBLANK fails with EINVAL whenever the display is idle and
enters self-refresh.

The downstream driver used by many of these systems never used to
disable vblank for PSR, and in fact, even upstream, we didn't do that
until radically redesigning the state machine in commit 6c836d965bad
("drm/rockchip: Use the helpers for PSR").

Thus, it seems like a reasonable API fix to simply restore that
behavior, and leave vblank enabled.

Note that this appears to potentially unbalance the
drm_crtc_vblank_{off,on}() calls in some cases, but:
(a) drm_crtc_vblank_on() documents this as OK and
(b) if I do the naive balancing, I find state machine issues such that
    we're not in sync properly; so it's easier to take advantage of (a).

This issue was exposed by IGT's kms_vblank tests, and reported by
KernelCI. The bug has been around a while (longer than KernelCI
noticed), but was only exposed once self-refresh was bugfixed more
recently, and so KernelCI could properly test it. Some other notes in:

  https://lore.kernel.org/dri-devel/Y6OCg9BPnJvimQLT@google.com/
  Re: renesas/master bisection: igt-kms-rockchip.kms_vblank.pipe-A-wait-forked on rk3399-gru-kevin

== Backporting notes: ==

Marking as 'Fixes' commit 6c836d965bad ("drm/rockchip: Use the helpers
for PSR"), but it probably depends on commit bed030a49f3e
("drm/rockchip: Don't fully disable vop on self refresh") as well.

We also need the previous patch ("drm/atomic: Allow vblank-enabled +
self-refresh "disable""), of course.

v3:
 * no update

v2:
 * skip unnecessary lock/unlock

Fixes: 6c836d965bad ("drm/rockchip: Use the helpers for PSR")
Cc: <stable@vger.kernel.org>
Link: https://lore.kernel.org/dri-devel/Y5itf0+yNIQa6fU4@sirena.org.uk/
Reported-by: "kernelci.org bot" <bot@kernelci.org>
Signed-off-by: Brian Norris <briannorris@chromium.org>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index fa1f4ee6d195..9fea03121247 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -717,13 +717,13 @@ static void vop_crtc_atomic_disable(struct drm_crtc *crtc,
 	if (crtc->state->self_refresh_active)
 		rockchip_drm_set_win_enabled(crtc, false);
 
+	if (crtc->state->self_refresh_active)
+		goto out;
+
 	mutex_lock(&vop->vop_lock);
 
 	drm_crtc_vblank_off(crtc);
 
-	if (crtc->state->self_refresh_active)
-		goto out;
-
 	/*
 	 * Vop standby will take effect at end of current frame,
 	 * if dsp hold valid irq happen, it means standby complete.
@@ -757,9 +757,9 @@ static void vop_crtc_atomic_disable(struct drm_crtc *crtc,
 	vop_core_clks_disable(vop);
 	pm_runtime_put(vop->dev);
 
-out:
 	mutex_unlock(&vop->vop_lock);
 
+out:
 	if (crtc->state->event && !crtc->state->active) {
 		spin_lock_irq(&crtc->dev->event_lock);
 		drm_crtc_send_vblank_event(crtc, crtc->state->event);
-- 
2.39.0.314.g84b9a713c41-goog

