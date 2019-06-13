Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 525E0435A8
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 13:46:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE2E789935;
	Thu, 13 Jun 2019 11:46:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F389389935
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 11:46:20 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6427821743;
 Thu, 13 Jun 2019 11:46:20 +0000 (UTC)
Date: Thu, 13 Jun 2019 13:46:18 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Vincent Abriou <vincent.abriou@st.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] sti: no need to check return value of debugfs_create functions
Message-ID: <20190613114618.GD13119@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560426380;
 bh=8kF+965omjc0tWMJ0qOmKWiX3PMZLuKdmY5shJdqZPc=;
 h=Date:From:To:Cc:Subject:From;
 b=yU4YeTZ8hGaZvFEqIexSC3iu63d8ew/s5FY/JLa90S4NP2xODwR/+Jx+TRPKZYbrJ
 RidkJpvgzk9ar2UC7EGWi0BJhovnwqKxg3WgHAfJVx+/ORZ3UJcxI39UuGk98s9B5l
 tobn02ZCacf81gWaZ3Ss6Fki2EKsMjcKpL+6HD98=
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiBjYWxsaW5nIGRlYnVnZnMgZnVuY3Rpb25zLCB0aGVyZSBpcyBubyBuZWVkIHRvIGV2ZXIg
Y2hlY2sgdGhlCnJldHVybiB2YWx1ZS4gIFRoZSBmdW5jdGlvbiBjYW4gd29yayBvciBub3QsIGJ1
dCB0aGUgY29kZSBsb2dpYyBzaG91bGQKbmV2ZXIgZG8gc29tZXRoaW5nIGRpZmZlcmVudCBiYXNl
ZCBvbiB0aGlzLgoKQ2M6IEJlbmphbWluIEdhaWduYXJkIDxiZW5qYW1pbi5nYWlnbmFyZEBsaW5h
cm8ub3JnPgpDYzogVmluY2VudCBBYnJpb3UgPHZpbmNlbnQuYWJyaW91QHN0LmNvbT4KQ2M6IERh
dmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBm
ZndsbC5jaD4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1i
eTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9kcnYuYyB8IDEwICsrLS0tLS0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3N0aS9zdGlfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9kcnYuYwpp
bmRleCBhNTI1ZmQ4OTlmNjguLjQ3OTdlNDZiZjM4NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3N0aS9zdGlfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3N0aS9zdGlfZHJ2LmMKQEAg
LTk1LDcgKzk1LDYgQEAgc3RhdGljIHN0cnVjdCBkcm1faW5mb19saXN0IHN0aV9kcm1fZGJnX2xp
c3RbXSA9IHsKIAogc3RhdGljIGludCBzdGlfZHJtX2RiZ19pbml0KHN0cnVjdCBkcm1fbWlub3Ig
Km1pbm9yKQogewotCXN0cnVjdCBkZW50cnkgKmRlbnRyeTsKIAlpbnQgcmV0OwogCiAJcmV0ID0g
ZHJtX2RlYnVnZnNfY3JlYXRlX2ZpbGVzKHN0aV9kcm1fZGJnX2xpc3QsCkBAIC0xMDQsMTMgKzEw
Myw4IEBAIHN0YXRpYyBpbnQgc3RpX2RybV9kYmdfaW5pdChzdHJ1Y3QgZHJtX21pbm9yICptaW5v
cikKIAlpZiAocmV0KQogCQlnb3RvIGVycjsKIAotCWRlbnRyeSA9IGRlYnVnZnNfY3JlYXRlX2Zp
bGUoImZwc19zaG93IiwgU19JUlVHTyB8IFNfSVdVU1IsCi0JCQkJICAgICBtaW5vci0+ZGVidWdm
c19yb290LCBtaW5vci0+ZGV2LAotCQkJCSAgICAgJnN0aV9kcm1fZnBzX2ZvcHMpOwotCWlmICgh
ZGVudHJ5KSB7Ci0JCXJldCA9IC1FTk9NRU07Ci0JCWdvdG8gZXJyOwotCX0KKwlkZWJ1Z2ZzX2Ny
ZWF0ZV9maWxlKCJmcHNfc2hvdyIsIFNfSVJVR08gfCBTX0lXVVNSLCBtaW5vci0+ZGVidWdmc19y
b290LAorCQkJICAgIG1pbm9yLT5kZXYsICZzdGlfZHJtX2Zwc19mb3BzKTsKIAogCURSTV9JTkZP
KCIlczogZGVidWdmcyBpbnN0YWxsZWRcbiIsIERSSVZFUl9OQU1FKTsKIAlyZXR1cm4gMDsKLS0g
CjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
