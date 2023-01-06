Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BFF65F93E
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 02:40:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5475710E823;
	Fri,  6 Jan 2023 01:40:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D20F510E81C
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 01:40:29 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id k19so84846pfg.11
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jan 2023 17:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c8gCbSML/p6Kr09DdbXaCD2bHHww6ZP3H/AZnf3Fw7g=;
 b=glG7tzqprNLpK21tSwouvhh29Ru3oQMMT++WF/8EdyAe9E16EXDVV2gQ7MgD/YLbfD
 7i5ORFsmWI/15TfC6bE9Zh+BDD8BK7F3Cr25qWSmjIrnEIqHKvXKZPM93FIz7er9IXb9
 P09kmLdjasAmuSD6VJ5W6wIZSgZ1vfi8G3Cak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c8gCbSML/p6Kr09DdbXaCD2bHHww6ZP3H/AZnf3Fw7g=;
 b=r37eoAiQSoGH50m3HHGIUqfMH51PtvgfOL4VtmmnIyIzXHol/BnZpv5wmRkHNhQ8xE
 ua5IfsJKjn+A2ELhJeh9KJ6idh3cAYmBTS0zxKmFN+w7Y5d6GwRW7JAK1M6LBgnbW2mu
 sx9MPoqwfa0MhkNuXsRSWwtf0O7IcFtBacdj+xG/KoUwc3fBMcYUiI85PsyRUasw96XG
 t51cNi3YirxZtguGLlJW16c+J9QEtH0jkY9ti5p9awS0TZsCNpMHvQlY1uLCTrX1gqZq
 vqWxuJMU0wRqSfjQEYypK09rSmU+9Np4bgqS9ZmWCN/AKCY+0SBPnv3ITfsA3mKelPB8
 XA8g==
X-Gm-Message-State: AFqh2krALyMH9OyWV2CLAX3X8ki3HZkpE3kSS+4lApXJPKWhMlSQpQgi
 i4WU/UvHZ3W5CkFRTihu8+B8aQ==
X-Google-Smtp-Source: AMrXdXvC7oDu6YyGV+8jfSbsR7fE2kCUxk5coKNVNbu0UAKMzyqM7NgLBCShEMc/OPWHessmN1xdtQ==
X-Received: by 2002:a62:e510:0:b0:582:5b8d:52be with SMTP id
 n16-20020a62e510000000b005825b8d52bemr19080880pff.8.1672969229354; 
 Thu, 05 Jan 2023 17:40:29 -0800 (PST)
Received: from localhost ([2620:15c:9d:2:5567:fb20:aa4f:352])
 by smtp.gmail.com with UTF8SMTPSA id
 142-20020a621994000000b00575caf80d08sm17868008pfz.31.2023.01.05.17.40.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 17:40:28 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Sean Paul <seanpaul@chromium.org>
Subject: [PATCH 2/2] drm/rockchip: vop: Leave vblank enabled in self-refresh
Date: Thu,  5 Jan 2023 17:40:18 -0800
Message-Id: <20230105174001.2.Ic07cba4ab9a7bd3618a9e4258b8f92ea7d10ae5a@changeid>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
In-Reply-To: <20230105174001.1.I3904f697863649eb1be540ecca147a66e42bfad7@changeid>
References: <20230105174001.1.I3904f697863649eb1be540ecca147a66e42bfad7@changeid>
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

Backporting notes:
Marking as 'Fixes' commit 6c836d965bad ("drm/rockchip: Use the helpers
for PSR"), but it probably depends on commit bed030a49f3e
("drm/rockchip: Don't fully disable vop on self refresh") as well.

We also need the previous patch ("drm/atomic: Allow vblank-enabled +
self-refresh "disable""), of course.

Fixes: 6c836d965bad ("drm/rockchip: Use the helpers for PSR")
Cc: <stable@vger.kernel.org>
Link: https://lore.kernel.org/dri-devel/Y5itf0+yNIQa6fU4@sirena.org.uk/
Reported-by: "kernelci.org bot" <bot@kernelci.org>
Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index fa1f4ee6d195..c541967114b4 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -719,11 +719,11 @@ static void vop_crtc_atomic_disable(struct drm_crtc *crtc,
 
 	mutex_lock(&vop->vop_lock);
 
-	drm_crtc_vblank_off(crtc);
-
 	if (crtc->state->self_refresh_active)
 		goto out;
 
+	drm_crtc_vblank_off(crtc);
+
 	/*
 	 * Vop standby will take effect at end of current frame,
 	 * if dsp hold valid irq happen, it means standby complete.
-- 
2.39.0.314.g84b9a713c41-goog

