Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8302B346542
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 17:35:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ACBC89856;
	Tue, 23 Mar 2021 16:35:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 927D089856
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 16:34:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id AF9363FD99;
 Tue, 23 Mar 2021 17:34:57 +0100 (CET)
Authentication-Results: ste-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=dWhU36oH; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Authentication-Results: ste-ftg-msa2.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9IherXCBi9lB; Tue, 23 Mar 2021 17:34:56 +0100 (CET)
Received: by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id B899F3FD1E;
 Tue, 23 Mar 2021 17:34:54 +0100 (CET)
Received: from [192.168.0.209] (unknown [192.198.151.43])
 by mail1.shipmail.org (Postfix) with ESMTPSA id B711336062E;
 Tue, 23 Mar 2021 17:34:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1616517294; bh=gIwnz5YrpsvMLr1ZSuPnF+kvE+yWmQ+lrSIsK/yX9/I=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=dWhU36oHnZbX8U7bf7qWiXkbbDKceZ/x7UyGk/7i1aBzR0TvA9LH9lzV6kmq4XyQB
 wORqOco+jomxT/WEyvcBbXxqkpKtCF3gresSz/G8v8tlnZOC2JStyhn9LU9EPMB97v
 ISBy4xgjnQESYi2ph174xiD/L9m3ADfw4ZwHb+AI=
Subject: Re: [RFC PATCH 1/2] mm,drm/ttm: Block fast GUP to TTM huge pages
To: dri-devel@lists.freedesktop.org,
 Christian Koenig <christian.koenig@amd.com>, David Airlie
 <airlied@linux.ie>, Andrew Morton <akpm@linux-foundation.org>,
 Jason Gunthorpe <jgg@nvidia.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20210321184529.59006-1-thomas_os@shipmail.org>
 <20210321184529.59006-2-thomas_os@shipmail.org>
 <YFnST5VLcEgv9q+s@phenom.ffwll.local>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <314fc020-d243-dbf0-acb3-ecfcc9c2443c@shipmail.org>
Date: Tue, 23 Mar 2021 17:34:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YFnST5VLcEgv9q+s@phenom.ffwll.local>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAzLzIzLzIxIDEyOjM0IFBNLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+IE9uIFN1biwg
TWFyIDIxLCAyMDIxIGF0IDA3OjQ1OjI4UE0gKzAxMDAsIFRob21hcyBIZWxsc3Ryw7ZtIChJbnRl
bCkgd3JvdGU6Cj4+IFRUTSBzZXRzIHVwIGh1Z2UgcGFnZS10YWJsZS1lbnRyaWVzIGJvdGggdG8g
c3lzdGVtLSBhbmQgZGV2aWNlIG1lbW9yeSwKPj4gYW5kIHdlIGRvbid0IHdhbnQgZ3VwIHRvIGFz
c3VtZSB0aGVyZSBhcmUgYWx3YXlzIHZhbGlkIGJhY2tpbmcgc3RydWN0Cj4+IHBhZ2VzIGZvciB0
aGVzZS4gRm9yIFBURXMgdGhpcyBpcyBoYW5kbGVkIGJ5IHNldHRpbmcgdGhlIHB0ZV9zcGVjaWFs
IGJpdCwKPj4gYnV0IGZvciB0aGUgaHVnZSBQVURzIGFuZCBQTURzLCB3ZSBoYXZlIG5laXRoZXIg
cG1kX3NwZWNpYWwgbm9yCj4+IHB1ZF9zcGVjaWFsLiBOb3JtYWxseSwgaHVnZSBUVE0gZW50cmll
cyBhcmUgaWRlbnRpZmllZCBieSBsb29raW5nIGF0Cj4+IHZtYV9pc19zcGVjaWFsX2h1Z2UoKSwg
YnV0IGZhc3QgZ3VwIGNhbid0IGRvIHRoYXQsIHNvIGFzIGFuIGFsdGVybmF0aXZlCj4+IGRlZmlu
ZSBfZGV2bWFwIGVudHJpZXMgZm9yIHdoaWNoIHRoZXJlIGFyZSBubyBiYWNraW5nIGRldl9wYWdl
bWFwIGFzCj4+IHNwZWNpYWwsIHVwZGF0ZSBkb2N1bWVudGF0aW9uIGFuZCBtYWtlIGh1Z2UgVFRN
IGVudHJpZXMgX2Rldm1hcCwgYWZ0ZXIKPj4gdmVyaWZ5aW5nIHRoYXQgdGhlcmUgaXMgbm8gYmFj
a2luZyBkZXZfcGFnZW1hcC4KPj4KPj4gT25lIG90aGVyIGFsdGVybmF0aXZlIHdvdWxkIGJlIHRv
IGJsb2NrIFRUTSBodWdlIHBhZ2UtdGFibGUtZW50cmllcwo+PiBjb21wbGV0ZWx5LCBhbmQgd2hp
bGUgY3VycmVudGx5IG9ubHkgdm13Z2Z4IHVzZSB0aGVtLCB0aGV5IHdvdWxkIGJlCj4+IGJlbmVm
aWNpYWwgdG8gb3RoZXIgZ3JhcGhpcyBkcml2ZXJzIG1vdmluZyBmb3J3YXJkIGFzIHdlbGwuCj4+
Cj4+IENjOiBDaHJpc3RpYW4gS29lbmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4+IENj
OiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4+IENjOiBEYW5pZWwgVmV0dGVyIDxk
YW5pZWxAZmZ3bGwuY2g+Cj4+IENjOiBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZvdW5kYXRp
b24ub3JnPgo+PiBDYzogSmFzb24gR3VudGhvcnBlIDxqZ2dAbnZpZGlhLmNvbT4KPj4gQ2M6IGxp
bnV4LW1tQGt2YWNrLm9yZwo+PiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+
PiBDYzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwo+PiBTaWduZWQtb2ZmLWJ5OiBUaG9t
YXMgSGVsbHN0csO2bSAoSW50ZWwpIDx0aG9tYXNfb3NAc2hpcG1haWwub3JnPgo+PiAtLS0KPj4g
ICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192bS5jIHwgMTcgKysrKysrKysrKysrKysrKy0K
Pj4gICBtbS9ndXAuYyAgICAgICAgICAgICAgICAgICAgICAgIHwgMjEgKysrKysrKysrKystLS0t
LS0tLS0tCj4+ICAgbW0vbWVtcmVtYXAuYyAgICAgICAgICAgICAgICAgICB8ICA1ICsrKysrCj4+
ICAgMyBmaWxlcyBjaGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKPj4K
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMgYi9kcml2ZXJz
L2dwdS9kcm0vdHRtL3R0bV9ib192bS5jCj4+IGluZGV4IDZkYzk2Y2Y2Njc0NC4uMWMzNDk4MzQ4
MGU1IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192bS5jCj4+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMKPj4gQEAgLTE5NSw2ICsxOTUsNyBA
QCBzdGF0aWMgdm1fZmF1bHRfdCB0dG1fYm9fdm1faW5zZXJ0X2h1Z2Uoc3RydWN0IHZtX2ZhdWx0
ICp2bWYsCj4+ICAgCXBmbl90IHBmbnQ7Cj4+ICAgCXN0cnVjdCB0dG1fdHQgKnR0bSA9IGJvLT50
dG07Cj4+ICAgCWJvb2wgd3JpdGUgPSB2bWYtPmZsYWdzICYgRkFVTFRfRkxBR19XUklURTsKPj4g
KwlzdHJ1Y3QgZGV2X3BhZ2VtYXAgKnBhZ2VtYXA7Cj4+ICAgCj4+ICAgCS8qIEZhdWx0IHNob3Vs
ZCBub3QgY3Jvc3MgYm8gYm91bmRhcnkuICovCj4+ICAgCXBhZ2Vfb2Zmc2V0ICY9IH4oZmF1bHRf
cGFnZV9zaXplIC0gMSk7Cj4+IEBAIC0yMTAsNiArMjExLDIwIEBAIHN0YXRpYyB2bV9mYXVsdF90
IHR0bV9ib192bV9pbnNlcnRfaHVnZShzdHJ1Y3Qgdm1fZmF1bHQgKnZtZiwKPj4gICAJaWYgKChw
Zm4gJiAoZmF1bHRfcGFnZV9zaXplIC0gMSkpICE9IDApCj4+ICAgCQlnb3RvIG91dF9mYWxsYmFj
azsKPj4gICAKPj4gKwkvKgo+PiArCSAqIEh1Z2UgZW50cmllcyBtdXN0IGJlIHNwZWNpYWwsIHRo
YXQgaXMgbWFya2luZyB0aGVtIGFzIGRldm1hcAo+PiArCSAqIHdpdGggbm8gYmFja2luZyBkZXZp
Y2UgbWFwIHJhbmdlLiBJZiB0aGVyZSBpcyBhIGJhY2tpbmcKPj4gKwkgKiByYW5nZSwgRG9uJ3Qg
aW5zZXJ0IGEgaHVnZSBlbnRyeS4KPj4gKwkgKiBJZiB0aGlzIGNoZWNrIHR1cm5zIG91dCB0byBi
ZSB0b28gbXVjaCBvZiBhIHBlcmZvcm1hbmNlIGhpdCwKPj4gKwkgKiB3ZSBjYW4gaW5zdGVhZCBo
YXZlIGRyaXZlcnMgaW5kaWNhdGUgd2hldGhlciB0aGV5IG1heSBoYXZlCj4+ICsJICogYmFja2lu
ZyBkZXZpY2UgbWFwIHJhbmdlcyBhbmQgaWYgbm90LCBza2lwIHRoaXMgbG9va3VwLgo+PiArCSAq
Lwo+IEkgdGhpbmsgd2UgY2FuIGRvIHRoaXMgc3RhdGljYWxseToKPiAtIGlmIGl0J3Mgc3lzdGVt
IG1lbW9yeSB3ZSBrbm93IHRoZXJlJ3Mgbm8gZGV2bWFwIGZvciBpdCwgYW5kIHdlIGRvIHRoZQo+
ICAgIHRyaWNrIHRvIGJsb2NrIGd1cF9mYXN0ClllcywgdGhhdCBzaG91bGQgd29yay4KPiAtIGlm
IGl0J3MgaW9tZW0sIHdlIGtub3cgZ3VwX2Zhc3Qgd29udCB3b3JrIGFueXdheSBpZiBkb24ndCBz
ZXQgUEZOX0RFViwKPiAgICBzbyBtaWdodCBhcyB3ZWxsIG5vdCBkbyB0aGF0CgpJIHRoaW5rIGd1
cF9mYXN0IHdpbGwgdW5mb3J0dW5hdGVseSBtaXN0YWtlIGEgaHVnZSBpb21lbSBwYWdlIGZvciBh
biAKb3JkaW5hcnkgcGFnZSBhbmQgdHJ5IHRvIGFjY2VzcyBhIG5vbi1leGlzdGFudCBzdHJ1Y3Qg
cGFnZSBmb3IgaXQsIAp1bmxlc3Mgd2UgZG8gdGhlIGRldm1hcCB0cmljay4KCkFuZCB0aGUgbG9v
a3VwIHdvdWxkIHRoZW4gYmUgZm9yIHRoZSByYXJlIGNhc2Ugd2hlcmUgYSBkcml2ZXIgd291bGQg
aGF2ZSAKYWxyZWFkeSByZWdpc3RlcmVkIGEgZGV2X3BhZ2VtYXAgZm9yIGFuIGlvbWVtIGFyZWEg
d2hpY2ggbWF5IGFsc28gYmUgCm1hcHBlZCB0aHJvdWdoIFRUTSAobGlrZSB0aGUgcGF0Y2ggZnJv
bSBGZWxpeCBhIGNvdXBsZSBvZiB3ZWVrcyBhZ28pLiBJZiAKYSBkcml2ZXIgY2FuIHByb21pc2Ug
bm90IHRvIGRvIHRoYXQsIHRoZW4gd2UgY2FuIHNhZmVseSByZW1vdmUgdGhlIGxvb2t1cC4KCi9U
aG9tYXMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
