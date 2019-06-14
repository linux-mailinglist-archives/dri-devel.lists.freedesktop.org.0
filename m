Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C598845601
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 09:24:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E93C589885;
	Fri, 14 Jun 2019 07:22:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F94789242;
 Fri, 14 Jun 2019 00:49:03 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d02eeff0000>; Thu, 13 Jun 2019 17:49:03 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Thu, 13 Jun 2019 17:49:02 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Thu, 13 Jun 2019 17:49:02 -0700
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 14 Jun
 2019 00:49:00 +0000
Subject: Re: [PATCH] drm/nouveau/dmem: missing mutex_lock in error path
To: Ralph Campbell <rcampbell@nvidia.com>, Jerome Glisse <jglisse@redhat.com>, 
 David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>, "Jason
 Gunthorpe" <jgg@mellanox.com>
References: <20190614001121.23950-1-rcampbell@nvidia.com>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <1fc63655-985a-0d60-523f-00a51648dc38@nvidia.com>
Date: Thu, 13 Jun 2019 17:49:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190614001121.23950-1-rcampbell@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL104.nvidia.com (172.18.146.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:21:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1560473343; bh=BjedhBHdC+dcOh91aticrwFWw8MgD0WBJkzQKnUq81E=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=TOSu9Iw1C1DyRb5jRymBzYQAVGIJGrsxVJQIolENnFKOatN3JUmcw1Cu7lBtGtE3X
 cc+8Hc1/d7iGZDZFhLxpWRvLO2EQqM/XPuM/S7T68j1IMK3V62F6/Gu/we7U2KMrQH
 TzSpxb5+WvPQsxgC5pSPQYT/yRLTWzMGeZg5F23F2WZiFp6OJSPuZm8DEQAuvOyfgH
 83pDBVFmfiNeFA3osDju1F4Wbw1zBq/ovn9iTiBWwe8XdP86mKRIhfcUwBSb8PDBcM
 FTNPwt4TervNTABgwRII5KXJ/FclnbDfCQfZZWdNIlPs0Rg0xcdClB5AUmpfBYvWgH
 xZac448fVDEKA==
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNi8xMy8xOSA1OjExIFBNLCBSYWxwaCBDYW1wYmVsbCB3cm90ZToKPiBJbiBub3V2ZWF1X2Rt
ZW1fcGFnZXNfYWxsb2MoKSwgdGhlIGRybS0+ZG1lbS0+bXV0ZXggaXMgdW5sb2NrZWQgYmVmb3Jl
Cj4gY2FsbGluZyBub3V2ZWF1X2RtZW1fY2h1bmtfYWxsb2MoKS4KPiBSZWFjcXVpcmUgdGhlIGxv
Y2sgYmVmb3JlIGNvbnRpbnVpbmcgdG8gdGhlIG5leHQgcGFnZS4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBSYWxwaCBDYW1wYmVsbCA8cmNhbXBiZWxsQG52aWRpYS5jb20+Cj4gLS0tCj4gCj4gSSBmb3Vu
ZCB0aGlzIHdoaWxlIHRlc3RpbmcgSmFzb24gR3VudGhvcnBlJ3MgaG1tIHRyZWUgYnV0IHRoaXMg
aXMKPiBpbmRlcGVuZGFudCBvZiB0aG9zZSBjaGFuZ2VzLiBJIGd1ZXNzIGl0IGNvdWxkIGdvIHRo
cm91Z2gKPiBEYXZpZCBBaXJsaWUncyB0cmVlIGZvciBub3V2ZWF1IG9yIEphc29uJ3MgdHJlZS4K
PiAKCkhpIFJhbHBoLAoKYnR3LCB3YXMgdGhpcyB0aGUgZml4IGZvciB0aGUgY3Jhc2ggeW91IHdl
cmUgc2VlaW5nPyBJdCBtaWdodCBiZSBuaWNlIHRvCm1lbnRpb24gaW4gdGhlIGNvbW1pdCBkZXNj
cmlwdGlvbiwgaWYgeW91IGFyZSBzZWVpbmcgcmVhbCBzeW1wdG9tcy4KCgo+ICBkcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RtZW0uYyB8IDMgKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvbm91dmVhdV9kbWVtLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9u
b3V2ZWF1X2RtZW0uYwo+IGluZGV4IDI3YWE0ZTcyYWJlOS4uMDBmNzIzNmFmMWI5IDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZG1lbS5jCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kbWVtLmMKPiBAQCAtMzc5LDkgKzM3OSwxMCBA
QCBub3V2ZWF1X2RtZW1fcGFnZXNfYWxsb2Moc3RydWN0IG5vdXZlYXVfZHJtICpkcm0sCj4gIAkJ
CXJldCA9IG5vdXZlYXVfZG1lbV9jaHVua19hbGxvYyhkcm0pOwo+ICAJCQlpZiAocmV0KSB7Cj4g
IAkJCQlpZiAoYykKPiAtCQkJCQlicmVhazsKCkFjdHVhbGx5LCB0aGUgcHJlLWV4aXN0aW5nIGNv
ZGUgaXMgYSBsaXR0bGUgY29uY2VybmluZy4gWW91ciBjaGFuZ2UgcHJlc2VydmVzCnRoZSBiZWhh
dmlvciwgYnV0IGl0IHNlZW1zIHF1ZXN0aW9uYWJsZSB0byBiZSBkb2luZyBhICJyZXR1cm4gMCIg
KHdoZXRoZXIKdmlhIHRoZSBhYm92ZSBicmVhaywgb3IgeW91ciBjaGFuZ2UpIHdoZW4gaXQncyBp
biB0aGlzIHBhcnRpYWxseSBhbGxvY2F0ZWQKc3RhdGUuIEl0J3MgcmVwb3J0aW5nIHN1Y2Nlc3Mg
d2hlbiBpdCBvbmx5IGFsbG9jYXRlcyBwYXJ0IG9mIHdoYXQgd2FzIHJlcXVlc3RlZCwKYW5kIGl0
IGRvZXNuJ3QgZmlsbCBpbiB0aGUgcGFnZXMgYXJyYXkgZWl0aGVyLgoKCgo+ICsJCQkJCXJldHVy
biAwOwo+ICAJCQkJcmV0dXJuIHJldDsKPiAgCQkJfQo+ICsJCQltdXRleF9sb2NrKCZkcm0tPmRt
ZW0tPm11dGV4KTsKPiAgCQkJY29udGludWU7Cj4gIAkJfQo+ICAKPiAKClRoZSBhYm92ZSBjb21t
ZW50IGlzIGFib3V0IHByZS1leGlzdGluZyBwb3RlbnRpYWwgcHJvYmxlbXMsIGJ1dCB5b3VyIHBh
dGNoIGl0c2VsZgpsb29rcyBjb3JyZWN0LCBzbzoKClJldmlld2VkLWJ5OiBKb2huIEh1YmJhcmQg
PGpodWJiYXJkQG52aWRpYS5jb20+IAoKCnRoYW5rcywKLS0gCkpvaG4gSHViYmFyZApOVklESUEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
