Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 373C816FFE9
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 14:30:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29CD86E2A8;
	Wed, 26 Feb 2020 13:30:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A1F66E2A8;
 Wed, 26 Feb 2020 13:30:08 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id a9so3087023wmj.3;
 Wed, 26 Feb 2020 05:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Ld/ybp66n4KWX6g7WWfYbrDjHMdpp5MgbxnlCrzQtS4=;
 b=mJz17XUXy9xkc07qL0VFMz9T7BJzNNNJEyOtDX0U822qA8cJZNbUZuIm5wxB/SzIKa
 7FXHZzhKbQThncKwyTXRvHRsS7z3OaOHWG6d0uRgTjemAA4SUUnXf5FPyu56oUkkU00o
 QPqUtc4FWts9CRfA6YCCajVuhGdPN9N6OkjzQZ7uSxlNM2F6r1+0x6aopW6TXRLWo/8N
 wQUX+ofno/9ayRZOn8CLwRHyYMrKRUjuFfmNfm1McNrprFI389RMyDZHQy7TBeEnH9Th
 sd0xFKe2kdS1434Mf3Psrw6kKoxA5rNSicFPTScWhrb0uekd6CZEY5JhhXxhQ/PDorrq
 Y0EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=Ld/ybp66n4KWX6g7WWfYbrDjHMdpp5MgbxnlCrzQtS4=;
 b=EXAqbkQ71GKKsxJCWBLAs4tXQ6vS2bqZqgANq8r0phWKpXbtaxb/1Y+g6jEgujmLuX
 IxmJZ/08bijXNSRG0wgxq1JbmvfmoJarhzpcn3tgvBwUu50wgxRhTndHxV3NEm2FbvyY
 wmQNDR9A58hON8nYQOKD18YwFwE47D6bwp/E9m6q2eEdTtHUe+rnhIAkZxBZKJ4oUrjh
 DoqSZioys5T5pYlYpDl6llQ7d7O7UAU0+uL/f3ofcgul9i5oSGrAHJTiGn/5W4dTxrUs
 8MkKUZJBddZFR6U0kdpamPIWo5AhMYEvb+sSwodl2dV7cYyem1WMQtX0a6synLO8Z1Bn
 vEbw==
X-Gm-Message-State: APjAAAV0WezItSvHVnO9KzJrGE1pScdfUfiKJyidAjxnKZl+xo8bgrmR
 7liBtOhf+0/2Qk+S5xHYBEy8OT2V
X-Google-Smtp-Source: APXvYqwndObFm3g80mqOkpVrUTLEuF5gD3cL772UroKB6rXWaXjsNEqmQXllZ+fZW2UyjmH0teL8Fg==
X-Received: by 2002:a1c:5443:: with SMTP id p3mr5776319wmi.48.1582723806486;
 Wed, 26 Feb 2020 05:30:06 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id c11sm2557492wrp.51.2020.02.26.05.30.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Feb 2020 05:30:05 -0800 (PST)
Subject: Re: [PATCH] drm/ttm: fix leaking fences via ttm_buffer_object_transfer
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexdeucher@gmail.com>
References: <20200225185614.1058688-1-alexander.deucher@amd.com>
 <0e6fa597-62c4-3dd3-27bf-fa5ddd6ec1a4@gmail.com>
 <CADnq5_Ox=8+drn8TKSYoo6iCF9fQK6rCtD+uRQSFH3qqGQgO9A@mail.gmail.com>
 <42760da2-ad4f-4bc1-ca25-d176fb94a52d@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <33f5a17b-c2f3-1a56-276d-675c520a83fc@gmail.com>
Date: Wed, 26 Feb 2020 14:30:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <42760da2-ad4f-4bc1-ca25-d176fb94a52d@amd.com>
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
Reply-To: christian.koenig@amd.com
Cc: Alex Deucher <alexander.deucher@amd.com>, Ahzo <Ahzo@tutanota.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjUuMDIuMjAgdW0gMjA6MTIgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+IEFtIDI1LjAy
LjIwIHVtIDIwOjExIHNjaHJpZWIgQWxleCBEZXVjaGVyOgo+PiBPbiBUdWUsIEZlYiAyNSwgMjAy
MCBhdCAyOjA5IFBNIENocmlzdGlhbiBLw7ZuaWcKPj4gPGNrb2VuaWcubGVpY2h0enVtZXJrZW5A
Z21haWwuY29tPiB3cm90ZToKPj4+IEFtIDI1LjAyLjIwIHVtIDE5OjU2IHNjaHJpZWIgQWxleCBE
ZXVjaGVyOgo+Pj4+IEZyb206IEFoem8gPEFoem9AdHV0YW5vdGEuY29tPgo+Pj4+Cj4+Pj4gU2V0
IHRoZSBkcm1fZGV2aWNlIHRvIE5VTEwsIHNvIHRoYXQgdGhlIG5ld2x5IGNyZWF0ZWQgYnVmZmVy
IG9iamVjdAo+Pj4+IGRvZXNuJ3QgYXBwZWFyIHRvIHVzZSB0aGUgZW1iZWRkZWQgZ2VtIG9iamVj
dC4KPj4+Pgo+Pj4+IFRoaXMgaXMgbmVjZXNzYXJ5LCBiZWNhdXNlIG90aGVyd2lzZSBubyBjb3Jy
ZXNwb25kaW5nIGRtYV9yZXN2X2ZpbmkgCj4+Pj4gZm9yCj4+Pj4gdGhlIGRtYV9yZXN2X2luaXQg
aXMgY2FsbGVkLCByZXN1bHRpbmcgaW4gYSBtZW1vcnkgbGVhay4KPj4+Pgo+Pj4+IFRoZSBkbWFf
cmVzdl9maW5pIGluIHR0bV9ib19yZWxlYXNlX2xpc3QgaXMgb25seSBjYWxsZWQgaWYgdGhlIAo+
Pj4+IGVtYmVkZGVkCj4+Pj4gZ2VtIG9iamVjdCBpcyBub3QgdXNlZCwgd2hpY2ggaXMgZGV0ZXJt
aW5lZCBieSBjaGVja2luZyBpZiB0aGUKPj4+PiBkcm1fZGV2aWNlIGlzIE5VTEwuCj4+Pj4KPj4+
PiBCdWc6IAo+Pj4+IGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5j
b20vP3VybD1odHRwcyUzQSUyRiUyRmdpdGxhYi5mcmVlZGVza3RvcC5vcmclMkZkcm0lMkZhbWQl
MkZpc3N1ZXMlMkY5NTgmYW1wO2RhdGE9MDIlN0MwMSU3Q2NocmlzdGlhbi5rb2VuaWclNDBhbWQu
Y29tJTdDYWEzZjc3NGRhMDNlNGRmY2MwOWEwOGQ3YmEyNjgzMDUlN0MzZGQ4OTYxZmU0ODg0ZTYw
OGUxMWE4MmQ5OTRlMTgzZCU3QzAlN0MwJTdDNjM3MTgyNTQ2ODc5MTQ0MDMwJmFtcDtzZGF0YT1O
OFd4WVpaUmo1b2JNVTVTTHYwZ2lvZzBhMXNDWWklMkZvdXhTdVdOb20wZ3clM0QmYW1wO3Jlc2Vy
dmVkPTAKPj4+PiBGaXhlczogMWUwNTNiMTBiYTYwICgiZHJtL3R0bTogdXNlIGdlbSByZXNlcnZh
dGlvbiBvYmplY3QiKQo+Pj4+IFNpZ25lZC1vZmYtYnk6IEFoem8gPEFoem9AdHV0YW5vdGEuY29t
Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1k
LmNvbT4KPj4+IEdvb2QgY2F0Y2ggSSB3YXMgdHJ5aW5nIHRvIGh1bnQgdGhhdCBvbmUgZG93biBh
cyB3ZWxsLgo+Pj4KPj4+IFJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4u
a29lbmlnQGFtZC5jb20+Cj4+IENhbiB5b3UgYXBwbHkgaXQgdG8gZHJtLW1pc2M/Cj4KPiBTdXJl
LCBidXQgbm90IHRvZGF5LiBOZWVkIHRvIGdldCB0aGUga2lkcyB0byBiZWQuCgpTbyBqdXN0IHB1
c2hlZCB0byBkcm0tbWlzYy1maXhlcy4gRG8gd2UgYWxzbyBuZWVkIHRoYXQgb24gCmFtZC1zdGFn
aW5nLWRybS1uZXh0PwoKQ2hyaXN0aWFuLgoKPgo+IENocmlzdGlhbi4KPgo+Pgo+PiBUaGFua3Ms
Cj4+Cj4+IEFsZXgKPj4KPj4+PiAtLS0KPj4+PiDCoMKgIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRt
X2JvX3V0aWwuYyB8IDEgKwo+Pj4+IMKgwqAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
Cj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdXRpbC5j
IAo+Pj4+IGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdXRpbC5jCj4+Pj4gaW5kZXggYzhl
MzU5ZGVkMWRmLi40NGMxZTdhZGZiN2MgMTAwNjQ0Cj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3R0bS90dG1fYm9fdXRpbC5jCj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9f
dXRpbC5jCj4+Pj4gQEAgLTUxNCw2ICs1MTQsNyBAQCBzdGF0aWMgaW50IHR0bV9idWZmZXJfb2Jq
ZWN0X3RyYW5zZmVyKHN0cnVjdCAKPj4+PiB0dG1fYnVmZmVyX29iamVjdCAqYm8sCj4+Pj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmYm8tPmJhc2UuYmFzZS5yZXN2ID0gJmZiby0+YmFz
ZS5iYXNlLl9yZXN2Owo+Pj4+Cj4+Pj4gwqDCoMKgwqDCoMKgIGRtYV9yZXN2X2luaXQoJmZiby0+
YmFzZS5iYXNlLl9yZXN2KTsKPj4+PiArwqDCoMKgwqAgZmJvLT5iYXNlLmJhc2UuZGV2ID0gTlVM
TDsKPj4+PiDCoMKgwqDCoMKgwqAgcmV0ID0gZG1hX3Jlc3ZfdHJ5bG9jaygmZmJvLT5iYXNlLmJh
c2UuX3Jlc3YpOwo+Pj4+IMKgwqDCoMKgwqDCoCBXQVJOX09OKCFyZXQpOwo+Pj4+Cj4KPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGFtZC1nZnggbWFp
bGluZyBsaXN0Cj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
