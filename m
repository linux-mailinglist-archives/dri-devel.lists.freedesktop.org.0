Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A9C510A54
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 22:21:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C37E410E4F0;
	Tue, 26 Apr 2022 20:21:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77B9F10E4F0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 20:21:50 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id p6so3363488plf.9
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 13:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2PC82LstV6tocxMGUgC+f9s/KheVTFFbt3d61yAZ2go=;
 b=kTSO+u0oPyCgqiOMOit0gAUCMZRNZxANk+X/wb8YJ7K82r0PKU60PVtTM8yJOlTVI2
 tQA12jy2wCF8duMMzy++AdPcptLc7XN5vhaE+zINVCTQzuObUq8Wn6KcAXnaYuxvXlUF
 F9idAg4n+2jPJzP/RL1PE2pxV3+gzUC68C5PI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2PC82LstV6tocxMGUgC+f9s/KheVTFFbt3d61yAZ2go=;
 b=sHXsiMQwmqD9A34wyeuR5+MKmSwnSG3x9iHs0BQrIf6Og6T+/2HrgDujzho5jIoG/m
 AxmUDoaE0g/6lLeWYkVuRUp7FU0TODrwh1ygujJgQZVcGwdk6rAm3L8LwFly6/TgF1sP
 Bi0E2n/ul+yO3895WTtWc1tg9RykTkSrvxy/M4Hl8UV/3RHL/dRVPL+3hIH9cnjG6R58
 hGXu1TAw8XUU35uQ7LMfm1NiEsDyhQNqnLYLPLznm2oCeudA9kDmvLBzioYYmiwGe2yG
 0RiFPj6U6DBMpbwexza4IRzODzb3yBFSUJV+/XV/X6TR3RDyKg8NFkMlPMUjnceT536J
 eldw==
X-Gm-Message-State: AOAM5312H8bdhOnaJedQbfsYWUi6A2jrqldM9YXmnrVm93HSA5Ki/tco
 /U4+ewKkxgc6rlmbEaUB5mrCCMge7GO7PBkrhy0Z9g==
X-Google-Smtp-Source: ABdhPJzNq1iE5QQhWz5FHSE6fbIuvdm3ZiwM9Z8WYDwJn0e17SMpLk/f5RFeGQ7Yc2aCs/MGDJFQ/Q==
X-Received: by 2002:a17:902:dac1:b0:15d:356:887c with SMTP id
 q1-20020a170902dac100b0015d0356887cmr14441943plx.78.1651004509863; 
 Tue, 26 Apr 2022 13:21:49 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:8e92:9f42:eda6:c0ee])
 by smtp.gmail.com with ESMTPSA id
 h195-20020a6283cc000000b0050d2c0729b0sm11285215pfe.18.2022.04.26.13.21.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 13:21:49 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH] drm/edid: drm_add_modes_noedid() should set lowest
 resolution as preferred
Date: Tue, 26 Apr 2022 13:21:26 -0700
Message-Id: <20220426132121.RFC.1.I31ec454f8d4ffce51a7708a8092f8a6f9c929092@changeid>
X-Mailer: git-send-email 2.36.0.rc2.479.g8af0fa9b8e-goog
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
Cc: quic_sbillaka@quicinc.com, Douglas Anderson <dianders@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com, swboyd@chromium.org,
 dmitry.baryshkov@linaro.org, quic_aravindh@quicinc.com,
 quic_khsieh@quicinc.com, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If we're unable to read the EDID for a display because it's corrupt /
bogus / invalid then we'll add a set of standard modes for the
display. When userspace looks at these modes it doesn't really have a
good concept for which mode to pick and it'll likely pick the highest
resolution one by default. That's probably not ideal because the modes
were purely guesses on the part of the Linux kernel.

Let's instead set 640x480 as the "preferred" mode when we have no EDID.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/drm_edid.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 7a8482b75071..64ccfff4167e 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5839,6 +5839,15 @@ int drm_add_modes_noedid(struct drm_connector *connector,
 			continue;
 		mode = drm_mode_duplicate(dev, ptr);
 		if (mode) {
+			/*
+			 * The drm_dmt_modes array is sorted so that lower
+			 * resolutions come first. We'll set the lowest
+			 * resolution mode as preferred. We have no EDID so
+			 * we should prefer the lowest resolution mode as
+			 * the safest one.
+			 */
+			if (num_modes == 0)
+				mode->type |= DRM_MODE_TYPE_PREFERRED;
 			drm_mode_probed_add(connector, mode);
 			num_modes++;
 		}
-- 
2.36.0.rc2.479.g8af0fa9b8e-goog

