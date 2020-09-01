Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A46E02591B5
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 16:54:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5D306E448;
	Tue,  1 Sep 2020 14:54:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDCAC6E448
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 14:54:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D50A6ACC3;
 Tue,  1 Sep 2020 14:54:41 +0000 (UTC)
Subject: Re: [PATCH v5 3/3] xen: add helpers to allocate unpopulated memory
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 linux-kernel@vger.kernel.org
References: <20200901083326.21264-1-roger.pau@citrix.com>
 <20200901083326.21264-4-roger.pau@citrix.com>
 <20200901144539.GI753@Air-de-Roger>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <4b24c8c3-fb0f-23ad-09c5-81fcfdb6a2b5@suse.com>
Date: Tue, 1 Sep 2020 16:54:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200901144539.GI753@Air-de-Roger>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 David Airlie <airlied@linux.ie>, Yan Yankovskyi <yyankovskyi@gmail.com>,
 David Hildenbrand <david@redhat.com>, dri-devel@lists.freedesktop.org,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDEuMDkuMjAgMTY6NDUsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gT24gVHVlLCBTZXAg
MDEsIDIwMjAgYXQgMTA6MzM6MjZBTSArMDIwMCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+PiAr
c3RhdGljIGludCBmaWxsX2xpc3QodW5zaWduZWQgaW50IG5yX3BhZ2VzKQo+PiArewo+PiArCXN0
cnVjdCBkZXZfcGFnZW1hcCAqcGdtYXA7Cj4+ICsJdm9pZCAqdmFkZHI7Cj4+ICsJdW5zaWduZWQg
aW50IGksIGFsbG9jX3BhZ2VzID0gcm91bmRfdXAobnJfcGFnZXMsIFBBR0VTX1BFUl9TRUNUSU9O
KTsKPj4gKwlpbnQgbmlkLCByZXQ7Cj4+ICsKPj4gKwlwZ21hcCA9IGt6YWxsb2Moc2l6ZW9mKCpw
Z21hcCksIEdGUF9LRVJORUwpOwo+PiArCWlmICghcGdtYXApCj4+ICsJCXJldHVybiAtRU5PTUVN
Owo+PiArCj4+ICsJcGdtYXAtPnR5cGUgPSBNRU1PUllfREVWSUNFX0dFTkVSSUM7Cj4+ICsJcGdt
YXAtPnJlcy5uYW1lID0gIlhlbiBzY3JhdGNoIjsKPj4gKwlwZ21hcC0+cmVzLmZsYWdzID0gSU9S
RVNPVVJDRV9NRU0gfCBJT1JFU09VUkNFX0JVU1k7Cj4+ICsKPj4gKwlyZXQgPSBhbGxvY2F0ZV9y
ZXNvdXJjZSgmaW9tZW1fcmVzb3VyY2UsICZwZ21hcC0+cmVzLAo+PiArCQkJCWFsbG9jX3BhZ2Vz
ICogUEFHRV9TSVpFLCAwLCAtMSwKPj4gKwkJCQlQQUdFU19QRVJfU0VDVElPTiAqIFBBR0VfU0la
RSwgTlVMTCwgTlVMTCk7Cj4+ICsJaWYgKHJldCA8IDApIHsKPj4gKwkJcHJfZXJyKCJDYW5ub3Qg
YWxsb2NhdGUgbmV3IElPTUVNIHJlc291cmNlXG4iKTsKPj4gKwkJa2ZyZWUocGdtYXApOwo+PiAr
CQlyZXR1cm4gcmV0Owo+PiArCX0KPj4gKwo+PiArCW5pZCA9IG1lbW9yeV9hZGRfcGh5c2FkZHJf
dG9fbmlkKHBnbWFwLT5yZXMuc3RhcnQpOwo+IAo+IEkgdGhpbmsgdGhpcyBpcyBub3QgbmVlZGVk
IC4uLgo+IAo+PiArCj4+ICsjaWZkZWYgQ09ORklHX1hFTl9IQVZFX1BWTU1VCj4+ICsgICAgICAg
IC8qCj4+ICsgICAgICAgICAqIG1lbXJlbWFwIHdpbGwgYnVpbGQgcGFnZSB0YWJsZXMgZm9yIHRo
ZSBuZXcgbWVtb3J5IHNvCj4+ICsgICAgICAgICAqIHRoZSBwMm0gbXVzdCBjb250YWluIGludmFs
aWQgZW50cmllcyBzbyB0aGUgY29ycmVjdAo+PiArICAgICAgICAgKiBub24tcHJlc2VudCBQVEVz
IHdpbGwgYmUgd3JpdHRlbi4KPj4gKyAgICAgICAgICoKPj4gKyAgICAgICAgICogSWYgYSBmYWls
dXJlIG9jY3VycywgdGhlIG9yaWdpbmFsIChpZGVudGl0eSkgcDJtIGVudHJpZXMKPj4gKyAgICAg
ICAgICogYXJlIG5vdCByZXN0b3JlZCBzaW5jZSB0aGlzIHJlZ2lvbiBpcyBub3cga25vd24gbm90
IHRvCj4+ICsgICAgICAgICAqIGNvbmZsaWN0IHdpdGggYW55IGRldmljZXMuCj4+ICsgICAgICAg
ICAqLwo+PiArCWlmICgheGVuX2ZlYXR1cmUoWEVORkVBVF9hdXRvX3RyYW5zbGF0ZWRfcGh5c21h
cCkpIHsKPj4gKwkJeGVuX3Bmbl90IHBmbiA9IFBGTl9ET1dOKHBnbWFwLT5yZXMuc3RhcnQpOwo+
PiArCj4+ICsJCWZvciAoaSA9IDA7IGkgPCBhbGxvY19wYWdlczsgaSsrKSB7Cj4+ICsJCQlpZiAo
IXNldF9waHlzX3RvX21hY2hpbmUocGZuICsgaSwgSU5WQUxJRF9QMk1fRU5UUlkpKSB7Cj4+ICsJ
CQkJcHJfd2Fybigic2V0X3BoeXNfdG9fbWFjaGluZSgpIGZhaWxlZCwgbm8gbWVtb3J5IGFkZGVk
XG4iKTsKPj4gKwkJCQlyZWxlYXNlX3Jlc291cmNlKCZwZ21hcC0+cmVzKTsKPj4gKwkJCQlrZnJl
ZShwZ21hcCk7Cj4+ICsJCQkJcmV0dXJuIC1FTk9NRU07Cj4+ICsJCQl9Cj4+ICsgICAgICAgICAg
ICAgICAgfQo+PiArCX0KPj4gKyNlbmRpZgo+PiArCj4+ICsJdmFkZHIgPSBtZW1yZW1hcF9wYWdl
cyhwZ21hcCwgbmlkKTsKPiAKPiAuLi4gYW5kIE5VTUFfTk9fTk9ERSBzaG91bGQgYmUgdXNlZCBo
ZXJlIGluc3RlYWQsIGFzIHRoaXMgbWVtb3J5IGlzIGp1c3QKPiBmaWN0aXRpb3VzIHNwYWNlIHRv
IG1hcCBmb3JlaWduIG1lbW9yeSwgYW5kIHNob3VsZG4ndCBiZSByZWxhdGVkIHRvCj4gYW55IE5V
TUEgbm9kZS4KPiAKPiBUaGUgZm9sbG93aW5nIGNodW5rIHNob3VsZCBiZSBmb2xkZWQgaW4sIG9y
IEkgY2FuIHJlc2VuZC4KCkkgY2FuIGZvbGQgaXQgaW4uCgoKSnVlcmdlbgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
