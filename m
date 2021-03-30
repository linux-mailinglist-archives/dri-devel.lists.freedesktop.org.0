Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB2C34EA1A
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 16:16:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 224AB6E905;
	Tue, 30 Mar 2021 14:16:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from redcrew.org (redcrew.org [IPv6:2a02:2b88:2:1::1cde:1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 424176E8E6;
 Tue, 30 Mar 2021 13:23:02 +0000 (UTC)
Received: from server.danny.cz (19.161.broadband4.iol.cz [85.71.161.19])
 by redcrew.org (Postfix) with ESMTP id D4E3269;
 Tue, 30 Mar 2021 15:23:00 +0200 (CEST)
Received: from talos.danny.cz (talos.danny.cz [192.168.160.68])
 by server.danny.cz (Postfix) with SMTP id 65522DA004;
 Tue, 30 Mar 2021 15:23:00 +0200 (CEST)
Date: Tue, 30 Mar 2021 15:23:00 +0200
From: Dan =?UTF-8?B?SG9yw6Fr?= <dan@danny.cz>
To: Xi Ruoyao <xry111@mengyan1223.wang>
Subject: Re: [PATCH] drm/amdgpu: fix an underflow on non-4KB-page systems
Message-Id: <20210330152300.b790099debcd7659e30d9bfd@danny.cz>
In-Reply-To: <63f5f6b39d22d9833a4c1503a34840eb08050f75.camel@mengyan1223.wang>
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
 <63f5f6b39d22d9833a4c1503a34840eb08050f75.camel@mengyan1223.wang>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; powerpc64le-redhat-linux-gnu)
Mime-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>,
 Christian =?UTF-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, stable@vger.kernel.org,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAzMCBNYXIgMjAyMSAyMTowOToxMiArMDgwMApYaSBSdW95YW8gPHhyeTExMUBtZW5n
eWFuMTIyMy53YW5nPiB3cm90ZToKCj4gT24gMjAyMS0wMy0zMCAyMTowMiArMDgwMCwgWGkgUnVv
eWFvIHdyb3RlOgo+ID4gT24gMjAyMS0wMy0zMCAxNDo1NSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5p
ZyB3cm90ZToKPiA+ID4gCj4gPiA+IEkgcmF0aGVyIHNlZSB0aGlzIGFzIGEga2VybmVsIGJ1Zy4g
Q2FuIHlvdSB0ZXN0IGlmIHRoaXMgY29kZSBmcmFnbWVudCAKPiA+ID4gZml4ZXMgeW91ciBpc3N1
ZToKPiA+ID4gCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfa21zLmMgCj4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2tt
cy5jCj4gPiA+IGluZGV4IDY0YmViMzM5OTYwNC4uZTEyNjBiNTE3ZTFiIDEwMDY0NAo+ID4gPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfa21zLmMKPiA+ID4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ttcy5jCj4gPiA+IEBAIC03ODAsNyAr
NzgwLDcgQEAgaW50IGFtZGdwdV9pbmZvX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZv
aWQgCj4gPiA+ICpkYXRhLCBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbHApCj4gPiA+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgZGV2X2luZm8tPnZpcnR1YWxfYWRkcmVzc19hbGlnbm1lbnQgPSAKPiA+ID4gbWF4KChp
bnQpUEFHRV9TSVpFLCBBTURHUFVfR1BVX1BBR0VfU0laRSk7Cj4gPiA+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGRldl9pbmZvLT5wdGVfZnJhZ21lbnRfc2l6ZSA9ICgxIDw8IAo+
ID4gPiBhZGV2LT52bV9tYW5hZ2VyLmZyYWdtZW50X3NpemUpICogQU1ER1BVX0dQVV9QQUdFX1NJ
WkU7Cj4gPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldl9pbmZvLT5nYXJ0X3Bh
Z2Vfc2l6ZSA9IEFNREdQVV9HUFVfUEFHRV9TSVpFOwo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBkZXZfaW5mby0+Z2FydF9wYWdlX3NpemUgPSAKPiA+ID4gZGV2X2luZm8tPnZp
cnR1YWxfYWRkcmVzc19hbGlnbm1lbnQ7Cj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGRldl9pbmZvLT5jdV9hY3RpdmVfbnVtYmVyID0gYWRldi0+Z2Z4LmN1X2luZm8ubnVt
YmVyOwo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZXZfaW5mby0+Y3Vf
YW9fbWFzayA9IGFkZXYtPmdmeC5jdV9pbmZvLmFvX2N1X21hc2s7Cj4gPiA+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldl9pbmZvLT5jZV9yYW1fc2l6ZSA9IGFkZXYtPmdmeC5j
ZV9yYW1fc2l6ZTsKPiA+IAo+ID4gSXQgd29ya3MuwqAgSSd2ZSBzZWVuIGl0IGF0Cj4gPiBodHRw
czovL2dpdGh1Yi5jb20veGVuMG4vbGludXgvY29tbWl0Lzg0YWRhNzI5ODM4MzhiZDdjZTU0YmMz
MmY1ZDM0YWM1YjVhYWUxOTEKPiA+IGJlZm9yZSAod2l0aCBhIGNvbW1vbiBzdWItZXhwcmVzc2lv
biwgdGhvdWdoIDopLgo+IAo+IFNvbWUgY29tbWVudDogb24gYW4gb2xkIHZlcnNpb24gb2YgRmVk
b3JhIHBvcnRlZCBieSBMb29uZ3NvbiwgWG9yZyBqdXN0IGhhbmdzCj4gd2l0aG91dCB0aGlzIGNv
bW1pdC4gIEJ1dCBvbiB0aGUgc3lzdGVtIEkgYnVpbHQgZnJvbSBzb3VyY2UsIEkgZGlkbid0IHNl
ZSBhbnkKPiBpc3N1ZSBiZWZvcmUgTGludXggNS4xMS4gIFNvIEkgbWlzYmVsaWV2ZWQgdGhhdCBp
dCB3YXMgc29tZXRoaW5nIGFscmVhZHkgZml4ZWQuCj4gCj4gRGFuOiB5b3UgY2FuIHRyeSBpdCBv
biB5b3VyIFBQQyA2NCB3aXRoIG5vbi00SyBwYWdlIGFzIHdlbGwuCgp5dXAsIGxvb2tzIGdvb2Qg
aGVyZSBhcyB3ZWxsLCBwcGM2NGxlIChQb3dlcjkpIHN5c3RlbSB3aXRoIDY0S0IgcGFnZXMKCgoJ
CURhbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
