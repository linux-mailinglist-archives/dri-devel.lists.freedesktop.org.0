Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75562B4F1A
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 15:25:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E5056EC70;
	Tue, 17 Sep 2019 13:25:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F9356EC70
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 13:25:21 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:59185
 helo=[192.168.10.177])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <noralf@tronnes.org>)
 id 1iADTq-00035P-Pi; Tue, 17 Sep 2019 15:25:18 +0200
Subject: Re: [PATCH 1/2] drm/fb-helper: Synchronize dirty worker with vblank
To: Daniel Vetter <daniel@ffwll.ch>
References: <20190909140633.31260-1-tzimmermann@suse.de>
 <20190909140633.31260-2-tzimmermann@suse.de>
 <20190910115205.tc3oy2dtypwfrf22@sirius.home.kraxel.org>
 <52e8e124-f8e6-d2e6-0102-472b9fa70317@suse.de>
 <1223403a-17a5-638b-49ce-5dba23fe23d5@tronnes.org>
 <52be9b77-51aa-62b6-8de7-cfb1165c1470@suse.de>
 <e6a9e282-b740-c447-bed6-d706787d0feb@tronnes.org>
 <20190917125557.GR3958@phenom.ffwll.local>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <370f627e-3147-94b5-05a5-fea4e095a46e@tronnes.org>
Date: Tue, 17 Sep 2019 15:25:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190917125557.GR3958@phenom.ffwll.local>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org
 ; s=ds201810; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=As39jNO9J0oKHpInCg+93Mo5TGYsflBALu4H51VxbeY=; b=Eng+mWH54Z5jZZ0bur9oalkWJZ
 W9qPFCOOnTuP6/EIWwvNADOLRqVlsmUJEeoNYXhinFK0FruwI0YN4n31+XBPcFD87Rbbq5oMepUk5
 3mhGb3yIKQohNqKsO/rIduGA0hBzwb84OxDqSfdg+Rg3YU4Dogf+1Hbvdfgch5Jiq5tJ1jmCrIIc6
 hUAmrAdR/sYrF5VkwpxyOmy3cyre11QRx5yL32swGABOXVt+Vr1ozsYihB6eM769bzVnRSKdkqkCG
 89nBC5lqbhTDpxMC79Iqx1P4aCaOboCgJdCfjZ+oJTcy64n3M1iFFG/06U5Itn1nYqNV7l3LNc6a1
 kt/oFT5A==;
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
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 ying.huang@intel.com, airlied@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMTcuMDkuMjAxOSAxNC41NSwgc2tyZXYgRGFuaWVsIFZldHRlcjoKPiBPbiBUdWUsIFNl
cCAxMCwgMjAxOSBhdCAwNDo1OTo1N1BNICswMjAwLCBOb3JhbGYgVHLDuG5uZXMgd3JvdGU6Cj4+
Cj4+Cj4+IERlbiAxMC4wOS4yMDE5IDE1LjUxLCBza3JldiBUaG9tYXMgWmltbWVybWFubjoKPj4+
IEhpCj4+Pgo+Pj4gQW0gMTAuMDkuMTkgdW0gMTU6MzQgc2NocmllYiBOb3JhbGYgVHLDuG5uZXM6
Cj4+Pj4KPj4+Pgo+Pj4+IERlbiAxMC4wOS4yMDE5IDE0LjQ4LCBza3JldiBUaG9tYXMgWmltbWVy
bWFubjoKPj4+Pj4gSGkKPj4+Pj4KPj4+Pj4gQW0gMTAuMDkuMTkgdW0gMTM6NTIgc2NocmllYiBH
ZXJkIEhvZmZtYW5uOgo+Pj4+Pj4gT24gTW9uLCBTZXAgMDksIDIwMTkgYXQgMDQ6MDY6MzJQTSAr
MDIwMCwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6Cj4+Pj4+Pj4gQmVmb3JlIHVwZGF0aW5nIHRo
ZSBkaXNwbGF5IGZyb20gdGhlIGNvbnNvbGUncyBzaGFkb3cgYnVmZmVyLCB0aGUgZGlydHkKPj4+
Pj4+PiB3b3JrZXIgbm93IHdhaXRzIGZvciB2YmxhbmsuIFRoaXMgYWxsb3dzIHNldmVyYWwgc2Ny
ZWVuIHVwZGF0ZXMgdG8gcGlsZQo+Pj4+Pj4+IHVwIGFuZCBhY3RzIGFzIGEgcmF0ZSBsaW1pdGVy
Lgo+Pj4+Pj4+Cj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1t
ZXJtYW5uQHN1c2UuZGU+Cj4+Pj4+Pj4gLS0tCj4+Pj4+Pj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1f
ZmJfaGVscGVyLmMgfCAxMiArKysrKysrKysrKysKPj4+Pj4+PiAgMSBmaWxlIGNoYW5nZWQsIDEy
IGluc2VydGlvbnMoKykKPj4+Pj4+Pgo+Pj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX2ZiX2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYwo+Pj4+
Pj4+IGluZGV4IGE3YmE1YjQ5MDJkNi4uMDE3ZTJmNmJkMWI5IDEwMDY0NAo+Pj4+Pj4+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMKPj4+Pj4+PiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX2ZiX2hlbHBlci5jCj4+Pj4+Pj4gQEAgLTQwMiw4ICs0MDIsMjAgQEAgc3RhdGlj
IHZvaWQgZHJtX2ZiX2hlbHBlcl9kaXJ0eV93b3JrKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykK
Pj4+Pj4+PiAgCQkJCQkJICAgIGRpcnR5X3dvcmspOwo+Pj4+Pj4+ICAJc3RydWN0IGRybV9jbGlw
X3JlY3QgKmNsaXAgPSAmaGVscGVyLT5kaXJ0eV9jbGlwOwo+Pj4+Pj4+ICAJc3RydWN0IGRybV9j
bGlwX3JlY3QgY2xpcF9jb3B5Owo+Pj4+Pj4+ICsJc3RydWN0IGRybV9jcnRjICpjcnRjOwo+Pj4+
Pj4+ICAJdW5zaWduZWQgbG9uZyBmbGFnczsKPj4+Pj4+PiAgCXZvaWQgKnZhZGRyOwo+Pj4+Pj4+
ICsJaW50IHJldDsKPj4+Pj4+PiArCj4+Pj4+Pj4gKwkvKiByYXRlLWxpbWl0IHVwZGF0ZSBmcmVx
dWVuY3kgKi8KPj4+Pj4+PiArCW11dGV4X2xvY2soJmhlbHBlci0+bG9jayk7Cj4+Pj4+Pj4gKwlj
cnRjID0gaGVscGVyLT5jbGllbnQubW9kZXNldHNbMF0uY3J0YzsKPj4+Pj4+PiArCXJldCA9IGRy
bV9jcnRjX3ZibGFua19nZXQoY3J0Yyk7Cj4+Pj4+Pj4gKwlpZiAoIXJldCkgewo+Pj4+Pj4+ICsJ
CWRybV9jcnRjX3dhaXRfb25lX3ZibGFuayhjcnRjKTsKPj4+Pj4+PiArCQlkcm1fY3J0Y192Ymxh
bmtfcHV0KGNydGMpOwo+Pj4+Pj4+ICsJfQo+Pj4+Pj4+ICsJbXV0ZXhfdW5sb2NrKCZoZWxwZXIt
PmxvY2spOwo+Pj4+Pj4KPj4+Pj4+IEhtbSwgbm90IHN1cmUgaXQgaXMgdGhlIGJlc3QgcGxhbiB0
byBzbGVlcCBmb3IgYSB3aGlsZSBpbiB0aGUgd29ya2VyLAo+Pj4+Pj4gZXNwZWNpYWxseSB3aGls
ZSBob2xkaW5nIHRoZSBsb2NrLgo+Pj4+Pj4KPj4+Pj4+IFdoYXQgZG9lcyB0aGUgbG9jayBwcm90
ZWN0IGFnYWluc3QgaGVyZT8gIEFjY2Vzc2luZwo+Pj4+Pgo+Pj4+PiBUaGlzIGxvY2sgaXMgaG9s
ZCBieSB0aGUgZmJkZXYgY29kZSBkdXJpbmcgbW9kZS1zZXR0aW5nIG9wZXJhdGlvbnMgKGJ1dAo+
Pj4+PiBub3QgZHJhd2luZyBvcGVyYXRpb25zKS4gU28gKmNydGMgbWlnaHQgYmUgZ29uZSBpZiB3
ZSBkb24ndCBob2xkIGl0IGhlcmUuCj4+Pj4+Cj4+Pj4+PiBoZWxwZXItPmNsaWVudC5tb2Rlc2V0
cz8gIElmIHNvIHRoZW4geW91IGNhbiB1bmxvY2sgYmVmb3JlIGdvaW5nIHRvCj4+Pj4+PiBzbGVl
cCBpbiBkcm1fY3J0Y193YWl0X29uZV92YmxhbmsoKSBJIHRoaW5rLgo+Pj4+Pgo+Pj4+PiBJIGxv
b2tlZCwgYnV0IEkgY2Fubm90IGZpbmQgYW55IGNvZGUgdGhhdCBwcm90ZWN0cyBjcnRjIHdoaWxl
IHZibGFuayBpcwo+Pj4+PiBhY3RpdmUuIEknZCByYXRoZXIgbm90IGNoYW5nZSB0aGUgY3VycmVu
dCBjb2RlIHVudGlsIHNvbWVvbmUgY2FuIGNsYXJpZnkuCj4+Pj4+Cj4+Pj4KPj4+PiBUaGUgY2xp
ZW50LT5tb2Rlc2V0cyBhcnJheSBhbmQgdGhlIGNydGMgc3RydWN0IG1lbWJlciBhcmUgaW52YXJp
YW50IG92ZXIKPj4+PiB0aGUgbGlmZXRpbWUgb2YgY2xpZW50IChkcm1fY2xpZW50X21vZGVzZXRf
Y3JlYXRlKCkpLiBObyBuZWVkIHRvIHRha2UgYQo+Pj4+IGxvY2sgZm9yIGFjY2Vzcy4gU2VlIGRy
bV9jbGllbnRfbW9kZXNldF9yZWxlYXNlKCkgZm9yIHRoZSB0aGluZ3MgdGhhdAo+Pj4+IF9jYW5f
IGNoYW5nZSBhbmQgbmVlZHMgcHJvdGVjdGlvbiAocHJvdGVjdGVkIGJ5IGNsaWVudC0+bW9kZXNl
dF9tdXRleCkuCj4+Pgo+Pj4gVGhhbmtzIGZvciB0aGUgcmVwbHkuIFNvIHdlIGRvbid0IG5lZWQg
dGhlIGxvY2s/IEJ1dCB3aHkgZG9lcwo+Pj4gZHJtX2ZiX2hlbHBlcl9pb2N0bCgpIHRha2UgaXQ/
IGlvY3RsIGV4Y2x1c2l2ZW5lc3M/Cj4+Pgo+Pgo+PiBCZWNhdXNlIG9mIGRybV9tYXN0ZXJfaW50
ZXJuYWxfYWNxdWlyZSgpIGl0J3MgbmVjZXNzYXJ5IHRvIHRha2UgdGhlIGxvY2sKPj4gZmlyc3Qu
IFRoYXQncyB0aGUgbG9ja2luZyBydWxlcyBvZiBkcm1fZmJfaGVscGVyLiBGaXJzdCB0YWtlIHRo
ZSBmYgo+PiBoZWxwZXIgbG9jaywgdGhlbiB0aGUgZGV2LT5tYXN0ZXJfbXV0ZXguIFdlIHN0YXkg
YXdheSBpZiB0aGVyZSdzIGEKPj4gdXNlcnNwYWNlIG1hc3RlciBhbmQgaWYgdGhlcmUncyBub25l
LCB3ZSBwcmV2ZW50IHVzZXJzcGFjZSBmcm9tIGJlY29taW5nCj4+IG1hc3RlciB3aGlsZSB3ZSBk
byBzdHVmZi4KPj4KPj4gQnV0IGxvb2tpbmcgYXQgZHJtX2ZiX2hlbHBlcl9pb2N0bCgpIG5vdywg
SSBzZWUgdGhhdCBpdCdzIG5vdCBzdHJpY3RseQo+PiBuZWNlc3NhcnkgdG8gZG8gdGhpcyBzaW5j
ZSBhbGwgdGhpcyBmdW5jdGlvbiBjYW4gZG8gaXMgdmJsYW5rIHdhaXQgYW5kCj4+IHRoYXQncyBm
aW5lIGV2ZW4gaWYgdXNlcnNwYWNlIGlzIG1hc3Rlci4gVGhlIGxvY2tpbmcgd2FzIG5lY2Vzc2Fy
eQo+PiBiZWZvcmUgSSByZWZhY3RvcmVkIGFuZCBtb3ZlZCBzdHVmZiB0byBkcm1fY2xpZW50LCBi
ZWNhdXNlIGF0IHRoYXQgdGltZQo+PiB0aGUgbW9kZXNldCBhcnJheSB3YXMgZGVsZXRlZCBhbmQg
cmVjcmVhdGVkIHdoZW4gcHJvYmluZyBjb25uZWN0b3JzLgo+PiBCdXQgaXQgZG9lc24ndCBodXJ0
IGVpdGhlciBpbiBjYXNlIG1vcmUgZnVuY3Rpb25hbGl0eSBpcyBhZGRlZCB0byB0aGUKPj4gaW9j
dGwuIE9uZSB3b3VsZG4ndCB0aGluayB0aGF0IHdvdWxkIGV2ZXIgaGFwcGVuLCBzaW5jZSBmYmRl
diBpcyBnb2luZwo+PiBhd2F5IHNvb24sIGJ1dCBzdGlsbCB3ZSBrZWVwIHBvbGlzaGluZyBpdCA7
KQo+IAo+IGZiZGV2IGRyaXZlcnMgYXJlIGhvcGVmdWxseSBkaXNhcHBlYXJpbmcsIEkgZG9uJ3Qg
dGhpbmsgZmJkZXYgYXMgdGhlIHVhcGkKPiBpbnRlcmZhY2Ugd2lsbCBkaXNhcHBlYXIgc29vbi4g
SGVuY2Ugd2h5IGl0J3Mgc3RpbGwgc29tZXdoYXQgcmVhc29uYWJsZSB0bwo+IGtlZXAgcG9saXNo
aW5nIGl0IGltby4gSXQgc2hvdWxkIGFjdHVhbGx5IGhlbHAgaW4gY29udmluY2luZyBwZW9wbGUg
dG8KPiBtb3ZlIHRoZWlyIGZiZGV2IGRyaXZlciBvdmVyIHRvIGRybSwgaWYgdGhhdCBnaXZlcyB0
aGVtIGEgbW9yZSBwb2xpc2hlZAo+IGZiZGV2IGltcGxlbWVudGF0aW9uIDotKQoKT2ggcmlnaHQs
IHRoZSB1YXBpIHN0YXlzLCBpbiB0aGF0IGxpZ2h0IGl0IG1ha2VzIHNlbnNlIHRvIGtlZXAgcG9s
aXNoaW5nCnRoZSBlbXVsYXRpb24gYW5kIGdldCBmYmRldiBkcml2ZXJzIHBvcnRlZCBvdmVyLgoK
Tm9yYWxmLgoKPiAtRGFuaWVsCj4gCj4+Cj4+IE5vcmFsZi4KPj4KPj4+PiBJIGRvbid0IHNlZSBh
IHByb2JsZW0gd2l0aCBzbGVlcGluZyBpbiB0aGUgd29ya2VyIHRob3VnaCwgYnV0IEkgbWlnaHQK
Pj4+PiBtaXNzIG91dCBvbiBzb21ldGhpbmcuIEFGQUlDUyBjaGFuZ2VzIHdpbGwganVzdCBwaWxl
IHVwIGluID5kaXJ0eV9jbGlwCj4+Pj4gYW5kIHRoZSB3b3JrZXIgd2lsbCBiZSBzY2hlZHVsZWQg
Zm9yIGEgbmV3IHJ1biB0byBoYXBwZW4gd2hlbiBpdCdzIGRvbmUKPj4+PiB3aXRoIHRoZSBjdXJy
ZW50IHVwZGF0ZS4KPj4+Cj4+PiBZZXMsIHRoYXQncyB0aGUgaW50ZW50aW9uIG9mIHRoZSBwYXRj
aC4gV2UgaG9wZSB0byByZWR1Y2UgdGhlIG51bWJlciBvZgo+Pj4gbWVtY3B5cyBieSBoYW5kbGlu
ZyBzZXZlcmFsIG9mIHRoZW0gYXQgb25jZS4KPj4+Cj4+PiBCZXN0IHJlZ2FyZHMKPj4+IFRob21h
cwo+Pj4KPj4+Pgo+Pj4+IE5vcmFsZi4KPj4+Pgo+Pj4+PiBCZXN0IHJlZ2FyZHMKPj4+Pj4gVGhv
bWFzCj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4gY2hlZXJzLAo+Pj4+Pj4gICBHZXJkCj4+Pj4+Pgo+Pj4+
Pgo+Pj4KPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
