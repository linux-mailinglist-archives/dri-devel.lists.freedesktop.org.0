Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A61E44E5B2
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 12:16:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7321B6E409;
	Fri, 21 Jun 2019 10:16:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6A996E18F;
 Fri, 21 Jun 2019 10:16:46 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id n4so4812282wrs.3;
 Fri, 21 Jun 2019 03:16:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=KolTNQP6ra4O1RP7HxMk8sUl+VD3lcHbpU0xkRGJgCo=;
 b=i5OHOOdHtEBGT1TvVR0vzd5YJ9feqgNJk9vioPAwqXMRz0KhlEBKoCjBWrDVI9lFND
 dYr4J6zkIKjBD3O69LsfdCfIBnfFhFJ/M3fe4ncNx6h6rYUNzrEfwmRKaEcHyI8yX7f6
 FXgoke+GFNzltZwwz88Hw8N+6lYHkg2XHH7tMkVMFKb9hD5gSnzSRSDxG9Yq8U59/70C
 3WnTLzFY2PyQY2tti+afNixUD76LfiHegzmZotVNAVrvQxdftipxorTRN+SaSgnnGZ/r
 HaMR+inQEKsUjV7y55ylO3AlnBjC2+eT2JicTcUKysBBB8KdG94lJRYYGeBsJjVbPdfJ
 QHSg==
X-Gm-Message-State: APjAAAVeWU4gFYqW/0qESg8SoN5ZVXORE4xqGb24rSpERSy6M2WFf3av
 mgfpO4R3t0VA5/iEvAQgq6JUhtwc
X-Google-Smtp-Source: APXvYqytHWGOnpif7notgiIWi/PBOedAp+4MtF/uoAfztW1vlkuqUC4HiiDjWzYT5QjGV2exF+nH7g==
X-Received: by 2002:adf:a443:: with SMTP id e3mr42682247wra.221.1561112205105; 
 Fri, 21 Jun 2019 03:16:45 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id e21sm3546127wra.27.2019.06.21.03.16.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 21 Jun 2019 03:16:44 -0700 (PDT)
Subject: Re: [PATCH 01/13] drm/amdgpu: introduce and honour DRM_FORCE_AUTH
 workaround
To: Daniel Vetter <daniel@ffwll.ch>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
References: <20190527081741.14235-1-emil.l.velikov@gmail.com>
 <20190614120927.GA32412@arch-x1c3>
 <9dbdda6c-8916-e5ae-1676-86828b9890e7@amd.com>
 <20190614155325.GC32412@arch-x1c3>
 <84b3337c-0cdc-44d4-02c6-c56bd729ed47@amd.com>
 <20190620163012.GF1896@arch-x1c3>
 <9cad6e74-4751-0b0a-35d1-e8f0ac4d3efc@amd.com>
 <20190621090953.GZ12905@phenom.ffwll.local>
 <be9f38f5-6bb5-9535-f3d9-bafa83370e0f@amd.com>
 <CAKMK7uE5qO4q3RYNDp22gkMSSJGgz9ChxhuWPYqXO6D1UUvy6Q@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <6b4de1c4-a591-b175-4e9f-8d0b2f956149@gmail.com>
Date: Fri, 21 Jun 2019 12:16:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uE5qO4q3RYNDp22gkMSSJGgz9ChxhuWPYqXO6D1UUvy6Q@mail.gmail.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=KolTNQP6ra4O1RP7HxMk8sUl+VD3lcHbpU0xkRGJgCo=;
 b=NNmceMnFxL6elYRWlIivv+bL3AeYC1npB6aMusRN/Cj92TlIu+wh+Rdv5oJ3qiLnE9
 kcN6bYrEL/ZQ56TX8WWoMNDTEUP8ht3b8EnK4HTRgIa1EswJzplwurfrwaLKYrHZZx3b
 w+agZwT5BeW7vyeEvz/g+JBBpoLZOBL9KjJzgjukSokXNCjMRJ8S0KVLhbmkkxacNYKK
 QOzIH20j6ZJAJOGio9S/xy29tXCEz6WActKqxI3EWoDWyi9D2XeFOW46LzFp/Kl8JILC
 /1AsBPNX/sYY79OrI2MP9ThVtF4RnKofxshWgc2dQEHcXCqiRcjkzRYvaw4K4QbXECfe
 d0Gw==
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
Reply-To: christian.koenig@amd.com
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 David Airlie <airlied@linux.ie>, Emil Velikov <emil.l.velikov@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjEuMDYuMTkgdW0gMTE6MzUgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIEZyaSwgSnVu
IDIxLCAyMDE5IGF0IDExOjI1IEFNIEtvZW5pZywgQ2hyaXN0aWFuCj4gPENocmlzdGlhbi5Lb2Vu
aWdAYW1kLmNvbT4gd3JvdGU6Cj4+IEFtIDIxLjA2LjE5IHVtIDExOjA5IHNjaHJpZWIgRGFuaWVs
IFZldHRlcjoKPj4+IE9uIEZyaSwgSnVuIDIxLCAyMDE5IGF0IDA3OjEyOjE0QU0gKzAwMDAsIEtv
ZW5pZywgQ2hyaXN0aWFuIHdyb3RlOgo+Pj4+IEFtIDIwLjA2LjE5IHVtIDE4OjMwIHNjaHJpZWIg
RW1pbCBWZWxpa292Ogo+Pj4+PiBPbiAyMDE5LzA2LzE0LCBLb2VuaWcsIENocmlzdGlhbiB3cm90
ZToKPj4+Pj4+IEFtIDE0LjA2LjE5IHVtIDE3OjUzIHNjaHJpZWIgRW1pbCBWZWxpa292Ogo+Pj4+
Pj4+IE9uIDIwMTkvMDYvMTQsIEtvZW5pZywgQ2hyaXN0aWFuIHdyb3RlOgo+Pj4+Pj4+PiBBbSAx
NC4wNi4xOSB1bSAxNDowOSBzY2hyaWViIEVtaWwgVmVsaWtvdjoKPj4+Pj4+Pj4+IE9uIDIwMTkv
MDUvMjcsIEVtaWwgVmVsaWtvdiB3cm90ZToKPj4+Pj4+Pj4+IFtTTklQXQo+Pj4+Pj4+Pj4gSGkg
Q2hyaXN0aWFuLAo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBJbiB0aGUgZm9sbG93aW5n
LCBJIHdvdWxkIGxpa2UgdG8gc3VtbWFyaXNlIGFuZCBlbXBoYXNpemUgdGhlIG5lZWQgZm9yCj4+
Pj4+Pj4+PiBEUk1fQVVUSCByZW1vdmFsLiBJIHdvdWxkIGtpbmRseSBhc2sgeW91IHRvIHNwZW5k
IGEgY291cGxlIG9mIG1pbnV0ZXMKPj4+Pj4+Pj4+IGV4dHJhIHJlYWRpbmcgaXQuCj4+Pj4+Pj4+
Pgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IFRvZGF5IERSTSBkcml2ZXJzKiBkbyBub3QgbWFrZSBhbnkg
ZGlzdGluY3Rpb24gYmV0d2VlbiBwcmltYXJ5IGFuZAo+Pj4+Pj4+Pj4gcmVuZGVyIG5vZGUgY2xp
ZW50cy4KPj4+Pj4+Pj4gVGhhdCBpcyBhY3R1YWxseSBub3QgMTAwJSBjb3JyZWN0LiBXZSBoYXZl
IGEgc3BlY2lhbCBjYXNlIHdoZXJlIGEgRFJNCj4+Pj4+Pj4+IG1hc3RlciBpcyBhbGxvd2VkIHRv
IGNoYW5nZSB0aGUgcHJpb3JpdHkgb2YgcmVuZGVyIG5vZGUgY2xpZW50cy4KPj4+Pj4+Pj4KPj4+
Pj4+PiBDYW4geW91IHByb3ZpZGUgYSBsaW5rPyBJIGNhbm5vdCBmaW5kIHRoYXQgY29kZS4KPj4+
Pj4+IFNlZSBhbWRncHVfc2NoZWRfaW9jdGwoKS4KPj4+Pj4+Cj4+Pj4+Pj4+PiBUaHVzIGZvciBh
IHJlbmRlciBjYXBhYmxlIGRyaXZlciwgYW55IHByZW1pc2Ugb2YKPj4+Pj4+Pj4+IHNlcGFyYXRp
b24sIHNlY3VyaXR5IG9yIG90aGVyd2lzZSBpbXBvc2VkIHZpYSBEUk1fQVVUSCBpcyBhIGZhbGxh
Y3kuCj4+Pj4+Pj4+IFllYWgsIHRoYXQncyB3aGF0IEkgYWdyZWUgb24uIEkganVzdCBkb24ndCB0
aGluayB0aGF0IHJlbW92aW5nIERSTV9BVVRICj4+Pj4+Pj4+IG5vdyBpcyB0aGUgcmlnaHQgZGly
ZWN0aW9uIHRvIHRha2UuCj4+Pj4+Pj4+Cj4+Pj4+Pj4gQ291bGQgaGF2ZSBiZWVuIGNsZWFyZXIg
LSBJJ20gdGFsa2luZyBhYm91dCBEUk1fQVVUSCB8IERSTV9SRU5ERVJfQUxMT1cKPj4+Pj4+PiBp
b2N0bHMuCj4+Pj4+Pj4KPj4+Pj4+PiBUaGF0IGFzaWRlLCBjYW4geW91IHByb3Bvc2UgYW4gYWx0
ZXJuYXRpdmUgc29sdXRpb24gdGhhdCBhZGRyZXNzZXMgdGhpcwo+Pj4+Pj4+IGFuZCB0aGUgc2Vj
b25kIHBvaW50IGp1c3QgYmVsb3c/Cj4+Pj4+PiBHaXZlIG1lIGEgZmV3IGRheXMgdG8gd29yayBv
biB0aGlzLCBpdCdzIGFscmVhZHkgRnJpZGF5IDZwbSBoZXJlLgo+Pj4+Pj4KPj4+Pj4gSGkgQ2hy
aXN0aWFuLAo+Pj4+Pgo+Pj4+PiBBbnkgcHJvZ3Jlc3M/IEFzIG1lbnRpb25lZCBlYXJsaWVyLCBJ
J20gT0sgd2l0aCB3cml0aW5nIHRoZSBwYXRjaGVzIGFsdGhvdWdoCj4+Pj4+IEkgd291bGQgbG92
ZSB0byBoZWFyIHlvdXIgcGxhbi4KPj4+PiBGaXJzdCBvZiBhbGwgSSB0cmllZCB0byBkaXNhYmxl
IERSTSBhdXRoZW50aWNhdGlvbiBjb21wbGV0ZWx5IHdpdGggYQo+Pj4+IGtlcm5lbCBjb25maWcg
b3B0aW9uLiBTdXJwcmlzaW5nbHkgdGhhdCBhY3R1YWxseSB3b3JrcyBvdXQgb2YgdGhlIGJveCBh
dAo+Pj4+IGxlYXN0IG9uIHRoZSBBTURHUFUgc3RhY2suCj4+Pj4KPj4+PiBUaGlzIGVmZmVjdGl2
ZWx5IGFsbG93cyB1cyB0byBnZXQgcmlkIG9mIERSSTIgYW5kIHRoZSByZWxhdGVkIHNlY3VyaXR5
Cj4+Pj4gcHJvYmxlbXMuIE9ubHkgdGhpbmcgbGVmdCBmb3IgdGhhdCBpcyB0aGF0IEknbSBqdXN0
IG5vdCBzdXJlIGhvdyB0bwo+Pj4+IHNpZ25hbCB0aGlzIHRvIHVzZXJzcGFjZSBzbyB0aGF0IHRo
ZSBERFggd291bGRuJ3QgYWR2ZXJ0aXNlIERSSTIgYXQgYWxsCj4+Pj4gYW55IG1vcmUuCj4+Pj4K
Pj4+Pgo+Pj4+IEFzIGEgbmV4dCBzdGVwIEkgbG9va2VkIGludG8gaWYgd2UgY2FuIGRpc2FibGUg
dGhlIGNvbW1hbmQgc3VibWlzc2lvbgo+Pj4+IGZvciBEUk0gbWFzdGVyLiBUdXJuZWQgb3V0IHRo
YXQgdGhpcyBpcyByZWxhdGl2ZWx5IGVhc3kgYXMgd2VsbC4KPj4+Pgo+Pj4+IEFsbCB3ZSBoYXZl
IHRvIGRvIGlzIHRvIGZpeCB0aGUgYnVnIE1pY2hlbCBwb2ludGVkIG91dCBhYm91dCBLTVMgaGFu
ZGxlcwo+Pj4+IGZvciBkaXNwbGF5IGFuZCBsZXQgdGhlIEREWCB1c2UgYSByZW5kZXIgbm9kZSBp
bnN0ZWFkIG9mIHRoZSBEUk0gbWFzdGVyCj4+Pj4gZm9yIEdsYW1vci4gU3RpbGwgbmVlZCB0byBz
eW5jIHVwIHdpdGggTWljaGVsIGFuZC9vciBNYXJlayB3aGF0cyB0aGUKPj4+PiBiZXN0IHdheSBv
ZiBkb2luZyB0aGlzLgo+Pj4+Cj4+Pj4KPj4+PiBUaGUgbGFzdCBzdGVwIChhbmQgdGhhdCdzIHdo
YXQgSSBoYXZlbid0IHRyaWVkIHlldCkgd291bGQgYmUgdG8gZGlzYWJsZQo+Pj4+IERSTSBhdXRo
ZW50aWNhdGlvbiBmb3IgTmF2aSBldmVuIHdoZW4gaXQgaXMgc3RpbGwgY29tcGlsZWQgaW50byB0
aGUKPj4+PiBrZXJuZWwuIEJ1dCB0aGF0IGlzIG1vcmUgb3IgbGVzcyBqdXN0IGEgdHlwaW5nIGV4
ZXJjaXNlLgo+Pj4gU28ganVzdCB0byBnZXQgdGhpcyBzdHJhaWdodCwgd2UncmUgbm93IGZ1bGwg
b24gZW1icmFjaW5nIGEgc3Vic3lzdGVtCj4+PiBzcGxpdCBoZXJlOgo+Pj4gLSBhbWRncHUgcGxh
bnMgdG8gZGl0Y2ggZHJpMi9yZW5kZXJpbmcgb24gcHJpbWFyeSBub2Rlcwo+Pj4gLSBidW5jaCBv
ZiBkcml2ZXJzIChJIHRoaW5rIG1vcmUgdGhhbiBpOTE1IGJ5IG5vdykgbWVyZ2VkIHRoZSBEUk1f
QVVUSAo+Pj4gICAgIHJlbW92YWwKPj4+IC0gb3RoZXJzIGFyZSBqdXN0IGhhbmdpbmcgaW4gdGhl
cmUgc29tZWhvdwo+Pj4KPj4+ICJiZXN0IG9mIGJvdGheVyB3b3JsZHMiIGZ0dz8KPj4gWWVzLCBl
eGFjdGx5IQo+Pgo+PiBUaGluayBhIHN0ZXAgZnVydGhlciwgd2hlbiB0aGlzIGlzIHVwc3RyZWFt
IHdlIGNhbiBhcHBseSB0aGUgRFJNX0FVVEgKPj4gcmVtb3ZhbCB0byBhbWRncHUgYXMgd2VsbC4K
Pj4KPj4gQmVjYXVzZSB3ZSBzaW1wbHkgbWFkZSBzdXJlIHRoYXQgdXNlcnNwYWNlIGlzIHVzaW5n
IHRoZSByZW5kZXIgbm9kZSBmb3IKPj4gY29tbWFuZCBzdWJtaXNzaW9uIGFuZCBub3QgdGhlIHBy
aW1hcnkgbm9kZS4KPj4KPj4gU28gbm9ib2R5IGNhbiBnbyBhaGVhZCBhbmQgcmVtb3ZlIHJlbmRl
ciBub2RlIHN1cHBvcnQgYW55IG1vcmUgOikKPiBIb3cgZG9lcyB0aGlzIHdvcms/IEkgdGhvdWdo
dCB0aGUgZW50aXJlIHByb2JsZW0gb2YgRFJNX0FVVEggcmVtb3ZhbAo+IGZvciB5b3Ugd2FzIHRo
YXQgaXQgYnJva2Ugc3R1ZmYsIGFuZCB5b3UgZGlkbid0IHdhbnQgdG8gZGVhbCB3aXRoCj4gdGhh
dC4KClllYWgsIHRoYXQgaXMgaW5kZWVkIHN0aWxsIHRydWUuCgpJdCdzIGp1c3QgdGhhdCB3ZSBo
YXZlIGRvbmUgd2F5IHRvIG1hbnkgcHJvamVjdHMgd2l0aCByYWRlb24vYW1kZ3B1IGFuZCAKY3Vz
dG9taXplZCB1c2Vyc3BhY2Ugc3R1ZmYuCgo+IFdlIHN0aWxsIGhhdmUgdGhhdCBleGFjdCBwcm9i
bGVtIGFmYWljcyAuLi4gb2xkIHVzZXJzcGFjZQo+IGRvZXNuJ3Qgc2ltcGx5IHZhbmlzaCwgZXZl
biBpZiB5b3UgZW50aXJlbHkgbnVrZSBpdCBnb2luZyBmb3J3YXJkLgoKV2VsbCBvbGQgdXNlcnNw
YWNlIGRvZXNuJ3Qgd29yayB3aXRoIG5ldyBoYXJkd2FyZSBlaXRoZXIuCgpTbyB0aGUgaWRlYSBp
cyB0byBrZWVwIG9sZCB1c2Vyc3BhY2UgZm9yIG9sZCBoYXJkd2FyZSB3b3JraW5nLCBidXQgb25s
eSAKZGlzYWJsZSBvbGQgc3R1ZmYgZm9yIG5ldyBoYXJkd2FyZS4KCj4gQWxzbywgdGVzdGluZyBv
biB0aGUgYW1kZ3B1IHN0YWNrIGlzbid0IHJlYWxseSB0ZXN0aW5nIGEgaG9sZSBsb3QKPiBoZXJl
LCBpdCdzIGFsbCB0aGUgdmFyaW91cyBzaWxseSBjb21wb3NpdG9ycyBvdXQgdGhlcmUgSSdkIGV4
cGVjdCB0bwo+IGZhbGwgb3Zlci4gV2lsbCBnYm0vcmFkZW9uc2kvd2hhdGV2ZXIganVzdCBpbnRl
cm5hbGx5IGRvIGFsbCB0aGUKPiBuZWNlc3NhcnkgZG1hLWJ1ZiBpbXBvcnQvZXhwb3J0IGJldHdl
ZW4gdGhlIHByaW1hcnkgbm9kZSBhbmQgZGlzcGxheQo+IG5vZGUgdG8ga2VlcCB0aGlzIGFsbCB3
b3JraW5nPwoKWWVzLCBhdCBsZWFzdCB0aGF0J3MgaG93IEkgdW5kZXJzdGFuZCBNaWNoZWwncyBp
ZGVhLgoKV2Uga2VlcCBib3RoIGZpbGUgZGVzY3JpcHRvcnMgZm9yIHByaW1hcnkgYW5kIHJlbmRl
ciBub2RlIGFyb3VuZCBhdCB0aGUgCnNhbWUgdGltZSBhbnl3YXkuIFNvIHRoZSBjaGFuZ2UgaXMg
YWN0dWFsbHkgbm90IHRoYXQgbXVjaC4KClRoaXMgYWxzbyBzb2x2ZXMgdGhlIHByb2JsZW0gdGhh
dCBwZW9wbGUgYXJlIHJ1bm5pbmcgdGhpbmdzIGFzIHJvb3QsIApzaW5jZSB3ZSBub3cgYWx3YXlz
IHVzZSB0aGUgcmVuZGVyIG5vZGUgYW5kIG5ldmVyIHRoZSBwcmltYXJ5IG5vZGUgZm9yIApldmVy
eXRoaW5nIGV4Y2VwdCBLTVMuCgpDaHJpc3RpYW4uCgo+IC1EYW5pZWwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
