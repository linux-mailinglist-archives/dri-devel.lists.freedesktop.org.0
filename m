Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FD470B28A
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 02:42:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B86A710E223;
	Mon, 22 May 2023 00:42:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 191BF10E21E
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 00:42:31 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4f4b2bc1565so179480e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 21 May 2023 17:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684716149; x=1687308149;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zizt8T4/uGQMQCF98CdS8E/i3f6U3/IZeT/OtJdX66s=;
 b=Ko2WF4bTPQgM8qHFNknx1vVgzZg0edlLshC2M+6/GKzgLgqB71U4IcPyz+iD3WKIdF
 7XKHxZOIroeomHN8y5F26tF8V3O6Sv2W7KjkQY5avUHA8SmUPa7zFybS/saXmCaNnA5i
 EIf2eTAMV5fpjPwcPodzphfR8CJMoxZW1M6ePDw2Bc8Bxd5Cjt/JttI3oqdDAJLJaU4q
 f/Pj/W1LTxUlZVN2kkxWiGveWdpQOKIB/pm/DUbT69vweeiS4faOLSKRmTNaW5JXq/bK
 iHnCsFFpJj6R77KIN1j4V7mAP468rkZ7HX90YJQ7YBfnA6vxEtYzjGYfa3ocb3/3eBIe
 9vBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684716149; x=1687308149;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zizt8T4/uGQMQCF98CdS8E/i3f6U3/IZeT/OtJdX66s=;
 b=Y3hUN+qDCqYCZ8C5bPkeaIwEbCkBVLonfmogB+9V0GpEFgo2K9nB6V6YnC9Q5WbFji
 fs+KeB7dDP2r/vOXADin6ckQnCHQ1ZpLjcBiWsEUbK8lDyJnFb3DYc0fF/cQz7ibS6tZ
 dxqDl3D7VIsPDNt0VzHkIGVcZOTOzdabwLFN5vTMzrJWSlPWjO7UA1y/IrT5EsVQ+M5J
 FFrqvUDv/YCD4LFFcB4x+2/+ExwJDSKtxeS8S/AxlgKeA6hv1pZdG6rMEXVEHIN1I+N9
 e3XnNdeUd6fKXaeASlbTDOHFn27wz3A5oQvMNj9W6be+JEcGC7d+cnCNwmowldtEUw/k
 N0vw==
X-Gm-Message-State: AC+VfDwPY4E8x+T6wVxaEpZtLmt+8nfl1cAMGHiQwjaqLFI8mr2/GRBc
 u1QOgVHVW+huy1TF16wNIrnDbw==
X-Google-Smtp-Source: ACHHUZ6rje07H1eP9GoyQCx0cI/hiP57JvjtlDmK1E2FdKYtT/rMvIDiZxV3HUZlMJ8UQDWH5shcgw==
X-Received: by 2002:ac2:522d:0:b0:4f3:8411:f146 with SMTP id
 i13-20020ac2522d000000b004f38411f146mr3100721lfl.68.1684716149112; 
 Sun, 21 May 2023 17:42:29 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 b15-20020ac25e8f000000b004f139712835sm768159lfq.293.2023.05.21.17.42.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 May 2023 17:42:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 1/6] drm/msm/dpu: don't set DPU_INTF_TE globally
Date: Mon, 22 May 2023 03:42:22 +0300
Message-Id: <20230522004227.134501-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230522004227.134501-1-dmitry.baryshkov@linaro.org>
References: <20230522004227.134501-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Using BIT(DPU_INTF_TE) in INTF_SC7180_MASK (and by extension in
INTF_SC7280_MASK) results in this bit (and corrsponding operations)
being enabled for all interfaces, even the ones which do not have TE
block. Move this bit setting to INTF_DSI_TE(), so that it is only
enabled for those INTF blocks which have TE support.

Fixes: 152c1d430992 ("drm/msm/dpu: Add TEAR-READ-pointer interrupt to INTF block")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 1dee5ba2b312..162141cb5c83 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -101,7 +101,6 @@
 
 #define INTF_SC7180_MASK \
 	(BIT(DPU_INTF_INPUT_CTRL) | \
-	 BIT(DPU_INTF_TE) | \
 	 BIT(DPU_INTF_STATUS_SUPPORTED) | \
 	 BIT(DPU_DATA_HCTL_EN))
 
@@ -544,7 +543,7 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
 	{\
 	.name = _name, .id = _id, \
 	.base = _base, .len = _len, \
-	.features = _features, \
+	.features = _features | BIT(DPU_INTF_TE), \
 	.type = _type, \
 	.controller_id = _ctrl_id, \
 	.prog_fetch_lines_worst_case = _progfetch, \
-- 
2.39.2

