Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4032F4FE3
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 16:37:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5C2D6E38A;
	Fri,  8 Nov 2019 15:37:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F1506E38A
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2019 15:37:11 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:62684
 helo=[192.168.10.173])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1iT6Jx-0001hw-01; Fri, 08 Nov 2019 16:37:09 +0100
Subject: Re: [PATCH 1/4] drm/udl: Replace fbdev code with generic emulation
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 sean@poorly.run, daniel@ffwll.ch, b.zolnierkie@samsung.com,
 kraxel@redhat.com, sam@ravnborg.org, emil.velikov@collabora.com
References: <20191108123333.25274-1-tzimmermann@suse.de>
 <20191108123333.25274-2-tzimmermann@suse.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <e8b90928-fdae-36e0-f116-8b49159c4aad@tronnes.org>
Date: Fri, 8 Nov 2019 16:37:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191108123333.25274-2-tzimmermann@suse.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org
 ; s=ds201810; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YxKUGlbherO5GSkie41wppSHH0iMnBLHKxSZel2jrX0=; b=WNeZYfY1CV4GhUAbsXd1d4c9ZH
 +7o5l5+8iLLjaimkM1dp0EK9f17u1hFj1CKx9iF9oLnOMJozXLTFyQHu8stVhx9zhf2j25i4RFCXN
 IUySsoBET3LpHrzPJ4cNN89/MAbb/xN8VcSQ1Ns/XbVxkUlBL+nkuSEmUDuOAllUg13AIEd1xuqsZ
 d4+SofiaNPC0apiiKb7T0XBuzpfNp/PxR2FpCDjH/gTp0Djov/BmA/UjFGKiddANoq5nQVoHTXl8X
 +3fYk75+tBWqSxp6o6NNVpfAb0L0O7pgM66rKWUqtu880F5P157ld/z6BErG5HMzePpscjrN6UIFn
 GjfzUwVg==;
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMDguMTEuMjAxOSAxMy4zMywgc2tyZXYgVGhvbWFzIFppbW1lcm1hbm46Cj4gVGhlIHVk
bCBkcml2ZXIgY2FuIHVzZSB0aGUgZ2VuZXJpYyBmYmRldiBpbXBsZW1lbnRhdGlvbi4gQ29udmVy
dCBpdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5A
c3VzZS5kZT4KPiAtLS0KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2Ry
di5jIGIvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZHJ2LmMKPiBpbmRleCA1NjNjYzU4MDllNTYu
LjU1YzBmOWRmZWUyOSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9kcnYu
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2Rydi5jCgo+IEBAIC00Nyw2ICs0OCw4
IEBAIHN0YXRpYyBzdHJ1Y3QgZHJtX2RyaXZlciBkcml2ZXIgPSB7Cj4gIAkuZHJpdmVyX2ZlYXR1
cmVzID0gRFJJVkVSX01PREVTRVQgfCBEUklWRVJfR0VNLAo+ICAJLnJlbGVhc2UgPSB1ZGxfZHJp
dmVyX3JlbGVhc2UsCj4gIAo+ICsJLmxhc3RjbG9zZSA9IGRybV9mYl9oZWxwZXJfbGFzdGNsb3Nl
LAo+ICsKCk5vIG5lZWQgdG8gc2V0IHRoaXMsIGl0J3MgYWxyZWFkeSB3aXJlZCB1cDoKCmRybV9s
YXN0Y2xvc2UgLT4gZHJtX2NsaWVudF9kZXZfcmVzdG9yZSAtPiBkcm1fZmJkZXZfY2xpZW50X3Jl
c3RvcmUgLT4KZHJtX2ZiX2hlbHBlcl9sYXN0Y2xvc2UKCj4gIAkvKiBnZW0gaG9va3MgKi8KPiAg
CS5nZW1fY3JlYXRlX29iamVjdCA9IHVkbF9kcml2ZXJfZ2VtX2NyZWF0ZV9vYmplY3QsCj4gIAoK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZmIuYyBiL2RyaXZlcnMvZ3B1
L2RybS91ZGwvdWRsX2ZiLmMKPiBpbmRleCBmODE1M2I3MjYzNDMuLmFmZTc0Zjg5MmEyYiAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9mYi5jCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3VkbC91ZGxfZmIuYwo+IEBAIC0yMCwxOSArMjAsOSBAQAo+ICAKPiAgI2luY2x1ZGUg
InVkbF9kcnYuaCIKPiAgCj4gLSNkZWZpbmUgRExfREVGSU9fV1JJVEVfREVMQVkgICAgKEhaLzIw
KSAvKiBmYl9kZWZlcnJlZF9pby5kZWxheSBpbiBqaWZmaWVzICovCj4gLQo+IC1zdGF0aWMgaW50
IGZiX2RlZmlvID0gMDsgIC8qIE9wdGlvbmFsbHkgZW5hYmxlIGV4cGVyaW1lbnRhbCBmYl9kZWZp
byBtbWFwIHN1cHBvcnQgKi8KPiAgc3RhdGljIGludCBmYl9icHAgPSAxNjsKPiAgCj4gIG1vZHVs
ZV9wYXJhbShmYl9icHAsIGludCwgU19JV1VTUiB8IFNfSVJVU1IgfCBTX0lXR1JQIHwgU19JUkdS
UCk7CgpNYXliZSBmYl9icHAgY2FuIGJlIGRyb3BwZWQgdG9vPwoKSXQncyBwb3NzaWJsZSB0byBz
ZXQgaXQgb24gdGhlIGNvbW1hbmQgbGluZToKCnZpZGVvPTx4cmVzPng8eXJlcz4tPGJwcD4KCkkg
aGF2ZW4ndCB0cmllZCBpdCBzbyBJIGNhbid0IHNheSBmb3IgY2VydGFpbiB0aGF0IGl0IGFjdHVh
bGx5IHdvcmtzLgoKUmVmOiBEb2N1bWVudGF0aW9uL2ZiL21vZGVkYi5yc3QgYW5kIGRybV9mYl9o
ZWxwZXJfc2luZ2xlX2ZiX3Byb2JlKCkKCj4gLW1vZHVsZV9wYXJhbShmYl9kZWZpbywgaW50LCBT
X0lXVVNSIHwgU19JUlVTUiB8IFNfSVdHUlAgfCBTX0lSR1JQKTsKPiAtCgo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9tb2Rlc2V0LmMgYi9kcml2ZXJzL2dwdS9kcm0vdWRs
L3VkbF9tb2Rlc2V0LmMKPiBpbmRleCBiYzFhYjYwNjBkYzYuLjE1MTdkNWU4ODFiOCAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9tb2Rlc2V0LmMKPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vdWRsL3VkbF9tb2Rlc2V0LmMKCj4gQEAgLTQyMiw3ICs0MjMsNyBAQCBzdGF0aWMg
aW50IHVkbF9jcnRjX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldikKPiAgCj4gIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgZHJtX21vZGVfY29uZmlnX2Z1bmNzIHVkbF9tb2RlX2Z1bmNzID0gewo+ICAJ
LmZiX2NyZWF0ZSA9IHVkbF9mYl91c2VyX2ZiX2NyZWF0ZSwKPiAtCS5vdXRwdXRfcG9sbF9jaGFu
Z2VkID0gTlVMTCwKPiArCS5vdXRwdXRfcG9sbF9jaGFuZ2VkID0gZHJtX2ZiX2hlbHBlcl9vdXRw
dXRfcG9sbF9jaGFuZ2VkLAoKTm8gbmVlZCB0byBzZXQgdGhpcywgaXQncyBhbHJlYWR5IHdpcmVk
IHVwOgoKZHJtX2ttc19oZWxwZXJfaG90cGx1Z19ldmVudCAtPiBkcm1fY2xpZW50X2Rldl9ob3Rw
bHVnIC0+CmRybV9mYmRldl9jbGllbnRfaG90cGx1ZyAtPiBkcm1fZmJfaGVscGVyX2hvdHBsdWdf
ZXZlbnQKCk5vcmFsZi4KCj4gIH07Cj4gIAo+ICBpbnQgdWRsX21vZGVzZXRfaW5pdChzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2KQo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
