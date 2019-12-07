Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D23115CAC
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2019 15:04:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50AA26E1A2;
	Sat,  7 Dec 2019 14:04:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B48966E199
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Dec 2019 14:04:40 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id e10so10697380ljj.6
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Dec 2019 06:04:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9ajEOdCUpT16GVN8gH4RbvIy9yc0BScTRBZ/ljCGiME=;
 b=jZIiaiMI1uXfE3HSzsAqlj9EJhlHkJt/LoaGEI+yyGvkt7M4kcmEfYyS4GEE5AVCDq
 OushoIT7KWz7eWKCEQFVqNn/KWipvfb6C85s3KXJlc320POtW6QDjPgPYeafsCwUjDnJ
 dktlWonvT3Nti4gLz2r0dgf9mczp/L39MTXufe0dfzZr94GAlChqE+TNIkh8a0XQl4v6
 WrfLFBlJTL90TyU0B9kL4XpenA7oeXHPRbEmzRFKIn21cbcGkYomkeOO/U9THnVD5xNm
 mXUOSnjqMayPZi0w5JgqWTqTNCAUOVLMwJMrCS/6h5pEHMds66KkiKH2B7xtr1ZQUdKi
 3o9g==
X-Gm-Message-State: APjAAAWOlEdd0r8Y+7p5zp7UlSCzddyIoixz1GHCY+thCE0Vc+dCdhmK
 y80lKY2ldwQ3rGrLoQ1PD22f7m9d2MM8Dw==
X-Google-Smtp-Source: APXvYqzCbSGlblzAZsh3pGQCv4tblDf1OnHgS/cPV5hd9q+X+WS1X5hlR+rDAbIA4PDjxaKo1Ddq2Q==
X-Received: by 2002:a2e:9890:: with SMTP id b16mr11789523ljj.190.1575727478849; 
 Sat, 07 Dec 2019 06:04:38 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 w17sm5644188lfn.22.2019.12.07.06.04.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2019 06:04:38 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linus Walleij <linus.walleij@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 16/25] drm/panel: raydium-rm68200: use drm_panel backlight
 support
Date: Sat,  7 Dec 2019 15:03:44 +0100
Message-Id: <20191207140353.23967-17-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191207140353.23967-1-sam@ravnborg.org>
References: <20191207140353.23967-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9ajEOdCUpT16GVN8gH4RbvIy9yc0BScTRBZ/ljCGiME=;
 b=del00zw1hnJOSv6lindha+LEL+pXCeIab6795BI3uAGU4qQMEuuUbjQwOGzbrRfYnV
 sLSpfj7wW3bvryQATj7Q51EwRQD7wRWf62nDjfn6BJFcMaN5LBIhK6IJMt0XJ1Ebfo6J
 XUVLV3X2Ol3AiWrAA9fIpAo3H6pPHhti2T+aMNzt8UWn1Bt5wiHgZX3ad8qBtPltlD/C
 46l3GHw3p5o3zqTX2ZlVW52Bzx2xLd494I1jvveB4FXyii3QJbWyltaWAjdwlm7zXUoI
 jqbYvwE1QXqvMA4YnM5UQcphd58kDP+oaaRq+YP7wmtRkB5l6+6cYecRYZcs/vzQN+4A
 dMQQ==
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Jagan Teki <jagan@amarulasolutions.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jitao Shi <jitao.shi@mediatek.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-mediatek@lists.infradead.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 linux-tegra@vger.kernel.org, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, Purism Kernel Team <kernel@puri.sm>,
 linux-renesas-soc@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlIHRoZSBiYWNrbGlnaHQgc3VwcG9ydCBpbiBkcm1fcGFuZWwgdG8gc2ltcGxpZnkgdGhlIGRy
aXZlcgoKU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpSZXZp
ZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQu
Y29tPgpDYzogVGhpZXJyeSBSZWRpbmcgPHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbT4KQ2M6IFNh
bSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwv
cGFuZWwtcmF5ZGl1bS1ybTY4MjAwLmMgfCAxNSArKysrKy0tLS0tLS0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCA1IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1yYXlkaXVtLXJtNjgyMDAuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9wYW5lbC9wYW5lbC1yYXlkaXVtLXJtNjgyMDAuYwppbmRleCBkNmEwMzMyOGU1OTQuLmU4OTgy
OTQ4ZTBlYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXJheWRpdW0t
cm02ODIwMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1yYXlkaXVtLXJtNjgy
MDAuYwpAQCAtNiw5ICs2LDkgQEAKICAqICAgICAgICAgIFlhbm5pY2sgRmVydHJlIDx5YW5uaWNr
LmZlcnRyZUBzdC5jb20+CiAgKi8KIAotI2luY2x1ZGUgPGxpbnV4L2JhY2tsaWdodC5oPgogI2lu
Y2x1ZGUgPGxpbnV4L2RlbGF5Lmg+CiAjaW5jbHVkZSA8bGludXgvZ3Bpby9jb25zdW1lci5oPgor
I2luY2x1ZGUgPGxpbnV4L21vZF9kZXZpY2V0YWJsZS5oPgogI2luY2x1ZGUgPGxpbnV4L21vZHVs
ZS5oPgogI2luY2x1ZGUgPGxpbnV4L3JlZ3VsYXRvci9jb25zdW1lci5oPgogCkBAIC03OCw3ICs3
OCw2IEBAIHN0cnVjdCBybTY4MjAwIHsKIAlzdHJ1Y3QgZHJtX3BhbmVsIHBhbmVsOwogCXN0cnVj
dCBncGlvX2Rlc2MgKnJlc2V0X2dwaW87CiAJc3RydWN0IHJlZ3VsYXRvciAqc3VwcGx5OwotCXN0
cnVjdCBiYWNrbGlnaHRfZGV2aWNlICpiYWNrbGlnaHQ7CiAJYm9vbCBwcmVwYXJlZDsKIAlib29s
IGVuYWJsZWQ7CiB9OwpAQCAtMjQyLDggKzI0MSw2IEBAIHN0YXRpYyBpbnQgcm02ODIwMF9kaXNh
YmxlKHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsKQogCWlmICghY3R4LT5lbmFibGVkKQogCQlyZXR1
cm4gMDsKIAotCWJhY2tsaWdodF9kaXNhYmxlKGN0eC0+YmFja2xpZ2h0KTsKLQogCWN0eC0+ZW5h
YmxlZCA9IGZhbHNlOwogCiAJcmV0dXJuIDA7CkBAIC0zMjgsOCArMzI1LDYgQEAgc3RhdGljIGlu
dCBybTY4MjAwX2VuYWJsZShzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCkKIAlpZiAoY3R4LT5lbmFi
bGVkKQogCQlyZXR1cm4gMDsKIAotCWJhY2tsaWdodF9lbmFibGUoY3R4LT5iYWNrbGlnaHQpOwot
CiAJY3R4LT5lbmFibGVkID0gdHJ1ZTsKIAogCXJldHVybiAwOwpAQCAtMzkyLDEwICszODcsNiBA
QCBzdGF0aWMgaW50IHJtNjgyMDBfcHJvYmUoc3RydWN0IG1pcGlfZHNpX2RldmljZSAqZHNpKQog
CQlyZXR1cm4gcmV0OwogCX0KIAotCWN0eC0+YmFja2xpZ2h0ID0gZGV2bV9vZl9maW5kX2JhY2ts
aWdodChkZXYpOwotCWlmIChJU19FUlIoY3R4LT5iYWNrbGlnaHQpKQotCQlyZXR1cm4gUFRSX0VS
UihjdHgtPmJhY2tsaWdodCk7Ci0KIAltaXBpX2RzaV9zZXRfZHJ2ZGF0YShkc2ksIGN0eCk7CiAK
IAljdHgtPmRldiA9IGRldjsKQEAgLTQwOCw2ICszOTksMTAgQEAgc3RhdGljIGludCBybTY4MjAw
X3Byb2JlKHN0cnVjdCBtaXBpX2RzaV9kZXZpY2UgKmRzaSkKIAlkcm1fcGFuZWxfaW5pdCgmY3R4
LT5wYW5lbCwgZGV2LCAmcm02ODIwMF9kcm1fZnVuY3MsCiAJCSAgICAgICBEUk1fTU9ERV9DT05O
RUNUT1JfRFNJKTsKIAorCXJldCA9IGRybV9wYW5lbF9vZl9iYWNrbGlnaHQoJmN0eC0+cGFuZWwp
OworCWlmIChyZXQpCisJCXJldHVybiByZXQ7CisKIAlkcm1fcGFuZWxfYWRkKCZjdHgtPnBhbmVs
KTsKIAogCXJldCA9IG1pcGlfZHNpX2F0dGFjaChkc2kpOwotLSAKMi4yMC4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
