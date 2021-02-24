Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C31A53242FF
	for <lists+dri-devel@lfdr.de>; Wed, 24 Feb 2021 18:14:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 955EA6EB03;
	Wed, 24 Feb 2021 17:14:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A3436EB03
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Feb 2021 17:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202012;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yyNUx0nar2lxG1vgGOoxDqFNCsxp4ZNmGM9EFtMriU0=; b=D+uJFaiNEl7QPZvVRTYL86+oTv
 Fzq9zkQPhsgHray8OLuXY7+reveq3e/9Iqpp2m8d3t+OdYGBXxcwDwNfkITM3XxjnwK/ZUVseubCw
 aRJdVcL9KimeV1G1zfb4R5qOJvVW6flIOaWn3KQfmjmGwXm2LQbtvT/OriNNZw4QXMcSTdgPDMhyR
 q++LjEafC6nUrlhD5gKlUHNozQwn+8y6Si452CwAXIDNXTqMg+XUa/7xRI/hkr3bLUIhEbgAGrVhY
 R2KUSz1tcKMvVMf2uK/yAyFiHRfwZWA9neOnAv4uea2oQpWA4Q3GzR6WY3EcPm7r2ws/2YG52fbtj
 NPyGxsKQ==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:60354
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1lExk3-0001jh-2S; Wed, 24 Feb 2021 18:14:27 +0100
Subject: Re: [PATCH] drm/shmem-helpers: vunmap: Don't put pages for dma-buf
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
References: <20210219122203.51130-1-noralf@tronnes.org>
 <2eb66df9-05bc-c52c-b6b7-793cac59f4d3@suse.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <5169579f-04cf-230d-f9be-f3eb068b0e51@tronnes.org>
Date: Wed, 24 Feb 2021 18:14:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <2eb66df9-05bc-c52c-b6b7-793cac59f4d3@suse.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMTkuMDIuMjAyMSAxNC41NCwgc2tyZXYgVGhvbWFzIFppbW1lcm1hbm46Cj4gSGkKPiAK
PiBBbSAxOS4wMi4yMSB1bSAxMzoyMiBzY2hyaWViIE5vcmFsZiBUcsO4bm5lczoKPj4gZG1hLWJ1
ZiBpbXBvcnRpbmcgd2FzIHJld29ya2VkIGluIGNvbW1pdCA3ZDJjZDcyYTlhYTMKPj4gKCJkcm0v
c2htZW0taGVscGVyczogU2ltcGxpZnkgZG1hLWJ1ZiBpbXBvcnRpbmciKS4gQmVmb3JlIHRoYXQg
Y29tbWl0Cj4+IGRybV9nZW1fc2htZW1fcHJpbWVfaW1wb3J0X3NnX3RhYmxlKCkgZGlkIHNldCAt
PnBhZ2VzX3VzZV9jb3VudD0xIGFuZAo+PiBkcm1fZ2VtX3NobWVtX3Z1bm1hcF9sb2NrZWQoKSBj
b3VsZCBjYWxsIGRybV9nZW1fc2htZW1fcHV0X3BhZ2VzKCkKPj4gdW5jb25kaXRpb25hbGx5LiBO
b3cgd2l0aG91dCB0aGUgdXNlIGNvdW50IHNldCwgcHV0IHBhZ2VzIGlzIGNhbGxlZCBhbHNvCj4+
IG9uIGRtYS1idWZzLiBGaXggdGhpcyBieSBvbmx5IHB1dHRpbmcgcGFnZXMgaWYgaXQncyBub3Qg
aW1wb3J0ZWQuCj4+Cj4+IEZpeGVzOiA3ZDJjZDcyYTlhYTMgKCJkcm0vc2htZW0taGVscGVyczog
U2ltcGxpZnkgZG1hLWJ1ZiBpbXBvcnRpbmciKQo+PiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVs
LnZldHRlckBmZndsbC5jaD4KPj4gQ2M6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBz
dXNlLmRlPgo+PiBTaWduZWQtb2ZmLWJ5OiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVz
Lm9yZz4KPiAKPiBKdXN0IHdoZW4gSSBzYXcgdGhlIGVycm9yLiBOaWNlLiA6KQo+IAo+IEFja2Vk
LWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KPiBUZXN0ZWQtYnk6
IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgo+IAoKU2hvdWxkIEkgYXBw
bHkgdGhpcyB0byBkcm0tbWlzYy1maXhlcz8KCk5vcmFsZi4KCj4gRm9yIHRlc3RpbmcgdGhlIEdV
RCBkcml2ZXIsIHlvdSBtYXkgYWxzbyB3YW50IHRvIGtlZXAgYW4gZXllIGF0IFsxXQo+IAo+IEJl
c3QgcmVnYXJkcwo+IFRob21hcwo+IAo+IFsxXQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2Ry
aS1kZXZlbC8wMmE0NWMxMS1mYzczLTFlNWEtMzgzOS0zMGIwODA5NTBhZjhAYW1kLmNvbS9ULyN0
Cj4gCj4gCj4+IC0tLQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIu
YyB8IDcgKysrKy0tLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2ht
ZW1faGVscGVyLmMKPj4gYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuYwo+
PiBpbmRleCA5ODI1YzM3OGRmYTYuLmM4YTY1NDdhMTc1NyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2RybV9nZW1fc2htZW1faGVscGVyLmMKPj4gQEAgLTM1NywxMyArMzU3LDE0IEBAIHN0YXRpYyB2
b2lkIGRybV9nZW1fc2htZW1fdnVubWFwX2xvY2tlZChzdHJ1Y3QKPj4gZHJtX2dlbV9zaG1lbV9v
YmplY3QgKnNobWVtLAo+PiDCoMKgwqDCoMKgIGlmICgtLXNobWVtLT52bWFwX3VzZV9jb3VudCA+
IDApCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm47Cj4+IMKgIC3CoMKgwqAgaWYgKG9iai0+
aW1wb3J0X2F0dGFjaCkKPj4gK8KgwqDCoCBpZiAob2JqLT5pbXBvcnRfYXR0YWNoKSB7Cj4+IMKg
wqDCoMKgwqDCoMKgwqDCoCBkbWFfYnVmX3Z1bm1hcChvYmotPmltcG9ydF9hdHRhY2gtPmRtYWJ1
ZiwgbWFwKTsKPj4gLcKgwqDCoCBlbHNlCj4+ICvCoMKgwqAgfSBlbHNlIHsKPj4gwqDCoMKgwqDC
oMKgwqDCoMKgIHZ1bm1hcChzaG1lbS0+dmFkZHIpOwo+PiArwqDCoMKgwqDCoMKgwqAgZHJtX2dl
bV9zaG1lbV9wdXRfcGFnZXMoc2htZW0pOwo+PiArwqDCoMKgIH0KPj4gwqAgwqDCoMKgwqDCoCBz
aG1lbS0+dmFkZHIgPSBOVUxMOwo+PiAtwqDCoMKgIGRybV9nZW1fc2htZW1fcHV0X3BhZ2VzKHNo
bWVtKTsKPj4gwqAgfQo+PiDCoCDCoCAvKgo+Pgo+IApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
