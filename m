Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4A229B16
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 17:32:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E23E6E0AE;
	Fri, 24 May 2019 15:32:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BC796E0AE
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 15:32:08 +0000 (UTC)
Received: from shell.armlinux.org.uk
 ([2002:4e20:1eda:1:5054:ff:fe00:4ec]:38286)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1hUCAq-0004yN-0f; Fri, 24 May 2019 16:32:00 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.89)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1hUCAn-00009j-H8; Fri, 24 May 2019 16:31:57 +0100
Date: Fri, 24 May 2019 16:31:57 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH] drm/etnaviv: lock MMU while dumping core
Message-ID: <20190524153157.nlj22t75fjmc3wn7@shell.armlinux.org.uk>
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
 bh=xP4eI2HYzNvMIB3lYZNdeuG77tmUlJAFzP5hThEUR/c=; b=NEtiovlC1mDE962BUUCCMCaR4
 wohXNrR+FNe1hnZvhFHC7Z8tXHa2b0m4Hg8pe/vloL0UVnO2GieNWHBKF8agXddCdyyVjQFNPlQhv
 1RRaZmXf6fsbItoON9LhfjIbh36IaiG/ARG73qI5NunPTVoef5s0ZVbXRAhkHpV/zzamXYky3y2oH
 5DaCkA+xhA8Lj9WwiU222zm3K1t2nMrs/rfLkEx4t064MJsITL9Tz4FABQba5oBQNmS+peJ7nnjua
 +iQhSqCSd9LrBtQbGYXXJK+cpTBbJ8j92NqogI+ZC3JSr0ZU+7pBPShj64rlt2FrFbrd+3TfIP5dl
 H7EgFPtmw==;
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

T24gV2VkLCBNYXkgMjIsIDIwMTkgYXQgMTE6NTU6MTRBTSArMDIwMCwgTHVjYXMgU3RhY2ggd3Jv
dGU6Cj4gVGhlIGRldmNvcmVkdW1wIG5lZWRzIHRvIG9wZXJhdGUgb24gYSBzdGFibGUgc3RhdGUg
b2YgdGhlIE1NVSB3aGlsZQo+IGl0IGlzIHdyaXRpbmcgdGhlIE1NVSBzdGF0ZSB0byB0aGUgY29y
ZWR1bXAuIFRoZSBtaXNzaW5nIGxvY2sKPiBhbGxvd2VkIGJvdGggdGhlIHVzZXJzcGFjZSBzdWJt
aXQsIGFzIHdlbGwgYXMgdGhlIEdQVSBqb2IgZmluaXNoCj4gcGF0aHMgdG8gbXV0YXRlIHRoZSBN
TVUgc3RhdGUgd2hpbGUgYSBjb3JlZHVtcCBpcyB1bmRlciB3YXkuCgpUaGlzIGxvY2tpbmcgZG9l
cyBsaXR0bGUgdG8gc29sdmUgdGhpcyBwcm9ibGVtLiAgV2UgYWN0dWFsbHkgcmVseSBvbiB0aGUK
R1BVIGJlaW5nIGRlYWRsb2NrZWQgYXQgdGhpcyBwb2ludCAtIHdlIGFyZW4ndCBleHBlY3Rpbmcg
dGhlIEdQVSB0byBtYWtlCmFueSBwcm9ncmVzcy4gIFRoZSBvbmx5IHRoaW5nIHRoYXQgY2FuIHJl
YWxpc3RpY2FsbHkgaGFwcGVuIGlzIGZvcgp1c2Vyc3BhY2UgdG8gc3VibWl0IGEgbmV3IGpvYiwg
YnV0IGFkZGluZyB0aGlzIGxvY2tpbmcgZG9lcyBsaXR0bGUgdG8KYXZvaWQgdGhhdC4KCj4gRml4
ZXM6IGE4YzIxYTU0NTFkOCAoZHJtL2V0bmF2aXY6IGFkZCBpbml0aWFsIGV0bmF2aXYgRFJNIGRy
aXZlcikKPiBSZXBvcnRlZC1ieTogRGF2aWQgSmFuZGVyIDxkYXZpZEBwcm90b25pYy5ubD4KPiBT
aWduZWQtb2ZmLWJ5OiBMdWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5ndXRyb25peC5kZT4KPiBUZXN0
ZWQtYnk6IERhdmlkIEphbmRlciA8ZGF2aWRAcHJvdG9uaWMubmw+Cj4gLS0tCj4gIGRyaXZlcnMv
Z3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZHVtcC5jIHwgNSArKysrKwo+ICAxIGZpbGUgY2hhbmdl
ZCwgNSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ldG5h
dml2L2V0bmF2aXZfZHVtcC5jIGIvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9kdW1w
LmMKPiBpbmRleCAzMzg1NGM5NGNiODUuLjUxNTUxNWVmMjRmOSAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2R1bXAuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9ldG5hdml2L2V0bmF2aXZfZHVtcC5jCj4gQEAgLTEyNSw2ICsxMjUsOCBAQCB2b2lkIGV0bmF2
aXZfY29yZV9kdW1wKHN0cnVjdCBldG5hdml2X2dwdSAqZ3B1KQo+ICAJCXJldHVybjsKPiAgCWV0
bmF2aXZfZHVtcF9jb3JlID0gZmFsc2U7Cj4gIAo+ICsJbXV0ZXhfbG9jaygmZ3B1LT5tbXUtPmxv
Y2spOwo+ICsKPiAgCW1tdV9zaXplID0gZXRuYXZpdl9pb21tdV9kdW1wX3NpemUoZ3B1LT5tbXUp
Owo+ICAKPiAgCS8qIFdlIGFsd2F5cyBkdW1wIHJlZ2lzdGVycywgbW11LCByaW5nIGFuZCBlbmQg
bWFya2VyICovCj4gQEAgLTE2Nyw2ICsxNjksNyBAQCB2b2lkIGV0bmF2aXZfY29yZV9kdW1wKHN0
cnVjdCBldG5hdml2X2dwdSAqZ3B1KQo+ICAJaXRlci5zdGFydCA9IF9fdm1hbGxvYyhmaWxlX3Np
emUsIEdGUF9LRVJORUwgfCBfX0dGUF9OT1dBUk4gfCBfX0dGUF9OT1JFVFJZLAo+ICAJCQkgICAg
ICAgUEFHRV9LRVJORUwpOwo+ICAJaWYgKCFpdGVyLnN0YXJ0KSB7Cj4gKwkJbXV0ZXhfdW5sb2Nr
KCZncHUtPm1tdS0+bG9jayk7Cj4gIAkJZGV2X3dhcm4oZ3B1LT5kZXYsICJmYWlsZWQgdG8gYWxs
b2NhdGUgZGV2Y29yZWR1bXAgZmlsZVxuIik7Cj4gIAkJcmV0dXJuOwo+ICAJfQo+IEBAIC0yMzQs
NiArMjM3LDggQEAgdm9pZCBldG5hdml2X2NvcmVfZHVtcChzdHJ1Y3QgZXRuYXZpdl9ncHUgKmdw
dSkKPiAgCQkJCQkgb2JqLT5iYXNlLnNpemUpOwo+ICAJfQo+ICAKPiArCW11dGV4X3VubG9jaygm
Z3B1LT5tbXUtPmxvY2spOwo+ICsKCkFsbCB0aGF0IHRoaXMgbG9jayBkb2VzIGlzIHByZXZlbnQg
dGhlIGxpc3RzIGZyb20gY2hhbmdpbmcgd2hpbGUgd2UKYnVpbGQgdXAgd2hhdCB3ZSdyZSBnb2lu
ZyB0byB3cml0ZSBvdXQuICBBdCB0aGlzIHBvaW50LCB5b3UgZHJvcCB0aGUKbG9jaywgYmVmb3Jl
IHdlJ3ZlIHdyaXR0ZW4gYW55dGhpbmcgb3V0IHRvIHRoZSBjb3JlZHVtcC4gIFRoaW5ncwpjYW4g
bm93IGNoYW5nZSwgaW5jbHVkaW5nIHRoZSByaW5nIGJ1ZmZlci4KCj4gIAlldG5hdml2X2NvcmVf
ZHVtcF9oZWFkZXIoJml0ZXIsIEVURFVNUF9CVUZfRU5ELCBpdGVyLmRhdGEpOwo+ICAKPiAgCWRl
dl9jb3JlZHVtcHYoZ3B1LT5kZXYsIGl0ZXIuc3RhcnQsIGl0ZXIuZGF0YSAtIGl0ZXIuc3RhcnQs
IEdGUF9LRVJORUwpOwoKSGVyZSB3ZSB3cml0ZSBvdXQgdGhlIGRhdGEsIHdoaWNoIGluY2x1ZGVz
IHRoZSBjb21tYW5kIGJ1ZmZlcnMsIHJpbmcKYnVmZmVycywgQk9zLCBldGMuICBUaGUgZGF0YSBp
biB0aGUgcmluZyBidWZmZXIgY2FuIHN0aWxsIGNoYW5nZQpiZWNhdXNlIHRoZSBsb2NrIGhhcyBi
ZWVuIGRyb3BwZWQuCgpIb3dldmVyLCBhbGwgdGhvc2Ugb2JqZWN0cyBzaG91bGQgYmUgcGlubmVk
LCBzbyBub25lIG9mIHRoZW0gc2hvdWxkCmdvIGF3YXk6IHRoaW5ncyBsaWtlIHRoZSBjb21tYW5k
IGJ1ZmZlcnMgdGhhdCBoYXZlIGJlZW4gc3VibWl0dGVkCnNob3VsZCBiZSBpbW11dGFibGUgYXQg
dGhpcyBwb2ludCAoaWYgdGhleSBhcmVuJ3QsIGl0IGNvdWxkIHdlbGwgYmUKYSByZWFzb24gd2h5
IHRoZSBHUFUgaGFzIGdvbmUgYXdvbC4pCgpJdCBpcyBhbHNvIG5vdCBuaWNlIHRvIGhvbGQgdGhl
IGxvY2sgb3ZlciB0aGUgX2JpZ18gdm1hbGxvYygpIHdoaWNoCm1heSB0YWtlIHNvbWUgdGltZS4K
CkhhdmUgeW91IGFjdHVhbGx5IHNlZW4gcHJvYmxlbXMgaGVyZSwgb3IgaXMgdGhpcyBqdXN0IHRo
ZW9yZXRpY2FsPwoKLS0gClJNSydzIFBhdGNoIHN5c3RlbTogaHR0cHM6Ly93d3cuYXJtbGludXgu
b3JnLnVrL2RldmVsb3Blci9wYXRjaGVzLwpGVFRDIGJyb2FkYmFuZCBmb3IgMC44bWlsZSBsaW5l
IGluIHN1YnVyYmlhOiBzeW5jIGF0IDEyLjFNYnBzIGRvd24gNjIya2JwcyB1cApBY2NvcmRpbmcg
dG8gc3BlZWR0ZXN0Lm5ldDogMTEuOU1icHMgZG93biA1MDBrYnBzIHVwCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
