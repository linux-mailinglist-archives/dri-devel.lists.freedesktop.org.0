Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D752636D473
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 11:05:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C2766E107;
	Wed, 28 Apr 2021 09:05:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F73F6E0BC;
 Wed, 28 Apr 2021 09:05:42 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id e7so73188440edu.10;
 Wed, 28 Apr 2021 02:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=BeKmt1NHaTbYtpCs08/jTGTFQHfbZslUUq2vRiC6yNY=;
 b=biaWQrciu2Op2oVHv1iFt/uMvlGjapbhm98F6u9r5Ik9tx0nMTTXUolvY0fMFnAEHX
 Q4ZdeOceGnnkqoA4dza4z4c0r0VPJ+S8pY9/2O1EXJ2r8GApA7PYKKiymTrnEFYVrCwE
 ayCH2lOvMDGcXNxTeNKcPwplyVzJtEaal3XA8R9IOtkZCk4Dq99CIGLFmdsj7QYopU/2
 zX5/bcOl5QeYQRLIFmCCoxuLiepW1/tf5maHXTHAhtEBCdcw7Fc7BQXo1jkPzMtFb3gd
 CMf6MmQObGg6qJ1G5CeA3c/kliqke2i4aAc8Pcdirk1GsBDrgKhoj23xWLfKXWFpjapB
 6jlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=BeKmt1NHaTbYtpCs08/jTGTFQHfbZslUUq2vRiC6yNY=;
 b=RPQwGjHcVm2PdgbX3Bx0vapDxpBsrNYXDwa0rKdlI7ffiDGpswEe+oAiLnsDZoTNga
 2qj3GiqsfZsxXKfvUlIbVfvh587gF+LkjYaD7kK5gQ1i8FtNJwp4fDdP60zY+MleRUco
 DZIvvhnSVS7cJCjHSUOihK9x2UFSRytinHVqFrH9aEjFdNgAMAuPsArpLvueUo9wC+zy
 7LF01OFNOJnap+/hCjs6o86HI3KbXvuBWlQDS6I6csyWC7nFQ/M2HtqhlLFsj67fgs8O
 35jXiK4lz3SrPaBndnS3AxDtvx88utt36YVC6d3x9nqJ3gqoV6C+VP1Ex3eo43TmrZF6
 Q8OA==
X-Gm-Message-State: AOAM530aT5nvwc4LPVSL/1sup5IrlhIAS+oSFVR5ajMVqhOVH5UwGZp8
 YNT04H1fDUamb6rIwYSayvQec+z8x1w=
X-Google-Smtp-Source: ABdhPJyo27jvqsEYw+ClpczEOcwyE7VAJn7EQBwkK4uMXJL0RBJ/gIEenm4nKmABiGWn6w/PJfQTsA==
X-Received: by 2002:aa7:cd7b:: with SMTP id ca27mr9930748edb.354.1619600740929; 
 Wed, 28 Apr 2021 02:05:40 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:3f0d:4946:a7a8:ad7c?
 ([2a02:908:1252:fb60:3f0d:4946:a7a8:ad7c])
 by smtp.gmail.com with ESMTPSA id w6sm1492062eje.107.2021.04.28.02.05.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 02:05:40 -0700 (PDT)
Subject: Re: [PATCH 1/2] drm/ttm: Don't evict SG BOs
To: Felix Kuehling <felix.kuehling@amd.com>, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org
References: <20210428053338.11560-1-Felix.Kuehling@amd.com>
 <af825fa4-abb3-69a6-48cd-0a6252f72503@gmail.com>
 <83a52589-ce81-35b1-e85d-e9485f9bc233@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <daf8b801-a79c-6033-f782-11ec1951957b@gmail.com>
Date: Wed, 28 Apr 2021 11:05:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <83a52589-ce81-35b1-e85d-e9485f9bc233@amd.com>
Content-Language: en-US
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

QW0gMjguMDQuMjEgdW0gMDk6NDkgc2NocmllYiBGZWxpeCBLdWVobGluZzoKPiBBbSAyMDIxLTA0
LTI4IHVtIDM6MDQgYS5tLiBzY2hyaWViIENocmlzdGlhbiBLw7ZuaWc6Cj4+IEFtIDI4LjA0LjIx
IHVtIDA3OjMzIHNjaHJpZWIgRmVsaXggS3VlaGxpbmc6Cj4+PiBTRyBCT3MgZG8gbm90IG9jY3Vw
eSBzcGFjZSB0aGF0IGlzIG1hbmFnZWQgYnkgVFRNLiBTbyBkbyBub3QgZXZpY3QgdGhlbS4KPj4+
Cj4+PiBUaGlzIGZpeGVzIHVuZXhwZWN0ZWQgZXZpY3Rpb25zIG9mIEtGRCdzIHVzZXJwdHIgQk9z
LiBLRkQgb25seSBleHBlY3RzCj4+PiB1c2VycHRyICJldmljdGlvbnMiIGluIHRoZSBmb3JtIG9m
IE1NVSBub3RpZmllcnMuCj4+IE5BSywgU0cgQk9zIGFsc28gYWNjb3VudCBmb3IgdGhlIG1lbW9y
eSB0aGUgR1BVIGNhbiBjdXJyZW50bHkgYWNjZXNzLgo+Pgo+PiBXZSBjYW4gaWdub3JlIHRoZW0g
Zm9yIHRoZSBhbGxvY2F0ZWQgbWVtb3J5LCBidXQgbm90IGZvciB0aGUgR1RUIGRvbWFpbi4KPiBI
bW0sIHRoZSBvbmx5IHJlYXNvbiBJIGZvdW5kIHRoaXMgcHJvYmxlbSBpcywgdGhhdCBJIGFtIG5v
dyB0ZXN0aW5nIHdpdGgKPiBJT01NVSBlbmFibGVkLiBFdmljdGluZyB0aGUgdXNlcnB0ciBCTyBk
ZXN0cm95cyB0aGUgRE1BIG1hcHBpbmcuIFdpdGhvdXQKPiBJT01NVS1lbmZvcmNlZCBkZXZpY2Ug
aXNvbGF0aW9uIEkgd2FzIGJsaXNzZnVsbHkgdW5hd2FyZSB0aGF0IHRoZQo+IHVzZXJwdHIgQk9z
IHdlcmUgYmVpbmcgZXZpY3RlZC4gVGhlIEdQVVZNIG1hcHBpbmdzIHdlcmUgdW5hZmZlY3RlZCBh
bmQKPiBqdXN0IHdvcmtlZCB3aXRob3V0IHByb2JsZW1zLiBIYXZpbmcgdG8gZXZpY3QgdGhlc2Ug
Qk9zIGlzIGNyaXBwbGluZwo+IEtGRCdzIGFiaWxpdHkgdG8gbWFwIHN5c3RlbSBtZW1vcnkgZm9y
IEdQVSBhY2Nlc3MsIG9uY2UgYWdhaW4uCj4KPiBJIHRoaW5rIHRoaXMgYWZmZWN0cyBub3Qgb25s
eSB1c2VycHRyIEJPcyBidXQgYWxzbyBETUFCdWYgaW1wb3J0cyBmb3IKPiBCT3Mgc2hhcmVkIGJl
dHdlZW4gbXVsdGlwbGUgR1BVcy4KCkNvcnJlY3QsIHllcy4KCj4gVGhlIEdUVCBzaXplIGxpbWl0
YXRpb24gaXMgZW50aXJlbHkgYXJ0aWZpY2lhbC4gQW5kIHRoZSBvbmx5IHJlYXNvbiBJCj4ga25v
dyBvZiBmb3Iga2VlcGluZyBpdCBsaW1pdGVkIHRvIHRoZSBWUkFNIHNpemUgaXMgdG8gd29yayBh
cm91bmQgc29tZQo+IE9PTSBpc3N1ZXMgd2l0aCBHVFQgQk9zLiBBcHBseWluZyB0aGlzIHRvIHVz
ZXJwdHJzIGFuZCBETUFCdWYgaW1wb3J0cwo+IG1ha2VzIG5vIHNlbnNlLiBCdXQgSSB1bmRlcnN0
YW5kIHRoYXQgdGhlIHdheSBUVE0gbWFuYWdlcyB0aGUgR1RUIGRvbWFpbgo+IHRoZXJlIGlzIG5v
IGVhc3kgZml4IGZvciB0aGlzLiBNYXliZSB3ZSdkIGhhdmUgdG8gY3JlYXRlIGEgbmV3IGRvbWFp
bgo+IGZvciB2YWxpZGF0aW5nIFNHIEJPcyB0aGF0J3Mgc2VwYXJhdGUgZnJvbSBHVFQsIHNvIHRo
YXQgVFRNIHdvdWxkIG5vdAo+IHRyeSB0byBhbGxvY2F0ZSBHVFQgc3BhY2UgZm9yIHRoZW0uCgpX
ZWxsIHRoYXQgaXMgY29udHJhZGljdCB0byB3aGF0IHRoZSBHVFQgZG9tYWluIGlzIGFsbCBhYm91
dC4KCkl0IHNob3VsZCBsaW1pdCB0aGUgYW1vdW50IG9mIHN5c3RlbSBtZW1vcnkgdGhlIEdQVSBj
YW4gYWNjZXNzIGF0IHRoZSAKc2FtZSB0aW1lLiBUaGlzIGluY2x1ZGVzIGltcG9ydGVkIERNQS1i
dXMgYXMgd2VsbCBhcyB1c2VycHRycy4KClRoYXQgdGhlIEdQVVZNIG1hcHBpbmdzIGFyZSBzdGls
bCB0aGVyZSBpcyBjZXJ0YWlubHkgYSBidWcgd2Ugc2hvdWxkIApsb29rIGludG8sIGJ1dCBpbiBn
ZW5lcmFsIGlmIHdlIGRvbid0IHdhbnQgdGhhdCBsaW1pdGF0aW9uIHdlIG5lZWQgdG8gCmluY3Jl
YXNlIHRoZSBHVFQgc2l6ZSBhbmQgbm90IHdvcmsgYXJvdW5kIGl0LgoKQnV0IGluY3JlYXNpbmcg
dGhlIEdUVCBzaXplIGluIHR1cm4gYXMgaGFzIGEgaHVnZSBuZWdhdGl2ZSBpbXBhY3Qgb24gT09N
IApzaXR1YXRpb25zIHVwIHRvIHRoZSBwb2ludCB0aGF0IHRoZSBPT00ga2lsbGVyIGNhbid0IHdv
cmsgYW55IG1vcmUuCgo+IEZhaWxpbmcgdGhhdCwgSSdkIHByb2JhYmx5IGhhdmUgdG8gYWJhbmRv
biB1c2VycHRyIEJPcyBhbHRvZ2V0aGVyIGFuZAo+IHN3aXRjaCBzeXN0ZW0gbWVtb3J5IG1hcHBp
bmdzIG92ZXIgdG8gdXNpbmcgdGhlIG5ldyBTVk0gQVBJIG9uIHN5c3RlbXMKPiB3aGVyZSBpdCBp
cyBhdmFsaWFibGUuCgpXZWxsIGFzIGxvbmcgYXMgdGhhdCBwcm92aWRlcyB0aGUgbmVjZXNzYXJ5
IGZ1bmN0aW9uYWxpdHkgdGhyb3VnaCBITU0gaXQgCndvdWxkIGJlIGFuIG9wdGlvbi4KClJlZ2Fy
ZHMsCkNocmlzdGlhbi4KCj4KPiBSZWdhcmRzLAo+ICDCoCBGZWxpeAo+Cj4KPj4gQ2hyaXN0aWFu
Lgo+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFt
ZC5jb20+Cj4+PiAtLS0KPj4+ICDCoCBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIHwgNCAr
KysrCj4+PiAgwqAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+Pj4KPj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIGIvZHJpdmVycy9ncHUvZHJtL3R0
bS90dG1fYm8uYwo+Pj4gaW5kZXggZGUxZWM4MzhjZjhiLi4wYjk1MzY1NGZkYmYgMTAwNjQ0Cj4+
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4+PiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9iby5jCj4+PiBAQCAtNjU1LDYgKzY1NSwxMCBAQCBpbnQgdHRtX21lbV9l
dmljdF9maXJzdChzdHJ1Y3QgdHRtX2RldmljZSAqYmRldiwKPj4+ICDCoMKgwqDCoMKgwqDCoMKg
wqAgbGlzdF9mb3JfZWFjaF9lbnRyeShibywgJm1hbi0+bHJ1W2ldLCBscnUpIHsKPj4+ICDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBib29sIGJ1c3k7Cj4+PiAgwqAgK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgLyogRG9uJ3QgZXZpY3QgU0cgQk9zICovCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBpZiAoYm8tPnR0bSAmJiBiby0+dHRtLT5zZykKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgY29udGludWU7Cj4+PiArCj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgaWYgKCF0dG1fYm9fZXZpY3Rfc3dhcG91dF9hbGxvd2FibGUoYm8sIGN0eCwgJmxvY2tlZCwK
Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgJmJ1c3kpKSB7Cj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBpZiAoYnVzeSAmJiAhYnVzeV9ibyAmJiB0aWNrZXQgIT0KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
