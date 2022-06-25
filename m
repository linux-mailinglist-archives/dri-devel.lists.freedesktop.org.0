Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB4B55A588
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jun 2022 02:30:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51D0710F2FC;
	Sat, 25 Jun 2022 00:30:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C3510E377
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jun 2022 00:30:31 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id i18so7113118lfu.8
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 17:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VG/DX3eL+6/NlPCigDEfKk/fZDBpp0l2CQ7qut1J/nk=;
 b=X2RAWpzb5zfsaioKpFiaDcrudgPO86EFVdo2uY1ggJogYyO7zQpw9/KuKOSFkpFbMB
 UWwIq+rRzb892IURBWzmr9z2TAV0aqel2bJoO+ZYanSEwmO0T16o7asd/xgb8Wzr13hU
 LTLwbWTOuiMPPTHbcWnq14eOJW6ppH30DAhNydGkhKIrtHFBlE+T2bgNzUWM4u7A7gH1
 lq5muRzT/0h1vEjaXCRam5NQGUpetCZ324zg8Ycx6xK1SI/YKJ92oTgxFP7A+jyUHw4Z
 4SobBW2zyIZr6YpGvZ7UZ1a5tObCBC7OosfPZNm2cRWDM2/IeFYd4dj3CpEbrJ+6BCBY
 QSwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VG/DX3eL+6/NlPCigDEfKk/fZDBpp0l2CQ7qut1J/nk=;
 b=OA8X50vDx4h9sBHv2tV22doSj91cRr+BG7MXlQZu6I8tqxwFJOlt3k7xe0LPwtCMq1
 1xqbGyA6v8k5F4ndUNANShCDi12p1ok26eHcVZyMHYR1CQN3j4EX+OaLZF1URje1bd7G
 F6ieBADpfYTfcjrJG4XG4l9p7b2RJaptKJ5gsq7LmFUhPu9wcGVAfk1Evr0xvAT298yX
 bPTjfeivv5BV7XrrFV028fzxOIk6ut1j6IbyEo7IwFw2ZbEksJTX7QwepNcxKMgGjSGh
 WgaX1yc9zDxl2SZTB7Vtsp24ow01nKkpSuRf3mHTBdajZ5ePjwBNSkodZ7bSvK8KFqWK
 /2Mw==
X-Gm-Message-State: AJIora/onrfANIb9l18pPCybwhxyBQJFGAfUq9MX31rMxNd5V3sF2aHX
 kvKD+hwKB3+NCzSaHivoqf+nNw==
X-Google-Smtp-Source: AGRyM1v9dtC+FdbrGuG1FLnlvEt8frK2DhVJEb+xVODy6mHi0YJGyHHHWpry/op0jR4oZjK5eBrEBA==
X-Received: by 2002:a05:6512:32c1:b0:47f:9d05:b6be with SMTP id
 f1-20020a05651232c100b0047f9d05b6bemr865588lfg.335.1656117029359; 
 Fri, 24 Jun 2022 17:30:29 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 d22-20020a2e3316000000b0025907141aa6sm440094ljc.83.2022.06.24.17.30.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 17:30:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2] drm/msm/dpu: simplify and unify dpu_encoder_get_intf and
 dpu_encoder_get_wb
Date: Sat, 25 Jun 2022 03:30:28 +0300
Message-Id: <20220625003028.383259-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove extra nestting level from the dpu_encoder_get_intf(), replacing it
with the explicit return in case the INTF_WB was passed to the function.

While we are at it, also change dpu_encoder_get_wb() to also use
explicit return rather than the goto.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v1: fix the typo (noticed by Stephen)

---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index f435baa500f8..c682d4e02d1b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1255,12 +1255,13 @@ static enum dpu_intf dpu_encoder_get_intf(const struct dpu_mdss_cfg *catalog,
 {
 	int i = 0;
 
-	if (type != INTF_WB) {
-		for (i = 0; i < catalog->intf_count; i++) {
-			if (catalog->intf[i].type == type
-				&& catalog->intf[i].controller_id == controller_id) {
-				return catalog->intf[i].id;
-			}
+	if (type == INTF_WB)
+		return INTF_MAX;
+
+	for (i = 0; i < catalog->intf_count; i++) {
+		if (catalog->intf[i].type == type
+		    && catalog->intf[i].controller_id == controller_id) {
+			return catalog->intf[i].id;
 		}
 	}
 
@@ -1273,14 +1274,13 @@ static enum dpu_wb dpu_encoder_get_wb(const struct dpu_mdss_cfg *catalog,
 	int i = 0;
 
 	if (type != INTF_WB)
-		goto end;
+		return WB_MAX;
 
 	for (i = 0; i < catalog->wb_count; i++) {
 		if (catalog->wb[i].id == controller_id)
 			return catalog->wb[i].id;
 	}
 
-end:
 	return WB_MAX;
 }
 
-- 
2.35.1

