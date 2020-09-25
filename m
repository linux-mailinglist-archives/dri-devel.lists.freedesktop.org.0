Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA4127A82E
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 09:07:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 288006E334;
	Mon, 28 Sep 2020 07:06:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B7E46EB29;
 Fri, 25 Sep 2020 13:40:12 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f6df32e0000>; Fri, 25 Sep 2020 06:39:58 -0700
Received: from [172.27.1.66] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 25 Sep
 2020 13:39:56 +0000
Subject: Re: [Intel-gfx] [PATCH rdma-next v3 1/2] lib/scatterlist: Add support
 in dynamic allocation of SG table from pages
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Jason Gunthorpe
 <jgg@nvidia.com>, Leon Romanovsky <leon@kernel.org>
References: <20200922083958.2150803-1-leon@kernel.org>
 <20200922083958.2150803-2-leon@kernel.org>
 <118a03ef-d160-e202-81cc-16c9c39359fc@linux.intel.com>
 <20200925071330.GA2280698@unreal> <20200925115544.GY9475@nvidia.com>
 <65ca566b-7a5e-620f-13a4-c59eb836345a@nvidia.com>
 <33942b10-8eef-9180-44c5-b7379b92b824@linux.intel.com>
From: Maor Gottlieb <maorg@nvidia.com>
Message-ID: <9d69d68d-7868-609b-c703-dfe9fec93a0f@nvidia.com>
Date: Fri, 25 Sep 2020 16:39:53 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.1
MIME-Version: 1.0
In-Reply-To: <33942b10-8eef-9180-44c5-b7379b92b824@linux.intel.com>
Content-Language: en-US
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1601041198; bh=I3MevVq0rfThlib9stYezAlO6VoXyq/abMk8uS5Rf30=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 Content-Language:X-Originating-IP:X-ClientProxiedBy;
 b=cT03BzeJw3AnIIrmEndxMyFxZGs1x1e+luerBaV6utLXOQpxqyHE0J35I/xDt+xhQ
 nR5XsHMTcB0Sg+P7pyDrtOk1sPUxKgkwNxDjh5LrmwZNkflEO0B+KyIXAPtShuGdZp
 BAkM4kyDxQzdIawJgqR//5croKMPwX5+yyb7UibsGX7XYCgs5+KQQNnOr3xu1koFWo
 l66mYjr0hXJexrdgIiX4ZJXsHGEllajD/0UevEWQGSQk7XBJszxIYwaFw0yubCntpL
 oG5dpHOEhdPi1skYh5ja8JQdJ+bII9s7XSD/ihYM9L8T/rsdj8ZZifbMGapnVBN7QJ
 rq56RmEyRwkhA==
X-Mailman-Approved-At: Mon, 28 Sep 2020 07:06:24 +0000
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
Cc: linux-rdma@vger.kernel.org, intel-gfx@lists.freedesktop.org, Roland
 Scheidegger <sroland@vmware.com>, dri-devel@lists.freedesktop.org,
 Maor Gottlieb <maorg@mellanox.com>, David
 Airlie <airlied@linux.ie>, Doug Ledford <dledford@redhat.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDkvMjUvMjAyMCAzOjMzIFBNLCBUdnJ0a28gVXJzdWxpbiB3cm90ZToKPgo+IE9uIDI1LzA5
LzIwMjAgMTM6MTgsIE1hb3IgR290dGxpZWIgd3JvdGU6Cj4+IE9uIDkvMjUvMjAyMCAyOjU1IFBN
LCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4+PiBPbiBGcmksIFNlcCAyNSwgMjAyMCBhdCAxMDox
MzozMEFNICswMzAwLCBMZW9uIFJvbWFub3Zza3kgd3JvdGU6Cj4+Pj4+PiBkaWZmIC0tZ2l0IGEv
dG9vbHMvdGVzdGluZy9zY2F0dGVybGlzdC9tYWluLmMgCj4+Pj4+PiBiL3Rvb2xzL3Rlc3Rpbmcv
c2NhdHRlcmxpc3QvbWFpbi5jCj4+Pj4+PiBpbmRleCAwYTE0NjQxODEyMjYuLjQ4OTkzNTlhMzFh
YyAxMDA2NDQKPj4+Pj4+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2NhdHRlcmxpc3QvbWFpbi5jCj4+
Pj4+PiBAQCAtNTUsMTQgKzU1LDEzIEBAIGludCBtYWluKHZvaWQpCj4+Pj4+PiDCoMKgwqDCoMKg
wqAgZm9yIChpID0gMCwgdGVzdCA9IHRlc3RzOyB0ZXN0LT5leHBlY3RlZF9zZWdtZW50czsgdGVz
dCsrLCAKPj4+Pj4+IGkrKykgewo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IHBh
Z2UgKnBhZ2VzW01BWF9QQUdFU107Cj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3Qg
c2dfdGFibGUgc3Q7Cj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqAgaW50IHJldDsKPj4+Pj4+ICvCoMKg
wqDCoMKgwqDCoCBzdHJ1Y3Qgc2NhdHRlcmxpc3QgKnNnOwo+Pj4+Pj4KPj4+Pj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHNldF9wYWdlcyhwYWdlcywgdGVzdC0+cGZuLCB0ZXN0LT5udW1fcGFnZXMp
Owo+Pj4+Pj4KPj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCByZXQgPSBfX3NnX2FsbG9jX3RhYmxlX2Zy
b21fcGFnZXMoJnN0LCBwYWdlcywgCj4+Pj4+PiB0ZXN0LT5udW1fcGFnZXMsCj4+Pj4+PiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMCwgdGVzdC0+
c2l6ZSwgdGVzdC0+bWF4X3NlZywKPj4+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBHRlBfS0VSTkVMKTsKPj4+Pj4+IC3CoMKgwqDCoMKgwqDC
oCBhc3NlcnQocmV0ID09IHRlc3QtPmFsbG9jX3JldCk7Cj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAg
c2cgPSBfX3NnX2FsbG9jX3RhYmxlX2Zyb21fcGFnZXMoJnN0LCBwYWdlcywgCj4+Pj4+PiB0ZXN0
LT5udW1fcGFnZXMsIDAsCj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRl
c3QtPnNpemUsIHRlc3QtPm1heF9zZWcsIE5VTEwsIDAsIEdGUF9LRVJORUwpOwo+Pj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgIGFzc2VydChQVFJfRVJSX09SX1pFUk8oc2cpID09IHRlc3QtPmFsbG9jX3Jl
dCk7Cj4+Pj4+IFNvbWUgdGVzdCBjb3ZlcmFnZSBmb3IgcmVsYXRpdmVseSBjb21wbGV4IGNvZGUg
d291bGQgYmUgdmVyeSAKPj4+Pj4gd2VsY29tZWQuIFNpbmNlCj4+Pj4+IHRoZSB0ZXN0aW5nIGZy
YW1ld29yayBpcyBhbHJlYWR5IHRoZXJlLCBldmVuIGlmIGl0IGJpdC1yb3R0ZWQgYSAKPj4+Pj4g
Yml0LCBidXQKPj4+Pj4gc2hvdWxkbid0IGJlIGhhcmQgdG8gZml4Lgo+Pj4+Pgo+Pj4+PiBBIGZl
dyB0ZXN0cyB0byBjaGVjayBhcHBlbmQvZ3JvdyB3b3JrcyBhcyBleHBlY3RlZCwgaW4gdGVybXMg
b2YgCj4+Pj4+IGhvdyB0aGUgZW5kCj4+Pj4+IHRhYmxlIGxvb2tzIGxpa2UgZ2l2ZW4gdGhlIGlu
aXRpYWwgc3RhdGUgYW5kIHNvbWUgZGlmZmVyZW50IHBhZ2UgCj4+Pj4+IHBhdHRlcm5zCj4+Pj4+
IGFkZGVkIHRvIGl0LiBBbmQgYm90aCBjcm9zc2luZyBhbmQgbm90IGNyb3NzaW5nIGludG8gc2cg
Y2hhaW5pbmcgCj4+Pj4+IHNjZW5hcmlvcy4KPj4+PiBUaGlzIGZ1bmN0aW9uIGlzIGJhc2ljIGZv
ciBhbGwgUkRNQSBkZXZpY2VzIGFuZCB3ZSBhcmUgcHJldHR5IAo+Pj4+IGNvbmZpZGVudAo+Pj4+
IHRoYXQgdGhlIG9sZCBhbmQgbmV3IGZsb3dzIGFyZSB0ZXN0ZWQgdGhvcm91Z2hseS4KPj4+IFdl
bGwsIHNpbmNlIDAtZGF5IGlzIHJlcG9ydGluZyB0aGF0IF9faTkxNV9nZW1fdXNlcnB0cl9hbGxv
Y19wYWdlcyBpcwo+Pj4gY3Jhc2hpbmcgb24gdGhpcywgaXQgcHJvYmFibHkgZG9lcyBuZWVkIHNv
bWUgdGVzdHMgOlwKPj4+Cj4+PiBKYXNvbgo+Pgo+PiBJdCBpcyBjcmFzaGluZyBpbiB0aGUgcmVn
dWxhciBvbGQgZmxvdyB3aGljaCBhbHJlYWR5IHRlc3RlZC4KPj4gSG93ZXZlciwgSSB3aWxsIGFk
ZCBtb3JlIHRlc3RzLgo+Cj4gRG8geW91IHdhbnQgdG8gdGFrZSBzb21lIG9mIHRoZSBjb21taXRz
IGZyb20gCj4gZ2l0Oi8vcGVvcGxlLmZyZWVkZXNrdG9wLm9yZy9+dHVyc3VsaW4vZHJtLWludGVs
IHNndGVzdD8gSXQgd291bGQgYmUgCj4gZmluZSBieSBtZS4gSSBjYW4gY2xlYW4gdXAgdGhlIGNv
bW1pdCBtZXNzYWdlcyBpZiB5b3Ugd2FudC4KCkkgd2lsbCB2ZXJ5IGFwcHJlY2lhdGUgaXQuIFRo
YW5rcwo+Cj4gaHR0cHM6Ly9jZ2l0LmZyZWVkZXNrdG9wLm9yZy9+dHVyc3VsaW4vZHJtLWludGVs
L2NvbW1pdC8/aD1zZ3Rlc3QmaWQ9NzkxMDJmNGQ3OTVjNDc2OTQzMWZjNDRhNmNmN2VkNWM1YjFi
NTIxNCAKPiAtIHRoaXMgb25lIHVuZG9lcyB0aGUgYml0IHJvdCBhbmQgbWFrZXMgdGhlIHRlc3Qg
anVzdCB3b3JrIG9uIHRoZSAKPiBjdXJyZW50IGtlcm5lbC4KPgo+IGh0dHBzOi8vY2dpdC5mcmVl
ZGVza3RvcC5vcmcvfnR1cnN1bGluL2RybS1pbnRlbC9jb21taXQvP2g9c2d0ZXN0JmlkPWIwOWJm
ZTgwNDg2YzRkOTNlZTFkOGFlMTdkNWI0NjM5N2IxYzZlZTEgCj4gLSB0aGlzIG9uZSB5b3UgcHJv
YmFibHkgc2hvdWxkIHNxdWFzaCBpbiB5b3VyIHBhdGNoLiBNaW51cyB0aGUgemVyb2luZyAKPiBv
ZiBzdHJ1Y3Qgc2dfc3RhYmxlIHNpbmNlIHRoYXQgd291bGQgaGlkZSB0aGUgaXNzdWUuCj4KPiBo
dHRwczovL2NnaXQuZnJlZWRlc2t0b3Aub3JnL350dXJzdWxpbi9kcm0taW50ZWwvY29tbWl0Lz9o
PXNndGVzdCZpZD05N2Y1ZGYzN2U2MTJmNzk4Y2VkOTA1NDFlZWNlMTNlMmVmNjM5MTgxIAo+IC0g
ZmluYWwgY29tbWl0IGlzIG9wdGlvbmFsIGJ1dCBJIGd1ZXNzIGhhbmR5IGZvciBkZWJ1Z2dpbmcu
Cj4KPiBSZWdhcmRzLAo+Cj4gVHZydGtvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
