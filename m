Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8933535F1A7
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 12:49:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3FFA6E91C;
	Wed, 14 Apr 2021 10:49:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E73026E91C;
 Wed, 14 Apr 2021 10:49:19 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id w18so23191543edc.0;
 Wed, 14 Apr 2021 03:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=c5Wfs4SnAS/p300GHz4fEjhjx/IFR4SmRgNktrUPEsU=;
 b=LGKBIK2zAN/eArIXbGu0avivycRd9QdoodTQNAfsbNXjEcpGcM3op5wcHSXc0V5a03
 j1Bu0Jp6ozEZ7Rm0Jk59X7n+nOukjKx6oov4ED7KO3RD2/35z2J3OD2jp0a9fYW6SAZb
 17hzORJZLkgWmuSZmsrPjpEKLi32ZwJpgLuP3PVELFqyGCFqjyP48qBmzE80hUaRX5vx
 9ygbX05vD7rAmjIV1B2sAhmz85nSGFWzcUu5irLxILqztyGbF0FirXJEQOw4cQ487+JD
 V1Vn8Y9trDVTrAhxueSxf4blhfBhXpjdVlaDKGW13UOQlb8T3sD+1tfMz0MHpMbHRnDS
 e4nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=c5Wfs4SnAS/p300GHz4fEjhjx/IFR4SmRgNktrUPEsU=;
 b=GdYm2l6x+3SXR2qT3ZzTUtnmXGCCXc7HLkXxrrhTJdoz1x5cS1+zKHFNirWjUjwwO4
 j2yulPlev1QXZqAg8Fr5NvOiyKmKTKR2p3Qd51BdBrACrOhjJz3fRWXKRBUiSXmoI+2E
 xpeS0qqu4u6coIKKdPUumETwK2Pjn7HUEDR9xUmcQK1KYJBxhI3HQIgPywrUhTz63P0J
 CwYqnFwWmc5caaQMLJ4sCSsZ3gLQJx0fUU2ajdh6mEZf4V+Nsf5PkOxgWnChLAbFjWOt
 /PPtAe/K3dl7WSvUIzh5hc9om/gZ32wndWjPAwrJvRhhT/m9NJCNsyAuTeUJrTDML8iI
 e3lQ==
X-Gm-Message-State: AOAM5301BdusF2hmnqQFNg6vhdkoOKX2gyGsebM5JtFhx70eZyUsWMW1
 Ke72nel0DXMKXLXZ6bO8vjwVhYKVsXw=
X-Google-Smtp-Source: ABdhPJxv3oo+wbxhPpN2FTPWiLhSZj/YC2pjja71a1BwUo7Hf7liH1tWh1bqhPLIZx02P20io2ThPQ==
X-Received: by 2002:a05:6402:26d3:: with SMTP id
 x19mr40654108edd.349.1618397358517; 
 Wed, 14 Apr 2021 03:49:18 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:e934:1a45:3324:73c2?
 ([2a02:908:1252:fb60:e934:1a45:3324:73c2])
 by smtp.gmail.com with ESMTPSA id c12sm12148031edx.54.2021.04.14.03.49.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Apr 2021 03:49:18 -0700 (PDT)
Subject: Re: [PATCH 8/9] drm/ttm: Don't count pages in SG BOs against
 pages_limit
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20210414064804.29356-1-Felix.Kuehling@amd.com>
 <20210414064804.29356-9-Felix.Kuehling@amd.com>
 <60d08770-e4f5-4e8f-0a93-2270ae02aa26@gmail.com>
 <YHayqD3IbupkY7b+@phenom.ffwll.local>
 <18a18e85-7b0d-649f-64a3-028376d8de15@amd.com>
 <YHbDQcr6Yl1Lljep@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <7ac3a5e9-abf6-6ea5-af21-25c04e984d57@gmail.com>
Date: Wed, 14 Apr 2021 12:49:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YHbDQcr6Yl1Lljep@phenom.ffwll.local>
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
Cc: Felix Kuehling <Felix.Kuehling@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTQuMDQuMjEgdW0gMTI6MjYgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFdlZCwgQXBy
IDE0LCAyMDIxIGF0IDExOjE5OjQxQU0gKzAyMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+
IEFtIDE0LjA0LjIxIHVtIDExOjE1IHNjaHJpZWIgRGFuaWVsIFZldHRlcjoKPj4+IE9uIFdlZCwg
QXByIDE0LCAyMDIxIGF0IDA4OjUxOjUxQU0gKzAyMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6
Cj4+Pj4gQW0gMTQuMDQuMjEgdW0gMDg6NDggc2NocmllYiBGZWxpeCBLdWVobGluZzoKPj4+Pj4g
UGFnZXMgaW4gU0cgQk9zIHdlcmUgbm90IGFsbG9jYXRlZCBieSBUVE0uIFNvIGRvbid0IGNvdW50
IHRoZW0gYWdhaW5zdAo+Pj4+PiBUVE0ncyBwYWdlcyBsaW1pdC4KPj4+Pj4KPj4+Pj4gU2lnbmVk
LW9mZi1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+Cj4+Pj4gUmV2
aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPj4+
Pgo+Pj4+IEdvaW5nIHRvIHBpY2sgdGhhdCBvbmUgdXAgZm9yIGluY2x1c2lvbiBpbiBkcm0tbWlz
Yy1uZXh0Lgo+Pj4gU2VlIG15IG90aGVyIGVtYWlsLCBidXQgd2h5IGRvIHdlIG5lZWQgdGhpcz8g
QSBiaXQgbW9yZSBleHBsYW5hdGlvbiBpcyBpbW8KPj4+IG5lZWRlZCBoZXJlIGF0IGxlYXN0LCBz
aW5jZSB3ZSBzdGlsbCBuZWVkIHRvIGd1YXJhbnRlZSB0aGF0IGFsbG9jYXRpb25zCj4+PiBkb24n
dCBvdmVyIHRoZSBsaW1pdCBpbiB0b3RhbCBmb3IgYWxsIGdwdSBidWZmZXJzIHRvZ2V0aGVyLiBB
dCBsZWFzdCB1bnRpbAo+Pj4gdGhlIHNocmlua2VyIGhhcyBsYW5kZWQuCj4+Pgo+Pj4gQW5kIHRo
aXMgaGVyZSBqdXN0IG9wZW5zIHVwIHRoZSBiYXJuIGRvb3Igd2l0aG91dCBhbnkgZXhwbGFuYXRp
b24gd2h5IGl0J3MKPj4+IG9rLgo+PiBUaGUgU0cgYmFzZWQgQk9zIG1pZ2h0IG5vdCBldmVuIGJl
IGJhY2tlZCBieSBwYWdlcy4gRS5nLiBleHBvcnRlZCBWUkFNLgo+Pgo+PiBTbyBlaXRoZXIgdGhl
eSBhcmUgZXhwb3J0ZWQgYnkgYSBkcml2ZXIgd2hpY2ggc2hvdWxkIGhhdmUgYWNjb3VudGVkIGZv
ciB0aGUKPj4gYWxsb2NhdGlvbiwgZXhwb3J0ZWQgYnkgVFRNIHdoaWNoIGFscmVhZHkgZGlkIHRo
ZSBhY2NvdW50aW5nIG9yIGRvZXNuJ3QgZXZlbgo+PiBwb2ludCB0byBwYWdlcyBhdCBhbGwuCj4+
Cj4+IFRoaXMgaXMgcmVhbGx5IGEgYnVnIGZpeCB0byByZWNyZWF0ZSB0aGUgYmVoYXZpb3Igd2Ug
aGFkIGJlZm9yZSBtb3ZpbmcgdGhlCj4+IGFjY291bnRpbmcgdG8gdGhpcyBwbGFjZS4KPiBUaHJv
dyB0aGF0IGludG8gdGhlIGNvbW1pdCBtZXNzYWdlIGFuZCBhLWI6IG1lLiBJZGVhbGx5IHdpdGgg
YSBGaXhlczogbGluZQo+IG9yIHNvIHBvaW50aW5nIGF0IHRoZSBvZmZlbmRpbmcgY29tbWl0IHRo
YXQgYnJva2Ugc3R1ZmYuIENvbW1pdCBtZXNzYWdlcwo+IHNob3VsZCByZWFsbHkgZ28gaW50byBt
b3JlIGRldGFpbCB3aGVuIHRoZXJlJ3MgYW4gZW50aXJlIHN0b3J5IGJlaGluZCBhCj4gc21hbGwg
Y2hhbmdlIGxpa2UgdGhpcyBvbmUuCgpTb3JyeSBJIHRob3VnaCB0aGF0IHRoaXMgd291bGQgYmUg
b2J2aW91cyA6KQoKSSd2ZSBhbHJlYWR5IHB1c2hlZCB0aGUgcGF0Y2ggaW4gdGhlIG1vcm5pbmcs
IGJ1dCBnb2luZyB0byBrZWVwIHRoYXQgaW4gCm1pbmQgZm9yIHRoZSBuZXh0IHRpbWUuCgpDaHJp
c3RpYW4uCgo+IC1EYW5pZWwKPgo+PiBDaHJpc3RpYW4uCj4+Cj4+PiAtRGFuaWVsCj4+Pgo+Pj4+
IFJlZ2FyZHMsCj4+Pj4gQ2hyaXN0aWFuLgo+Pj4+Cj4+Pj4+IC0tLQo+Pj4+PiAgICAgZHJpdmVy
cy9ncHUvZHJtL3R0bS90dG1fdHQuYyB8IDI3ICsrKysrKysrKysrKysrKysrKy0tLS0tLS0tLQo+
Pj4+PiAgICAgMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0p
Cj4+Pj4+Cj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV90dC5jIGIv
ZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fdHQuYwo+Pj4+PiBpbmRleCA1ZDg4MjA3MjViNzUuLmU4
YjhjMzI1NzM5MiAxMDA2NDQKPj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fdHQu
Ywo+Pj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV90dC5jCj4+Pj4+IEBAIC0zMTcs
OSArMzE3LDEyIEBAIGludCB0dG1fdHRfcG9wdWxhdGUoc3RydWN0IHR0bV9kZXZpY2UgKmJkZXYs
Cj4+Pj4+ICAgICAJaWYgKHR0bV90dF9pc19wb3B1bGF0ZWQodHRtKSkKPj4+Pj4gICAgIAkJcmV0
dXJuIDA7Cj4+Pj4+IC0JYXRvbWljX2xvbmdfYWRkKHR0bS0+bnVtX3BhZ2VzLCAmdHRtX3BhZ2Vz
X2FsbG9jYXRlZCk7Cj4+Pj4+IC0JaWYgKGJkZXYtPnBvb2wudXNlX2RtYTMyKQo+Pj4+PiAtCQlh
dG9taWNfbG9uZ19hZGQodHRtLT5udW1fcGFnZXMsICZ0dG1fZG1hMzJfcGFnZXNfYWxsb2NhdGVk
KTsKPj4+Pj4gKwlpZiAoISh0dG0tPnBhZ2VfZmxhZ3MgJiBUVE1fUEFHRV9GTEFHX1NHKSkgewo+
Pj4+PiArCQlhdG9taWNfbG9uZ19hZGQodHRtLT5udW1fcGFnZXMsICZ0dG1fcGFnZXNfYWxsb2Nh
dGVkKTsKPj4+Pj4gKwkJaWYgKGJkZXYtPnBvb2wudXNlX2RtYTMyKQo+Pj4+PiArCQkJYXRvbWlj
X2xvbmdfYWRkKHR0bS0+bnVtX3BhZ2VzLAo+Pj4+PiArCQkJCQkmdHRtX2RtYTMyX3BhZ2VzX2Fs
bG9jYXRlZCk7Cj4+Pj4+ICsJfQo+Pj4+PiAgICAgCXdoaWxlIChhdG9taWNfbG9uZ19yZWFkKCZ0
dG1fcGFnZXNfYWxsb2NhdGVkKSA+IHR0bV9wYWdlc19saW1pdCB8fAo+Pj4+PiAgICAgCSAgICAg
ICBhdG9taWNfbG9uZ19yZWFkKCZ0dG1fZG1hMzJfcGFnZXNfYWxsb2NhdGVkKSA+Cj4+Pj4+IEBA
IC0zNTAsOSArMzUzLDEyIEBAIGludCB0dG1fdHRfcG9wdWxhdGUoc3RydWN0IHR0bV9kZXZpY2Ug
KmJkZXYsCj4+Pj4+ICAgICAJcmV0dXJuIDA7Cj4+Pj4+ICAgICBlcnJvcjoKPj4+Pj4gLQlhdG9t
aWNfbG9uZ19zdWIodHRtLT5udW1fcGFnZXMsICZ0dG1fcGFnZXNfYWxsb2NhdGVkKTsKPj4+Pj4g
LQlpZiAoYmRldi0+cG9vbC51c2VfZG1hMzIpCj4+Pj4+IC0JCWF0b21pY19sb25nX3N1Yih0dG0t
Pm51bV9wYWdlcywgJnR0bV9kbWEzMl9wYWdlc19hbGxvY2F0ZWQpOwo+Pj4+PiArCWlmICghKHR0
bS0+cGFnZV9mbGFncyAmIFRUTV9QQUdFX0ZMQUdfU0cpKSB7Cj4+Pj4+ICsJCWF0b21pY19sb25n
X3N1Yih0dG0tPm51bV9wYWdlcywgJnR0bV9wYWdlc19hbGxvY2F0ZWQpOwo+Pj4+PiArCQlpZiAo
YmRldi0+cG9vbC51c2VfZG1hMzIpCj4+Pj4+ICsJCQlhdG9taWNfbG9uZ19zdWIodHRtLT5udW1f
cGFnZXMsCj4+Pj4+ICsJCQkJCSZ0dG1fZG1hMzJfcGFnZXNfYWxsb2NhdGVkKTsKPj4+Pj4gKwl9
Cj4+Pj4+ICAgICAJcmV0dXJuIHJldDsKPj4+Pj4gICAgIH0KPj4+Pj4gICAgIEVYUE9SVF9TWU1C
T0wodHRtX3R0X3BvcHVsYXRlKTsKPj4+Pj4gQEAgLTM4Miw5ICszODgsMTIgQEAgdm9pZCB0dG1f
dHRfdW5wb3B1bGF0ZShzdHJ1Y3QgdHRtX2RldmljZSAqYmRldiwgc3RydWN0IHR0bV90dCAqdHRt
KQo+Pj4+PiAgICAgCWVsc2UKPj4+Pj4gICAgIAkJdHRtX3Bvb2xfZnJlZSgmYmRldi0+cG9vbCwg
dHRtKTsKPj4+Pj4gLQlhdG9taWNfbG9uZ19zdWIodHRtLT5udW1fcGFnZXMsICZ0dG1fcGFnZXNf
YWxsb2NhdGVkKTsKPj4+Pj4gLQlpZiAoYmRldi0+cG9vbC51c2VfZG1hMzIpCj4+Pj4+IC0JCWF0
b21pY19sb25nX3N1Yih0dG0tPm51bV9wYWdlcywgJnR0bV9kbWEzMl9wYWdlc19hbGxvY2F0ZWQp
Owo+Pj4+PiArCWlmICghKHR0bS0+cGFnZV9mbGFncyAmIFRUTV9QQUdFX0ZMQUdfU0cpKSB7Cj4+
Pj4+ICsJCWF0b21pY19sb25nX3N1Yih0dG0tPm51bV9wYWdlcywgJnR0bV9wYWdlc19hbGxvY2F0
ZWQpOwo+Pj4+PiArCQlpZiAoYmRldi0+cG9vbC51c2VfZG1hMzIpCj4+Pj4+ICsJCQlhdG9taWNf
bG9uZ19zdWIodHRtLT5udW1fcGFnZXMsCj4+Pj4+ICsJCQkJCSZ0dG1fZG1hMzJfcGFnZXNfYWxs
b2NhdGVkKTsKPj4+Pj4gKwl9Cj4+Pj4+ICAgICAJdHRtLT5wYWdlX2ZsYWdzICY9IH5UVE1fUEFH
RV9GTEFHX1BSSVZfUE9QVUxBVEVEOwo+Pj4+PiAgICAgfQo+Pj4+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+Pj4gZHJpLWRldmVsIG1haWxpbmcgbGlz
dAo+Pj4+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPj4+PiBodHRwczovL25hbTEx
LnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZsaXN0
cy5mcmVlZGVza3RvcC5vcmclMkZtYWlsbWFuJTJGbGlzdGluZm8lMkZkcmktZGV2ZWwmYW1wO2Rh
dGE9MDQlN0MwMSU3Q2NocmlzdGlhbi5rb2VuaWclNDBhbWQuY29tJTdDMzA3NWQ3ZmQxNjY0NDMy
MmExMzYwOGQ4ZmYyNWQ1OWIlN0MzZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5OTRlMTgzZCU3QzAl
N0MwJTdDNjM3NTM5ODg1MjU1Nzk1MTg3JTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SldJam9p
TUM0d0xqQXdNREFpTENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUz
RCU3QzEwMDAmYW1wO3NkYXRhPUtPbkhBMUNiTkZqak1aUjJyZ0htR2tIJTJCN0M4NFlDdEE2dTlW
MXdCQWF5NCUzRCZhbXA7cmVzZXJ2ZWQ9MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
