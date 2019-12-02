Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 037CE10F06C
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 20:34:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA3546E30F;
	Mon,  2 Dec 2019 19:33:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1427E6E30E
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 19:33:53 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id 203so741588lfa.12
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2019 11:33:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=sQFlzyFny1i3dHVwTEws0fP7Z8KCjLT5c7TINBzn22A=;
 b=m/XQ7i57XHQLieM1WH2Fkn9Q/Vw7kjauKMt3UqI78dw74ZKUxSvc6gZmFZiXVB3RE4
 X30KEGEUvkWF53JKAtaKOp6jW4otpkrCzkd2Ofdcg50J5svnkkEwcy0/MG3rxN3S2zLX
 0QF2YBaAyZKPj4AIEOCb2sBxF/fDbN0q3zQyBuBHSEiu5oBsSI2VRXAd6H6W/OrqMSUp
 fJ88iqUaanNT3VOKPiLGSXRMqWRbO821fq8WPPev7Lwcktj2qZU1pjLSivDDgkAc2Kg4
 PM/tEbFZwoYbKZEgE/Gu5q3yyQCZO97aW1GENj/7HGFDOSzRzUkFdU4macFSm3Fk26LH
 4fAQ==
X-Gm-Message-State: APjAAAW3b+lZNsCIDYyK3vCoXZ6P1H8GG8VEncChgtvuo+FRBEnMJxYO
 qVJQYLJdZKxJ957RycoCVnyepxPkuXzKCA==
X-Google-Smtp-Source: APXvYqw+I2ccfhtX+jZIDSZ8cLTRrK19+BfFlN/G+FBcKPfk4B/UKRsY/a6pLRlAL5tf08+wnj+Qzg==
X-Received: by 2002:ac2:4a89:: with SMTP id l9mr397464lfp.121.1575315231117;
 Mon, 02 Dec 2019 11:33:51 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 g13sm79482lfb.74.2019.12.02.11.33.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 11:33:50 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v1 25/26] drm/panel: tpo-td028ttec1: use drm_panel backlight
 support
Date: Mon,  2 Dec 2019 20:32:29 +0100
Message-Id: <20191202193230.21310-26-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191202193230.21310-1-sam@ravnborg.org>
References: <20191202193230.21310-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sQFlzyFny1i3dHVwTEws0fP7Z8KCjLT5c7TINBzn22A=;
 b=pt4eRo+rlUMtO4GzjerqssqjlO0TO1vFSYLwXnfqMSsS6I6x4kY1DKOw6u9G9vdsgW
 VAXzxTR5zDmXqrnHapjbB2IRlTBgXXfxGeEzL71oJVndvo7oGsIzdM4JNNW+vJ9wI25g
 Qpon0HiFbTQdsFgeRb9y24Z617Q2A4fAEvuGRRje5A0OM5b/IzFlUNEFnzszoF9xFYKW
 CFKHrlknb1/H6PzMT5qxX68gQRn6wKxNlsb26QKyV9LEm0W4VdQaXIu/ffS0UbmwteSa
 ESNzQZVCq6Z1dS+LBlZ71mm/mZiCmeduZsUF8YAG5RFC59oKdaCyFJU+oIb5eWrZqitl
 CEAw==
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
ZyA8c2FtQHJhdm5ib3JnLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtdHBv
LXRkMDI4dHRlYzEuYyB8IDE0ICsrKystLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
cGFuZWwvcGFuZWwtdHBvLXRkMDI4dHRlYzEuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5l
bC10cG8tdGQwMjh0dGVjMS5jCmluZGV4IDM3MjUyNTkwYjU0MS4uY2YyOTQwNWEyZGJlIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtdHBvLXRkMDI4dHRlYzEuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtdHBvLXRkMDI4dHRlYzEuYwpAQCAtMTcsNyAr
MTcsNiBAQAogICogSC4gTmlrb2xhdXMgU2NoYWxsZXIgPGhuc0Bnb2xkZWxpY28uY29tPgogICov
CiAKLSNpbmNsdWRlIDxsaW51eC9iYWNrbGlnaHQuaD4KICNpbmNsdWRlIDxsaW51eC9kZWxheS5o
PgogI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgogI2luY2x1ZGUgPGxpbnV4L3NwaS9zcGkuaD4K
QEAgLTgzLDcgKzgyLDYgQEAgc3RydWN0IHRkMDI4dHRlYzFfcGFuZWwgewogCXN0cnVjdCBkcm1f
cGFuZWwgcGFuZWw7CiAKIAlzdHJ1Y3Qgc3BpX2RldmljZSAqc3BpOwotCXN0cnVjdCBiYWNrbGln
aHRfZGV2aWNlICpiYWNrbGlnaHQ7CiB9OwogCiAjZGVmaW5lIHRvX3RkMDI4dHRlYzFfZGV2aWNl
KHApIGNvbnRhaW5lcl9vZihwLCBzdHJ1Y3QgdGQwMjh0dGVjMV9wYW5lbCwgcGFuZWwpCkBAIC0y
NDMsOCArMjQxLDYgQEAgc3RhdGljIGludCB0ZDAyOHR0ZWMxX2VuYWJsZShzdHJ1Y3QgZHJtX3Bh
bmVsICpwYW5lbCkKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCi0JYmFja2xpZ2h0X2VuYWJs
ZShsY2QtPmJhY2tsaWdodCk7Ci0KIAlyZXR1cm4gMDsKIH0KIApAQCAtMjUyLDggKzI0OCw2IEBA
IHN0YXRpYyBpbnQgdGQwMjh0dGVjMV9kaXNhYmxlKHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsKQog
ewogCXN0cnVjdCB0ZDAyOHR0ZWMxX3BhbmVsICpsY2QgPSB0b190ZDAyOHR0ZWMxX2RldmljZShw
YW5lbCk7CiAKLQliYWNrbGlnaHRfZGlzYWJsZShsY2QtPmJhY2tsaWdodCk7Ci0KIAlqYnRfcmV0
X3dyaXRlXzAobGNkLCBKQlRfUkVHX0RJU1BMQVlfT0ZGLCBOVUxMKTsKIAogCXJldHVybiAwOwpA
QCAtMzM0LDEwICszMjgsNiBAQCBzdGF0aWMgaW50IHRkMDI4dHRlYzFfcHJvYmUoc3RydWN0IHNw
aV9kZXZpY2UgKnNwaSkKIAlzcGlfc2V0X2RydmRhdGEoc3BpLCBsY2QpOwogCWxjZC0+c3BpID0g
c3BpOwogCi0JbGNkLT5iYWNrbGlnaHQgPSBkZXZtX29mX2ZpbmRfYmFja2xpZ2h0KCZzcGktPmRl
dik7Ci0JaWYgKElTX0VSUihsY2QtPmJhY2tsaWdodCkpCi0JCXJldHVybiBQVFJfRVJSKGxjZC0+
YmFja2xpZ2h0KTsKLQogCXNwaS0+bW9kZSA9IFNQSV9NT0RFXzM7CiAJc3BpLT5iaXRzX3Blcl93
b3JkID0gOTsKIApAQCAtMzUwLDYgKzM0MCwxMCBAQCBzdGF0aWMgaW50IHRkMDI4dHRlYzFfcHJv
YmUoc3RydWN0IHNwaV9kZXZpY2UgKnNwaSkKIAlkcm1fcGFuZWxfaW5pdCgmbGNkLT5wYW5lbCwg
JmxjZC0+c3BpLT5kZXYsICZ0ZDAyOHR0ZWMxX2Z1bmNzLAogCQkgICAgICAgRFJNX01PREVfQ09O
TkVDVE9SX0RQSSk7CiAKKwlyZXQgPSBkcm1fcGFuZWxfb2ZfYmFja2xpZ2h0KCZsY2QtPnBhbmVs
KTsKKwlpZiAocmV0KQorCQlyZXR1cm4gcmV0OworCiAJcmV0dXJuIGRybV9wYW5lbF9hZGQoJmxj
ZC0+cGFuZWwpOwogfQogCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
