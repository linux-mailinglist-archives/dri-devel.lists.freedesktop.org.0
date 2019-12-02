Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FD010F06A
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 20:34:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 038136E30D;
	Mon,  2 Dec 2019 19:33:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B26FB6E30E
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 19:33:49 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id n25so822478lfl.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2019 11:33:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=u1P14KeAOzrkL3LNTshRMs65q8V9CfCv8YTP7h0aK64=;
 b=Dx0gQvkwks8Cc0AZ3s070KXMkLpWNoxcqRIYlgrhIHldS70es3c37x14p/wP9mVt5x
 olb3Vqnegoy9h3ehEcyTf+TLSEBwbCto59bvXiNKCp4SbmFd7k8At8Lk7ttLjGDoh1/i
 oAeSkciRUS5b7NtZB+D/ND2sHhoxATKHi6sWlxo7jzxCGZ0IzcznHDe+mlR7umkJWH7F
 l8Ep6tKvTFaGEQsU3SsrnnTH2Vbkl0rTh8Q/1mVhwHvdVBWrsacP89ngGNi1UeBPpXU3
 UHVpe0B6ApH/uE+Xqrvk9sPwt3BU9391VLWzIYrfTzz14V9+kl/lRJUHrDzK6F7znNk5
 Vbxg==
X-Gm-Message-State: APjAAAV+5Y+twaxbkmNkIm4t5X2iola5CfWC3WmahhZm5bNK/NZ3440u
 wKoP1rFUMndP2gv3OE4IqWvNtmejASqqsg==
X-Google-Smtp-Source: APXvYqxwbVLzsiX6A4ZpKGEcYM1Fgrfee7HhMpCObNZmnZ3kty6IsgrehL3h2mIoslhqWhw9cf4q1A==
X-Received: by 2002:a05:6512:499:: with SMTP id v25mr439414lfq.9.1575315227477; 
 Mon, 02 Dec 2019 11:33:47 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 g13sm79482lfb.74.2019.12.02.11.33.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 11:33:46 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v1 23/26] drm/panel: sitronix-st7701: use drm_panel backlight
 support
Date: Mon,  2 Dec 2019 20:32:27 +0100
Message-Id: <20191202193230.21310-24-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191202193230.21310-1-sam@ravnborg.org>
References: <20191202193230.21310-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u1P14KeAOzrkL3LNTshRMs65q8V9CfCv8YTP7h0aK64=;
 b=JrpzjoCoLqwt9XJXm9NiiM6/tImyc78Qynmiev/loI9ukXyLXuVueEfltQnqgtLMsR
 JycYlyEvffuZWj7Z7TOdRqlz+dyRHYl5icP+sjNhYoVrW/GPm5XmLAsdlYd8VGUI4aOj
 vGYTy8sjIrLh/pcKwJ/iOhlyeCR3u06MCTKDI8Cvb8bFmM3gyXY+jwIWsXaDh8bqssFz
 hQw5MqZ1KqhzUUum8KD0GL3eFU2X6gW0+rpXl5mpPep81T1FBL9xtPRbI0xjfS3u78is
 Dx9sJKJwySbgX5RyJ+xbNW1dS8FbwR58QRkO08VBKwazlwTmeO0U0FJ9N15PZT741s1A
 Ru/g==
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
SmFnYW4gVGVraSA8amFnYW5AYW1hcnVsYXNvbHV0aW9ucy5jb20+CkNjOiBUaGllcnJ5IFJlZGlu
ZyA8dGhpZXJyeS5yZWRpbmdAZ21haWwuY29tPgpDYzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJv
cmcub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaXRyb25peC1zdDc3MDEu
YyB8IDEyICsrKystLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgOCBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2l0
cm9uaXgtc3Q3NzAxLmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2l0cm9uaXgtc3Q3
NzAxLmMKaW5kZXggYzA4YTg2NWEyYTkzLi40YjRmMjU1OGUzYjQgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaXRyb25peC1zdDc3MDEuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vcGFuZWwvcGFuZWwtc2l0cm9uaXgtc3Q3NzAxLmMKQEAgLTksNyArOSw2IEBACiAjaW5j
bHVkZSA8ZHJtL2RybV9wYW5lbC5oPgogI2luY2x1ZGUgPGRybS9kcm1fcHJpbnQuaD4KIAotI2lu
Y2x1ZGUgPGxpbnV4L2JhY2tsaWdodC5oPgogI2luY2x1ZGUgPGxpbnV4L2dwaW8vY29uc3VtZXIu
aD4KICNpbmNsdWRlIDxsaW51eC9kZWxheS5oPgogI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgpA
QCAtMTAzLDcgKzEwMiw2IEBAIHN0cnVjdCBzdDc3MDEgewogCXN0cnVjdCBtaXBpX2RzaV9kZXZp
Y2UgKmRzaTsKIAljb25zdCBzdHJ1Y3Qgc3Q3NzAxX3BhbmVsX2Rlc2MgKmRlc2M7CiAKLQlzdHJ1
Y3QgYmFja2xpZ2h0X2RldmljZSAqYmFja2xpZ2h0OwogCXN0cnVjdCByZWd1bGF0b3JfYnVsa19k
YXRhICpzdXBwbGllczsKIAlzdHJ1Y3QgZ3Bpb19kZXNjICpyZXNldDsKIAl1bnNpZ25lZCBpbnQg
c2xlZXBfZGVsYXk7CkBAIC0yMjMsNyArMjIxLDYgQEAgc3RhdGljIGludCBzdDc3MDFfZW5hYmxl
KHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsKQogCXN0cnVjdCBzdDc3MDEgKnN0NzcwMSA9IHBhbmVs
X3RvX3N0NzcwMShwYW5lbCk7CiAKIAlTVDc3MDFfRFNJKHN0NzcwMSwgTUlQSV9EQ1NfU0VUX0RJ
U1BMQVlfT04sIDB4MDApOwotCWJhY2tsaWdodF9lbmFibGUoc3Q3NzAxLT5iYWNrbGlnaHQpOwog
CiAJcmV0dXJuIDA7CiB9CkBAIC0yMzIsNyArMjI5LDYgQEAgc3RhdGljIGludCBzdDc3MDFfZGlz
YWJsZShzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCkKIHsKIAlzdHJ1Y3Qgc3Q3NzAxICpzdDc3MDEg
PSBwYW5lbF90b19zdDc3MDEocGFuZWwpOwogCi0JYmFja2xpZ2h0X2Rpc2FibGUoc3Q3NzAxLT5i
YWNrbGlnaHQpOwogCVNUNzcwMV9EU0koc3Q3NzAxLCBNSVBJX0RDU19TRVRfRElTUExBWV9PRkYs
IDB4MDApOwogCiAJcmV0dXJuIDA7CkBAIC0zNjYsMTAgKzM2Miw2IEBAIHN0YXRpYyBpbnQgc3Q3
NzAxX2RzaV9wcm9iZShzdHJ1Y3QgbWlwaV9kc2lfZGV2aWNlICpkc2kpCiAJCXJldHVybiBQVFJf
RVJSKHN0NzcwMS0+cmVzZXQpOwogCX0KIAotCXN0NzcwMS0+YmFja2xpZ2h0ID0gZGV2bV9vZl9m
aW5kX2JhY2tsaWdodCgmZHNpLT5kZXYpOwotCWlmIChJU19FUlIoc3Q3NzAxLT5iYWNrbGlnaHQp
KQotCQlyZXR1cm4gUFRSX0VSUihzdDc3MDEtPmJhY2tsaWdodCk7Ci0KIAlkcm1fcGFuZWxfaW5p
dCgmc3Q3NzAxLT5wYW5lbCwgJmRzaS0+ZGV2LCAmc3Q3NzAxX2Z1bmNzLAogCQkgICAgICAgRFJN
X01PREVfQ09OTkVDVE9SX0RTSSk7CiAKQEAgLTM4NCw2ICszNzYsMTAgQEAgc3RhdGljIGludCBz
dDc3MDFfZHNpX3Byb2JlKHN0cnVjdCBtaXBpX2RzaV9kZXZpY2UgKmRzaSkKIAkgKi8KIAlzdDc3
MDEtPnNsZWVwX2RlbGF5ID0gMTIwICsgZGVzYy0+cGFuZWxfc2xlZXBfZGVsYXk7CiAKKwlyZXQg
PSBkcm1fcGFuZWxfb2ZfYmFja2xpZ2h0KCZzdDc3MDEtPnBhbmVsKTsKKwlpZiAocmV0KQorCQly
ZXR1cm4gcmV0OworCiAJcmV0ID0gZHJtX3BhbmVsX2FkZCgmc3Q3NzAxLT5wYW5lbCk7CiAJaWYg
KHJldCA8IDApCiAJCXJldHVybiByZXQ7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
