Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA303455B6
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 09:22:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F212D894FE;
	Fri, 14 Jun 2019 07:21:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6692289AA6
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 14:32:20 +0000 (UTC)
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([2002:4e20:1eda:1:222:68ff:fe15:37dd]:44760 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1hbQlQ-0003YD-9e; Thu, 13 Jun 2019 15:31:40 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim
 4.82_1-5b7a7c0-XX) (envelope-from <rmk@armlinux.org.uk>)
 id 1hbQlM-0007zy-Is; Thu, 13 Jun 2019 15:31:36 +0100
In-Reply-To: <20190613142943.vhgiy6yvyjz6uqlp@shell.armlinux.org.uk>
References: <20190613142943.vhgiy6yvyjz6uqlp@shell.armlinux.org.uk>
From: Russell King <rmk+kernel@armlinux.org.uk>
To: Sven Van Asbroeck <thesven73@gmail.com>, Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Jyri Sarha <jsarha@ti.com>
Subject: [PATCH v2 09/13] drm/i2c: tda998x: clean up tda998x_configure_audio()
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1hbQlM-0007zy-Is@rmk-PC.armlinux.org.uk>
Date: Thu, 13 Jun 2019 15:31:36 +0100
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:21:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uNJ3StzdtZGW6gRq46aKilHVAPQAAVhKTuNdzLpqDGY=; b=R//ORDXrTHCJfN5f9RNuknXYKe
 oo9EyPQgXg+D5LPrYkC8LikfO4e5Je7FAGidncqDtbk187YPbAn7gnjj/XfjHVQ03SGb1t9El8o2W
 vByQ5FoGkjydEuPC+P1LMrEB/GJ7r572LGV5AUuyiDS2wacElxY88xCvUlytRynuP8uYCgXVVeSFI
 GY0DQRGdSpCsde8XlwnX261cm6i/56i5I2aBe9uE76axYrRcgAbwGvCYhwv6HYWlrPDaXPyvBEmz0
 Pn0DDCrxRE11KVsm1FWxUXWQZ8AjMiOOVMKURzJTvekQPHhIgjfLZ2fCVu7XrXMUYO36v5K4GeODu
 ZoE5wCuA==;
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
bmRleCAwZDQ3Y2QxNDAxMWQuLmU0ZjBmNTY5OWQ2NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2kyYy90ZGE5OTh4X2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pMmMvdGRhOTk4eF9k
cnYuYwpAQCAtODQ5LDE2ICs4NDksMTQgQEAgdGRhOTk4eF93cml0ZV9pZihzdHJ1Y3QgdGRhOTk4
eF9wcml2ICpwcml2LCB1OCBiaXQsIHUxNiBhZGRyLAogCXJlZ19zZXQocHJpdiwgUkVHX0RJUF9J
Rl9GTEFHUywgYml0KTsKIH0KIAotc3RhdGljIGludCB0ZGE5OTh4X3dyaXRlX2FpZihzdHJ1Y3Qg
dGRhOTk4eF9wcml2ICpwcml2LAotCQkJICAgICBjb25zdCBzdHJ1Y3QgaGRtaV9hdWRpb19pbmZv
ZnJhbWUgKmNlYSkKK3N0YXRpYyB2b2lkIHRkYTk5OHhfd3JpdGVfYWlmKHN0cnVjdCB0ZGE5OTh4
X3ByaXYgKnByaXYsCisJCQkgICAgICBjb25zdCBzdHJ1Y3QgaGRtaV9hdWRpb19pbmZvZnJhbWUg
KmNlYSkKIHsKIAl1bmlvbiBoZG1pX2luZm9mcmFtZSBmcmFtZTsKIAogCWZyYW1lLmF1ZGlvID0g
KmNlYTsKIAogCXRkYTk5OHhfd3JpdGVfaWYocHJpdiwgRElQX0lGX0ZMQUdTX0lGNCwgUkVHX0lG
NF9IQjAsICZmcmFtZSk7Ci0KLQlyZXR1cm4gMDsKIH0KIAogc3RhdGljIHZvaWQKQEAgLTk5Miwx
NSArOTkwLDE1IEBAIHN0YXRpYyB2b2lkIHRkYTk5OHhfYXVkaW9fbXV0ZShzdHJ1Y3QgdGRhOTk4
eF9wcml2ICpwcml2LCBib29sIG9uKQogCX0KIH0KIAotc3RhdGljIGludCB0ZGE5OTh4X2NvbmZp
Z3VyZV9hdWRpbyhzdHJ1Y3QgdGRhOTk4eF9wcml2ICpwcml2LAotCQkJCSBjb25zdCBzdHJ1Y3Qg
dGRhOTk4eF9hdWRpb19zZXR0aW5ncyAqc2V0dGluZ3MpCitzdGF0aWMgdm9pZCB0ZGE5OTh4X2Nv
bmZpZ3VyZV9hdWRpbyhzdHJ1Y3QgdGRhOTk4eF9wcml2ICpwcml2KQogeworCWNvbnN0IHN0cnVj
dCB0ZGE5OTh4X2F1ZGlvX3NldHRpbmdzICpzZXR0aW5ncyA9ICZwcml2LT5hdWRpbzsKIAl1OCBi
dWZbNl0sIGFkaXY7CiAJdTMyIG47CiAKIAkvKiBJZiBhdWRpbyBpcyBub3QgY29uZmlndXJlZCwg
dGhlcmUgaXMgbm90aGluZyB0byBkby4gKi8KIAlpZiAoc2V0dGluZ3MtPmVuYV9hcCA9PSAwKQot
CQlyZXR1cm4gMDsKKwkJcmV0dXJuOwogCiAJYWRpdiA9IHRkYTk5OHhfZ2V0X2FkaXYocHJpdiwg
c2V0dGluZ3MtPnBhcmFtcy5zYW1wbGVfcmF0ZSk7CiAKQEAgLTEwNDgsNyArMTA0Niw3IEBAIHN0
YXRpYyBpbnQgdGRhOTk4eF9jb25maWd1cmVfYXVkaW8oc3RydWN0IHRkYTk5OHhfcHJpdiAqcHJp
diwKIAltc2xlZXAoMjApOwogCXRkYTk5OHhfYXVkaW9fbXV0ZShwcml2LCBmYWxzZSk7CiAKLQly
ZXR1cm4gdGRhOTk4eF93cml0ZV9haWYocHJpdiwgJnNldHRpbmdzLT5wYXJhbXMuY2VhKTsKKwl0
ZGE5OTh4X3dyaXRlX2FpZihwcml2LCAmc2V0dGluZ3MtPnBhcmFtcy5jZWEpOwogfQogCiBzdGF0
aWMgaW50IHRkYTk5OHhfYXVkaW9faHdfcGFyYW1zKHN0cnVjdCBkZXZpY2UgKmRldiwgdm9pZCAq
ZGF0YSwKQEAgLTExMDgsMTYgKzExMDYsMTIgQEAgc3RhdGljIGludCB0ZGE5OTh4X2F1ZGlvX2h3
X3BhcmFtcyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCiAJCXJldHVybiByZXQ7CiAK
IAltdXRleF9sb2NrKCZwcml2LT5hdWRpb19tdXRleCk7CisJcHJpdi0+YXVkaW8gPSBhdWRpbzsK
IAlpZiAocHJpdi0+c3VwcG9ydHNfaW5mb2ZyYW1lcyAmJiBwcml2LT5zaW5rX2hhc19hdWRpbykK
LQkJcmV0ID0gdGRhOTk4eF9jb25maWd1cmVfYXVkaW8ocHJpdiwgJmF1ZGlvKTsKLQllbHNlCi0J
CXJldCA9IDA7Ci0KLQlpZiAocmV0ID09IDApCi0JCXByaXYtPmF1ZGlvID0gYXVkaW87CisJCXRk
YTk5OHhfY29uZmlndXJlX2F1ZGlvKHByaXYpOwogCW11dGV4X3VubG9jaygmcHJpdi0+YXVkaW9f
bXV0ZXgpOwogCi0JcmV0dXJuIHJldDsKKwlyZXR1cm4gMDsKIH0KIAogc3RhdGljIHZvaWQgdGRh
OTk4eF9hdWRpb19zaHV0ZG93bihzdHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEpCkBAIC0x
NjI5LDcgKzE2MjMsNyBAQCBzdGF0aWMgdm9pZCB0ZGE5OTh4X2JyaWRnZV9tb2RlX3NldChzdHJ1
Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLAogCQl0ZGE5OTh4X3dyaXRlX2F2aShwcml2LCBhZGp1c3Rl
ZF9tb2RlKTsKIAogCQlpZiAocHJpdi0+c2lua19oYXNfYXVkaW8pCi0JCQl0ZGE5OTh4X2NvbmZp
Z3VyZV9hdWRpbyhwcml2LCAmcHJpdi0+YXVkaW8pOworCQkJdGRhOTk4eF9jb25maWd1cmVfYXVk
aW8ocHJpdik7CiAJfQogCiAJbXV0ZXhfdW5sb2NrKCZwcml2LT5hdWRpb19tdXRleCk7Ci0tIAoy
LjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
