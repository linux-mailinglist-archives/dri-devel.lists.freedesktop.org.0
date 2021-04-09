Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB2E359C87
	for <lists+dri-devel@lfdr.de>; Fri,  9 Apr 2021 13:00:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CF6B6E491;
	Fri,  9 Apr 2021 11:00:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18CD66E491
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Apr 2021 11:00:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9B536B147;
 Fri,  9 Apr 2021 11:00:22 +0000 (UTC)
Subject: Re: [PATCH 1/2] mm/vmscan: add sync_shrinkers function
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <20210409071725.1532-1-christian.koenig@amd.com>
From: Vlastimil Babka <vbabka@suse.cz>
Message-ID: <462c2a51-4aa8-47ba-1c67-171ca651b016@suse.cz>
Date: Fri, 9 Apr 2021 13:00:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210409071725.1532-1-christian.koenig@amd.com>
Content-Language: en-US
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
Cc: akpm@linux-foundation.org, ray.huang@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNC85LzIxIDk6MTcgQU0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gVG8gYmUgYWJsZSB0
byBzd2l0Y2ggdG8gYSBzcGlubG9jayBhbmQgcmVkdWNlIGxvY2sgY29udGVudGlvbiBpbiB0aGUg
VFRNCj4gc2hyaW5rZXIgd2UgZG9uJ3Qgd2FudCB0byBob2xkIGEgbXV0ZXggd2hpbGUgdW5tYXBw
aW5nIGFuZCBmcmVlaW5nIHBhZ2VzCj4gZnJvbSB0aGUgcG9vbC4KCkRvZXMgdXNpbmcgc3Bpbmxv
Y2sgaW5zdGVhZCBvZiBtdXRleCByZWFsbHkgcmVkdWNlIGxvY2sgY29udGVudGlvbj8KCj4gQnV0
IHRoZW4gd2Ugc29tZWhvdyBuZWVkIHRvIHByZXZlbnQgYSByYWNlIGJldHdlZW4gKGZvciBleGFt
cGxlKSB0aGUgc2hyaW5rZXIKPiB0cnlpbmcgdG8gZnJlZSBwYWdlcyBhbmQgaG90cGx1ZyB0cnlp
bmcgdG8gcmVtb3ZlIHRoZSBkZXZpY2Ugd2hpY2ggdGhvc2UgcGFnZXMKPiBiZWxvbmcgdG8uCj4g
Cj4gVGFraW5nIGFuZCByZWxlYXNpbmcgdGhlIHNocmlua2VyIHNlbWFwaG9yZSBvbiB0aGUgd3Jp
dGUgc2lkZSBhZnRlcgo+IHVubWFwcGluZyBhbmQgZnJlZWluZyBhbGwgcGFnZXMgc2hvdWxkIG1h
a2Ugc3VyZSB0aGF0IG5vIHNocmlua2VyIGlzIHJ1bm5pbmcgaW4KPiBwYXJhbGVsbCBhbnkgbW9y
ZS4KClNvIHlvdSBleHBsYWluIHRoaXMgaW4gdGhpcyBjb21taXQgbG9nIGZvciBhZGRpbmcgdGhl
IGZ1bmN0aW9uLCBidXQgdGhlbiB0aGUKbmV4dCBwYXRjaCBqdXN0IGFkZHMgYSBzeW5jX3Nocmlu
a2VycygpIGNhbGwgd2l0aG91dCBhbnkgY29tbWVudC4gSSB3b3VsZCBleHBlY3QKdGhlcmUgYSBj
b21tZW50IGV4cGxhaW5pbmcgd2h5IGl0J3MgZG9uZSB0aGVyZSAtIHdoYXQgaXQgcHJvdGVjdHMg
YWdhaW5zdCwgYXMKaXQncyBub3QgYW4gb2J2aW91cyBwYXR0ZXJuIElNSE8uCgo+IFNpZ25lZC1v
ZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiAtLS0K
PiAgaW5jbHVkZS9saW51eC9zaHJpbmtlci5oIHwgIDEgKwo+ICBtbS92bXNjYW4uYyAgICAgICAg
ICAgICAgfCAxMCArKysrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygr
KQo+IAo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3Nocmlua2VyLmggYi9pbmNsdWRlL2xp
bnV4L3Nocmlua2VyLmgKPiBpbmRleCAwZjgwMTIzNjUwZTIuLjZiNzVkYzM3MmZjZSAxMDA2NDQK
PiAtLS0gYS9pbmNsdWRlL2xpbnV4L3Nocmlua2VyLmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L3No
cmlua2VyLmgKPiBAQCAtOTIsNCArOTIsNSBAQCBleHRlcm4gdm9pZCByZWdpc3Rlcl9zaHJpbmtl
cl9wcmVwYXJlZChzdHJ1Y3Qgc2hyaW5rZXIgKnNocmlua2VyKTsKPiAgZXh0ZXJuIGludCByZWdp
c3Rlcl9zaHJpbmtlcihzdHJ1Y3Qgc2hyaW5rZXIgKnNocmlua2VyKTsKPiAgZXh0ZXJuIHZvaWQg
dW5yZWdpc3Rlcl9zaHJpbmtlcihzdHJ1Y3Qgc2hyaW5rZXIgKnNocmlua2VyKTsKPiAgZXh0ZXJu
IHZvaWQgZnJlZV9wcmVhbGxvY2VkX3Nocmlua2VyKHN0cnVjdCBzaHJpbmtlciAqc2hyaW5rZXIp
Owo+ICtleHRlcm4gdm9pZCBzeW5jX3Nocmlua2Vycyh2b2lkKTsKPiAgI2VuZGlmCj4gZGlmZiAt
LWdpdCBhL21tL3Ztc2Nhbi5jIGIvbW0vdm1zY2FuLmMKPiBpbmRleCA1NjJlODdjYmQ3YTEuLjQ2
Y2Q5YzIxNWQ3MyAxMDA2NDQKPiAtLS0gYS9tbS92bXNjYW4uYwo+ICsrKyBiL21tL3Ztc2Nhbi5j
Cj4gQEAgLTQwOCw2ICs0MDgsMTYgQEAgdm9pZCB1bnJlZ2lzdGVyX3Nocmlua2VyKHN0cnVjdCBz
aHJpbmtlciAqc2hyaW5rZXIpCj4gIH0KPiAgRVhQT1JUX1NZTUJPTCh1bnJlZ2lzdGVyX3Nocmlu
a2VyKTsKPiAgCj4gKy8qKgo+ICsgKiBzeW5jX3Nocmlua2VyIC0gV2FpdCBmb3IgYWxsIHJ1bm5p
bmcgc2hyaW5rZXJzIHRvIGNvbXBsZXRlLgo+ICsgKi8KPiArdm9pZCBzeW5jX3Nocmlua2Vycyh2
b2lkKQo+ICt7Cj4gKwlkb3duX3dyaXRlKCZzaHJpbmtlcl9yd3NlbSk7Cj4gKwl1cF93cml0ZSgm
c2hyaW5rZXJfcndzZW0pOwo+ICt9Cj4gK0VYUE9SVF9TWU1CT0woc3luY19zaHJpbmtlcnMpOwo+
ICsKPiAgI2RlZmluZSBTSFJJTktfQkFUQ0ggMTI4Cj4gIAo+ICBzdGF0aWMgdW5zaWduZWQgbG9u
ZyBkb19zaHJpbmtfc2xhYihzdHJ1Y3Qgc2hyaW5rX2NvbnRyb2wgKnNocmlua2N0bCwKPiAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
