Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F6942C32
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 18:28:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FDA98975F;
	Wed, 12 Jun 2019 16:28:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BA178975F
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 16:28:21 +0000 (UTC)
Received: from shell.armlinux.org.uk
 ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:56330)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1hb66g-0005gs-0a; Wed, 12 Jun 2019 17:28:14 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.89)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1hb66f-0000SI-4J; Wed, 12 Jun 2019 17:28:13 +0100
Date: Wed, 12 Jun 2019 17:28:13 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Sven Van Asbroeck <thesven73@gmail.com>
Subject: Re: [PATCH 04/13] drm/i2c: tda998x: derive CTS_N value from aclk
 sample rate ratio
Message-ID: <20190612162812.ovy6wu3fmck5mmp4@shell.armlinux.org.uk>
References: <20190611110052.iw6qbw2yvypxus6t@shell.armlinux.org.uk>
 <E1haeXI-0001y0-S5@rmk-PC.armlinux.org.uk>
 <CAGngYiWT5xsVgP4R=LPozpxFwdoCtpGSn76fwWEDiNXtYzBA9g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGngYiWT5xsVgP4R=LPozpxFwdoCtpGSn76fwWEDiNXtYzBA9g@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yHna2TQdsfS9Uqlz4X9BVfgBN/ya/2MrzcLDMnmV7TQ=; b=XJ+3+uQXkkGoI7fpNjqKMEKtb
 RPK0kNLfXyZM+ZEIjbVPWVqPERRhIq20oLRRjQEzQA/Xnr2taPrD7XGiMHFA39j3reCV2FYr0MpJq
 jzj2UXReZnlCyVTjIXwznt2fGGMUhS1RKWp7g5PSiFDS4Ft8QfPUFRHccQ65OZfz/uDBsDOkX2anu
 /5c09DRWE2IfBf3fyoY+rxigxtmx25IoRSS9Hs40EQiANMvvLAcMPUYLOIRDor25ViAXGEsQBSK5/
 ogE94HShV8zx4ps9rWhC6jOHS0WFcyB4q9dPx0OaoC2iZKRb5a9xJyPz7W8Ucscf/S232i69BJwus
 2SUhAxWZA==;
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

T24gV2VkLCBKdW4gMTIsIDIwMTkgYXQgMTE6Mjc6MTZBTSAtMDQwMCwgU3ZlbiBWYW4gQXNicm9l
Y2sgd3JvdGU6Cj4gT24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgNzowMiBBTSBSdXNzZWxsIEtpbmcg
PHJtaytrZXJuZWxAYXJtbGludXgub3JnLnVrPiB3cm90ZToKPiA+Cj4gPiBUaGUgVERBOTk4eCBk
ZXJpdmVzIHRoZSBDVFMgdmFsdWUgdXNpbmcgdGhlIHN1cHBsaWVkIEkyUyBiaXQgY2xvY2sKPiA+
IChBQ0xLLCBpbiBUREE5OTh4IHBhcmxlbmNlKSByYXRoZXIgdGhhbiAxMjjCt2ZzLiAgVERBOTk4
eCB1c2VzIHR3bwo+ID4gY29uc3RhbnRzIG5hbWVkIG0gYW5kIGsgaW4gdGhlIENUUyBnZW5lcmF0
b3Igc3VjaCB0aGF0IHdlIGhhdmUgdGhpcwo+ID4gcmVsYXRpb25zaGlwIGJldHdlZW4gdGhlIEky
UyBzb3VyY2UgQUNMSyBhbmQgdGhlIHNpbmsgZnM6Cj4gPgo+ID4gICAgICAgICAxMjjCt2ZzX3Np
bmsgPSBBQ0xLwrdtIC8gawo+ID4KPiA+IFdoZXJlIEFDTEsgPSBhY2xrX3JhdGlvwrdmc19zb3Vy
Y2UuCj4gPgo+ID4gV2hlbiBhdWRpbyBzdXBwb3J0IHdhcyBvcmlnaW5hbGx5IGFkZGVkLCB3ZSBz
dXBwb3J0ZWQgYSBmaXhlZCByYXRpbwo+ID4gb2YgNjTCt2ZzLCBpbnRlbmRpbmcgdG8gc3VwcG9y
dCB0aGUgS2lya3dvb2QgSTJTIG9uIERvdmUuICBIb3dldmVyLAo+ID4gd2hlbiBoZG1pLWNvZGVj
IHN1cHBvcnQgd2FzIGFkZGVkLCB0aGlzIHdhcyBjaGFuZ2VkIHRvIHNjYWxlIHRoZQo+ID4gcmF0
aW8gd2l0aCB0aGUgc2FtcGxlIHdpZHRoLCB3aGljaCB3b3VsZCd2ZSBicm9rZW4gaXRzIHVzZSB3
aXRoCj4gPiBLaXJrd29vZCBJMlMuCj4gPgo+ID4gV2UgYXJlIG5vdyBzdGFydGluZyB0byBzZWUg
b3RoZXIgdXNlcnMgd2hvc2UgSTJTIGJsb2NrcyBzZW5kIGF0IDY0wrdmcwo+ID4gZm9yIDE2LWJp
dCBzYW1wbGVzLCBzbyB3ZSBuZWVkIHRvIHJlaW5zdGF0ZSB0aGUgc3VwcG9ydCBmb3IgdGhlIGZp
eGVkCj4gPiByYXRpbyBJMlMgYml0IGNsb2NrLgo+ID4KPiA+IFRoaXMgY29tbWl0IHRha2VzIGEg
c3RlcCB0b3dhcmRzIHN1cHBvcnRpbmcgdGhlc2UgY29uZmlndXJhdGlvbnMgYnkKPiA+IHNlbGVj
dGluZyB0aGUgQ1RTX04gcmVnaXN0ZXIgbSBhbmQgayB2YWx1ZXMgYmFzZWQgb24gdGhlIGJpdCBj
bG9jawo+ID4gcmF0aW8uICBIb3dldmVyLCBhcyB0aGUgZHJpdmVyIGlzIG5vdCBnaXZlbiB0aGUg
Yml0IGNsb2NrIHJhdGlvIGZyb20KPiA+IEFMU0EsIGNvbnRpbnVlIGRlcml2aW5nIHRoaXMgZnJv
bSB0aGUgc2FtcGxlIHdpZHRoLiAgVGhpcyB3aWxsIGJlCj4gPiBhZGRyZXNzZWQgaW4gYSBsYXRl
ciBjb21taXQuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogUnVzc2VsbCBLaW5nIDxybWsra2VybmVs
QGFybWxpbnV4Lm9yZy51az4KPiA+IC0tLQo+IAo+IEBAIC0xNjU3LDkgKzE3MDEsMTcgQEAgc3Rh
dGljIHZvaWQgdGRhOTk4eF9zZXRfY29uZmlnKHN0cnVjdCB0ZGE5OTh4X3ByaXYgKnByaXYsCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIChwLT5taXJyX2YgPyBWSVBfQ05UUkxfMl9NSVJS
X0YgOiAwKTsKPiAKPiAgICAgICAgIGlmIChwLT5hdWRpb19wYXJhbXMuZm9ybWF0ICE9IEFGTVRf
VU5VU0VEKSB7Cj4gKyAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCByYXRpbzsKPiArICAgICAg
ICAgICAgICAgYm9vbCBzcGRpZiA9IHAtPmF1ZGlvX3BhcmFtcy5mb3JtYXQgPT0gQUZNVF9TUERJ
RjsKPiArCj4gICAgICAgICAgICAgICAgIHByaXYtPmF1ZGlvLnBhcmFtcyA9IHAtPmF1ZGlvX3Bh
cmFtczsKPiAgICAgICAgICAgICAgICAgcHJpdi0+YXVkaW8uaTJzX2Zvcm1hdCA9IEkyU19GT1JN
QVRfUEhJTElQUzsKPiArCj4gKyAgICAgICAgICAgICAgIHJhdGlvID0gc3BkaWYgPyA2NCA6IHAt
PmF1ZGlvX3BhcmFtcy5zYW1wbGVfd2lkdGggKiAyOwo+ICsgICAgICAgICAgICAgICByZXR1cm4g
dGRhOTk4eF9kZXJpdmVfY3RzX24ocHJpdiwgJnByaXYtPmF1ZGlvLCByYXRpbyk7Cj4gCj4gV29u
J3QgdGhpcyBtYWtlIHRoZSBwbGF0Zm9ybV9kYXRhIHBhdGggZmFpbCBhbGwgdGhlIHRpbWU/Cj4g
QWxzbywgdGhlIHBsYXRmb3JtX2RhdGEgcGF0aCBkb2Vzbid0IGFwcGVhciB0byBpbnN0YW50aWF0
ZSB0aGUgSERNSV9DT0RFQywKPiBzbyB0ZGEgYXVkaW8gc3VwcG9ydCB3b3VsZCBiZSBjb21wbGV0
ZWx5IG1pc3NpbmcgaW4gdGhpcyBjYXNlPwoKVGhlIHBsYXRmb3JtIGRhdGEgcGF0aCBoYXMgbmV2
ZXIgc3VwcG9ydGVkIHRoZSBIRE1JIGNvZGVjIHdheSBvZiBkb2luZwp0aGluZ3MsIHNvIHRoYXQg
cmVhbGx5IGlzbid0IGEgY29uY2VybiBoZXJlLiAgVGhlIHBsYXRmb3JtIGRhdGEgd2F5CndhcyBz
dWZmaWNpZW50IHRvIGFsbG93IFNQRElGIHN0cmVhbXMgdG8gd29yayB3aXRoIGEgc3RhdGljIHNl
dHVwIG9mCnRoZSBUREE5OTh4LCBhbmQgaGFzIG5ldmVyIGJlZW4gaW50ZW5kZWQgdG8gc3VwcG9y
dCBhbnl0aGluZyBiZXlvbmQKdGhhdC4KCi0tIApSTUsncyBQYXRjaCBzeXN0ZW06IGh0dHBzOi8v
d3d3LmFybWxpbnV4Lm9yZy51ay9kZXZlbG9wZXIvcGF0Y2hlcy8KRlRUQyBicm9hZGJhbmQgZm9y
IDAuOG1pbGUgbGluZSBpbiBzdWJ1cmJpYTogc3luYyBhdCAxMi4xTWJwcyBkb3duIDYyMmticHMg
dXAKQWNjb3JkaW5nIHRvIHNwZWVkdGVzdC5uZXQ6IDExLjlNYnBzIGRvd24gNTAwa2JwcyB1cApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
