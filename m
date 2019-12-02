Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D0A10F06D
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 20:34:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A25546E30E;
	Mon,  2 Dec 2019 19:33:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B31616E30F
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 19:33:54 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id r15so808729lff.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2019 11:33:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=CU1uoHEr1EClqVOFtZU3zB21PkkAQa6gthbvOIOjhXw=;
 b=esUBw8FlOfHLH+Fi5VCftTIz8eO8r8DzNA9Pf2ec7FfgCQd4VXrzkIYpSmCD932tnj
 bi+SvGuZyrXqNa3RQINNWrYy77xMGW5RbhjLamCdMvD8BOB9/eELgXVBU+yuQgWmX0cW
 5msrDXU6zkzppvY11qFm3ryJuz91CxMEn/teznriDdmnBBsBr2CCfpS/hKTV/4eFtdDK
 4CTchMTJtAax7990zH+PF3nJs08RTDfDcNOqceE1bZPCB9zJRor3JbPSI2ftI7sg9xVV
 bvy4J3kh3Eu1klb28eC5a4vbTySsq+zB4PJfr5QeMdcXK9+YsH1+4sG2wMQ3Vgf4h0eQ
 uaZA==
X-Gm-Message-State: APjAAAWHsfwEwRhAkhuQmFZX1glANnlcbS0vzL56ZGmFSV3QguDX/3kV
 XMtMYo2JlnRGsS20denVSwX1/moC/ZqLVw==
X-Google-Smtp-Source: APXvYqy6JtwNRfjOhSCiLRMY0PnjwO80lGs4bEHgQWo2w/EjSnAnF5rp0zEQoTYkYl1Ki13jCNJp3w==
X-Received: by 2002:ac2:5388:: with SMTP id g8mr412443lfh.43.1575315232849;
 Mon, 02 Dec 2019 11:33:52 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 g13sm79482lfb.74.2019.12.02.11.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 11:33:52 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v1 26/26] drm/panel: tpo-tpg110: use drm_panel backlight
 support
Date: Mon,  2 Dec 2019 20:32:30 +0100
Message-Id: <20191202193230.21310-27-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191202193230.21310-1-sam@ravnborg.org>
References: <20191202193230.21310-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CU1uoHEr1EClqVOFtZU3zB21PkkAQa6gthbvOIOjhXw=;
 b=sQ5sz84ahngu04detfdJb7WzDQ0QcopqKxnDfHTl6wWuDWFdmsW99YWf0HBWKVWdCP
 RtINs73RJ+Sk7G71eUzuQ9dzzWizDYLIb9hlwzETpJLExqI+mi5bryV4yuHDhM1bk64b
 vEQDA0fYt2NVXGAInm08lTk2qc9z8Zuy/bBxOD7ZeK96/nmYABuBHoroyzZmnlYo/3hL
 e6lBlbFUTJ/vQgNEhqRXR+CF6RtFCvzDPOJRsXl7kAidChgKhYB4T34t/JadF6qMZ/54
 Ia1/574eLMCCnimEAcJi1a8cMBlCfwJLuzWlre+3Lh7dtm0Umq9xTA63WTRQ+KYk8fR2
 Esxg==
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
TGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgpDYzogVGhpZXJyeSBSZWRp
bmcgPHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbT4KQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5i
b3JnLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtdHBvLXRwZzExMC5jIHwg
MjAgKysrKysrLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyks
IDE0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5l
bC10cG8tdHBnMTEwLmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtdHBvLXRwZzExMC5j
CmluZGV4IGJlZTIxM2VhMWE0Mi4uODQ3MmQwMThjMTZmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vcGFuZWwvcGFuZWwtdHBvLXRwZzExMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5l
bC9wYW5lbC10cG8tdHBnMTEwLmMKQEAgLTE0LDEzICsxNCwxMyBAQAogI2luY2x1ZGUgPGRybS9k
cm1fcGFuZWwuaD4KICNpbmNsdWRlIDxkcm0vZHJtX3ByaW50Lmg+CiAKLSNpbmNsdWRlIDxsaW51
eC9iYWNrbGlnaHQuaD4KICNpbmNsdWRlIDxsaW51eC9iaXRvcHMuaD4KICNpbmNsdWRlIDxsaW51
eC9kZWxheS5oPgogI2luY2x1ZGUgPGxpbnV4L2dwaW8vY29uc3VtZXIuaD4KICNpbmNsdWRlIDxs
aW51eC9pbml0Lmg+CiAjaW5jbHVkZSA8bGludXgva2VybmVsLmg+CiAjaW5jbHVkZSA8bGludXgv
bW9kdWxlLmg+CisjaW5jbHVkZSA8bGludXgvb2YuaD4KICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9y
bV9kZXZpY2UuaD4KICNpbmNsdWRlIDxsaW51eC9zcGkvc3BpLmg+CiAKQEAgLTc2LDEwICs3Niw2
IEBAIHN0cnVjdCB0cGcxMTAgewogCSAqIEBwYW5lbDogdGhlIERSTSBwYW5lbCBpbnN0YW5jZSBm
b3IgdGhpcyBkZXZpY2UKIAkgKi8KIAlzdHJ1Y3QgZHJtX3BhbmVsIHBhbmVsOwotCS8qKgotCSAq
IEBiYWNrbGlnaHQ6IGJhY2tsaWdodCBmb3IgdGhpcyBwYW5lbAotCSAqLwotCXN0cnVjdCBiYWNr
bGlnaHRfZGV2aWNlICpiYWNrbGlnaHQ7CiAJLyoqCiAJICogQHBhbmVsX3R5cGU6IHRoZSBwYW5l
bCBtb2RlIGFzIGRldGVjdGVkCiAJICovCkBAIC0zNTYsOCArMzUyLDYgQEAgc3RhdGljIGludCB0
cGcxMTBfZGlzYWJsZShzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCkKIAl2YWwgJj0gflRQRzExMF9D
VFJMMl9QTTsKIAl0cGcxMTBfd3JpdGVfcmVnKHRwZywgVFBHMTEwX0NUUkwyX1BNLCB2YWwpOwog
Ci0JYmFja2xpZ2h0X2Rpc2FibGUodHBnLT5iYWNrbGlnaHQpOwotCiAJcmV0dXJuIDA7CiB9CiAK
QEAgLTM2Niw4ICszNjAsNiBAQCBzdGF0aWMgaW50IHRwZzExMF9lbmFibGUoc3RydWN0IGRybV9w
YW5lbCAqcGFuZWwpCiAJc3RydWN0IHRwZzExMCAqdHBnID0gdG9fdHBnMTEwKHBhbmVsKTsKIAl1
OCB2YWw7CiAKLQliYWNrbGlnaHRfZW5hYmxlKHRwZy0+YmFja2xpZ2h0KTsKLQogCS8qIFRha2Ug
Y2hpcCBvdXQgb2Ygc3RhbmRieSAqLwogCXZhbCA9IHRwZzExMF9yZWFkX3JlZyh0cGcsIFRQRzEx
MF9DVFJMMl9QTSk7CiAJdmFsIHw9IFRQRzExMF9DVFJMMl9QTTsKQEAgLTQzMiwxMSArNDI0LDYg
QEAgc3RhdGljIGludCB0cGcxMTBfcHJvYmUoc3RydWN0IHNwaV9kZXZpY2UgKnNwaSkKIAlpZiAo
cmV0KQogCQlEUk1fREVWX0VSUk9SKGRldiwgIm5vIHBhbmVsIGhlaWdodCBzcGVjaWZpZWRcbiIp
OwogCi0JLyogTG9vayBmb3Igc29tZSBvcHRpb25hbCBiYWNrbGlnaHQgKi8KLQl0cGctPmJhY2ts
aWdodCA9IGRldm1fb2ZfZmluZF9iYWNrbGlnaHQoZGV2KTsKLQlpZiAoSVNfRVJSKHRwZy0+YmFj
a2xpZ2h0KSkKLQkJcmV0dXJuIFBUUl9FUlIodHBnLT5iYWNrbGlnaHQpOwotCiAJLyogVGhpcyBh
c3NlcnRzIHRoZSBHUkVTVEIgc2lnbmFsLCBwdXR0aW5nIHRoZSBkaXNwbGF5IGludG8gcmVzZXQg
Ki8KIAl0cGctPmdyZXN0YiA9IGRldm1fZ3Bpb2RfZ2V0KGRldiwgImdyZXN0YiIsIEdQSU9EX09V
VF9ISUdIKTsKIAlpZiAoSVNfRVJSKHRwZy0+Z3Jlc3RiKSkgewpAQCAtNDU5LDYgKzQ0NiwxMSBA
QCBzdGF0aWMgaW50IHRwZzExMF9wcm9iZShzdHJ1Y3Qgc3BpX2RldmljZSAqc3BpKQogCiAJZHJt
X3BhbmVsX2luaXQoJnRwZy0+cGFuZWwsIGRldiwgJnRwZzExMF9kcm1fZnVuY3MsCiAJCSAgICAg
ICBEUk1fTU9ERV9DT05ORUNUT1JfRFBJKTsKKworCXJldCA9IGRybV9wYW5lbF9vZl9iYWNrbGln
aHQoJnRwZy0+cGFuZWwpOworCWlmIChyZXQpCisJCXJldHVybiByZXQ7CisKIAlzcGlfc2V0X2Ry
dmRhdGEoc3BpLCB0cGcpOwogCiAJcmV0dXJuIGRybV9wYW5lbF9hZGQoJnRwZy0+cGFuZWwpOwot
LSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
