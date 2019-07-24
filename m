Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1ABC73634
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 19:59:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 139426E60E;
	Wed, 24 Jul 2019 17:59:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C85EA6E60E;
 Wed, 24 Jul 2019 17:59:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4FF3CABD9;
 Wed, 24 Jul 2019 17:58:59 +0000 (UTC)
Date: Wed, 24 Jul 2019 19:58:58 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH] mm/hmm: replace hmm_update with mmu_notifier_range
Message-ID: <20190724175858.GC6410@dhcp22.suse.cz>
References: <20190723210506.25127-1-rcampbell@nvidia.com>
 <20190724070553.GA2523@lst.de> <20190724152858.GB28493@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190724152858.GB28493@ziepe.ca>
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkIDI0LTA3LTE5IDEyOjI4OjU4LCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gT24gV2Vk
LCBKdWwgMjQsIDIwMTkgYXQgMDk6MDU6NTNBTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3aWcgd3Jv
dGU6Cj4gPiBMb29rcyBnb29kOgo+ID4gCj4gPiBSZXZpZXdlZC1ieTogQ2hyaXN0b3BoIEhlbGx3
aWcgPGhjaEBsc3QuZGU+Cj4gPiAKPiA+IE9uZSBjb21tZW50IG9uIGEgcmVsYXRlZCBjbGVhbnVw
Ogo+ID4gCj4gPiA+ICAJbGlzdF9mb3JfZWFjaF9lbnRyeShtaXJyb3IsICZobW0tPm1pcnJvcnMs
IGxpc3QpIHsKPiA+ID4gIAkJaW50IHJjOwo+ID4gPiAgCj4gPiA+IC0JCXJjID0gbWlycm9yLT5v
cHMtPnN5bmNfY3B1X2RldmljZV9wYWdldGFibGVzKG1pcnJvciwgJnVwZGF0ZSk7Cj4gPiA+ICsJ
CXJjID0gbWlycm9yLT5vcHMtPnN5bmNfY3B1X2RldmljZV9wYWdldGFibGVzKG1pcnJvciwgbnJh
bmdlKTsKPiA+ID4gIAkJaWYgKHJjKSB7Cj4gPiA+IC0JCQlpZiAoV0FSTl9PTih1cGRhdGUuYmxv
Y2thYmxlIHx8IHJjICE9IC1FQUdBSU4pKQo+ID4gPiArCQkJaWYgKFdBUk5fT04obW11X25vdGlm
aWVyX3JhbmdlX2Jsb2NrYWJsZShucmFuZ2UpIHx8Cj4gPiA+ICsJCQkgICAgcmMgIT0gLUVBR0FJ
TikpCj4gPiA+ICAJCQkJY29udGludWU7Cj4gPiA+ICAJCQlyZXQgPSAtRUFHQUlOOwo+ID4gPiAg
CQkJYnJlYWs7Cj4gPiAKPiA+IFRoaXMgbWFnaWMgaGFuZGxpbmcgb2YgZXJyb3Igc2VlbXMgb2Rk
LiAgSSB0aGluayB3ZSBzaG91bGQgbWVyZ2UgcmMgYW5kCj4gPiByZXQgaW50byBvbmUgdmFyaWFi
bGUgYW5kIGp1c3QgYnJlYWsgb3V0IGlmIGFueSBlcnJvciBoYXBwZW5zIGluc3RlYWQKPiA+IG9y
IGNsYWltaW5nIGluIHRoZSBjb21tZW50cyAtRUFHQUlOIGlzIHRoZSBvbmx5IHZhbGlkIGVycm9y
IGFuZCB0aGVuCj4gPiBpZ25vcmluZyBhbGwgb3RoZXJzIGhlcmUuCj4gCj4gVGhlIFdBUk5fT04g
aXMgZW5mb3JjaW5nIHRoZSBydWxlcyBhbHJlYWR5IGNvbW1lbnRlZCBuZWFyCj4gbW11dV9ub3Rp
Zmllcl9vcHMuaW52YWxpZGF0ZV9zdGFydCAtIHdlIGNvdWxkIGJyZWFrIG9yIGNvbnRpbnVlLCBp
dAo+IGRvZXNuJ3QgbXVjaCBtYXR0ZXIgaG93IHRvIHJlY292ZXIgZnJvbSBhIGJyb2tlbiBkcml2
ZXIsIGJ1dCBzaW5jZSB3ZQo+IGRpZCB0aGUgV0FSTl9PTiB0aGlzIHNob3VsZCBzYW5pdGl6ZSB0
aGUgcmV0IHRvIEVBR0FJTiBvciAwCj4gCj4gSHVtbS4gQWN0dWFsbHkgaGF2aW5nIGxvb2tlZCB0
aGlzIHNvbWUgbW9yZSwgSSB3b25kZXIgaWYgdGhpcyBpcyBhCj4gcHJvYmxlbToKPiAKPiBJIHNl
ZSBpbiBfX29vbV9yZWFwX3Rhc2tfbW0oKToKPiAKPiAJCQlpZiAobW11X25vdGlmaWVyX2ludmFs
aWRhdGVfcmFuZ2Vfc3RhcnRfbm9uYmxvY2soJnJhbmdlKSkgewo+IAkJCQl0bGJfZmluaXNoX21t
dSgmdGxiLCByYW5nZS5zdGFydCwgcmFuZ2UuZW5kKTsKPiAJCQkJcmV0ID0gZmFsc2U7Cj4gCQkJ
CWNvbnRpbnVlOwo+IAkJCX0KPiAJCQl1bm1hcF9wYWdlX3JhbmdlKCZ0bGIsIHZtYSwgcmFuZ2Uu
c3RhcnQsIHJhbmdlLmVuZCwgTlVMTCk7Cj4gCQkJbW11X25vdGlmaWVyX2ludmFsaWRhdGVfcmFu
Z2VfZW5kKCZyYW5nZSk7Cj4gCj4gV2hpY2ggbG9va3MgbGlrZSBpdCBjcmVhdGVzIGFuIHVuYmFs
YW5jZWQgc3RhcnQvZW5kIHBhaXJpbmcgaWYgYW55Cj4gc3RhcnQgcmV0dXJucyBFQUdBSU4/Cj4g
Cj4gVGhpcyBkb2VzIG5vdCBzZWVtIE9LLi4gTWFueSB1c2VycyByZXF1aXJlIHN0YXJ0L2VuZCB0
byBiZSBwYWlyZWQgdG8KPiBrZWVwIHRyYWNrIG9mIHRoZWlyIGludGVybmFsIGxvY2tpbmcuIEll
IGZvciBpbnN0YW5jZSBobW0gYnJlYWtzCj4gYmVjYXVzZSB0aGUgaG1tLT5ub3RpZmllcnMgY291
bnRlciBiZWNvbWVzIHVuYWJsZSB0byBnZXQgdG8gMC4KPiAKPiBCZWxvdyBpcyB0aGUgYmVzdCBp
ZGVhIEkndmUgaGFkIHNvIGZhci4uCj4gCj4gTWljaGFsLCB3aGF0IGRvIHlvdSB0aGluaz8KCklJ
UkMgd2UgaGF2ZSBkaXNjdXNzZWQgdGhpcyB3aXRoIEplcm9tZSBiYWNrIHRoZW4gd2hlbiBJJ3Zl
IGludHJvZHVjZWQKdGhpcyBjb2RlIGFuZCB1bmxlc3MgSSBtaXNyZW1lbWJlciBoZSBzYWlkIHRo
ZSBjdXJyZW50IGNvZGUgd2FzIE9LLgpNYXliZSBuZXcgdXNlcnMgaGF2ZSBzdGFydGVkIHJlbHlp
bmcgb24gYSBuZXcgc2VtYW50aWMgaW4gdGhlIG1lYW50aW1lLApiYWNrIHRoZW4sIG5vbmUgb2Yg
dGhlIG5vdGlmaWVyIGhhcyBldmVuIHN0YXJ0ZWQgYW55IGFjdGlvbiBpbiBibG9ja2luZwptb2Rl
IG9uIGEgRUFHQUlOIGJhaWxvdXQuIE1vc3Qgb2YgdGhlbSBzaW1wbHkgZGlkIHRyeWxvY2sgZWFy
bHkgaW4gdGhlCnByb2Nlc3MgYW5kIGJhaWxlZCBvdXQgc28gdGhlcmUgd2FzIG5vdGhpbmcgdG8g
ZG8gZm9yIHRoZSByYW5nZV9lbmQKY2FsbGJhY2suCgpIYXMgdGhpcyBjaGFuZ2VkPwotLSAKTWlj
aGFsIEhvY2tvClNVU0UgTGFicwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
