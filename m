Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F22766335A
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 22:43:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4843710E066;
	Mon,  9 Jan 2023 21:43:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78BC710E50D
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 21:43:12 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id g13so15185035lfv.7
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 13:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZQu9gL3piRuPWafZ9zBwIaYQw7mWZB+/XBTu3IqpHn8=;
 b=mI8X8teGSOE6/y6vG1YC33Nwbi6dcOKqEHptm4FK4XKAYE2QtWtj+kHcglw3iQeoXT
 55MlcZylq5yUBzABRxYTG1YTTRK/Hm8VuHhL6cHtdnbB305HlKCd4F/pgreYDgu/rUUU
 mktB4n3r9lgbMlFF25Jf54cbJeNo8mVhykNfHB6nD/J6mfKtE8V7NqFzxUbWXbL+I5vW
 8sdw8+d+zpuixro6LsYE0NbAB3eEMUdfAaB1Lf/TIK01+bD0QDEB2VFTfhE25anit3To
 tgVq8/EK6kPZ1niZL+xduJf5e7VKZpjbTl04jP4mjxVgCVN4601/JXerYfTsbk5WGNUC
 OHzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZQu9gL3piRuPWafZ9zBwIaYQw7mWZB+/XBTu3IqpHn8=;
 b=1O124BBpkKCTWl7np+W/Rnb6Ga2aSizMaqnBH0D97EhHvB9Phad7pNUIuDOqeW/Jct
 YCuDQPJLH21myNTJDj2nqru6YbSVJzYWFU1/Sr07cUBEjuqhUPWTrUMhXqGu80NuOGgX
 nIHfiTlypNURhw/im1965JVg8NrHQ9CLb3+f65DvvTjer1UCKgxVIe/jLtHKP4XT4N5/
 SxHVDVLFtIyB2wP2nW/17jUzvxXDkMAlTpGfgQ6soS8uyzKtj7nefL2FfNxQO1TfT4/c
 Vm4b5RcXQLzl2SrpvhXgkV8sT8aV8lu3gGa5pBIR/gLJFIBn0KzAHlWLwsz700owIr+H
 +uNQ==
X-Gm-Message-State: AFqh2kprX/WewG9irjmqF2Gv8waiqc3Foyk2Ab1tswaQEd1U6uVyTLt9
 K+GNMFZGtyMDNCWMCilzNHyayg==
X-Google-Smtp-Source: AMrXdXuZy/OcVRAo6GelAuse0AQTAor5rOSTurY9nmYgwgR21VtvPD/QIDOxRPQsFP07/wZ6V7uG6w==
X-Received: by 2002:a05:6512:1523:b0:4a4:68b7:deb8 with SMTP id
 bq35-20020a056512152300b004a468b7deb8mr562746lfb.20.1673300590772; 
 Mon, 09 Jan 2023 13:43:10 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 v4-20020a056512348400b004b58fadba35sm1785951lfr.296.2023.01.09.13.43.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 13:43:10 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH] drm/msm/dpu: disable DSC blocks for SM8350
Date: Mon,  9 Jan 2023 23:43:09 +0200
Message-Id: <20230109214309.586130-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
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

SM8350 has newer version of DSC blocks, which are not supported by the
driver yet. Remove them for now until these blocks are supported by the
driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Just for the reference. I'll apply this patch to prevent accidental
usage of these hw blocks.

---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 50ec0a57c3d7..94d355cc587f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -1527,11 +1527,6 @@ static struct dpu_dsc_cfg sdm845_dsc[] = {
 	DSC_BLK("dsc_3", DSC_3, 0x80c00),
 };
 
-static struct dpu_dsc_cfg sm8350_dsc[] = {
-	DSC_BLK("dsc_0", DSC_0, 0x80000),
-	DSC_BLK("dsc_1", DSC_1, 0x81000),
-};
-
 /*************************************************************
  * INTF sub blocks config
  *************************************************************/
@@ -2341,8 +2336,6 @@ static const struct dpu_mdss_cfg sm8350_dpu_cfg = {
 	.dspp = sm8150_dspp,
 	.pingpong_count = ARRAY_SIZE(sm8350_pp),
 	.pingpong = sm8350_pp,
-	.dsc_count = ARRAY_SIZE(sm8350_dsc),
-	.dsc = sm8350_dsc,
 	.merge_3d_count = ARRAY_SIZE(sm8350_merge_3d),
 	.merge_3d = sm8350_merge_3d,
 	.intf_count = ARRAY_SIZE(sm8350_intf),
-- 
2.39.0

