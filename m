Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5E456BE1F
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 18:24:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 941D910E858;
	Fri,  8 Jul 2022 16:24:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAD1B10E85A
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 16:24:00 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 r17-20020a056830449100b0061c1b3840a0so3420749otv.3
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jul 2022 09:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eS1DoT862v/g6EpjvGHfLBntfCPBUFxV6o7NJazJK14=;
 b=hSRsjqZkDb6SyYnQtxvHdml60HsCjB3dzHLzVc+Sn2nCDLpjUIt0dvvYQEP4Utv8dp
 HJ4UVRDAwVrjvDJlMu1KWwignFae8tPFXKxvx7w67BsfotkF0yCeNJpCq93RE79nvUPR
 a9/RELWNRH58jLvHLFSo559skengu9ebIkY9qFdA3GmDMtcX249eLdFy15rFNHv4HhIG
 0OPUsVbAD5efrQapJLvTX2j7ZYGpV3Yo5UuU445XhnUTajLmuVDfgNnmSZgTWUCvD4cO
 sshWnVjlDI2wpye7wqBbHjpGgI57nlHFi82d3ln8eARWnN2zIdGS4XSIQQa10QOFAmFK
 hgLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eS1DoT862v/g6EpjvGHfLBntfCPBUFxV6o7NJazJK14=;
 b=i5i2QNNP4AwS3OcXeTrLtKOjQzms8oP59dxTEpg/7qCCi9lDsusPhrPRoslD4/nPWb
 TQ76vwZNvosBykn3Tdvlr1TMo6PX0zwHrxg4gGyGaTrHPoJ1qeflhJXFjGlAPmFZKNEZ
 aUYPN0mb5E2OlsnWND+jopTG5pYajMpahGtGHf6ks6Z79N9ffapt/rMs8XmBVdae/kVI
 eECbuzC48zwv9xX9Tr2yIeWEufKCVrPhM1YPTjMlBELb853ehs/p7CbXGKoALDlTKsmO
 DD2cOhcm5yb/892Hi2UAuG3AGX+PJAeyOcXls9GWlx5+QHtlqRun3RhYBObl0anPF/pa
 vnoQ==
X-Gm-Message-State: AJIora8nkP2HsNgsFzID/GW4Cv6lOAfsq37yzoEhW2li/9Wz1dn/nPd6
 MXxvfmWKi3MdK++LqFkEwiUIjA==
X-Google-Smtp-Source: AGRyM1sHmxfIFe72kNMrpQnCwtapr6QU9N20Rtq+AQ0mLbpRLwO90rb6TwTmApYnhVPsNOLGXUit5Q==
X-Received: by 2002:a05:6830:cf:b0:61c:265b:1d1e with SMTP id
 x15-20020a05683000cf00b0061c265b1d1emr1862647oto.290.1657297439983; 
 Fri, 08 Jul 2022 09:23:59 -0700 (PDT)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186]) by smtp.gmail.com with ESMTPSA id
 f8-20020a056871070800b00101bd4914f9sm6678663oap.43.2022.07.08.09.23.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 09:23:59 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH] drm/msm/gpu: Drop qos request if devm_devfreq_add_device()
 fails
Date: Fri,  8 Jul 2022 09:26:32 -0700
Message-Id: <20220708162632.3529864-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
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
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the event that devm_devfreq_add_device() fails the device's qos freq
list is left referencing df->idle_freq and df->boost_freq. Attempting to
initialize devfreq again after a probe deferral will then cause invalid
memory accesses in dev_pm_qos_add_request().

Fix this by dropping the requests in the error path.

Fixes: 7c0ffcd40b16 ("drm/msm/gpu: Respect PM QoS constraints")
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
index c2ea978c8921..21e271a318ee 100644
--- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
+++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
@@ -198,6 +198,8 @@ void msm_devfreq_init(struct msm_gpu *gpu)
 
 	if (IS_ERR(df->devfreq)) {
 		DRM_DEV_ERROR(&gpu->pdev->dev, "Couldn't initialize GPU devfreq\n");
+		dev_pm_qos_remove_request(&df->idle_freq);
+		dev_pm_qos_remove_request(&df->boost_freq);
 		df->devfreq = NULL;
 		return;
 	}
-- 
2.35.1

