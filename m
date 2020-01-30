Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A9614DBE1
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2020 14:29:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79DE66F9B0;
	Thu, 30 Jan 2020 13:29:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C49976F9B0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2020 13:29:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id 13FC24682E;
 Thu, 30 Jan 2020 14:29:50 +0100 (CET)
Authentication-Results: pio-pvt-msa3.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=hjOfqnyH; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9b6136BA26Yc; Thu, 30 Jan 2020 14:29:48 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 7B3EE40979;
 Thu, 30 Jan 2020 14:29:44 +0100 (CET)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 9E48B360093;
 Thu, 30 Jan 2020 14:29:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1580390984; bh=MhnzOXoppfZHCpRyS3zxHusuHTp4sS+W6DeNE1hrFUg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=hjOfqnyH+y54HDnpIWXrpyGqZ2VqqtSvpCTnQw64MkO1/NJd6rwtkanfmrBjOPMBS
 TKjBrPGdRWGNQmU8QjdPimKq2r6I8bL0tRUG6KmRKeW++w/gh6n3DY/+Mv26I1ljct
 RWvpkaXxqdHqbuajuJR0ksiF7FJv6ZN1EsKQTYuQ=
Subject: Re: [PATCH 5/9] mm, drm/ttm, drm/vmwgfx: Support huge TTM pagefaults
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20200124090940.26571-1-thomas_os@shipmail.org>
 <20200124090940.26571-6-thomas_os@shipmail.org>
 <bc30bf7e-5c96-0272-6e7e-64d22490d6a2@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <615c9c1f-2e53-2c0e-7722-661bcf81554d@shipmail.org>
Date: Thu, 30 Jan 2020 14:29:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <bc30bf7e-5c96-0272-6e7e-64d22490d6a2@amd.com>
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, Michal Hocko <mhocko@suse.com>,
 pv-drivers@vmware.com, Roland Scheidegger <sroland@vmware.com>,
 Ralph Campbell <rcampbell@nvidia.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 linux-graphics-maintainer@vmware.com,
 Andrew Morton <akpm@linux-foundation.org>,
 Dan Williams <dan.j.williams@intel.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMS8yOS8yMCAzOjU1IFBNLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+IEFtIDI0LjAxLjIw
IHVtIDEwOjA5IHNjaHJpZWIgVGhvbWFzIEhlbGxzdHLDtm0gKFZNd2FyZSk6Cj4+IEZyb206IFRo
b21hcyBIZWxsc3Ryb20gPHRoZWxsc3Ryb21Adm13YXJlLmNvbT4KPj4KPj4gU3VwcG9ydCBodWdl
IChQTUQtc2l6ZSBhbmQgUFVELXNpemUpIHBhZ2UtdGFibGUgZW50cmllcyBieSBwcm92aWRpbmcg
YQo+PiBodWdlX2ZhdWx0KCkgY2FsbGJhY2suCj4+IFdlIHN0aWxsIHN1cHBvcnQgcHJpdmF0ZSBt
YXBwaW5ncyBhbmQgd3JpdGUtbm90aWZ5IGJ5IHNwbGl0dGluZyB0aGUgaHVnZQo+PiBwYWdlLXRh
YmxlIGVudHJpZXMgb24gd3JpdGUtYWNjZXNzLgo+Pgo+PiBOb3RlIHRoYXQgZm9yIGh1Z2UgcGFn
ZS1mYXVsdHMgdG8gb2NjdXIsIGVpdGhlciB0aGUga2VybmVsIG5lZWRzIHRvIGJlCj4+IGNvbXBp
bGVkIHdpdGggdHJhbnMtaHVnZS1wYWdlcyBhbHdheXMgZW5hYmxlZCwgb3IgdGhlIGtlcm5lbCBu
ZWVkcyB0byBiZQo+PiBjb21waWxlZCB3aXRoIHRyYW5zLWh1Z2UtcGFnZXMgZW5hYmxlZCB1c2lu
ZyBtYWR2aXNlLCBhbmQgdGhlIHVzZXItc3BhY2UKPj4gYXBwIG5lZWRzIHRvIGNhbGwgbWFkdmlz
ZSgpIHRvIGVuYWJsZSB0cmFucy1odWdlIHBhZ2VzIG9uIGEgcGVyLW1hcHBpbmcKPj4gYmFzaXMu
Cj4+Cj4+IEZ1cnRoZXJtb3JlIGh1Z2UgcGFnZS1mYXVsdHMgd2lsbCBub3Qgc3VjY2VlZCB1bmxl
c3MgYnVmZmVyIG9iamVjdHMgYW5kCj4+IHVzZXItc3BhY2UgYWRkcmVzc2VzIGFyZSBhbGlnbmVk
IG9uIGh1Z2UgcGFnZSBzaXplIGJvdW5kYXJpZXMuCj4+Cj4+IENjOiBBbmRyZXcgTW9ydG9uIDxh
a3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnPgo+PiBDYzogTWljaGFsIEhvY2tvIDxtaG9ja29Ac3Vz
ZS5jb20+Cj4+IENjOiAiTWF0dGhldyBXaWxjb3ggKE9yYWNsZSkiIDx3aWxseUBpbmZyYWRlYWQu
b3JnPgo+PiBDYzogIktpcmlsbCBBLiBTaHV0ZW1vdiIgPGtpcmlsbC5zaHV0ZW1vdkBsaW51eC5p
bnRlbC5jb20+Cj4+IENjOiBSYWxwaCBDYW1wYmVsbCA8cmNhbXBiZWxsQG52aWRpYS5jb20+Cj4+
IENjOiAiSsOpcsO0bWUgR2xpc3NlIiA8amdsaXNzZUByZWRoYXQuY29tPgo+PiBDYzogIkNocmlz
dGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4+IENjOiBEYW4gV2lsbGlh
bXMgPGRhbi5qLndpbGxpYW1zQGludGVsLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIEhl
bGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgo+PiBSZXZpZXdlZC1ieTogUm9sYW5kIFNj
aGVpZGVnZ2VyIDxzcm9sYW5kQHZtd2FyZS5jb20+Cj4+IC0tLQo+PiDCoCBkcml2ZXJzL2dwdS9k
cm0vdHRtL3R0bV9ib192bS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDE0NSArKysrKysrKysr
KysrKysrKysrKy0KPj4gwqAgZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfcGFnZV9kaXJ0
eS5jIHzCoMKgIDIgKy0KPj4gwqAgaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19hcGkuaMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMyArLQo+PiDCoCAzIGZpbGVzIGNoYW5nZWQsIDE0
NSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYyAKPj4gYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9i
b192bS5jCj4+IGluZGV4IDM4OTEyOGI4YzRkZC4uNDk3MDQyNjFhMDBkIDEwMDY0NAo+PiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192bS5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS90dG0vdHRtX2JvX3ZtLmMKPj4gQEAgLTE1Niw2ICsxNTYsODkgQEAgdm1fZmF1bHRfdCB0dG1f
Ym9fdm1fcmVzZXJ2ZShzdHJ1Y3QgCj4+IHR0bV9idWZmZXJfb2JqZWN0ICpibywKPj4gwqAgfQo+
PiDCoCBFWFBPUlRfU1lNQk9MKHR0bV9ib192bV9yZXNlcnZlKTsKPj4gwqAgKyNpZmRlZiBDT05G
SUdfVFJBTlNQQVJFTlRfSFVHRVBBR0UKPj4gKy8qKgo+PiArICogdHRtX2JvX3ZtX2luc2VydF9o
dWdlIC0gSW5zZXJ0IGEgcGZuIGZvciBQVUQgb3IgUE1EIGZhdWx0cwo+PiArICogQHZtZjogRmF1
bHQgZGF0YQo+PiArICogQGJvOiBUaGUgYnVmZmVyIG9iamVjdAo+PiArICogQHBhZ2Vfb2Zmc2V0
OiBQYWdlIG9mZnNldCBmcm9tIGJvIHN0YXJ0Cj4+ICsgKiBAZmF1bHRfcGFnZV9zaXplOiBUaGUg
c2l6ZSBvZiB0aGUgZmF1bHQgaW4gcGFnZXMuCj4+ICsgKiBAcGdwcm90OiBUaGUgcGFnZSBwcm90
ZWN0aW9ucy4KPj4gKyAqIERvZXMgYWRkaXRpb25hbCBjaGVja2luZyB3aGV0aGVyIGl0J3MgcG9z
c2libGUgdG8gaW5zZXJ0IGEgUFVEIG9yIAo+PiBQTUQKPj4gKyAqIHBmbiBhbmQgcGVyZm9ybXMg
dGhlIGluc2VydGlvbi4KPj4gKyAqCj4+ICsgKiBSZXR1cm46IFZNX0ZBVUxUX05PUEFHRSBvbiBz
dWNjZXNzZnVsIGluc2VydGlvbiwgCj4+IFZNX0ZBVUxUX0ZBTExCQUNLIGlmCj4+ICsgKiBhIGh1
Z2UgZmF1bHQgd2FzIG5vdCBwb3NzaWJsZSwgYW5kIGEgVk1fRkFVTFRfRVJST1IgY29kZSBvdGhl
cndpc2UuCj4+ICsgKi8KPj4gK3N0YXRpYyB2bV9mYXVsdF90IHR0bV9ib192bV9pbnNlcnRfaHVn
ZShzdHJ1Y3Qgdm1fZmF1bHQgKnZtZiwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwZ29mZl90IHBhZ2Vfb2Zmc2V0LAo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGdvZmZfdCBmYXVsdF9wYWdlX3NpemUs
Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwZ3Byb3RfdCBwZ3By
b3QpCj4+ICt7Cj4+ICvCoMKgwqAgcGdvZmZfdCBpOwo+PiArwqDCoMKgIHZtX2ZhdWx0X3QgcmV0
Owo+PiArwqDCoMKgIHVuc2lnbmVkIGxvbmcgcGZuOwo+PiArwqDCoMKgIHBmbl90IHBmbnQ7Cj4+
ICvCoMKgwqAgc3RydWN0IHR0bV90dCAqdHRtID0gYm8tPnR0bTsKPj4gK8KgwqDCoCBib29sIHdy
aXRlID0gdm1mLT5mbGFncyAmIEZBVUxUX0ZMQUdfV1JJVEU7Cj4+ICsKPj4gK8KgwqDCoCAvKiBG
YXVsdCBzaG91bGQgbm90IGNyb3NzIGJvIGJvdW5kYXJ5LiAqLwo+PiArwqDCoMKgIHBhZ2Vfb2Zm
c2V0ICY9IH4oZmF1bHRfcGFnZV9zaXplIC0gMSk7Cj4+ICvCoMKgwqAgaWYgKHBhZ2Vfb2Zmc2V0
ICsgZmF1bHRfcGFnZV9zaXplID4gYm8tPm51bV9wYWdlcykKPj4gK8KgwqDCoMKgwqDCoMKgIGdv
dG8gb3V0X2ZhbGxiYWNrOwo+PiArCj4+ICvCoMKgwqAgaWYgKGJvLT5tZW0uYnVzLmlzX2lvbWVt
KQo+PiArwqDCoMKgwqDCoMKgwqAgcGZuID0gdHRtX2JvX2lvX21lbV9wZm4oYm8sIHBhZ2Vfb2Zm
c2V0KTsKPj4gK8KgwqDCoCBlbHNlCj4+ICvCoMKgwqDCoMKgwqDCoCBwZm4gPSBwYWdlX3RvX3Bm
bih0dG0tPnBhZ2VzW3BhZ2Vfb2Zmc2V0XSk7Cj4+ICsKPj4gK8KgwqDCoCAvKiBwZm4gbXVzdCBi
ZSBmYXVsdF9wYWdlX3NpemUgYWxpZ25lZC4gKi8KPj4gK8KgwqDCoCBpZiAoKHBmbiAmIChmYXVs
dF9wYWdlX3NpemUgLSAxKSkgIT0gMCkKPj4gK8KgwqDCoMKgwqDCoMKgIGdvdG8gb3V0X2ZhbGxi
YWNrOwo+PiArCj4+ICvCoMKgwqAgLyogQ2hlY2sgdGhhdCBtZW1vcnkgaXMgY29udGlndW91cy4g
Ki8KPj4gK8KgwqDCoCBpZiAoIWJvLT5tZW0uYnVzLmlzX2lvbWVtKQo+PiArwqDCoMKgwqDCoMKg
wqAgZm9yIChpID0gMTsgaSA8IGZhdWx0X3BhZ2Vfc2l6ZTsgKytpKSB7Cj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGlmIChwYWdlX3RvX3Bmbih0dG0tPnBhZ2VzW3BhZ2Vfb2Zmc2V0ICsgaV0p
ICE9IHBmbiArIGkpCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBvdXRf
ZmFsbGJhY2s7Cj4+ICvCoMKgwqDCoMKgwqDCoCB9Cj4+ICvCoMKgwqAgLyogSU8gbWVtIHdpdGhv
dXQgdGhlIGlvX21lbV9wZm4gY2FsbGJhY2sgaXMgYWx3YXlzIGNvbnRpZ3VvdXMuICovCj4+ICvC
oMKgwqAgZWxzZSBpZiAoYm8tPmJkZXYtPmRyaXZlci0+aW9fbWVtX3BmbikKPj4gK8KgwqDCoMKg
wqDCoMKgIGZvciAoaSA9IDE7IGkgPCBmYXVsdF9wYWdlX3NpemU7ICsraSkgewo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBpZiAodHRtX2JvX2lvX21lbV9wZm4oYm8sIHBhZ2Vfb2Zmc2V0ICsg
aSkgIT0gcGZuICsgaSkKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIG91
dF9mYWxsYmFjazsKPj4gK8KgwqDCoMKgwqDCoMKgIH0KPgo+IE1heWJlIGFkZCB7fSB0byB0aGUg
aWYgdG8gbWFrZSBjbGVhciB3aGVyZSB0aGluZ3Mgc3RhcnQvZW5kLgo+Cj4+ICsKPj4gK8KgwqDC
oCBwZm50ID0gX19wZm5fdG9fcGZuX3QocGZuLCBQRk5fREVWKTsKPj4gK8KgwqDCoCBpZiAoZmF1
bHRfcGFnZV9zaXplID09IChIUEFHRV9QTURfU0laRSA+PiBQQUdFX1NISUZUKSkKPj4gK8KgwqDC
oMKgwqDCoMKgIHJldCA9IHZtZl9pbnNlcnRfcGZuX3BtZF9wcm90KHZtZiwgcGZudCwgcGdwcm90
LCB3cml0ZSk7Cj4+ICsjaWZkZWYgQ09ORklHX0hBVkVfQVJDSF9UUkFOU1BBUkVOVF9IVUdFUEFH
RV9QVUQKPj4gK8KgwqDCoCBlbHNlIGlmIChmYXVsdF9wYWdlX3NpemUgPT0gKEhQQUdFX1BVRF9T
SVpFID4+IFBBR0VfU0hJRlQpKQo+PiArwqDCoMKgwqDCoMKgwqAgcmV0ID0gdm1mX2luc2VydF9w
Zm5fcHVkX3Byb3Qodm1mLCBwZm50LCBwZ3Byb3QsIHdyaXRlKTsKPj4gKyNlbmRpZgo+PiArwqDC
oMKgIGVsc2UKPj4gK8KgwqDCoMKgwqDCoMKgIFdBUk5fT05fT05DRShyZXQgPSBWTV9GQVVMVF9G
QUxMQkFDSyk7Cj4+ICsKPj4gK8KgwqDCoCBpZiAocmV0ICE9IFZNX0ZBVUxUX05PUEFHRSkKPj4g
K8KgwqDCoMKgwqDCoMKgIGdvdG8gb3V0X2ZhbGxiYWNrOwo+PiArCj4+ICvCoMKgwqAgcmV0dXJu
IFZNX0ZBVUxUX05PUEFHRTsKPj4gK291dF9mYWxsYmFjazoKPj4gK8KgwqDCoCBjb3VudF92bV9l
dmVudChUSFBfRkFVTFRfRkFMTEJBQ0spOwo+PiArwqDCoMKgIHJldHVybiBWTV9GQVVMVF9GQUxM
QkFDSzsKPgo+IFRoaXMgZG9lc24ndCBzZWVtIHRvIG1hdGNoIHRoZSBmdW5jdGlvbiBkb2N1bWVu
dGF0aW9uIHNpbmNlIHdlIG5ldmVyIAo+IHJldHVybiByZXQgaGVyZSBhcyBmYXIgYXMgSSBjYW4g
c2VlLgo+Cj4gQXBhcnQgZnJvbSB0aG9zZSBjb21tZW50cyBpdCBsb29rcyBsaWtlIHRoYXQgc2hv
dWxkIHdvcmssCj4gQ2hyaXN0aWFuLgoKClRoYW5rcyBmb3IgcmV2aWV3aW5nLCBDaHJpc3RpYW4u
IEknbGwgdXBkYXRlIHRoZSBuZXh0IHZlcnNpb24gd2l0aCB5b3VyIApmZWVkYmFjay4KCi9UaG9t
YXMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
