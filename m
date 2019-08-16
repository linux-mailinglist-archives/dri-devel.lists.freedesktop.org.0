Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8BE91167
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:25:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3B426EA84;
	Sat, 17 Aug 2019 15:24:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 784E46E151
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 08:31:22 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8992528;
 Fri, 16 Aug 2019 01:31:21 -0700 (PDT)
Received: from [10.1.196.133] (e112269-lin.cambridge.arm.com [10.1.196.133])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7CCE73F718;
 Fri, 16 Aug 2019 01:31:20 -0700 (PDT)
Subject: Re: [PATCH -next] drm/panfrost: Fix missing unlock on error in
 panfrost_mmu_map_fault_addr()
To: Wei Yongjun <weiyongjun1@huawei.com>, Rob Herring <robh@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20190814044814.102294-1-weiyongjun1@huawei.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <ee7063ab-6dd9-0854-3b25-0617d194bfec@arm.com>
Date: Fri, 16 Aug 2019 09:31:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190814044814.102294-1-weiyongjun1@huawei.com>
Content-Language: en-GB
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTQvMDgvMjAxOSAwNTo0OCwgV2VpIFlvbmdqdW4gd3JvdGU6Cj4gQWRkIHRoZSBtaXNzaW5n
IHVubG9jayBiZWZvcmUgcmV0dXJuIGZyb20gZnVuY3Rpb24gcGFuZnJvc3RfbW11X21hcF9mYXVs
dF9hZGRyKCkKPiBpbiB0aGUgZXJyb3IgaGFuZGxpbmcgY2FzZS4KPiAKPiBGaXhlczogMTg3ZDI5
MjkyMDZlICgiZHJtL3BhbmZyb3N0OiBBZGQgc3VwcG9ydCBmb3IgR1BVIGhlYXAgYWxsb2NhdGlv
bnMiKQo+IFNpZ25lZC1vZmYtYnk6IFdlaSBZb25nanVuIDx3ZWl5b25nanVuMUBodWF3ZWkuY29t
PgoKV2VsbCBzcG90dGVkLgoKUmV2aWV3ZWQtYnk6IFN0ZXZlbiBQcmljZSA8c3RldmVuLnByaWNl
QGFybS5jb20+CgpTdGV2ZQoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZy
b3N0X21tdS5jIHwgNSArKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9w
YW5mcm9zdF9tbXUuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9tbXUuYwo+
IGluZGV4IDJlZDQxMWYwOWQ4MC4uMDZmMWE1NjNlOTQwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9tbXUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9w
YW5mcm9zdC9wYW5mcm9zdF9tbXUuYwo+IEBAIC0zMjcsMTQgKzMyNywxNyBAQCBpbnQgcGFuZnJv
c3RfbW11X21hcF9mYXVsdF9hZGRyKHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2LCBpbnQg
YXMsIHU2NCBhZGRyKQo+ICAJaWYgKCFiby0+YmFzZS5wYWdlcykgewo+ICAJCWJvLT5zZ3RzID0g
a3ZtYWxsb2NfYXJyYXkoYm8tPmJhc2UuYmFzZS5zaXplIC8gU1pfMk0sCj4gIAkJCQkgICAgIHNp
emVvZihzdHJ1Y3Qgc2dfdGFibGUpLCBHRlBfS0VSTkVMIHwgX19HRlBfWkVSTyk7Cj4gLQkJaWYg
KCFiby0+c2d0cykKPiArCQlpZiAoIWJvLT5zZ3RzKSB7Cj4gKwkJCW11dGV4X3VubG9jaygmYm8t
PmJhc2UucGFnZXNfbG9jayk7Cj4gIAkJCXJldHVybiAtRU5PTUVNOwo+ICsJCX0KPiAgCj4gIAkJ
cGFnZXMgPSBrdm1hbGxvY19hcnJheShiby0+YmFzZS5iYXNlLnNpemUgPj4gUEFHRV9TSElGVCwK
PiAgCQkJCSAgICAgICBzaXplb2Yoc3RydWN0IHBhZ2UgKiksIEdGUF9LRVJORUwgfCBfX0dGUF9a
RVJPKTsKPiAgCQlpZiAoIXBhZ2VzKSB7Cj4gIAkJCWtmcmVlKGJvLT5zZ3RzKTsKPiAgCQkJYm8t
PnNndHMgPSBOVUxMOwo+ICsJCQltdXRleF91bmxvY2soJmJvLT5iYXNlLnBhZ2VzX2xvY2spOwo+
ICAJCQlyZXR1cm4gLUVOT01FTTsKPiAgCQl9Cj4gIAkJYm8tPmJhc2UucGFnZXMgPSBwYWdlczsK
PiAKPiAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
