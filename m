Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9A8115CCE
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2019 15:05:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B95666E1BC;
	Sat,  7 Dec 2019 14:04:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE3286E1B4
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Dec 2019 14:04:52 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id e28so10676460ljo.9
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Dec 2019 06:04:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=MB8F/gszf2cRKXpRo2VrQVMb2VRddLrgS3cljPlLt24=;
 b=DDnJSeRJn37db3acH7uZiC9IyOcEYoTt0cSB32qJzlGXTS53prH8AvibSO+5A0XOdJ
 ljSjjNab9iYMTnB6/Q6VIQSEfBn2Aqe2CGMQYiIck5cqdplEn32nxXdxv+SZaPlSecRo
 0UAhKRFThXqnlXZ2l+Sa/Oq5mLy9DRLo53hjh2bR6c89m9f3Fz3AafdUrPmasNINwHhy
 qO5XeKRz8+iLW1wwZNB3FxTj7zMYoh64u64iRjxjbmIHVExZVtUvrmAaNNrseBS43oFu
 +jj5NZsd+ZxkSga8u2IpWD0KyExcSlT9XClUcfZtxhIQZM6RvD6ESwjmyXVZ/1TG/An/
 ZyRg==
X-Gm-Message-State: APjAAAVYaAWTVHqvDOMLfZARhIb0vKRAe9LUz/aGxI/dNeeQWAai+9bp
 re7/SFFHU4XZF4RX3j7hKlGO8BPdu56VVQ==
X-Google-Smtp-Source: APXvYqx9J1DRR8LiccaW8h+Ak6WWGoNOve+yafSt4KrzKSCNMRhs/EjfonWGrZJnRRbGVrZODAwZ4Q==
X-Received: by 2002:a2e:144b:: with SMTP id 11mr11535632lju.216.1575727490861; 
 Sat, 07 Dec 2019 06:04:50 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 w17sm5644188lfn.22.2019.12.07.06.04.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2019 06:04:50 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linus Walleij <linus.walleij@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 23/25] drm/panel: sitronix-st7789v: use drm_panel backlight
 support
Date: Sat,  7 Dec 2019 15:03:51 +0100
Message-Id: <20191207140353.23967-24-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191207140353.23967-1-sam@ravnborg.org>
References: <20191207140353.23967-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MB8F/gszf2cRKXpRo2VrQVMb2VRddLrgS3cljPlLt24=;
 b=U4xN8GN0VPGdaO0AWtyf6QNMU6m6GH++MkTsmxwi2KAjxIa1YJgJ8HSo/kVZ/oXAzn
 q83znx4fzd/G/OpFJmM6CAiN8Pgp0sCApYTH2XNHRcbDRklBLdWaY75dTGz3YrNod2VA
 RkaVGJC49ElYYqCRnVrHZunYO9+hDv9eBo931BevMWXMwqisYsqZDen0w3833qVKdgG9
 s4fx3xuCFRmxJ5nHIgrOtwi22oS6HxZLNe+rnRUZh8C9XNOdtzIyv3NGUJT8er74Pdh0
 WBvUy9rr9uNu8/DnprIlGZdSvditWsW7o3qXTjedfkIoteUK0Tphpvjdf74rklqpqMao
 kIvQ==
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
bSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KLS0tCiAuLi4vZ3B1L2RybS9wYW5lbC9wYW5l
bC1zaXRyb25peC1zdDc3ODl2LmMgICAgfCAzNyArKy0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAzMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2l0cm9uaXgtc3Q3Nzg5di5jIGIvZHJpdmVycy9n
cHUvZHJtL3BhbmVsL3BhbmVsLXNpdHJvbml4LXN0Nzc4OXYuYwppbmRleCBlYmVmZTJmNGMyNmIu
LmNjMDJjNTRjMWIyZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNp
dHJvbml4LXN0Nzc4OXYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2l0cm9u
aXgtc3Q3Nzg5di5jCkBAIC0zLDcgKzMsNiBAQAogICogQ29weXJpZ2h0IChDKSAyMDE3IEZyZWUg
RWxlY3Ryb25zCiAgKi8KIAotI2luY2x1ZGUgPGxpbnV4L2JhY2tsaWdodC5oPgogI2luY2x1ZGUg
PGxpbnV4L2RlbGF5Lmg+CiAjaW5jbHVkZSA8bGludXgvZ3Bpby9jb25zdW1lci5oPgogI2luY2x1
ZGUgPGxpbnV4L21vZHVsZS5oPgpAQCAtMTE2LDcgKzExNSw2IEBAIHN0cnVjdCBzdDc3ODl2IHsK
IAlzdHJ1Y3QgZHJtX3BhbmVsIHBhbmVsOwogCXN0cnVjdCBzcGlfZGV2aWNlICpzcGk7CiAJc3Ry
dWN0IGdwaW9fZGVzYyAqcmVzZXQ7Ci0Jc3RydWN0IGJhY2tsaWdodF9kZXZpY2UgKmJhY2tsaWdo
dDsKIAlzdHJ1Y3QgcmVndWxhdG9yICpwb3dlcjsKIH07CiAKQEAgLTMyMywxMiArMzIxLDYgQEAg
c3RhdGljIGludCBzdDc3ODl2X2VuYWJsZShzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCkKIHsKIAlz
dHJ1Y3Qgc3Q3Nzg5diAqY3R4ID0gcGFuZWxfdG9fc3Q3Nzg5dihwYW5lbCk7CiAKLQlpZiAoY3R4
LT5iYWNrbGlnaHQpIHsKLQkJY3R4LT5iYWNrbGlnaHQtPnByb3BzLnN0YXRlICY9IH5CTF9DT1JF
X0ZCQkxBTks7Ci0JCWN0eC0+YmFja2xpZ2h0LT5wcm9wcy5wb3dlciA9IEZCX0JMQU5LX1VOQkxB
Tks7Ci0JCWJhY2tsaWdodF91cGRhdGVfc3RhdHVzKGN0eC0+YmFja2xpZ2h0KTsKLQl9Ci0KIAly
ZXR1cm4gc3Q3Nzg5dl93cml0ZV9jb21tYW5kKGN0eCwgTUlQSV9EQ1NfU0VUX0RJU1BMQVlfT04p
OwogfQogCkBAIC0zMzksMTIgKzMzMSw2IEBAIHN0YXRpYyBpbnQgc3Q3Nzg5dl9kaXNhYmxlKHN0
cnVjdCBkcm1fcGFuZWwgKnBhbmVsKQogCiAJU1Q3Nzg5Vl9URVNUKHJldCwgc3Q3Nzg5dl93cml0
ZV9jb21tYW5kKGN0eCwgTUlQSV9EQ1NfU0VUX0RJU1BMQVlfT0ZGKSk7CiAKLQlpZiAoY3R4LT5i
YWNrbGlnaHQpIHsKLQkJY3R4LT5iYWNrbGlnaHQtPnByb3BzLnBvd2VyID0gRkJfQkxBTktfUE9X
RVJET1dOOwotCQljdHgtPmJhY2tsaWdodC0+cHJvcHMuc3RhdGUgfD0gQkxfQ09SRV9GQkJMQU5L
OwotCQliYWNrbGlnaHRfdXBkYXRlX3N0YXR1cyhjdHgtPmJhY2tsaWdodCk7Ci0JfQotCiAJcmV0
dXJuIDA7CiB9CiAKQEAgLTM3MCw3ICszNTYsNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9w
YW5lbF9mdW5jcyBzdDc3ODl2X2RybV9mdW5jcyA9IHsKIAogc3RhdGljIGludCBzdDc3ODl2X3By
b2JlKHN0cnVjdCBzcGlfZGV2aWNlICpzcGkpCiB7Ci0Jc3RydWN0IGRldmljZV9ub2RlICpiYWNr
bGlnaHQ7CiAJc3RydWN0IHN0Nzc4OXYgKmN0eDsKIAlpbnQgcmV0OwogCkBAIC0zOTQsMjYgKzM3
OSwxNSBAQCBzdGF0aWMgaW50IHN0Nzc4OXZfcHJvYmUoc3RydWN0IHNwaV9kZXZpY2UgKnNwaSkK
IAkJcmV0dXJuIFBUUl9FUlIoY3R4LT5yZXNldCk7CiAJfQogCi0JYmFja2xpZ2h0ID0gb2ZfcGFy
c2VfcGhhbmRsZShzcGktPmRldi5vZl9ub2RlLCAiYmFja2xpZ2h0IiwgMCk7Ci0JaWYgKGJhY2ts
aWdodCkgewotCQljdHgtPmJhY2tsaWdodCA9IG9mX2ZpbmRfYmFja2xpZ2h0X2J5X25vZGUoYmFj
a2xpZ2h0KTsKLQkJb2Zfbm9kZV9wdXQoYmFja2xpZ2h0KTsKLQotCQlpZiAoIWN0eC0+YmFja2xp
Z2h0KQotCQkJcmV0dXJuIC1FUFJPQkVfREVGRVI7Ci0JfQorCXJldCA9IGRybV9wYW5lbF9vZl9i
YWNrbGlnaHQoJmN0eC0+cGFuZWwpOworCWlmIChyZXQpCisJCXJldHVybiByZXQ7CiAKIAlyZXQg
PSBkcm1fcGFuZWxfYWRkKCZjdHgtPnBhbmVsKTsKIAlpZiAocmV0IDwgMCkKLQkJZ290byBlcnJf
ZnJlZV9iYWNrbGlnaHQ7CisJCXJldHVybiByZXQ7CiAKIAlyZXR1cm4gMDsKLQotZXJyX2ZyZWVf
YmFja2xpZ2h0OgotCWlmIChjdHgtPmJhY2tsaWdodCkKLQkJcHV0X2RldmljZSgmY3R4LT5iYWNr
bGlnaHQtPmRldik7Ci0KLQlyZXR1cm4gcmV0OwogfQogCiBzdGF0aWMgaW50IHN0Nzc4OXZfcmVt
b3ZlKHN0cnVjdCBzcGlfZGV2aWNlICpzcGkpCkBAIC00MjIsOSArMzk2LDYgQEAgc3RhdGljIGlu
dCBzdDc3ODl2X3JlbW92ZShzdHJ1Y3Qgc3BpX2RldmljZSAqc3BpKQogCiAJZHJtX3BhbmVsX3Jl
bW92ZSgmY3R4LT5wYW5lbCk7CiAKLQlpZiAoY3R4LT5iYWNrbGlnaHQpCi0JCXB1dF9kZXZpY2Uo
JmN0eC0+YmFja2xpZ2h0LT5kZXYpOwotCiAJcmV0dXJuIDA7CiB9CiAKLS0gCjIuMjAuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
