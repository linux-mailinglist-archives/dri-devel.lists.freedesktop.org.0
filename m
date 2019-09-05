Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1BAAA5BA
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 16:25:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5D266E10A;
	Thu,  5 Sep 2019 14:25:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3503A6E107
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 14:25:25 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id g19so2322603otg.13
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2019 07:25:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=E+RP5UlEdwnE5M3v207zco80S1MuGtzYQwRYbxNgOvM=;
 b=kbmV+C72RanZyZCBQuCZGWil6hhqkQ8lmOoPfXBNF1p9uvaQNZvDO+TzRWu1PcDnz3
 kD4UXyPN8F01P9bfJskQk2SKjbRcGrS5aN1U7v6wHCxx+bGZrCtYO6FnqlQnIV10PFh1
 w5IzSILYtXobXytNt3TiaKP6waLYpkR74Qk8nS74X+KAbXSwzGDWXVjimxbCqvTHTjrV
 ID7oIgTTnCvXOijNANb0TQeMqi20RLxwwMemOr9vsmvRAv/EcHashE20ckYQN0LUuqcE
 a8k+lxw0r4yt7SAHcrUlkWASMjaqjoZKT7NdYC2rX0RLKWHjI2yIUEffGNbOk8WpM2YX
 UMnA==
X-Gm-Message-State: APjAAAXmomdWAFLlzmdBsJfSDfT1wu5deHhPXXu9kXKyBJveK21Nen3b
 nCVKoLGtj3ClNfCucOyCGwr2PdskjEuTtOD5U09SUQ==
X-Google-Smtp-Source: APXvYqzPGW08/2WIrfFIz0HDgHG9P+F7pfa5hXKBnhQMHqoAvEFFLe1cP1f0Al3v+E/uRB/fdkMD7qaNyG25yEktgHw=
X-Received: by 2002:a9d:7006:: with SMTP id k6mr2797974otj.303.1567693524288; 
 Thu, 05 Sep 2019 07:25:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190903190642.32588-1-daniel.vetter@ffwll.ch>
 <ed222af0-4d87-88eb-1de0-4020a7cf6cf3@linux.intel.com>
In-Reply-To: <ed222af0-4d87-88eb-1de0-4020a7cf6cf3@linux.intel.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 5 Sep 2019 16:25:13 +0200
Message-ID: <CAKMK7uEjMJZ67hhHKRo0_Drx8NpcuxWoC6VN_JqONrkhZ831Tg@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/atomic: Take the atomic toys away from X
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=E+RP5UlEdwnE5M3v207zco80S1MuGtzYQwRYbxNgOvM=;
 b=jI/0I8lY8nJ9WQA4xJuS6FgJO72verEKAZMd4CxkGU4gsWXhALk0pk/tQRSV9Vaxze
 5wuNi8KNcP4mUCv8ZhOvSZbARnpePMk8CrtPfJndR8flsu3K+q+E3yMvS25RxvxKleUh
 abs/G91wGAs+S3spH+xs8Nwd+oEE45Bfz5wLc=
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
Cc: David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 stable <stable@vger.kernel.org>, Daniel Vetter <daniel.vetter@intel.com>,
 Sean Paul <sean@poorly.run>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgNSwgMjAxOSBhdCA0OjE5IFBNIE1hYXJ0ZW4gTGFua2hvcnN0CjxtYWFydGVu
Lmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+Cj4gT3AgMDMtMDktMjAxOSBvbSAy
MTowNiBzY2hyZWVmIERhbmllbCBWZXR0ZXI6Cj4gPiBUaGUgLW1vZGVzZXR0aW5nIGRkeCBoYXMg
YSB0b3RhbGx5IGJyb2tlbiBpZGVhIG9mIGhvdyBhdG9taWMgd29ya3M6Cj4gPiAtIGRvZXNuJ3Qg
ZGlzYWJsZSBvbGQgY29ubmVjdG9ycywgYXNzdW1pbmcgdGhleSBnZXQgYXV0by1kaXNhYmxlIGxp
a2UKPiA+ICAgd2l0aCB0aGUgbGVnYWN5IHNldGNydGMKPiA+IC0gYXNzdW1lcyBBU1lOQ19GTElQ
IGlzIHdpcmVkIHRocm91Z2ggZm9yIHRoZSBhdG9taWMgaW9jdGwKPiA+IC0gbm90IGEgc2luZ2xl
IGNhbGwgdG8gVEVTVF9PTkxZCj4gPgo+ID4gSW93IHRoZSBpbXBsZW1lbnRhdGlvbiBpcyBhIDE6
MSB0cmFuc2xhdGlvbiBvZiBsZWdhY3kgaW9jdGxzIHRvCj4gPiBhdG9taWMsIHdoaWNoIGlzIGEp
IGJyb2tlbiBiKSBwb2ludGxlc3MuCj4gPgo+ID4gV2UgYWxyZWFkeSBoYXZlIGJ1Z3MgaW4gYm90
aCBpOTE1IGFuZCBhbWRncHUtREMgd2hlcmUgdGhpcyBwcmV2ZW50cyB1cwo+ID4gZnJvbSBlbmFi
bGluZyBuZWF0IGZlYXR1cmVzLgo+ID4KPiA+IElmIGFueW9uZSBldmVyIGNhcmVzIGFib3V0IGF0
b21pYyBpbiBYIHdlIGNhbiBlYXNpbHkgYWRkIGEgbmV3IGF0b21pYwo+ID4gbGV2ZWwgKHJlcS0+
dmFsdWUgPT0gMikgZm9yIFggdG8gZ2V0IGJhY2sgdGhlIHNoaW55IHRveXMuCj4gPgo+ID4gU2lu
Y2UgdGhlc2UgYnJva2VuIHZlcnNpb25zIG9mIC1tb2Rlc2V0dGluZyBoYXZlIGJlZW4gc2hpcHBp
bmcsCj4gPiB0aGVyZSdzIHJlYWxseSBubyBvdGhlciB3YXkgdG8gZ2V0IG91dCBvZiB0aGlzIGJp
bmQuCj4gPgo+ID4gUmVmZXJlbmNlczogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3hv
cmcveHNlcnZlci9pc3N1ZXMvNjI5Cj4gPiBSZWZlcmVuY2VzOiBodHRwczovL2dpdGxhYi5mcmVl
ZGVza3RvcC5vcmcveG9yZy94c2VydmVyL21lcmdlX3JlcXVlc3RzLzE4MAo+ID4gQ2M6IE1hYXJ0
ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+Cj4gPiBDYzog
TWljaGVsIETDpG56ZXIgPG1pY2hlbEBkYWVuemVyLm5ldD4KPiA+IENjOiBBbGV4IERldWNoZXIg
PGFsZXhkZXVjaGVyQGdtYWlsLmNvbT4KPiA+IENjOiBBZGFtIEphY2tzb24gPGFqYXhAcmVkaGF0
LmNvbT4KPiA+IENjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KPiA+IENjOiBEYXZpZCBB
aXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+
ID4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+
Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2lvY3RsLmMgfCAzICsrKwo+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2RybV9pb2N0bC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9pb2N0bC5jCj4gPiBp
bmRleCAyYzEyMGM1OGY3MmQuLjFjYjdiNGMzYzg3YyAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9kcm1faW9jdGwuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9pb2N0bC5j
Cj4gPiBAQCAtMzM0LDYgKzMzNCw5IEBAIGRybV9zZXRjbGllbnRjYXAoc3RydWN0IGRybV9kZXZp
Y2UgKmRldiwgdm9pZCAqZGF0YSwgc3RydWN0IGRybV9maWxlICpmaWxlX3ByaXYpCj4gPiAgICAg
ICAgICAgICAgIGZpbGVfcHJpdi0+dW5pdmVyc2FsX3BsYW5lcyA9IHJlcS0+dmFsdWU7Cj4gPiAg
ICAgICAgICAgICAgIGJyZWFrOwo+ID4gICAgICAgY2FzZSBEUk1fQ0xJRU5UX0NBUF9BVE9NSUM6
Cj4gPiArICAgICAgICAgICAgIC8qIFRoZSBtb2Rlc2V0dGluZyBERFggaGFzIGEgdG90YWxseSBi
cm9rZW4gaWRlYSBvZiBhdG9taWMuICovCj4gPiArICAgICAgICAgICAgIGlmIChzdHJzdHIoY3Vy
cmVudC0+Y29tbSwgIlgiKSkKPiA+ICsgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVPUE5P
VFNVUFA7Cj4gPiAgICAgICAgICAgICAgIGlmICghZHJtX2NvcmVfY2hlY2tfZmVhdHVyZShkZXYs
IERSSVZFUl9BVE9NSUMpKQo+ID4gICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRU9QTk9U
U1VQUDsKPiA+ICAgICAgICAgICAgICAgaWYgKHJlcS0+dmFsdWUgPiAxKQo+Cj4gR29vZCByaWRk
YW5jZSEKPgo+IE1pc3Npbmcgb25lIG1vcmU6Cj4gY29tbWl0IGFiYmMwNjk3ZDVmYmY1M2Y3NGNl
MGJjYmU5MzY2NzAxOTk3NjRjZmEKPiBBdXRob3I6IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhh
dC5jb20+Cj4gRGF0ZTogICBXZWQgQXByIDI0IDE2OjMzOjI5IDIwMTkgKzEwMDAKPgo+ICAgICBk
cm0vZmI6IHJldmVydCB0aGUgaTkxNSBBY3R1YWxseSBjb25maWd1cmUgdW50aWxlZCBkaXNwbGF5
cyBmcm9tIG1hc3Rlcgo+Cj4gICAgIFRoaXMgY29kZSBtb3ZlZCBpbiBoZXJlIGluIG1hc3Rlciwg
c28gcmV2ZXJ0IGl0IHRoZSBzYW1lIHdheS4KPgo+ICAgICBUaGlzIGlzIHRoZSBzYW1lIHJldmVy
dCBhcyA5ZmEyNDYyNTZlMDkgKCJSZXZlcnQgImRybS9pOTE1L2ZiZGV2Ogo+ICAgICBBY3R1YWxs
eSBjb25maWd1cmUgdW50aWxlZCBkaXNwbGF5cyIiKSBpbiBkcm0tZml4ZXMuCj4KPiAgICAgU2ln
bmVkLW9mZi1ieTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KPgo+IENhbiB3ZSB1
bnJldmVydCB0aGF0IG5vdz8KCk15IGlkZWEgaXMgdG8gbGFuZCB0aGlzIGluIGRybS1taXNjLWZp
eGVzIGZpcnN0IChvciBtYXliZQpkcm0tbWlzYy1uZXh0LWZpeGVzKS4gQW5kIHRoZW4gd2UgY2Fu
IGxhbmQgdGhlIHJldmVydCBvZiB0aGUgcmV2ZXJ0Cm9uY2UgdGhhdCdzIGJhY2ttZXJnZWQgaW50
byBkcm0taW50ZWwuIC1maXhlcyBzaW5jZSB0aGlzIG9uZSBoZXJlIGlzCmNjOiBzdGFibGUuCgpB
bmQgeWVzIEknbGwgYWRkIGEgcmVmZXJlbmNlIHRvIHRoYXQgb25lIGluIHRoZSBjb21taXQgbWVz
c2FnZSB3aGVuIG1lcmdpbmcuCgo+IFdpdGggdGhhdCBmaXhlZCwgb24gdGhlIHdob2xlIHNlcmll
czoKPgo+IFJldmlld2VkLWJ5OiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RA
bGludXguaW50ZWwuY29tPgoKVGhhbmtzLCBEYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdh
cmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCis0MSAoMCkgNzkgMzY1IDU3IDQ4IC0gaHR0
cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
