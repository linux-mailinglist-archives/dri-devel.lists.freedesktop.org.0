Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BC72DB29
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 12:57:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98E586E2AB;
	Wed, 29 May 2019 10:57:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FE7B6E2A9
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 10:57:04 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id 196so389455pgc.6
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 03:57:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iSfl8JfPaQ3eWtHD/XH3XcXi2ZhQvwGTja3e/CsvDhE=;
 b=oXQHDOdmKEgEkwX2L0TueQCd0uP9+mvP0bNMSlgD9nUzXypzIfhdN1mVXcWS/3bI38
 xGq8rczzd8PE6Yp1t5plerm8y0g3Qo/309HwGZUAHKtuXodscqLnB3FhNlLBrsrrrBw9
 GJL/8b6F4rzuCKGTWrsQI5uJBSNTgt4kZR756Jd3EbBiHu75nQqLI8bzRmJ16wBd35QF
 t3eZgSlg5nOqPs3YOnSepmhP0SIPT3mxWQA/e5iZJZrq63MrYJ9rw9O4FVrTD7pUlqkC
 URPG2FC3WDmW9BgL94NsviQ1Ds3fzllK+nQ+E29b4Ji+eVY9Di7p7Zq2TyVt8qKqEZCV
 Loog==
X-Gm-Message-State: APjAAAX6S/olDR4sEQPk47a0grczANZMR6BGEVfbSnq/TSUN5Mrk5Hm+
 SjeCzfui1ESve6wyo+X12V5LAg==
X-Google-Smtp-Source: APXvYqwjQXmck+YR2a+RbiuBNeM9299Ahq/O4xsRX52B+BRoeJVrH63dlJOqwyKqlbylxBRGMHiCMQ==
X-Received: by 2002:a17:90a:240c:: with SMTP id
 h12mr11640162pje.12.1559127419415; 
 Wed, 29 May 2019 03:56:59 -0700 (PDT)
Received: from localhost.localdomain ([49.206.202.218])
 by smtp.gmail.com with ESMTPSA id 184sm18974479pfa.48.2019.05.29.03.56.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 May 2019 03:56:58 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v9 4/9] drm/sun4i: dsi: Add Allwinner A64 MIPI DSI support
Date: Wed, 29 May 2019 16:26:10 +0530
Message-Id: <20190529105615.14027-5-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190529105615.14027-1-jagan@amarulasolutions.com>
References: <20190529105615.14027-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iSfl8JfPaQ3eWtHD/XH3XcXi2ZhQvwGTja3e/CsvDhE=;
 b=BqMnNZJPVSyBNKhXZnG6jfq6xiFnuJvAVG5+M7y4c5sF/jqrlNUUSyuZGwy9Ue1GAl
 /ZCmlEhIuIZTCKvvoYUcUillYwzG0xAmYGy4+fzPByhP8dxCPBpbm0pgxJ2zppZ+Te2Y
 BZ4uWoRTtZDRHvbsNoPw0gJh6BQWkj2hEe6LM=
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
Cc: devicetree@vger.kernel.org, Ryan Pannell <ryan@osukl.com>,
 bshah@mykolab.com, linux-sunxi@googlegroups.com,
 Jagan Teki <jagan@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Sergey Suloev <ssuloev@orpaltech.com>
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
NmlfbWlwaV9kc2kuYwppbmRleCBlZjg3ODE3NWE3OWIuLmRkNjhmZDA4ODhjOSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjZpX21pcGlfZHNpLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL3N1bjRpL3N1bjZpX21pcGlfZHNpLmMKQEAgLTEzMDQsMTEgKzEzMDQsMTggQEAgc3Rh
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
