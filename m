Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0A6159D92
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2020 00:41:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A98EA6E446;
	Tue, 11 Feb 2020 23:41:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1498 seconds by postgrey-1.36 at gabe;
 Tue, 11 Feb 2020 23:41:51 UTC
Received: from 7.mo2.mail-out.ovh.net (7.mo2.mail-out.ovh.net [188.165.48.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BF8B6E43B
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 23:41:51 +0000 (UTC)
Received: from player795.ha.ovh.net (unknown [10.110.115.113])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id C8F191AEBDE
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 23:56:54 +0100 (CET)
Received: from etezian.org (81-175-223-118.bb.dnainternet.fi [81.175.223.118])
 (Authenticated sender: andi@etezian.org)
 by player795.ha.ovh.net (Postfix) with ESMTPSA id 32C08F22ABCA;
 Tue, 11 Feb 2020 22:56:45 +0000 (UTC)
Date: Wed, 12 Feb 2020 00:56:44 +0200
From: Andi Shyti <andi@etezian.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [Intel-gfx] [PATCH] drm/mm: Break long searches in fragmented
 address spaces
Message-ID: <20200211225644.GA6319@jack.zhora.eu>
References: <20200207151720.2812125-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200207151720.2812125-1-chris@chris-wilson.co.uk>
X-Ovh-Tracer-Id: 3546021756733538825
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrieefgdduiedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheptehnughiucfuhhihthhiuceorghnughisegvthgviihirghnrdhorhhgqeenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucfkpheptddrtddrtddrtddpkedurddujeehrddvvdefrdduudeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeelhedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegrnhguihesvghtvgiiihgrnhdrohhrghdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhg
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: intel-gfx@lists.freedesktop.org, Andi Shyti <andi.shyti@intel.com>,
 Andi Shyti <andi@etezian.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQ2hyaXMsCgpPbiBGcmksIEZlYiAwNywgMjAyMCBhdCAwMzoxNzoyMFBNICswMDAwLCBDaHJp
cyBXaWxzb24gd3JvdGU6Cj4gV2UgdHJ5IGhhcmQgdG8gc2VsZWN0IGEgc3VpdGFibGUgaG9sZSBp
biB0aGUgZHJtX21tIGZpcnN0IHRpbWUuIEJ1dCBpZgo+IHRoYXQgaXMgdW5zdWNjZXNzZnVsLCB3
ZSB0aGVuIGhhdmUgdG8gbG9vayBhdCBuZWlnaGJvdXJpbmcgbm9kZXMsIGFuZAo+IHRoaXMgcmVx
dWlyZXMgdHJhdmVyc2luZyB0aGUgcmJ0cmVlLiBXYWxraW5nIHRoZSByYnRyZWUgY2FuIGJlIHNs
b3cKPiAobXVjaCBzbG93ZXIgdGhhbiBhIGxpbmVhciBsaXN0IGZvciBkZWVwIHRyZWVzKSwgYW5k
IGlmIHRoZSBkcm1fbW0gaGFzCj4gYmVlbiBwdXJwb3NlZnVsbHkgZnJhZ21lbnRlZCBvdXIgc2Vh
cmNoIGNhbiBiZSB0cmFwcGVkIGZvciBhIGxvbmcsIGxvbmcKPiB0aW1lLiBGb3Igbm9uLXByZWVt
cHRpYmxlIGtlcm5lbHMsIHdlIG5lZWQgdG8gYnJlYWsgdXAgbG9uZyBDUFUgYm91bmQKPiBzZWN0
aW9ucyBieSBtYW51YWxseSBjaGVja2luZyBmb3IgY29uZF9yZXNjaGVkKCk7IHNpbWlsYXJseSB3
ZSBzaG91bGQKCmNoZWNraW5nIGZvciAiZmF0YWwgc2lnbmFscyIgeW91IG1lYW4/Cgo+IGFsc28g
YmFpbCBvdXQgaWYgd2UgaGF2ZSBiZWVuIHRvbGQgdG8gdGVybWluYXRlLiAoSW4gYW4gaWRlYWwg
d29ybGQsIHdlCj4gd291bGQgYnJlYWsgZm9yIGFueSBzaWduYWwsIGJ1dCB3ZSBuZWVkIHRvIHRy
YWRlIG9mZiBoYXZpbmcgdG8gcGVyZm9ybQo+IHRoZSBzZWFyY2ggYWdhaW4gYWZ0ZXIgRVJFU1RB
UlRTWVMsIHdoaWNoIGFnYWluIG1heSBmb3JtIGEgdHJhcCBvZgo+IG1ha2luZyBubyBmb3J3YXJk
IHByb2dyZXNzLikKPiAKPiBSZXBvcnRlZC1ieTogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymln
bmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29u
IDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4gQ2M6IFpiaWduaWV3IEtlbXBjennFhHNraSA8
emJpZ25pZXcua2VtcGN6eW5za2lAaW50ZWwuY29tPgo+IENjOiBKb29uYXMgTGFodGluZW4gPGpv
b25hcy5sYWh0aW5lbkBsaW51eC5pbnRlbC5jb20+CgpuaWNlIQoKUmV2aWV3ZWQtYnk6IEFuZGkg
U2h5dGkgPGFuZGkuc2h5dGlAaW50ZWwuY29tPgoKVGhhbmtzLApBbmRpCgo+IC0tLQo+ICBkcml2
ZXJzL2dwdS9kcm0vZHJtX21tLmMgfCA4ICsrKysrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9tbS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9tbS5jCj4gaW5kZXggMmE2ZTM0NjYz
MTQ2Li40N2Q1ZGU5Y2EwYTggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9tbS5j
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9tbS5jCj4gQEAgLTQ1LDYgKzQ1LDcgQEAKPiAg
I2luY2x1ZGUgPGxpbnV4L2V4cG9ydC5oPgo+ICAjaW5jbHVkZSA8bGludXgvaW50ZXJ2YWxfdHJl
ZV9nZW5lcmljLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9zZXFfZmlsZS5oPgo+ICsjaW5jbHVkZSA8
bGludXgvc2NoZWQvc2lnbmFsLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+Cj4gICNpbmNs
dWRlIDxsaW51eC9zdGFja3RyYWNlLmg+Cj4gIAo+IEBAIC0zNjYsNiArMzY3LDExIEBAIG5leHRf
aG9sZShzdHJ1Y3QgZHJtX21tICptbSwKPiAgCSAgc3RydWN0IGRybV9tbV9ub2RlICpub2RlLAo+
ICAJICBlbnVtIGRybV9tbV9pbnNlcnRfbW9kZSBtb2RlKQo+ICB7Cj4gKwkvKiBTZWFyY2hpbmcg
aXMgc2xvdzsgY2hlY2sgaWYgd2UgcmFuIG91dCBvZiB0aW1lL3BhdGllbmNlICovCj4gKwljb25k
X3Jlc2NoZWQoKTsKPiArCWlmIChmYXRhbF9zaWduYWxfcGVuZGluZyhjdXJyZW50KSkKPiArCQly
ZXR1cm4gTlVMTDsKPiArCj4gIAlzd2l0Y2ggKG1vZGUpIHsKPiAgCWRlZmF1bHQ6Cj4gIAljYXNl
IERSTV9NTV9JTlNFUlRfQkVTVDoKPiBAQCAtNTU3LDcgKzU2Myw3IEBAIGludCBkcm1fbW1faW5z
ZXJ0X25vZGVfaW5fcmFuZ2Uoc3RydWN0IGRybV9tbSAqIGNvbnN0IG1tLAo+ICAJCXJldHVybiAw
Owo+ICAJfQo+ICAKPiAtCXJldHVybiAtRU5PU1BDOwo+ICsJcmV0dXJuIHNpZ25hbF9wZW5kaW5n
KGN1cnJlbnQpID8gLUVSRVNUQVJUU1lTIDogLUVOT1NQQzsKPiAgfQo+ICBFWFBPUlRfU1lNQk9M
KGRybV9tbV9pbnNlcnRfbm9kZV9pbl9yYW5nZSk7Cj4gIAo+IC0tIAo+IDIuMjUuMAo+IAo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gSW50ZWwtZ2Z4
IG1haWxpbmcgbGlzdAo+IEludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
