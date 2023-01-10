Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC9A66369E
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 02:19:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7AC610E044;
	Tue, 10 Jan 2023 01:19:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6146710E044
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 01:19:13 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 w4-20020a17090ac98400b002186f5d7a4cso14787552pjt.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 17:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JRJYNk03xPF7I0f3RiiUNSrwj7K0SCkYwCDphRZWj3c=;
 b=LYUy8d956TFa4i0X/jINb9cLqY6o2DO8RoacHNTbbqpl8LHI2/Qg246QCSQgHVA+nH
 HJSdqiBTvghIgiNFKN+RnWDfVLcTTn1WiBk2hYjjliNu1Hb2C6+1JXHTA8Yqa0uUud+P
 UdwMdphpyLdOm8qn7t1kn+/887P41sckwQAH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JRJYNk03xPF7I0f3RiiUNSrwj7K0SCkYwCDphRZWj3c=;
 b=FjFEskKnM28nPeQ/fZOf4u5Bi46Hy6vKGgMZf0UUzzVMyX/zJCnxXtIDrFKoT4IUtk
 InvAaFvizznvOT9xyQbq9jpdcMXZA69HtwqjRfUT7Y/5IJudMlaDWMB4GQTVH1nukbDh
 yiwEHrU2lyv2XlKBT1gbN+2FeBNXPXBpwvB1zW7//qbO7sh6LKvpFN/c+mBomIEnArAM
 akf29yPRPatVsKFVIxjUz2Sci+jzllryoU5q6JxsEgGcCvdms2EHWChu5x04pV8hU1OT
 A+q0iWUxvjoOvdI5geA9Cmy7wLQU5Bn6DgaqZIPGdSu1Kblvtpf7Y4sZovSmLe4hjtmV
 WdzA==
X-Gm-Message-State: AFqh2kp2a1FHEndNA+Yo+dHN3cAgu4trdHXstfgEG4WrAMnIPuwywsAm
 A4aOgpN1NeryimXXHvbCNoe+dg==
X-Google-Smtp-Source: AMrXdXt7E/WtGBXtZLOsFB0eXRM7CAxST+jXno99j/6BC6C7198kPAZn7z/EVahK9YCxBH+9/0JnBQ==
X-Received: by 2002:a17:902:e951:b0:193:2ed4:561a with SMTP id
 b17-20020a170902e95100b001932ed4561amr5989384pll.38.1673313552926; 
 Mon, 09 Jan 2023 17:19:12 -0800 (PST)
Received: from localhost ([2620:15c:9d:2:99d8:feca:9efd:a216])
 by smtp.gmail.com with UTF8SMTPSA id
 u1-20020a170902714100b001933355456esm17519plm.215.2023.01.09.17.19.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 17:19:12 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <seanpaul@chromium.org>
Subject: [PATCH v3 1/2] drm/atomic: Allow vblank-enabled + self-refresh
 "disable"
Date: Mon,  9 Jan 2023 17:18:16 -0800
Message-Id: <20230109171809.v3.1.I3904f697863649eb1be540ecca147a66e42bfad7@changeid>
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
vblank enabled.

Add a different expectation: that CRTCs *should* leave vblank enabled
when going into self-refresh.

This patch is preparation for another patch -- "drm/rockchip: vop: Leave
vblank enabled in self-refresh" -- which resolves conflicts between the
above self-refresh behavior and the API tests in IGT's kms_vblank test
module.

== Some alternatives discussed: ==

It's likely that on many display controllers, vblank interrupts will
turn off when the CRTC is disabled, and so in some cases, self-refresh
may not support vblank. To support such cases, we might consider
additions to the generic helpers such that we fire vblank events based
on a timer.

However, there is currently only one driver using the common
self-refresh helpers (i.e., rockchip), and at least as of commit
bed030a49f3e ("drm/rockchip: Don't fully disable vop on self refresh"),
the CRTC hardware is powered enough to continue to generate vblank
interrupts.

So we chose the simpler option of leaving vblank interrupts enabled. We
can reevaluate this decision and perhaps augment the helpers if/when we
gain a second driver that has different requirements.

v3:
 * include discussion summary

v2:
 * add 'ret != 0' warning case for self-refresh
 * describe failing test case and relation to drm/rockchip patch better

Cc: <stable@vger.kernel.org> # dependency for "drm/rockchip: vop: Leave
                             # vblank enabled in self-refresh"
Signed-off-by: Brian Norris <briannorris@chromium.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index d579fd8f7cb8..a22485e3e924 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1209,7 +1209,16 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
 			continue;
 
 		ret = drm_crtc_vblank_get(crtc);
-		WARN_ONCE(ret != -EINVAL, "driver forgot to call drm_crtc_vblank_off()\n");
+		/*
+		 * Self-refresh is not a true "disable"; ensure vblank remains
+		 * enabled.
+		 */
+		if (new_crtc_state->self_refresh_active)
+			WARN_ONCE(ret != 0,
+				  "driver disabled vblank in self-refresh\n");
+		else
+			WARN_ONCE(ret != -EINVAL,
+				  "driver forgot to call drm_crtc_vblank_off()\n");
 		if (ret == 0)
 			drm_crtc_vblank_put(crtc);
 	}
-- 
2.39.0.314.g84b9a713c41-goog

