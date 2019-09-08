Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B3AAD3B6
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2019 09:23:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A86BE8985A;
	Mon,  9 Sep 2019 07:23:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2419 seconds by postgrey-1.36 at gabe;
 Sun, 08 Sep 2019 21:17:37 UTC
Received: from mail.andi.de1.cc (mail.andi.de1.cc
 [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0526F89789
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Sep 2019 21:17:37 +0000 (UTC)
Received: from p200300ccff4729001a3da2fffebfd33a.dip0.t-ipconnect.de
 ([2003:cc:ff47:2900:1a3d:a2ff:febf:d33a] helo=aktux)
 by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <andreas@kemnade.info>)
 id 1i73vo-0000wP-Ro; Sun, 08 Sep 2019 22:37:09 +0200
Received: from andi by aktux with local (Exim 4.92)
 (envelope-from <andreas@kemnade.info>)
 id 1i73vo-0007rQ-HL; Sun, 08 Sep 2019 22:37:08 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com,
 robh+dt@kernel.org, mark.rutland@arm.com, b.zolnierkie@samsung.com,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH 1/2] backlight: lm3630a: add an enable gpio for the HWEN pin
Date: Sun,  8 Sep 2019 22:37:03 +0200
Message-Id: <20190908203704.30147-2-andreas@kemnade.info>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190908203704.30147-1-andreas@kemnade.info>
References: <20190908203704.30147-1-andreas@kemnade.info>
MIME-Version: 1.0
X-Spam-Score: -1.0 (-)
X-Mailman-Approved-At: Mon, 09 Sep 2019 07:23:02 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fNJRiTsyDxjrEnQ50hBd8V4TRodHhVtOX3D2dnRGh6U=; b=Zl4qQ3/c4bdZqDPUnab9jcHbmk
 eS8vOSMg1SlvMJ9mmyb41bVnb8r8VvhQNwadgQhVIO3PAl015xgzPm0lrSnkZDJZym5QDD3U31e8i
 I4482ByZXavOa84eKpp0R3BxL2774bWLXw0SoESbig7f52zKFB7lUDiAMlTsu3BU/7kI=;
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
Cc: Andreas Kemnade <andreas@kemnade.info>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rm9yIG5vdyBqdXN0IGVuYWJsZSBpdCBpbiB0aGUgcHJvYmUgZnVuY3Rpb24gdG8gYWxsb3cgaTJj
CmFjY2VzcyBhbmQgZGlzYWJsZSBpdCBvbiByZW1vdmUuIERpc2FibGluZyBhbHNvIG1lYW5zIHJl
c2V0dGluZwp0aGUgcmVnaXN0ZXIgdmFsdWVzIHRvIGRlZmF1bHQuCgpUZXN0ZWQgb24gS29ibyBD
bGFyYSBIRC4KClNpZ25lZC1vZmYtYnk6IEFuZHJlYXMgS2VtbmFkZSA8YW5kcmVhc0BrZW1uYWRl
LmluZm8+Ci0tLQogZHJpdmVycy92aWRlby9iYWNrbGlnaHQvbG0zNjMwYV9ibC5jIHwgMTggKysr
KysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2xtMzYzMGFfYmwuYyBiL2RyaXZlcnMvdmlk
ZW8vYmFja2xpZ2h0L2xtMzYzMGFfYmwuYwppbmRleCBiMDRiMzVkMDA3YTIuLjNiNDVhMTczMzE5
OCAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvbG0zNjMwYV9ibC5jCisrKyBi
L2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2xtMzYzMGFfYmwuYwpAQCAtMTIsNiArMTIsOCBAQAog
I2luY2x1ZGUgPGxpbnV4L3VhY2Nlc3MuaD4KICNpbmNsdWRlIDxsaW51eC9pbnRlcnJ1cHQuaD4K
ICNpbmNsdWRlIDxsaW51eC9yZWdtYXAuaD4KKyNpbmNsdWRlIDxsaW51eC9ncGlvL2NvbnN1bWVy
Lmg+CisjaW5jbHVkZSA8bGludXgvZ3Bpby5oPgogI2luY2x1ZGUgPGxpbnV4L3B3bS5oPgogI2lu
Y2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RhdGEvbG0zNjMwYV9ibC5oPgogCkBAIC00OCw2ICs1MCw3
IEBAIHN0cnVjdCBsbTM2MzBhX2NoaXAgewogCXN0cnVjdCBsbTM2MzBhX3BsYXRmb3JtX2RhdGEg
KnBkYXRhOwogCXN0cnVjdCBiYWNrbGlnaHRfZGV2aWNlICpibGVkYTsKIAlzdHJ1Y3QgYmFja2xp
Z2h0X2RldmljZSAqYmxlZGI7CisJc3RydWN0IGdwaW9fZGVzYyAqZW5hYmxlX2dwaW87CiAJc3Ry
dWN0IHJlZ21hcCAqcmVnbWFwOwogCXN0cnVjdCBwd21fZGV2aWNlICpwd21kOwogfTsKQEAgLTUw
Niw2ICs1MDksMTQgQEAgc3RhdGljIGludCBsbTM2MzBhX3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50
ICpjbGllbnQsCiAJCXJldHVybiAtRU5PTUVNOwogCXBjaGlwLT5kZXYgPSAmY2xpZW50LT5kZXY7
CiAKKwlwY2hpcC0+ZW5hYmxlX2dwaW8gPSBkZXZtX2dwaW9kX2dldF9vcHRpb25hbCgmY2xpZW50
LT5kZXYsICJlbmFibGUiLAorCQkJCQkJR1BJT0RfQVNJUyk7CisJaWYgKElTX0VSUihwY2hpcC0+
ZW5hYmxlX2dwaW8pKSB7CisJCXJ2YWwgPSBQVFJfRVJSKHBjaGlwLT5lbmFibGVfZ3Bpbyk7CisJ
CXJldHVybiBydmFsOworCX0KKworCiAJcGNoaXAtPnJlZ21hcCA9IGRldm1fcmVnbWFwX2luaXRf
aTJjKGNsaWVudCwgJmxtMzYzMGFfcmVnbWFwKTsKIAlpZiAoSVNfRVJSKHBjaGlwLT5yZWdtYXAp
KSB7CiAJCXJ2YWwgPSBQVFJfRVJSKHBjaGlwLT5yZWdtYXApOwpAQCAtNTM1LDYgKzU0NiwxMCBA
QCBzdGF0aWMgaW50IGxtMzYzMGFfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCwKIAl9
CiAJcGNoaXAtPnBkYXRhID0gcGRhdGE7CiAKKwlpZiAocGNoaXAtPmVuYWJsZV9ncGlvKSB7CisJ
CWdwaW9kX3NldF92YWx1ZV9jYW5zbGVlcChwY2hpcC0+ZW5hYmxlX2dwaW8sIDEpOworCQl1c2xl
ZXBfcmFuZ2UoMTAwMCwgMjAwMCk7CisJfQogCS8qIGNoaXAgaW5pdGlhbGl6ZSAqLwogCXJ2YWwg
PSBsbTM2MzBhX2NoaXBfaW5pdChwY2hpcCk7CiAJaWYgKHJ2YWwgPCAwKSB7CkBAIC01ODYsNiAr
NjAxLDkgQEAgc3RhdGljIGludCBsbTM2MzBhX3JlbW92ZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xp
ZW50KQogCWlmIChydmFsIDwgMCkKIAkJZGV2X2VycihwY2hpcC0+ZGV2LCAiaTJjIGZhaWxlZCB0
byBhY2Nlc3MgcmVnaXN0ZXJcbiIpOwogCisJaWYgKHBjaGlwLT5lbmFibGVfZ3BpbykKKwkJZ3Bp
b2Rfc2V0X3ZhbHVlX2NhbnNsZWVwKHBjaGlwLT5lbmFibGVfZ3BpbywgMCk7CisKIAlpZiAocGNo
aXAtPmlycSkgewogCQlmcmVlX2lycShwY2hpcC0+aXJxLCBwY2hpcCk7CiAJCWZsdXNoX3dvcmtx
dWV1ZShwY2hpcC0+aXJxdGhyZWFkKTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
