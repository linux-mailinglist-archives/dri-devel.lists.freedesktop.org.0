Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CC910F04B
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 20:33:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D09886E2E5;
	Mon,  2 Dec 2019 19:33:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E24C36E2DE
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 19:33:36 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id e28so800025ljo.9
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2019 11:33:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1cwcVlQTSPEpvvTt7npXTAeRNecjJ4sL2WdE6IowvJo=;
 b=i9zx3n10LT69l4xGHfvIdtxJkgp840niaPHs5v714FA8Rw5SWqHiWmZCv2FbMbPipZ
 3cVBXFSCls824ql1R269nupKi71JTyshsC7d4M1uYRhAaidNb9NtNXlC7mg12japS3qz
 Lz1Oi7QU4OAI1MoKBNmudcrbcsxBo+3iLZe52evEILsza3yxrtrHBUy4/FD+X3DR4lqc
 OB3mcoQFtVk5hFwojmKUgRi4oIzKWtVi/SWUbYot+F1iCDv8Rxr1ywcHYzxus40vF92h
 k0GFQ/zyMHmQvxrOqnH4Va9k5OvXAWoK8mvoAZSIujKTHBFqpS3ebKbuvJ0O3Y+rvxUc
 XH1g==
X-Gm-Message-State: APjAAAVEG4Q90eHM7civHmVEuianF27sLmPyIMHLo1g+5AmO6E5FvDMX
 QdljaCs/ocTIPHSd2TGPeHrEKqw53OnMfw==
X-Google-Smtp-Source: APXvYqxuD4DYzYut6ry4UElFe4ZjLh8rR23KZMh/GwY0agg4mlfI8UchY6oM0rWOK2lXFt8pu36fCg==
X-Received: by 2002:a2e:999a:: with SMTP id w26mr287454lji.142.1575315215038; 
 Mon, 02 Dec 2019 11:33:35 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 g13sm79482lfb.74.2019.12.02.11.33.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 11:33:34 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v1 16/26] drm/panel: panasonic-vvx10f034n00: use drm_panel
 backlight support
Date: Mon,  2 Dec 2019 20:32:20 +0100
Message-Id: <20191202193230.21310-17-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191202193230.21310-1-sam@ravnborg.org>
References: <20191202193230.21310-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1cwcVlQTSPEpvvTt7npXTAeRNecjJ4sL2WdE6IowvJo=;
 b=imCcVCQmdfVtejivHQ8KZ3aZd/wGiv7mSMxF8P61gBPk8JEEOnM5aBUs/RUQ/BM+Zs
 TZU5zBsnpML9NGpyS7AV6m4mryUxW3RdK/e9BhFtQolln8KI2MFdjwbNCEHgFDffbSEQ
 UjyRVShfamjiTe1VMJKsraIoBmzT5zYXchzx/cMKm+RKSDDy/7yuBZZmlKPnr9kFFV1s
 uhFD7Vjj5Rl80xoiyiU2KTIZs2jPm1h+3WusBF3g6jrXO/BIEGD2xe79Kr21fOZ0Hk+N
 4cjdXLPmyBe9NWlJkOp0RvKlxnnEK+fOQ4pI38kQ0QEBBpF8I+Y4f2FVFn3Euq+UYigc
 0brA==
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
 Sam Ravnborg <sam@ravnborg.org>, linux-samsung-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
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
aXZlcgoKU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpDYzog
VGhpZXJyeSBSZWRpbmcgPHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbT4KQ2M6IFNhbSBSYXZuYm9y
ZyA8c2FtQHJhdm5ib3JnLm9yZz4KLS0tCiAuLi4vZHJtL3BhbmVsL3BhbmVsLXBhbmFzb25pYy12
dngxMGYwMzRuMDAuYyAgfCA0NSArKystLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
NiBpbnNlcnRpb25zKCspLCAzOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vcGFuZWwvcGFuZWwtcGFuYXNvbmljLXZ2eDEwZjAzNG4wMC5jIGIvZHJpdmVycy9ncHUv
ZHJtL3BhbmVsL3BhbmVsLXBhbmFzb25pYy12dngxMGYwMzRuMDAuYwppbmRleCA1NzlhYzBkODZl
YTQuLjRlMTViZmY1YTFiNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVs
LXBhbmFzb25pYy12dngxMGYwMzRuMDAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFu
ZWwtcGFuYXNvbmljLXZ2eDEwZjAzNG4wMC5jCkBAIC03LDcgKzcsNiBAQAogICogQmFzZWQgb24g
QVVPIHBhbmVsIGRyaXZlciBieSBSb2IgQ2xhcmsgPHJvYmRjbGFya0BnbWFpbC5jb20+CiAgKi8K
IAotI2luY2x1ZGUgPGxpbnV4L2JhY2tsaWdodC5oPgogI2luY2x1ZGUgPGxpbnV4L2RlbGF5Lmg+
CiAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+CiAjaW5jbHVkZSA8bGludXgvb2YuaD4KQEAgLTMx
LDcgKzMwLDYgQEAgc3RydWN0IHd1eGdhX250X3BhbmVsIHsKIAlzdHJ1Y3QgZHJtX3BhbmVsIGJh
c2U7CiAJc3RydWN0IG1pcGlfZHNpX2RldmljZSAqZHNpOwogCi0Jc3RydWN0IGJhY2tsaWdodF9k
ZXZpY2UgKmJhY2tsaWdodDsKIAlzdHJ1Y3QgcmVndWxhdG9yICpzdXBwbHk7CiAKIAlib29sIHBy
ZXBhcmVkOwpAQCAtNjIsMTIgKzYwLDYgQEAgc3RhdGljIGludCB3dXhnYV9udF9wYW5lbF9kaXNh
YmxlKHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsKQogCiAJbWlwaV9yZXQgPSBtaXBpX2RzaV9zaHV0
ZG93bl9wZXJpcGhlcmFsKHd1eGdhX250LT5kc2kpOwogCi0JaWYgKHd1eGdhX250LT5iYWNrbGln
aHQpIHsKLQkJd3V4Z2FfbnQtPmJhY2tsaWdodC0+cHJvcHMucG93ZXIgPSBGQl9CTEFOS19QT1dF
UkRPV047Ci0JCXd1eGdhX250LT5iYWNrbGlnaHQtPnByb3BzLnN0YXRlIHw9IEJMX0NPUkVfRkJC
TEFOSzsKLQkJYmxfcmV0ID0gYmFja2xpZ2h0X3VwZGF0ZV9zdGF0dXMod3V4Z2FfbnQtPmJhY2ts
aWdodCk7Ci0JfQotCiAJd3V4Z2FfbnQtPmVuYWJsZWQgPSBmYWxzZTsKIAogCXJldHVybiBtaXBp
X3JldCA/IG1pcGlfcmV0IDogYmxfcmV0OwpAQCAtMTQyLDEyICsxMzQsNiBAQCBzdGF0aWMgaW50
IHd1eGdhX250X3BhbmVsX2VuYWJsZShzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCkKIAlpZiAod3V4
Z2FfbnQtPmVuYWJsZWQpCiAJCXJldHVybiAwOwogCi0JaWYgKHd1eGdhX250LT5iYWNrbGlnaHQp
IHsKLQkJd3V4Z2FfbnQtPmJhY2tsaWdodC0+cHJvcHMucG93ZXIgPSBGQl9CTEFOS19VTkJMQU5L
OwotCQl3dXhnYV9udC0+YmFja2xpZ2h0LT5wcm9wcy5zdGF0ZSAmPSB+QkxfQ09SRV9GQkJMQU5L
OwotCQliYWNrbGlnaHRfdXBkYXRlX3N0YXR1cyh3dXhnYV9udC0+YmFja2xpZ2h0KTsKLQl9Ci0K
IAl3dXhnYV9udC0+ZW5hYmxlZCA9IHRydWU7CiAKIAlyZXR1cm4gMDsKQEAgLTIwNiw3ICsxOTIs
NiBAQCBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCB3dXhnYV9udF9vZl9tYXRjaCk7CiBzdGF0aWMg
aW50IHd1eGdhX250X3BhbmVsX2FkZChzdHJ1Y3Qgd3V4Z2FfbnRfcGFuZWwgKnd1eGdhX250KQog
ewogCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZ3dXhnYV9udC0+ZHNpLT5kZXY7Ci0Jc3RydWN0IGRl
dmljZV9ub2RlICpucDsKIAlpbnQgcmV0OwogCiAJd3V4Z2FfbnQtPm1vZGUgPSAmZGVmYXVsdF9t
b2RlOwpAQCAtMjE1LDM4ICsyMDAsMjAgQEAgc3RhdGljIGludCB3dXhnYV9udF9wYW5lbF9hZGQo
c3RydWN0IHd1eGdhX250X3BhbmVsICp3dXhnYV9udCkKIAlpZiAoSVNfRVJSKHd1eGdhX250LT5z
dXBwbHkpKQogCQlyZXR1cm4gUFRSX0VSUih3dXhnYV9udC0+c3VwcGx5KTsKIAotCW5wID0gb2Zf
cGFyc2VfcGhhbmRsZShkZXYtPm9mX25vZGUsICJiYWNrbGlnaHQiLCAwKTsKLQlpZiAobnApIHsK
LQkJd3V4Z2FfbnQtPmJhY2tsaWdodCA9IG9mX2ZpbmRfYmFja2xpZ2h0X2J5X25vZGUobnApOwot
CQlvZl9ub2RlX3B1dChucCk7Ci0KLQkJaWYgKCF3dXhnYV9udC0+YmFja2xpZ2h0KQotCQkJcmV0
dXJuIC1FUFJPQkVfREVGRVI7Ci0JfQotCiAJZHJtX3BhbmVsX2luaXQoJnd1eGdhX250LT5iYXNl
LCAmd3V4Z2FfbnQtPmRzaS0+ZGV2LAogCQkgICAgICAgJnd1eGdhX250X3BhbmVsX2Z1bmNzLCBE
Uk1fTU9ERV9DT05ORUNUT1JfRFNJKTsKIAotCXJldCA9IGRybV9wYW5lbF9hZGQoJnd1eGdhX250
LT5iYXNlKTsKLQlpZiAocmV0IDwgMCkKLQkJZ290byBwdXRfYmFja2xpZ2h0OwotCi0JcmV0dXJu
IDA7Ci0KLXB1dF9iYWNrbGlnaHQ6Ci0JaWYgKHd1eGdhX250LT5iYWNrbGlnaHQpCi0JCXB1dF9k
ZXZpY2UoJnd1eGdhX250LT5iYWNrbGlnaHQtPmRldik7CisJcmV0ID0gZHJtX3BhbmVsX29mX2Jh
Y2tsaWdodCgmd3V4Z2FfbnQtPmJhc2UpOworCWlmIChyZXQpCisJCXJldHVybiByZXQ7CiAKLQly
ZXR1cm4gcmV0OworCXJldHVybiBkcm1fcGFuZWxfYWRkKCZ3dXhnYV9udC0+YmFzZSk7CiB9CiAK
IHN0YXRpYyB2b2lkIHd1eGdhX250X3BhbmVsX2RlbChzdHJ1Y3Qgd3V4Z2FfbnRfcGFuZWwgKnd1
eGdhX250KQogewogCWlmICh3dXhnYV9udC0+YmFzZS5kZXYpCiAJCWRybV9wYW5lbF9yZW1vdmUo
Jnd1eGdhX250LT5iYXNlKTsKLQotCWlmICh3dXhnYV9udC0+YmFja2xpZ2h0KQotCQlwdXRfZGV2
aWNlKCZ3dXhnYV9udC0+YmFja2xpZ2h0LT5kZXYpOwogfQogCiBzdGF0aWMgaW50IHd1eGdhX250
X3BhbmVsX3Byb2JlKHN0cnVjdCBtaXBpX2RzaV9kZXZpY2UgKmRzaSkKQEAgLTI4MSw3ICsyNDgs
NyBAQCBzdGF0aWMgaW50IHd1eGdhX250X3BhbmVsX3JlbW92ZShzdHJ1Y3QgbWlwaV9kc2lfZGV2
aWNlICpkc2kpCiAJc3RydWN0IHd1eGdhX250X3BhbmVsICp3dXhnYV9udCA9IG1pcGlfZHNpX2dl
dF9kcnZkYXRhKGRzaSk7CiAJaW50IHJldDsKIAotCXJldCA9IHd1eGdhX250X3BhbmVsX2Rpc2Fi
bGUoJnd1eGdhX250LT5iYXNlKTsKKwlyZXQgPSBkcm1fcGFuZWxfZGlzYWJsZSgmd3V4Z2FfbnQt
PmJhc2UpOwogCWlmIChyZXQgPCAwKQogCQlkZXZfZXJyKCZkc2ktPmRldiwgImZhaWxlZCB0byBk
aXNhYmxlIHBhbmVsOiAlZFxuIiwgcmV0KTsKIApAQCAtMjk4LDcgKzI2NSw3IEBAIHN0YXRpYyB2
b2lkIHd1eGdhX250X3BhbmVsX3NodXRkb3duKHN0cnVjdCBtaXBpX2RzaV9kZXZpY2UgKmRzaSkK
IHsKIAlzdHJ1Y3Qgd3V4Z2FfbnRfcGFuZWwgKnd1eGdhX250ID0gbWlwaV9kc2lfZ2V0X2RydmRh
dGEoZHNpKTsKIAotCXd1eGdhX250X3BhbmVsX2Rpc2FibGUoJnd1eGdhX250LT5iYXNlKTsKKwlk
cm1fcGFuZWxfZGlzYWJsZSgmd3V4Z2FfbnQtPmJhc2UpOwogfQogCiBzdGF0aWMgc3RydWN0IG1p
cGlfZHNpX2RyaXZlciB3dXhnYV9udF9wYW5lbF9kcml2ZXIgPSB7Ci0tIAoyLjIwLjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
