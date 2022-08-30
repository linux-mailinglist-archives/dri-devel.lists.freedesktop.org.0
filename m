Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBC25A5A3E
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 05:42:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 504A110EA18;
	Tue, 30 Aug 2022 03:42:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8603910EA18
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 03:42:21 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 j9-20020a17090a3e0900b001fd9568b117so6924239pjc.3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 20:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=3iztdmN089REoQPlCSNzlH0JI17HfYILuuDitsqzGPY=;
 b=DnyIRF7nyUAJtZN7g6y9o04lk6jibE1cUQfZIc3+eRhySeCnxnm/MscurEDoGGVBL3
 a8ec3qa1ED8BfJJ8AWswt1mibY29AbLkojUWRS4I0VhClziI179mUYgFqCcwTUdcIF76
 1KW9HFCJQg/565KAZVsMYKeAk234nXwNuxhS2qPwm0Pf7d/8WEacls+q0cNYC+0rGbjO
 FD2OCWB7tgqGlLW7Uck69cEMWzPI8GEuyfG7kgJ2ds+Vlsd9KoSlHKXs+HjXyucOnJ0e
 If76pNDwzyFqcmBlY/MdZS7yyE9/lZmfGweOQxjGkJsW00p7G1cJfliG72k7FURzAuRd
 XwcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=3iztdmN089REoQPlCSNzlH0JI17HfYILuuDitsqzGPY=;
 b=HQfiTXC/E7s/jEsw4waF50W/U5uKU3CwWgy2hZLoRqUSJxuNCs5FSaWaVKcTTLIAWD
 iai2sXTFBI+ET9qmwZU7uU1y79C2kVLnR5mckITWn1x9UrHgvuy96Wso4BT/2NOvP+Sy
 ILlgfxxwDk729ZrNMJ4FBZMh43NGXGzLa1zBypn3oNA1ir6Ga2OQYAvzD1hVlWZjLQTo
 UOw5TKq7nLQWpo7RB0+8CE+uYAko73pyYnIPXo3cZG3ASz1TZyMEZB1fw+ciIh/FvWIW
 ouvJyIVO4GC3dcuCj57UfPbPyTGj9iqPxqlxZ4tt8E46GIxdRK0jWPrDnxmYfYEw3SJG
 ig6A==
X-Gm-Message-State: ACgBeo124yPzbkC8+xgIEpUrsxFJNaff8a0g5yL9rVh1LhdjmGP1FExO
 +F2x904pmyQ1qInVVm6rQ2uMcLrXRK0=
X-Google-Smtp-Source: AA6agR46UdRpvqM2r/G6VJkMeDqNmxN0/9MmcW+FxaEZbXO22yNo9RKv1KBD1Fc8SrKzFh3RXA2TTw==
X-Received: by 2002:a17:90b:4d0e:b0:1f7:ae99:4d7f with SMTP id
 mw14-20020a17090b4d0e00b001f7ae994d7fmr21253886pjb.200.1661830941194; 
 Mon, 29 Aug 2022 20:42:21 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-77-88-242.emome-ip.hinet.net.
 [42.77.88.242]) by smtp.gmail.com with ESMTPSA id
 a6-20020a170902ecc600b0016ed5266a5csm8439577plh.170.2022.08.29.20.42.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Aug 2022 20:42:20 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, jic23@kernel.org, lars@metafoo.de,
 deller@gmx.de, broonie@kernel.org, mazziesaccount@gmail.com,
 andriy.shevchenko@linux.intel.com
Subject: [PATCH v9 05/10] lib: add linear range index macro
Date: Tue, 30 Aug 2022 11:40:37 +0800
Message-Id: <20220830034042.9354-6-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220830034042.9354-2-peterwu.pub@gmail.com>
References: <20220830034042.9354-2-peterwu.pub@gmail.com>
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
 alice_chen@richtek.com, linux-pm@vger.kernel.org, linux-iio@vger.kernel.org,
 szunichen@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cy_huang@richtek.com,
 andy.shevchenko@gmail.com, chiaen_wu@richtek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ChiaEn Wu <chiaen_wu@richtek.com>

Add linear_range_idx macro for declaring the linear_range struct simply.

Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
---

v9
- Revise LINEAR_RANGE() and LINEAR_RANGE_IDX()
---
 include/linux/linear_range.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/linux/linear_range.h b/include/linux/linear_range.h
index fd3d0b3..2e4f4c3 100644
--- a/include/linux/linear_range.h
+++ b/include/linux/linear_range.h
@@ -26,6 +26,17 @@ struct linear_range {
 	unsigned int step;
 };
 
+#define LINEAR_RANGE(_min, _min_sel, _max_sel, _step)		\
+	{							\
+		.min = _min,					\
+		.min_sel = _min_sel,				\
+		.max_sel = _max_sel,				\
+		.step = _step,					\
+	}
+
+#define LINEAR_RANGE_IDX(_idx, _min, _min_sel, _max_sel, _step)	\
+	[_idx] = LINEAR_RANGE(_min, _min_sel, _max_sel, _step)
+
 unsigned int linear_range_values_in_range(const struct linear_range *r);
 unsigned int linear_range_values_in_range_array(const struct linear_range *r,
 						int ranges);
-- 
2.7.4

