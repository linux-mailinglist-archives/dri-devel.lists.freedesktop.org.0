Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CEFA10AF85
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 13:25:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 986BF89BF5;
	Wed, 27 Nov 2019 12:25:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 598A089BF5
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 12:24:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 73B8E3F683;
 Wed, 27 Nov 2019 13:24:57 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EWrtG9W4vugB; Wed, 27 Nov 2019 13:24:55 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 691493F556;
 Wed, 27 Nov 2019 13:24:52 +0100 (CET)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 9FF2D360140;
 Wed, 27 Nov 2019 13:24:52 +0100 (CET)
Subject: Re: [RFC PATCH 4/7] drm/ttm: Support huge pagefaults
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-graphics-maintainer@vmware.com
References: <20191127083120.34611-1-thomas_os@shipmail.org>
 <20191127083120.34611-5-thomas_os@shipmail.org>
 <b7e21292-2967-b11c-a0b6-8b857c89f9df@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <83b83746-7d54-e56b-3753-0b29b01074a2@shipmail.org>
Date: Wed, 27 Nov 2019 13:24:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <b7e21292-2967-b11c-a0b6-8b857c89f9df@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1574857492; bh=G8kszZs1jtzCSQxM7XxfwjE4wxpMdv4dFcCTVfNkcPE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=qYP4CXBt+c2IMRKHRJkjJRGWfHNF/5SJN0EB9A4yORFOsXTA9iICXqdzjiZP/4lh/
 bZLDtjvtQuKbvC8qXX/XUmor9wnCMjOTrQgB6desRFuKm8tZVwTZRjGAxmLUZbxZTI
 66A3krVi3PNGQLEESuTGUy+BTQ6e45Ky/A+ZrFDU=
X-Mailman-Original-Authentication-Results: pio-pvt-msa2.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=qYP4CXBt; 
 dkim-atps=neutral
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, Michal Hocko <mhocko@suse.com>,
 Ralph Campbell <rcampbell@nvidia.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTEvMjcvMTkgMTA6MTIgQU0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gQW0gMjcuMTEu
MTkgdW0gMDk6MzEgc2NocmllYiBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJlKToKPj4gRnJvbTog
VGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgo+Pgo+PiBTdXBwb3J0IGh1
Z2UgKFBNRC1zaXplIGFuZCBQVUQtc2l6ZSkgcGFnZS10YWJsZSBlbnRyaWVzIGJ5IHByb3ZpZGlu
ZyBhCj4+IGh1Z2VfZmF1bHQoKSBjYWxsYmFjay4KPj4gV2Ugc3RpbGwgc3VwcG9ydCBwcml2YXRl
IG1hcHBpbmdzIGFuZCB3cml0ZS1ub3RpZnkgYnkgc3BsaXR0aW5nIHRoZSBodWdlCj4+IHBhZ2Ut
dGFibGUgZW50cmllcyBvbiB3cml0ZS1hY2Nlc3MuCj4+Cj4+IE5vdGUgdGhhdCBmb3IgaHVnZSBw
YWdlLWZhdWx0cyB0byBvY2N1ciwgZWl0aGVyIHRoZSBrZXJuZWwgbmVlZHMgdG8gYmUKPj4gY29t
cGlsZWQgd2l0aCB0cmFucy1odWdlLXBhZ2VzIGFsd2F5cyBlbmFibGVkLCBvciB0aGUga2VybmVs
IG5lZWRzIHRvIGJlCj4+IGNvbXBpbGVkIHdpdGggdHJhbnMtaHVnZS1wYWdlcyBlbmFibGVkIHVz
aW5nIG1hZHZpc2UsIGFuZCB0aGUgdXNlci1zcGFjZQo+PiBhcHAgbmVlZHMgdG8gY2FsbCBtYWR2
aXNlKCkgdG8gZW5hYmxlIHRyYW5zLWh1Z2UgcGFnZXMgb24gYSBwZXItbWFwcGluZwo+PiBiYXNp
cy4KPj4KPj4gRnVydGhlcm1vcmUgaHVnZSBwYWdlLWZhdWx0cyB3aWxsIG5vdCBvY2N1ciB1bmxl
c3MgYnVmZmVyIG9iamVjdHMgYW5kCj4+IHVzZXItc3BhY2UgYWRkcmVzc2VzIGFyZSBhbGlnbmVk
IG9uIGh1Z2UgcGFnZSBzaXplIGJvdW5kYXJpZXMuCj4+Cj4+IENjOiBBbmRyZXcgTW9ydG9uIDxh
a3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnPgo+PiBDYzogTWljaGFsIEhvY2tvIDxtaG9ja29Ac3Vz
ZS5jb20+Cj4+IENjOiAiTWF0dGhldyBXaWxjb3ggKE9yYWNsZSkiIDx3aWxseUBpbmZyYWRlYWQu
b3JnPgo+PiBDYzogIktpcmlsbCBBLiBTaHV0ZW1vdiIgPGtpcmlsbC5zaHV0ZW1vdkBsaW51eC5p
bnRlbC5jb20+Cj4+IENjOiBSYWxwaCBDYW1wYmVsbCA8cmNhbXBiZWxsQG52aWRpYS5jb20+Cj4+
IENjOiAiSsOpcsO0bWUgR2xpc3NlIiA8amdsaXNzZUByZWRoYXQuY29tPgo+PiBDYzogIkNocmlz
dGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6
IFRob21hcyBIZWxsc3Ryb20gPHRoZWxsc3Ryb21Adm13YXJlLmNvbT4KPj4gLS0tCj4+IMKgIGRy
aXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMgfCAxMzkgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKy0KPj4gwqAgaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19hcGkuaMKgwqDCoCB8wqDC
oCAzICstCj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgMTM4IGluc2VydGlvbnMoKyksIDQgZGVsZXRp
b25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192bS5j
IAo+PiBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMKPj4gaW5kZXggMjA5OGY4ZDRk
ZmM1Li44ZDYwODk4ODBlMzkgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRt
X2JvX3ZtLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYwo+PiBAQCAt
MTUwLDYgKzE1MCw4NCBAQCB2bV9mYXVsdF90IHR0bV9ib192bV9yZXNlcnZlKHN0cnVjdCAKPj4g
dHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+PiDCoCB9Cj4+IMKgIEVYUE9SVF9TWU1CT0wodHRtX2Jv
X3ZtX3Jlc2VydmUpOwo+PiDCoCArI2lmZGVmIENPTkZJR19UUkFOU1BBUkVOVF9IVUdFUEFHRQo+
PiArLyoqCj4+ICsgKiB0dG1fYm9fdm1faW5zZXJ0X2h1Z2UgLSBJbnNlcnQgYSBwZm4gZm9yIFBV
RCBvciBQTUQgZmF1bHRzCj4+ICsgKiBAdm1mOiBGYXVsdCBkYXRhCj4+ICsgKiBAYm86IFRoZSBi
dWZmZXIgb2JqZWN0Cj4+ICsgKiBAcGFnZV9vZmZzZXQ6IFBhZ2Ugb2Zmc2V0IGZyb20gYm8gc3Rh
cnQKPj4gKyAqIEBmYXVsdF9wYWdlX3NpemU6IFRoZSBzaXplIG9mIHRoZSBmYXVsdCBpbiBwYWdl
cy4KPj4gKyAqIEBwZ3Byb3Q6IFRoZSBwYWdlIHByb3RlY3Rpb25zLgo+PiArICogRG9lcyBhZGRp
dGlvbmFsIGNoZWNraW5nIHdoZXRoZXIgaXQncyBwb3NzaWJsZSB0byBpbnNlcnQgYSBQVUQgb3Ig
Cj4+IFBNRAo+PiArICogcGZuIGFuZCBwZXJmb3JtcyB0aGUgaW5zZXJ0aW9uLgo+PiArICoKPj4g
KyAqIFJldHVybjogVk1fRkFVTFRfTk9QQUdFIG9uIHN1Y2Nlc3NmdWwgaW5zZXJ0aW9uLCAKPj4g
Vk1fRkFVTFRfRkFMTEJBQ0sgaWYKPj4gKyAqIGEgaHVnZSBmYXVsdCB3YXMgbm90IHBvc3NpYmxl
LCBhbmQgYSBWTV9GQVVMVF9FUlJPUiBjb2RlIG90aGVyd2lzZS4KPj4gKyAqLwo+PiArc3RhdGlj
IHZtX2ZhdWx0X3QgdHRtX2JvX3ZtX2luc2VydF9odWdlKHN0cnVjdCB2bV9mYXVsdCAqdm1mLAo+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IHR0bV9idWZm
ZXJfb2JqZWN0ICpibywKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHBnb2ZmX3QgcGFnZV9vZmZzZXQsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBwZ29mZl90IGZhdWx0X3BhZ2Vfc2l6ZSwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHBncHJvdF90IHBncHJvdCkKPj4gK3sKPj4gK8KgwqDCoCBwZ29m
Zl90IGk7Cj4+ICvCoMKgwqAgdm1fZmF1bHRfdCByZXQ7Cj4+ICvCoMKgwqAgdW5zaWduZWQgbG9u
ZyBwZm47Cj4+ICvCoMKgwqAgcGZuX3QgcGZudDsKPj4gK8KgwqDCoCBzdHJ1Y3QgdHRtX3R0ICp0
dG0gPSBiby0+dHRtOwo+PiArwqDCoMKgIGJvb2wgd3JpdGUgPSB2bWYtPmZsYWdzICYgRkFVTFRf
RkxBR19XUklURTsKPj4gKwo+PiArCj4+ICvCoMKgwqAgLyogRmF1bHQgc2hvdWxkIG5vdCBjcm9z
cyBibyBib3VuZGFyeSAqLwo+PiArwqDCoMKgIHBhZ2Vfb2Zmc2V0ICY9IH4oZmF1bHRfcGFnZV9z
aXplIC0gMSk7Cj4+ICvCoMKgwqAgaWYgKHBhZ2Vfb2Zmc2V0ICsgZmF1bHRfcGFnZV9zaXplID4g
Ym8tPm51bV9wYWdlcykKPj4gK8KgwqDCoMKgwqDCoMKgIGdvdG8gb3V0X2ZhbGxiYWNrOwo+PiAr
Cj4+ICvCoMKgwqAgaWYgKGJvLT5tZW0uYnVzLmlzX2lvbWVtKQo+PiArwqDCoMKgwqDCoMKgwqAg
cGZuID0gdHRtX2JvX2lvX21lbV9wZm4oYm8sIHBhZ2Vfb2Zmc2V0KTsKPj4gK8KgwqDCoCBlbHNl
Cj4+ICvCoMKgwqDCoMKgwqDCoCBwZm4gPSBwYWdlX3RvX3Bmbih0dG0tPnBhZ2VzW3BhZ2Vfb2Zm
c2V0XSk7Cj4+ICsKPj4gK8KgwqDCoCAvKiBwZm4gbXVzdCBiZSBmYXVsdF9wYWdlX3NpemUgYWxp
Z25lZC4gKi8KPj4gK8KgwqDCoCBpZiAoKHBmbiAmIChmYXVsdF9wYWdlX3NpemUgLSAxKSkgIT0g
MCkKPj4gK8KgwqDCoMKgwqDCoMKgIGdvdG8gb3V0X2ZhbGxiYWNrOwo+PiArCj4+ICvCoMKgwqAg
LyogSU8gbWVtb3J5IGlzIE9LIG5vdywgVFQgbWVtb3J5IG11c3QgYmUgY29udGlnb3VzLiAqLwo+
Cj4gVGhhdCB3b24ndCB3b3JrIGNvcnJlY3RseSwgSU8gbWVtIG1pZ2h0IG5vdCBiZSBjb250aWd1
b3VzIGVpdGhlci4KPgo+IFdlIGVpdGhlciBuZWVkIHRvIGNhbGwgdHRtX2JvX2lvX21lbV9wZm4o
KSBtdWx0aXBsZSB0aW1lcyBhbmQgY2hlY2sgCj4gdGhhdCB0aGUgYWRkcmVzc2VzIGFyZSBsaW5l
YXIgb3IgcmV0dXJuIHRoZSBsZW5ndGggYWRkaXRpb25hbCB0byB0aGUgcGZuLgoKWWVzLCB5b3Un
cmUgcmlnaHQuIFdpbGwgZml4IHRoYXQgdXAuCgpUaGFua3MsCgpUaG9tYXMKCgoKPgo+IFJlZ2Fy
ZHMsCj4gQ2hyaXN0aWFuLiAKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
