Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 594D38E145
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 01:35:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C0FF6E871;
	Wed, 14 Aug 2019 23:35:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB4486E871;
 Wed, 14 Aug 2019 23:34:59 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d549aa50001>; Wed, 14 Aug 2019 16:35:01 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Wed, 14 Aug 2019 16:34:59 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Wed, 14 Aug 2019 16:34:59 -0700
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 14 Aug
 2019 23:34:58 +0000
Subject: Re: [PATCH 1/5] mm: Check if mmu notifier callbacks are allowed to
 fail
To: Andrew Morton <akpm@linux-foundation.org>, Daniel Vetter
 <daniel.vetter@ffwll.ch>
References: <20190814202027.18735-1-daniel.vetter@ffwll.ch>
 <20190814202027.18735-2-daniel.vetter@ffwll.ch>
 <20190814151447.e9ab74f4c7ed4297e39321d1@linux-foundation.org>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <e917a6f3-463b-0abf-66b7-d4934dbb3af9@nvidia.com>
Date: Wed, 14 Aug 2019 16:34:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190814151447.e9ab74f4c7ed4297e39321d1@linux-foundation.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1565825701; bh=e+e/OQAXN7GkasI6yC/EXJqM8IXP7fwTmNiXqJvaCJE=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=JVminWy3F1xcDKxguw/IFHSOu8yhmVpbFza3GaG0mcfwG4ZfLiV+j+Y1GInVll+lG
 zOHBACB2xataDHAY+fhoLTpXwvhpiAh8BOZRzHl8PQNjmb9XVXAJ6UhqcfmUWMkc1H
 s74P3+VufRz//nqshg6mlRajAdOp+1vAhWQ3HkNiMU08Pq4yh431tX72STl+3t5R08
 2P0QHNrM//MIYUOmV/X/lEbCQgf8fXWN/WgAQy4ub4cbO3X3SQd3OPEX37pSR74BaI
 4AAwMUxOrZgCYLjOGKv8LKXCsKj6qQpYdOhjKvEkLAoCFplAqwo5b1MAIqg/BjouNM
 h3xNFgkHpm/EA==
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
Cc: Michal Hocko <mhocko@suse.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-mm@kvack.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 David Rientjes <rientjes@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDgvMTQvMTkgMzoxNCBQTSwgQW5kcmV3IE1vcnRvbiB3cm90ZToKPiBPbiBXZWQsIDE0IEF1
ZyAyMDE5IDIyOjIwOjIzICswMjAwIERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwu
Y2g+IHdyb3RlOgo+IAo+PiBKdXN0IGEgYml0IG9mIHBhcmFub2lhLCBzaW5jZSBpZiB3ZSBzdGFy
dCBwdXNoaW5nIHRoaXMgZGVlcCBpbnRvCj4+IGNhbGxjaGFpbnMgaXQncyBoYXJkIHRvIHNwb3Qg
YWxsIHBsYWNlcyB3aGVyZSBhbiBtbXUgbm90aWZpZXIKPj4gaW1wbGVtZW50YXRpb24gbWlnaHQg
ZmFpbCB3aGVuIGl0J3Mgbm90IGFsbG93ZWQgdG8uCj4+Cj4+IEluc3BpcmVkIGJ5IHNvbWUgY29u
ZnVzaW9uIHdlIGhhZCBkaXNjdXNzaW5nIGk5MTUgbW11IG5vdGlmaWVycyBhbmQKPj4gd2hldGhl
ciB3ZSBjb3VsZCB1c2UgdGhlIG5ld2x5LWludHJvZHVjZWQgcmV0dXJuIHZhbHVlIHRvIGhhbmRs
ZSBzb21lCj4+IGNvcm5lciBjYXNlcy4gVW50aWwgd2UgcmVhbGl6ZWQgdGhhdCB0aGVzZSBhcmUg
b25seSBmb3Igd2hlbiBhIHRhc2sKPj4gaGFzIGJlZW4ga2lsbGVkIGJ5IHRoZSBvb20gcmVhcGVy
Lgo+Pgo+PiBBbiBhbHRlcm5hdGl2ZSBhcHByb2FjaCB3b3VsZCBiZSB0byBzcGxpdCB0aGUgY2Fs
bGJhY2sgaW50byB0d28KPj4gdmVyc2lvbnMsIG9uZSB3aXRoIHRoZSBpbnQgcmV0dXJuIHZhbHVl
LCBhbmQgdGhlIG90aGVyIHdpdGggdm9pZAo+PiByZXR1cm4gdmFsdWUgbGlrZSBpbiBvbGRlciBr
ZXJuZWxzLiBCdXQgdGhhdCdzIGEgbG90IG1vcmUgY2h1cm4gZm9yCj4+IGZhaXJseSBsaXR0bGUg
Z2FpbiBJIHRoaW5rLgo+Pgo+PiBTdW1tYXJ5IGZyb20gdGhlIG0tbCBkaXNjdXNzaW9uIG9uIHdo
eSB3ZSB3YW50IHNvbWV0aGluZyBhdCB3YXJuaW5nCj4+IGxldmVsOiBUaGlzIGFsbG93cyBhdXRv
bWF0ZWQgdG9vbGluZyBpbiBDSSB0byBjYXRjaCBidWdzIHdpdGhvdXQKPj4gaHVtYW5zIGhhdmlu
ZyB0byBsb29rIGF0IGV2ZXJ5dGhpbmcuIElmIHdlIGp1c3QgdXBncmFkZSB0aGUgZXhpc3RpbmcK
Pj4gcHJfaW5mbyB0byBhIHByX3dhcm4sIHRoZW4gd2UnbGwgaGF2ZSBmYWxzZSBwb3NpdGl2ZXMu
IEFuZCBhcy1pcywgbm8KPj4gb25lIHdpbGwgZXZlciBzcG90IHRoZSBwcm9ibGVtIHNpbmNlIGl0
J3MgbG9zdCBpbiB0aGUgbWFzc2l2ZSBhbW91bnRzCj4+IG9mIG92ZXJhbGwgZG1lc2cgbm9pc2Uu
Cj4+Cj4+IC4uLgo+Pgo+PiAtLS0gYS9tbS9tbXVfbm90aWZpZXIuYwo+PiArKysgYi9tbS9tbXVf
bm90aWZpZXIuYwo+PiBAQCAtMTc5LDYgKzE3OSw4IEBAIGludCBfX21tdV9ub3RpZmllcl9pbnZh
bGlkYXRlX3JhbmdlX3N0YXJ0KHN0cnVjdCBtbXVfbm90aWZpZXJfcmFuZ2UgKnJhbmdlKQo+PiAg
IAkJCQlwcl9pbmZvKCIlcFMgY2FsbGJhY2sgZmFpbGVkIHdpdGggJWQgaW4gJXNibG9ja2FibGUg
Y29udGV4dC5cbiIsCj4+ICAgCQkJCQltbi0+b3BzLT5pbnZhbGlkYXRlX3JhbmdlX3N0YXJ0LCBf
cmV0LAo+PiAgIAkJCQkJIW1tdV9ub3RpZmllcl9yYW5nZV9ibG9ja2FibGUocmFuZ2UpID8gIm5v
bi0iIDogIiIpOwo+PiArCQkJCVdBUk5fT04obW11X25vdGlmaWVyX3JhbmdlX2Jsb2NrYWJsZShy
YW5nZSkgfHwKPj4gKwkJCQkJcmV0ICE9IC1FQUdBSU4pOwo+PiAgIAkJCQlyZXQgPSBfcmV0Owo+
PiAgIAkJCX0KPj4gICAJCX0KPiAKPiBBIHByb2JsZW0gd2l0aCBXQVJOX09OKGEgfHwgYikgaXMg
dGhhdCBpZiBpdCB0cmlnZ2Vycywgd2UgZG9uJ3Qga25vdwo+IHdoZXRoZXIgaXQgd2FzIGJlY2F1
c2Ugb2YgYSBvciBiZWNhdXNlIG9mIGIuICBPciBib3RoLiAgU28gSSdkIHN1Z2dlc3QKPiAKPiAJ
V0FSTl9PTihhKTsKPiAJV0FSTl9PTihiKTsKPiAKClRoaXMgd29uJ3QgcXVpdGUgd29yay4gSXQg
aXMgT0sgdG8gaGF2ZSAKbW11X25vdGlmaWVyX3JhbmdlX2Jsb2NrYWJsZShyYW5nZSkgYmUgdHJ1
ZSBvciBmYWxzZS4Kc3luY19jcHVfZGV2aWNlX3BhZ2V0YWJsZXMoKSBzaG91bGRuJ3QgcmV0dXJu
Ci1FQUdBSU4gdW5sZXNzIGJsb2NrYWJsZSBpcyB0cnVlLgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
