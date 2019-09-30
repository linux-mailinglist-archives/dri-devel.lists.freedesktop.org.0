Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88812C25E0
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 19:54:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 001DB6E4B0;
	Mon, 30 Sep 2019 17:54:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id CD2866E4B0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 17:54:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7EB491570;
 Mon, 30 Sep 2019 10:54:25 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5E2333F534;
 Mon, 30 Sep 2019 10:54:24 -0700 (PDT)
Subject: Re: [PATCH 2/2] drm/panfrost: Use coherent pagetable walk on Juno
To: Steven Price <steven.price@arm.com>, robh@kernel.org,
 tomeu.vizoso@collabora.com, sudeep.holla@arm.com
References: <88dc6386929b3dcd7a65ba8063628c62b66b330c.1569856049.git.robin.murphy@arm.com>
 <1e499f85220b735849126171e64ebdd1da0302ce.1569856049.git.robin.murphy@arm.com>
 <167ec566-1936-8a05-83fc-74d20d9fb8bc@arm.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <ad744dc3-d71f-b5e9-df2d-f01332be1cbb@arm.com>
Date: Mon, 30 Sep 2019 18:54:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <167ec566-1936-8a05-83fc-74d20d9fb8bc@arm.com>
Content-Language: en-GB
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
Cc: devicetree@vger.kernel.org, lorenzo.pieralisi@arm.com, liviu.dudau@arm.com,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMzAvMDkvMjAxOSAxNzoyNiwgU3RldmVuIFByaWNlIHdyb3RlOgo+IE9uIDMwLzA5LzIwMTkg
MTY6MjQsIFJvYmluIE11cnBoeSB3cm90ZToKPj4gQWx0aG91Z2ggZ29pbmcgZnVsbCAiZG1hLWNv
aGVyZW50IiBlbmRzIGJhZGx5IGR1ZSB0byBHRU0gb2JqZWN0cyBzdGlsbAo+PiBiZWluZyBmb3Jj
aWJseSBtYXBwZWQgbm9uLWNhY2hlYWJsZSwgd2UgY2FuIGF0IGxlYXN0IHRha2UgYWR2YW50YWdl
IG9mCj4+IEp1bm8ncyBBQ0UtbGl0ZSBpbnRlZ3JhdGlvbiB0byBza2lwIGNhY2hlIG1haW50ZW5h
bmNlIGZvciBwYWdldGFibGVzLgo+Pgo+PiBDQzogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9y
Zz4KPj4gQ0M6IFRvbWV1IFZpem9zbyA8dG9tZXUudml6b3NvQGNvbGxhYm9yYS5jb20+Cj4+IFNp
Z25lZC1vZmYtYnk6IFJvYmluIE11cnBoeSA8cm9iaW4ubXVycGh5QGFybS5jb20+Cj4+IC0tLQo+
Pgo+PiBUaGlzIGlzbid0IHJlYWxseSBtZWFudCBhcyBhIHNlcmllcywgSSdtIGp1c3Qgc2VuZGlu
ZyBpdCB0b2dldGhlcgo+PiB3aXRoIHBhdGNoICMxIGZvciBjb250ZXh0Lgo+Pgo+PiAgIGRyaXZl
cnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9tbXUuYyB8IDMgKysrCj4+ICAgMSBmaWxlIGNo
YW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3BhbmZyb3N0L3BhbmZyb3N0X21tdS5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZy
b3N0X21tdS5jCj4+IGluZGV4IGJkZDk5MDU2ODQ3Ni4uNTYwNDM5ZjYzMjc3IDEwMDY0NAo+PiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfbW11LmMKPj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X21tdS5jCj4+IEBAIC0zNjUsNiArMzY1LDkg
QEAgaW50IHBhbmZyb3N0X21tdV9wZ3RhYmxlX2FsbG9jKHN0cnVjdCBwYW5mcm9zdF9maWxlX3By
aXYgKnByaXYpCj4+ICAgCQkuaW9tbXVfZGV2CT0gcGZkZXYtPmRldiwKPj4gICAJfTsKPj4gICAK
Pj4gKwlpZiAob2ZfZGV2aWNlX2lzX2NvbXBhdGlibGUocGZkZXYtPmRldi0+b2Zfbm9kZSwgImFy
bSxqdW5vLW1hbGkiKSkKPj4gKwkJcGZkZXYtPm1tdS0+cGd0YmxfY2ZnLmNvaGVyZW50X3dhbGsg
PSB0cnVlOwo+IAo+IFNob3VsZCBiZToKPiAJbW11LT5wZ3RibF9jZmcuY29oZXJlbnRfd2FsayA9
IHRydWU7CgpPb3BzLCB5ZXMsIHJlYmFzZSBlcnJvci4KCj4gQWxzbyBJJ20gbm90IHN1cmUgd2hl
dGhlciB3ZSBzaG91bGQgZG8gdGhpcyBiYXNlZCBvbiBhIGNvbXBhdGlibGUKPiBzdHJpbmcuIGti
YXNlIGhhcyBhICJzeXN0ZW0tY29oZXJlbmN5IiBkZXZpY2UtdHJlZSBmbGFnIGZvciBpdC4gSW4K
PiB0aGVvcnkgd2UgY291bGQgZW5kIHVwIHdpdGggYSBsb25nIGxpc3Qgb2YgY29tcGF0aWJsZXMg
aGVyZS4uLgoKUmlnaHQsIGlkZWFsbHkgd2UnZCBqdXN0IGluZmVyIGV2ZXJ5dGhpbmcgd2UgbmVl
ZCBmcm9tICJkbWEtY29oZXJlbnQiLCAKYnV0IHRvIGJlIGFibGUgdG8gc2V0IHRoYXQgd2l0aG91
dCBjYXVzaW5nIGZpcmV3b3JrcyB3ZSBuZWVkIHRoZSBHRU0gCm1tYXAgaW1wbGVtZW50YXRpb24g
dG8gYmUgYWJsZSB0byBwbGF5IGFsb25nIHRvby4gTWF5YmUgdGhpcyBjYW4gd2FpdCAKdW50aWwg
SSBmaWd1cmUgb3V0IGhvdyB0byBhZGRyZXNzIHRoYXQgYXQgdGhlIHNhbWUgdGltZS4uLgoKQW5k
IGVpdGhlciB3YXksIGl0IHdvdWxkIHByb2JhYmx5IGJlIGJldHRlciB0byBkZXRlY3QgYW55dGhp
bmcgClNvQy1zcGVjaWZpYyBvbmNlIGF0IHByb2JlIGFuZCBzdGFzaCBpdCBpbiBhIGZlYXR1cmUg
ZmxhZyAtIFRCSCB0aGlzIApwYXRjaCBpcyBtb3JlIG9mIGEgcHJvb2Ytb2YtY29uY2VwdCB0aGFu
IGFueXRoaW5nLgoKVGhhbmtzLApSb2Jpbi4KCj4gCj4gU3RldmUKPiAKPj4gKwo+PiAgIAltbXUt
PnBndGJsX29wcyA9IGFsbG9jX2lvX3BndGFibGVfb3BzKEFSTV9NQUxJX0xQQUUsICZtbXUtPnBn
dGJsX2NmZywKPj4gICAJCQkJCSAgICAgIHByaXYpOwo+PiAgIAlpZiAoIW1tdS0+cGd0Ymxfb3Bz
KQo+Pgo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
