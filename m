Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4CE8BB5A
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 16:21:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C5266E158;
	Tue, 13 Aug 2019 14:21:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 504A76E158;
 Tue, 13 Aug 2019 14:21:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 79716FB03;
 Tue, 13 Aug 2019 16:21:21 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7iAxvxKN0uMZ; Tue, 13 Aug 2019 16:21:20 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id A4651416CC; Tue, 13 Aug 2019 16:21:19 +0200 (CEST)
Date: Tue, 13 Aug 2019 16:21:19 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH v3 6/8] drm/etnaviv: split out starting of FE idle loop
Message-ID: <20190813142119.GA22471@bogon.m.sigxcpu.org>
References: <20190809120424.32679-1-l.stach@pengutronix.de>
 <20190809120424.32679-6-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190809120424.32679-6-l.stach@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 patchwork-lst@pengutronix.de, kernel@pengutronix.de,
 Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCk9uIEZyaSwgQXVnIDA5LCAyMDE5IGF0IDAyOjA0OjIyUE0gKzAyMDAsIEx1Y2FzIFN0YWNo
IHdyb3RlOgo+IE1vdmUgYnVmZmVyIHNldHVwIGFuZCBzdGFydGluZyBvZiB0aGUgRkUgbG9vcCBp
biB0aGUga2VybmVsIHJpbmdidWZmZXIKPiBpbnRvIGEgc2VwYXJhdGUgZnVuY3Rpb24uIFRoaXMg
aXMgYSBwcmVwYXJhdGlvbiB0byBzdGFydCB0aGUgRkUgbGF0ZXIKPiBpbiB0aGUgc3VibWl0IHBy
b2Nlc3MuCj4gCj4gU2lnbmVkLW9mZi1ieTogTHVjYXMgU3RhY2ggPGwuc3RhY2hAcGVuZ3V0cm9u
aXguZGU+Cj4gUmV2aWV3ZWQtYnk6IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXgu
ZGU+CgpSZXZpZXdlZC1ieTogR3VpZG8gR8O8bnRoZXIgPGFneEBzaWd4Y3B1Lm9yZz4KCj4gLS0t
Cj4gIGRyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ3B1LmMgfCAyNiArKysrKysrKysr
KysrKysrLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMTAg
ZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0
bmF2aXZfZ3B1LmMgYi9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dwdS5jCj4gaW5k
ZXggODg1Y2E4ZjkyMzM4Li4zYWY3MmE0MTI3YjAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2V0bmF2aXYvZXRuYXZpdl9ncHUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2
L2V0bmF2aXZfZ3B1LmMKPiBAQCAtNjAwLDYgKzYwMCwyMCBAQCB2b2lkIGV0bmF2aXZfZ3B1X3N0
YXJ0X2ZlKHN0cnVjdCBldG5hdml2X2dwdSAqZ3B1LCB1MzIgYWRkcmVzcywgdTE2IHByZWZldGNo
KQo+ICAJfQo+ICB9Cj4gIAo+ICtzdGF0aWMgdm9pZCBldG5hdml2X2dwdV9zdGFydF9mZV9pZGxl
bG9vcChzdHJ1Y3QgZXRuYXZpdl9ncHUgKmdwdSkKPiArewo+ICsJdTMyIGFkZHJlc3MgPSBldG5h
dml2X2NtZGJ1Zl9nZXRfdmEoJmdwdS0+YnVmZmVyLCAmZ3B1LT5jbWRidWZfbWFwcGluZyk7Cj4g
Kwl1MTYgcHJlZmV0Y2g7Cj4gKwo+ICsJLyogc2V0dXAgdGhlIE1NVSAqLwo+ICsJZXRuYXZpdl9p
b21tdV9yZXN0b3JlKGdwdSwgZ3B1LT5tbXVfY29udGV4dCk7Cj4gKwo+ICsJLyogU3RhcnQgY29t
bWFuZCBwcm9jZXNzb3IgKi8KPiArCXByZWZldGNoID0gZXRuYXZpdl9idWZmZXJfaW5pdChncHUp
Owo+ICsKPiArCWV0bmF2aXZfZ3B1X3N0YXJ0X2ZlKGdwdSwgYWRkcmVzcywgcHJlZmV0Y2gpOwo+
ICt9Cj4gKwo+ICBzdGF0aWMgdm9pZCBldG5hdml2X2dwdV9zZXR1cF9wdWxzZV9lYXRlcihzdHJ1
Y3QgZXRuYXZpdl9ncHUgKmdwdSkKPiAgewo+ICAJLyoKPiBAQCAtNjMzLDggKzY0Nyw2IEBAIHN0
YXRpYyB2b2lkIGV0bmF2aXZfZ3B1X3NldHVwX3B1bHNlX2VhdGVyKHN0cnVjdCBldG5hdml2X2dw
dSAqZ3B1KQo+ICAKPiAgc3RhdGljIHZvaWQgZXRuYXZpdl9ncHVfaHdfaW5pdChzdHJ1Y3QgZXRu
YXZpdl9ncHUgKmdwdSkKPiAgewo+IC0JdTE2IHByZWZldGNoOwo+IC0KPiAgCWlmICgoZXRuYXZp
dl9pc19tb2RlbF9yZXYoZ3B1LCBHQzMyMCwgMHg1MDA3KSB8fAo+ICAJICAgICBldG5hdml2X2lz
X21vZGVsX3JldihncHUsIEdDMzIwLCAweDUyMjApKSAmJgo+ICAJICAgIGdwdV9yZWFkKGdwdSwg
VklWU19ISV9DSElQX1RJTUUpICE9IDB4MjA2MjQwMCkgewo+IEBAIC02ODAsMTUgKzY5Miw5IEBA
IHN0YXRpYyB2b2lkIGV0bmF2aXZfZ3B1X2h3X2luaXQoc3RydWN0IGV0bmF2aXZfZ3B1ICpncHUp
Cj4gIAkvKiBzZXR1cCB0aGUgcHVsc2UgZWF0ZXIgKi8KPiAgCWV0bmF2aXZfZ3B1X3NldHVwX3B1
bHNlX2VhdGVyKGdwdSk7Cj4gIAo+IC0JLyogc2V0dXAgdGhlIE1NVSAqLwo+IC0JZXRuYXZpdl9p
b21tdV9yZXN0b3JlKGdwdSwgZ3B1LT5tbXVfY29udGV4dCk7Cj4gLQo+IC0JLyogU3RhcnQgY29t
bWFuZCBwcm9jZXNzb3IgKi8KPiAtCXByZWZldGNoID0gZXRuYXZpdl9idWZmZXJfaW5pdChncHUp
Owo+IC0KPiAgCWdwdV93cml0ZShncHUsIFZJVlNfSElfSU5UUl9FTkJMLCB+MFUpOwo+IC0JZXRu
YXZpdl9ncHVfc3RhcnRfZmUoZ3B1LCBldG5hdml2X2NtZGJ1Zl9nZXRfdmEoJmdwdS0+YnVmZmVy
LAo+IC0JCQkgICAgICZncHUtPmNtZGJ1Zl9tYXBwaW5nKSwgcHJlZmV0Y2gpOwo+ICsKPiArCWV0
bmF2aXZfZ3B1X3N0YXJ0X2ZlX2lkbGVsb29wKGdwdSk7Cj4gIH0KPiAgCj4gIGludCBldG5hdml2
X2dwdV9pbml0KHN0cnVjdCBldG5hdml2X2dwdSAqZ3B1KQo+IC0tIAo+IDIuMjAuMQo+IAo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZXRuYXZpdiBt
YWlsaW5nIGxpc3QKPiBldG5hdml2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZXRuYXZpdgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
