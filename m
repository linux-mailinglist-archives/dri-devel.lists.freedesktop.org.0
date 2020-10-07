Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9222869EA
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 23:13:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15C036E9B6;
	Wed,  7 Oct 2020 21:13:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AE886E9B6
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 21:13:52 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f7e2f220008>; Wed, 07 Oct 2020 14:12:02 -0700
Received: from [10.2.85.86] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 7 Oct
 2020 21:13:42 +0000
Subject: Re: [PATCH 05/13] mm/frame-vector: Use FOLL_LONGTERM
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
References: <20201007164426.1812530-1-daniel.vetter@ffwll.ch>
 <20201007164426.1812530-6-daniel.vetter@ffwll.ch>
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <fc0ac3fb-2758-bef1-76b4-8ac2449f5743@nvidia.com>
Date: Wed, 7 Oct 2020 14:13:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201007164426.1812530-6-daniel.vetter@ffwll.ch>
Content-Language: en-US
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1602105122; bh=sdL9dWr71OcitQ1QN+LtvleGwHLKlRCYjfX+GmsKdT8=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=UczOXY9to1LCj5AA/vWDFIZSxYcptbOuWof8ytMtikifjWBiV7WFE1SZd1H0LH0fv
 kOKJobR115WCn/yjDIJFRQ+hkcq+2dAKR1e6FJj4MkEmdDzg6N2N4gslr80UJRaZgX
 Lkk41XeM43UGThQQOFlbMX+h/b39dMZd63P9UIGH6zBsVqei7Fx18bJACRBf9osCOy
 57RN8QfMM60XFWH7HJJ2PGtXfTOLsVy5u8w4Kq70u1hUdIgK44rQsExvKhmLL+DdpK
 oxBJseYzqWkzebOA0vrS2YNSZyf8rdAgfIOjGviz66fazstOfGqMqtR5VpaT1zywo3
 jmYuc2NJXDq1A==
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
Cc: linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Jan Kara <jack@suse.cz>, Pawel Osciak <pawel@osciak.com>, kvm@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Tomasz Figa <tfiga@chromium.org>, linux-mm@kvack.org, Kyungmin
 Park <kyungmin.park@samsung.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAvNy8yMCA5OjQ0IEFNLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+IFRoaXMgaXMgdXNlZCBi
eSBtZWRpYS92aWRlYnVmMiBmb3IgcGVyc2lzdGVudCBkbWEgbWFwcGluZ3MsIG5vdCBqdXN0Cj4g
Zm9yIGEgc2luZ2xlIGRtYSBvcGVyYXRpb24gYW5kIHRoZW4gZnJlZWQgYWdhaW4sIHNvIG5lZWRz
Cj4gRk9MTF9MT05HVEVSTS4KPiAKPiBVbmZvcnR1bmF0ZWx5IGN1cnJlbnQgcHVwX2xvY2tlZCBk
b2Vzbid0IHN1cHBvcnQgRk9MTF9MT05HVEVSTSBkdWUgdG8KPiBsb2NraW5nIGlzc3Vlcy4gUmV3
b3JrIHRoZSBjb2RlIHRvIHB1bGwgdGhlIHB1cCBwYXRoIG91dCBmcm9tIHRoZQo+IG1tYXBfc2Vt
IGNyaXRpY2FsIHNlY3Rpb24gYXMgc3VnZ2VzdGVkIGJ5IEphc29uLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+IENjOiBKYXNvbiBH
dW50aG9ycGUgPGpnZ0B6aWVwZS5jYT4KPiBDYzogUGF3ZWwgT3NjaWFrIDxwYXdlbEBvc2NpYWsu
Y29tPgo+IENjOiBNYXJlayBTenlwcm93c2tpIDxtLnN6eXByb3dza2lAc2Ftc3VuZy5jb20+Cj4g
Q2M6IEt5dW5nbWluIFBhcmsgPGt5dW5nbWluLnBhcmtAc2Ftc3VuZy5jb20+Cj4gQ2M6IFRvbWFz
eiBGaWdhIDx0ZmlnYUBjaHJvbWl1bS5vcmc+Cj4gQ2M6IE1hdXJvIENhcnZhbGhvIENoZWhhYiA8
bWNoZWhhYkBrZXJuZWwub3JnPgo+IENjOiBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZvdW5k
YXRpb24ub3JnPgo+IENjOiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+Cj4gQ2M6
IErDqXLDtG1lIEdsaXNzZSA8amdsaXNzZUByZWRoYXQuY29tPgo+IENjOiBKYW4gS2FyYSA8amFj
a0BzdXNlLmN6Pgo+IENjOiBEYW4gV2lsbGlhbXMgPGRhbi5qLndpbGxpYW1zQGludGVsLmNvbT4K
PiBDYzogbGludXgtbW1Aa3ZhY2sub3JnCj4gQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5m
cmFkZWFkLm9yZwo+IENjOiBsaW51eC1zYW1zdW5nLXNvY0B2Z2VyLmtlcm5lbC5vcmcKPiBDYzog
bGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnCj4gLS0tCj4gICBtbS9mcmFtZV92ZWN0b3IuYyB8
IDM2ICsrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAgMSBmaWxlIGNoYW5n
ZWQsIDExIGluc2VydGlvbnMoKyksIDI1IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9t
bS9mcmFtZV92ZWN0b3IuYyBiL21tL2ZyYW1lX3ZlY3Rvci5jCj4gaW5kZXggMTBmODJkNTY0M2I2
Li4zOWRiNTIwYTUxZGMgMTAwNjQ0Cj4gLS0tIGEvbW0vZnJhbWVfdmVjdG9yLmMKPiArKysgYi9t
bS9mcmFtZV92ZWN0b3IuYwo+IEBAIC0zOCw3ICszOCw2IEBAIGludCBnZXRfdmFkZHJfZnJhbWVz
KHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGludCBucl9mcmFtZXMsCj4gICAJc3RydWN0
IHZtX2FyZWFfc3RydWN0ICp2bWE7Cj4gICAJaW50IHJldCA9IDA7Cj4gICAJaW50IGVycjsKPiAt
CWludCBsb2NrZWQ7Cj4gICAKPiAgIAlpZiAobnJfZnJhbWVzID09IDApCj4gICAJCXJldHVybiAw
Owo+IEBAIC00OCwzNSArNDcsMjIgQEAgaW50IGdldF92YWRkcl9mcmFtZXModW5zaWduZWQgbG9u
ZyBzdGFydCwgdW5zaWduZWQgaW50IG5yX2ZyYW1lcywKPiAgIAo+ICAgCXN0YXJ0ID0gdW50YWdn
ZWRfYWRkcihzdGFydCk7Cj4gICAKPiArCXJldCA9IHBpbl91c2VyX3BhZ2VzX2Zhc3Qoc3RhcnQs
IG5yX2ZyYW1lcywKPiArCQkJCSAgRk9MTF9GT1JDRSB8IEZPTExfV1JJVEUgfCBGT0xMX0xPTkdU
RVJNLAo+ICsJCQkJICAoc3RydWN0IHBhZ2UgKiopKHZlYy0+cHRycykpOwo+ICsJaWYgKHJldCA+
IDApIHsKPiArCQl2ZWMtPmdvdF9yZWYgPSB0cnVlOwo+ICsJCXZlYy0+aXNfcGZucyA9IGZhbHNl
Owo+ICsJCWdvdG8gb3V0X3VubG9ja2VkOwo+ICsJfQoKVGhpcyBwYXJ0IGxvb2tzIGdvb2QsIGFu
ZCBjaGFuZ2luZyB0byBfZmFzdCBpcyBhIHBvdGVudGlhbCBwZXJmb3JtYW5jZSBpbXByb3ZlbWVu
dCwKdG9vLgoKPiArCj4gICAJbW1hcF9yZWFkX2xvY2sobW0pOwo+IC0JbG9ja2VkID0gMTsKPiAg
IAl2bWEgPSBmaW5kX3ZtYV9pbnRlcnNlY3Rpb24obW0sIHN0YXJ0LCBzdGFydCArIDEpOwo+ICAg
CWlmICghdm1hKSB7Cj4gICAJCXJldCA9IC1FRkFVTFQ7Cj4gICAJCWdvdG8gb3V0Owo+ICAgCX0K
PiAgIAo+IC0JLyoKPiAtCSAqIFdoaWxlIGdldF92YWRkcl9mcmFtZXMoKSBjb3VsZCBiZSB1c2Vk
IGZvciB0cmFuc2llbnQgKGtlcm5lbAo+IC0JICogY29udHJvbGxlZCBsaWZldGltZSkgcGlubmlu
ZyBvZiBtZW1vcnkgcGFnZXMgYWxsIGN1cnJlbnQKPiAtCSAqIHVzZXJzIGVzdGFibGlzaCBsb25n
IHRlcm0gKHVzZXJzcGFjZSBjb250cm9sbGVkIGxpZmV0aW1lKQo+IC0JICogcGFnZSBwaW5uaW5n
LiBUcmVhdCBnZXRfdmFkZHJfZnJhbWVzKCkgbGlrZQo+IC0JICogZ2V0X3VzZXJfcGFnZXNfbG9u
Z3Rlcm0oKSBhbmQgZGlzYWxsb3cgaXQgZm9yIGZpbGVzeXN0ZW0tZGF4Cj4gLQkgKiBtYXBwaW5n
cy4KPiAtCSAqLwo+IC0JaWYgKHZtYV9pc19mc2RheCh2bWEpKSB7Cj4gLQkJcmV0ID0gLUVPUE5P
VFNVUFA7Cj4gLQkJZ290byBvdXQ7Cj4gLQl9CgpBcmUgeW91IHN1cmUgd2UgZG9uJ3QgbmVlZCB0
byBjaGVjayB2bWFfaXNfZnNkYXgoKSBhbnltb3JlPwoKPiAtCj4gLQlpZiAoISh2bWEtPnZtX2Zs
YWdzICYgKFZNX0lPIHwgVk1fUEZOTUFQKSkpIHsKPiAtCQl2ZWMtPmdvdF9yZWYgPSB0cnVlOwo+
IC0JCXZlYy0+aXNfcGZucyA9IGZhbHNlOwo+IC0JCXJldCA9IHBpbl91c2VyX3BhZ2VzX2xvY2tl
ZChzdGFydCwgbnJfZnJhbWVzLAo+IC0JCQlndXBfZmxhZ3MsIChzdHJ1Y3QgcGFnZSAqKikodmVj
LT5wdHJzKSwgJmxvY2tlZCk7Cj4gLQkJZ290byBvdXQ7Cj4gLQl9Cj4gLQo+ICAgCXZlYy0+Z290
X3JlZiA9IGZhbHNlOwo+ICAgCXZlYy0+aXNfcGZucyA9IHRydWU7Cj4gICAJZG8gewo+IEBAIC0x
MDEsOCArODcsOCBAQCBpbnQgZ2V0X3ZhZGRyX2ZyYW1lcyh1bnNpZ25lZCBsb25nIHN0YXJ0LCB1
bnNpZ25lZCBpbnQgbnJfZnJhbWVzLAo+ICAgCQl2bWEgPSBmaW5kX3ZtYV9pbnRlcnNlY3Rpb24o
bW0sIHN0YXJ0LCBzdGFydCArIDEpOwo+ICAgCX0gd2hpbGUgKHZtYSAmJiB2bWEtPnZtX2ZsYWdz
ICYgKFZNX0lPIHwgVk1fUEZOTUFQKSk7Cj4gICBvdXQ6Cj4gLQlpZiAobG9ja2VkKQo+IC0JCW1t
YXBfcmVhZF91bmxvY2sobW0pOwo+ICsJbW1hcF9yZWFkX3VubG9jayhtbSk7Cj4gK291dF91bmxv
Y2tlZDoKPiAgIAlpZiAoIXJldCkKPiAgIAkJcmV0ID0gLUVGQVVMVDsKPiAgIAlpZiAocmV0ID4g
MCkKPiAKCkFsbCBvZiB0aGUgZXJyb3IgaGFuZGxpbmcgc3RpbGwgbG9va3MgYWNjdXJhdGUgdGhl
cmUuCgp0aGFua3MsCi0tIApKb2huIEh1YmJhcmQKTlZJRElBCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
