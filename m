Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE9EAEDF6
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 17:00:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 691806E0EF;
	Tue, 10 Sep 2019 15:00:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7931E6E0EF
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2019 15:00:02 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:59580
 helo=[192.168.10.177])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <noralf@tronnes.org>)
 id 1i7hce-00070v-9G; Tue, 10 Sep 2019 17:00:00 +0200
Subject: Re: [PATCH 1/2] drm/fb-helper: Synchronize dirty worker with vblank
To: Thomas Zimmermann <tzimmermann@suse.de>, Gerd Hoffmann <kraxel@redhat.com>
References: <20190909140633.31260-1-tzimmermann@suse.de>
 <20190909140633.31260-2-tzimmermann@suse.de>
 <20190910115205.tc3oy2dtypwfrf22@sirius.home.kraxel.org>
 <52e8e124-f8e6-d2e6-0102-472b9fa70317@suse.de>
 <1223403a-17a5-638b-49ce-5dba23fe23d5@tronnes.org>
 <52be9b77-51aa-62b6-8de7-cfb1165c1470@suse.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <e6a9e282-b740-c447-bed6-d706787d0feb@tronnes.org>
Date: Tue, 10 Sep 2019 16:59:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <52be9b77-51aa-62b6-8de7-cfb1165c1470@suse.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org
 ; s=ds201810; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SPUKiMnvfzYDCVzXnKXKi3CBzowa3kVKjy6Xg3nuvEg=; b=fwuKnQMOVQewxEe1jvh8QagDWH
 E5IKQRzFs5OX2C5DeWU12v3t/XvAF/gTQmS7ZxjXZB6XDzesN8gzKkvyCao16pH3UsY+WGHnspO4x
 8rcb5JxqiO6WHAoA8LOKNQUnQ0uESr0yaQOSYBpgoekf1T3LH3lfvjcDkdvOB3f5HmW4nl4l1fPJJ
 CpBGX3AoIWFNV2/vDGEv+9qfI/BTeU7zng+dxFreT96UhCAVfn/xCghiWJ9xWnN5/Zo2ksSPSMyiW
 x1WVBeHWSHABEMBgaoaUKIYiZRnWEX7OTtFA0zOvPPzGl93WSeUdVhxi/qod9gULtg2AFT2nNxH6p
 F9NGLMmg==;
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
Cc: feng.tang@intel.com, rong.a.chen@intel.com, dri-devel@lists.freedesktop.org,
 ying.huang@intel.com, airlied@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMTAuMDkuMjAxOSAxNS41MSwgc2tyZXYgVGhvbWFzIFppbW1lcm1hbm46Cj4gSGkKPiAK
PiBBbSAxMC4wOS4xOSB1bSAxNTozNCBzY2hyaWViIE5vcmFsZiBUcsO4bm5lczoKPj4KPj4KPj4g
RGVuIDEwLjA5LjIwMTkgMTQuNDgsIHNrcmV2IFRob21hcyBaaW1tZXJtYW5uOgo+Pj4gSGkKPj4+
Cj4+PiBBbSAxMC4wOS4xOSB1bSAxMzo1MiBzY2hyaWViIEdlcmQgSG9mZm1hbm46Cj4+Pj4gT24g
TW9uLCBTZXAgMDksIDIwMTkgYXQgMDQ6MDY6MzJQTSArMDIwMCwgVGhvbWFzIFppbW1lcm1hbm4g
d3JvdGU6Cj4+Pj4+IEJlZm9yZSB1cGRhdGluZyB0aGUgZGlzcGxheSBmcm9tIHRoZSBjb25zb2xl
J3Mgc2hhZG93IGJ1ZmZlciwgdGhlIGRpcnR5Cj4+Pj4+IHdvcmtlciBub3cgd2FpdHMgZm9yIHZi
bGFuay4gVGhpcyBhbGxvd3Mgc2V2ZXJhbCBzY3JlZW4gdXBkYXRlcyB0byBwaWxlCj4+Pj4+IHVw
IGFuZCBhY3RzIGFzIGEgcmF0ZSBsaW1pdGVyLgo+Pj4+Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBU
aG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KPj4+Pj4gLS0tCj4+Pj4+ICBk
cml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jIHwgMTIgKysrKysrKysrKysrCj4+Pj4+ICAx
IGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQo+Pj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJf
aGVscGVyLmMKPj4+Pj4gaW5kZXggYTdiYTViNDkwMmQ2Li4wMTdlMmY2YmQxYjkgMTAwNjQ0Cj4+
Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMKPj4+Pj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYwo+Pj4+PiBAQCAtNDAyLDggKzQwMiwyMCBAQCBz
dGF0aWMgdm9pZCBkcm1fZmJfaGVscGVyX2RpcnR5X3dvcmsoc3RydWN0IHdvcmtfc3RydWN0ICp3
b3JrKQo+Pj4+PiAgCQkJCQkJICAgIGRpcnR5X3dvcmspOwo+Pj4+PiAgCXN0cnVjdCBkcm1fY2xp
cF9yZWN0ICpjbGlwID0gJmhlbHBlci0+ZGlydHlfY2xpcDsKPj4+Pj4gIAlzdHJ1Y3QgZHJtX2Ns
aXBfcmVjdCBjbGlwX2NvcHk7Cj4+Pj4+ICsJc3RydWN0IGRybV9jcnRjICpjcnRjOwo+Pj4+PiAg
CXVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4+Pj4+ICAJdm9pZCAqdmFkZHI7Cj4+Pj4+ICsJaW50IHJl
dDsKPj4+Pj4gKwo+Pj4+PiArCS8qIHJhdGUtbGltaXQgdXBkYXRlIGZyZXF1ZW5jeSAqLwo+Pj4+
PiArCW11dGV4X2xvY2soJmhlbHBlci0+bG9jayk7Cj4+Pj4+ICsJY3J0YyA9IGhlbHBlci0+Y2xp
ZW50Lm1vZGVzZXRzWzBdLmNydGM7Cj4+Pj4+ICsJcmV0ID0gZHJtX2NydGNfdmJsYW5rX2dldChj
cnRjKTsKPj4+Pj4gKwlpZiAoIXJldCkgewo+Pj4+PiArCQlkcm1fY3J0Y193YWl0X29uZV92Ymxh
bmsoY3J0Yyk7Cj4+Pj4+ICsJCWRybV9jcnRjX3ZibGFua19wdXQoY3J0Yyk7Cj4+Pj4+ICsJfQo+
Pj4+PiArCW11dGV4X3VubG9jaygmaGVscGVyLT5sb2NrKTsKPj4+Pgo+Pj4+IEhtbSwgbm90IHN1
cmUgaXQgaXMgdGhlIGJlc3QgcGxhbiB0byBzbGVlcCBmb3IgYSB3aGlsZSBpbiB0aGUgd29ya2Vy
LAo+Pj4+IGVzcGVjaWFsbHkgd2hpbGUgaG9sZGluZyB0aGUgbG9jay4KPj4+Pgo+Pj4+IFdoYXQg
ZG9lcyB0aGUgbG9jayBwcm90ZWN0IGFnYWluc3QgaGVyZT8gIEFjY2Vzc2luZwo+Pj4KPj4+IFRo
aXMgbG9jayBpcyBob2xkIGJ5IHRoZSBmYmRldiBjb2RlIGR1cmluZyBtb2RlLXNldHRpbmcgb3Bl
cmF0aW9ucyAoYnV0Cj4+PiBub3QgZHJhd2luZyBvcGVyYXRpb25zKS4gU28gKmNydGMgbWlnaHQg
YmUgZ29uZSBpZiB3ZSBkb24ndCBob2xkIGl0IGhlcmUuCj4+Pgo+Pj4+IGhlbHBlci0+Y2xpZW50
Lm1vZGVzZXRzPyAgSWYgc28gdGhlbiB5b3UgY2FuIHVubG9jayBiZWZvcmUgZ29pbmcgdG8KPj4+
PiBzbGVlcCBpbiBkcm1fY3J0Y193YWl0X29uZV92YmxhbmsoKSBJIHRoaW5rLgo+Pj4KPj4+IEkg
bG9va2VkLCBidXQgSSBjYW5ub3QgZmluZCBhbnkgY29kZSB0aGF0IHByb3RlY3RzIGNydGMgd2hp
bGUgdmJsYW5rIGlzCj4+PiBhY3RpdmUuIEknZCByYXRoZXIgbm90IGNoYW5nZSB0aGUgY3VycmVu
dCBjb2RlIHVudGlsIHNvbWVvbmUgY2FuIGNsYXJpZnkuCj4+Pgo+Pgo+PiBUaGUgY2xpZW50LT5t
b2Rlc2V0cyBhcnJheSBhbmQgdGhlIGNydGMgc3RydWN0IG1lbWJlciBhcmUgaW52YXJpYW50IG92
ZXIKPj4gdGhlIGxpZmV0aW1lIG9mIGNsaWVudCAoZHJtX2NsaWVudF9tb2Rlc2V0X2NyZWF0ZSgp
KS4gTm8gbmVlZCB0byB0YWtlIGEKPj4gbG9jayBmb3IgYWNjZXNzLiBTZWUgZHJtX2NsaWVudF9t
b2Rlc2V0X3JlbGVhc2UoKSBmb3IgdGhlIHRoaW5ncyB0aGF0Cj4+IF9jYW5fIGNoYW5nZSBhbmQg
bmVlZHMgcHJvdGVjdGlvbiAocHJvdGVjdGVkIGJ5IGNsaWVudC0+bW9kZXNldF9tdXRleCkuCj4g
Cj4gVGhhbmtzIGZvciB0aGUgcmVwbHkuIFNvIHdlIGRvbid0IG5lZWQgdGhlIGxvY2s/IEJ1dCB3
aHkgZG9lcwo+IGRybV9mYl9oZWxwZXJfaW9jdGwoKSB0YWtlIGl0PyBpb2N0bCBleGNsdXNpdmVu
ZXNzPwo+IAoKQmVjYXVzZSBvZiBkcm1fbWFzdGVyX2ludGVybmFsX2FjcXVpcmUoKSBpdCdzIG5l
Y2Vzc2FyeSB0byB0YWtlIHRoZSBsb2NrCmZpcnN0LiBUaGF0J3MgdGhlIGxvY2tpbmcgcnVsZXMg
b2YgZHJtX2ZiX2hlbHBlci4gRmlyc3QgdGFrZSB0aGUgZmIKaGVscGVyIGxvY2ssIHRoZW4gdGhl
IGRldi0+bWFzdGVyX211dGV4LiBXZSBzdGF5IGF3YXkgaWYgdGhlcmUncyBhCnVzZXJzcGFjZSBt
YXN0ZXIgYW5kIGlmIHRoZXJlJ3Mgbm9uZSwgd2UgcHJldmVudCB1c2Vyc3BhY2UgZnJvbSBiZWNv
bWluZwptYXN0ZXIgd2hpbGUgd2UgZG8gc3R1ZmYuCgpCdXQgbG9va2luZyBhdCBkcm1fZmJfaGVs
cGVyX2lvY3RsKCkgbm93LCBJIHNlZSB0aGF0IGl0J3Mgbm90IHN0cmljdGx5Cm5lY2Vzc2FyeSB0
byBkbyB0aGlzIHNpbmNlIGFsbCB0aGlzIGZ1bmN0aW9uIGNhbiBkbyBpcyB2Ymxhbmsgd2FpdCBh
bmQKdGhhdCdzIGZpbmUgZXZlbiBpZiB1c2Vyc3BhY2UgaXMgbWFzdGVyLiBUaGUgbG9ja2luZyB3
YXMgbmVjZXNzYXJ5CmJlZm9yZSBJIHJlZmFjdG9yZWQgYW5kIG1vdmVkIHN0dWZmIHRvIGRybV9j
bGllbnQsIGJlY2F1c2UgYXQgdGhhdCB0aW1lCnRoZSBtb2Rlc2V0IGFycmF5IHdhcyBkZWxldGVk
IGFuZCByZWNyZWF0ZWQgd2hlbiBwcm9iaW5nIGNvbm5lY3RvcnMuCkJ1dCBpdCBkb2Vzbid0IGh1
cnQgZWl0aGVyIGluIGNhc2UgbW9yZSBmdW5jdGlvbmFsaXR5IGlzIGFkZGVkIHRvIHRoZQppb2N0
bC4gT25lIHdvdWxkbid0IHRoaW5rIHRoYXQgd291bGQgZXZlciBoYXBwZW4sIHNpbmNlIGZiZGV2
IGlzIGdvaW5nCmF3YXkgc29vbiwgYnV0IHN0aWxsIHdlIGtlZXAgcG9saXNoaW5nIGl0IDspCgpO
b3JhbGYuCgo+PiBJIGRvbid0IHNlZSBhIHByb2JsZW0gd2l0aCBzbGVlcGluZyBpbiB0aGUgd29y
a2VyIHRob3VnaCwgYnV0IEkgbWlnaHQKPj4gbWlzcyBvdXQgb24gc29tZXRoaW5nLiBBRkFJQ1Mg
Y2hhbmdlcyB3aWxsIGp1c3QgcGlsZSB1cCBpbiA+ZGlydHlfY2xpcAo+PiBhbmQgdGhlIHdvcmtl
ciB3aWxsIGJlIHNjaGVkdWxlZCBmb3IgYSBuZXcgcnVuIHRvIGhhcHBlbiB3aGVuIGl0J3MgZG9u
ZQo+PiB3aXRoIHRoZSBjdXJyZW50IHVwZGF0ZS4KPiAKPiBZZXMsIHRoYXQncyB0aGUgaW50ZW50
aW9uIG9mIHRoZSBwYXRjaC4gV2UgaG9wZSB0byByZWR1Y2UgdGhlIG51bWJlciBvZgo+IG1lbWNw
eXMgYnkgaGFuZGxpbmcgc2V2ZXJhbCBvZiB0aGVtIGF0IG9uY2UuCj4gCj4gQmVzdCByZWdhcmRz
Cj4gVGhvbWFzCj4gCj4+Cj4+IE5vcmFsZi4KPj4KPj4+IEJlc3QgcmVnYXJkcwo+Pj4gVGhvbWFz
Cj4+Pgo+Pj4+Cj4+Pj4gY2hlZXJzLAo+Pj4+ICAgR2VyZAo+Pj4+Cj4+Pgo+IApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
