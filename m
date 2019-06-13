Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E75EB45626
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 09:25:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDA2B897DC;
	Fri, 14 Jun 2019 07:22:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 833EB89AA6
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 14:34:54 +0000 (UTC)
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([2002:4e20:1eda:1:222:68ff:fe15:37dd]:44768 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1hbQlm-0003Yj-7Y; Thu, 13 Jun 2019 15:32:02 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim
 4.82_1-5b7a7c0-XX) (envelope-from <rmk@armlinux.org.uk>)
 id 1hbQlh-00080Q-4M; Thu, 13 Jun 2019 15:31:57 +0100
In-Reply-To: <20190613142943.vhgiy6yvyjz6uqlp@shell.armlinux.org.uk>
References: <20190613142943.vhgiy6yvyjz6uqlp@shell.armlinux.org.uk>
From: Russell King <rmk+kernel@armlinux.org.uk>
To: Sven Van Asbroeck <thesven73@gmail.com>, Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Jyri Sarha <jsarha@ti.com>
Subject: [PATCH v2 13/13] drm/i2c: tda998x: add vendor specific infoframe
 support
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1hbQlh-00080Q-4M@rmk-PC.armlinux.org.uk>
Date: Thu, 13 Jun 2019 15:31:57 +0100
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:21:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SuESKxrG1mvK73dR2G/E02F2q/pvLt/NpGuhnVxEJY8=; b=RI/EOzADUNyrkvrAbZXLCa8ZkU
 V9boWYTM2hHC3pgyADxGTkcHDF+iI447zJyMacRmOSPdFp3kutQqU8a9F6zE1/83ph2xNYYAnC7B4
 f6rMYdCgREc71wOdRxn5s6mO6/LO3RUzJZtfi4iRQO7QjlcXRh95ldxMsuHcju+bDy8ZIoxCsv0LS
 JKr8czxIUzBxrv+z//fNOgk+PCW6+uc6cNeSC/hP1SXLgTTpVJh8+g2BCX/5fHwRZhj6SO9jcxDFX
 eED07xHbL0w4A7mQIISsQcFTqchWHHqK2fbp8YGQbRG4kxLHWx/2b2RusDoVVP86/lOEJbzpSNONj
 cdng1ieg==;
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

QWRkIHN1cHBvcnQgZm9yIHRoZSB2ZW5kb3Igc3BlY2lmaWMgaW5mb2ZyYW1lLgoKUmV2aWV3ZWQt
Ynk6IEJyaWFuIFN0YXJrZXkgPGJyaWFuLnN0YXJrZXlAYXJtLmNvbT4KU2lnbmVkLW9mZi1ieTog
UnVzc2VsbCBLaW5nIDxybWsra2VybmVsQGFybWxpbnV4Lm9yZy51az4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vaTJjL3RkYTk5OHhfZHJ2LmMgfCAxNCArKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5n
ZWQsIDE0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTJjL3Rk
YTk5OHhfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTJjL3RkYTk5OHhfZHJ2LmMKaW5kZXggMmQ2
OWFlZjU1NmE1Li4zZDM2OGM0MzE4NWYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pMmMv
dGRhOTk4eF9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTJjL3RkYTk5OHhfZHJ2LmMKQEAg
LTg3Nyw2ICs4NzcsMTkgQEAgdGRhOTk4eF93cml0ZV9hdmkoc3RydWN0IHRkYTk5OHhfcHJpdiAq
cHJpdiwgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUKIAl0ZGE5OTh4X3dyaXRl
X2lmKHByaXYsIERJUF9JRl9GTEFHU19JRjIsIFJFR19JRjJfSEIwLCAmZnJhbWUpOwogfQogCitz
dGF0aWMgdm9pZCB0ZGE5OTh4X3dyaXRlX3ZzaShzdHJ1Y3QgdGRhOTk4eF9wcml2ICpwcml2LAor
CQkJICAgICAgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUpCit7CisJdW5pb24g
aGRtaV9pbmZvZnJhbWUgZnJhbWU7CisKKwlpZiAoZHJtX2hkbWlfdmVuZG9yX2luZm9mcmFtZV9m
cm9tX2Rpc3BsYXlfbW9kZSgmZnJhbWUudmVuZG9yLmhkbWksCisJCQkJCQkJJnByaXYtPmNvbm5l
Y3RvciwKKwkJCQkJCQltb2RlKSkKKwkJcmVnX2NsZWFyKHByaXYsIFJFR19ESVBfSUZfRkxBR1Ms
IERJUF9JRl9GTEFHU19JRjEpOworCWVsc2UKKwkJdGRhOTk4eF93cml0ZV9pZihwcml2LCBESVBf
SUZfRkxBR1NfSUYxLCBSRUdfSUYxX0hCMCwgJmZyYW1lKTsKK30KKwogLyogQXVkaW8gc3VwcG9y
dCAqLwogCiBzdGF0aWMgY29uc3Qgc3RydWN0IHRkYTk5OHhfYXVkaW9fcm91dGUgdGRhOTk4eF9h
dWRpb19yb3V0ZVtBVURJT19ST1VURV9OVU1dID0gewpAQCAtMTY1NCw2ICsxNjY3LDcgQEAgc3Rh
dGljIHZvaWQgdGRhOTk4eF9icmlkZ2VfbW9kZV9zZXQoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRn
ZSwKIAkJcmVnX3NldChwcml2LCBSRUdfVFgzMywgVFgzM19IRE1JKTsKIAogCQl0ZGE5OTh4X3dy
aXRlX2F2aShwcml2LCBhZGp1c3RlZF9tb2RlKTsKKwkJdGRhOTk4eF93cml0ZV92c2kocHJpdiwg
YWRqdXN0ZWRfbW9kZSk7CiAKIAkJaWYgKHByaXYtPnNpbmtfaGFzX2F1ZGlvKQogCQkJdGRhOTk4
eF9jb25maWd1cmVfYXVkaW8ocHJpdik7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
