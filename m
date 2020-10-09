Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 939342883B0
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 09:36:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 589BB6E15D;
	Fri,  9 Oct 2020 07:36:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A80616E15D
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 07:36:31 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f8012c60000>; Fri, 09 Oct 2020 00:35:34 -0700
Received: from [10.2.48.215] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 9 Oct
 2020 07:36:25 +0000
Subject: Re: [PATCH 1/4] mm: introduce vma_set_file function v2
To: <christian.koenig@amd.com>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>,
 <dri-devel@lists.freedesktop.org>, <linux-media@vger.kernel.org>,
 <chris@chris-wilson.co.uk>, <airlied@redhat.com>,
 <akpm@linux-foundation.org>, <daniel@ffwll.ch>, <sumit.semwal@linaro.org>
References: <20201008112342.9394-1-christian.koenig@amd.com>
 <b6b77e60-f93d-efe4-e267-983a2bdbbe71@nvidia.com>
 <747e1832-0341-9029-95f6-638f0f1a6f76@gmail.com>
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <0e3a8483-2b51-b9a4-30b9-360e761c95e4@nvidia.com>
Date: Fri, 9 Oct 2020 00:36:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <747e1832-0341-9029-95f6-638f0f1a6f76@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1602228934; bh=VXLiMZEGbVvifru0A9n+AHL9u+yHK4EKYT0uGJrjxIc=;
 h=Subject:To:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=nFxSHOJN7Xduujj/wHrzlj1+fNv/rRDDGf4os16G9AgCTVgbLDjigoPl7sizqUqsA
 34D9i+FaLs3iLpwBHPE0vbFuoyV3d9sdx9EQMtgufgoHAXAFvNrz0mfPUCXSxiCLjb
 6Nbx8kCGWai06yAQGP5uxEg/HDub6jmVvSBrhFYjEYhPONuVxSbxesVtvVwCpi+E2Z
 B4TcJOl/pda9XWJVqDrBJ9QaxOpbxQwG1V72WRzrj7t+jvxJdEz1oNYNKbX6VW8+Do
 MacCNNNXVFF3oSf04Urmz4h8OlbMkaC7Yt9eIAPLliqQbDWywnXjVcYJst6AU1eBEI
 wAA4ZOryDim+Q==
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAvOS8yMCAxMjozMyBBTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiBBbSAwOC4xMC4y
MCB1bSAyMzo0OSBzY2hyaWViIEpvaG4gSHViYmFyZDoKPj4gT24gMTAvOC8yMCA0OjIzIEFNLCBD
aHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+PiAuLi4KPj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fbW1hbi5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z2VtL2k5MTVfZ2VtX21tYW4uYwo+Pj4gaW5kZXggM2Q2OWU1MWYzZTRkLi5jOWQ1ZjFhMzhhZjMg
MTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fbW1hbi5j
Cj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fbW1hbi5jCj4+PiBA
QCAtODkzLDggKzg5Myw4IEBAIGludCBpOTE1X2dlbV9tbWFwKHN0cnVjdCBmaWxlICpmaWxwLCBz
dHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKPj4+IMKgwqDCoMKgwqDCoCAqIHJlcXVpcmVzIGF2
b2lkaW5nIGV4dHJhbmVvdXMgcmVmZXJlbmNlcyB0byB0aGVpciBmaWxwLCBoZW5jZSB3aHkKPj4+
IMKgwqDCoMKgwqDCoCAqIHdlIHByZWZlciB0byB1c2UgYW4gYW5vbnltb3VzIGZpbGUgZm9yIHRo
ZWlyIG1tYXBzLgo+Pj4gwqDCoMKgwqDCoMKgICovCj4+PiAtwqDCoMKgIGZwdXQodm1hLT52bV9m
aWxlKTsKPj4+IC3CoMKgwqAgdm1hLT52bV9maWxlID0gYW5vbjsKPj4+ICvCoMKgwqAgdm1hX3Nl
dF9maWxlKHZtYSwgYW5vbik7Cj4+PiArwqDCoMKgIGZwdXQoYW5vbik7Cj4+Cj4+IFRoYXQncyBv
bmUgZnB1dCgpIHRvbyBtYW55LCBpc24ndCBpdD8KPiAKPiBObywgdGhlIG90aGVyIGNhc2VzIHdl
cmUgcmVwbGFjaW5nIHRoZSB2bV9maWxlIHdpdGggc29tZXRoaW5nIHByZS1hbGxvY2F0ZWQgYW5k
IGFsc28gZ3JhYmJlZCBhIG5ldyAKPiByZWZlcmVuY2UuCj4gCj4gQnV0IHRoaXMgY2FzZSBoZXJl
IHVzZXMgdGhlIGZyZXNobHkgYWxsb2NhdGVkIGFub24gZmlsZSBhbmQgc28gdm1hX3NldF9maWxl
KCkgZ3JhYnMgYW5vdGhlciBleHRyYSAKPiByZWZlcmVuY2Ugd2hpY2ggd2UgbmVlZCB0byBkcm9w
Lgo+IAo+IFRoZSBhbHRlcm5hdGl2ZSBpcyB0byBqdXN0IGtlZXAgaXQgYXMgaXQgaXMuIE9waW5p
b25zPwo+IAoKSSB0aGluayBqdXN0IGEgc21hbGwgY29tbWVudCBmb3IgdGhlc2UgY2FzZXMsIGlz
IHByb2JhYmx5IGFib3V0IHJpZ2h0LgoKPj4gLi4uCj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9zdGFnaW5nL2FuZHJvaWQvYXNobWVtLmMgYi9kcml2ZXJzL3N0YWdpbmcvYW5kcm9pZC9hc2ht
ZW0uYwo+Pj4gaW5kZXggMTBiNGJlMWYzZTc4Li5hNTFkYzA4OTg5NmUgMTAwNjQ0Cj4+PiAtLS0g
YS9kcml2ZXJzL3N0YWdpbmcvYW5kcm9pZC9hc2htZW0uYwo+Pj4gKysrIGIvZHJpdmVycy9zdGFn
aW5nL2FuZHJvaWQvYXNobWVtLmMKPj4+IEBAIC00NTAsOSArNDUwLDggQEAgc3RhdGljIGludCBh
c2htZW1fbW1hcChzdHJ1Y3QgZmlsZSAqZmlsZSwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEp
Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgdm1hX3NldF9hbm9ueW1vdXModm1hKTsKPj4+IMKgwqDC
oMKgwqAgfQo+Pj4gwqAgLcKgwqDCoCBpZiAodm1hLT52bV9maWxlKQo+Pj4gLcKgwqDCoMKgwqDC
oMKgIGZwdXQodm1hLT52bV9maWxlKTsKPj4+IC3CoMKgwqAgdm1hLT52bV9maWxlID0gYXNtYS0+
ZmlsZTsKPj4+ICvCoMKgwqAgdm1hX3NldF9maWxlKHZtYSwgYXNtYS0+ZmlsZSk7Cj4+PiArwqDC
oMKgIGZwdXQoYXNtYS0+ZmlsZSk7Cj4+Cj4+IFNhbWUgaGVyZTogdGhhdCBmcHV0KCkgc2VlbXMg
d3JvbmcsIGFzIGl0IHdhcyBhbHJlYWR5IGRvbmUgd2l0aGluIHZtYV9zZXRfZmlsZSgpLgo+IAo+
IE5vLCB0aGF0IGNhc2UgaXMgY29ycmVjdCBhcyB3ZWxsLiBUaGUgQW5kcm9pZCBjb2RlIGhlcmUg
aGFzIHRoZSBtYXRjaGluZyBnZXRfZmlsZSgpIGEgZmV3IGxpbmVzIHVwLCAKPiBzZWUgdGhlIHN1
cnJvdW5kaW5nIGNvZGUuCj4gCj4gSSBkaWRuJ3Qgd2FudGVkIHRvIHJlcGxhY2UgdGhhdCBzaW5j
ZSBpdCBkb2VzIHNvbWUgc3RyYW5nZSBlcnJvciBoYW5kbGluZyBoZXJlLCBzbyB0aGUgcmVzdWx0
IGlzIAo+IHRoYXQgd2UgbmVlZCB0byBkcm9wIHRoZSBleHRyYSByZWZlcmVuY2UgYXMgYWdhaW4u
Cj4gCj4gV2UgY291bGQgYWxzbyBrZWVwIGl0IGxpa2UgaXQgaXMgb3IgbWF5YmUgYmV0dGVyIHB1
dCBhIFRPRE8gY29tbWVudCBvbiBpdC4KPiAKClllYWgsIEkgdGhpbmsgYSBjb21tZW50IGlzIGEg
Z29vZCB3YXkgdG8gZ28uCgoKdGhhbmtzLAotLSAKSm9obiBIdWJiYXJkCk5WSURJQQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
