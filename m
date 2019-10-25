Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB2FE52AE
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 19:57:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CA4D6EB31;
	Fri, 25 Oct 2019 17:57:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0DD26EB31
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 17:57:13 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id s17so1630213plp.6
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 10:57:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P+ShWs2FSM+vAO8pDJrhjeu0D2BHwDqE1SNacXjaIBI=;
 b=VZb6mCVHWIPTLWDkfLb0a+3icrk5yWVllQKv/MQwfDfX92mlWLEOu3vbGySD9kkR65
 yKczXXjC6FEFAYjXYjmyIr5mGZg/6JfmrAJ5GG/xeT6ZboFM7pBH9E538ulHNqH8zvYD
 fj8iGAHgFaotonUEFMfX0nOQ3d0/Grji+Tyv08PoJEfC3zLSnS9uCV0O73uuUiCJckgp
 v6z0M7wCq3as2vOXQSgf/JwbUdqeqs4CW48P7SvE1E/U1QeGr2l8wknGRt1rNu+yhU5H
 UstbCG2SU2w9M6wSDsM/yU0En5RlyItuBcM5b4GkC4z93c+DiIRSv6xG2za+YRnykXLr
 9WxA==
X-Gm-Message-State: APjAAAVGzp3IcvJWs+0fcCeJkE5K56HK3c4MKVQb2oe8f6lE91rXiO0R
 RAuYz3dQAY5BIjDrI5khpBtcjA==
X-Google-Smtp-Source: APXvYqy2y4it2bBHhmVAciL+iQ/Bchja3gPtyMwHbnVNaDVG+gfU16WxFFqSrCI2gyiaQnXpjxrzxQ==
X-Received: by 2002:a17:902:6b45:: with SMTP id
 g5mr5151240plt.336.1572026233355; 
 Fri, 25 Oct 2019 10:57:13 -0700 (PDT)
Received: from localhost.localdomain ([115.97.180.31])
 by smtp.gmail.com with ESMTPSA id n15sm2926580pfq.146.2019.10.25.10.57.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 10:57:12 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v11 5/7] drm/sun4i: dsi: Add Allwinner A64 MIPI DSI support
Date: Fri, 25 Oct 2019 23:26:23 +0530
Message-Id: <20191025175625.8011-6-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20191025175625.8011-1-jagan@amarulasolutions.com>
References: <20191025175625.8011-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P+ShWs2FSM+vAO8pDJrhjeu0D2BHwDqE1SNacXjaIBI=;
 b=GCFIrxMGvDu4anO9yWv5FSLPtn8GCu9UGwWlSFs+9Savi7Bbo5hViLED9RYTD7MP6H
 54jW5B3P3KfDJv9wUhchHXM4A2Thg4kojn3iT/MQ8+92+dzX/eXAyN+wqpiDReGizoaR
 Bc2Per+UzIOICEBJHScoH1tu4uvnM1QLWBU7A=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi <linux-sunxi@googlegroups.com>,
 Jagan Teki <jagan@amarulasolutions.com>, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIE1JUEkgRFNJIGNvbnRyb2xsZXIgaW4gQWxsd2lubmVyIEE2NCBpcyBzaW1pbGFyIHRvIEEz
My4KCkJ1dCB1bmxpa2UgQTMzLCBBNjQgZG9lc24ndCBoYXZlIERTSV9TQ0xLIGdhdGluZyBzbyBh
ZGQgY29tcGF0aWJsZQpmb3IgQWxsd2lubmVyIEE2NCB3aXRoIHVuaW5pdGlhbGl6ZWQgaGFzX21v
ZF9jbGsgZHJpdmVyLgoKU2lnbmVkLW9mZi1ieTogSmFnYW4gVGVraSA8amFnYW5AYW1hcnVsYXNv
bHV0aW9ucy5jb20+ClRlc3RlZC1ieTogTWVybGlqbiBXYWplciA8bWVybGlqbkB3aXp6dXAub3Jn
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW42aV9taXBpX2RzaS5jIHwgNyArKysrKysr
CiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3N1bjRpL3N1bjZpX21pcGlfZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3Vu
NmlfbWlwaV9kc2kuYwppbmRleCBlYWNkZmNmZjY0YWQuLjRkZGE5NmUwZmViZCAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjZpX21pcGlfZHNpLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL3N1bjRpL3N1bjZpX21pcGlfZHNpLmMKQEAgLTEyNTEsMTEgKzEyNTEsMTggQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBzdW42aV9kc2lfdmFyaWFudCBzdW42aV9hMzFfbWlwaV9kc2kgPSB7
CiAJLmhhc19tb2RfY2xrID0gdHJ1ZSwKIH07CiAKK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgc3VuNmlf
ZHNpX3ZhcmlhbnQgc3VuNTBpX2E2NF9taXBpX2RzaSA9IHsKK307CisKIHN0YXRpYyBjb25zdCBz
dHJ1Y3Qgb2ZfZGV2aWNlX2lkIHN1bjZpX2RzaV9vZl90YWJsZVtdID0gewogCXsKIAkJLmNvbXBh
dGlibGUgPSAiYWxsd2lubmVyLHN1bjZpLWEzMS1taXBpLWRzaSIsCiAJCS5kYXRhID0gJnN1bjZp
X2EzMV9taXBpX2RzaSwKIAl9LAorCXsKKwkJLmNvbXBhdGlibGUgPSAiYWxsd2lubmVyLHN1bjUw
aS1hNjQtbWlwaS1kc2kiLAorCQkuZGF0YSA9ICZzdW41MGlfYTY0X21pcGlfZHNpLAorCX0sCiAJ
eyAvKiBzZW50aW5lbCAqLyB9CiB9OwogTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgc3VuNmlfZHNp
X29mX3RhYmxlKTsKLS0gCjIuMTguMC4zMjEuZ2ZmYzZmYTBlMwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
