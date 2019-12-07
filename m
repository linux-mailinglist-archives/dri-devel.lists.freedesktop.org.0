Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D224C115CA1
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2019 15:04:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC6CB6E197;
	Sat,  7 Dec 2019 14:04:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6556B6E193
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Dec 2019 14:04:33 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id y5so7411608lfy.7
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Dec 2019 06:04:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=MSWnR6VdohNUNOoFOCWn8BMjZQT0wFgumDrz53vPK98=;
 b=roqcI2y3Bmwa4qQis6qtJuVnyVP3X+9IuJQFrTmjVnNofgRIWEgGa6t2jizP7ioVSp
 5cX/mOTdo4iWoZPXhvta5hKIxk+9nAAnbEu7X9BGMAG7d2eKbcIaS9ESBzWrQ3JkPyYd
 wXi8Tf9hoPVG17a7/HsatldeQ6Z5efpJ7JZO0LzOgHKLBBhht3OoMbw9gtObZDppGmA2
 7qQeRsaPf6sUafW0yR/BIcca9U3Uk5MzSY7Jze3756b8NsGM/d3PNzbW+y3w1jwoRfAI
 ncQHYNDq2D9I3ZPzmX2Xi2T4i0AkWFFHta1NB/pERrk5c3LKLrzpJiNQtg7D3K9pY8Pi
 xmmA==
X-Gm-Message-State: APjAAAUEdrLRIOZAnJ5N9oIz3cxbQSCp7rFqk2AxILEmkTUMeEMnddT4
 AjZ9pXRfMMZAOJ1YPD50FG8JdDDHFRrZAg==
X-Google-Smtp-Source: APXvYqyNmfcdDlQvYICW2Ts4KjEsPdwDqWLhVGnv7aiHkVxrXOcZ/rYb2aF+AgT/0jQiarjudoHLkg==
X-Received: by 2002:a19:6a06:: with SMTP id u6mr6860850lfu.187.1575727471568; 
 Sat, 07 Dec 2019 06:04:31 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 w17sm5644188lfn.22.2019.12.07.06.04.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2019 06:04:31 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linus Walleij <linus.walleij@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 12/25] drm/panel: lvds: use drm_panel backlight support
Date: Sat,  7 Dec 2019 15:03:40 +0100
Message-Id: <20191207140353.23967-13-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191207140353.23967-1-sam@ravnborg.org>
References: <20191207140353.23967-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MSWnR6VdohNUNOoFOCWn8BMjZQT0wFgumDrz53vPK98=;
 b=jJMVa7cVhgExq5uNImKtY6/kAmaigjLdQdldbzHZ8hHjFeI1pllqcDO4VPkreZkZUe
 gInPMWKqkwzqBMn59QbKd6B4gjT7NocpAfheSUD7gPQrHOPNEVCqbh38OtEbOEm0XJng
 FNCtKiR4ukXNMybUrn3xS9B9vJtxzZJpUHaSYVbSwXYai/MhVi6loFQFyYJ/WNXSqhvm
 4g79W0XLNcpsuHCRaif2tYztXzPefA4N5hLfLFp/G5J/Qivb0VZauDHAmJFEcWWu4OyZ
 bR//VvZOUNtfe1bu6uWhvILlq1BXI5fPkjY+cevovvV57fcE3l2izpgpliMgAcGWx2S9
 4J/w==
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
cGFuZWwtbHZkcy5jIHwgNDAgKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAzNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtbHZkcy5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVs
L3BhbmVsLWx2ZHMuYwppbmRleCA1ZTQwYjY3NGJiMTUuLjVjZTNmNGEyYjdhMSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWx2ZHMuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vcGFuZWwvcGFuZWwtbHZkcy5jCkBAIC04LDcgKzgsNiBAQAogICogQ29udGFjdDogTGF1cmVu
dCBQaW5jaGFydCAobGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tKQogICovCiAKLSNp
bmNsdWRlIDxsaW51eC9iYWNrbGlnaHQuaD4KICNpbmNsdWRlIDxsaW51eC9ncGlvL2NvbnN1bWVy
Lmg+CiAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+CiAjaW5jbHVkZSA8bGludXgvb2ZfcGxhdGZv
cm0uaD4KQEAgLTM0LDcgKzMzLDYgQEAgc3RydWN0IHBhbmVsX2x2ZHMgewogCXVuc2lnbmVkIGlu
dCBidXNfZm9ybWF0OwogCWJvb2wgZGF0YV9taXJyb3I7CiAKLQlzdHJ1Y3QgYmFja2xpZ2h0X2Rl
dmljZSAqYmFja2xpZ2h0OwogCXN0cnVjdCByZWd1bGF0b3IgKnN1cHBseTsKIAogCXN0cnVjdCBn
cGlvX2Rlc2MgKmVuYWJsZV9ncGlvOwpAQCAtNDYsMTkgKzQ0LDYgQEAgc3RhdGljIGlubGluZSBz
dHJ1Y3QgcGFuZWxfbHZkcyAqdG9fcGFuZWxfbHZkcyhzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCkK
IAlyZXR1cm4gY29udGFpbmVyX29mKHBhbmVsLCBzdHJ1Y3QgcGFuZWxfbHZkcywgcGFuZWwpOwog
fQogCi1zdGF0aWMgaW50IHBhbmVsX2x2ZHNfZGlzYWJsZShzdHJ1Y3QgZHJtX3BhbmVsICpwYW5l
bCkKLXsKLQlzdHJ1Y3QgcGFuZWxfbHZkcyAqbHZkcyA9IHRvX3BhbmVsX2x2ZHMocGFuZWwpOwot
Ci0JaWYgKGx2ZHMtPmJhY2tsaWdodCkgewotCQlsdmRzLT5iYWNrbGlnaHQtPnByb3BzLnBvd2Vy
ID0gRkJfQkxBTktfUE9XRVJET1dOOwotCQlsdmRzLT5iYWNrbGlnaHQtPnByb3BzLnN0YXRlIHw9
IEJMX0NPUkVfRkJCTEFOSzsKLQkJYmFja2xpZ2h0X3VwZGF0ZV9zdGF0dXMobHZkcy0+YmFja2xp
Z2h0KTsKLQl9Ci0KLQlyZXR1cm4gMDsKLX0KLQogc3RhdGljIGludCBwYW5lbF9sdmRzX3VucHJl
cGFyZShzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCkKIHsKIAlzdHJ1Y3QgcGFuZWxfbHZkcyAqbHZk
cyA9IHRvX3BhbmVsX2x2ZHMocGFuZWwpOwpAQCAtOTMsMTkgKzc4LDYgQEAgc3RhdGljIGludCBw
YW5lbF9sdmRzX3ByZXBhcmUoc3RydWN0IGRybV9wYW5lbCAqcGFuZWwpCiAJcmV0dXJuIDA7CiB9
CiAKLXN0YXRpYyBpbnQgcGFuZWxfbHZkc19lbmFibGUoc3RydWN0IGRybV9wYW5lbCAqcGFuZWwp
Ci17Ci0Jc3RydWN0IHBhbmVsX2x2ZHMgKmx2ZHMgPSB0b19wYW5lbF9sdmRzKHBhbmVsKTsKLQot
CWlmIChsdmRzLT5iYWNrbGlnaHQpIHsKLQkJbHZkcy0+YmFja2xpZ2h0LT5wcm9wcy5zdGF0ZSAm
PSB+QkxfQ09SRV9GQkJMQU5LOwotCQlsdmRzLT5iYWNrbGlnaHQtPnByb3BzLnBvd2VyID0gRkJf
QkxBTktfVU5CTEFOSzsKLQkJYmFja2xpZ2h0X3VwZGF0ZV9zdGF0dXMobHZkcy0+YmFja2xpZ2h0
KTsKLQl9Ci0KLQlyZXR1cm4gMDsKLX0KLQogc3RhdGljIGludCBwYW5lbF9sdmRzX2dldF9tb2Rl
cyhzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCwKIAkJCQlzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29u
bmVjdG9yKQogewpAQCAtMTMyLDEwICsxMDQsOCBAQCBzdGF0aWMgaW50IHBhbmVsX2x2ZHNfZ2V0
X21vZGVzKHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsLAogfQogCiBzdGF0aWMgY29uc3Qgc3RydWN0
IGRybV9wYW5lbF9mdW5jcyBwYW5lbF9sdmRzX2Z1bmNzID0gewotCS5kaXNhYmxlID0gcGFuZWxf
bHZkc19kaXNhYmxlLAogCS51bnByZXBhcmUgPSBwYW5lbF9sdmRzX3VucHJlcGFyZSwKIAkucHJl
cGFyZSA9IHBhbmVsX2x2ZHNfcHJlcGFyZSwKLQkuZW5hYmxlID0gcGFuZWxfbHZkc19lbmFibGUs
CiAJLmdldF9tb2RlcyA9IHBhbmVsX2x2ZHNfZ2V0X21vZGVzLAogfTsKIApAQCAtMjQyLDEwICsy
MTIsNiBAQCBzdGF0aWMgaW50IHBhbmVsX2x2ZHNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikKIAkJcmV0dXJuIHJldDsKIAl9CiAKLQlsdmRzLT5iYWNrbGlnaHQgPSBkZXZtX29m
X2ZpbmRfYmFja2xpZ2h0KGx2ZHMtPmRldik7Ci0JaWYgKElTX0VSUihsdmRzLT5iYWNrbGlnaHQp
KQotCQlyZXR1cm4gUFRSX0VSUihsdmRzLT5iYWNrbGlnaHQpOwotCiAJLyoKIAkgKiBUT0RPOiBI
YW5kbGUgYWxsIHBvd2VyIHN1cHBsaWVzIHNwZWNpZmllZCBpbiB0aGUgRFQgbm9kZSBpbiBhIGdl
bmVyaWMKIAkgKiB3YXkgZm9yIHBhbmVscyB0aGF0IGRvbid0IGNhcmUgYWJvdXQgcG93ZXIgc3Vw
cGx5IG9yZGVyaW5nLiBMVkRTCkBAIC0yNTcsNiArMjIzLDEwIEBAIHN0YXRpYyBpbnQgcGFuZWxf
bHZkc19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCWRybV9wYW5lbF9pbml0
KCZsdmRzLT5wYW5lbCwgbHZkcy0+ZGV2LCAmcGFuZWxfbHZkc19mdW5jcywKIAkJICAgICAgIERS
TV9NT0RFX0NPTk5FQ1RPUl9MVkRTKTsKIAorCXJldCA9IGRybV9wYW5lbF9vZl9iYWNrbGlnaHQo
Jmx2ZHMtPnBhbmVsKTsKKwlpZiAocmV0KQorCQlyZXR1cm4gcmV0OworCiAJcmV0ID0gZHJtX3Bh
bmVsX2FkZCgmbHZkcy0+cGFuZWwpOwogCWlmIChyZXQgPCAwKQogCQlyZXR1cm4gcmV0OwpAQCAt
MjcxLDcgKzI0MSw3IEBAIHN0YXRpYyBpbnQgcGFuZWxfbHZkc19yZW1vdmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKIAogCWRybV9wYW5lbF9yZW1vdmUoJmx2ZHMtPnBhbmVsKTsKIAot
CXBhbmVsX2x2ZHNfZGlzYWJsZSgmbHZkcy0+cGFuZWwpOworCWRybV9wYW5lbF9kaXNhYmxlKCZs
dmRzLT5wYW5lbCk7CiAKIAlyZXR1cm4gMDsKIH0KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
