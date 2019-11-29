Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAFB10D730
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 15:40:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4728C6E925;
	Fri, 29 Nov 2019 14:40:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6AB2C6E925
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 14:40:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 140851FB;
 Fri, 29 Nov 2019 06:40:36 -0800 (PST)
Received: from [10.1.194.43] (e112269-lin.cambridge.arm.com [10.1.194.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5EF483F6C4;
 Fri, 29 Nov 2019 06:40:35 -0800 (PST)
Subject: Re: [PATCH 2/8] drm/panfrost: Fix a race in panfrost_ioctl_madvise()
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20191129135908.2439529-1-boris.brezillon@collabora.com>
 <20191129135908.2439529-3-boris.brezillon@collabora.com>
 <dd8a946c-5666-a7b8-f7bc-06647e0d0bbc@arm.com>
 <20191129153310.2f9c80e1@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <b159591d-1dd4-1ac7-e924-c02be1d8b1f3@arm.com>
Date: Fri, 29 Nov 2019 14:40:34 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191129153310.2f9c80e1@collabora.com>
Content-Language: en-US
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
Cc: Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org, Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjkvMTEvMjAxOSAxNDozMywgQm9yaXMgQnJlemlsbG9uIHdyb3RlOgo+IE9uIEZyaSwgMjkg
Tm92IDIwMTkgMTQ6MjQ6NDggKzAwMDAKPiBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmljZUBhcm0u
Y29tPiB3cm90ZToKPiAKPj4gT24gMjkvMTEvMjAxOSAxMzo1OSwgQm9yaXMgQnJlemlsbG9uIHdy
b3RlOgo+Pj4gSWYgMiB0aHJlYWRzIGNoYW5nZSB0aGUgTUFEVklTRSBwcm9wZXJ0eSBvZiB0aGUg
c2FtZSBCTyBpbiBwYXJhbGxlbCB3ZQo+Pj4gbWlnaHQgZW5kIHVwIHdpdGggYW4gc2htZW0tPm1h
ZHYgdmFsdWUgdGhhdCdzIGluY29uc2lzdGVudCB3aXRoIHRoZQo+Pj4gcHJlc2VuY2Ugb2YgdGhl
IEJPIGluIHRoZSBzaHJpbmtlciBsaXN0LiAgCj4+Cj4+IEknbSBhIGJpdCB3b3JyaWVkIGZyb20g
dGhlIHBvaW50IG9mIHZpZXcgb2YgdXNlciBzcGFjZSBzYW5pdHkgdGhhdCB5b3UKPj4gb2JzZXJ2
ZWQgdGhpcyAtIGJ1dCBjbGVhcmx5IHRoZSBrZXJuZWwgc2hvdWxkIGJlIHJvYnVzdCEKPiAKPiBJ
dCdzIG5vdCBzb21ldGhpbmcgSSBvYnNlcnZlZCwganVzdCBmb3VuZCB0aGUgcmFjZSBieSBpbnNw
ZWN0aW5nIHRoZQo+IGNvZGUsIGFuZCBJIHRob3VnaHQgaXQgd2FzIHdvcnRoIGZpeGluZyBpdC4K
Ckdvb2QhIDspIFlvdXIgY292ZXIgbGV0dGVyIHJlZmVycmluZyB0byBhICJkZWJ1ZyBzZXNzaW9u
IiBtYWRlIG1lIHRoaW5rCnlvdSdkIGFjdHVhbGx5IGhpdCBhbGwgdGhlc2UuCgpTdGV2ZQoKPj4K
Pj4+Cj4+PiBUaGUgZWFzaWVzdCBzb2x1dGlvbiB0byBmaXggdGhhdCBpcyB0byBwcm90ZWN0IHRo
ZQo+Pj4gZHJtX2dlbV9zaG1lbV9tYWR2aXNlKCkgY2FsbCB3aXRoIHRoZSBzaHJpbmtlciBsb2Nr
Lgo+Pj4KPj4+IEZpeGVzOiAwMTNiNjUxMDEzMTUgKCJkcm0vcGFuZnJvc3Q6IEFkZCBtYWR2aXNl
IGFuZCBzaHJpbmtlciBzdXBwb3J0IikKPj4+IENjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4K
Pj4+IFNpZ25lZC1vZmYtYnk6IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxh
Ym9yYS5jb20+ICAKPj4KPj4gUmV2aWV3ZWQtYnk6IFN0ZXZlbiBQcmljZSA8c3RldmVuLnByaWNl
QGFybS5jb20+Cj4gCj4gVGhhbmtzLgo+IAo+Pgo+Pj4gLS0tCj4+PiAgZHJpdmVycy9ncHUvZHJt
L3BhbmZyb3N0L3BhbmZyb3N0X2Rydi5jIHwgOSArKysrLS0tLS0KPj4+ICAxIGZpbGUgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0v
cGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMKPj4+IGluZGV4IGYyMWJjOGE3ZWUzYS4uZWZjMGEyNGQx
ZjRjIDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Ry
di5jCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMKPj4+
IEBAIC0zNDcsMjAgKzM0NywxOSBAQCBzdGF0aWMgaW50IHBhbmZyb3N0X2lvY3RsX21hZHZpc2Uo
c3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKPj4+ICAJCXJldHVybiAtRU5PRU5U
Owo+Pj4gIAl9Cj4+PiAgCj4+PiArCW11dGV4X2xvY2soJnBmZGV2LT5zaHJpbmtlcl9sb2NrKTsK
Pj4+ICAJYXJncy0+cmV0YWluZWQgPSBkcm1fZ2VtX3NobWVtX21hZHZpc2UoZ2VtX29iaiwgYXJn
cy0+bWFkdik7Cj4+PiAgCj4+PiAgCWlmIChhcmdzLT5yZXRhaW5lZCkgewo+Pj4gIAkJc3RydWN0
IHBhbmZyb3N0X2dlbV9vYmplY3QgKmJvID0gdG9fcGFuZnJvc3RfYm8oZ2VtX29iaik7Cj4+PiAg
Cj4+PiAtCQltdXRleF9sb2NrKCZwZmRldi0+c2hyaW5rZXJfbG9jayk7Cj4+PiAtCj4+PiAgCQlp
ZiAoYXJncy0+bWFkdiA9PSBQQU5GUk9TVF9NQURWX0RPTlRORUVEKQo+Pj4gLQkJCWxpc3RfYWRk
X3RhaWwoJmJvLT5iYXNlLm1hZHZfbGlzdCwgJnBmZGV2LT5zaHJpbmtlcl9saXN0KTsKPj4+ICsJ
CQlsaXN0X2FkZF90YWlsKCZiby0+YmFzZS5tYWR2X2xpc3QsCj4+PiArCQkJCSAgICAgICZwZmRl
di0+c2hyaW5rZXJfbGlzdCk7Cj4+PiAgCQllbHNlIGlmIChhcmdzLT5tYWR2ID09IFBBTkZST1NU
X01BRFZfV0lMTE5FRUQpCj4+PiAgCQkJbGlzdF9kZWxfaW5pdCgmYm8tPmJhc2UubWFkdl9saXN0
KTsKPj4+IC0KPj4+IC0JCW11dGV4X3VubG9jaygmcGZkZXYtPnNocmlua2VyX2xvY2spOwo+Pj4g
IAl9Cj4+PiArCW11dGV4X3VubG9jaygmcGZkZXYtPnNocmlua2VyX2xvY2spOwo+Pj4gIAo+Pj4g
IAlkcm1fZ2VtX29iamVjdF9wdXRfdW5sb2NrZWQoZ2VtX29iaik7Cj4+PiAgCXJldHVybiAwOwo+
Pj4gICAKPj4KPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
