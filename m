Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8BC36DDB3
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 18:58:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7BC96EC02;
	Wed, 28 Apr 2021 16:58:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5F5B6EC02;
 Wed, 28 Apr 2021 16:58:07 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id g14so15424544edy.6;
 Wed, 28 Apr 2021 09:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=kqWi2XmPuvop6alYq2UmrnC04XIzMf3ip80ZQCMkvBM=;
 b=YEc5iCN5LCEXZIPGDv31RrGILO85mtIqyhAxjjbFN9htvoSgNuUbk009hl/s6hTrWM
 JthTQM2/rGFSfzbqP68ff4gTr4o+d5tABe/07us3FM3HMht/RB+aWPHMXOTkBGwXtRfd
 FwXUvFX3nXviJVkUBWcf/74ClRuxSGY2XLY9eNto3F1hALQ+CJ/qMFRM5jzwaMBxK0+M
 2SxFzuCrSgSxSoFNDqpa0f8oPZVuZ1Xd2HhUOgU23Wi/To48MZSjIWbFW2/XyG/ImLHq
 GtB90uyYSqf72XnCAwmKgJec9s7qjmdzqXnKB+HcJO7AyCI45ccICMer2N4cvtOPWOGI
 awIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=kqWi2XmPuvop6alYq2UmrnC04XIzMf3ip80ZQCMkvBM=;
 b=cUYASdl112T+/VDjXFrpi2NW4eHmb8RHU/QIfv1UlXv3WvQ5TVvdCTRqBo9Nn94q1F
 XsPLRGudwcmSWmWU/R7UByALTcp7zaGWTyA+X46mWOg8v6AQE4VVNJfTOaPHyLRihGdO
 fmheC0AreMmC5T9FU9ekSH8kfrkx+M1bPZSxsbMpIeVNoGE5n/1P5V9eyeYYhWwcBCfd
 kswnEgDt7xA65v4aX7qhmosFxQmONuGn9/0aHcLWImTCK4D+3JI/uqRyYENKmJckW7Q7
 /R+IokT7X4bzqZpEIZgSFNGvnJ83Dz91I5m96ulE5KE0ExuWZFjanhpWgWtBUi05gmd7
 dGfA==
X-Gm-Message-State: AOAM530FBpNc/PgwANKDd8hJXwQi3lEXsmbvLMm1rkoqdjKUF8JlMxcI
 Ddkq41mYOMi81kr4+vCzqbQTw12l/jE=
X-Google-Smtp-Source: ABdhPJwKb97xIBhrv4DWHgQy1ogl5MknqKs8An1vU+rIOd8bdi//tsO9Z2riG2efHEgps8ot3ZqTdA==
X-Received: by 2002:aa7:df8f:: with SMTP id b15mr12837195edy.68.1619629086680; 
 Wed, 28 Apr 2021 09:58:06 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:3f0d:4946:a7a8:ad7c?
 ([2a02:908:1252:fb60:3f0d:4946:a7a8:ad7c])
 by smtp.gmail.com with ESMTPSA id b6sm307763edd.18.2021.04.28.09.58.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 09:58:06 -0700 (PDT)
Subject: Re: [PATCH 1/2] drm/ttm: Don't evict SG BOs
To: Felix Kuehling <felix.kuehling@amd.com>, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org
References: <20210428053338.11560-1-Felix.Kuehling@amd.com>
 <af825fa4-abb3-69a6-48cd-0a6252f72503@gmail.com>
 <83a52589-ce81-35b1-e85d-e9485f9bc233@amd.com>
 <daf8b801-a79c-6033-f782-11ec1951957b@gmail.com>
 <4df6e459-5d14-806d-05b4-95fa8d196b59@amd.com>
 <0fba1262-8fbf-37f0-4d51-c4d74476894b@gmail.com>
 <aabcf10f-7c78-2374-bb3a-d25bf5914ee0@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <6946e644-0a16-30fe-e987-861bec610762@gmail.com>
Date: Wed, 28 Apr 2021 18:58:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <aabcf10f-7c78-2374-bb3a-d25bf5914ee0@amd.com>
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

QW0gMjguMDQuMjEgdW0gMTg6NDkgc2NocmllYiBGZWxpeCBLdWVobGluZzoKPiBBbSAyMDIxLTA0
LTI4IHVtIDEyOjMzIHAubS4gc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+PiBBbSAyOC4wNC4y
MSB1bSAxNzoxOSBzY2hyaWViIEZlbGl4IEt1ZWhsaW5nOgo+PiBbU05JUF0KPj4+Pj4gRmFpbGlu
ZyB0aGF0LCBJJ2QgcHJvYmFibHkgaGF2ZSB0byBhYmFuZG9uIHVzZXJwdHIgQk9zIGFsdG9nZXRo
ZXIgYW5kCj4+Pj4+IHN3aXRjaCBzeXN0ZW0gbWVtb3J5IG1hcHBpbmdzIG92ZXIgdG8gdXNpbmcg
dGhlIG5ldyBTVk0gQVBJIG9uIHN5c3RlbXMKPj4+Pj4gd2hlcmUgaXQgaXMgYXZhbGlhYmxlLgo+
Pj4+IFdlbGwgYXMgbG9uZyBhcyB0aGF0IHByb3ZpZGVzIHRoZSBuZWNlc3NhcnkgZnVuY3Rpb25h
bGl0eSB0aHJvdWdoIEhNTQo+Pj4+IGl0IHdvdWxkIGJlIGFuIG9wdGlvbi4KPj4+IEp1c3QgYW5v
dGhlciB3YXkgb2YgY2lyY3VtdmVudGluZyAiSXQgc2hvdWxkIGxpbWl0IHRoZSBhbW91bnQgb2Yg
c3lzdGVtCj4+PiBtZW1vcnkgdGhlIEdQVSBjYW4gYWNjZXNzIGF0IHRoZSBzYW1lIHRpbWUsIiBh
IHByZW1pc2UgSSBkaXNhZ3JlZSB3aXRoCj4+PiBpbiBjYXNlIG9mIHVzZXJwdHJzIGFuZCBITU0u
IEJvdGggdXNlIHBhZ2VhYmxlLCB1bnBpbm5lZCBtZW1vcnkuCj4+PiBCb3RoIGNhbiBjYXVzZSB0
aGUgR1BVIHRvIGJlIHByZWVtcHRlZCBpbiBjYXNlIG9mIE1NVSBpbnRlcnZhbAo+Pj4gbm90aWZp
ZXJzLgo+PiBXZWxsIHRoYXQncyB0aGUga2V5IHBvaW50LiBHRlggdXNlcnB0cnMgYW5kIERNQS1i
dWYgaW1wb3J0cyBjYW4ndCBiZQo+PiBwcmVlbXB0ZWQuCj4gQnV0IHRoZXkgZG9uJ3QgbmVlZCB0
byBiZS4gVGhleSBkb24ndCB1c2UgYW55IHJlc291cmNlcyBvbiB0aGUgaW1wb3J0aW5nCj4gR1BV
IG9yIHN5c3RlbSBtZW1vcnksIHNvIHdoeSBkbyB3ZSBsaW1pdCB0aGVtPwoKWWVhaCwgYnV0IGF0
IGxlYXN0IHVzZXIgcG9pbnRlciBlZmZlY3RpdmVseSBwaW4gdGhlaXIgYmFja2luZyBzdG9yZSBh
cyAKbG9uZyBhcyB0aGUgR1BVIG9wZXJhdGlvbiBpcyBydW5uaW5nLgoKPiBXaXRoIGR5bmFtaWMg
YXR0YWNobWVudCwgdGhlIGV4cG9ydGVkIEJPcyBjYW4gYmUgZXZpY3RlZCBhbmQgdGhhdAo+IGFm
ZmVjdHMgdGhlIGltcG9ydHMgYXMgd2VsbC4gSSBkb24ndCBzZWUgd2h5IHRoZSBpbXBvcnQgbmVl
ZHMgdG8gYmUKPiBldmljdGVkIGFzIGlmIHRoZXJlIHdhcyBzb21lIHJlc291cmNlIGxpbWl0YXRp
b24gb24gdGhlIGltcG9ydGluZyBHUFUuCgpJdCBwcmV2ZW50cyB0aGF0IG11bHRpcGxlIERNQS1i
dWYgaW1wb3J0cyBhcmUgYWN0aXZlIGF0IHRoZSBzYW1lIHRpbWUuCgpTZWUgdGhlIGZvbGxvd2lu
ZyBleGFtcGxlOiBHVFQgc3BhY2UgaXMgMUdpQiBhbmQgd2UgaGF2ZSB0d28gRE1BLWJ1ZiAKaW1w
b3J0cyBvZiA2MDBNaUIgZWFjaC4KCldoZW4gdXNlcnNwYWNlIHdhbnRzIHRvIHN1Ym1pdCB3b3Jr
IHVzaW5nIGJvdGggYXQgdGhlIHNhbWUgdGltZSB3ZSAKcmV0dXJuIC1FTk9TUEMgKG9yIC1FTk9N
RU0sIG5vdCAxMDAlIHN1cmUpLgoKV2hlbiBvbmUgaXMgaW4gdXNlIGFuZCBhIHN1Ym1pc3Npb24g
bWFkZSB3aXRoIHRoZSBvdGhlciB3ZSBibG9jayB1bnRpbCAKdGhhdCBzdWJtaXNzaW9uIGlzIGNv
bXBsZXRlZC4KClRoaXMgd2F5IHRoZXJlIGlzIG5ldmVyIG1vcmUgdGhhbiAxIEdpQiBvZiBtZW1v
cnkgaW4gdXNlIG9yICJwaW5uZWQiIGJ5IAp0aGUgR1BVIHVzaW5nIGl0LgoKPj4gU28gdGhleSBi
YXNpY2FsbHkgbG9jayB0aGUgYmFja2luZyBtZW1vcnkgdW50aWwgdGhlIGxhc3Qgc3VibWlzc2lv
biBpcwo+PiBjb21wbGV0ZWQgYW5kIHRoYXQgaXMgY2F1c2luZyBwcm9ibGVtcyBpZiBpdCBoYXBw
ZW5zIGZvciB0byBtdWNoCj4+IG1lbW9yeSBhdCB0aGUgc2FtZSB0aW1lLgo+Pgo+PiBXaGF0IHdl
IGNvdWxkIGRvIGlzIHRvIGZpZ3VyZSBvdXQgaW4gdGhlIHZhbHVhYmxlIGNhbGxiYWNrIGlmIHRo
ZSBCTwo+PiBpcyBwcmVlbXB0LWFibGUgb3Igbm90Lgo+IFRoZW4gd2Ugc2hvdWxkIGFsc28gbm90
IGNvdW50IHRoZW0gaW4gbWdyLT5hdmFpbGFibGUuIE90aGVyd2lzZSBub3QKPiBldmljdGluZyB0
aGVzZSBCT3MgY2FuIGJsb2NrIG90aGVyIEdUVCBhbGxvY2F0aW9ucy4gQWdhaW4sIG1heWJlIGl0
J3MKPiBlYXNpZXIgdG8gdXNlIGEgZGlmZmVyZW50IGRvbWFpbiBmb3IgcHJlZW1wdGlibGUgQk9z
LgoKR29vZCBwb2ludC4gVGhhdCB3b3VsZCBhbHNvIGJlIHZhbHVhYmxlIHdoZW4gd2UgZ2V0IHVz
ZXIgcXVldWVzIGF0IHNvbWUgCnBvaW50LgoKUmVnYXJkcywKQ2hyaXN0aWFuLgoKPgo+IFJlZ2Fy
ZHMsCj4gIMKgIEZlbGl4Cj4KPgo+PiBSZWdhcmRzLAo+PiBDaHJpc3RpYW4uCj4+Cj4+PiBTdGF0
aWNhbGx5IGxpbWl0aW5nIHRoZSBhbW91bnQgb2YgcGFnZWFibGUgbWVtb3J5IGFjY2Vzc2libGUg
dG8gR1RUIGlzCj4+PiByZWR1bmRhbnQgYW5kIG92ZXJseSBsaW1pdGluZy4KPj4+Cj4+PiBSZWdh
cmRzLAo+Pj4gIMKgwqAgRmVsaXgKPj4+Cj4+Pgo+Pj4+IFJlZ2FyZHMsCj4+Pj4gQ2hyaXN0aWFu
Lgo+Pj4+Cj4+Pj4+IFJlZ2FyZHMsCj4+Pj4+ICDCoMKgwqAgRmVsaXgKPj4+Pj4KPj4+Pj4KPj4+
Pj4+IENocmlzdGlhbi4KPj4+Pj4+Cj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogRmVsaXggS3VlaGxp
bmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+Cj4+Pj4+Pj4gLS0tCj4+Pj4+Pj4gIMKgwqDCoCBk
cml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIHwgNCArKysrCj4+Pj4+Pj4gIMKgwqDCoCAxIGZp
bGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4+Pj4+Pj4KPj4+Pj4+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+Pj4+Pj4+IGIvZHJpdmVycy9ncHUvZHJtL3R0
bS90dG1fYm8uYwo+Pj4+Pj4+IGluZGV4IGRlMWVjODM4Y2Y4Yi4uMGI5NTM2NTRmZGJmIDEwMDY0
NAo+Pj4+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPj4+Pj4+PiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4+Pj4+Pj4gQEAgLTY1NSw2ICs2NTUsMTAg
QEAgaW50IHR0bV9tZW1fZXZpY3RfZmlyc3Qoc3RydWN0IHR0bV9kZXZpY2UKPj4+Pj4+PiAqYmRl
diwKPj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsaXN0X2Zvcl9lYWNoX2VudHJ5KGJv
LCAmbWFuLT5scnVbaV0sIGxydSkgewo+Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgYm9vbCBidXN5Owo+Pj4+Pj4+ICDCoMKgwqAgK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
LyogRG9uJ3QgZXZpY3QgU0cgQk9zICovCj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
aWYgKGJvLT50dG0gJiYgYm8tPnR0bS0+c2cpCj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBjb250aW51ZTsKPj4+Pj4+PiArCj4+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBpZiAoIXR0bV9ib19ldmljdF9zd2Fwb3V0X2FsbG93YWJsZShibywgY3R4
LAo+Pj4+Pj4+ICZsb2NrZWQsCj4+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJmJ1c3kpKSB7Cj4+Pj4+
Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChidXN5ICYmICFi
dXN5X2JvICYmIHRpY2tldCAhPQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
