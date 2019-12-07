Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F18F115CB0
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2019 15:04:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D0666E1A7;
	Sat,  7 Dec 2019 14:04:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEE106E199
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Dec 2019 14:04:38 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id z17so10643097ljk.13
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Dec 2019 06:04:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=nh+auvkxV6hzFWp6G1ySZlQ+h5mj84VTfDwYW3UcNEg=;
 b=bsKhCZkh4KTmARV4C24B4SpcXwZ5/P0CPGapcGT/Ea0GyH3KYrW0Q1vpI0DVWXiePw
 /NuF8dI9RX+RB3+BVOCrGvVgU7pEKx94MWcZmBpY2cwZIQypzKzT3N0Ga4LWReVz2H6q
 /ExHuKPjI4gYumbu9jskmH/zf522SWdPMFWvlBuArExdgTxJwMgNerzeYj8wLj4pn/bl
 A3Dv6h/KuYMUg1ShgCyqyQq+PvWq+pWsv6i4h3B/lWgomY13xmmBuW0TWm+glqFU/ElF
 YQW9ClzvpleYYWc8R+r5cw51laTudKlNrudLFt/0kDuWKyYO2Z12YxY2Br5DirllWArm
 bFlg==
X-Gm-Message-State: APjAAAUuLX7a7uAec9RaGNIQzgcSn8W02jc0m2WvOUQ1KC6iV3pZ88m6
 PgpmUd/v9ZJnzxoj1aiQ3wmVSPKWkP9IRg==
X-Google-Smtp-Source: APXvYqwiY4N+GIwVJEZXPGgmoqNV1sicVH+q4kCFtsUl1LtIrxYJcm5qUL/ngh8pFMnKlvdyCiPdfA==
X-Received: by 2002:a2e:2418:: with SMTP id k24mr12093950ljk.49.1575727477038; 
 Sat, 07 Dec 2019 06:04:37 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 w17sm5644188lfn.22.2019.12.07.06.04.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2019 06:04:36 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linus Walleij <linus.walleij@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 15/25] drm/panel: panasonic-vvx10f034n00: use drm_panel
 backlight support
Date: Sat,  7 Dec 2019 15:03:43 +0100
Message-Id: <20191207140353.23967-16-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191207140353.23967-1-sam@ravnborg.org>
References: <20191207140353.23967-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nh+auvkxV6hzFWp6G1ySZlQ+h5mj84VTfDwYW3UcNEg=;
 b=GLR0ghga41ugllFnX9V68j3o6mCPObjN2evzL1OX/t2lGBgTB8wmIPLgwwMBOpjpDq
 Nk8zbYrhiz40wWzyaxFyDCOx9Qp3c7eNa8A/95q5A1Qqh83tyWD1BVp0y4VctW8mG+WZ
 DAA9mowrjQXH5AcAt80VyzXd/OACUG56WyF75bVLrPavuEBdVpRprBVKB4AV35/ONJLz
 6OVdFjErq0R1IIbK1uTpO/rvDNpe+vSvtO8NekSaF7kbDOnEy/SGbQ4OnXGYt3pmaEeA
 mb8xoiJxNRlo37czxRawcLQfn8YURT2gt7i/+ojRcPc73xXdZuJ4AZGjcgILa50pJKcz
 KvKA==
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
bSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KLS0tCiAuLi4vZHJtL3BhbmVsL3BhbmVsLXBh
bmFzb25pYy12dngxMGYwMzRuMDAuYyAgfCA0NSArKystLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAzOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtcGFuYXNvbmljLXZ2eDEwZjAzNG4wMC5jIGIvZHJp
dmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXBhbmFzb25pYy12dngxMGYwMzRuMDAuYwppbmRleCA1
NzlhYzBkODZlYTQuLjRlMTViZmY1YTFiNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Bh
bmVsL3BhbmVsLXBhbmFzb25pYy12dngxMGYwMzRuMDAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
cGFuZWwvcGFuZWwtcGFuYXNvbmljLXZ2eDEwZjAzNG4wMC5jCkBAIC03LDcgKzcsNiBAQAogICog
QmFzZWQgb24gQVVPIHBhbmVsIGRyaXZlciBieSBSb2IgQ2xhcmsgPHJvYmRjbGFya0BnbWFpbC5j
b20+CiAgKi8KIAotI2luY2x1ZGUgPGxpbnV4L2JhY2tsaWdodC5oPgogI2luY2x1ZGUgPGxpbnV4
L2RlbGF5Lmg+CiAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+CiAjaW5jbHVkZSA8bGludXgvb2Yu
aD4KQEAgLTMxLDcgKzMwLDYgQEAgc3RydWN0IHd1eGdhX250X3BhbmVsIHsKIAlzdHJ1Y3QgZHJt
X3BhbmVsIGJhc2U7CiAJc3RydWN0IG1pcGlfZHNpX2RldmljZSAqZHNpOwogCi0Jc3RydWN0IGJh
Y2tsaWdodF9kZXZpY2UgKmJhY2tsaWdodDsKIAlzdHJ1Y3QgcmVndWxhdG9yICpzdXBwbHk7CiAK
IAlib29sIHByZXBhcmVkOwpAQCAtNjIsMTIgKzYwLDYgQEAgc3RhdGljIGludCB3dXhnYV9udF9w
YW5lbF9kaXNhYmxlKHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsKQogCiAJbWlwaV9yZXQgPSBtaXBp
X2RzaV9zaHV0ZG93bl9wZXJpcGhlcmFsKHd1eGdhX250LT5kc2kpOwogCi0JaWYgKHd1eGdhX250
LT5iYWNrbGlnaHQpIHsKLQkJd3V4Z2FfbnQtPmJhY2tsaWdodC0+cHJvcHMucG93ZXIgPSBGQl9C
TEFOS19QT1dFUkRPV047Ci0JCXd1eGdhX250LT5iYWNrbGlnaHQtPnByb3BzLnN0YXRlIHw9IEJM
X0NPUkVfRkJCTEFOSzsKLQkJYmxfcmV0ID0gYmFja2xpZ2h0X3VwZGF0ZV9zdGF0dXMod3V4Z2Ff
bnQtPmJhY2tsaWdodCk7Ci0JfQotCiAJd3V4Z2FfbnQtPmVuYWJsZWQgPSBmYWxzZTsKIAogCXJl
dHVybiBtaXBpX3JldCA/IG1pcGlfcmV0IDogYmxfcmV0OwpAQCAtMTQyLDEyICsxMzQsNiBAQCBz
dGF0aWMgaW50IHd1eGdhX250X3BhbmVsX2VuYWJsZShzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCkK
IAlpZiAod3V4Z2FfbnQtPmVuYWJsZWQpCiAJCXJldHVybiAwOwogCi0JaWYgKHd1eGdhX250LT5i
YWNrbGlnaHQpIHsKLQkJd3V4Z2FfbnQtPmJhY2tsaWdodC0+cHJvcHMucG93ZXIgPSBGQl9CTEFO
S19VTkJMQU5LOwotCQl3dXhnYV9udC0+YmFja2xpZ2h0LT5wcm9wcy5zdGF0ZSAmPSB+QkxfQ09S
RV9GQkJMQU5LOwotCQliYWNrbGlnaHRfdXBkYXRlX3N0YXR1cyh3dXhnYV9udC0+YmFja2xpZ2h0
KTsKLQl9Ci0KIAl3dXhnYV9udC0+ZW5hYmxlZCA9IHRydWU7CiAKIAlyZXR1cm4gMDsKQEAgLTIw
Niw3ICsxOTIsNiBAQCBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCB3dXhnYV9udF9vZl9tYXRjaCk7
CiBzdGF0aWMgaW50IHd1eGdhX250X3BhbmVsX2FkZChzdHJ1Y3Qgd3V4Z2FfbnRfcGFuZWwgKnd1
eGdhX250KQogewogCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZ3dXhnYV9udC0+ZHNpLT5kZXY7Ci0J
c3RydWN0IGRldmljZV9ub2RlICpucDsKIAlpbnQgcmV0OwogCiAJd3V4Z2FfbnQtPm1vZGUgPSAm
ZGVmYXVsdF9tb2RlOwpAQCAtMjE1LDM4ICsyMDAsMjAgQEAgc3RhdGljIGludCB3dXhnYV9udF9w
YW5lbF9hZGQoc3RydWN0IHd1eGdhX250X3BhbmVsICp3dXhnYV9udCkKIAlpZiAoSVNfRVJSKHd1
eGdhX250LT5zdXBwbHkpKQogCQlyZXR1cm4gUFRSX0VSUih3dXhnYV9udC0+c3VwcGx5KTsKIAot
CW5wID0gb2ZfcGFyc2VfcGhhbmRsZShkZXYtPm9mX25vZGUsICJiYWNrbGlnaHQiLCAwKTsKLQlp
ZiAobnApIHsKLQkJd3V4Z2FfbnQtPmJhY2tsaWdodCA9IG9mX2ZpbmRfYmFja2xpZ2h0X2J5X25v
ZGUobnApOwotCQlvZl9ub2RlX3B1dChucCk7Ci0KLQkJaWYgKCF3dXhnYV9udC0+YmFja2xpZ2h0
KQotCQkJcmV0dXJuIC1FUFJPQkVfREVGRVI7Ci0JfQotCiAJZHJtX3BhbmVsX2luaXQoJnd1eGdh
X250LT5iYXNlLCAmd3V4Z2FfbnQtPmRzaS0+ZGV2LAogCQkgICAgICAgJnd1eGdhX250X3BhbmVs
X2Z1bmNzLCBEUk1fTU9ERV9DT05ORUNUT1JfRFNJKTsKIAotCXJldCA9IGRybV9wYW5lbF9hZGQo
Jnd1eGdhX250LT5iYXNlKTsKLQlpZiAocmV0IDwgMCkKLQkJZ290byBwdXRfYmFja2xpZ2h0Owot
Ci0JcmV0dXJuIDA7Ci0KLXB1dF9iYWNrbGlnaHQ6Ci0JaWYgKHd1eGdhX250LT5iYWNrbGlnaHQp
Ci0JCXB1dF9kZXZpY2UoJnd1eGdhX250LT5iYWNrbGlnaHQtPmRldik7CisJcmV0ID0gZHJtX3Bh
bmVsX29mX2JhY2tsaWdodCgmd3V4Z2FfbnQtPmJhc2UpOworCWlmIChyZXQpCisJCXJldHVybiBy
ZXQ7CiAKLQlyZXR1cm4gcmV0OworCXJldHVybiBkcm1fcGFuZWxfYWRkKCZ3dXhnYV9udC0+YmFz
ZSk7CiB9CiAKIHN0YXRpYyB2b2lkIHd1eGdhX250X3BhbmVsX2RlbChzdHJ1Y3Qgd3V4Z2FfbnRf
cGFuZWwgKnd1eGdhX250KQogewogCWlmICh3dXhnYV9udC0+YmFzZS5kZXYpCiAJCWRybV9wYW5l
bF9yZW1vdmUoJnd1eGdhX250LT5iYXNlKTsKLQotCWlmICh3dXhnYV9udC0+YmFja2xpZ2h0KQot
CQlwdXRfZGV2aWNlKCZ3dXhnYV9udC0+YmFja2xpZ2h0LT5kZXYpOwogfQogCiBzdGF0aWMgaW50
IHd1eGdhX250X3BhbmVsX3Byb2JlKHN0cnVjdCBtaXBpX2RzaV9kZXZpY2UgKmRzaSkKQEAgLTI4
MSw3ICsyNDgsNyBAQCBzdGF0aWMgaW50IHd1eGdhX250X3BhbmVsX3JlbW92ZShzdHJ1Y3QgbWlw
aV9kc2lfZGV2aWNlICpkc2kpCiAJc3RydWN0IHd1eGdhX250X3BhbmVsICp3dXhnYV9udCA9IG1p
cGlfZHNpX2dldF9kcnZkYXRhKGRzaSk7CiAJaW50IHJldDsKIAotCXJldCA9IHd1eGdhX250X3Bh
bmVsX2Rpc2FibGUoJnd1eGdhX250LT5iYXNlKTsKKwlyZXQgPSBkcm1fcGFuZWxfZGlzYWJsZSgm
d3V4Z2FfbnQtPmJhc2UpOwogCWlmIChyZXQgPCAwKQogCQlkZXZfZXJyKCZkc2ktPmRldiwgImZh
aWxlZCB0byBkaXNhYmxlIHBhbmVsOiAlZFxuIiwgcmV0KTsKIApAQCAtMjk4LDcgKzI2NSw3IEBA
IHN0YXRpYyB2b2lkIHd1eGdhX250X3BhbmVsX3NodXRkb3duKHN0cnVjdCBtaXBpX2RzaV9kZXZp
Y2UgKmRzaSkKIHsKIAlzdHJ1Y3Qgd3V4Z2FfbnRfcGFuZWwgKnd1eGdhX250ID0gbWlwaV9kc2lf
Z2V0X2RydmRhdGEoZHNpKTsKIAotCXd1eGdhX250X3BhbmVsX2Rpc2FibGUoJnd1eGdhX250LT5i
YXNlKTsKKwlkcm1fcGFuZWxfZGlzYWJsZSgmd3V4Z2FfbnQtPmJhc2UpOwogfQogCiBzdGF0aWMg
c3RydWN0IG1pcGlfZHNpX2RyaXZlciB3dXhnYV9udF9wYW5lbF9kcml2ZXIgPSB7Ci0tIAoyLjIw
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
