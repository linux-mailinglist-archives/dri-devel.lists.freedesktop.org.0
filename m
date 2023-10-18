Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 618C87CD5A1
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 09:46:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72A7E10E3B7;
	Wed, 18 Oct 2023 07:46:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74F3910E3B3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 07:46:31 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2c501bd6ff1so76096091fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 00:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697615189; x=1698219989; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mK3SefmpOCRjKq+TTt3SLLU2DTb3sKYmEQQtAXZNfAc=;
 b=DtT2ptu1lHGYbQaYdW2LfmHRrCMh+Br3MEs8FmXUgVRq/uy3UVAw7yH/4z78cWNJI+
 3a80qIXL7T3oaXpYcKroahAWHvA4kUf92qJTHLkiqzkdNA+vTapwHEp/xRDYEvnP+Tqj
 YQZYdPdyBWKNGhCImQUBzZJdpA/yXOhrNORwH758V+K6mqM63YoM3vZ3IMALbD2QT/8d
 NBvSIX0bCE3T1URUebxt1aI/dp0mBe2oExHVy4XUJ1Xkf+Sc83vQ9KvgNWFMQvtZ6pun
 rETPF5FlogDqXSCZBj6pG0JvDw+1a9wPhixX+ncQ1CuH/R6q8tQpX7itP7UpSHobcODh
 1WiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697615189; x=1698219989;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mK3SefmpOCRjKq+TTt3SLLU2DTb3sKYmEQQtAXZNfAc=;
 b=RR7VL+n5yxa9Em2q8T0cAQWWtMTunK2qkr6RIsWaV/i+MBLyFe7zsEKzIVTjg59Ggz
 6jWsP44JgqL0jqQNR/W0eeJX8p/0JXqVMi8HulQdy1PCKeJHKlbOitjANkb4aoIcM5Hr
 h5yNQ4yTb6al+38j5+L1wD2+47eU63gGsp+sY3qotN/VpUGjYNktqVRHBijmGfUAW4Ed
 QJQtgusLdyyalAZe6dZjS2PC9fAuPWQn8pbPUjmVUmOfh2DwaX7gedk0fpYb47LJC4V2
 ZOEgv95dtWPidkkYdJ1YX+VL3I3pHL1BKi0kdaxM+fjMPxVRZjZ8zz8xkl0c+SxPgFJE
 U+/w==
X-Gm-Message-State: AOJu0YzUBrBnmKf4tDIbbyX5taV9+na/5As4hGtY7647rJLd7Y6VdjIA
 EKmWXW+eb4Wq947PpIikCGuYQg==
X-Google-Smtp-Source: AGHT+IFi2RBYSKm7xKyj2+wrqQkWPgen3dgh6wPWuWzx4GmvuK0+6VPXmH/jpPjWwWbLrTIPuN/vSw==
X-Received: by 2002:a05:651c:2117:b0:2c5:32a:cfe8 with SMTP id
 a23-20020a05651c211700b002c5032acfe8mr3842098ljq.44.1697615189597; 
 Wed, 18 Oct 2023 00:46:29 -0700 (PDT)
Received: from eriador.lumag.spb.ru (210.red-80-36-22.staticip.rima-tde.net.
 [80.36.22.210]) by smtp.gmail.com with ESMTPSA id
 j6-20020a05600c074600b00405442edc69sm923015wmn.14.2023.10.18.00.46.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Oct 2023 00:46:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH] drm/msm/dp: attach the DP subconnector property
Date: Wed, 18 Oct 2023 10:46:27 +0300
Message-ID: <20231018074627.55637-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While developing and testing the commit bfcc3d8f94f4 ("drm/msm/dp:
support setting the DP subconnector type") I had the patch [1] in my
tree. I haven't noticed that it was a dependency for the commit in
question. Mea culpa.

Since the patch has not landed yet (and even was not reviewed)
and since one of the bridges erroneously uses USB connector type instead
of DP, attach the property directly from the MSM DP driver.

This fixes the following oops on DP HPD event:

 drm_object_property_set_value (drivers/gpu/drm/drm_mode_object.c:288)
 dp_display_process_hpd_high (drivers/gpu/drm/msm/dp/dp_display.c:402)
 dp_hpd_plug_handle.isra.0 (drivers/gpu/drm/msm/dp/dp_display.c:604)
 hpd_event_thread (drivers/gpu/drm/msm/dp/dp_display.c:1110)
 kthread (kernel/kthread.c:388)
 ret_from_fork (arch/arm64/kernel/entry.S:858)

Fixes: bfcc3d8f94f4 ("drm/msm/dp: support setting the DP subconnector type")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_drm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 40e7344180e3..e3bdd7dd4cdc 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -345,6 +345,9 @@ struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display, struct dr
 	if (IS_ERR(connector))
 		return connector;
 
+	if (!dp_display->is_edp)
+		drm_connector_attach_dp_subconnector_property(connector);
+
 	drm_connector_attach_encoder(connector, encoder);
 
 	return connector;
-- 
2.42.0

