Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F22764EBD3
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 17:21:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 736826E8D8;
	Fri, 21 Jun 2019 15:21:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C476B6E8D8
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 15:21:00 +0000 (UTC)
Received: from shell.armlinux.org.uk
 ([2002:4e20:1eda:1:5054:ff:fe00:4ec]:58964)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1heLLS-0006Cw-Pw; Fri, 21 Jun 2019 16:20:54 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.89)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1heLLQ-0003Mx-Oq; Fri, 21 Jun 2019 16:20:52 +0100
Date: Fri, 21 Jun 2019 16:20:52 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Sven Van Asbroeck <thesven73@gmail.com>
Subject: Re: [PATCH v1 2/2] drm/i2c: tda998x: remove indirect
 reg_read/_write() calls
Message-ID: <20190621152052.ja2adc7usqsgyu62@shell.armlinux.org.uk>
References: <20190527191552.10413-1-TheSven73@gmail.com>
 <20190527191552.10413-2-TheSven73@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190527191552.10413-2-TheSven73@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4aE0rZwbXnHevxDpP9dbpYGSSeNqkmQd2OB6ZUv5WMk=; b=hjqp7yiEWOImYv7e7Qn7vZcvd
 OZzpO7PpbcUFwWb1Ci2EDfMa0wu759Ud5hPxQHHwGYv2LsbRpkk8dQ88cG8VrtVN3vszVmKSqX2fK
 kOaZeV8ELsts6FM4jNTiOyNzH/Yqt+sMlJ22l+uGlQ028nq2FX0n019nroY9YPHfXmWkHdVRAr2P+
 fz7vpa+jk28mgJbtXsWyrs2t0iBRhzUzlKGlJ0NBpLILrQqrd4YiyWyhroAPCpj25rPRSPVk6qpgL
 cBc+ghf+5K016T5iH/5Ll5LAytSaD5vzKlUBW/sAz5qLu2W41MbLitI63wsZXqen4f4eGwHNGajtA
 5XGpvvoPg==;
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
Cc: David Airlie <airlied@linux.ie>, Peter Rosin <peda@axentia.se>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXkgMjcsIDIwMTkgYXQgMDM6MTU6NTJQTSAtMDQwMCwgU3ZlbiBWYW4gQXNicm9l
Y2sgd3JvdGU6Cj4gLXN0YXRpYyB2b2lkCj4gLXJlZ19zZXQoc3RydWN0IHRkYTk5OHhfcHJpdiAq
cHJpdiwgdTE2IHJlZywgdTggdmFsKQo+ICtzdGF0aWMgaW50Cj4gK3JlZ19zZXQoc3RydWN0IHJl
Z21hcCAqcmVnbWFwLCB1MTYgcmVnLCB1OCB2YWwpCgpJIGRvbid0IHNlZSB0aGUgcG9pbnQgb2Yg
bWFraW5nIHRoaXMgcmV0dXJuIGFuICdpbnQnIC0geW91IGRvbid0IG1vZGlmeQphbnkgb2YgdGhl
IGNhbGxzaXRlcyB0byBjaGVjayB0aGUgcmV0dXJuZWQgdmFsdWUsIHNvIHJldHVybmluZyBhIHZh
bHVlCmlzIG5vdCB1c2VmdWwuCgo+ICB7Cj4gLQlyZWdtYXBfdXBkYXRlX2JpdHMocHJpdi0+cmVn
bWFwLCByZWcsIHZhbCwgdmFsKTsKPiArCXJldHVybiByZWdtYXBfdXBkYXRlX2JpdHMocmVnbWFw
LCByZWcsIHZhbCwgdmFsKTsKPiAgfQo+ICAKPiAtc3RhdGljIHZvaWQKPiAtcmVnX2NsZWFyKHN0
cnVjdCB0ZGE5OTh4X3ByaXYgKnByaXYsIHUxNiByZWcsIHU4IHZhbCkKPiArc3RhdGljIGludAo+
ICtyZWdfY2xlYXIoc3RydWN0IHJlZ21hcCAqcmVnbWFwLCB1MTYgcmVnLCB1OCB2YWwpCgpTYW1l
IGhlcmUuCgo+IEBAIC02ODUsMTYgKzY1NSwxOCBAQCBzdGF0aWMgdm9pZCB0ZGE5OTh4X2RldGVj
dF93b3JrKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKPiAgc3RhdGljIGlycXJldHVybl90IHRk
YTk5OHhfaXJxX3RocmVhZChpbnQgaXJxLCB2b2lkICpkYXRhKQo+ICB7Cj4gIAlzdHJ1Y3QgdGRh
OTk4eF9wcml2ICpwcml2ID0gZGF0YTsKPiAtCXU4IHN0YSwgY2VjLCBsdmwsIGZsYWcwLCBmbGFn
MSwgZmxhZzI7Cj4gKwlzdHJ1Y3QgcmVnbWFwICpyZWdtYXAgPSBwcml2LT5yZWdtYXA7Cj4gKwl1
OCBzdGEsIGNlYywgbHZsOwo+ICsJdW5zaWduZWQgaW50IGZsYWcwLCBmbGFnMSwgZmxhZzI7Cj4g
IAlib29sIGhhbmRsZWQgPSBmYWxzZTsKPiAgCj4gIAlzdGEgPSBjZWNfcmVhZChwcml2LCBSRUdf
Q0VDX0lOVFNUQVRVUyk7Cj4gIAlpZiAoc3RhICYgQ0VDX0lOVFNUQVRVU19IRE1JKSB7Cj4gIAkJ
Y2VjID0gY2VjX3JlYWQocHJpdiwgUkVHX0NFQ19SWFNIUERJTlQpOwo+ICAJCWx2bCA9IGNlY19y
ZWFkKHByaXYsIFJFR19DRUNfUlhTSFBETEVWKTsKPiAtCQlmbGFnMCA9IHJlZ19yZWFkKHByaXYs
IFJFR19JTlRfRkxBR1NfMCk7Cj4gLQkJZmxhZzEgPSByZWdfcmVhZChwcml2LCBSRUdfSU5UX0ZM
QUdTXzEpOwo+IC0JCWZsYWcyID0gcmVnX3JlYWQocHJpdiwgUkVHX0lOVF9GTEFHU18yKTsKPiAr
CQlyZWdtYXBfcmVhZChyZWdtYXAsIFJFR19JTlRfRkxBR1NfMCwgJmZsYWcwKTsKPiArCQlyZWdt
YXBfcmVhZChyZWdtYXAsIFJFR19JTlRfRkxBR1NfMSwgJmZsYWcxKTsKPiArCQlyZWdtYXBfcmVh
ZChyZWdtYXAsIFJFR19JTlRfRkxBR1NfMiwgJmZsYWcyKTsKCk5vdCBwYXJ0aWN1bGFybHkgZW5h
bW91cmVkIGJ5IHRoaXMuLi4KCi0tIApSTUsncyBQYXRjaCBzeXN0ZW06IGh0dHBzOi8vd3d3LmFy
bWxpbnV4Lm9yZy51ay9kZXZlbG9wZXIvcGF0Y2hlcy8KRlRUQyBicm9hZGJhbmQgZm9yIDAuOG1p
bGUgbGluZSBpbiBzdWJ1cmJpYTogc3luYyBhdCAxMi4xTWJwcyBkb3duIDYyMmticHMgdXAKQWNj
b3JkaW5nIHRvIHNwZWVkdGVzdC5uZXQ6IDExLjlNYnBzIGRvd24gNTAwa2JwcyB1cApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
