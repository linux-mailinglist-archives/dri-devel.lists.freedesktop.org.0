Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9A1359C97
	for <lists+dri-devel@lfdr.de>; Fri,  9 Apr 2021 13:04:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EB706E492;
	Fri,  9 Apr 2021 11:04:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 001E56E492
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Apr 2021 11:04:25 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id w3so8005600ejc.4
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Apr 2021 04:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=6/JnVL8LfaZdf+zS+mi0dG+OAyirzCOEuyoJgncWbSg=;
 b=eq8YU0RewVVk6hub1QGwAdPgMqo88js1FBgRgBvcQ/eyJXx0rrjkdsaRgSy5pVxDE5
 FXsGdJBjo1fLI6eyOd3do+o2BR/+B3lrN+9YF5JdxnHBnxtG6YVixgPtvcI4g6BE/yXf
 S85SCuoabIEhcs2ffoOr5WM62pto6LIZwZI68HCFe7p5hCgbWP21ZowiiUwys/YqUfd+
 EfIKV9vaNj4zLYF/uaalUeXtGwXK9HSqWKfzFIH3MNGRv7QlTbwYsr0ita6/SgygEcYf
 LYKzMGuTsm7MxtLoM5KvLGNVBdxldCOTkFa1SEaxVcmef1vIFgqPsRPp7QowqkI3P6QU
 Zwbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=6/JnVL8LfaZdf+zS+mi0dG+OAyirzCOEuyoJgncWbSg=;
 b=QeusF1ppYFvGIhqBRI30svZYWnHSTzFcnI3dOUx/c1PuAzNUxPXxs23BVx89xCTyQX
 wlN0nIh+SSXXJ6ro45WTzvTqX4bOMqUL4FU0RFqd34UqcJK8FyPp5WWoIyz6fdAyKaEj
 mDINpUBXmxU+6CJcg6UowGmF2lPYSGIoAixzdCLU4oxfVEgHutcFuUE524Jdj46bEqme
 RQ4zhaPOLoX0EnF85apYHmlCCACiOtzFM8b1lJC0Em6QsRCw5GAqyE8oo1wDlNMy7D0d
 IDT+FNL/DBPMs9EAgJ4LBIgY+yNtbN4Sdee3dySBk7ku6TiWzCWTlzjPTss4SB0auIya
 F4Ew==
X-Gm-Message-State: AOAM533l4NIuxMgp0ZgMoVrfqDHziGdmWx7VbEA8qpuCLieD2VoAzABP
 XSUSmqP1851niyGauwueBNE=
X-Google-Smtp-Source: ABdhPJxJNZboaileCS232D/njgL/jwYVi3sL0vyTBT+hTXCmnyaKNCqta3CREGAvoYmQHy0jdYHNYg==
X-Received: by 2002:a17:906:7d02:: with SMTP id
 u2mr129361ejo.249.1617966264746; 
 Fri, 09 Apr 2021 04:04:24 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:ffef:9b69:ce50:8284?
 ([2a02:908:1252:fb60:ffef:9b69:ce50:8284])
 by smtp.gmail.com with ESMTPSA id e15sm1066012ejh.56.2021.04.09.04.04.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Apr 2021 04:04:24 -0700 (PDT)
Subject: Re: [PATCH 1/2] mm/vmscan: add sync_shrinkers function
To: Vlastimil Babka <vbabka@suse.cz>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20210409071725.1532-1-christian.koenig@amd.com>
 <462c2a51-4aa8-47ba-1c67-171ca651b016@suse.cz>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <951bf630-35e4-9b5a-2ace-007a685d1994@gmail.com>
Date: Fri, 9 Apr 2021 13:04:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <462c2a51-4aa8-47ba-1c67-171ca651b016@suse.cz>
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
Cc: akpm@linux-foundation.org, ray.huang@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDkuMDQuMjEgdW0gMTM6MDAgc2NocmllYiBWbGFzdGltaWwgQmFia2E6Cj4gT24gNC85LzIx
IDk6MTcgQU0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+IFRvIGJlIGFibGUgdG8gc3dpdGNo
IHRvIGEgc3BpbmxvY2sgYW5kIHJlZHVjZSBsb2NrIGNvbnRlbnRpb24gaW4gdGhlIFRUTQo+PiBz
aHJpbmtlciB3ZSBkb24ndCB3YW50IHRvIGhvbGQgYSBtdXRleCB3aGlsZSB1bm1hcHBpbmcgYW5k
IGZyZWVpbmcgcGFnZXMKPj4gZnJvbSB0aGUgcG9vbC4KPiBEb2VzIHVzaW5nIHNwaW5sb2NrIGlu
c3RlYWQgb2YgbXV0ZXggcmVhbGx5IHJlZHVjZSBsb2NrIGNvbnRlbnRpb24/CgpXZWxsIHVzaW5n
IHRoZSBzcGlubG9jayBpbnN0ZWFkIG9mIHRoZSBtdXRleCBpcyBvbmx5IHRoZSBjaGVycnkgb24g
dGhlIGNha2UuCgpUaGUgcmVhbCBpbXByb3ZlbWVudCBmb3IgdGhlIGNvbnRlbnRpb24gaXMgdGhl
IGZhY3QgdGhhdCB3ZSBqdXN0IGdyYWIgCnRoZSBuZXh0IHBvb2wgYW5kIGRyb3AgdGhlIGxvY2sg
YWdhaW4gaW5zdGVhZCBvZiBkb2luZyB0aGUgd2hvbGUgSU9NTVUgCnVubWFwIGFuZCBmbHVzaGlu
ZyBvZiB0aGUgQ1BVIFRMQiBkYW5jZSB3aGlsZSBob2xkaW5nIHRoZSBsb2NrLgoKPj4gQnV0IHRo
ZW4gd2Ugc29tZWhvdyBuZWVkIHRvIHByZXZlbnQgYSByYWNlIGJldHdlZW4gKGZvciBleGFtcGxl
KSB0aGUgc2hyaW5rZXIKPj4gdHJ5aW5nIHRvIGZyZWUgcGFnZXMgYW5kIGhvdHBsdWcgdHJ5aW5n
IHRvIHJlbW92ZSB0aGUgZGV2aWNlIHdoaWNoIHRob3NlIHBhZ2VzCj4+IGJlbG9uZyB0by4KPj4K
Pj4gVGFraW5nIGFuZCByZWxlYXNpbmcgdGhlIHNocmlua2VyIHNlbWFwaG9yZSBvbiB0aGUgd3Jp
dGUgc2lkZSBhZnRlcgo+PiB1bm1hcHBpbmcgYW5kIGZyZWVpbmcgYWxsIHBhZ2VzIHNob3VsZCBt
YWtlIHN1cmUgdGhhdCBubyBzaHJpbmtlciBpcyBydW5uaW5nIGluCj4+IHBhcmFsZWxsIGFueSBt
b3JlLgo+IFNvIHlvdSBleHBsYWluIHRoaXMgaW4gdGhpcyBjb21taXQgbG9nIGZvciBhZGRpbmcg
dGhlIGZ1bmN0aW9uLCBidXQgdGhlbiB0aGUKPiBuZXh0IHBhdGNoIGp1c3QgYWRkcyBhIHN5bmNf
c2hyaW5rZXJzKCkgY2FsbCB3aXRob3V0IGFueSBjb21tZW50LiBJIHdvdWxkIGV4cGVjdAo+IHRo
ZXJlIGEgY29tbWVudCBleHBsYWluaW5nIHdoeSBpdCdzIGRvbmUgdGhlcmUgLSB3aGF0IGl0IHBy
b3RlY3RzIGFnYWluc3QsIGFzCj4gaXQncyBub3QgYW4gb2J2aW91cyBwYXR0ZXJuIElNSE8uCgpH
b29kIHBvaW50LCBnb2luZyB0byBhZGQgYSBjb21tZW50LgoKVGhhbmtzLApDaHJpc3RpYW4uCgo+
Cj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1k
LmNvbT4KPj4gLS0tCj4+ICAgaW5jbHVkZS9saW51eC9zaHJpbmtlci5oIHwgIDEgKwo+PiAgIG1t
L3Ztc2Nhbi5jICAgICAgICAgICAgICB8IDEwICsrKysrKysrKysKPj4gICAyIGZpbGVzIGNoYW5n
ZWQsIDExIGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvc2hy
aW5rZXIuaCBiL2luY2x1ZGUvbGludXgvc2hyaW5rZXIuaAo+PiBpbmRleCAwZjgwMTIzNjUwZTIu
LjZiNzVkYzM3MmZjZSAxMDA2NDQKPj4gLS0tIGEvaW5jbHVkZS9saW51eC9zaHJpbmtlci5oCj4+
ICsrKyBiL2luY2x1ZGUvbGludXgvc2hyaW5rZXIuaAo+PiBAQCAtOTIsNCArOTIsNSBAQCBleHRl
cm4gdm9pZCByZWdpc3Rlcl9zaHJpbmtlcl9wcmVwYXJlZChzdHJ1Y3Qgc2hyaW5rZXIgKnNocmlu
a2VyKTsKPj4gICBleHRlcm4gaW50IHJlZ2lzdGVyX3Nocmlua2VyKHN0cnVjdCBzaHJpbmtlciAq
c2hyaW5rZXIpOwo+PiAgIGV4dGVybiB2b2lkIHVucmVnaXN0ZXJfc2hyaW5rZXIoc3RydWN0IHNo
cmlua2VyICpzaHJpbmtlcik7Cj4+ICAgZXh0ZXJuIHZvaWQgZnJlZV9wcmVhbGxvY2VkX3Nocmlu
a2VyKHN0cnVjdCBzaHJpbmtlciAqc2hyaW5rZXIpOwo+PiArZXh0ZXJuIHZvaWQgc3luY19zaHJp
bmtlcnModm9pZCk7Cj4+ICAgI2VuZGlmCj4+IGRpZmYgLS1naXQgYS9tbS92bXNjYW4uYyBiL21t
L3Ztc2Nhbi5jCj4+IGluZGV4IDU2MmU4N2NiZDdhMS4uNDZjZDljMjE1ZDczIDEwMDY0NAo+PiAt
LS0gYS9tbS92bXNjYW4uYwo+PiArKysgYi9tbS92bXNjYW4uYwo+PiBAQCAtNDA4LDYgKzQwOCwx
NiBAQCB2b2lkIHVucmVnaXN0ZXJfc2hyaW5rZXIoc3RydWN0IHNocmlua2VyICpzaHJpbmtlcikK
Pj4gICB9Cj4+ICAgRVhQT1JUX1NZTUJPTCh1bnJlZ2lzdGVyX3Nocmlua2VyKTsKPj4gICAKPj4g
Ky8qKgo+PiArICogc3luY19zaHJpbmtlciAtIFdhaXQgZm9yIGFsbCBydW5uaW5nIHNocmlua2Vy
cyB0byBjb21wbGV0ZS4KPj4gKyAqLwo+PiArdm9pZCBzeW5jX3Nocmlua2Vycyh2b2lkKQo+PiAr
ewo+PiArCWRvd25fd3JpdGUoJnNocmlua2VyX3J3c2VtKTsKPj4gKwl1cF93cml0ZSgmc2hyaW5r
ZXJfcndzZW0pOwo+PiArfQo+PiArRVhQT1JUX1NZTUJPTChzeW5jX3Nocmlua2Vycyk7Cj4+ICsK
Pj4gICAjZGVmaW5lIFNIUklOS19CQVRDSCAxMjgKPj4gICAKPj4gICBzdGF0aWMgdW5zaWduZWQg
bG9uZyBkb19zaHJpbmtfc2xhYihzdHJ1Y3Qgc2hyaW5rX2NvbnRyb2wgKnNocmlua2N0bCwKPj4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
