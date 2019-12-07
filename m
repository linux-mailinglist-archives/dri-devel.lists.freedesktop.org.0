Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D90D3115C7B
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2019 15:04:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19BFB6E17E;
	Sat,  7 Dec 2019 14:04:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92CFC6E156
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Dec 2019 14:04:17 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id z17so10642479ljk.13
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Dec 2019 06:04:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gDEv0RS9u1sLbcP7aKD5NbZuatHNrJrYBV8mFE5d35g=;
 b=ncbuv+3IKgBoenTnGs5VQY03DKXC/x0MvWBkb79A9eak7Ku8WaiQfkMJICDPByGSVm
 SVP95TLkTe/nslklWZi5hu/XzQJZLTqrDyIrW0QzZ94S7zci380xymXUbZKtBzFAQar8
 8VSYW6nsp+wK89J6Ivv9erqOtEOQBWn+eNTVU6zgQDyNSg8Ch3x4WPZXh9rhsiu64RvA
 /jyaBler/YKB8nZfXVPBQ4WdJwgxxcRWRh3QVlldb2rRF7HuEPmFFL5mz+FynhNUZofD
 GAbSTWWX4+xXMFz1EmTpHlGPLSk8slbUyeB01uIQZnwdPY+DMBSkJjm+7zRGRXkeb03D
 GIJg==
X-Gm-Message-State: APjAAAU2dBqFZODF6V/KQ4WxSQJbHwmXWd+WZPwxzSW0HE63C/H/eHBH
 aRWFIkySWoYwzSaAg4E+lcxUkJCjHlEW0w==
X-Google-Smtp-Source: APXvYqzZ+jdskQadQ/ngsbumGhCcPqqfliYALT5+d2ISdCnkwPth2IL1jzPJ+7K6rUHJWF2qX8vUWw==
X-Received: by 2002:a05:651c:1110:: with SMTP id
 d16mr11870528ljo.86.1575727455771; 
 Sat, 07 Dec 2019 06:04:15 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 w17sm5644188lfn.22.2019.12.07.06.04.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2019 06:04:15 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linus Walleij <linus.walleij@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 04/25] drm: get drm_bridge_panel connector via helper
Date: Sat,  7 Dec 2019 15:03:32 +0100
Message-Id: <20191207140353.23967-5-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191207140353.23967-1-sam@ravnborg.org>
References: <20191207140353.23967-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gDEv0RS9u1sLbcP7aKD5NbZuatHNrJrYBV8mFE5d35g=;
 b=kStv8JKNews1ASDw7z7ddDiOlhdDEBCUGAHaTsm2tqKG4s4k0usHJl0qikxyLF9l9i
 b+pAsI3DhJaJ4XzVpar+XAqSpOTNRuZt5OzO/ynvbcmOcibfSycfMibvGO8KC0Racviq
 WDgEemyCuEarftv/+KvkNawtDborBcOYRqnGjIv5g1chot9s2DDqXvAJ/i8SLatpn3gu
 /befl/LXxlDAYDEaCocPaBINxBC+2eQ9QuiKj0lqbRFuYFoMycJZb4CpUXGuURBnuJ8D
 Mp0RLVdvzCvOakf/ZYceQr9QM6xIbMwxYbXvZbnsuwdSKukz28Dn1/CgjJC0NItO/h1P
 +fjQ==
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
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Jagan Teki <jagan@amarulasolutions.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jitao Shi <jitao.shi@mediatek.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-mediatek@lists.infradead.org,
 Abhinav Kumar <abhinavk@codeaurora.org>, linux-tegra@vger.kernel.org,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, Purism Kernel Team <kernel@puri.sm>,
 linux-renesas-soc@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGRybV9jb25uZWN0b3IgY3JlYXRlZCBieSBkcm1fcGFuZWxfYnJpZGdlIHdhcyBhY2Nlc3Nl
ZAp2aWEgZHJtX3BhbmVsLmNvbm5lY3Rvci4KQXZvaWQgdGhlIGRldG91ciBhcm91bmQgZHJtX3Bh
bmVsIGJ5IHByb3ZpZGluZyBhIHNpbXBsZSBnZXQgbWV0aG9kLgpUaGlzIGF2b2lkcyBkaXJlY3Qg
YWNjZXNzIHRvIHRoZSBjb25uZWN0b3IgZmllbGQgaW4gZHJtX3BhbmVsIGluCnRoZSB0d28gdXNl
cnMuCgpUaGUgY2hhbmdlIGlzIGRvbmUgaW4gcHJlcGFyYXRpb24gZm9yIHJlbW92YWwgb2YgZHJt
X3BhbmVsLmNvbm5lY3Rvci4KClVwZGF0ZSBwbDExMSBhbmQgdHZlMjAwIHRvIHVzZSB0aGUgbmV3
IGhlbHBlci4KClNpZ25lZC1vZmYtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4K
UmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJv
YXJkLmNvbT4KUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJv
Lm9yZz4KQ2M6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+CkNjOiBOZWlsIEFy
bXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+CkNjOiBMYXVyZW50IFBpbmNoYXJ0IDxM
YXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+CkNjOiBKb25hcyBLYXJsbWFuIDxqb25h
c0Brd2lib28uc2U+CkNjOiBKZXJuZWogU2tyYWJlYyA8amVybmVqLnNrcmFiZWNAc2lvbC5uZXQ+
CkNjOiBFcmljIEFuaG9sdCA8ZXJpY0BhbmhvbHQubmV0PgpDYzogTGludXMgV2FsbGVpaiA8bGlu
dXMud2FsbGVpakBsaW5hcm8ub3JnPgpDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFu
a2hvcnN0QGxpbnV4LmludGVsLmNvbT4KQ2M6IE1heGltZSBSaXBhcmQgPG1yaXBhcmRAa2VybmVs
Lm9yZz4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0
ZXIgPGRhbmllbEBmZndsbC5jaD4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3BhbmVsLmMg
ICAgICB8IDE3ICsrKysrKysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vcGwxMTEvcGwxMTFf
ZHJ2LmMgICB8ICAyICstCiBkcml2ZXJzL2dwdS9kcm0vdHZlMjAwL3R2ZTIwMF9kcnYuYyB8ICAy
ICstCiBpbmNsdWRlL2RybS9kcm1fYnJpZGdlLmggICAgICAgICAgICB8ICAxICsKIDQgZmlsZXMg
Y2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL3BhbmVsLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3Bh
bmVsLmMKaW5kZXggZjRlMjkzZTdjZjY0Li41NTRkYTQ3ZjZkNjIgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9icmlkZ2UvcGFuZWwuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3Bh
bmVsLmMKQEAgLTI4OSwzICsyODksMjAgQEAgc3RydWN0IGRybV9icmlkZ2UgKmRldm1fZHJtX3Bh
bmVsX2JyaWRnZV9hZGRfdHlwZWQoc3RydWN0IGRldmljZSAqZGV2LAogCXJldHVybiBicmlkZ2U7
CiB9CiBFWFBPUlRfU1lNQk9MKGRldm1fZHJtX3BhbmVsX2JyaWRnZV9hZGRfdHlwZWQpOworCisv
KioKKyAqIGRybV9wYW5lbF9icmlkZ2VfY29ubmVjdG9yIC0gcmV0dXJuIHRoZSBjb25uZWN0b3Ig
Zm9yIHRoZSBwYW5lbCBicmlkZ2UKKyAqCisgKiBkcm1fcGFuZWxfYnJpZGdlIGNyZWF0ZXMgdGhl
IGNvbm5lY3Rvci4KKyAqIFRoaXMgZnVuY3Rpb24gZ2l2ZXMgZXh0ZXJuYWwgYWNjZXNzIHRvIHRo
ZSBjb25uZWN0b3IuCisgKgorICogUmV0dXJuczogUG9pbnRlciB0byBkcm1fY29ubmVjdG9yCisg
Ki8KK3N0cnVjdCBkcm1fY29ubmVjdG9yICpkcm1fcGFuZWxfYnJpZGdlX2Nvbm5lY3RvcihzdHJ1
Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQoreworCXN0cnVjdCBwYW5lbF9icmlkZ2UgKnBhbmVsX2Jy
aWRnZTsKKworCXBhbmVsX2JyaWRnZSA9IGRybV9icmlkZ2VfdG9fcGFuZWxfYnJpZGdlKGJyaWRn
ZSk7CisKKwlyZXR1cm4gJnBhbmVsX2JyaWRnZS0+Y29ubmVjdG9yOworfQpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3BsMTExL3BsMTExX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL3BsMTEx
L3BsMTExX2Rydi5jCmluZGV4IDYzZGZjZGEwNDE0Ny4uYWE4YWE4ZDllNDA1IDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vcGwxMTEvcGwxMTFfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L3BsMTExL3BsMTExX2Rydi5jCkBAIC0xNjYsNyArMTY2LDcgQEAgc3RhdGljIGludCBwbDExMV9t
b2Rlc2V0X2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldikKIAlwcml2LT5icmlkZ2UgPSBicmlk
Z2U7CiAJaWYgKHBhbmVsKSB7CiAJCXByaXYtPnBhbmVsID0gcGFuZWw7Ci0JCXByaXYtPmNvbm5l
Y3RvciA9IHBhbmVsLT5jb25uZWN0b3I7CisJCXByaXYtPmNvbm5lY3RvciA9IGRybV9wYW5lbF9i
cmlkZ2VfY29ubmVjdG9yKGJyaWRnZSk7CiAJfQogCiAJcmV0ID0gcGwxMTFfZGlzcGxheV9pbml0
KGRldik7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHZlMjAwL3R2ZTIwMF9kcnYuYyBi
L2RyaXZlcnMvZ3B1L2RybS90dmUyMDAvdHZlMjAwX2Rydi5jCmluZGV4IDk1NGIwOWM5NDhlYi4u
MDBiYTllNWNlMTMwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHZlMjAwL3R2ZTIwMF9k
cnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdHZlMjAwL3R2ZTIwMF9kcnYuYwpAQCAtMTEwLDcg
KzExMCw3IEBAIHN0YXRpYyBpbnQgdHZlMjAwX21vZGVzZXRfaW5pdChzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZGV2KQogCX0KIAogCXByaXYtPnBhbmVsID0gcGFuZWw7Ci0JcHJpdi0+Y29ubmVjdG9yID0g
cGFuZWwtPmNvbm5lY3RvcjsKKwlwcml2LT5jb25uZWN0b3IgPSBkcm1fcGFuZWxfYnJpZGdlX2Nv
bm5lY3RvcihicmlkZ2UpOwogCXByaXYtPmJyaWRnZSA9IGJyaWRnZTsKIAogCWRldl9pbmZvKGRl
di0+ZGV2LCAiYXR0YWNoZWQgdG8gcGFuZWwgJXNcbiIsCmRpZmYgLS1naXQgYS9pbmNsdWRlL2Ry
bS9kcm1fYnJpZGdlLmggYi9pbmNsdWRlL2RybS9kcm1fYnJpZGdlLmgKaW5kZXggYzBhMjI4NmE4
MWU5Li45YTQ5MDJhY2NmZTUgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9icmlkZ2UuaAor
KysgYi9pbmNsdWRlL2RybS9kcm1fYnJpZGdlLmgKQEAgLTQzOCw2ICs0MzgsNyBAQCBzdHJ1Y3Qg
ZHJtX2JyaWRnZSAqZGV2bV9kcm1fcGFuZWxfYnJpZGdlX2FkZChzdHJ1Y3QgZGV2aWNlICpkZXYs
CiBzdHJ1Y3QgZHJtX2JyaWRnZSAqZGV2bV9kcm1fcGFuZWxfYnJpZGdlX2FkZF90eXBlZChzdHJ1
Y3QgZGV2aWNlICpkZXYsCiAJCQkJCQkgICBzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCwKIAkJCQkJ
CSAgIHUzMiBjb25uZWN0b3JfdHlwZSk7CitzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqZHJtX3BhbmVs
X2JyaWRnZV9jb25uZWN0b3Ioc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSk7CiAjZW5kaWYKIAog
I2VuZGlmCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
