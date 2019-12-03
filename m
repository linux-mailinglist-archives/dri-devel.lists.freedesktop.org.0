Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 166B910FF29
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 14:49:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 120226E554;
	Tue,  3 Dec 2019 13:48:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3391E6E554
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 13:48:56 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id l24so1721780pgk.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2019 05:48:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GvY7EGGLO25a5o48qmefaws4aAtPmG5PqqVM+V2F2v0=;
 b=SjRR7x9qydb/Z8iZwreBqkX0aEmZbta8RRLcGY46OgB03XN75Wp1pBOn4IsFqhuoD6
 AA4Fv41HWriYByc86WuE5Of443D1w2o1J8wQPWvZ81f+xMLnNRDZ97EiEt/+Jt5JWnGn
 sdrjbIPinFQ2XoTO27e6vXUq7dCfCDhgu+FctRMFk38ZM5b9S6R6aHoMeFSo+5BS0JAv
 nRngcQadqF2g6npjm8x3STmpRz+TkNEnvVO+0Tle82wHXbJ1VzmuAWIXYTQER7NWCn87
 o/B9bDPP8hnPZsQmN1y+e/o7gutfvY2yo4N1F25lEw6AzrR61bm57isTh56Bw8UFu5pg
 8Aig==
X-Gm-Message-State: APjAAAX/lHBjB422DoRahy2STYZPfPcIzXgWoh0bMRIs6kcaikDf8hLC
 X4oJrGja/3w2L2oh3kLum/wftA==
X-Google-Smtp-Source: APXvYqwm0cu3OUOj7mGNRPnxcAIXp99P9fa7KifqYH6jQUxCZrws2pFbIgmk6iPHa24PSNgZI5cxGA==
X-Received: by 2002:a63:101:: with SMTP id 1mr5341092pgb.336.1575380935648;
 Tue, 03 Dec 2019 05:48:55 -0800 (PST)
Received: from localhost.localdomain ([115.97.190.29])
 by smtp.gmail.com with ESMTPSA id y144sm4397892pfb.188.2019.12.03.05.48.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2019 05:48:55 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v12 5/7] drm/sun4i: dsi: Add Allwinner A64 MIPI DSI support
Date: Tue,  3 Dec 2019 19:18:14 +0530
Message-Id: <20191203134816.5319-6-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20191203134816.5319-1-jagan@amarulasolutions.com>
References: <20191203134816.5319-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GvY7EGGLO25a5o48qmefaws4aAtPmG5PqqVM+V2F2v0=;
 b=P61OjPv9p9rdBXwWKpdC3BKZ2eG0qALzjaq4PWVhOv0Imk1pU/XdRKWhc/V7jYac6t
 C5RiQZlWUz54FyBSjjP0vgGT3D9vcDvvz944EqNqD68VIRRtcYY0B3vzz+CPeMCq9XiE
 yKGDB5aamTiO66N04pyDT3FNRkzikQI/7Qqe8=
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
PgotLS0KQ2hhbmdlcyBmb3IgdjEyOgotIG5vbmUKCiBkcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3Vu
NmlfbWlwaV9kc2kuYyB8IDcgKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW42aV9taXBpX2RzaS5jIGIv
ZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjZpX21pcGlfZHNpLmMKaW5kZXggNjA4NWFkMmVhZmMz
Li4zNGE2NDQ3M2RkMDkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW42aV9t
aXBpX2RzaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW42aV9taXBpX2RzaS5jCkBA
IC0xMjcwLDExICsxMjcwLDE4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc3VuNmlfZHNpX3Zhcmlh
bnQgc3VuNmlfYTMxX21pcGlfZHNpID0gewogCS5oYXNfbW9kX2NsayA9IHRydWUsCiB9OwogCitz
dGF0aWMgY29uc3Qgc3RydWN0IHN1bjZpX2RzaV92YXJpYW50IHN1bjUwaV9hNjRfbWlwaV9kc2kg
PSB7Cit9OworCiBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBzdW42aV9kc2lfb2Zf
dGFibGVbXSA9IHsKIAl7CiAJCS5jb21wYXRpYmxlID0gImFsbHdpbm5lcixzdW42aS1hMzEtbWlw
aS1kc2kiLAogCQkuZGF0YSA9ICZzdW42aV9hMzFfbWlwaV9kc2ksCiAJfSwKKwl7CisJCS5jb21w
YXRpYmxlID0gImFsbHdpbm5lcixzdW41MGktYTY0LW1pcGktZHNpIiwKKwkJLmRhdGEgPSAmc3Vu
NTBpX2E2NF9taXBpX2RzaSwKKwl9LAogCXsgLyogc2VudGluZWwgKi8gfQogfTsKIE1PRFVMRV9E
RVZJQ0VfVEFCTEUob2YsIHN1bjZpX2RzaV9vZl90YWJsZSk7Ci0tIAoyLjE4LjAuMzIxLmdmZmM2
ZmEwZTMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
