Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3335C74BD8C
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jul 2023 15:01:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFBDD10E0E4;
	Sat,  8 Jul 2023 13:01:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37C1610E0E3
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jul 2023 13:00:46 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2b5c231c23aso45599641fa.0
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Jul 2023 06:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688821242; x=1691413242;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dm1KjGkHlrKrzQJ/qXePV964b6OsIyDARoNzyXVIDWI=;
 b=D8z4Ss4KTOKvdJHHxs3LqjidCtsB6+HtTuJuIzgV8NBiJwLUgm6u0JFUvzx+LrB34i
 LTfPf+gdDvzE+zMAE1ZBiEl9Ce4tqP7Zyl3sSKfxKw7eRrYPRoqt3tXLt9PFv2sv9m9j
 NYLezds2faxQeiSeBjSiUGMWBnaoYLuFnPDsDLvpX8j6tSJpVlTTquHcMkBen6XpbY9d
 F82xfUcpyJ/29YUgWsHI+PBZ5FdyhUOfu1obaiL+NyGccdklBBWbh+nau4Nh+UmNvFXa
 JkcQvFvmFm+Ne4KgqYUQPL8tmYkCcXFduCfqbJE0ONc83ZYGaxndNQqfegtGjIP05lVU
 GFnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688821242; x=1691413242;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dm1KjGkHlrKrzQJ/qXePV964b6OsIyDARoNzyXVIDWI=;
 b=TxIHy/vmuNQQVNc6cW7rJ7iGHT2GlGtled4suRjpcgJ4VkqCErUy9xZp082/A6cFSW
 9hn79TG3xNc2v1vemmlBsB6+lONwivU0TAai8P1DaFmsXHjykeAvmBxOZki0Xb3a3cCt
 S1Ka51WCSmmf+qDlawovSbNx7ORDzbE4WVjVbGZdKMd5thQPgMyLcLAL1bey2+gBVMAG
 hVragz87qVMXNOsegYmmqN0fmjsP7j6/GNCyhdRYiiyLqhQHrbmoPDygDnGOTv982x0r
 S8lrT4gAwFuBct9dfxNrK/h4zCYaLHRtjsIs05RnL4YmfhYigrsWyMsDEjWMCFPsNLoC
 PuAg==
X-Gm-Message-State: ABy/qLZyzHzFDt9h/4P4UkJhBKJhDjUKceZaWX9C7dFui0fMsb4mxuZn
 vi8remxI+3VHhKxkVR/+hHgUDj4vjbfWXQeWjfY=
X-Google-Smtp-Source: APBJJlEeCtPsw5E/78MiWAsmEFeLoaOHSx9CtDtK6CnIsNnvgWYFUmlLt/2Tz4EYpAhCKMSZysqirw==
X-Received: by 2002:ac2:498e:0:b0:4fa:a0c3:efa1 with SMTP id
 f14-20020ac2498e000000b004faa0c3efa1mr5492354lfl.7.1688821241765; 
 Sat, 08 Jul 2023 06:00:41 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 l10-20020a19c20a000000b004fb96436ac7sm1003839lfc.250.2023.07.08.06.00.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jul 2023 06:00:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 2/2] drm/msm/dpu: fix DSC 1.2 enc subblock length
Date: Sat,  8 Jul 2023 16:00:39 +0300
Message-Id: <20230708130039.1596599-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230708130039.1596599-1-dmitry.baryshkov@linaro.org>
References: <20230708130039.1596599-1-dmitry.baryshkov@linaro.org>
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

Both struct dpu_dsc_sub_blks instances declare enc subblock length to be
0x100, while the actual length is 0x9c (last register having offset 0x98).
Reduce subblock length to remove the empty register space from being
dumped.

Fixes: 0d1b10c63346 ("drm/msm/dpu: add DSC 1.2 hw blocks for relevant chipsets")
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 0de507d4d7b7..dd2f89ada043 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -517,12 +517,12 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
  * DSC sub blocks config
  *************************************************************/
 static const struct dpu_dsc_sub_blks dsc_sblk_0 = {
-	.enc = {.base = 0x100, .len = 0x100},
+	.enc = {.base = 0x100, .len = 0x9c},
 	.ctl = {.base = 0xF00, .len = 0x10},
 };
 
 static const struct dpu_dsc_sub_blks dsc_sblk_1 = {
-	.enc = {.base = 0x200, .len = 0x100},
+	.enc = {.base = 0x200, .len = 0x9c},
 	.ctl = {.base = 0xF80, .len = 0x10},
 };
 
-- 
2.40.1

