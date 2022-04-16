Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE91C50320E
	for <lists+dri-devel@lfdr.de>; Sat, 16 Apr 2022 02:33:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2A4510E292;
	Sat, 16 Apr 2022 00:33:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAA3710E271;
 Sat, 16 Apr 2022 00:33:25 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id k29so9072105pgm.12;
 Fri, 15 Apr 2022 17:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FSpeGI+AKCEsOeI+kpzi6mqwOR7Zmm4NjdrpPLaO+uk=;
 b=Xkeb/eK0YajPaB1EbwGsYvDPvezCBkZvGOWMof9W3sVXS+yjF/c/+BEHBuHJh0uiEc
 4mICmkMIxiVdXFcvEu/NVcApQsUh7LCOeMRx2Ranap89omih6ev1lFALLY2PJ7WNK4US
 Fzk9K20aHoTqVUzsmgX0711c5+pVhjiADrmuqH4Znq68D4fc/6KnxeYywreXPeUtYq1U
 oDhxcC5hcdbXGt/WiOUq997iXEIenMTo37VaOrlAqCGUu2uapa3MyTRDTN1ofnMA+//3
 XK8RJsxoftuui9aSBKyS8vCI2x6TcC0gCl4BorIr7kQsFaiu+Xs3YAopGdXBZxvpXY4W
 7JeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FSpeGI+AKCEsOeI+kpzi6mqwOR7Zmm4NjdrpPLaO+uk=;
 b=oJwOET7OM3A2LriigHU8NSfqSbmGbuxASPaFLUd/WWXl8M+X9CLNagw0ywFEBcDrp8
 EVhQwKuoNgKrlfm/LrSrxXMHIaxtRz8mMZRHAIiu8XuMCIwEPb+AM35nYqudH+Ixhjbe
 lie47YlsN7WOs34Nug2CdKh0V3SqjFf2hkNfR5mQym4INchmsVZ3DU8QtrMgKKg2riU+
 J3NkO882LLsJvPD3RxJKBaJol4J1ttA73riTJY4kltNsdnsZfUfZmElFQ1Cazkk9sXVf
 ZsevEa80j2Em/8MqgFeLzUrJiSjKY79UtBy6NGxbAvfeiRJKx67E2dDtdQH/xy2yrs+2
 CNlg==
X-Gm-Message-State: AOAM533o5ZROSIQNLfgk1GmrmkRS3Gdp6kj1gBw3p47ZTCR8Vi+k3dhZ
 CuiRQ+8iDQf7qwrwZ1tykQmbBhK4XKo=
X-Google-Smtp-Source: ABdhPJx0PBJyIcjSuMZcCKzSpC48ofRcK+Nd4E9AAl/1wQ1BLVEe4QrKJXsxg1zib5CJXZufx45ISA==
X-Received: by 2002:a05:6a00:856:b0:50a:431b:c298 with SMTP id
 q22-20020a056a00085600b0050a431bc298mr1521546pfk.75.1650069204901; 
 Fri, 15 Apr 2022 17:33:24 -0700 (PDT)
Received: from olv-glaptop3.lan ([2601:647:4400:452:4301:d32e:a8ad:adbf])
 by smtp.gmail.com with ESMTPSA id
 oo17-20020a17090b1c9100b001bf0ccc59c2sm9900249pjb.16.2022.04.15.17.33.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 17:33:24 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: freedreno@lists.freedesktop.org
Subject: [PATCH 1/3] drm/msm: remove explicit devfreq status reset
Date: Fri, 15 Apr 2022 17:33:12 -0700
Message-Id: <20220416003314.59211-1-olvaffe@gmail.com>
X-Mailer: git-send-email 2.36.0.rc0.470.gd361397f0d-goog
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
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It is redundant since commit 7c0ffcd40b16 ("drm/msm/gpu: Respect PM QoS
constraints") because dev_pm_qos_update_request triggers get_dev_status.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
Cc: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
index 12641616acd3..317a95d42922 100644
--- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
+++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
@@ -224,7 +224,6 @@ void msm_devfreq_boost(struct msm_gpu *gpu, unsigned factor)
 void msm_devfreq_active(struct msm_gpu *gpu)
 {
 	struct msm_gpu_devfreq *df = &gpu->devfreq;
-	struct devfreq_dev_status status;
 	unsigned int idle_time;
 
 	if (!has_devfreq(gpu))
@@ -248,12 +247,6 @@ void msm_devfreq_active(struct msm_gpu *gpu)
 
 	dev_pm_qos_update_request(&df->idle_freq,
 				  PM_QOS_MAX_FREQUENCY_DEFAULT_VALUE);
-
-	/*
-	 * Reset the polling interval so we aren't inconsistent
-	 * about freq vs busy/total cycles
-	 */
-	msm_devfreq_get_dev_status(&gpu->pdev->dev, &status);
 }
 
 
-- 
2.36.0.rc0.470.gd361397f0d-goog

