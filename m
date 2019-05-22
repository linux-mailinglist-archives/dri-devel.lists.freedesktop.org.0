Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5AF26141
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 12:02:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77724898C4;
	Wed, 22 May 2019 10:02:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11E65898C6
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 10:02:31 +0000 (UTC)
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52572)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1hTO4n-0006uE-7w; Wed, 22 May 2019 11:02:25 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.89)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1hTO4k-0006a1-0M; Wed, 22 May 2019 11:02:22 +0100
Date: Wed, 22 May 2019 11:02:21 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH] drm/etnaviv: lock MMU while dumping core
Message-ID: <20190522100221.aigvpw2juxghfwep@shell.armlinux.org.uk>
References: <20190522095514.7000-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190522095514.7000-1-l.stach@pengutronix.de>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4En9BVUtC5dsvHpWnagkqz7cD9cweqGti3AzNxHGEHQ=; b=nELYsINdSaLH344r/vzcV6me2
 xka8TIzlUabRX9I4a0z+9c/lG37nKaXgDlEjl1ReNm12m5b0/1rFAzXW4Ma4qZl7H/7NZ3mTMLNnd
 NxtEllGNoLHjm6P3fqBh811YmDD6IxQ5MU0XpMIzIB19nNpPo31jaRO+eAJAKOGkuUwEhyNKIqm1Y
 NwGVDLnHS8kioA2Z3kL7NSYYS3wls13oWNFfOFmqKzBX6qlS4VskvWoplERDSKSTR4fYDliNvu+Yb
 fMJGAKgDSJuEFsnCIW7moD4KlXUo6sUd47I99e03FtMMgGSoq3hSoopFA6i1d+9JzRe18V6LhheAS
 xQxigBymA==;
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
Cc: kernel@pengutronix.de, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, patchwork-lst@pengutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTHVjYXMsCgpTZWVtcyBJJ20gbm90IGdldHRpbmcgYSByZXBseSwgc28gSSdtIGhpamFja2lu
ZyBvbmUgb2YgeW91ciBtb3JlCnJlY2VudCBwYXRjaGVzIGluIHRoZSBob3BlIG9mIGF0dHJhY3Rp
bmcgeW91ciBhdHRlbnRpb24uCgpBIHdoaWxlIGJhY2sgSSBzZW50IGEgZml4IGZvciBhIHJlZ3Jl
c3Npb24gdGhhdCByZWNlbnRseSBvY2N1cnJlZAp3aXRoIGV0bmF2aXYsIHdoZXJlIHRoZSBrZXJu
ZWwgc3BhdCBvdXQgYSB3YXJuaW5nIHdoZW4gaW1wb3J0aW5nCmJ1ZmZlcnMgaW50byBldG5hdml2
LiAgWW91IGFwcGFyZW50bHkgbWVyZ2VkIHRoaXMgYXMgImRldmVsb3BtZW50IiwKcXVldWluZyBp
dCB1cCBmb3IgdGhlIGxhc3QgbWVyZ2Ugd2luZG93LgoKU2luY2UgaXQgaXMgYSByZWdyZXNzaW9u
IChhbHRob3VnaCBub3QgZGlyZWN0bHkgYXR0cmlidXRhYmxlIHRvCmV0bmF2aXYpLCBwbGVhc2Ug
ZW5zdXJlIHRoYXQgaXQgaXMgbWVyZ2VkIGludG8gc3RhYmxlIGtlcm5lbHMuCgpUaGFua3MuCgpP
biBXZWQsIE1heSAyMiwgMjAxOSBhdCAxMTo1NToxNEFNICswMjAwLCBMdWNhcyBTdGFjaCB3cm90
ZToKPiBUaGUgZGV2Y29yZWR1bXAgbmVlZHMgdG8gb3BlcmF0ZSBvbiBhIHN0YWJsZSBzdGF0ZSBv
ZiB0aGUgTU1VIHdoaWxlCj4gaXQgaXMgd3JpdGluZyB0aGUgTU1VIHN0YXRlIHRvIHRoZSBjb3Jl
ZHVtcC4gVGhlIG1pc3NpbmcgbG9jawo+IGFsbG93ZWQgYm90aCB0aGUgdXNlcnNwYWNlIHN1Ym1p
dCwgYXMgd2VsbCBhcyB0aGUgR1BVIGpvYiBmaW5pc2gKPiBwYXRocyB0byBtdXRhdGUgdGhlIE1N
VSBzdGF0ZSB3aGlsZSBhIGNvcmVkdW1wIGlzIHVuZGVyIHdheS4KPiAKPiBGaXhlczogYThjMjFh
NTQ1MWQ4IChkcm0vZXRuYXZpdjogYWRkIGluaXRpYWwgZXRuYXZpdiBEUk0gZHJpdmVyKQo+IFJl
cG9ydGVkLWJ5OiBEYXZpZCBKYW5kZXIgPGRhdmlkQHByb3RvbmljLm5sPgo+IFNpZ25lZC1vZmYt
Ynk6IEx1Y2FzIFN0YWNoIDxsLnN0YWNoQHBlbmd1dHJvbml4LmRlPgo+IFRlc3RlZC1ieTogRGF2
aWQgSmFuZGVyIDxkYXZpZEBwcm90b25pYy5ubD4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2V0
bmF2aXYvZXRuYXZpdl9kdW1wLmMgfCA1ICsrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZp
dl9kdW1wLmMgYi9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2R1bXAuYwo+IGluZGV4
IDMzODU0Yzk0Y2I4NS4uNTE1NTE1ZWYyNGY5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9ldG5hdml2L2V0bmF2aXZfZHVtcC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYv
ZXRuYXZpdl9kdW1wLmMKPiBAQCAtMTI1LDYgKzEyNSw4IEBAIHZvaWQgZXRuYXZpdl9jb3JlX2R1
bXAoc3RydWN0IGV0bmF2aXZfZ3B1ICpncHUpCj4gIAkJcmV0dXJuOwo+ICAJZXRuYXZpdl9kdW1w
X2NvcmUgPSBmYWxzZTsKPiAgCj4gKwltdXRleF9sb2NrKCZncHUtPm1tdS0+bG9jayk7Cj4gKwo+
ICAJbW11X3NpemUgPSBldG5hdml2X2lvbW11X2R1bXBfc2l6ZShncHUtPm1tdSk7Cj4gIAo+ICAJ
LyogV2UgYWx3YXlzIGR1bXAgcmVnaXN0ZXJzLCBtbXUsIHJpbmcgYW5kIGVuZCBtYXJrZXIgKi8K
PiBAQCAtMTY3LDYgKzE2OSw3IEBAIHZvaWQgZXRuYXZpdl9jb3JlX2R1bXAoc3RydWN0IGV0bmF2
aXZfZ3B1ICpncHUpCj4gIAlpdGVyLnN0YXJ0ID0gX192bWFsbG9jKGZpbGVfc2l6ZSwgR0ZQX0tF
Uk5FTCB8IF9fR0ZQX05PV0FSTiB8IF9fR0ZQX05PUkVUUlksCj4gIAkJCSAgICAgICBQQUdFX0tF
Uk5FTCk7Cj4gIAlpZiAoIWl0ZXIuc3RhcnQpIHsKPiArCQltdXRleF91bmxvY2soJmdwdS0+bW11
LT5sb2NrKTsKPiAgCQlkZXZfd2FybihncHUtPmRldiwgImZhaWxlZCB0byBhbGxvY2F0ZSBkZXZj
b3JlZHVtcCBmaWxlXG4iKTsKPiAgCQlyZXR1cm47Cj4gIAl9Cj4gQEAgLTIzNCw2ICsyMzcsOCBA
QCB2b2lkIGV0bmF2aXZfY29yZV9kdW1wKHN0cnVjdCBldG5hdml2X2dwdSAqZ3B1KQo+ICAJCQkJ
CSBvYmotPmJhc2Uuc2l6ZSk7Cj4gIAl9Cj4gIAo+ICsJbXV0ZXhfdW5sb2NrKCZncHUtPm1tdS0+
bG9jayk7Cj4gKwo+ICAJZXRuYXZpdl9jb3JlX2R1bXBfaGVhZGVyKCZpdGVyLCBFVERVTVBfQlVG
X0VORCwgaXRlci5kYXRhKTsKPiAgCj4gIAlkZXZfY29yZWR1bXB2KGdwdS0+ZGV2LCBpdGVyLnN0
YXJ0LCBpdGVyLmRhdGEgLSBpdGVyLnN0YXJ0LCBHRlBfS0VSTkVMKTsKPiAtLSAKPiAyLjIwLjEK
PiAKPiAKCi0tIApSTUsncyBQYXRjaCBzeXN0ZW06IGh0dHBzOi8vd3d3LmFybWxpbnV4Lm9yZy51
ay9kZXZlbG9wZXIvcGF0Y2hlcy8KRlRUQyBicm9hZGJhbmQgZm9yIDAuOG1pbGUgbGluZSBpbiBz
dWJ1cmJpYTogc3luYyBhdCAxMi4xTWJwcyBkb3duIDYyMmticHMgdXAKQWNjb3JkaW5nIHRvIHNw
ZWVkdGVzdC5uZXQ6IDExLjlNYnBzIGRvd24gNTAwa2JwcyB1cApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
