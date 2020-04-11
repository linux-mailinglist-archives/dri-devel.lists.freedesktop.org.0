Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8F61A5231
	for <lists+dri-devel@lfdr.de>; Sat, 11 Apr 2020 14:54:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 562436E326;
	Sat, 11 Apr 2020 12:54:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 940 seconds by postgrey-1.36 at gabe;
 Sat, 11 Apr 2020 06:28:41 UTC
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB65B6E029
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Apr 2020 06:28:41 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 7C8EB85205F380D36F76;
 Sat, 11 Apr 2020 14:12:58 +0800 (CST)
Received: from [127.0.0.1] (10.57.60.129) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.487.0; Sat, 11 Apr 2020
 14:12:48 +0800
Subject: Re: [PATCH] drm/hisilicon: Code refactoring for hibmc_drv_vdac
To: Joe Perches <joe@perches.com>, Tian Tao <tiantao6@hisilicon.com>,
 <puck.chen@hisilicon.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <tzimmermann@suse.de>, <kraxel@redhat.com>, <alexander.deucher@amd.com>,
 <tglx@linutronix.de>, <dri-devel@lists.freedesktop.org>,
 <xinliang.liu@linaro.org>, <linux-kernel@vger.kernel.org>
References: <1586573387-42003-1-git-send-email-tiantao6@hisilicon.com>
 <78e966cacffbab8c43be6a02aa3f5af2478917d0.camel@perches.com>
From: "tiantao (H)" <tiantao6@huawei.com>
Message-ID: <e2b9f9f1-693e-57bc-6b0b-a6a5f095be16@huawei.com>
Date: Sat, 11 Apr 2020 14:12:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <78e966cacffbab8c43be6a02aa3f5af2478917d0.camel@perches.com>
X-Originating-IP: [10.57.60.129]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sat, 11 Apr 2020 12:53:57 +0000
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
Cc: linuxarm@huawei.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="gbk"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ClRoYW5rIHlvdSwgeW91ciBzdWdnZXN0aW9uIGlzIGFjY2VwdGVkIGFuZCBJIHdpbGwgaXNzdWUg
djIKCtTaIDIwMjAvNC8xMSAxMTo0MywgSm9lIFBlcmNoZXMg0LS1wDoKPiBPbiBTYXQsIDIwMjAt
MDQtMTEgYXQgMTA6NDkgKzA4MDAsIFRpYW4gVGFvIHdyb3RlOgo+PiBjb2RlIHJlZmFjdG9yaW5n
IGZvciBoaWJtY19kcnZfdmRhYy5jLCBubyBhY3R1YWwgZnVuY3Rpb24gY2hhbmdlcy4KPiAKPiBT
ZWVtcyBzZW5zaWJsZS4KPiAKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGlj
b24vaGlibWMvaGlibWNfZHJtX3ZkYWMuYyBiL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24vaGli
bWMvaGlibWNfZHJtX3ZkYWMuYwo+IFtdCj4+IEBAIC0xMDksMTMgKzgzLDYgQEAgaW50IGhpYm1j
X3ZkYWNfaW5pdChzdHJ1Y3QgaGlibWNfZHJtX3ByaXZhdGUgKnByaXYpCj4+ICAgCXN0cnVjdCBk
cm1fY29ubmVjdG9yICpjb25uZWN0b3I7Cj4+ICAgCWludCByZXQ7Cj4+ICAgCj4+IC0JY29ubmVj
dG9yID0gaGlibWNfY29ubmVjdG9yX2luaXQocHJpdik7Cj4+IC0JaWYgKElTX0VSUihjb25uZWN0
b3IpKSB7Cj4+IC0JCURSTV9FUlJPUigiZmFpbGVkIHRvIGNyZWF0ZSBjb25uZWN0b3I6ICVsZFxu
IiwKPj4gLQkJCSAgUFRSX0VSUihjb25uZWN0b3IpKTsKPj4gLQkJcmV0dXJuIFBUUl9FUlIoY29u
bmVjdG9yKTsKPj4gLQl9Cj4+IC0KPj4gICAJZW5jb2RlciA9IGRldm1fa3phbGxvYyhkZXYtPmRl
diwgc2l6ZW9mKCplbmNvZGVyKSwgR0ZQX0tFUk5FTCk7Cj4+ICAgCWlmICghZW5jb2Rlcikgewo+
PiAgIAkJRFJNX0VSUk9SKCJmYWlsZWQgdG8gYWxsb2MgbWVtb3J5IHdoZW4gaW5pdCBlbmNvZGVy
XG4iKTsKPiAKPiBUaGUgYWxsb2MgZXJyb3IgbWVzc2FnZXMgY291bGQgYmUgcmVtb3ZlZC4KPiAK
Pj4gQEAgLTEzMSw2ICs5OCwyMSBAQCBpbnQgaGlibWNfdmRhY19pbml0KHN0cnVjdCBoaWJtY19k
cm1fcHJpdmF0ZSAqcHJpdikKPj4gICAJfQo+PiAgIAo+PiAgIAlkcm1fZW5jb2Rlcl9oZWxwZXJf
YWRkKGVuY29kZXIsICZoaWJtY19lbmNvZGVyX2hlbHBlcl9mdW5jcyk7Cj4+ICsKPj4gKwljb25u
ZWN0b3IgPSBkZXZtX2t6YWxsb2MoZGV2LT5kZXYsIHNpemVvZigqY29ubmVjdG9yKSwgR0ZQX0tF
Uk5FTCk7Cj4+ICsJaWYgKCFjb25uZWN0b3IpIHsKPj4gKwkJRFJNX0VSUk9SKCJmYWlsZWQgdG8g
YWxsb2MgbWVtb3J5IHdoZW4gaW5pdCBjb25uZWN0b3JcbiIpOwo+IAo+IGFuZCBoZXJlLgo+IAo+
IAo+IAo+IC4KPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
