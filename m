Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E36115C90
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2019 15:04:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66C9C6E194;
	Sat,  7 Dec 2019 14:04:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 440896E16B
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Dec 2019 14:04:26 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id r19so10733900ljg.3
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Dec 2019 06:04:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=a/X1ku96PJtMOzhRmVeY8hbSu7FlKPaZgSc8fbXe+3Q=;
 b=jemNz2gXglJXWenXj7OLK/x3iqfIT4Mvb7ngmBAQCFkmocRl+bpgcCJkeGh8MAoGD3
 GcKm5NpJ1Eh+MQYQyF71sNC+vsfTQicSZaqyF3379ba1Y6lVkDk7vqfkbPdJTQVUw8Xf
 H+YOozNj1AXFc+7IoEBbmV6SiwOGB82ubjCzf28o/Q7NAqEnY/JnJYYsvV1GUNWGf5sw
 rAFdNwWLMcwQ9rCHddnzy2FVpejVUCi6aVfg23jkm8w+y8nPcgvdmRNElllmwrQhgUQC
 LqK1168MbvBitKgWxVPBNlxe41FuyBkPyGiYxAKIXzDQpSmIsLv3/wmabrgRBUC07J45
 vN4w==
X-Gm-Message-State: APjAAAVVpQYvu5xbN/psxKw7F/lia4hZ/g0yhEMaHFXZE0XnWKmlw4cy
 WX4Gs1KGcjZDVegBmyWHgvWmydhbo+rhCA==
X-Google-Smtp-Source: APXvYqwFENSCVyDVwakZNKkQAOC32yhJVErz1ubaDfyLjZVYnCk6bftAg9IioG6emITjn57KtG6AsQ==
X-Received: by 2002:a2e:2e0e:: with SMTP id u14mr11617285lju.106.1575727464491; 
 Sat, 07 Dec 2019 06:04:24 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 w17sm5644188lfn.22.2019.12.07.06.04.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2019 06:04:24 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linus Walleij <linus.walleij@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 08/25] drm/panel: feiyang-fy07024di26a30d: use drm_panel
 backlight support
Date: Sat,  7 Dec 2019 15:03:36 +0100
Message-Id: <20191207140353.23967-9-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191207140353.23967-1-sam@ravnborg.org>
References: <20191207140353.23967-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a/X1ku96PJtMOzhRmVeY8hbSu7FlKPaZgSc8fbXe+3Q=;
 b=euqtqE1pfc3hrle5JL0T16PR1L5s+gJEwTWJzevgh0O7PZ66Jv2B50bf0spx1cau+t
 QePMKRl0lP8NMT/G0y+Ypfpy91xuYEAdflY9cuxYUJR/0OtX6NIbaI0Er2rS3gOxnFdt
 tg16hWbgLAlhru+jIbcRH4wTMqohJwkGHXeWOqt1JIFNw5fgO/4JyanxyGnXsyCZDap7
 wtYXIJhQABWszpbteIBw62xqiMfEYV29xOzGzGBNS/teKsSMj9y40x3IcYVfhxsgzd1u
 w/xEqE68bfhC3Sm5xv8oSO/g158a13sKqoy5QP+n5wZILCXOqSVde3mfFu4Il/I6sGtq
 bLbg==
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
Y29tPgpDYzogSmFnYW4gVGVraSA8amFnYW5AYW1hcnVsYXNvbHV0aW9ucy5jb20+CkNjOiBUaGll
cnJ5IFJlZGluZyA8dGhpZXJyeS5yZWRpbmdAZ21haWwuY29tPgpDYzogU2FtIFJhdm5ib3JnIDxz
YW1AcmF2bmJvcmcub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1mZWl5YW5n
LWZ5MDcwMjRkaTI2YTMwZC5jIHwgMTAgKysrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
cGFuZWwvcGFuZWwtZmVpeWFuZy1meTA3MDI0ZGkyNmEzMGQuYyBiL2RyaXZlcnMvZ3B1L2RybS9w
YW5lbC9wYW5lbC1mZWl5YW5nLWZ5MDcwMjRkaTI2YTMwZC5jCmluZGV4IDAxNTdkMTg0NGUzZS4u
OTViNzg5YWI5ZDI5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtZmVp
eWFuZy1meTA3MDI0ZGkyNmEzMGQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwt
ZmVpeWFuZy1meTA3MDI0ZGkyNmEzMGQuYwpAQCAtOSw3ICs5LDYgQEAKICNpbmNsdWRlIDxkcm0v
ZHJtX3BhbmVsLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9wcmludC5oPgogCi0jaW5jbHVkZSA8bGlu
dXgvYmFja2xpZ2h0Lmg+CiAjaW5jbHVkZSA8bGludXgvZ3Bpby9jb25zdW1lci5oPgogI2luY2x1
ZGUgPGxpbnV4L2RlbGF5Lmg+CiAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+CkBAIC0yMiw3ICsy
MSw2IEBAIHN0cnVjdCBmZWl5YW5nIHsKIAlzdHJ1Y3QgZHJtX3BhbmVsCXBhbmVsOwogCXN0cnVj
dCBtaXBpX2RzaV9kZXZpY2UJKmRzaTsKIAotCXN0cnVjdCBiYWNrbGlnaHRfZGV2aWNlCSpiYWNr
bGlnaHQ7CiAJc3RydWN0IHJlZ3VsYXRvcgkqZHZkZDsKIAlzdHJ1Y3QgcmVndWxhdG9yCSphdmRk
OwogCXN0cnVjdCBncGlvX2Rlc2MJKnJlc2V0OwpAQCAtMTAyLDcgKzEwMCw2IEBAIHN0YXRpYyBp
bnQgZmVpeWFuZ19lbmFibGUoc3RydWN0IGRybV9wYW5lbCAqcGFuZWwpCiAJbXNsZWVwKDIwMCk7
CiAKIAltaXBpX2RzaV9kY3Nfc2V0X2Rpc3BsYXlfb24oY3R4LT5kc2kpOwotCWJhY2tsaWdodF9l
bmFibGUoY3R4LT5iYWNrbGlnaHQpOwogCiAJcmV0dXJuIDA7CiB9CkBAIC0xMTEsNyArMTA4LDYg
QEAgc3RhdGljIGludCBmZWl5YW5nX2Rpc2FibGUoc3RydWN0IGRybV9wYW5lbCAqcGFuZWwpCiB7
CiAJc3RydWN0IGZlaXlhbmcgKmN0eCA9IHBhbmVsX3RvX2ZlaXlhbmcocGFuZWwpOwogCi0JYmFj
a2xpZ2h0X2Rpc2FibGUoY3R4LT5iYWNrbGlnaHQpOwogCXJldHVybiBtaXBpX2RzaV9kY3Nfc2V0
X2Rpc3BsYXlfb2ZmKGN0eC0+ZHNpKTsKIH0KIApAQCAtMjI1LDkgKzIyMSw5IEBAIHN0YXRpYyBp
bnQgZmVpeWFuZ19kc2lfcHJvYmUoc3RydWN0IG1pcGlfZHNpX2RldmljZSAqZHNpKQogCQlyZXR1
cm4gUFRSX0VSUihjdHgtPnJlc2V0KTsKIAl9CiAKLQljdHgtPmJhY2tsaWdodCA9IGRldm1fb2Zf
ZmluZF9iYWNrbGlnaHQoJmRzaS0+ZGV2KTsKLQlpZiAoSVNfRVJSKGN0eC0+YmFja2xpZ2h0KSkK
LQkJcmV0dXJuIFBUUl9FUlIoY3R4LT5iYWNrbGlnaHQpOworCXJldCA9IGRybV9wYW5lbF9vZl9i
YWNrbGlnaHQoJmN0eC0+cGFuZWwpOworCWlmIChyZXQpCisJCXJldHVybiByZXQ7CiAKIAlyZXQg
PSBkcm1fcGFuZWxfYWRkKCZjdHgtPnBhbmVsKTsKIAlpZiAocmV0IDwgMCkKLS0gCjIuMjAuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
