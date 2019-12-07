Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A88115CCF
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2019 15:05:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F59D6E1BA;
	Sat,  7 Dec 2019 14:04:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 367D56E1BA
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Dec 2019 14:04:56 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id m6so10743664ljc.1
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Dec 2019 06:04:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Ax5u03O4GlUXYUvsqNfWqp3nl/wfPRGvWRKaUynTqzE=;
 b=S3WZbNF2FuQMqACU1Z/w5sn2VJohzOaVPX9LYebZHR2KnhdkNZUCq/Ln4sroZHnYkT
 SD3bgU+n23Z7n2mv649lJKQ4tyl85ce04VKXlyMsP//65OMa2oDCKIghOj5lvT4r/h7Q
 B8AKwWaxIB15tvXju4pF1nkDPGEq7SIAAmtjTfkGb63ItvCrJLKFpMBGVDQnLBUGfCiz
 qnoVcSXFY1a+zG4O3JZsQELO2DqkKZOj10uplqcGgxPQIOMZ8LduccyIkIgjgJ9aPTdQ
 DixSFPNR1hnq3D4x0wO0m3cC8/tH5KyPljP5Hi44ZRDjvSN1UfjRj3S+b07HxKRnp1ty
 /9lg==
X-Gm-Message-State: APjAAAXgc7DBGBJdtWKjxzlM2lNG//kYStmE4ISJbExbmX4v64NFrVJ9
 VsNk0A8sU+K7Pa0R2PbcEvd1Og8gXlbUcw==
X-Google-Smtp-Source: APXvYqwuVFG+u6wmnSLIj8XDvpMwmzMMOJBAB41245Fellx5JQ1423tL59LT5rneoJWV6nyNmS7r1A==
X-Received: by 2002:a05:651c:1b5:: with SMTP id
 c21mr12024851ljn.115.1575727494401; 
 Sat, 07 Dec 2019 06:04:54 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 w17sm5644188lfn.22.2019.12.07.06.04.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2019 06:04:53 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linus Walleij <linus.walleij@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 25/25] drm/panel: tpo-tpg110: use drm_panel backlight
 support
Date: Sat,  7 Dec 2019 15:03:53 +0100
Message-Id: <20191207140353.23967-26-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191207140353.23967-1-sam@ravnborg.org>
References: <20191207140353.23967-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ax5u03O4GlUXYUvsqNfWqp3nl/wfPRGvWRKaUynTqzE=;
 b=MOsjEX8G2hTD3/Fqw0NAaEC1u+eRNTD8YHbsDUThxCNZ0y7lK+EPqSY7l0iB0EIoBu
 WR15mn/7DrpvWuejz3eWKvcRkQgfLwrUvNhSp1gY7/7ZlXFmSX2+iE1tyP4SKPER/keM
 AWg11mGYe7VbBl0OhcfPXQafEzJMP7xS6RJ2GlKsZ4uct5p4piuCX67LTXP/8Cavq5ES
 rNHvpjQTrS87tvX0PN23KywnIG3H2tBDf13yBTNiJ0TVC23/BCL2XGnKZMCACyg0zM7l
 GYvBqeAxr9/24mGWgBOXYagq5hgYuZyDuiQQqr+zUDXeJdI4Dsy103KEw0gG1d9kuI+p
 w8/A==
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
ZXdlZC1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgpSZXZpZXdl
ZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29t
PgpDYzogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgpDYzogVGhpZXJy
eSBSZWRpbmcgPHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbT4KQ2M6IFNhbSBSYXZuYm9yZyA8c2Ft
QHJhdm5ib3JnLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtdHBvLXRwZzEx
MC5jIHwgMjAgKysrKysrLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlv
bnMoKyksIDE0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5l
bC9wYW5lbC10cG8tdHBnMTEwLmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtdHBvLXRw
ZzExMC5jCmluZGV4IGJlZTIxM2VhMWE0Mi4uODQ3MmQwMThjMTZmIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtdHBvLXRwZzExMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9wYW5lbC9wYW5lbC10cG8tdHBnMTEwLmMKQEAgLTE0LDEzICsxNCwxMyBAQAogI2luY2x1ZGUg
PGRybS9kcm1fcGFuZWwuaD4KICNpbmNsdWRlIDxkcm0vZHJtX3ByaW50Lmg+CiAKLSNpbmNsdWRl
IDxsaW51eC9iYWNrbGlnaHQuaD4KICNpbmNsdWRlIDxsaW51eC9iaXRvcHMuaD4KICNpbmNsdWRl
IDxsaW51eC9kZWxheS5oPgogI2luY2x1ZGUgPGxpbnV4L2dwaW8vY29uc3VtZXIuaD4KICNpbmNs
dWRlIDxsaW51eC9pbml0Lmg+CiAjaW5jbHVkZSA8bGludXgva2VybmVsLmg+CiAjaW5jbHVkZSA8
bGludXgvbW9kdWxlLmg+CisjaW5jbHVkZSA8bGludXgvb2YuaD4KICNpbmNsdWRlIDxsaW51eC9w
bGF0Zm9ybV9kZXZpY2UuaD4KICNpbmNsdWRlIDxsaW51eC9zcGkvc3BpLmg+CiAKQEAgLTc2LDEw
ICs3Niw2IEBAIHN0cnVjdCB0cGcxMTAgewogCSAqIEBwYW5lbDogdGhlIERSTSBwYW5lbCBpbnN0
YW5jZSBmb3IgdGhpcyBkZXZpY2UKIAkgKi8KIAlzdHJ1Y3QgZHJtX3BhbmVsIHBhbmVsOwotCS8q
KgotCSAqIEBiYWNrbGlnaHQ6IGJhY2tsaWdodCBmb3IgdGhpcyBwYW5lbAotCSAqLwotCXN0cnVj
dCBiYWNrbGlnaHRfZGV2aWNlICpiYWNrbGlnaHQ7CiAJLyoqCiAJICogQHBhbmVsX3R5cGU6IHRo
ZSBwYW5lbCBtb2RlIGFzIGRldGVjdGVkCiAJICovCkBAIC0zNTYsOCArMzUyLDYgQEAgc3RhdGlj
IGludCB0cGcxMTBfZGlzYWJsZShzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCkKIAl2YWwgJj0gflRQ
RzExMF9DVFJMMl9QTTsKIAl0cGcxMTBfd3JpdGVfcmVnKHRwZywgVFBHMTEwX0NUUkwyX1BNLCB2
YWwpOwogCi0JYmFja2xpZ2h0X2Rpc2FibGUodHBnLT5iYWNrbGlnaHQpOwotCiAJcmV0dXJuIDA7
CiB9CiAKQEAgLTM2Niw4ICszNjAsNiBAQCBzdGF0aWMgaW50IHRwZzExMF9lbmFibGUoc3RydWN0
IGRybV9wYW5lbCAqcGFuZWwpCiAJc3RydWN0IHRwZzExMCAqdHBnID0gdG9fdHBnMTEwKHBhbmVs
KTsKIAl1OCB2YWw7CiAKLQliYWNrbGlnaHRfZW5hYmxlKHRwZy0+YmFja2xpZ2h0KTsKLQogCS8q
IFRha2UgY2hpcCBvdXQgb2Ygc3RhbmRieSAqLwogCXZhbCA9IHRwZzExMF9yZWFkX3JlZyh0cGcs
IFRQRzExMF9DVFJMMl9QTSk7CiAJdmFsIHw9IFRQRzExMF9DVFJMMl9QTTsKQEAgLTQzMiwxMSAr
NDI0LDYgQEAgc3RhdGljIGludCB0cGcxMTBfcHJvYmUoc3RydWN0IHNwaV9kZXZpY2UgKnNwaSkK
IAlpZiAocmV0KQogCQlEUk1fREVWX0VSUk9SKGRldiwgIm5vIHBhbmVsIGhlaWdodCBzcGVjaWZp
ZWRcbiIpOwogCi0JLyogTG9vayBmb3Igc29tZSBvcHRpb25hbCBiYWNrbGlnaHQgKi8KLQl0cGct
PmJhY2tsaWdodCA9IGRldm1fb2ZfZmluZF9iYWNrbGlnaHQoZGV2KTsKLQlpZiAoSVNfRVJSKHRw
Zy0+YmFja2xpZ2h0KSkKLQkJcmV0dXJuIFBUUl9FUlIodHBnLT5iYWNrbGlnaHQpOwotCiAJLyog
VGhpcyBhc3NlcnRzIHRoZSBHUkVTVEIgc2lnbmFsLCBwdXR0aW5nIHRoZSBkaXNwbGF5IGludG8g
cmVzZXQgKi8KIAl0cGctPmdyZXN0YiA9IGRldm1fZ3Bpb2RfZ2V0KGRldiwgImdyZXN0YiIsIEdQ
SU9EX09VVF9ISUdIKTsKIAlpZiAoSVNfRVJSKHRwZy0+Z3Jlc3RiKSkgewpAQCAtNDU5LDYgKzQ0
NiwxMSBAQCBzdGF0aWMgaW50IHRwZzExMF9wcm9iZShzdHJ1Y3Qgc3BpX2RldmljZSAqc3BpKQog
CiAJZHJtX3BhbmVsX2luaXQoJnRwZy0+cGFuZWwsIGRldiwgJnRwZzExMF9kcm1fZnVuY3MsCiAJ
CSAgICAgICBEUk1fTU9ERV9DT05ORUNUT1JfRFBJKTsKKworCXJldCA9IGRybV9wYW5lbF9vZl9i
YWNrbGlnaHQoJnRwZy0+cGFuZWwpOworCWlmIChyZXQpCisJCXJldHVybiByZXQ7CisKIAlzcGlf
c2V0X2RydmRhdGEoc3BpLCB0cGcpOwogCiAJcmV0dXJuIGRybV9wYW5lbF9hZGQoJnRwZy0+cGFu
ZWwpOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
