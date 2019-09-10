Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8F0AEBA5
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 15:34:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F8B76E0C8;
	Tue, 10 Sep 2019 13:34:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D8BE6E0C8
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2019 13:34:07 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:59433
 helo=[192.168.10.177])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <noralf@tronnes.org>)
 id 1i7gHV-0000yk-51; Tue, 10 Sep 2019 15:34:05 +0200
Subject: Re: [PATCH 1/2] drm/fb-helper: Synchronize dirty worker with vblank
To: Thomas Zimmermann <tzimmermann@suse.de>, Gerd Hoffmann <kraxel@redhat.com>
References: <20190909140633.31260-1-tzimmermann@suse.de>
 <20190909140633.31260-2-tzimmermann@suse.de>
 <20190910115205.tc3oy2dtypwfrf22@sirius.home.kraxel.org>
 <52e8e124-f8e6-d2e6-0102-472b9fa70317@suse.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <1223403a-17a5-638b-49ce-5dba23fe23d5@tronnes.org>
Date: Tue, 10 Sep 2019 15:34:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <52e8e124-f8e6-d2e6-0102-472b9fa70317@suse.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org
 ; s=ds201810; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MZXa1fwpw50t2ttfH69jWSYnNCjEv0KP+m1H0AggckM=; b=cRI2Rgo5Xm9jPTGxU0EAJYKAMD
 S7x4HPaCMrMXewGR+DFjeB17uC016E455EnzLWW0G4Toa5Z1alw9S6SGTngYnNRypzp9/Ogyo6ESI
 yK3b1gsS7rVGdooh/KthEXTutEdt5RzNKZbPmb76Q4tOIP6c5W8iUUHE6QumSx8dEOKhj1ZkSghoU
 kEigY7v9ePwj8+hxqVYzBEDusxjxw2Wa68mL1mCeK6vk7zSbVbI+aKMd8/gkMxJmAS0ZKV2/g8iXR
 oKQGLbUzbBeKhTCmp/iMoTU4CAY9rdDQICRuY6ojIuSdHjgbW0+lio9juIMGkUiaSRAwInk4usVA3
 SaoNGcFg==;
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

CgpEZW4gMTAuMDkuMjAxOSAxNC40OCwgc2tyZXYgVGhvbWFzIFppbW1lcm1hbm46Cj4gSGkKPiAK
PiBBbSAxMC4wOS4xOSB1bSAxMzo1MiBzY2hyaWViIEdlcmQgSG9mZm1hbm46Cj4+IE9uIE1vbiwg
U2VwIDA5LCAyMDE5IGF0IDA0OjA2OjMyUE0gKzAyMDAsIFRob21hcyBaaW1tZXJtYW5uIHdyb3Rl
Ogo+Pj4gQmVmb3JlIHVwZGF0aW5nIHRoZSBkaXNwbGF5IGZyb20gdGhlIGNvbnNvbGUncyBzaGFk
b3cgYnVmZmVyLCB0aGUgZGlydHkKPj4+IHdvcmtlciBub3cgd2FpdHMgZm9yIHZibGFuay4gVGhp
cyBhbGxvd3Mgc2V2ZXJhbCBzY3JlZW4gdXBkYXRlcyB0byBwaWxlCj4+PiB1cCBhbmQgYWN0cyBh
cyBhIHJhdGUgbGltaXRlci4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFu
biA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KPj4+IC0tLQo+Pj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1f
ZmJfaGVscGVyLmMgfCAxMiArKysrKysrKysrKysKPj4+ICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5z
ZXJ0aW9ucygrKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hl
bHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYwo+Pj4gaW5kZXggYTdiYTVi
NDkwMmQ2Li4wMTdlMmY2YmQxYjkgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X2ZiX2hlbHBlci5jCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jCj4+
PiBAQCAtNDAyLDggKzQwMiwyMCBAQCBzdGF0aWMgdm9pZCBkcm1fZmJfaGVscGVyX2RpcnR5X3dv
cmsoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQo+Pj4gIAkJCQkJCSAgICBkaXJ0eV93b3JrKTsK
Pj4+ICAJc3RydWN0IGRybV9jbGlwX3JlY3QgKmNsaXAgPSAmaGVscGVyLT5kaXJ0eV9jbGlwOwo+
Pj4gIAlzdHJ1Y3QgZHJtX2NsaXBfcmVjdCBjbGlwX2NvcHk7Cj4+PiArCXN0cnVjdCBkcm1fY3J0
YyAqY3J0YzsKPj4+ICAJdW5zaWduZWQgbG9uZyBmbGFnczsKPj4+ICAJdm9pZCAqdmFkZHI7Cj4+
PiArCWludCByZXQ7Cj4+PiArCj4+PiArCS8qIHJhdGUtbGltaXQgdXBkYXRlIGZyZXF1ZW5jeSAq
Lwo+Pj4gKwltdXRleF9sb2NrKCZoZWxwZXItPmxvY2spOwo+Pj4gKwljcnRjID0gaGVscGVyLT5j
bGllbnQubW9kZXNldHNbMF0uY3J0YzsKPj4+ICsJcmV0ID0gZHJtX2NydGNfdmJsYW5rX2dldChj
cnRjKTsKPj4+ICsJaWYgKCFyZXQpIHsKPj4+ICsJCWRybV9jcnRjX3dhaXRfb25lX3ZibGFuayhj
cnRjKTsKPj4+ICsJCWRybV9jcnRjX3ZibGFua19wdXQoY3J0Yyk7Cj4+PiArCX0KPj4+ICsJbXV0
ZXhfdW5sb2NrKCZoZWxwZXItPmxvY2spOwo+Pgo+PiBIbW0sIG5vdCBzdXJlIGl0IGlzIHRoZSBi
ZXN0IHBsYW4gdG8gc2xlZXAgZm9yIGEgd2hpbGUgaW4gdGhlIHdvcmtlciwKPj4gZXNwZWNpYWxs
eSB3aGlsZSBob2xkaW5nIHRoZSBsb2NrLgo+Pgo+PiBXaGF0IGRvZXMgdGhlIGxvY2sgcHJvdGVj
dCBhZ2FpbnN0IGhlcmU/ICBBY2Nlc3NpbmcKPiAKPiBUaGlzIGxvY2sgaXMgaG9sZCBieSB0aGUg
ZmJkZXYgY29kZSBkdXJpbmcgbW9kZS1zZXR0aW5nIG9wZXJhdGlvbnMgKGJ1dAo+IG5vdCBkcmF3
aW5nIG9wZXJhdGlvbnMpLiBTbyAqY3J0YyBtaWdodCBiZSBnb25lIGlmIHdlIGRvbid0IGhvbGQg
aXQgaGVyZS4KPiAKPj4gaGVscGVyLT5jbGllbnQubW9kZXNldHM/ICBJZiBzbyB0aGVuIHlvdSBj
YW4gdW5sb2NrIGJlZm9yZSBnb2luZyB0bwo+PiBzbGVlcCBpbiBkcm1fY3J0Y193YWl0X29uZV92
YmxhbmsoKSBJIHRoaW5rLgo+IAo+IEkgbG9va2VkLCBidXQgSSBjYW5ub3QgZmluZCBhbnkgY29k
ZSB0aGF0IHByb3RlY3RzIGNydGMgd2hpbGUgdmJsYW5rIGlzCj4gYWN0aXZlLiBJJ2QgcmF0aGVy
IG5vdCBjaGFuZ2UgdGhlIGN1cnJlbnQgY29kZSB1bnRpbCBzb21lb25lIGNhbiBjbGFyaWZ5Lgo+
IAoKVGhlIGNsaWVudC0+bW9kZXNldHMgYXJyYXkgYW5kIHRoZSBjcnRjIHN0cnVjdCBtZW1iZXIg
YXJlIGludmFyaWFudCBvdmVyCnRoZSBsaWZldGltZSBvZiBjbGllbnQgKGRybV9jbGllbnRfbW9k
ZXNldF9jcmVhdGUoKSkuIE5vIG5lZWQgdG8gdGFrZSBhCmxvY2sgZm9yIGFjY2Vzcy4gU2VlIGRy
bV9jbGllbnRfbW9kZXNldF9yZWxlYXNlKCkgZm9yIHRoZSB0aGluZ3MgdGhhdApfY2FuXyBjaGFu
Z2UgYW5kIG5lZWRzIHByb3RlY3Rpb24gKHByb3RlY3RlZCBieSBjbGllbnQtPm1vZGVzZXRfbXV0
ZXgpLgoKSSBkb24ndCBzZWUgYSBwcm9ibGVtIHdpdGggc2xlZXBpbmcgaW4gdGhlIHdvcmtlciB0
aG91Z2gsIGJ1dCBJIG1pZ2h0Cm1pc3Mgb3V0IG9uIHNvbWV0aGluZy4gQUZBSUNTIGNoYW5nZXMg
d2lsbCBqdXN0IHBpbGUgdXAgaW4gPmRpcnR5X2NsaXAKYW5kIHRoZSB3b3JrZXIgd2lsbCBiZSBz
Y2hlZHVsZWQgZm9yIGEgbmV3IHJ1biB0byBoYXBwZW4gd2hlbiBpdCdzIGRvbmUKd2l0aCB0aGUg
Y3VycmVudCB1cGRhdGUuCgpOb3JhbGYuCgo+IEJlc3QgcmVnYXJkcwo+IFRob21hcwo+IAo+Pgo+
PiBjaGVlcnMsCj4+ICAgR2VyZAo+Pgo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
