Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E185115CA7
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2019 15:04:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F5936E198;
	Sat,  7 Dec 2019 14:04:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ED826E198
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Dec 2019 14:04:37 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id u17so10723932lja.4
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Dec 2019 06:04:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=QgFTzPZd3zR98m50NY0shuKpKVuv4VS4hyjW7Qv2Omk=;
 b=mA3yRzl4HXemOlUgRWTUOhnnXGQPcfkM2wjrusgC1P/sTxVa3UZymQktfAxkWp/Xdd
 l9L+4gdq3kZxvbiOisLmoSw7DZPGAhmeKyPJWPbY638qlDU2TEuTw56nfzrL42BX+2eb
 yRLIIdFtRgdsWhz4/2QxqQv5yOC+S0W2h5I5us8OeuktJ6tnWtxQtzF15yZb7N6ixQ16
 JaUfLqZmHOumS/OhV+hdFQutASFuoKPDvHOH4UxnB+w0tYkM+XRZttCQn5e9nsvWCwu1
 5Sj51q6mCG0AXwfxP6KXLi9u3lVXKWmJdmaGOUFiTZ5ejg0XENnjvrk46Dm83LNiZzpg
 VpsQ==
X-Gm-Message-State: APjAAAUC3kBF9IpRpaxJW9MGm+ZdkrMsQRF/LcYXt4I4nk4ogFWGt8bg
 4SkXRXidCy3DFUj7MSRSEUZACZNmj2YcWg==
X-Google-Smtp-Source: APXvYqwqO/B3zDP/lU5w3BMKEFkPcSjN9evJVHeZCNcA2LQ9S+SRHMryllzKBI+PlPdvQ9Zo/y8d+Q==
X-Received: by 2002:a2e:9b58:: with SMTP id o24mr11509631ljj.197.1575727475273; 
 Sat, 07 Dec 2019 06:04:35 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 w17sm5644188lfn.22.2019.12.07.06.04.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2019 06:04:34 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linus Walleij <linus.walleij@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 14/25] drm/panel: osd-osd101t2587-53ts: use drm_panel
 backlight support
Date: Sat,  7 Dec 2019 15:03:42 +0100
Message-Id: <20191207140353.23967-15-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191207140353.23967-1-sam@ravnborg.org>
References: <20191207140353.23967-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QgFTzPZd3zR98m50NY0shuKpKVuv4VS4hyjW7Qv2Omk=;
 b=jrIBA/vqZodxViATSQARFkZD7wiEmAHsUlNjZymh8plju65SezxDVb232LWzAO7ZIW
 kFmv4T1O4tF5vglDYs7mo4WPhnmXCBga6BPzrqpFEBPGLxUnHCEBoSwvhJwtj7oRuhlS
 6rwymBSXbUJPHSE7F/TU8cIy0yfuhOGxq2EqTEjr+GR83yUN1lmmKWt05j/V1aizGnHO
 wgK6mWeVCzmN88mPT83aIwPcsTK3vHQyFbEpBjVUFt4zCSV0mYD0xYZ3Pshw39dUtj4c
 43kY3UcyVgHIbBrvs4Oc2i2daiu7MlFv1k5I9puW67OdIwCy5GI7bOhctWxExoJ6EIrm
 kodA==
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
bSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KLS0tCiAuLi4vZHJtL3BhbmVsL3BhbmVsLW9z
ZC1vc2QxMDF0MjU4Ny01M3RzLmMgICAgfCAyNCArKysrKysrLS0tLS0tLS0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtb3NkLW9zZDEwMXQyNTg3LTUzdHMuYyBiL2RyaXZl
cnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1vc2Qtb3NkMTAxdDI1ODctNTN0cy5jCmluZGV4IDI3MzRi
NDgzNWRmYS4uM2EwMjI5ZDYwMDk1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwv
cGFuZWwtb3NkLW9zZDEwMXQyNTg3LTUzdHMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwv
cGFuZWwtb3NkLW9zZDEwMXQyNTg3LTUzdHMuYwpAQCAtNCw3ICs0LDYgQEAKICAqICBBdXRob3I6
IFBldGVyIFVqZmFsdXNpIDxwZXRlci51amZhbHVzaUB0aS5jb20+CiAgKi8KIAotI2luY2x1ZGUg
PGxpbnV4L2JhY2tsaWdodC5oPgogI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgogI2luY2x1ZGUg
PGxpbnV4L29mLmg+CiAjaW5jbHVkZSA8bGludXgvcmVndWxhdG9yL2NvbnN1bWVyLmg+CkBAIC0y
MCw3ICsxOSw2IEBAIHN0cnVjdCBvc2QxMDF0MjU4N19wYW5lbCB7CiAJc3RydWN0IGRybV9wYW5l
bCBiYXNlOwogCXN0cnVjdCBtaXBpX2RzaV9kZXZpY2UgKmRzaTsKIAotCXN0cnVjdCBiYWNrbGln
aHRfZGV2aWNlICpiYWNrbGlnaHQ7CiAJc3RydWN0IHJlZ3VsYXRvciAqc3VwcGx5OwogCiAJYm9v
bCBwcmVwYXJlZDsKQEAgLTQyLDggKzQwLDYgQEAgc3RhdGljIGludCBvc2QxMDF0MjU4N19wYW5l
bF9kaXNhYmxlKHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsKQogCWlmICghb3NkMTAxdDI1ODctPmVu
YWJsZWQpCiAJCXJldHVybiAwOwogCi0JYmFja2xpZ2h0X2Rpc2FibGUob3NkMTAxdDI1ODctPmJh
Y2tsaWdodCk7Ci0KIAlyZXQgPSBtaXBpX2RzaV9zaHV0ZG93bl9wZXJpcGhlcmFsKG9zZDEwMXQy
NTg3LT5kc2kpOwogCiAJb3NkMTAxdDI1ODctPmVuYWJsZWQgPSBmYWxzZTsKQEAgLTkxLDggKzg3
LDYgQEAgc3RhdGljIGludCBvc2QxMDF0MjU4N19wYW5lbF9lbmFibGUoc3RydWN0IGRybV9wYW5l
bCAqcGFuZWwpCiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKIAotCWJhY2tsaWdodF9lbmFibGUo
b3NkMTAxdDI1ODctPmJhY2tsaWdodCk7Ci0KIAlvc2QxMDF0MjU4Ny0+ZW5hYmxlZCA9IHRydWU7
CiAKIAlyZXR1cm4gcmV0OwpAQCAtMTU4LDE4ICsxNTIsMTkgQEAgTU9EVUxFX0RFVklDRV9UQUJM
RShvZiwgb3NkMTAxdDI1ODdfb2ZfbWF0Y2gpOwogc3RhdGljIGludCBvc2QxMDF0MjU4N19wYW5l
bF9hZGQoc3RydWN0IG9zZDEwMXQyNTg3X3BhbmVsICpvc2QxMDF0MjU4NykKIHsKIAlzdHJ1Y3Qg
ZGV2aWNlICpkZXYgPSAmb3NkMTAxdDI1ODctPmRzaS0+ZGV2OworCWludCByZXQ7CiAKIAlvc2Qx
MDF0MjU4Ny0+c3VwcGx5ID0gZGV2bV9yZWd1bGF0b3JfZ2V0KGRldiwgInBvd2VyIik7CiAJaWYg
KElTX0VSUihvc2QxMDF0MjU4Ny0+c3VwcGx5KSkKIAkJcmV0dXJuIFBUUl9FUlIob3NkMTAxdDI1
ODctPnN1cHBseSk7CiAKLQlvc2QxMDF0MjU4Ny0+YmFja2xpZ2h0ID0gZGV2bV9vZl9maW5kX2Jh
Y2tsaWdodChkZXYpOwotCWlmIChJU19FUlIob3NkMTAxdDI1ODctPmJhY2tsaWdodCkpCi0JCXJl
dHVybiBQVFJfRVJSKG9zZDEwMXQyNTg3LT5iYWNrbGlnaHQpOwotCiAJZHJtX3BhbmVsX2luaXQo
Jm9zZDEwMXQyNTg3LT5iYXNlLCAmb3NkMTAxdDI1ODctPmRzaS0+ZGV2LAogCQkgICAgICAgJm9z
ZDEwMXQyNTg3X3BhbmVsX2Z1bmNzLCBEUk1fTU9ERV9DT05ORUNUT1JfRFNJKTsKIAorCXJldCA9
IGRybV9wYW5lbF9vZl9iYWNrbGlnaHQoJm9zZDEwMXQyNTg3LT5iYXNlKTsKKwlpZiAocmV0KQor
CQlyZXR1cm4gcmV0OworCiAJcmV0dXJuIGRybV9wYW5lbF9hZGQoJm9zZDEwMXQyNTg3LT5iYXNl
KTsKIH0KIApAQCAtMjE1LDEyICsyMTAsMTEgQEAgc3RhdGljIGludCBvc2QxMDF0MjU4N19wYW5l
bF9yZW1vdmUoc3RydWN0IG1pcGlfZHNpX2RldmljZSAqZHNpKQogCXN0cnVjdCBvc2QxMDF0MjU4
N19wYW5lbCAqb3NkMTAxdDI1ODcgPSBtaXBpX2RzaV9nZXRfZHJ2ZGF0YShkc2kpOwogCWludCBy
ZXQ7CiAKLQlyZXQgPSBvc2QxMDF0MjU4N19wYW5lbF9kaXNhYmxlKCZvc2QxMDF0MjU4Ny0+YmFz
ZSk7CisJcmV0ID0gZHJtX3BhbmVsX2Rpc2FibGUoJm9zZDEwMXQyNTg3LT5iYXNlKTsKIAlpZiAo
cmV0IDwgMCkKIAkJZGV2X3dhcm4oJmRzaS0+ZGV2LCAiZmFpbGVkIHRvIGRpc2FibGUgcGFuZWw6
ICVkXG4iLCByZXQpOwogCi0Jb3NkMTAxdDI1ODdfcGFuZWxfdW5wcmVwYXJlKCZvc2QxMDF0MjU4
Ny0+YmFzZSk7Ci0KKwlkcm1fcGFuZWxfdW5wcmVwYXJlKCZvc2QxMDF0MjU4Ny0+YmFzZSk7CiAJ
ZHJtX3BhbmVsX3JlbW92ZSgmb3NkMTAxdDI1ODctPmJhc2UpOwogCiAJcmV0ID0gbWlwaV9kc2lf
ZGV0YWNoKGRzaSk7CkBAIC0yMzQsOCArMjI4LDggQEAgc3RhdGljIHZvaWQgb3NkMTAxdDI1ODdf
cGFuZWxfc2h1dGRvd24oc3RydWN0IG1pcGlfZHNpX2RldmljZSAqZHNpKQogewogCXN0cnVjdCBv
c2QxMDF0MjU4N19wYW5lbCAqb3NkMTAxdDI1ODcgPSBtaXBpX2RzaV9nZXRfZHJ2ZGF0YShkc2kp
OwogCi0Jb3NkMTAxdDI1ODdfcGFuZWxfZGlzYWJsZSgmb3NkMTAxdDI1ODctPmJhc2UpOwotCW9z
ZDEwMXQyNTg3X3BhbmVsX3VucHJlcGFyZSgmb3NkMTAxdDI1ODctPmJhc2UpOworCWRybV9wYW5l
bF9kaXNhYmxlKCZvc2QxMDF0MjU4Ny0+YmFzZSk7CisJZHJtX3BhbmVsX3VucHJlcGFyZSgmb3Nk
MTAxdDI1ODctPmJhc2UpOwogfQogCiBzdGF0aWMgc3RydWN0IG1pcGlfZHNpX2RyaXZlciBvc2Qx
MDF0MjU4N19wYW5lbF9kcml2ZXIgPSB7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
