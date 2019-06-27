Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C23B958FB4
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 03:26:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3197F6E873;
	Fri, 28 Jun 2019 01:26:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEB556E3EF
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 18:21:26 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 3/3] DRM: ingenic: Add support for panels with 8-bit serial bus
Date: Thu, 27 Jun 2019 20:21:14 +0200
Message-Id: <20190627182114.27299-3-paul@crapouillou.net>
In-Reply-To: <20190627182114.27299-1-paul@crapouillou.net>
References: <20190627182114.27299-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 28 Jun 2019 01:25:51 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=crapouillou.net; 
 s=mail; t=1561659685; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EMTPz/E0Re9ZEDNi6A5HiGlO3zDC+PQxFDkb/cLcYIA=;
 b=FWiVkKJKVlCD9C4SuMljhAEFNZ3ed4WkettXKTs3mgvlVmcUH7Ec9RnU8ATnFJiC6cWZt7
 ueoUze9d2nkIl1kmFHgKbk+zvWTmZA4/R3+9+aiabjtu7Bjw/mN7U5PY1y5MQDtUd7aZMx
 0QYJr6gEps52Z46YbvmNzHEHfgOteEU=
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
Cc: Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIHN1cHBvcnQgZm9yIHRoZSBMQ0QgcGFuZWxzIHdpdGggYSBzZXJpYWwgOC1iaXQgYnVzLCB3
aGVyZSB0aGUgY29sb3IKY29tcG9uZW50cyBvZiBlYWNoIDI0LWJpdCBwaXhlbCBhcmUgc2VudCBz
ZXF1ZW50aWFsbHkuCgpTaWduZWQtb2ZmLWJ5OiBQYXVsIENlcmN1ZWlsIDxwYXVsQGNyYXBvdWls
bG91Lm5ldD4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaW5nZW5pYy9pbmdlbmljLWRybS5jIHwgNCAr
KysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2luZ2VuaWMvaW5nZW5pYy1kcm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9pbmdlbmlj
L2luZ2VuaWMtZHJtLmMKaW5kZXggZGE5NjZmM2RjMWY3Li5jZTFmYWUzYTc4YTkgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9pbmdlbmljL2luZ2VuaWMtZHJtLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2luZ2VuaWMvaW5nZW5pYy1kcm0uYwpAQCAtNDI2LDYgKzQyNiw5IEBAIHN0YXRpYyB2
b2lkIGluZ2VuaWNfZHJtX2VuY29kZXJfYXRvbWljX21vZGVfc2V0KHN0cnVjdCBkcm1fZW5jb2Rl
ciAqZW5jb2RlciwKIAkJCWNhc2UgTUVESUFfQlVTX0ZNVF9SR0I4ODhfMVgyNDoKIAkJCQljZmcg
fD0gSlpfTENEX0NGR19NT0RFX0dFTkVSSUNfMjRCSVQ7CiAJCQkJYnJlYWs7CisJCQljYXNlIE1F
RElBX0JVU19GTVRfUkdCODg4XzNYODoKKwkJCQljZmcgfD0gSlpfTENEX0NGR19NT0RFXzhCSVRf
U0VSSUFMOworCQkJCWJyZWFrOwogCQkJZGVmYXVsdDoKIAkJCQlicmVhazsKIAkJCX0KQEAgLTQ1
MSw2ICs0NTQsNyBAQCBzdGF0aWMgaW50IGluZ2VuaWNfZHJtX2VuY29kZXJfYXRvbWljX2NoZWNr
KHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlciwKIAljYXNlIE1FRElBX0JVU19GTVRfUkdCNTY1
XzFYMTY6CiAJY2FzZSBNRURJQV9CVVNfRk1UX1JHQjY2Nl8xWDE4OgogCWNhc2UgTUVESUFfQlVT
X0ZNVF9SR0I4ODhfMVgyNDoKKwljYXNlIE1FRElBX0JVU19GTVRfUkdCODg4XzNYODoKIAkJcmV0
dXJuIDA7CiAJZGVmYXVsdDoKIAkJcmV0dXJuIC1FSU5WQUw7Ci0tIAoyLjIxLjAuNTkzLmc1MTFl
YzM0NWUxOAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
