Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE8B41CF5
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 08:56:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B6AE89350;
	Wed, 12 Jun 2019 06:55:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DB4789129
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 11:09:40 +0000 (UTC)
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([2001:4d48:ad52:3201:222:68ff:fe15:37dd]:35978 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1haeXm-0004mD-GR; Tue, 11 Jun 2019 12:02:22 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim
 4.82_1-5b7a7c0-XX) (envelope-from <rmk@armlinux.org.uk>)
 id 1haeXi-0001yZ-FS; Tue, 11 Jun 2019 12:02:18 +0100
In-Reply-To: <20190611110052.iw6qbw2yvypxus6t@shell.armlinux.org.uk>
References: <20190611110052.iw6qbw2yvypxus6t@shell.armlinux.org.uk>
From: Russell King <rmk+kernel@armlinux.org.uk>
To: Sven Van Asbroeck <thesven73@gmail.com>, Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Jyri Sarha <jsarha@ti.com>
Subject: [PATCH 09/13] drm/i2c: tda998x: clean up tda998x_configure_audio()
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1haeXi-0001yZ-FS@rmk-PC.armlinux.org.uk>
Date: Tue, 11 Jun 2019 12:02:18 +0100
X-Mailman-Approved-At: Wed, 12 Jun 2019 06:53:41 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xq2nDXyUvJhOrC/GcSpMoqr+KyOFA5UxmWx4oMGccqY=; b=RNhr+DISLOYYCLtwIwAdVUp1UY
 KAmLy+0j4SjvH3Dgt5vPNCx7DCgx+aOF7wNhNR7kdllSxoekUp//tNWG1s7NE4PaemGQql8SuFsDS
 OCaFdzuQMxG9V7/xF1Kvy6AkgCKv3/HP8MSwbjn6PcEHZJZEjK6qInEN7/MfE6oLQ5QSPGusogGLk
 kb9ULRR7VqFyv84teIPZhRHXHTMMYLbqZXemUxfgh7/MCpySueQG8c79TkV5oJoEvcfkmzd8B88AM
 17PQj7mttV9VIW4scjAIiRQXMPbtFo28nL8T64Ur1VwjQA5bO+pV3akS2fdiZ5VagQy4GgIVRsXwX
 4PksWLbA==;
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dGRhOTk4eF9jb25maWd1cmVfYXVkaW8oKSBpcyBjYWxsZWQgdmlhIHNvbWUgcGF0aHMgd2hlcmUg
YW4gZXJyb3IKcmV0dXJuIGlzIG1lYW5pbmdsZXNzLCBhbmQgYXMgYSByZXN1bHQgb2YgbW92aW5n
IHRoZSBhdWRpbyByb3V0aW5nCmNvZGUsIHRoaXMgZnVuY3Rpb24gbm8gbG9uZ2VyIHJldHVybnMg
YW55IGVycm9ycywgc28gbGV0J3MgbWFrZSBpdAp2b2lkLiBXZSBjYW4gYWxzbyBtYWtlIHRkYTk5
OHhfd3JpdGVfYWlmKCkgcmV0dXJuIHZvaWQgYXMgd2VsbC4KCnRkYTk5OHhfY29uZmlndXJlX2F1
ZGlvKCkgYWxzbyBvbmx5IGV2ZXIgbmVlZHMgdG8gd3JpdGUgdGhlIGN1cnJlbnQKYXVkaW8gc2V0
dGluZ3MsIHNvIHNpbXBsaWZ5IHRoZSBjb2RlIGluIHRkYTk5OHhfYXVkaW9faHdfcGFyYW1zKCkK
c28gdGhhdCBjYW4gaGFwcGVuLgoKU2lnbmVkLW9mZi1ieTogUnVzc2VsbCBLaW5nIDxybWsra2Vy
bmVsQGFybWxpbnV4Lm9yZy51az4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTJjL3RkYTk5OHhfZHJ2
LmMgfCAyNiArKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEwIGlu
c2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9pMmMvdGRhOTk4eF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9pMmMvdGRhOTk4eF9kcnYuYwpp
bmRleCAxNGQxNjcyMzAxYWUuLjRiNTQ5MWUyMGFiNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2kyYy90ZGE5OTh4X2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pMmMvdGRhOTk4eF9k
cnYuYwpAQCAtODQ5LDE2ICs4NDksMTQgQEAgdGRhOTk4eF93cml0ZV9pZihzdHJ1Y3QgdGRhOTk4
eF9wcml2ICpwcml2LCB1OCBiaXQsIHUxNiBhZGRyLAogCXJlZ19zZXQocHJpdiwgUkVHX0RJUF9J
Rl9GTEFHUywgYml0KTsKIH0KIAotc3RhdGljIGludCB0ZGE5OTh4X3dyaXRlX2FpZihzdHJ1Y3Qg
dGRhOTk4eF9wcml2ICpwcml2LAotCQkJICAgICBzdHJ1Y3QgaGRtaV9hdWRpb19pbmZvZnJhbWUg
KmNlYSkKK3N0YXRpYyB2b2lkIHRkYTk5OHhfd3JpdGVfYWlmKHN0cnVjdCB0ZGE5OTh4X3ByaXYg
KnByaXYsCisJCQkgICAgICBzdHJ1Y3QgaGRtaV9hdWRpb19pbmZvZnJhbWUgKmNlYSkKIHsKIAl1
bmlvbiBoZG1pX2luZm9mcmFtZSBmcmFtZTsKIAogCWZyYW1lLmF1ZGlvID0gKmNlYTsKIAogCXRk
YTk5OHhfd3JpdGVfaWYocHJpdiwgRElQX0lGX0ZMQUdTX0lGNCwgUkVHX0lGNF9IQjAsICZmcmFt
ZSk7Ci0KLQlyZXR1cm4gMDsKIH0KIAogc3RhdGljIHZvaWQKQEAgLTk5MiwxNSArOTkwLDE1IEBA
IHN0YXRpYyB2b2lkIHRkYTk5OHhfYXVkaW9fbXV0ZShzdHJ1Y3QgdGRhOTk4eF9wcml2ICpwcml2
LCBib29sIG9uKQogCX0KIH0KIAotc3RhdGljIGludCB0ZGE5OTh4X2NvbmZpZ3VyZV9hdWRpbyhz
dHJ1Y3QgdGRhOTk4eF9wcml2ICpwcml2LAotCQkJCSBjb25zdCBzdHJ1Y3QgdGRhOTk4eF9hdWRp
b19zZXR0aW5ncyAqc2V0dGluZ3MpCitzdGF0aWMgdm9pZCB0ZGE5OTh4X2NvbmZpZ3VyZV9hdWRp
byhzdHJ1Y3QgdGRhOTk4eF9wcml2ICpwcml2KQogeworCXN0cnVjdCB0ZGE5OTh4X2F1ZGlvX3Nl
dHRpbmdzICpzZXR0aW5ncyA9ICZwcml2LT5hdWRpbzsKIAl1OCBidWZbNl0sIGFkaXY7CiAJdTMy
IG47CiAKIAkvKiBJZiBhdWRpbyBpcyBub3QgY29uZmlndXJlZCwgdGhlcmUgaXMgbm90aGluZyB0
byBkby4gKi8KIAlpZiAoc2V0dGluZ3MtPmVuYV9hcCA9PSAwKQotCQlyZXR1cm4gMDsKKwkJcmV0
dXJuOwogCiAJYWRpdiA9IHRkYTk5OHhfZ2V0X2FkaXYocHJpdiwgc2V0dGluZ3MtPnBhcmFtcy5z
YW1wbGVfcmF0ZSk7CiAKQEAgLTEwNDgsNyArMTA0Niw3IEBAIHN0YXRpYyBpbnQgdGRhOTk4eF9j
b25maWd1cmVfYXVkaW8oc3RydWN0IHRkYTk5OHhfcHJpdiAqcHJpdiwKIAltc2xlZXAoMjApOwog
CXRkYTk5OHhfYXVkaW9fbXV0ZShwcml2LCBmYWxzZSk7CiAKLQlyZXR1cm4gdGRhOTk4eF93cml0
ZV9haWYocHJpdiwgJnNldHRpbmdzLT5wYXJhbXMuY2VhKTsKKwl0ZGE5OTh4X3dyaXRlX2FpZihw
cml2LCAmc2V0dGluZ3MtPnBhcmFtcy5jZWEpOwogfQogCiBzdGF0aWMgaW50IHRkYTk5OHhfYXVk
aW9faHdfcGFyYW1zKHN0cnVjdCBkZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKQEAgLTExMDgsMTYg
KzExMDYsMTIgQEAgc3RhdGljIGludCB0ZGE5OTh4X2F1ZGlvX2h3X3BhcmFtcyhzdHJ1Y3QgZGV2
aWNlICpkZXYsIHZvaWQgKmRhdGEsCiAJCXJldHVybiByZXQ7CiAKIAltdXRleF9sb2NrKCZwcml2
LT5hdWRpb19tdXRleCk7CisJcHJpdi0+YXVkaW8gPSBhdWRpbzsKIAlpZiAocHJpdi0+c3VwcG9y
dHNfaW5mb2ZyYW1lcyAmJiBwcml2LT5zaW5rX2hhc19hdWRpbykKLQkJcmV0ID0gdGRhOTk4eF9j
b25maWd1cmVfYXVkaW8ocHJpdiwgJmF1ZGlvKTsKLQllbHNlCi0JCXJldCA9IDA7Ci0KLQlpZiAo
cmV0ID09IDApCi0JCXByaXYtPmF1ZGlvID0gYXVkaW87CisJCXRkYTk5OHhfY29uZmlndXJlX2F1
ZGlvKHByaXYpOwogCW11dGV4X3VubG9jaygmcHJpdi0+YXVkaW9fbXV0ZXgpOwogCi0JcmV0dXJu
IHJldDsKKwlyZXR1cm4gMDsKIH0KIAogc3RhdGljIHZvaWQgdGRhOTk4eF9hdWRpb19zaHV0ZG93
bihzdHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEpCkBAIC0xNjI5LDcgKzE2MjMsNyBAQCBz
dGF0aWMgdm9pZCB0ZGE5OTh4X2JyaWRnZV9tb2RlX3NldChzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJp
ZGdlLAogCQl0ZGE5OTh4X3dyaXRlX2F2aShwcml2LCBhZGp1c3RlZF9tb2RlKTsKIAogCQlpZiAo
cHJpdi0+c2lua19oYXNfYXVkaW8pCi0JCQl0ZGE5OTh4X2NvbmZpZ3VyZV9hdWRpbyhwcml2LCAm
cHJpdi0+YXVkaW8pOworCQkJdGRhOTk4eF9jb25maWd1cmVfYXVkaW8ocHJpdik7CiAJfQogCiAJ
bXV0ZXhfdW5sb2NrKCZwcml2LT5hdWRpb19tdXRleCk7Ci0tIAoyLjcuNAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
