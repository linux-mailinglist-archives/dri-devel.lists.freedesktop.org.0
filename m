Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 320C144697E
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 21:15:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9C596EA93;
	Fri,  5 Nov 2021 20:15:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 663C86EA93;
 Fri,  5 Nov 2021 20:15:16 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id q126so5302093pgq.13;
 Fri, 05 Nov 2021 13:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zo3rIYzOc3Xp6uAoP9Fv9lWIdKoPMXjS9MDpfKN91kc=;
 b=klECCijoYSjHh8+WqxV6Oh8UxAVsnZAibpB7wTOGvJyESIMyQwCqEh0C5yr/+HdBHC
 YkgDZPXUahVY4YaW1m52xzBy8qVc6qY4oZWNZnyHKrCyz1RljemRFcRlcVIW65q96SR9
 DtTFTor28us1UC5dlZlkhvgRyPmEdOwzTq5GI9NmADK4NUq4WDMx8/t1wScgH1dIidMB
 sAJFyI3XSwIW1KK3dFPHHSxmTvsaoK3rUcsICi8vUF4rWpnCxMc9Vx6D1BkvjRnqH/II
 6iyEVoDHrV2oje9YD1fVoNq0UA6E9OhhWa10sScxnjO4qqSX4qN0g54o8U0dvrBD7YOd
 5pyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zo3rIYzOc3Xp6uAoP9Fv9lWIdKoPMXjS9MDpfKN91kc=;
 b=6lGfqlYEsvmcyMrEsVwsnWEd+2rYkpQRXTcT/DLxbscbL8nEbx+3BWtg0aWnc7wdna
 irR0n8O1udix714vLqwYMWQDzbe1z9PhurlKRA6WMYnqhyVIaBVzWjJxWeUd5T6agICM
 DvsJ8UQNhLxaSyzNGPMo0HI7HyKucJQL7WBOtV9vHOkaVIOc5yEM1axutDISRa50DW4X
 D6T/HnysdakfN1k3/kmVmPlz6O3m1FmWHDzYQpNPs7k/0BBcw17Wmx77pG9f5ZXpWf+Y
 O9opzLZS95dJat6OYc/60Lms0dk+SXp+ip+AbCpSpZl+nNpRJTkXXPK5AgmgKXwGEHmt
 fCiw==
X-Gm-Message-State: AOAM531kJCbxHf55Rr2EF4jTXeH+0PznE55nDkPGwYMbSel6rqbnW1yU
 HVGY7UshhMgV0njYRrg7/GGEsYvfwow=
X-Google-Smtp-Source: ABdhPJwQJc0KBqMQuvF6EwTcAijRJhFdSAz+a471WITh171BrTeKd88KLrx6xsQhLWxBU9iSuk/AVA==
X-Received: by 2002:a05:6a00:14ce:b0:492:69bd:3906 with SMTP id
 w14-20020a056a0014ce00b0049269bd3906mr20222723pfu.18.1636143315150; 
 Fri, 05 Nov 2021 13:15:15 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 b130sm8131340pfb.9.2021.11.05.13.15.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Nov 2021 13:15:13 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/msm/devfreq: Fix OPP refcnt leak
Date: Fri,  5 Nov 2021 13:20:21 -0700
Message-Id: <20211105202021.181092-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 Steev Klimaszewski <steev@kali.org>, open list <linux-kernel@vger.kernel.org>,
 Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Reported-by: Douglas Anderson <dianders@chromium.org>
Fixes: 9bc95570175a ("drm/msm: Devfreq tuning")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
index d32b729b4616..07f1169df89b 100644
--- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
+++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
@@ -20,6 +20,10 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
 	struct msm_gpu *gpu = dev_to_gpu(dev);
 	struct dev_pm_opp *opp;
 
+	/*
+	 * Note that devfreq_recommended_opp() can modify the freq
+	 * to something that actually is in the opp table:
+	 */
 	opp = devfreq_recommended_opp(dev, freq, flags);
 
 	/*
@@ -28,6 +32,7 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
 	 */
 	if (gpu->devfreq.idle_freq) {
 		gpu->devfreq.idle_freq = *freq;
+		dev_pm_opp_put(opp);
 		return 0;
 	}
 
-- 
2.31.1

