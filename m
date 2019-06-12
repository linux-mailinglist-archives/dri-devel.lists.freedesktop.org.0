Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC05942C26
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 18:26:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D0EF89623;
	Wed, 12 Jun 2019 16:26:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45E9189623
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 16:26:16 +0000 (UTC)
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52974)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1hb64b-0005fz-HM; Wed, 12 Jun 2019 17:26:05 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.89)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1hb64W-0000S9-Sb; Wed, 12 Jun 2019 17:26:00 +0100
Date: Wed, 12 Jun 2019 17:26:00 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Sven Van Asbroeck <thesven73@gmail.com>
Subject: Re: [PATCH 03/13] drm/i2c: tda998x: improve programming of audio
 divisor
Message-ID: <20190612162600.q4otimitocjeg6ln@shell.armlinux.org.uk>
References: <20190611110052.iw6qbw2yvypxus6t@shell.armlinux.org.uk>
 <E1haeXD-0001xs-Na@rmk-PC.armlinux.org.uk>
 <CAGngYiV5FCU8RPfn2TFEJSWSWvD9VmpKWcPb_0TBpWc6nwho+g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGngYiV5FCU8RPfn2TFEJSWSWvD9VmpKWcPb_0TBpWc6nwho+g@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4cod9bkRAbg9wyiunNavzsL2g13pnxvT7+QjopTLDEA=; b=DfNZXcluA3osa+FRZbP34OoaV
 +VCsb0tIcoD/QtsnnkRMfay2YxLwj3x6/M/8aZx0N/WrlcK9KXJizDj6Xy7+Z0eUftBRNhQK351Z+
 dnMccHxfcn/qv0X1H0Cj4ghazovJuIOScmQDSNnMyjpaGAFB0AO8HDxwib9YQWNP3NgPYzRtuVvU1
 lCUIte/48T3ImY0MOgGRuwgUxrrwACqI4pUMGkRjiZRPvxOK0LHFW1c5o0isM88gyw7fGOP/Isf4P
 Wjv9GinzOJphqpxoM1o9DlhxibXsqRT3zVx28JLtwkqUXcHBoyi3d+YlbH16hXXDHk0e2BErqIYiB
 /Vk2nuurw==;
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Mark Brown <broonie@kernel.org>,
 Jyri Sarha <jsarha@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTIsIDIwMTkgYXQgMTE6MjU6NTlBTSAtMDQwMCwgU3ZlbiBWYW4gQXNicm9l
Y2sgd3JvdGU6Cj4gT24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgNzowMiBBTSBSdXNzZWxsIEtpbmcg
PHJtaytrZXJuZWxAYXJtbGludXgub3JnLnVrPiB3cm90ZToKPiA+Cj4gPiBJbXByb3ZlIHRoZSBz
ZWxlY3Rpb24gb2YgdGhlIGF1ZGlvIGNsb2NrIGRpdmlzb3Igc28gdGhhdCBtb3JlIG1vZGVzCj4g
PiBhbmQgc2FtcGxlIHJhdGVzIHdvcmsuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogUnVzc2VsbCBL
aW5nIDxybWsra2VybmVsQGFybWxpbnV4Lm9yZy51az4KPiA+IC0tLQo+IAo+ICtzdGF0aWMgdTgg
dGRhOTk4eF9nZXRfYWRpdihzdHJ1Y3QgdGRhOTk4eF9wcml2ICpwcml2LCB1bnNpZ25lZCBpbnQg
ZnMpCj4gK3sKPiArICAgICAgIHVuc2lnbmVkIGxvbmcgbWluX2F1ZGlvX2NsayA9IGZzICogMTI4
Owo+ICsgICAgICAgdW5zaWduZWQgbG9uZyBzZXJfY2xrID0gcHJpdi0+dG1kc19jbG9jayAqIDEw
MDA7Cj4gKyAgICAgICB1OCBhZGl2Owo+ICsKPiArICAgICAgIGZvciAoYWRpdiA9IEFVRElPX0RJ
Vl9TRVJDTEtfMzI7IGFkaXYgIT0gQVVESU9fRElWX1NFUkNMS18xOyBhZGl2LS0pCj4gKyAgICAg
ICAgICAgICAgIGlmIChzZXJfY2xrID4gbWluX2F1ZGlvX2NsayA8PCBhZGl2KQo+ICsgICAgICAg
ICAgICAgICAgICAgICAgIGJyZWFrOwo+ICsKPiArICAgICAgIGRldl9kYmcoJnByaXYtPmhkbWkt
PmRldiwKPiArICAgICAgICAgICAgICAgInNlcl9jbGs9JWx1SHogZnM9JXVIeiBtaW5fYWNsaz0l
bHVIeiBhZGl2PSVkXG4iLAo+ICsgICAgICAgICAgICAgICBzZXJfY2xrLCBmcywgbWluX2F1ZGlv
X2NsaywgYWRpdik7Cj4gKwo+ICsgICAgICAgcmV0dXJuIGFkaXY7Cj4gCj4gRG9lc24ndCB0aGlz
IGZ1bmN0aW9uIG5lZWQgYW4gZXJyb3IgcmV0dXJuIGluIGNhc2UgbWluX2F1ZGlvX2NsayA+IHNl
cl9jbGsgPwo+IE9yIGlzIHRoYXQgYSBzaXR1YXRpb24gdGhhdCBjYW4gbmV2ZXIgYXJpc2U/CgpJ
dCdzIHBvc3NpYmxlIGl0IGNvdWxkIGFyaXNlLiAgRm9yIGV4YW1wbGUsIGlmIHdlIGhhdmUgYSAx
OTJrSHogc2FtcGxlCnJhdGUsIGFuZCBhIHRtZHMgY2xvY2sgc2xvd2VyIHRoYW4gMjQuNTc2TUh6
LgoKSW4gc3VjaCBhIGNhc2UsIHdlIHdpbGwgc2VsZWN0IEFVRElPX0RJVl9TRVJDTEtfMSBhcyB0
aGUgZGl2aXNvciwgd2hpY2gKaXMgYSBsZWdhbCB2YWx1ZS4gIFRoZSByZXN1bHQgX21heV8gYmUg
YXVkaW8gbm90IHdvcmtpbmcgKHdoaWNoIGlzIHdoYXQKYWxyZWFkeSBoYXBwZW5zIHRvZGF5IHdo
ZW4gd2UgZ2V0IHRoaXMgc2V0dGluZyB3cm9uZy4pCgpJZiB3ZSB3ZXJlIHRvIHJldHVybiBhbiBl
cnJvciwgdGhlcmUncyBubyB3YXkgdG8gaGFuZGxlIHRoYXQgZXJyb3IsIHNvCndoYXQncyB0aGUg
cG9pbnQgb2YgcmV0dXJuaW5nIGFuIGVycm9yPwoKVGhlIHJlc3VsdHMgb2YgdGhpcyBmdW5jdGlv
biBtYXRjaCB3aGF0IHRoZSBQaGlsaXBzIGZpcm13YXJlIHVzZXMgZm9yCnRoaXMgcmVnaXN0ZXIg
Zm9yIGFsbCBzdGFuZGFyZCBUTURTIGNsb2NrcyBhbmQgc2FtcGxlIHJhdGVzLCBzbyBpdCdzCm5v
dCBhIHByb2JsZW0gdGhhdCBJJ20gcGFydGljdWxhcmx5IGNvbmNlcm5lZCBhYm91dCBhdCB0aGlz
IHBvaW50LgpUaGUgb25seSB3YXkgYXJvdW5kIHRoaXMgd291bGQgYmUgdG8gaW5jcmVhc2UgdGhl
IFRNRFMgY2xvY2ssIHdoaWNoCm1lYW5zIHVzaW5nIHBpeGVsIGRvdWJsaW5nIHRyaWNrcywgYW5k
IHRoZXJlZm9yZSBhIG1vZGUgc2V0LiAgSSBkb24ndAp0aGluayBhbnkgSERNSSBkcml2ZXIgaGFz
IHRoZSBjYXBhYmlsaXR5IHRvIGRlYWwgd2l0aCB0aGF0IHlldC4KCi0tIApSTUsncyBQYXRjaCBz
eXN0ZW06IGh0dHBzOi8vd3d3LmFybWxpbnV4Lm9yZy51ay9kZXZlbG9wZXIvcGF0Y2hlcy8KRlRU
QyBicm9hZGJhbmQgZm9yIDAuOG1pbGUgbGluZSBpbiBzdWJ1cmJpYTogc3luYyBhdCAxMi4xTWJw
cyBkb3duIDYyMmticHMgdXAKQWNjb3JkaW5nIHRvIHNwZWVkdGVzdC5uZXQ6IDExLjlNYnBzIGRv
d24gNTAwa2JwcyB1cApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
