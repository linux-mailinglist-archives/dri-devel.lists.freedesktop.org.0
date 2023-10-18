Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E10107CE295
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 18:19:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E53CC10E192;
	Wed, 18 Oct 2023 16:19:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A883A10E184
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 16:18:57 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-3b2d9ac9926so1127551b6e.2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 09:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697645937; x=1698250737; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VJC+C4OtuULaekIgETfG9hZQeFdTuWayXpQ5YRaiN4w=;
 b=BFzAk8WtW/PgIdq2RXKmbjyx7Jxgh3iEz7EvdK8NykXYLtZ0VFZ37y0+yXV20ex/UN
 YOrJ0XyPdbxOQ0tPzr4jCnN05t/fjchEYieiHG5j++9MMGSmMfB9ymtRhlC0dQpBCXR9
 xxoPmn/ZX0oKTWth5PBXS77xvuHH5Xra6lbJNS/e6lzblmu5u0aGvwKuXKe80uEf/y3c
 EojDa7hfuVrlLqPd5hJgq1DHZYU+uVNQECT+3ho6i4wdL8cqH2v3KfEvejeUqkbvkGXi
 vjSGpbx42DNTzQ4KArbBWF7RP56xSEYvT1MQEYAthNXWHQ6tIoNP/Itso933hsMHdTOQ
 3xUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697645937; x=1698250737;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VJC+C4OtuULaekIgETfG9hZQeFdTuWayXpQ5YRaiN4w=;
 b=mY/+48gF1aVV6YkyPlg040g6lesPwdVX6hA+67lzoUb61l6m8ybL0P4ZZULY4zkbXR
 +j6Mhn/NtRHRX0nV/yWvQlWf6e2BlVdiNEf1rBpo0DR/lkUfMXAUoSFqh4+8OeXBdHZ3
 EwKW0sJ0+7LU24bhpFLtdx0rOF+FYDrPbjETwA1SONQrzu9pgxRLsSAceRuXdLYfdWYs
 7ugXQX7aE2P4S8RQoD7zfVveZtDJvzB8tM98kXMNuI4/33Lda0Kf8ZOXTrs4hiATCOJN
 86B+7kAkRpChIXEQ86/Xzz2waqKy9q2PAyO7PGd3XAlBrTcIe25cpaN7lALlA8mAgbyR
 yKFw==
X-Gm-Message-State: AOJu0YznU8PpagijrhVuuAIoL2MK4gJMVlJlno6fejUTytKnEmY90kVV
 v8iF16gXos3PE0D2Ys9fWKYNr4YRiIs=
X-Google-Smtp-Source: AGHT+IEyC/5eqkKVkMLwJ6n6DXED2z+hXcF3NA1uSNWAQv0tYW9JWBm7ZuVXNvSMVxSCboUAsi626g==
X-Received: by 2002:a05:6808:211e:b0:3ae:1298:257a with SMTP id
 r30-20020a056808211e00b003ae1298257amr7454580oiw.1.1697645936910; 
 Wed, 18 Oct 2023 09:18:56 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 db14-20020a056808408e00b003afe584ed4fsm697390oib.42.2023.10.18.09.18.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Oct 2023 09:18:56 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Subject: [PATCH 3/5] clk: rockchip: rk3568: Add PLL rate for 115.2MHz
Date: Wed, 18 Oct 2023 11:18:46 -0500
Message-Id: <20231018161848.346947-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231018161848.346947-1-macroalpha82@gmail.com>
References: <20231018161848.346947-1-macroalpha82@gmail.com>
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
 krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org, sboyd@kernel.org,
 sam@ravnborg.org, mturquette@baylibre.com,
 Chris Morgan <macromorgan@hotmail.com>, sebastian.reichel@collabora.com,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add support for a PLL rate of 115.2MHz so that the Powkiddy RK2023 panel
can run at a requested 60hz (59.99, close enough).

I have confirmed this rate fits with all the constraints
listed in the TRM for the VPLL (as an integer PLL) in Part 1 "Chapter
2 Clock & Reset Unit (CRU)."

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/clk/rockchip/clk-rk3568.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/rockchip/clk-rk3568.c b/drivers/clk/rockchip/clk-rk3568.c
index db713e1526cd..bfbcbb744327 100644
--- a/drivers/clk/rockchip/clk-rk3568.c
+++ b/drivers/clk/rockchip/clk-rk3568.c
@@ -79,6 +79,7 @@ static struct rockchip_pll_rate_table rk3568_pll_rates[] = {
 	RK3036_PLL_RATE(148500000, 1, 99, 4, 4, 1, 0),
 	RK3036_PLL_RATE(135000000, 2, 45, 4, 1, 1, 0),
 	RK3036_PLL_RATE(119000000, 3, 119, 4, 2, 1, 0),
+	RK3036_PLL_RATE(115200000, 1, 24, 5, 1, 1, 0),
 	RK3036_PLL_RATE(108000000, 2, 45, 5, 1, 1, 0),
 	RK3036_PLL_RATE(101000000, 1, 101, 6, 4, 1, 0),
 	RK3036_PLL_RATE(100000000, 1, 150, 6, 6, 1, 0),
-- 
2.34.1

