Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEE1803DCF
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 19:57:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 390AD10E3D3;
	Mon,  4 Dec 2023 18:57:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D6C810E3D6
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 18:57:33 +0000 (UTC)
Received: by mail-oo1-xc2d.google.com with SMTP id
 006d021491bc7-58d06bfadf8so3517861eaf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 10:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701716252; x=1702321052; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eoHBy2Gq0IKDCcd2s7uyWkrAzEtkWU3lQMiTxxVB74E=;
 b=eldWTmgNSI0+xLPR9sxNrwhqoooCkz6H946C0IaMrSSMlncLgMX7dbbudKLi9Sq01l
 EkRqgrid69n0re3n9b+0rdiVP2QkoQ1eOGX/Gb18cAyE8lpbo9t4zBK0lQSz5yln77F1
 BHlNjP+YAGYOG9wKd8CkzkDv8PTWvSLCVRnZUIXLEr6cYWfacZr6Kgt14qPvYti8UKuK
 Zll+f9108V2X2uWii0J3lgHgRge2bCxUpQ56nw5D3VFA2OLIY4mtZWgqccFK3bvieYnv
 sVzVDq+NWHE2zxUvIwciUN7XYdmfyS19g1sIBTBrErQ3luW9NLokwmTnfir/xw7NARQ2
 vWDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701716252; x=1702321052;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eoHBy2Gq0IKDCcd2s7uyWkrAzEtkWU3lQMiTxxVB74E=;
 b=qNMkdFvyL/TqQyUMLZTR2Cj1WCsP6jKYPueGti0enUBcr7sfmzPnK+H9zMUJ95HaSt
 6RFH9Eh5NLju7jSQnyQi0JZMbXoCScFtkh5j8g1i6XhD8Z6VdUnbm6r/xQtntxfOLD71
 j0T3DUQI2nVJUGXOUyQ7RxVFq31cbmvuBWTp8GZo/zs2QscupeKq6Baji0mV4S5yjW43
 lWhVkFs9ZHHoh8wwpQzvkW23fQeidLOxARumdNORGO7ZebYH6PcwWRoMNtjK2uoIf//2
 dpcBHS9nQzH7T0hGfW8YeXbT/CuhKKNDnBQ1gPc/PazWfRYRLmBDv1ww1ClGhr+AWCqL
 6tmQ==
X-Gm-Message-State: AOJu0Yx8nUIVQZ2/6F+NnIn0POyUivQU/2RtuTx7ox58y/Hc1V1u8wv+
 0cLehSuhmDYyYdH4LuH0APE=
X-Google-Smtp-Source: AGHT+IEEs2z0j7U8AWKdw7TYbGtvp3FdOu8z69zTjkf+zoQXSsSDKlIvpLJQGbT2pjBiBT+1eo+/Ng==
X-Received: by 2002:a05:6820:2291:b0:58e:2845:d43b with SMTP id
 ck17-20020a056820229100b0058e2845d43bmr4007944oob.4.1701716252459; 
 Mon, 04 Dec 2023 10:57:32 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 y25-20020a4a2d19000000b00581fc1af0a7sm2073303ooy.28.2023.12.04.10.57.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 10:57:32 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Subject: [PATCH V2 08/10] clk: rockchip: rk3568: Add PLL rate for 126.4MHz
Date: Mon,  4 Dec 2023 12:57:17 -0600
Message-Id: <20231204185719.569021-9-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231204185719.569021-1-macroalpha82@gmail.com>
References: <20231204185719.569021-1-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>, krzysztof.kozlowski+dt@linaro.org,
 neil.armstrong@linaro.org, sboyd@kernel.org, sam@ravnborg.org,
 mturquette@baylibre.com, javierm@redhat.com, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, mripard@kernel.org, tzimmermann@suse.de,
 quic_jesszhan@quicinc.com, linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add support for a PLL rate of 126.4MHz so that the Powkiddy X55 panel
can run at a requested 60hz.

I have confirmed this rate fits with all the constraints
listed in the TRM for the VPLL (as an integer PLL) in Part 1 "Chapter
2 Clock & Reset Unit (CRU)."

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/clk/rockchip/clk-rk3568.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/rockchip/clk-rk3568.c b/drivers/clk/rockchip/clk-rk3568.c
index c4fa2375dbfb..fa408fedf625 100644
--- a/drivers/clk/rockchip/clk-rk3568.c
+++ b/drivers/clk/rockchip/clk-rk3568.c
@@ -78,6 +78,7 @@ static struct rockchip_pll_rate_table rk3568_pll_rates[] = {
 	RK3036_PLL_RATE(200000000, 1, 100, 3, 4, 1, 0),
 	RK3036_PLL_RATE(148500000, 1, 99, 4, 4, 1, 0),
 	RK3036_PLL_RATE(135000000, 2, 45, 4, 1, 1, 0),
+	RK3036_PLL_RATE(126400000, 1, 79, 5, 3, 1, 0),
 	RK3036_PLL_RATE(119000000, 3, 119, 4, 2, 1, 0),
 	RK3036_PLL_RATE(115200000, 1, 24, 5, 1, 1, 0),
 	RK3036_PLL_RATE(108000000, 2, 45, 5, 1, 1, 0),
-- 
2.34.1

