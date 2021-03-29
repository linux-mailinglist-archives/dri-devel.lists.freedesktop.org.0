Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FAD234E12E
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 08:26:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 292436E851;
	Tue, 30 Mar 2021 06:26:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mengyan1223.wang (mengyan1223.wang [89.208.246.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E7376E4B1;
 Mon, 29 Mar 2021 18:22:04 +0000 (UTC)
Received: from [IPv6:240e:35a:1037:8a00:70b2:e35d:833c:af3e] (unknown
 [IPv6:240e:35a:1037:8a00:70b2:e35d:833c:af3e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-384))
 (Client did not present a certificate)
 (Authenticated sender: xry111@mengyan1223.wang)
 by mengyan1223.wang (Postfix) with ESMTPSA id 5A69D65B2D;
 Mon, 29 Mar 2021 14:21:54 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mengyan1223.wang;
 s=mail; t=1617042124;
 bh=YHCTLOQji1TU6PObSe0lzPj8T+Fg3PTAYM1EeyxrTnQ=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=kScrJxKtrzkjmZaqBTvC/q0aDm55v4zy0NZzfmG1WADUs+/bOimqcylR6UIgZT6SS
 EanGcnOGHOVoE/bcwylAs+rVAUNfdVW1cYCIGQ9vtGj71+VktU83WHF25EicmM1e8G
 7L9YszFJY7ltQ3BJrox9JozuLhrRzg1u5esLN5q6fKWbE57ClR9jwhbZ0eBEVrjHCh
 2/AA5SlkSqjTx1VMFYdYN2hNc75l1rAfwtNY8/9t6xbL3LkpcMgcHv3Di4RLnf6DpO
 eyHR5K/btD0GZXcMaMzxGvaNScXHXcmTQWNfdUhTOUI4JJXSxSoHLIb5W8Q2ljbuI0
 w1zbYPYaij3uw==
Message-ID: <bf9e05d4a6ece3e8bf1f732b011d3e54bbf8000e.camel@mengyan1223.wang>
Subject: Re: [PATCH] drm/amdgpu: fix an underflow on non-4KB-page systems
From: Xi Ruoyao <xry111@mengyan1223.wang>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 Alex Deucher <alexander.deucher@amd.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Date: Tue, 30 Mar 2021 02:21:48 +0800
In-Reply-To: <9a11c873-a362-b5d1-6d9c-e937034e267d@gmail.com>
References: <20210329175348.26859-1-xry111@mengyan1223.wang>
 <d192e2a8-8baf-0a8c-93a9-9abbad992c7d@gmail.com>
 <be9042b9294bda450659d3cd418c5e8759d57319.camel@mengyan1223.wang>
 <9a11c873-a362-b5d1-6d9c-e937034e267d@gmail.com>
User-Agent: Evolution 3.40.0 
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 30 Mar 2021 06:26:26 +0000
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

T24gMjAyMS0wMy0yOSAyMDoxMCArMDIwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiBZb3Ug
bmVlZCB0byBpZGVudGlmeSB0aGUgcm9vdCBjYXVzZSBvZiB0aGlzLCBtb3N0IGxpa2VseSBzdGFy
dCBvciBsYXN0IAo+IGFyZSBub3QgYSBtdWx0aXBsZSBvZiBBTURHUFVfR1BVX1BBR0VTX0lOX0NQ
VV9QQUdFLgoKSSBwcmludGsnZWQgdGhlIHZhbHVlIG9mIHN0YXJ0ICYgbGFzdCwgdGhleSBhcmUg
YWxsIGEgbXVsdGlwbGUgb2YgNAooQU1ER1BVX0dQVV9QQUdFU19JTl9DUFVfUEFHRSkuCgpIb3dl
dmVyLi4uIGBudW1fZW50cmllcyA9IGxhc3QgLSBzdGFydCArIDFgIHNvIGl0IGJlY2FtZSBzb21l
IGlycmF0aW9uYWwKdGhpbmcuLi4gIEVpdGhlciB0aGlzIGxpbmUgaXMgd3JvbmcsIG9yIHNvbWVv
bmUgY2FsbGVkCmFtZGdwdV92bV9ib191cGRhdGVfbWFwcGluZyB3aXRoIFtzdGFydCwgbGFzdCkg
aW5zdGVhZCBvZiBbc3RhcnQsIGxhc3RdLCB3aGljaAppcyB1bmV4cGVjdGVkLgoKPiA+ID4gPiBC
dWdMaW5rOiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2FtZC8tL2lzc3Vlcy8x
NTQ5Cj4gPiA+ID4gRml4ZXM6IGEzOWYyYThkNzA2NiAoImRybS9hbWRncHU6IG51a2UgYW1kZ3B1
X3ZtX2JvX3NwbGl0X21hcHBpbmcgdjIiKQo+ID4gPiA+IFJlcG9ydGVkLWJ5OiBYaSBSdW95YW8g
PHhyeTExMUBtZW5neWFuMTIyMy53YW5nPgo+ID4gPiA+IFJlcG9ydGVkLWJ5OiBEYW4gSG9yw6Fr
IDxkYW5AZGFubnkuY3o+Cj4gPiA+ID4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiA+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBYaSBSdW95YW8gPHhyeTExMUBtZW5neWFuMTIyMy53YW5nPgo+ID4g
PiA+IC0tLQo+ID4gPiA+IMKgwqAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zt
LmMgfCAyICstCj4gPiA+ID4gwqDCoCAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKPiA+ID4gPiAKPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMKPiA+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV92bS5jCj4gPiA+ID4gaW5kZXggYWQ5MWMwYzNjNDIzLi5jZWUwY2M5YzgwODUg
MTAwNjQ0Cj4gPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zt
LmMKPiA+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYwo+
ID4gPiA+IEBAIC0xNzA3LDcgKzE3MDcsNyBAQCBzdGF0aWMgaW50IGFtZGdwdV92bV9ib191cGRh
dGVfbWFwcGluZyhzdHJ1Y3QKPiA+ID4gPiBhbWRncHVfZGV2aWNlICphZGV2LAo+ID4gPiA+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9Cj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoHN0YXJ0ID0gdG1wOwo+ID4gPiA+IMKgwqAgCj4gPiA+ID4gLcKg
wqDCoMKgwqDCoMKgfSB3aGlsZSAodW5saWtlbHkoc3RhcnQgIT0gbGFzdCArIDEpKTsKPiA+ID4g
PiArwqDCoMKgwqDCoMKgwqB9IHdoaWxlICh1bmxpa2VseShzdGFydCA8IGxhc3QgKyAxKSk7Cj4g
PiA+ID4gwqDCoCAKPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqByID0gdm0tPnVwZGF0ZV9mdW5j
cy0+Y29tbWl0KCZwYXJhbXMsIGZlbmNlKTsKPiA+ID4gPiDCoMKgIAo+ID4gPiA+IAo+ID4gPiA+
IGJhc2UtY29tbWl0OiBhNWUxM2M2ZGYwZTQxNzAyZDJiMmM3N2M4YWQ0MTY3N2ViYjA2NWIzCj4g
CgotLSAKWGkgUnVveWFvIDx4cnkxMTFAbWVuZ3lhbjEyMjMud2FuZz4KU2Nob29sIG9mIEFlcm9z
cGFjZSBTY2llbmNlIGFuZCBUZWNobm9sb2d5LCBYaWRpYW4gVW5pdmVyc2l0eQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
