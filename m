Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02034289FC5
	for <lists+dri-devel@lfdr.de>; Sat, 10 Oct 2020 12:03:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5DCF6EE94;
	Sat, 10 Oct 2020 10:02:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1064 seconds by postgrey-1.36 at gabe;
 Sat, 10 Oct 2020 02:05:52 UTC
Received: from huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EF3E6EE84
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Oct 2020 02:05:51 +0000 (UTC)
Received: from dggeme701-chm.china.huawei.com (unknown [172.30.72.56])
 by Forcepoint Email with ESMTP id 13048AE1962DDEAB5EEF;
 Sat, 10 Oct 2020 09:48:05 +0800 (CST)
Received: from dggeme753-chm.china.huawei.com (10.3.19.99) by
 dggeme701-chm.china.huawei.com (10.1.199.97) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Sat, 10 Oct 2020 09:48:04 +0800
Received: from dggeme753-chm.china.huawei.com ([10.7.64.70]) by
 dggeme753-chm.china.huawei.com ([10.7.64.70]) with mapi id 15.01.1913.007;
 Sat, 10 Oct 2020 09:48:04 +0800
From: linmiaohe <linmiaohe@huawei.com>
To: Jason Gunthorpe <jgg@ziepe.ca>, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 1/6] mm: mmap: fix fput in error path
Thread-Topic: [PATCH 1/6] mm: mmap: fix fput in error path
Thread-Index: Adaepvk8rUjyciszTlSJPQkfAqFrDg==
Date: Sat, 10 Oct 2020 01:48:04 +0000
Message-ID: <94449b58fbcf474488f144c38d51418f@huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.177.16]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sat, 10 Oct 2020 10:02:57 +0000
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
Cc: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "chris@chris-wilson.co.uk" <chris@chris-wilson.co.uk>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "willy@infradead.org" <willy@infradead.org>,
 "jhubbard@nvidia.com" <jhubbard@nvidia.com>,
 "airlied@redhat.com" <airlied@redhat.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SmFzb24gR3VudGhvcnBlIDxqZ2dAemllcGUuY2E+IHdyb3RlOg0KPiBPbiBGcmksIE9jdCAwOSwg
MjAyMCBhdCAwMzowNDoyMFBNIC0wNzAwLCBBbmRyZXcgTW9ydG9uIHdyb3RlOg0KPj4gT24gRnJp
LCAgOSBPY3QgMjAyMCAxNzowMzozNyArMDIwMCAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNrb2VuaWcu
bGVpY2h0enVtZXJrZW5AZ21haWwuY29tPiB3cm90ZToNCj4+IA0KPj4gPiBQYXRjaCAiNDk1YzEw
Y2MxYzBjIENIUk9NSVVNOiBkbWEtYnVmOiByZXN0b3JlIGFyZ3MuLi4iDQo+PiA+IGFkZHMgYSB3
b3JrYXJvdW5kIGZvciBhIGJ1ZyBpbiBtbWFwX3JlZ2lvbi4NCj4+ID4gDQo+PiA+IEFzIHRoZSBj
b21tZW50IHN0YXRlcyAtPm1tYXAoKSBjYWxsYmFjayBjYW4gY2hhbmdlDQo+PiA+IHZtYS0+dm1f
ZmlsZSBhbmQgc28gd2UgbWlnaHQgY2FsbCBmcHV0KCkgb24gdGhlIHdyb25nIGZpbGUuDQo+PiA+
IA0KPj4gPiBSZXZlcnQgdGhlIHdvcmthcm91bmQgYW5kIHByb3BlciBmaXggdGhpcyBpbiBtbWFw
X3JlZ2lvbi4NCj4+ID4gDQo+PiANCj4+IERvZXNuJ3QgdGhpcyBwYXRjaCBzZXJpZXMgYWRkcmVz
cyB0aGUgc2FtZSB0aGluZyBhcyANCj4+IGh0dHBzOi8vbGttbC5rZXJuZWwub3JnL3IvMjAyMDA5
MTYwOTA3MzMuMzE0MjctMS1saW5taWFvaGVAaHVhd2VpLmNvbT8NCj4NCj5TYW1lIGJhc2ljIGlz
c3VlLCBsb29rcyBsaWtlIGJvdGggb2YgdGhlc2UgcGF0Y2hlcyBzaG91bGQgYmUgY29tYmluZWQg
dG8gcGx1ZyBpdCBmdWxseS4NCj4NCj5KYXNvbiANCg0KSSB0aGluayBzbyB0b28uIEJvdGggb2Yg
dGhlc2UgcGF0Y2hlcyBmaXggdGhlIGZwdXQgYXQgcG9zc2libGUgd3JvbmcgQGZpbGUgZHVlIHRv
IC0+bW1hcCgpIGNhbGxiYWNrIGNhbiBjaGFuZ2Ugdm1hLT52bV9maWxlLg0KDQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
