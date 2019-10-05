Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD514CCA55
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2019 16:19:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37F276E379;
	Sat,  5 Oct 2019 14:19:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E7E46E378
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Oct 2019 14:19:41 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id 23so5437976pgk.3
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Oct 2019 07:19:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3NxA/Yr80iVxdKub81APPkpdy1Qml/Yl3GutfXi9RDc=;
 b=IJl4n1bInXIMRVCF+9B+nDcVPNz+lbCWP2S9CGm+Ajwt3dQglTfIT7tvsXS/pcmiG1
 1PzSCLFJORAUMZoBcJPiKpu1wYecD7X6BUks1fXtoaLfAld2AR9WyiW1u9pb3CAuNiA9
 N4TRVhShIs7k6/gNFGt1BayJHzJYGBHmZ/X9p4z9yJdcCIDQAZgO825OJfUUJxN2KuMJ
 VTl1yM59sf5T6dJqPqKnKV0fwa5Pva1wZeU7w+7K61aFthZBy2KTCD74EcutqjIeRSxb
 LZhjn3yBJGZidzgo/IO+ArguqzGQH8brxGUeWHUmEgqsg1d6nq32T9YlHwn0r0NQv9pW
 M7SA==
X-Gm-Message-State: APjAAAWg48pUJ5C+o+HN40BcVOC1GinFngtXJhnXSnDyYF0t3mTJzEYh
 lpTENohPfOEACPShssqq6xgIeQ==
X-Google-Smtp-Source: APXvYqwOS0LD2HS1m+5XKVlRht04+Vt6iAydlUtKPt+uRbbxb1fyadX5tNpeeaNlC31fEo7gW7E91A==
X-Received: by 2002:a65:5802:: with SMTP id g2mr22108678pgr.333.1570285180636; 
 Sat, 05 Oct 2019 07:19:40 -0700 (PDT)
Received: from localhost.localdomain ([115.97.180.31])
 by smtp.gmail.com with ESMTPSA id y138sm8977604pfb.174.2019.10.05.07.19.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Oct 2019 07:19:40 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v10 4/6] drm/sun4i: dsi: Add Allwinner A64 MIPI DSI support
Date: Sat,  5 Oct 2019 19:49:11 +0530
Message-Id: <20191005141913.22020-5-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20191005141913.22020-1-jagan@amarulasolutions.com>
References: <20191005141913.22020-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3NxA/Yr80iVxdKub81APPkpdy1Qml/Yl3GutfXi9RDc=;
 b=YrrSlKQWQDx5ylGAdfIauv3lHB9Oak4L4iNrX08dGdQzvNF/GVgM5ikcJkkw4Yoaod
 LtTeWc+LKQ3n+2Fa3x8B4YL2a3EMIGzcOcxkU5SVsUJRn2Ll8ktBt1Yej3mlX8Rfozcy
 Y6sMA31Cpm/jDWq/o0rSo969bolIAGnpTHibQ=
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
 linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
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
NmlfbWlwaV9kc2kuYwppbmRleCA2NzI0YTE0YzgxNmQuLmUzYWFiODE1ZmE3MyAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjZpX21pcGlfZHNpLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL3N1bjRpL3N1bjZpX21pcGlfZHNpLmMKQEAgLTEyNDEsMTEgKzEyNDEsMTggQEAgc3Rh
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
