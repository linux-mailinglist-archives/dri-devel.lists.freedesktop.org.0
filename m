Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9570F10F032
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 20:33:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44F896E2DD;
	Mon,  2 Dec 2019 19:33:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBC7D6E2D7
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 19:33:25 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id j6so859983lja.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2019 11:33:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=SZWMV+Yn1n2qxRJClXssw0x9jjzxt8p36cqP16qYlFw=;
 b=kcH0AfJ9/MkOJm2vTVzHpEAO0TwbJlAfaKKu9Qup2eY/6F8TBlMQ1qIrIqW4rtuWGK
 v9WoyC7Upc+WN1FxuGPfZoF2ybWC8ZwvRNyYwwodlnj5l4Dr+BnCKBBeDWzInZ1QZi2s
 feOpwdrh4rywIKQhOTYwNVDh9n2UCe4/N1NAaRQmSuBtJcUxtBHR53zF99WnXfxgRzzQ
 6M3i9QYaneys7zedVCpUBKri5/JMtpO+6BlHbg5iG2u4iV41KcA4uL02Zj98UA0wIpDI
 NcRG0+9YrY894P39xHAnXGgw37nI67bcnLYLkvU17k5lHjOvuUBZyjXqIbS3JlQbt/oi
 BfmQ==
X-Gm-Message-State: APjAAAUjcGinDulz5R7P7iUd0mLVoDirbUpmBq8lFGav/UPy3xWMGDPi
 tmX9su0UiB2Sd2gMGJzefa+q4Dt0A0MaYA==
X-Google-Smtp-Source: APXvYqyXXdCnUTLi1SoZH1pKdgl0Vb/3Bp3QBgnJto+WVAY2jbGBVOdB3Q4OelNXtyNkSlqln2bYfQ==
X-Received: by 2002:a2e:89c6:: with SMTP id c6mr264410ljk.113.1575315203864;
 Mon, 02 Dec 2019 11:33:23 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 g13sm79482lfb.74.2019.12.02.11.33.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 11:33:23 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v1 10/26] drm/panel: ilitek-ili9881c: use drm_panel backlight
 support
Date: Mon,  2 Dec 2019 20:32:14 +0100
Message-Id: <20191202193230.21310-11-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191202193230.21310-1-sam@ravnborg.org>
References: <20191202193230.21310-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SZWMV+Yn1n2qxRJClXssw0x9jjzxt8p36cqP16qYlFw=;
 b=frMI18ND0CrGpRVoz0OF84/PH36Owh77oBXHkdHxFAhthah1O0rNVYydhRQb7d6viP
 BCk+dD/GzECwi/F2n2DqleQS893D3L2lqkpbbYK95/S/TIv4XagcmzI9eAo5q4uRuQg0
 xzhWOqXqvMgPDG5cYICG3bapo4zCav/4T+Idmji0shD088h5xUCqyDVlZ+zxlkn8tIGx
 a9ZHWmSRGNggrqIV3w7Q/5tL1+kql/xXrReYl5u34OrzQgWnRXjkGuFAd0M1X2aHk0B+
 eG8VKd22Sio2oqOYiybikcVPNtv+psbbAuVYKAjE7br9TYNcnyCgpNhutdtXJUOxwbc8
 CkPA==
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
ZyA8c2FtQHJhdm5ib3JnLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtaWxp
dGVrLWlsaTk4ODFjLmMgfCAxOSArKystLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vcGFuZWwvcGFuZWwtaWxpdGVrLWlsaTk4ODFjLmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFu
ZWwvcGFuZWwtaWxpdGVrLWlsaTk4ODFjLmMKaW5kZXggMzFlNWE0ZTY3NzUwLi5mNTQwNzdjMjE2
YTMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1pbGl0ZWstaWxpOTg4
MWMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtaWxpdGVrLWlsaTk4ODFjLmMK
QEAgLTMsNyArMyw2IEBACiAgKiBDb3B5cmlnaHQgKEMpIDIwMTctMjAxOCwgQm9vdGxpbgogICov
CiAKLSNpbmNsdWRlIDxsaW51eC9iYWNrbGlnaHQuaD4KICNpbmNsdWRlIDxsaW51eC9kZWxheS5o
PgogI2luY2x1ZGUgPGxpbnV4L2RldmljZS5oPgogI2luY2x1ZGUgPGxpbnV4L2Vyci5oPgpAQCAt
MjUsNyArMjQsNiBAQCBzdHJ1Y3QgaWxpOTg4MWMgewogCXN0cnVjdCBkcm1fcGFuZWwJcGFuZWw7
CiAJc3RydWN0IG1pcGlfZHNpX2RldmljZQkqZHNpOwogCi0Jc3RydWN0IGJhY2tsaWdodF9kZXZp
Y2UgKmJhY2tsaWdodDsKIAlzdHJ1Y3QgcmVndWxhdG9yCSpwb3dlcjsKIAlzdHJ1Y3QgZ3Bpb19k
ZXNjCSpyZXNldDsKIH07CkBAIC0zNDgsNyArMzQ2LDYgQEAgc3RhdGljIGludCBpbGk5ODgxY19l
bmFibGUoc3RydWN0IGRybV9wYW5lbCAqcGFuZWwpCiAJbXNsZWVwKDEyMCk7CiAKIAltaXBpX2Rz
aV9kY3Nfc2V0X2Rpc3BsYXlfb24oY3R4LT5kc2kpOwotCWJhY2tsaWdodF9lbmFibGUoY3R4LT5i
YWNrbGlnaHQpOwogCiAJcmV0dXJuIDA7CiB9CkBAIC0zNTcsNyArMzU0LDYgQEAgc3RhdGljIGlu
dCBpbGk5ODgxY19kaXNhYmxlKHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsKQogewogCXN0cnVjdCBp
bGk5ODgxYyAqY3R4ID0gcGFuZWxfdG9faWxpOTg4MWMocGFuZWwpOwogCi0JYmFja2xpZ2h0X2Rp
c2FibGUoY3R4LT5iYWNrbGlnaHQpOwogCXJldHVybiBtaXBpX2RzaV9kY3Nfc2V0X2Rpc3BsYXlf
b2ZmKGN0eC0+ZHNpKTsKIH0KIApAQCAtNDIzLDcgKzQxOSw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgZHJtX3BhbmVsX2Z1bmNzIGlsaTk4ODFjX2Z1bmNzID0gewogCiBzdGF0aWMgaW50IGlsaTk4
ODFjX2RzaV9wcm9iZShzdHJ1Y3QgbWlwaV9kc2lfZGV2aWNlICpkc2kpCiB7Ci0Jc3RydWN0IGRl
dmljZV9ub2RlICpucDsKIAlzdHJ1Y3QgaWxpOTg4MWMgKmN0eDsKIAlpbnQgcmV0OwogCkBAIC00
NDgsMTQgKzQ0Myw5IEBAIHN0YXRpYyBpbnQgaWxpOTg4MWNfZHNpX3Byb2JlKHN0cnVjdCBtaXBp
X2RzaV9kZXZpY2UgKmRzaSkKIAkJcmV0dXJuIFBUUl9FUlIoY3R4LT5yZXNldCk7CiAJfQogCi0J
bnAgPSBvZl9wYXJzZV9waGFuZGxlKGRzaS0+ZGV2Lm9mX25vZGUsICJiYWNrbGlnaHQiLCAwKTsK
LQlpZiAobnApIHsKLQkJY3R4LT5iYWNrbGlnaHQgPSBvZl9maW5kX2JhY2tsaWdodF9ieV9ub2Rl
KG5wKTsKLQkJb2Zfbm9kZV9wdXQobnApOwotCi0JCWlmICghY3R4LT5iYWNrbGlnaHQpCi0JCQly
ZXR1cm4gLUVQUk9CRV9ERUZFUjsKLQl9CisJcmV0ID0gZHJtX3BhbmVsX29mX2JhY2tsaWdodCgm
Y3R4LT5wYW5lbCk7CisJaWYgKHJldCkKKwkJcmV0dXJuIHJldDsKIAogCXJldCA9IGRybV9wYW5l
bF9hZGQoJmN0eC0+cGFuZWwpOwogCWlmIChyZXQgPCAwKQpAQCAtNDc1LDkgKzQ2NSw2IEBAIHN0
YXRpYyBpbnQgaWxpOTg4MWNfZHNpX3JlbW92ZShzdHJ1Y3QgbWlwaV9kc2lfZGV2aWNlICpkc2kp
CiAJbWlwaV9kc2lfZGV0YWNoKGRzaSk7CiAJZHJtX3BhbmVsX3JlbW92ZSgmY3R4LT5wYW5lbCk7
CiAKLQlpZiAoY3R4LT5iYWNrbGlnaHQpCi0JCXB1dF9kZXZpY2UoJmN0eC0+YmFja2xpZ2h0LT5k
ZXYpOwotCiAJcmV0dXJuIDA7CiB9CiAKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
