Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E13C02C994F
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 09:24:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37E976E4E6;
	Tue,  1 Dec 2020 08:23:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CB846E48D
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 12:26:30 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Cl4Fs2JcjzLxpb;
 Mon, 30 Nov 2020 20:25:53 +0800 (CST)
Received: from [10.174.177.149] (10.174.177.149) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.487.0; Mon, 30 Nov 2020 20:26:21 +0800
Subject: Re: [PATCH] drm/panfrost: fix reference leak in panfrost_job_hw_submit
To: Steven Price <steven.price@arm.com>, Alyssa Rosenzweig
 <alyssa.rosenzweig@collabora.com>, David Airlie <airlied@linux.ie>, "Daniel
 Vetter" <daniel@ffwll.ch>
References: <20201127094441.121094-1-miaoqinglang@huawei.com>
 <46d1944e-fbbe-075f-1c5b-356b5ce73ee0@arm.com>
From: Qinglang Miao <miaoqinglang@huawei.com>
Message-ID: <f01d1ce8-8711-f23a-0c7d-7c6870b5ba3a@huawei.com>
Date: Mon, 30 Nov 2020 20:26:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <46d1944e-fbbe-075f-1c5b-356b5ce73ee0@arm.com>
X-Originating-IP: [10.174.177.149]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 01 Dec 2020 08:23:37 +0000
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
Cc: dri-devel@lists.freedesktop.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgrlnKggMjAyMC8xMS8yNyAxODowNiwgU3RldmVuIFByaWNlIOWGmemBkzoKPiBPbiAyNy8xMS8y
MDIwIDA5OjQ0LCBRaW5nbGFuZyBNaWFvIHdyb3RlOgo+PiBwbV9ydW50aW1lX2dldF9zeW5jIHdp
bGwgaW5jcmVtZW50IHBtIHVzYWdlIGNvdW50ZXIgZXZlbiBpdAo+PiBmYWlsZWQuIEZvcmdldHRp
bmcgdG8gcHV0dGluZyBvcGVyYXRpb24gd2lsbCByZXN1bHQgaW4gYQo+PiByZWZlcmVuY2UgbGVh
ayBoZXJlLgo+Pgo+PiBBIG5ldyBmdW5jdGlvbiBwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0IGlz
IGludHJvZHVjZWQgaW4KPj4gWzBdIHRvIGtlZXAgdXNhZ2UgY291bnRlciBiYWxhbmNlZC4gU28g
V2UgZml4IHRoZSByZWZlcmVuY2UKPj4gbGVhayBieSByZXBsYWNpbmcgaXQgd2l0aCBuZXcgZnVu
dGlvbi4KPj4KPj4gWzBdIGRkODA4OGQ1YTg5NiAoIlBNOiBydW50aW1lOiBBZGTCoCBwbV9ydW50
aW1lX3Jlc3VtZV9hbmRfZ2V0IHRvIGRlYWwgCj4+IHdpdGggdXNhZ2UgY291bnRlciIpCj4+Cj4+
IEZpeGVzOiBmM2JhOTEyMjhlOGUgKCJkcm0vcGFuZnJvc3Q6IEFkZCBpbml0aWFsIHBhbmZyb3N0
IGRyaXZlciIpCj4+IFJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxodWxrY2lAaHVhd2VpLmNvbT4K
Pj4gU2lnbmVkLW9mZi1ieTogUWluZ2xhbmcgTWlhbyA8bWlhb3FpbmdsYW5nQGh1YXdlaS5jb20+
Cj4+IC0tLQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rfam9iLmMgfCAy
ICstCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+
Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2pvYi5j
IAo+PiBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9qb2IuYwo+PiBpbmRleCAz
MGU3YjcxOTYuLjA0Y2YzYmI2NyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmZy
b3N0L3BhbmZyb3N0X2pvYi5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5m
cm9zdF9qb2IuYwo+PiBAQCAtMTQ3LDcgKzE0Nyw3IEBAIHN0YXRpYyB2b2lkIHBhbmZyb3N0X2pv
Yl9od19zdWJtaXQoc3RydWN0IAo+PiBwYW5mcm9zdF9qb2IgKmpvYiwgaW50IGpzKQo+PiDCoMKg
wqDCoMKgIHBhbmZyb3N0X2RldmZyZXFfcmVjb3JkX2J1c3koJnBmZGV2LT5wZmRldmZyZXEpOwo+
PiAtwqDCoMKgIHJldCA9IHBtX3J1bnRpbWVfZ2V0X3N5bmMocGZkZXYtPmRldik7Cj4+ICvCoMKg
wqAgcmV0ID0gcG1fcnVudGltZV9yZXN1bWVfYW5kX2dldChwZmRldi0+ZGV2KTsKPiAKPiBTb3Jy
eSwgYnV0IGluIHRoaXMgY2FzZSB0aGlzIGNoYW5nZSBpc24ndCBjb3JyZWN0LiAKPiBwYW5mcm9z
dF9qb2JfaHdfc3VibWl0KCkgaXMgZXhwZWN0ZWQgdG8gYmUgdW5iYWxhbmNlZCAodGhlIFBNIHJl
ZmVyZW5jZSAKPiBjb3VudCBpcyBleHBlY3RlZCB0byBiZSBpbmNyZW1lbnRlZCBvbiByZXR1cm4p
Lgo+IAo+IEluIHRoZSBjYXNlIHdoZXJlIHBtX3J1bnRpbWVfZ2V0X3N5bmMoKSBmYWlscywgdGhl
IGpvYiB3aWxsIGV2ZW50dWFsbHkgCj4gdGltZW91dCwgYW5kIHRoZXJlJ3MgYSBjb3JyZXNwb25k
aW5nIHBtX3J1bnRpbWVfcHV0X25vaWRsZSgpIGluIAo+IHBhbmZyb3N0X3Jlc2V0KCkuCj4gCj4g
UG90ZW50aWFsbHkgdGhpcyBjb3VsZCBiZSBoYW5kbGVkIGJldHRlciAoZS5nLiB3aXRob3V0IHdh
aXRpbmcgZm9yIHRoZSAKPiB0aW1lb3V0IHRvIG9jY3VyKSwgYnV0IGVxdWFsbHkgdGhpcyBpc24n
dCBzb21ldGhpbmcgd2UgZXhwZWN0IHRvIGhhcHBlbiAKPiBpbiBub3JtYWwgb3BlcmF0aW9uKS4K
PiAKPiBTdGV2ZQpTb3JyeSwgSSBkaWRuJ3Qgbm90aWNlIHRoZSBwbV9ydW50aW1lX3B1dF9ub2lk
bGUoKSBpbiAKcGFuZnJvc3Rfam9iX3RpbWVkb3V0KCkgYmVmb3JlLgoKVGhhbmtzIGZvciB5b3Vy
IHJlcGx5Lgo+IAo+PiDCoMKgwqDCoMKgIGlmIChyZXQgPCAwKQo+PiDCoMKgwqDCoMKgwqDCoMKg
wqAgcmV0dXJuOwo+Pgo+IAo+IC4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
