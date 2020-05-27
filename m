Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8209B1E5933
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:44:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2D5D6E402;
	Thu, 28 May 2020 07:43:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45D89882A9
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 07:28:12 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id 124so5177411pgi.9
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 00:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=PCXZ/XVMi8KpMlGOTwhqCP9MMMe9ESFVI+WU4Q3c6Jk=;
 b=I8hUHZ6SxFDEwHdk7/zeDaW/Z2P4AkgiDIFUitVnXJXeTb+IOLeTPT06lLpHqELqho
 cHkEkrWucnwxAI4w9z7QW+3XmUv+zgx2u7kPK3azIIIrFymuAxKAL2rCyR9HUboYPkld
 wqT/JAKpZN3Rkjfb3iniOF3m8C5DPT+SsWECsI3JVppNGION1BhqoLc424/hjUYe+gdf
 MRftOfeBuYnUlGuwdnwN/mCbfPthTvj4rWFgrDhEMnFAMYruktb7ow5C9Bp8aE97DvLs
 KQvPaaw1ZLWNhbSOq9Ad9O1TOPc/aVPRXPBgmT6xw+CPz2EOWGz/sLi6nJLgN5uQ6Lj+
 DJNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=PCXZ/XVMi8KpMlGOTwhqCP9MMMe9ESFVI+WU4Q3c6Jk=;
 b=lqXSABzi7pSAj8VVLtgXtbQ8MnXapW2rBRrZdto8TUU3JcdQxYyMAxzcezUJgig4W0
 VDYI1vaiZo9wP75oKpwQ9tgnVCOSt2LKROBBg5x1b1vxHiT5GhoSvX/sGGfSY6GS1L97
 m0hEgH68MsCzxqZOygmJGM+TwkjGTY/QL8A8vCQTRLIfcBPE9RGVYaht3zlKoqb/55Qn
 ts7Rsiev4QOnoq1qClFtcJymYYJDKxoTLv6xh+t0HmPddohIfF0RDs/l+ZEa6YrGwJV0
 tdJNiAat9Jgs3jAmeb8ExuNGVa61gxIKQ/Wi1MLVZhRO1pES5P3ZiNKm0IhTpqPtVCzQ
 S/YA==
X-Gm-Message-State: AOAM5327zEgzqcDBPdK72nrEAyPD9ZBw0zr2c/AkjFFKwhgrYqETVucU
 2r0MB9Qp3MuEY8qW6ndNfuw=
X-Google-Smtp-Source: ABdhPJxPJhhSE88EJXZgUaSI8AhIFjINE/wSKKHD3Ql/J86dwwqEQCn2uj2TmRHGyg8Y6hFAjyIJXA==
X-Received: by 2002:a63:4b41:: with SMTP id k1mr2609543pgl.452.1590564491949; 
 Wed, 27 May 2020 00:28:11 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.191.44])
 by smtp.gmail.com with ESMTPSA id q201sm1371842pfq.40.2020.05.27.00.28.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 27 May 2020 00:28:11 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, p.zabel@pengutronix.de, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com, thierry.reding@gmail.com, sam@ravnborg.org,
 airlied@linux.ie, daniel@ffwll.ch, mturquette@baylibre.com,
 sboyd@kernel.org, andy.shevchenko@gmail.com, noralf@tronnes.org,
 linus.walleij@linaro.org, broonie@kernel.org
Subject: [PATCH v6 6/9] clk: stm32: Fix ltdc's clock turn off by
 clk_disable_unused() after kernel startup
Date: Wed, 27 May 2020 15:27:30 +0800
Message-Id: <1590564453-24499-7-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590564453-24499-1-git-send-email-dillon.minfei@gmail.com>
References: <1590564453-24499-1-git-send-email-dillon.minfei@gmail.com>
X-Mailman-Approved-At: Thu, 28 May 2020 07:43:50 +0000
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
Cc: devicetree@vger.kernel.org, dillonhua@gmail.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, dillon min <dillon.minfei@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: dillon min <dillon.minfei@gmail.com>

stm32's clk driver register two ltdc gate clk to clk core by
clk_hw_register_gate() and clk_hw_register_composite()

first: 'stm32f429_gates[]', clk name is 'ltdc', which no user to use.
second: 'stm32f429_aux_clk[]', clk name is 'lcd-tft', used by ltdc driver

both of them point to the same offset of stm32's RCC register. after
kernel enter console, clk core turn off ltdc's clk as 'stm32f429_gates[]'
is no one to use. but, actually 'stm32f429_aux_clk[]' is in use.

Fixes: daf2d117cbca ("clk: stm32f4: Add lcd-tft clock")
Signed-off-by: dillon min <dillon.minfei@gmail.com>
---

Changes since V5:
separate '[PATCH v5 5/8]' to two, add Fixes tags.

 drivers/clk/clk-stm32f4.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
index 42ca2dd86aea..fa62e990c539 100644
--- a/drivers/clk/clk-stm32f4.c
+++ b/drivers/clk/clk-stm32f4.c
@@ -129,7 +129,6 @@ static const struct stm32f4_gate_data stm32f429_gates[] __initconst = {
 	{ STM32F4_RCC_APB2ENR, 20,	"spi5",		"apb2_div" },
 	{ STM32F4_RCC_APB2ENR, 21,	"spi6",		"apb2_div" },
 	{ STM32F4_RCC_APB2ENR, 22,	"sai1",		"apb2_div" },
-	{ STM32F4_RCC_APB2ENR, 26,	"ltdc",		"apb2_div" },
 };
 
 static const struct stm32f4_gate_data stm32f469_gates[] __initconst = {
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
