Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02641455D0
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 09:23:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A2528970E;
	Fri, 14 Jun 2019 07:21:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB09689AEE
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 15:02:26 +0000 (UTC)
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([2002:4e20:1eda:1:222:68ff:fe15:37dd]:44832 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1hbREv-0003je-RG; Thu, 13 Jun 2019 16:02:09 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim
 4.82_1-5b7a7c0-XX) (envelope-from <rmk@armlinux.org.uk>)
 id 1hbREt-00007E-Kt; Thu, 13 Jun 2019 16:02:07 +0100
In-Reply-To: <20190613150114.xqkyb7j7w4ve4yvr@shell.armlinux.org.uk>
References: <20190613150114.xqkyb7j7w4ve4yvr@shell.armlinux.org.uk>
From: Russell King <rmk+kernel@armlinux.org.uk>
To: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 05/18] drm/armada: add missing interlaced support for overlay
 frame
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1hbREt-00007E-Kt@rmk-PC.armlinux.org.uk>
Date: Thu, 13 Jun 2019 16:02:07 +0100
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:21:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d1PM1t1yva9oj22K8+RAN2TDl69BUdM1fp8Bn/6oAZM=; b=sBTu1WbT7K7arjX18h66T1mY+B
 DMhjo5cC3b1H1MMLooBEUbiIfIoKShW6lHA3KlTwiP9G8fr+cg4PK5cJ3pUcEOJaa2ZZnPq7ch2y8
 yZ8ihyk36kK+72Phiz5v9Mz9jU6lZOMS8UC40iURUiEntnLYpgWTrVbJwWBUlbgMA7CwXcCEGAoaj
 4D4D17bZZ0Knch6kXvWKb/+TwEBnUTxS4X8FieZpGEoxi/I1jxXfQi6K8FR+sFroafPQ62iwVFqz0
 eXo8cAIhYKiDutFSEG+ZxJ7SWNxmD6Lxbb6KbYp4RzoTH8/PvrFXwi1339Y6xjyr7DkjOEa+Outt6
 fNEY0oNw==;
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
Cc: David Airlie <airlied@linux.ie>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW50ZXJsYWNlZCBzdXBwb3J0IGhhcyBiZWVuIG1pc3NpbmcgZnJvbSB0aGUgb3ZlcmxheSBmcmFt
ZSwgd2hpY2ggaXMKc3ViLW9wdGltYWwuICBBZGQgc3VwcG9ydCBmb3IgdGhpcyBtaXNzaW5nIGZl
YXR1cmUuCgpTaWduZWQtb2ZmLWJ5OiBSdXNzZWxsIEtpbmcgPHJtaytrZXJuZWxAYXJtbGludXgu
b3JnLnVrPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hcm1hZGEvYXJtYWRhX292ZXJsYXkuYyB8IDcg
KysrKystLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtYWRhL2FybWFkYV9vdmVybGF5LmMgYi9k
cml2ZXJzL2dwdS9kcm0vYXJtYWRhL2FybWFkYV9vdmVybGF5LmMKaW5kZXggNTg5Y2RiNmE5ZGFl
Li5kOGQ2ZTQ2NDVjMWYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm1hZGEvYXJtYWRh
X292ZXJsYXkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtYWRhL2FybWFkYV9vdmVybGF5LmMK
QEAgLTEwNiwxMiArMTA2LDEzIEBAIHN0YXRpYyB2b2lkIGFybWFkYV9kcm1fb3ZlcmxheV9wbGFu
ZV9hdG9taWNfdXBkYXRlKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLAogCS8qIEZJWE1FOiBvdmVy
bGF5IG9uIGFuIGludGVybGFjZWQgZGlzcGxheSAqLwogCWlmIChvbGRfc3RhdGUtPnNyYy54MSAh
PSBzdGF0ZS0+c3JjLngxIHx8CiAJICAgIG9sZF9zdGF0ZS0+c3JjLnkxICE9IHN0YXRlLT5zcmMu
eTEgfHwKLQkgICAgb2xkX3N0YXRlLT5mYiAhPSBzdGF0ZS0+ZmIpIHsKKwkgICAgb2xkX3N0YXRl
LT5mYiAhPSBzdGF0ZS0+ZmIgfHwKKwkgICAgc3RhdGUtPmNydGMtPnN0YXRlLT5tb2RlX2NoYW5n
ZWQpIHsKIAkJY29uc3Qgc3RydWN0IGRybV9mb3JtYXRfaW5mbyAqZm9ybWF0OwogCQl1MTYgc3Jj
X3gsIHBpdGNoZXNbM107CiAJCXUzMiBhZGRyc1syXVszXTsKIAotCQlhcm1hZGFfZHJtX3BsYW5l
X2NhbGMoc3RhdGUsIGFkZHJzLCBwaXRjaGVzLCBmYWxzZSk7CisJCWFybWFkYV9kcm1fcGxhbmVf
Y2FsYyhzdGF0ZSwgYWRkcnMsIHBpdGNoZXMsIGRjcnRjLT5pbnRlcmxhY2VkKTsKIAogCQlhcm1h
ZGFfcmVnX3F1ZXVlX3NldChyZWdzLCBpZHgsIGFkZHJzWzBdWzBdLAogCQkJCSAgICAgTENEX1NQ
VV9ETUFfU1RBUlRfQUREUl9ZMCk7CkBAIC0xNDYsNiArMTQ3LDggQEAgc3RhdGljIHZvaWQgYXJt
YWRhX2RybV9vdmVybGF5X3BsYW5lX2F0b21pY191cGRhdGUoc3RydWN0IGRybV9wbGFuZSAqcGxh
bmUsCiAJCXNyY194ID0gc3RhdGUtPnNyYy54MSA+PiAxNjsKIAkJaWYgKGZvcm1hdC0+bnVtX3Bs
YW5lcyA9PSAxICYmIHNyY194ICYgKGZvcm1hdC0+aHN1YiAtIDEpKQogCQkJY2ZnIF49IENGR19E
TUFfTU9EKENGR19TV0FQVVYpOworCQlpZiAoZGNydGMtPmludGVybGFjZWQpCisJCQljZmcgfD0g
Q0ZHX0RNQV9GVE9HR0xFOwogCQljZmdfbWFzayA9IENGR19DQlNIX0VOQSB8IENGR19ETUFGT1JN
QVQgfAogCQkJICAgQ0ZHX0RNQV9NT0QoQ0ZHX1NXQVBSQiB8IENGR19TV0FQVVYgfAogCQkJCSAg
ICAgICBDRkdfU1dBUFlVIHwgQ0ZHX1lVVjJSR0IpIHwKLS0gCjIuNy40CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
