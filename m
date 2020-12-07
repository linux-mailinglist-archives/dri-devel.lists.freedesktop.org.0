Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F482D14FC
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 16:45:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E8E66E889;
	Mon,  7 Dec 2020 15:45:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEA016E889
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 15:45:24 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B7Fj6HD021721;
 Mon, 7 Dec 2020 09:45:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1607355906;
 bh=M7or6jhsnNf7C9ebG+vDqmHZQ95wAia6Ss+f5PHkS3M=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=x9Gpr8cXMgM4Z//18d46MJTit8V6qwRlVr2fM7vITWD2hglZ4GSKcYpXu2SKBfx9J
 12DYIGy53pB4XcgNu2vrTkQXFiGBy3ub7aSpvTvZl2trF/U214L7s6Ab6Z39CqXLaJ
 1F7aFPSU8DGENmT93vgM+rhyojYRVWjtb4mIJY48=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B7Fj6P6121422
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 7 Dec 2020 09:45:06 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 7 Dec
 2020 09:45:06 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 7 Dec 2020 09:45:06 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B7Fj3wM094394;
 Mon, 7 Dec 2020 09:45:03 -0600
Subject: Re: [PATCH 1/2] drm: add legacy support for using degamma for gamma
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>
References: <20201203114845.232911-1-tomi.valkeinen@ti.com>
 <20201203114845.232911-2-tomi.valkeinen@ti.com>
 <20201204223525.GJ4109@pendragon.ideasonboard.com>
 <X85K6PgnuVt/L5MH@intel.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <69ff519e-835f-c60d-b43d-a7c9d4ca31c2@ti.com>
Date: Mon, 7 Dec 2020 17:45:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <X85K6PgnuVt/L5MH@intel.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Paul Cercueil <paul@crapouillou.net>,
 Alexandre Torgue <alexandre.torgue@st.com>, David Airlie <airlied@linux.ie>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 Philippe Cornu <philippe.cornu@st.com>, Yannick Fertre <yannick.fertre@st.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Vincent Abriou <vincent.abriou@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDcvMTIvMjAyMCAxNzozMSwgVmlsbGUgU3lyasOkbMOkIHdyb3RlOgo+IE9uIFNhdCwgRGVj
IDA1LCAyMDIwIGF0IDEyOjM1OjI1QU0gKzAyMDAsIExhdXJlbnQgUGluY2hhcnQgd3JvdGU6Cj4+
IEhpIFRvbWksCj4+Cj4+IFRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgo+Pgo+PiBPbiBUaHUsIERl
YyAwMywgMjAyMCBhdCAwMTo0ODo0NFBNICswMjAwLCBUb21pIFZhbGtlaW5lbiB3cm90ZToKPj4+
IFdlIGN1cnJlbnRseSBoYXZlIGRybV9hdG9taWNfaGVscGVyX2xlZ2FjeV9nYW1tYV9zZXQoKSBo
ZWxwZXIgd2hpY2ggY2FuCj4+PiBiZSB1c2VkIHRvIGhhbmRsZSBsZWdhY3kgZ2FtbWEtc2V0IGlv
Y3RsLgo+Pj4gZHJtX2F0b21pY19oZWxwZXJfbGVnYWN5X2dhbW1hX3NldCgpIHNldHMgR0FNTUFf
TFVULCBhbmQgY2xlYXJzCj4+PiBDVE0gYW5kIERFR0FNTUFfTFVULiBUaGlzIHdvcmtzIGZpbmUg
b24gSFcgd2hlcmUgd2UgaGF2ZSBlaXRoZXI6Cj4+Pgo+Pj4gZGVnYW1tYSAtPiBjdG0gLT4gZ2Ft
bWEgLT4gb3V0Cj4+Pgo+Pj4gb3IKPj4+Cj4+PiBjdG0gLT4gZ2FtbWEgLT4gb3V0Cj4+Pgo+Pj4g
SG93ZXZlciwgaWYgdGhlIEhXIGhhcyBnYW1tYSB0YWJsZSBiZWZvcmUgY3RtLCB0aGUgYXRvbWlj
IHByb3BlcnR5Cj4+PiBzaG91bGQgYmUgREVHQU1NQV9MVVQsIGFuZCB0aHVzIHdlIGhhdmU6Cj4+
Pgo+Pj4gZGVnYW1tYSAtPiBjdG0gLT4gb3V0Cj4+Pgo+Pj4gVGhpcyBpcyBmaW5lIGZvciB1c2Vy
c3BhY2Ugd2hpY2ggc2V0cyBnYW1tYSB0YWJsZSB1c2luZyB0aGUgcHJvcGVydGllcywKPj4+IGFz
IHRoZSB1c2Vyc3BhY2UgY2FuIGNoZWNrIGZvciB0aGUgZXhpc3RlbmNlIG9mIGdhbW1hICYgZGVn
YW1tYSwgYnV0IHRoZQo+Pj4gbGVnYWN5IGdhbW1hLXNldCBpb2N0bCBkb2VzIG5vdCB3b3JrLgo+
Pj4KPj4+IFRoaXMgcGF0Y2ggZml4ZXMgdGhlIGlzc3VlIGJ5IGNoYW5naW5nCj4+PiBkcm1fYXRv
bWljX2hlbHBlcl9sZWdhY3lfZ2FtbWFfc2V0KCkgc28gdGhhdCBHQU1NQV9MVVQgd2lsbCBiZSB1
c2VkIGlmCj4+PiBpdCBleGlzdHMsIGFuZCBERUdBTU1BX0xVVCB3aWxsIGJlIHVzZWQgYXMgYSBm
YWxsYmFjay4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxr
ZWluZW5AdGkuY29tPgo+Pj4gLS0tCj4+PiAgZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfaGVs
cGVyLmMgfCAxOCArKysrKysrKysrKysrKystLS0KPj4+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2Nv
bG9yX21nbXQuYyAgICB8ICA0ICsrKysKPj4+ICBpbmNsdWRlL2RybS9kcm1fY3J0Yy5oICAgICAg
ICAgICAgICB8ICAzICsrKwo+Pj4gIDMgZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9h
dG9taWNfaGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19oZWxwZXIuYwo+Pj4g
aW5kZXggYmExNTA3MDM2ZjI2Li5mZTU5YzhlYTQyYTkgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vZHJtX2F0b21pY19oZWxwZXIuYwo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV9hdG9taWNfaGVscGVyLmMKPj4+IEBAIC0zNTEyLDYgKzM1MTIsMTAgQEAgRVhQT1JUX1NZTUJP
TChkcm1fYXRvbWljX2hlbHBlcl9wYWdlX2ZsaXBfdGFyZ2V0KTsKPj4+ICAgKiB0aGF0IHN1cHBv
cnQgY29sb3IgbWFuYWdlbWVudCB0aHJvdWdoIHRoZSBERUdBTU1BX0xVVC9HQU1NQV9MVVQKPj4+
ICAgKiBwcm9wZXJ0aWVzLiBTZWUgZHJtX2NydGNfZW5hYmxlX2NvbG9yX21nbXQoKSBhbmQgdGhl
IGNvbnRhaW5pbmcgY2hhcHRlciBmb3IKPj4+ICAgKiBob3cgdGhlIGF0b21pYyBjb2xvciBtYW5h
Z2VtZW50IGFuZCBnYW1tYSB0YWJsZXMgd29yay4KPj4+ICsgKgo+Pj4gKyAqIFRoaXMgZnVuY3Rp
b24gdXNlcyB0aGUgR0FNTUFfTFVUIG9yIERFR0FNTUFfTFVUIHByb3BlcnR5IGZvciB0aGUgZ2Ft
bWEgdGFibGUuCj4+PiArICogR0FNTUFfTFVUIHByb3BlcnR5IGlzIHVzZWQgaWYgaXQgZXhpc3Rz
LCBhbmQgREVHQU1NQV9MVVQgcHJvcGVydHkgaXMgdXNlZCBhcwo+Pj4gKyAqIGEgZmFsbGJhY2su
Cj4+PiAgICovCj4+PiAgaW50IGRybV9hdG9taWNfaGVscGVyX2xlZ2FjeV9nYW1tYV9zZXQoc3Ry
dWN0IGRybV9jcnRjICpjcnRjLAo+Pj4gIAkJCQkgICAgICAgdTE2ICpyZWQsIHUxNiAqZ3JlZW4s
IHUxNiAqYmx1ZSwKPj4+IEBAIC0zNTI1LDYgKzM1MjksMTIgQEAgaW50IGRybV9hdG9taWNfaGVs
cGVyX2xlZ2FjeV9nYW1tYV9zZXQoc3RydWN0IGRybV9jcnRjICpjcnRjLAo+Pj4gIAlzdHJ1Y3Qg
ZHJtX2NvbG9yX2x1dCAqYmxvYl9kYXRhOwo+Pj4gIAlpbnQgaSwgcmV0ID0gMDsKPj4+ICAJYm9v
bCByZXBsYWNlZDsKPj4+ICsJYm9vbCB1c2VfZGVnYW1tYTsKPj4+ICsKPj4+ICsJaWYgKCFjcnRj
LT5oYXNfZ2FtbWFfcHJvcCAmJiAhY3J0Yy0+aGFzX2RlZ2FtbWFfcHJvcCkKPj4+ICsJCXJldHVy
biAtRU5PREVWOwo+Pj4gKwo+Pj4gKwl1c2VfZGVnYW1tYSA9ICFjcnRjLT5oYXNfZ2FtbWFfcHJv
cDsKPj4+ICAKPj4+ICAJc3RhdGUgPSBkcm1fYXRvbWljX3N0YXRlX2FsbG9jKGNydGMtPmRldik7
Cj4+PiAgCWlmICghc3RhdGUpCj4+PiBAQCAtMzU1NCwxMCArMzU2NCwxMiBAQCBpbnQgZHJtX2F0
b21pY19oZWxwZXJfbGVnYWN5X2dhbW1hX3NldChzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCj4+PiAg
CQlnb3RvIGZhaWw7Cj4+PiAgCX0KPj4+ICAKPj4+IC0JLyogUmVzZXQgREVHQU1NQV9MVVQgYW5k
IENUTSBwcm9wZXJ0aWVzLiAqLwo+Pj4gLQlyZXBsYWNlZCAgPSBkcm1fcHJvcGVydHlfcmVwbGFj
ZV9ibG9iKCZjcnRjX3N0YXRlLT5kZWdhbW1hX2x1dCwgTlVMTCk7Cj4+PiArCS8qIFNldCBHQU1N
QS9ERUdBTU1BX0xVVCBhbmQgcmVzZXQgREVHQU1NQS9HQU1NQV9MVVQgYW5kIENUTSAqLwo+Pj4g
KwlyZXBsYWNlZCAgPSBkcm1fcHJvcGVydHlfcmVwbGFjZV9ibG9iKCZjcnRjX3N0YXRlLT5kZWdh
bW1hX2x1dCwKPj4+ICsJCQkJCSAgICAgIHVzZV9kZWdhbW1hID8gYmxvYiA6IE5VTEwpOwo+Pj4g
IAlyZXBsYWNlZCB8PSBkcm1fcHJvcGVydHlfcmVwbGFjZV9ibG9iKCZjcnRjX3N0YXRlLT5jdG0s
IE5VTEwpOwo+Pj4gLQlyZXBsYWNlZCB8PSBkcm1fcHJvcGVydHlfcmVwbGFjZV9ibG9iKCZjcnRj
X3N0YXRlLT5nYW1tYV9sdXQsIGJsb2IpOwo+Pj4gKwlyZXBsYWNlZCB8PSBkcm1fcHJvcGVydHlf
cmVwbGFjZV9ibG9iKCZjcnRjX3N0YXRlLT5nYW1tYV9sdXQsCj4+PiArCQkJCQkgICAgICB1c2Vf
ZGVnYW1tYSA/IE5VTEwgOiBibG9iKTsKPj4+ICAJY3J0Y19zdGF0ZS0+Y29sb3JfbWdtdF9jaGFu
Z2VkIHw9IHJlcGxhY2VkOwo+Pj4gIAo+Pj4gIAlyZXQgPSBkcm1fYXRvbWljX2NvbW1pdChzdGF0
ZSk7Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9jb2xvcl9tZ210LmMgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX2NvbG9yX21nbXQuYwo+Pj4gaW5kZXggM2JjYWJjMmY2ZTBlLi45
NTZlNTlkNWY2YTcgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2NvbG9yX21n
bXQuYwo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jb2xvcl9tZ210LmMKPj4+IEBAIC0x
NzYsNiArMTc2LDggQEAgdm9pZCBkcm1fY3J0Y19lbmFibGVfY29sb3JfbWdtdChzdHJ1Y3QgZHJt
X2NydGMgKmNydGMsCj4+PiAgCQkJCQkgICBkZWdhbW1hX2x1dF9zaXplKTsKPj4+ICAJfQo+Pj4g
IAo+Pj4gKwljcnRjLT5oYXNfZGVnYW1tYV9wcm9wID0gISFkZWdhbW1hX2x1dF9zaXplOwo+Pj4g
Kwo+Pj4gIAlpZiAoaGFzX2N0bSkKPj4+ICAJCWRybV9vYmplY3RfYXR0YWNoX3Byb3BlcnR5KCZj
cnRjLT5iYXNlLAo+Pj4gIAkJCQkJICAgY29uZmlnLT5jdG1fcHJvcGVydHksIDApOwo+Pj4gQEAg
LTE4Nyw2ICsxODksOCBAQCB2b2lkIGRybV9jcnRjX2VuYWJsZV9jb2xvcl9tZ210KHN0cnVjdCBk
cm1fY3J0YyAqY3J0YywKPj4+ICAJCQkJCSAgIGNvbmZpZy0+Z2FtbWFfbHV0X3NpemVfcHJvcGVy
dHksCj4+PiAgCQkJCQkgICBnYW1tYV9sdXRfc2l6ZSk7Cj4+PiAgCX0KPj4+ICsKPj4+ICsJY3J0
Yy0+aGFzX2dhbW1hX3Byb3AgPSAhIWdhbW1hX2x1dF9zaXplOwo+Pj4gIH0KPj4+ICBFWFBPUlRf
U1lNQk9MKGRybV9jcnRjX2VuYWJsZV9jb2xvcl9tZ210KTsKPj4+ICAKPj4+IGRpZmYgLS1naXQg
YS9pbmNsdWRlL2RybS9kcm1fY3J0Yy5oIGIvaW5jbHVkZS9kcm0vZHJtX2NydGMuaAo+Pj4gaW5k
ZXggYmE4MzllNWUzNTdkLi45ZTFmMDYwNDdlM2QgMTAwNjQ0Cj4+PiAtLS0gYS9pbmNsdWRlL2Ry
bS9kcm1fY3J0Yy5oCj4+PiArKysgYi9pbmNsdWRlL2RybS9kcm1fY3J0Yy5oCj4+PiBAQCAtMTA4
NCw2ICsxMDg0LDkgQEAgc3RydWN0IGRybV9jcnRjIHsKPj4+ICAJICovCj4+PiAgCXVpbnQxNl90
ICpnYW1tYV9zdG9yZTsKPj4+ICAKPj4+ICsJYm9vbCBoYXNfZ2FtbWFfcHJvcDsKPj4+ICsJYm9v
bCBoYXNfZGVnYW1tYV9wcm9wOwo+Pgo+PiBXZSBjb3VsZCB1c2UgYSBiaXRmaWVsZCB0byBzYXZl
IGEgYml0IG9mIG1lbW9yeS4gQXBhcnQgZnJvbSB0aGF0LCB0aGUKPj4gcGF0Y2ggbG9va3MgZ29v
ZCB0byBtZS4KPiAKPiBPciB3ZSBjb3VsZCBqdXN0IGNoZWNrIGlmIHRoZSBjcnRjIGhhcyB0aGUg
cmVsZXZhbnQgcHJvcCBvciBub3QuCgpUaGF0J3Mgd2hhdCBJIGRpZCBhdCBmaXJzdCwgYnV0IGl0
IHJlcXVpcmVzIGl0ZXJhdGluZyBvdmVyIHRoZSBwcm9wcyAodW5sZXNzIEkgbWlzc2VkIGEgc2lt
cGxlIHdheQp0byBqdXN0IGNoZWNrIGl0KS4gUHJvYmFibHkgbm90IG5vdGljZWFibGUgKGluIHBl
cmZvcm1hbmNlKSBidXQganVzdCBmZWx0IGEgYml0IHVnbHkuCgogVG9taQoKLS0gClRleGFzIElu
c3RydW1lbnRzIEZpbmxhbmQgT3ksIFBvcmtrYWxhbmthdHUgMjIsIDAwMTgwIEhlbHNpbmtpLgpZ
LXR1bm51cy9CdXNpbmVzcyBJRDogMDYxNTUyMS00LiBLb3RpcGFpa2thL0RvbWljaWxlOiBIZWxz
aW5raQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
