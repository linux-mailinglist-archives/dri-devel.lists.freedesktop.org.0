Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 193D934EA1D
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 16:16:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6F726E90A;
	Tue, 30 Mar 2021 14:16:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mengyan1223.wang (mengyan1223.wang [89.208.246.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EAD46E8B8;
 Tue, 30 Mar 2021 12:04:55 +0000 (UTC)
Received: from [IPv6:240e:35a:1037:8a00:70b2:e35d:833c:af3e] (unknown
 [IPv6:240e:35a:1037:8a00:70b2:e35d:833c:af3e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest
 SHA384) (Client did not present a certificate)
 (Authenticated sender: xry111@mengyan1223.wang)
 by mengyan1223.wang (Postfix) with ESMTPSA id 221F36594D;
 Tue, 30 Mar 2021 08:04:40 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mengyan1223.wang;
 s=mail; t=1617105894;
 bh=9n4noZb5E2aEglOTZKnCbCPj/j/5SXMSR6/nQrd4Z1Y=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=kxJCRiyaZuIykRdtEdnLeNCB1VYo85ccJt3fleCbfgrj3r1qyGVrwAZUVJU3uF4kI
 i2iXYTcWqsr3T9rnfMMri2Y9+l/4fwm39xu9PFgdZMh25sqJY+J5RRAGRRPMeQSJiq
 DxbKp7oM/F44iT7w/Y+z7ZvV+2CvBu3whU2JmmsQ0oneTHcOmyv+KCH1046dUZ8vdI
 PIYzQ5rPlInEZLchxh0a6QnGkiQ86o1QIbbEWB6UVGdnuQEx79v8JDWtPT31SMob5Y
 eDRbFnIiSC1UXko1ZhyEc5kwmZqMr/2PJenlzN1xhgcigd87MpfgzPlYhjhhKZ7Ppm
 Sy8Tfjjy6aBsQ==
Message-ID: <71e3905a5b72c5b97df837041b19175540ebb023.camel@mengyan1223.wang>
Subject: Re: [PATCH] drm/amdgpu: fix an underflow on non-4KB-page systems
From: Xi Ruoyao <xry111@mengyan1223.wang>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 Alex Deucher <alexander.deucher@amd.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Date: Tue, 30 Mar 2021 20:04:32 +0800
In-Reply-To: <368b9b1b7343e35b446bb1028ccf0ae75dc2adc4.camel@mengyan1223.wang>
References: <20210329175348.26859-1-xry111@mengyan1223.wang>
 <d192e2a8-8baf-0a8c-93a9-9abbad992c7d@gmail.com>
 <be9042b9294bda450659d3cd418c5e8759d57319.camel@mengyan1223.wang>
 <9a11c873-a362-b5d1-6d9c-e937034e267d@gmail.com>
 <bf9e05d4a6ece3e8bf1f732b011d3e54bbf8000e.camel@mengyan1223.wang>
 <84b3911173ad6beb246ba0a77f93d888ee6b393e.camel@mengyan1223.wang>
 <97c520ce107aa4d5fd96e2c380c8acdb63d45c37.camel@mengyan1223.wang>
 <7701fb71-9243-2d90-e1e1-d347a53b7d77@gmail.com>
 <368b9b1b7343e35b446bb1028ccf0ae75dc2adc4.camel@mengyan1223.wang>
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

T24gMjAyMS0wMy0zMCAwMzo0MCArMDgwMCwgWGkgUnVveWFvIHdyb3RlOgo+IE9uIDIwMjEtMDMt
MjkgMjE6MzYgKzAyMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gPiBBbSAyOS4wMy4yMSB1
bSAyMToyNyBzY2hyaWViIFhpIFJ1b3lhbzoKPiA+ID4gSGkgQ2hyaXN0aWFuLAo+ID4gPiAKPiA+
ID4gSSBkb24ndCB0aGluayB0aGVyZSBpcyBhbnkgY29uc3RyYWludCBpbXBsZW1lbnRlZCB0byBl
bnN1cmUgYG51bV9lbnRyaWVzICUKPiA+ID4gQU1ER1BVX0dQVV9QQUdFU19JTl9DUFVfUEFHRSA9
PSAwYC7CoCBGb3IgZXhhbXBsZSwgaW4gYGFtZGdwdV92bV9ib19tYXAoKWA6Cj4gPiA+IAo+ID4g
PiDCoMKgwqDCoMKgwqDCoMKgIC8qIHZhbGlkYXRlIHRoZSBwYXJhbWV0ZXJzICovCj4gPiA+IMKg
wqDCoMKgwqDCoMKgwqAgaWYgKHNhZGRyICYgQU1ER1BVX0dQVV9QQUdFX01BU0sgfHwgb2Zmc2V0
ICYgQU1ER1BVX0dQVV9QQUdFX01BU0sKPiA+ID4gPiA+IAo+ID4gPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgc2l6ZSA9PSAwIHx8IHNpemUgJiBBTURHUFVfR1BVX1BBR0VfTUFTSykKPiA+ID4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FSU5WQUw7Cj4gPiA+IAo+
ID4gPiAvKiBzbmlwICovCj4gPiA+IAo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgIHNhZGRyIC89IEFN
REdQVV9HUFVfUEFHRV9TSVpFOwo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgIGVhZGRyIC89IEFNREdQ
VV9HUFVfUEFHRV9TSVpFOwo+ID4gPiAKPiA+ID4gLyogc25pcCAqLwo+ID4gPiAKPiA+ID4gwqDC
oMKgwqDCoMKgwqDCoCBtYXBwaW5nLT5zdGFydCA9IHNhZGRyOwo+ID4gPiDCoMKgwqDCoMKgwqDC
oMKgIG1hcHBpbmctPmxhc3QgPSBlYWRkcjsKPiA+ID4gCj4gPiA+IAo+ID4gPiBJZiB3ZSByZWFs
bHkgd2FudCB0byBlbnN1cmUgKG1hcHBpbmctPmxhc3QgLSBtYXBwaW5nLT5zdGFydCArIDEpICUK
PiA+ID4gQU1ER1BVX0dQVV9QQUdFU19JTl9DUFVfUEFHRSA9PSAwLCB0aGVuIHdlIHNob3VsZCBy
ZXBsYWNlCj4gPiA+ICJBTURHUFVfR1BVX1BBR0VfTUFTSyIKPiA+ID4gaW4gInZhbGlkYXRlIHRo
ZSBwYXJhbWV0ZXJzIiB3aXRoICJQQUdFX01BU0siLgoKSXQgc2hvdWxkIGJlICJ+UEFHRV9NQVNL
IiwgIlBBR0VfTUFTSyIgaGFzIGFuIG9wcG9zaXRlIGNvbnZlbnRpb24gb2YKIkFNREdQVV9HUFVf
UEFHRV9NQVNLIiA6KC4KCj4gPiBZZWFoLCBnb29kIHBvaW50Lgo+ID4gCj4gPiA+IEkgdHJpZWQg
aXQgYW5kIGl0IGJyb2tlIHVzZXJzcGFjZTogWG9yZyBzdGFydHVwIGZhaWxzIHdpdGggRUlOVkFM
IHdpdGgKPiA+ID4gdGhpcwo+ID4gPiBjaGFuZ2UuCj4gPiAKPiA+IFdlbGwgaW4gdGhlb3J5IGl0
IGlzIHBvc3NpYmxlIHRoYXQgd2UgYWx3YXlzIGZpbGwgdGhlIEdQVVZNIG9uIGEgNGsgCj4gPiBi
YXNpcyB3aGlsZSB0aGUgbmF0aXZlIHBhZ2Ugc2l6ZSBvZiB0aGUgQ1BVIGlzIGxhcmdlci4gTGV0
IG1lIGRvdWJsZSAKPiA+IGNoZWNrIHRoZSBjb2RlLgoKT24gbXkgcGxhdGZvcm0sIHRoZXJlIGFy
ZSB0d28gaXNzdWVzIGJvdGggY2F1c2luZyB0aGUgVk0gY29ycnVwdGlvbi4gIE9uZSBpcwpmaXhl
ZCBieSBhZ2Q1Zi9saW51eEBmZTAwMWU3LiAgQW5vdGhlciBpcyBpbiBNZXNhIGZyb20gdXNlcnNw
YWNlOiAgaXQgdXNlcwpgZGV2X2luZm8tPmdhcnRfcGFnZV9zaXplYCBhcyB0aGUgYWxpZ25tZW50
LCBidXQgdGhlIGtlcm5lbCBBTURHUFUgZHJpdmVyCmV4cGVjdHMgaXQgdG8gdXNlIGBkZXZfaW5m
by0+dmlydHVhbF9hZGRyZXNzX2FsaWdubWVudGAuCgpJZiB3ZSBjYW4gbWFrZSB0aGUgY2hhbmdl
IHRvIGZpbGwgdGhlIEdQVVZNIG9uIGEgNGsgYmFzaXMsIHdlIGNhbiBmaXggdGhpcyBpc3N1ZQph
bmQgbWFrZSB2aXJ0dWFsX2FkZHJlc3NfYWxpZ25tZW50ID0gNEsuICBPdGhlcndpc2UsIHdlIHNo
b3VsZCBmb3J0aWZ5IHRoZQpwYXJhbWV0ZXIgdmFsaWRhdGlvbiwgY2hhbmdpbmcgIkFNREdQVV9H
UFVfUEFHRV9NQVNLIiB0byAiflBBR0VfTUFTSyIuICBUaGVuIHRoZQp1c2Vyc3BhY2Ugd2lsbCBq
dXN0IGdldCBhbiBFSU5WQUwsIGluc3RlYWQgb2YgYSBzbGllbnQgVk0gY29ycnVwdGlvbi4gIEFu
ZApzb21lb25lIHNob3VsZCB0ZWxsIE1lc2EgZGV2ZWxvcGVycyB0byBmaXggdGhlIGNvZGUgaW4g
dGhpcyBjYXNlLgotLQpYaSBSdW95YW8gPHhyeTExMUBtZW5neWFuMTIyMy53YW5nPgpTY2hvb2wg
b2YgQWVyb3NwYWNlIFNjaWVuY2UgYW5kIFRlY2hub2xvZ3ksIFhpZGlhbiBVbml2ZXJzaXR5Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
