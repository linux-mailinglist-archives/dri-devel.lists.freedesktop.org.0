Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 534DF592B1B
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 11:04:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19D00B4D1D;
	Mon, 15 Aug 2022 09:03:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2D12AEF9C
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 09:02:36 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id f28so6200410pfk.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 02:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=x5c01E7cObCgh325Qd23DlOZuK03/1+TgA9EfmEhXiI=;
 b=n23cIOUnS7wGzWf2/WKIwPZnDaiVkh7Bw1qWkzrnbWWsNbIaj82HyXguuN2QeLcEmF
 JnTerZuW2v5tzohkNapXRpGyHw/jl8O+Bq6Z1ZJTPGaCLYNaowSXC/zxlloB6Xak6OX8
 zIDhfYpDEFmvIHDO7yl+xsgrWV9lcKRYsyrN5016afz42s8ppIZoSi8wNR9WvPtV3u1o
 6Op1Saf/13DZrHIge+7tw5H3KTRHRZY6nc0LLRrJgk/j6QtjKGpXToLwU4Ngkw410Ugk
 dE48ZKXL0kM9H1ROs+s4lx0EeQhTq0OVA3CdRXx3jCs7bH3IMN7zW1+Jni59m/PB46Ea
 QnbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=x5c01E7cObCgh325Qd23DlOZuK03/1+TgA9EfmEhXiI=;
 b=gbnulKcczpqRKuejroDalfCSyppEOpYLZB6s3YsEUEkgYyB2eul6OQPNJxAavy4tMg
 yRO71tvUIbzGwXTa/NzTn+rkGB9X88egNz7UhUtCbHFP3JUU4x28pduBtTlVlvuSvlf9
 6TFSMb4ts6C7Yyjw7NuHPL0bq1AbTav4C4YyyNseBLrn2d++9AY5BYi+LnmrM2jim/mh
 o3Qqy6g1BxHLQXZw+EZwyECirxf/5hjehP91K74u0SRDrnwtY3VUTIX9Fb54gLskUFYG
 xjFBKqvqzO0ussc0/tfU9WG3iXyoDLQXLGgunLpUX+8sHeRZv2eLfcTuYIZ8FoeOxAXI
 kRuQ==
X-Gm-Message-State: ACgBeo2VihgytJ+XYMM1pJYyrvhDvW9oJj/swj7zsOP9uyFKQwGq7//k
 5ijxXhVRDXl1pMv9/TkGJUg=
X-Google-Smtp-Source: AA6agR6QcylJrjojhoBCQF/tkCRHXF/L3Lw0QYLHX52HspD4U5HkkuiRt7lOteR2Lov1ozcfoK0s/A==
X-Received: by 2002:a63:5201:0:b0:41e:2089:7174 with SMTP id
 g1-20020a635201000000b0041e20897174mr12997948pgb.519.1660554155392; 
 Mon, 15 Aug 2022 02:02:35 -0700 (PDT)
Received: from DESKTOP-IBN2BAQ.localdomain ([123.110.155.185])
 by smtp.gmail.com with ESMTPSA id
 a17-20020a656411000000b00412a708f38asm5491612pgv.35.2022.08.15.02.02.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 02:02:35 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 linux@roeck-us.net, heikki.krogerus@linux.intel.com, deller@gmx.de,
 broonie@kernel.org, mazziesaccount@gmail.com, lgirdwood@gmail.com,
 andriy.shevchenko@linux.intel.com
Subject: [RESEND PATCH v8 06/12] lib: add linear range index macro
Date: Mon, 15 Aug 2022 17:01:19 +0800
Message-Id: <20220815090125.27705-7-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220815090125.27705-1-peterwu.pub@gmail.com>
References: <20220815090125.27705-1-peterwu.pub@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 szunichen@gmail.com, alice_chen@richtek.com, linux-pm@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 cy_huang@richtek.com, chiaen_wu@richtek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ChiaEn Wu <chiaen_wu@richtek.com>

Add linear_range_idx macro for declaring the linear_range struct simply.

Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
---
 include/linux/linear_range.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/linux/linear_range.h b/include/linux/linear_range.h
index fd3d0b358f22..fb53ea13c593 100644
--- a/include/linux/linear_range.h
+++ b/include/linux/linear_range.h
@@ -26,6 +26,14 @@ struct linear_range {
 	unsigned int step;
 };
 
+#define LINEAR_RANGE_IDX(_min, _min_sel, _max_sel, _step)	\
+	{							\
+		.min = _min,					\
+		.min_sel = _min_sel,				\
+		.max_sel = _max_sel,				\
+		.step = _step,					\
+	}
+
 unsigned int linear_range_values_in_range(const struct linear_range *r);
 unsigned int linear_range_values_in_range_array(const struct linear_range *r,
 						int ranges);
-- 
2.34.1

