Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 618F8115CCC
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2019 15:04:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B6176E1B4;
	Sat,  7 Dec 2019 14:04:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89A936E1B4
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Dec 2019 14:04:49 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id d20so10660020ljc.12
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Dec 2019 06:04:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=hw0rPta+AA/XFBLEBOh9a+kLNOAcb6jsKbJs4LtSRgU=;
 b=GYIGwjtckNzizkvaqLoyEbLwjUKdWbiqVto6/ABHlyHsOwkJIdoRvKsAB/JDwIH3tY
 QXjQxPX3DwRUbSdFIP4QAFkkjrmuCbfXik94UZwTf4s+NKagHSDrmzpfcBkkLuFwr/ow
 xy2Oeai+mhdOmcV0CVNvxVpbkoV23aCOWHec4MGpU2A/CKO7T5++E2Pn8mVSZkmq3etQ
 1MY3ZhKgEmfYO8WWFZe82EkTO++HWk/lnST8BQCMMC3ltQ3DVMG/4MP06fGC8eQk18sK
 mpGmJCa0/cYacpuviy+jiFkvyEGpMNVDRx07KuC7cDrDILFGTslkP5M1deLbE6BFtA/a
 zOGw==
X-Gm-Message-State: APjAAAU0Hnb6E9PmH61DhH2xGpibqHd0V93W9kV4QT5X3R1gRuRY59J4
 r6wEw+VxEy6vjIlOVBqz5XEBgumWTSvKDg==
X-Google-Smtp-Source: APXvYqyWqS/UYClZRuV+PVSMCxa4dLKzGzQrOw/21c5lNjINDm39XRuZVV8pygqFWhwuQDk08wN9Sw==
X-Received: by 2002:a2e:b017:: with SMTP id y23mr11611110ljk.229.1575727487602; 
 Sat, 07 Dec 2019 06:04:47 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 w17sm5644188lfn.22.2019.12.07.06.04.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2019 06:04:47 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linus Walleij <linus.walleij@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 21/25] drm/panel: sharp-ls043t1le01: use drm_panel
 backlight support
Date: Sat,  7 Dec 2019 15:03:49 +0100
Message-Id: <20191207140353.23967-22-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191207140353.23967-1-sam@ravnborg.org>
References: <20191207140353.23967-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hw0rPta+AA/XFBLEBOh9a+kLNOAcb6jsKbJs4LtSRgU=;
 b=dujt1IVs5McsvvCsS7c3G0D/mTHDXUMi51mW2f99aBVUYnNM0USN10IKau9DTLbIXD
 N0w1Bxp2ZJQY4VWNYQZf6FDQd51O3sGNhWrqkB3oiiorl2hyxenjXW8v4i4n6DjmTHyv
 TWUFLU2Ow2/imOgILveZLZKmvAdZgNY/Ts4dRuLUCXML6td1LGA3UNom6LzqQ6gCV+t5
 gdcatQfkQ1WDpmFlbC+4HbLPGQ+gzXqkgVRKSHc9MEGkGFjFiZzolhPxEI5C3cKVent2
 vdsdkW1wpeBn3ajpWNmRLDC2AQapSvlxsrHAwg/JfiHH2CzarAQZBYcSc6lVbsqE8Pzt
 DAZQ==
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
bC1zaGFycC1sczA0M3QxbGUwMS5jICAgfCAyMCArKysrKysrLS0tLS0tLS0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2hhcnAtbHMwNDN0MWxlMDEuYyBiL2RyaXZlcnMv
Z3B1L2RybS9wYW5lbC9wYW5lbC1zaGFycC1sczA0M3QxbGUwMS5jCmluZGV4IDc5OTVjZjVhOWZj
NC4uYjYwYzRkYjFlZDZkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwt
c2hhcnAtbHMwNDN0MWxlMDEuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2hh
cnAtbHMwNDN0MWxlMDEuYwpAQCAtNyw3ICs3LDYgQEAKICAqIEJhc2VkIG9uIEFVTyBwYW5lbCBk
cml2ZXIgYnkgUm9iIENsYXJrIDxyb2JkY2xhcmtAZ21haWwuY29tPgogICovCiAKLSNpbmNsdWRl
IDxsaW51eC9iYWNrbGlnaHQuaD4KICNpbmNsdWRlIDxsaW51eC9kZWxheS5oPgogI2luY2x1ZGUg
PGxpbnV4L2dwaW8vY29uc3VtZXIuaD4KICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KQEAgLTI1
LDcgKzI0LDYgQEAgc3RydWN0IHNoYXJwX250X3BhbmVsIHsKIAlzdHJ1Y3QgZHJtX3BhbmVsIGJh
c2U7CiAJc3RydWN0IG1pcGlfZHNpX2RldmljZSAqZHNpOwogCi0Jc3RydWN0IGJhY2tsaWdodF9k
ZXZpY2UgKmJhY2tsaWdodDsKIAlzdHJ1Y3QgcmVndWxhdG9yICpzdXBwbHk7CiAJc3RydWN0IGdw
aW9fZGVzYyAqcmVzZXRfZ3BpbzsKIApAQCAtMTA3LDggKzEwNSw2IEBAIHN0YXRpYyBpbnQgc2hh
cnBfbnRfcGFuZWxfZGlzYWJsZShzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCkKIAlpZiAoIXNoYXJw
X250LT5lbmFibGVkKQogCQlyZXR1cm4gMDsKIAotCWJhY2tsaWdodF9kaXNhYmxlKHNoYXJwX250
LT5iYWNrbGlnaHQpOwotCiAJc2hhcnBfbnQtPmVuYWJsZWQgPSBmYWxzZTsKIAogCXJldHVybiAw
OwpAQCAtMTkwLDggKzE4Niw2IEBAIHN0YXRpYyBpbnQgc2hhcnBfbnRfcGFuZWxfZW5hYmxlKHN0
cnVjdCBkcm1fcGFuZWwgKnBhbmVsKQogCWlmIChzaGFycF9udC0+ZW5hYmxlZCkKIAkJcmV0dXJu
IDA7CiAKLQliYWNrbGlnaHRfZW5hYmxlKHNoYXJwX250LT5iYWNrbGlnaHQpOwotCiAJc2hhcnBf
bnQtPmVuYWJsZWQgPSB0cnVlOwogCiAJcmV0dXJuIDA7CkBAIC0yNDQsNiArMjM4LDcgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBkcm1fcGFuZWxfZnVuY3Mgc2hhcnBfbnRfcGFuZWxfZnVuY3MgPSB7
CiBzdGF0aWMgaW50IHNoYXJwX250X3BhbmVsX2FkZChzdHJ1Y3Qgc2hhcnBfbnRfcGFuZWwgKnNo
YXJwX250KQogewogCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZzaGFycF9udC0+ZHNpLT5kZXY7CisJ
aW50IHJldDsKIAogCXNoYXJwX250LT5tb2RlID0gJmRlZmF1bHRfbW9kZTsKIApAQCAtMjYwLDE0
ICsyNTUsMTMgQEAgc3RhdGljIGludCBzaGFycF9udF9wYW5lbF9hZGQoc3RydWN0IHNoYXJwX250
X3BhbmVsICpzaGFycF9udCkKIAkJZ3Bpb2Rfc2V0X3ZhbHVlKHNoYXJwX250LT5yZXNldF9ncGlv
LCAwKTsKIAl9CiAKLQlzaGFycF9udC0+YmFja2xpZ2h0ID0gZGV2bV9vZl9maW5kX2JhY2tsaWdo
dChkZXYpOwotCi0JaWYgKElTX0VSUihzaGFycF9udC0+YmFja2xpZ2h0KSkKLQkJcmV0dXJuIFBU
Ul9FUlIoc2hhcnBfbnQtPmJhY2tsaWdodCk7Ci0KIAlkcm1fcGFuZWxfaW5pdCgmc2hhcnBfbnQt
PmJhc2UsICZzaGFycF9udC0+ZHNpLT5kZXYsCiAJCSAgICAgICAmc2hhcnBfbnRfcGFuZWxfZnVu
Y3MsIERSTV9NT0RFX0NPTk5FQ1RPUl9EU0kpOwogCisJcmV0ID0gZHJtX3BhbmVsX29mX2JhY2ts
aWdodCgmc2hhcnBfbnQtPmJhc2UpOworCWlmIChyZXQpCisJCXJldHVybiByZXQ7CisKIAlyZXR1
cm4gZHJtX3BhbmVsX2FkZCgmc2hhcnBfbnQtPmJhc2UpOwogfQogCkBAIC0zMDksNyArMzAzLDcg
QEAgc3RhdGljIGludCBzaGFycF9udF9wYW5lbF9yZW1vdmUoc3RydWN0IG1pcGlfZHNpX2Rldmlj
ZSAqZHNpKQogCXN0cnVjdCBzaGFycF9udF9wYW5lbCAqc2hhcnBfbnQgPSBtaXBpX2RzaV9nZXRf
ZHJ2ZGF0YShkc2kpOwogCWludCByZXQ7CiAKLQlyZXQgPSBzaGFycF9udF9wYW5lbF9kaXNhYmxl
KCZzaGFycF9udC0+YmFzZSk7CisJcmV0ID0gZHJtX3BhbmVsX2Rpc2FibGUoJnNoYXJwX250LT5i
YXNlKTsKIAlpZiAocmV0IDwgMCkKIAkJZGV2X2VycigmZHNpLT5kZXYsICJmYWlsZWQgdG8gZGlz
YWJsZSBwYW5lbDogJWRcbiIsIHJldCk7CiAKQEAgLTMyNiw3ICszMjAsNyBAQCBzdGF0aWMgdm9p
ZCBzaGFycF9udF9wYW5lbF9zaHV0ZG93bihzdHJ1Y3QgbWlwaV9kc2lfZGV2aWNlICpkc2kpCiB7
CiAJc3RydWN0IHNoYXJwX250X3BhbmVsICpzaGFycF9udCA9IG1pcGlfZHNpX2dldF9kcnZkYXRh
KGRzaSk7CiAKLQlzaGFycF9udF9wYW5lbF9kaXNhYmxlKCZzaGFycF9udC0+YmFzZSk7CisJZHJt
X3BhbmVsX2Rpc2FibGUoJnNoYXJwX250LT5iYXNlKTsKIH0KIAogc3RhdGljIGNvbnN0IHN0cnVj
dCBvZl9kZXZpY2VfaWQgc2hhcnBfbnRfb2ZfbWF0Y2hbXSA9IHsKLS0gCjIuMjAuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
