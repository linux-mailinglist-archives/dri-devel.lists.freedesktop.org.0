Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EBE73B947
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 15:59:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93FC910E647;
	Fri, 23 Jun 2023 13:58:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D96910E639
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 13:58:49 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2b46f1256bbso22204601fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 06:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687528727; x=1690120727;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EEJPSFsLFQLeUHR0DHShMWunEOETEI1PxCznhvCiCY8=;
 b=wJdpjNHZkvlCaG4AiVPy2TBq58+rqElaOzHcNP8+739N6nL/OzzZ/vFUa5gU6bqfjT
 yhPqLiD08qMEmGCfpVfm+kKawbwTvTAukge6QgXVi+vKT/TJu2tBo0gCIAzjZLZH8Cyx
 dXru2seQnW6eWE34c8dNgobPK/8f4+ulYMCBzz7yavZ2zm4wy4VVypjBemk/KF1gyVVJ
 hqjm4LdhnN8ueumrhyNozpUF0NqTjWW3GjOuUhQ+yb1QSqgsqYQijtmpgxui8J2WrW8o
 +ft32IQscSjfahAJ9DdL6cWaPY40E8uNqock70PvA3lnqOLflLe6UKAEDavB322EJeVL
 +HVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687528727; x=1690120727;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EEJPSFsLFQLeUHR0DHShMWunEOETEI1PxCznhvCiCY8=;
 b=k6AlTxmayaoab+hkTM0pycHu4ZOtIL3anFD/gES40v0ZfbxGBgv8xWMXka78RJ0IFG
 kDMtzyQIYOVnHBv3KD9OtWSkuZrLHzytf/MIGawABoipRpyYcGEZtkXAjwupbGfC5JIT
 RKwFHMWIFNB3CMDPYKADY/+hczeLMf5sLBpw2U+SeRTCYeu+jS7eGubq/F5NatMCEgz/
 KQFo7f9PQ2JTyUgO5pH2wQzs6HtTnUxctM2s35mLuXV96uRloPTO+Lttc7l0ehN/3ypL
 RhI+lTE1IJWS4NVCKwf3VWAfRH+E7N8dOY4idDY1AfXhxsW3t/4wLq07rIuwJscufcum
 D2PA==
X-Gm-Message-State: AC+VfDzapM098XPmzy5gdg/CAha+GTwPi45a2Dn4/TR9eKUKGkjyY/Lk
 0cvTJ8VB6UZhC/pOFHtwsKdm9Q==
X-Google-Smtp-Source: ACHHUZ4wu/b34r6Yiz+nYYmdczNba7dYoNZoPKpydnsZ2gUagqp3RgnwWueUFdFlqJ1/OciI3vk3Cg==
X-Received: by 2002:a05:651c:118a:b0:2b4:75ed:e0f0 with SMTP id
 w10-20020a05651c118a00b002b475ede0f0mr5669113ljo.10.1687528727510; 
 Fri, 23 Jun 2023 06:58:47 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 11-20020a05651c008b00b002ac7b0fc473sm1756869ljq.38.2023.06.23.06.58.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jun 2023 06:58:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 2/7] drm/msm/dpu: drop the field `name' from DPU_HW_SUBBLK_INFO
Date: Fri, 23 Jun 2023 16:58:39 +0300
Message-Id: <20230623135844.1113908-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623135844.1113908-1-dmitry.baryshkov@linaro.org>
References: <20230623135844.1113908-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Ryan McCann <quic_rmccann@quicinc.com>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is little point in having a separate field with the name in the
sub-block info. Ryan pointed out that some (most) of of sub-blocks do
not even fill this field. The handling code also usually knows, which
sub-block it is now looking at.

Drop the unused field completely.

Suggested-by: Ryan McCann <quic_rmccann@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 --
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 4a99144a5a85..d4a5b18d4dae 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -253,9 +253,9 @@ static const uint32_t wb2_formats[] = {
 	.maxdwnscale = MAX_DOWNSCALE_RATIO, \
 	.maxupscale = MAX_UPSCALE_RATIO, \
 	.smart_dma_priority = sdma_pri, \
-	.scaler_blk = {.name = STRCAT("sspp_scaler", num), \
+	.scaler_blk = { \
 		.base = 0xa00, .len = 0xa0,}, \
-	.csc_blk = {.name = STRCAT("sspp_csc", num), \
+	.csc_blk = { \
 		.base = 0x1a00, .len = 0x100,}, \
 	.format_list = plane_formats_yuv, \
 	.num_formats = ARRAY_SIZE(plane_formats_yuv), \
@@ -269,9 +269,9 @@ static const uint32_t wb2_formats[] = {
 	.maxdwnscale = MAX_DOWNSCALE_RATIO, \
 	.maxupscale = MAX_UPSCALE_RATIO, \
 	.smart_dma_priority = sdma_pri, \
-	.scaler_blk = {.name = STRCAT("sspp_scaler", num), \
+	.scaler_blk = { \
 		.base = 0xa00, .len = 0xa0,}, \
-	.csc_blk = {.name = STRCAT("sspp_csc", num), \
+	.csc_blk = { \
 		.base = 0x1a00, .len = 0x100,}, \
 	.format_list = plane_formats_yuv, \
 	.num_formats = ARRAY_SIZE(plane_formats_yuv), \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index bf7a525206ee..a102a8b0f8e1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -273,13 +273,11 @@ enum {
 
 /**
  * MACRO DPU_HW_SUBBLK_INFO - information of HW sub-block inside DPU
- * @name:              string name for debug purposes
  * @base:              offset of this sub-block relative to the block
  *                     offset
  * @len                register block length of this sub-block
  */
 #define DPU_HW_SUBBLK_INFO \
-	char name[DPU_HW_BLK_NAME_LEN]; \
 	u32 base; \
 	u32 len
 
-- 
2.39.2

