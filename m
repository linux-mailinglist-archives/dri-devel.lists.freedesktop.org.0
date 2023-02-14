Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA9A696BB3
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 18:32:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD18010E956;
	Tue, 14 Feb 2023 17:32:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F141010E951
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 17:32:31 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id bt8so12678981edb.12
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 09:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X0vTgl+EwiBhnrCXr0xxuDMvxcNALHuFiQR0A2LHsl4=;
 b=KpSDfORbK5xMEx3J9DXPweBlRqygeygWbj66ojKQIxHJX1NhsS/7gPQNL9vUkLT3Nk
 hb9ytfdnr6ytmd02E7BR3qmCIfaKbwSr0I7gOPLzvjDJlN5ASoUghASQVk7FsXr4jTHg
 VjjLTuBieats9SsAfjKsJ0zYmVrK6GCdD83nQOWdHqJirPNUCSBD1aEb+EqL8CTyJgW6
 DEchlnZ3zlQ2yCiezRgbj4sfl1oHVyH6IjiWfnqHkdrr0x+XIxdmtTwUvA3XNwZPdms2
 BcTPy/Q0wNG2cgcQDflriCzAeFf3Sste8iXTxb/GTQU+2r9miWT6fONfju4tbEUNiJMH
 YBSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X0vTgl+EwiBhnrCXr0xxuDMvxcNALHuFiQR0A2LHsl4=;
 b=Y+Dcng/94w3ve+ZOF8BtXvL14/mcuE9PAQy6LqsHeDGZ76uvleuRNhSKlG+/uPIz43
 Ow27mRzBiC/XMYcbJlYBWEwUB5fKF8vVf6Noe5iiBuJVOVE82W3YDwooLnDTRSkhbhGf
 eklrXBFcP5yLd1N6DgVeLX2+Q5VDfKf8Tx0DiTROD35c+hFlkk9ScDkL2r5hCYtPE2X7
 9Z92PxXMHh1ObmTyBomYT1c+Ag7i0+DXsOdmKFysSksTMyJJ67w1lIlfA0bApCGoqxmJ
 JarjOAAQXsYrL3cP3/FJ95W9n93fGgBxOcZKbY03aB9IB01P5dxhi9oCvStI0J53HgTE
 d9oQ==
X-Gm-Message-State: AO0yUKVW9nBFd/q2KAGd91C/nvUJaZ2+PeQN0pBj8p2NwVIcrXltJPzn
 1NRaAdzWgnSOTuG59QMrIjI9iw==
X-Google-Smtp-Source: AK7set+iMh7/0xs5Je24xhYvEfrZM9zSRunoB8VJFdJYFur84UjwE/0wpeZrccB3cySw9r+oiNMiyA==
X-Received: by 2002:a50:bace:0:b0:4ab:4cf0:4ab3 with SMTP id
 x72-20020a50bace000000b004ab4cf04ab3mr3470812ede.38.1676395951540; 
 Tue, 14 Feb 2023 09:32:31 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl.
 [83.9.1.117]) by smtp.gmail.com with ESMTPSA id
 w8-20020a50c448000000b0049668426aa6sm8325787edf.24.2023.02.14.09.32.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 09:32:31 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	andersson@kernel.org,
	agross@kernel.org
Subject: [PATCH v2 13/14] drm/msm/a6xx: Add A619_holi speedbin support
Date: Tue, 14 Feb 2023 18:31:44 +0100
Message-Id: <20230214173145.2482651-14-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
References: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A619_holi is implemented on at least two SoCs: SM4350 (holi) and SM6375
(blair). This is what seems to be a first occurrence of this happening,
but it's easy to overcome by guarding the SoC-specific fuse values with
of_machine_is_compatible(). Do just that to enable frequency limiting
on these SoCs.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 31 +++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index ffe0fd431a76..94b4d93619ed 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2094,6 +2094,34 @@ static u32 a618_get_speed_bin(u32 fuse)
 	return UINT_MAX;
 }
 
+static u32 a619_holi_get_speed_bin(u32 fuse)
+{
+	/*
+	 * There are (at least) two SoCs implementing A619_holi: SM4350 (holi)
+	 * and SM6375 (blair). Limit the fuse matching to the corresponding
+	 * SoC to prevent bogus frequency setting (as improbable as it may be,
+	 * given unexpected fuse values are.. unexpected! But still possible.)
+	 */
+
+	if (fuse == 0)
+		return 0;
+
+	if (of_machine_is_compatible("qcom,sm4350")) {
+		if (fuse == 138)
+			return 1;
+		else if (fuse == 92)
+			return 2;
+	} else if (of_machine_is_compatible("qcom,sm6375")) {
+		if (fuse == 190)
+			return 1;
+		else if (fuse == 177)
+			return 2;
+	} else
+		pr_warn("Unknown SoC implementing A619_holi!\n");
+
+	return UINT_MAX;
+}
+
 static u32 a619_get_speed_bin(u32 fuse)
 {
 	if (fuse == 0)
@@ -2153,6 +2181,9 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
 	if (adreno_cmp_rev(ADRENO_REV(6, 1, 8, ANY_ID), rev))
 		val = a618_get_speed_bin(fuse);
 
+	else if (adreno_cmp_rev(ADRENO_REV(6, 1, 9, 1), rev))
+		val = a619_holi_get_speed_bin(fuse);
+
 	else if (adreno_cmp_rev(ADRENO_REV(6, 1, 9, ANY_ID), rev))
 		val = a619_get_speed_bin(fuse);
 
-- 
2.39.1

