Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D025F34EA19
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 16:16:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E22906E903;
	Tue, 30 Mar 2021 14:16:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mengyan1223.wang (mengyan1223.wang [89.208.246.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C89216E8DB;
 Tue, 30 Mar 2021 13:09:36 +0000 (UTC)
Received: from [IPv6:240e:35a:1037:8a00:70b2:e35d:833c:af3e] (unknown
 [IPv6:240e:35a:1037:8a00:70b2:e35d:833c:af3e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-384))
 (Client did not present a certificate)
 (Authenticated sender: xry111@mengyan1223.wang)
 by mengyan1223.wang (Postfix) with ESMTPSA id 5D1C765C14;
 Tue, 30 Mar 2021 09:09:23 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mengyan1223.wang;
 s=mail; t=1617109776;
 bh=3iP3rLSkq+VHRv9oXI55n1v+WgpcbUG9Pj6ypqndVyM=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=jlPQQcKuSJNeAKBfBqLWKzTAZ6N3flgBhFW3Ivu2XobvF0fkmyiHwYvb0HYY7nIZS
 EBh7I34Aisb+H8iNJUk3xZs/BiLYHW++v/XmWX/jf4Cbx4JrIWmZjQl0MjILUeF/1K
 xQdpbmBBBpAD+PN9Hay0/EduuiMHirfHM5ih+7WqO+HWmI17Md3WelMnUP8QFlI1hb
 +gyjmh3U67Y5rwG1qJaBq/SfFhaaFz+ITR1uTpf6zaGyb7Elk0WXQdpSyHX6S/qiv6
 87TdrlOY3uqwScMSVkaLwGfXUsy0fESYLEcLKt+Af+m4bbWtgROcHaKY5ESNYCHmmG
 lTlQjar0XhL5w==
Message-ID: <63f5f6b39d22d9833a4c1503a34840eb08050f75.camel@mengyan1223.wang>
Subject: Re: [PATCH] drm/amdgpu: fix an underflow on non-4KB-page systems
From: Xi Ruoyao <xry111@mengyan1223.wang>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, Alex
 Deucher <alexander.deucher@amd.com>
Date: Tue, 30 Mar 2021 21:09:12 +0800
In-Reply-To: <f3fb57055f0bd3f19bb6ac397dc92113e1555764.camel@mengyan1223.wang>
References: <20210329175348.26859-1-xry111@mengyan1223.wang>
 <d192e2a8-8baf-0a8c-93a9-9abbad992c7d@gmail.com>
 <be9042b9294bda450659d3cd418c5e8759d57319.camel@mengyan1223.wang>
 <9a11c873-a362-b5d1-6d9c-e937034e267d@gmail.com>
 <bf9e05d4a6ece3e8bf1f732b011d3e54bbf8000e.camel@mengyan1223.wang>
 <84b3911173ad6beb246ba0a77f93d888ee6b393e.camel@mengyan1223.wang>
 <97c520ce107aa4d5fd96e2c380c8acdb63d45c37.camel@mengyan1223.wang>
 <7701fb71-9243-2d90-e1e1-d347a53b7d77@gmail.com>
 <368b9b1b7343e35b446bb1028ccf0ae75dc2adc4.camel@mengyan1223.wang>
 <71e3905a5b72c5b97df837041b19175540ebb023.camel@mengyan1223.wang>
 <c3caf16b-584a-3e4c-0104-15bb41613136@amd.com>
 <f3fb57055f0bd3f19bb6ac397dc92113e1555764.camel@mengyan1223.wang>
User-Agent: Evolution 3.40.0 
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 30 Mar 2021 14:16:14 +0000
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
Cc: David Airlie <airlied@linux.ie>, Felix Kuehling <Felix.Kuehling@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Dan =?ISO-8859-1?Q?Hor=E1k?= <dan@danny.cz>, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMS0wMy0zMCAyMTowMiArMDgwMCwgWGkgUnVveWFvIHdyb3RlOgo+IE9uIDIwMjEtMDMt
MzAgMTQ6NTUgKzAyMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gPiAKPiA+IEkgcmF0aGVy
IHNlZSB0aGlzIGFzIGEga2VybmVsIGJ1Zy4gQ2FuIHlvdSB0ZXN0IGlmIHRoaXMgY29kZSBmcmFn
bWVudCAKPiA+IGZpeGVzIHlvdXIgaXNzdWU6Cj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfa21zLmMgCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9rbXMuYwo+ID4gaW5kZXggNjRiZWIzMzk5NjA0Li5lMTI2MGI1MTdl
MWIgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfa21z
LmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9rbXMuYwo+ID4g
QEAgLTc4MCw3ICs3ODAsNyBAQCBpbnQgYW1kZ3B1X2luZm9faW9jdGwoc3RydWN0IGRybV9kZXZp
Y2UgKmRldiwgdm9pZCAKPiA+ICpkYXRhLCBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbHApCj4gPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBkZXZfaW5mby0+dmlydHVhbF9hZGRyZXNzX2FsaWdubWVudCA9IAo+ID4gbWF4
KChpbnQpUEFHRV9TSVpFLCBBTURHUFVfR1BVX1BBR0VfU0laRSk7Cj4gPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBkZXZfaW5mby0+cHRlX2ZyYWdtZW50X3NpemUgPSAoMSA8PCAK
PiA+IGFkZXYtPnZtX21hbmFnZXIuZnJhZ21lbnRfc2l6ZSkgKiBBTURHUFVfR1BVX1BBR0VfU0la
RTsKPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldl9pbmZvLT5nYXJ0X3BhZ2Vf
c2l6ZSA9IEFNREdQVV9HUFVfUEFHRV9TSVpFOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgZGV2X2luZm8tPmdhcnRfcGFnZV9zaXplID0gCj4gPiBkZXZfaW5mby0+dmlydHVhbF9h
ZGRyZXNzX2FsaWdubWVudDsKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRl
dl9pbmZvLT5jdV9hY3RpdmVfbnVtYmVyID0gYWRldi0+Z2Z4LmN1X2luZm8ubnVtYmVyOwo+ID4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2X2luZm8tPmN1X2FvX21hc2sgPSBh
ZGV2LT5nZnguY3VfaW5mby5hb19jdV9tYXNrOwo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgZGV2X2luZm8tPmNlX3JhbV9zaXplID0gYWRldi0+Z2Z4LmNlX3JhbV9zaXplOwo+
IAo+IEl0IHdvcmtzLsKgIEkndmUgc2VlbiBpdCBhdAo+IGh0dHBzOi8vZ2l0aHViLmNvbS94ZW4w
bi9saW51eC9jb21taXQvODRhZGE3Mjk4MzgzOGJkN2NlNTRiYzMyZjVkMzRhYzViNWFhZTE5MQo+
IGJlZm9yZSAod2l0aCBhIGNvbW1vbiBzdWItZXhwcmVzc2lvbiwgdGhvdWdoIDopLgoKU29tZSBj
b21tZW50OiBvbiBhbiBvbGQgdmVyc2lvbiBvZiBGZWRvcmEgcG9ydGVkIGJ5IExvb25nc29uLCBY
b3JnIGp1c3QgaGFuZ3MKd2l0aG91dCB0aGlzIGNvbW1pdC4gIEJ1dCBvbiB0aGUgc3lzdGVtIEkg
YnVpbHQgZnJvbSBzb3VyY2UsIEkgZGlkbid0IHNlZSBhbnkKaXNzdWUgYmVmb3JlIExpbnV4IDUu
MTEuICBTbyBJIG1pc2JlbGlldmVkIHRoYXQgaXQgd2FzIHNvbWV0aGluZyBhbHJlYWR5IGZpeGVk
LgoKRGFuOiB5b3UgY2FuIHRyeSBpdCBvbiB5b3VyIFBQQyA2NCB3aXRoIG5vbi00SyBwYWdlIGFz
IHdlbGwuCi0tIApYaSBSdW95YW8gPHhyeTExMUBtZW5neWFuMTIyMy53YW5nPgpTY2hvb2wgb2Yg
QWVyb3NwYWNlIFNjaWVuY2UgYW5kIFRlY2hub2xvZ3ksIFhpZGlhbiBVbml2ZXJzaXR5CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
