Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DFF164D75
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 19:13:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB58D6EC6A;
	Wed, 19 Feb 2020 18:13:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00BC06EC6A
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 18:13:04 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id w6so1077383otk.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 10:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZzKbciILodQZwZCVLUIH7Vj/FJXiSd3XpqiCCslUf8c=;
 b=N7h4SdjZeNnEbxSG9DVFYrDagxi10yAZAhCQ6Vy3/qccUsk/YRv//2fvHttlJ+/oNV
 Tg3LJ2tOCfRTwUYxlft+6ZChQHOkUSg4Go9XPc7xSq636MckSs3xACQpNjLVR9hVSvC7
 OtJVb3rRRqcvw/3dBFXwGT+3isBbN/5JMUsaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZzKbciILodQZwZCVLUIH7Vj/FJXiSd3XpqiCCslUf8c=;
 b=oXInhR9Ui+8eU5HAdBiwzqhgihi4ynDuXN80CKo7QD6FqiT6+0vxZw3j6rMD/xGsJ2
 QB37faTl2zeSLLMHQvH4rK40R3etUu0kar3tqyyB200M7Himwp+bc1efTFxtBb7SAjR0
 TRdYkUlcTX7OLS1xvv+QHrGZotGu39ZFJqFyFJfgDccUdlzNij4I6IHv4jP/R/rDzCDk
 esKlLe2GT73KIHkV75kv4mVFqneFtErBH7UVF/bJUMN43dFxx3RVop7aMxWiH9yYlrDX
 4Sa8+NjiZPupLUp3PRCKuUjG/hxkP361kotzM0mlXHhrAdclTCO5pqlj3UaLlczNJhwf
 NxQQ==
X-Gm-Message-State: APjAAAUxfYkGN4IxItP0wOcv67ZI53DclCWihpHQapLwR5pOqw70SHxg
 MifLj9ZgvxM9C++/NNzg6JTPu9wKwRG5QpGjR87PdQ==
X-Google-Smtp-Source: APXvYqx/EAQ2iR3evGAEiOGC7DHhrZPm1E8Gw3iXoWGyoasM6ytc7c3z5JRxOaITUvJMWz+Fegf7QIPfZT3ROLdQJtQ=
X-Received: by 2002:a9d:7696:: with SMTP id j22mr21780827otl.188.1582135984162; 
 Wed, 19 Feb 2020 10:13:04 -0800 (PST)
MIME-Version: 1.0
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
 <20200219102122.1607365-28-daniel.vetter@ffwll.ch>
 <20200219134956.GG5070@pendragon.ideasonboard.com>
 <CAKMK7uEn6WobnrLf9AeqVgMjbtKExsHt64yvaQ_RtBSpk7h2gw@mail.gmail.com>
 <20200219160756.GZ5070@pendragon.ideasonboard.com>
 <CAKMK7uFjHCi=NnejipMM9t0daTa58r6JwvCLfOqpPs=rM8YRWg@mail.gmail.com>
 <4779be42-3386-3e0b-e9df-bf6d982496c1@tronnes.org>
In-Reply-To: <4779be42-3386-3e0b-e9df-bf6d982496c1@tronnes.org>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 19 Feb 2020 19:12:53 +0100
Message-ID: <CAKMK7uEjr8uCAKUjJWuQa8KR2anV764+pzR-=n-0nWTVMPGv9Q@mail.gmail.com>
Subject: Re: [PATCH 27/52] drm: Manage drm_mode_config_init with drmm_
To: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBGZWIgMTksIDIwMjAgYXQgNjozMCBQTSBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0
cm9ubmVzLm9yZz4gd3JvdGU6Cj4KPgo+Cj4gRGVuIDE5LjAyLjIwMjAgMTcuMjMsIHNrcmV2IERh
bmllbCBWZXR0ZXI6Cj4gPiBPbiBXZWQsIEZlYiAxOSwgMjAyMCBhdCA1OjA4IFBNIExhdXJlbnQg
UGluY2hhcnQKPiA+IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+IHdyb3RlOgo+
ID4+Cj4gPj4gSGkgRGFuaWVsLAo+ID4+Cj4gPj4gT24gV2VkLCBGZWIgMTksIDIwMjAgYXQgMDQ6
NDc6NTVQTSArMDEwMCwgRGFuaWVsIFZldHRlciB3cm90ZToKPiA+Pj4gT24gV2VkLCBGZWIgMTks
IDIwMjAgYXQgMjo1MCBQTSBMYXVyZW50IFBpbmNoYXJ0IHdyb3RlOgo+ID4+Pj4gT24gV2VkLCBG
ZWIgMTksIDIwMjAgYXQgMTE6MjA6NTdBTSArMDEwMCwgRGFuaWVsIFZldHRlciB3cm90ZToKPiA+
Pj4+PiBkcm1fbW9kZV9jb25maWdfY2xlYW51cCBpcyBpZGVtcG90ZW50LCBzbyBubyBoYXJtIGlu
IGNhbGxpbmcgdGhpcwo+ID4+Pj4+IHR3aWNlLiBUaGlzIGFsbG93cyB1cyB0byBncmFkdWFsbHkg
c3dpdGNoIGRyaXZlcnMgb3ZlciBieSByZW1vdmluZwo+ID4+Pj4+IGV4cGxpY2l0IGRybV9tb2Rl
X2NvbmZpZ19jbGVhbnVwIGNhbGxzLgo+ID4+Pj4+Cj4gPj4+Pj4gV2l0aCB0aGlzIHN0ZXAgaXQn
cyBub3QgYWxzbyBwb3NzaWJsZSB0aGF0IChhdCBsZWFzdCBmb3Igc2ltcGxlCj4gPj4+Pj4gZHJp
dmVycykgYXV0b21hdGljIHJlc291cmNlIGNsZWFudXAgY2FuIGJlIGRvbmUgY29ycmVjdGx5IHdp
dGhvdXQgYQo+ID4+Pj4+IGRybV9kcml2ZXItPnJlbGVhc2UgaG9vay4gVGhlcmVmb3JlIGFsbG93
IHRoaXMgbm93IGluCj4gPj4+Pj4gZGV2bV9kcm1fZGV2X2luaXQoKS4KPiA+Pj4+Pgo+ID4+Pj4+
IEFsc28gd2l0aCBkcm1tXyBleHBsaWNpdCBkcm1fZHJpdmVyLT5yZWxlYXNlIGhvb2tzIGFyZSBr
aW5kYSBub3QgdGhlCj4gPj4+Pj4gYmVzdCBvcHRpb24sIHNvIGRlcHJlY2F0ZSB0aGF0IGhvb2sg
dG8gZGlzY291cmFnZSBmdXR1cmUgdXNlcnMuCj4gPj4+Pj4KPiA+Pj4+PiB2MjogRml4dXAgdGhl
IGV4YW1wbGUgaW4gdGhlIGtlcm5lbGRvYyB0b28uCj4gPj4+Pj4KPiA+Pj4+PiBDYzogIk5vcmFs
ZiBUcsO4bm5lcyIgPG5vcmFsZkB0cm9ubmVzLm9yZz4KPiA+Pj4+PiBDYzogU2FtIFJhdm5ib3Jn
IDxzYW1AcmF2bmJvcmcub3JnPgo+ID4+Pj4+IENjOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1l
cm1hbm5Ac3VzZS5kZT4KPiA+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWwudmV0dGVyQGludGVsLmNvbT4KPiA+Pj4+PiAtLS0KPgo+IDxzbmlwPgo+Cj4gPj4+Pj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZV9jb25maWcuYyBiL2RyaXZlcnMvZ3B1
L2RybS9kcm1fbW9kZV9jb25maWcuYwo+ID4+Pj4+IGluZGV4IDA4ZTZlZmY2YTE3OS4uOTU3ZGIx
ZWRiYTBjIDEwMDY0NAo+ID4+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZV9jb25m
aWcuYwo+ID4+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZV9jb25maWcuYwo+ID4+
Pj4+IEBAIC0yNSw2ICsyNSw3IEBACj4gPj4+Pj4gICNpbmNsdWRlIDxkcm0vZHJtX2Rydi5oPgo+
ID4+Pj4+ICAjaW5jbHVkZSA8ZHJtL2RybV9lbmNvZGVyLmg+Cj4gPj4+Pj4gICNpbmNsdWRlIDxk
cm0vZHJtX2ZpbGUuaD4KPiA+Pj4+PiArI2luY2x1ZGUgPGRybS9kcm1fbWFuYWdlZC5oPgo+ID4+
Pj4+ICAjaW5jbHVkZSA8ZHJtL2RybV9tb2RlX2NvbmZpZy5oPgo+ID4+Pj4+ICAjaW5jbHVkZSA8
ZHJtL2RybV9wcmludC5oPgo+ID4+Pj4+ICAjaW5jbHVkZSA8bGludXgvZG1hLXJlc3YuaD4KPiA+
Pj4+PiBAQCAtMzczLDYgKzM3NCwxMSBAQCBzdGF0aWMgaW50IGRybV9tb2RlX2NyZWF0ZV9zdGFu
ZGFyZF9wcm9wZXJ0aWVzKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCj4gPj4+Pj4gICAgICAgcmV0
dXJuIDA7Cj4gPj4+Pj4gIH0KPiA+Pj4+Pgo+ID4+Pj4+ICtzdGF0aWMgdm9pZCBkcm1fbW9kZV9j
b25maWdfaW5pdF9yZWxlYXNlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKnB0cikKPiA+
Pj4+PiArewo+ID4+Pj4+ICsgICAgIGRybV9tb2RlX2NvbmZpZ19jbGVhbnVwKGRldik7Cj4gPj4+
Pj4gK30KPiA+Pj4+PiArCj4gPj4+Pj4gIC8qKgo+ID4+Pj4+ICAgKiBkcm1fbW9kZV9jb25maWdf
aW5pdCAtIGluaXRpYWxpemUgRFJNIG1vZGVfY29uZmlndXJhdGlvbiBzdHJ1Y3R1cmUKPiA+Pj4+
PiAgICogQGRldjogRFJNIGRldmljZQo+ID4+Pj4+IEBAIC0zODQsOCArMzkwLDEwIEBAIHN0YXRp
YyBpbnQgZHJtX21vZGVfY3JlYXRlX3N0YW5kYXJkX3Byb3BlcnRpZXMoc3RydWN0IGRybV9kZXZp
Y2UgKmRldikKPiA+Pj4+PiAgICogcHJvYmxlbSwgc2luY2UgdGhpcyBzaG91bGQgaGFwcGVuIHNp
bmdsZSB0aHJlYWRlZCBhdCBpbml0IHRpbWUuIEl0IGlzIHRoZQo+ID4+Pj4+ICAgKiBkcml2ZXIn
cyBwcm9ibGVtIHRvIGVuc3VyZSB0aGlzIGd1YXJhbnRlZS4KPiA+Pj4+PiAgICoKPiA+Pj4+PiAr
ICogQ2xlYW51cCBpcyBhdXRvbWF0aWNhbGx5IGhhbmRsZWQgdGhyb3VnaCByZWdpc3RlcmluZyBk
cm1fbW9kZV9jb25maWdfY2xlYW51cAo+ID4+Pj4+ICsgKiB3aXRoIGRybW1fYWRkX2FjdGlvbigp
Lgo+ID4+Pj4+ICAgKi8KPiA+Pj4+PiAtdm9pZCBkcm1fbW9kZV9jb25maWdfaW5pdChzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2KQo+ID4+Pj4+ICtpbnQgZHJtX21vZGVfY29uZmlnX2luaXQoc3RydWN0
IGRybV9kZXZpY2UgKmRldikKPiA+Pj4+PiAgewo+ID4+Pj4+ICAgICAgIG11dGV4X2luaXQoJmRl
di0+bW9kZV9jb25maWcubXV0ZXgpOwo+ID4+Pj4+ICAgICAgIGRybV9tb2Rlc2V0X2xvY2tfaW5p
dCgmZGV2LT5tb2RlX2NvbmZpZy5jb25uZWN0aW9uX211dGV4KTsKPiA+Pj4+PiBAQCAtNDQzLDYg
KzQ1MSw4IEBAIHZvaWQgZHJtX21vZGVfY29uZmlnX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRl
dikKPiA+Pj4+PiAgICAgICAgICAgICAgIGRybV9tb2Rlc2V0X2FjcXVpcmVfZmluaSgmbW9kZXNl
dF9jdHgpOwo+ID4+Pj4+ICAgICAgICAgICAgICAgZG1hX3Jlc3ZfZmluaSgmcmVzdik7Cj4gPj4+
Pj4gICAgICAgfQo+ID4+Pj4+ICsKPiA+Pj4+PiArICAgICByZXR1cm4gZHJtbV9hZGRfYWN0aW9u
KGRldiwgZHJtX21vZGVfY29uZmlnX2luaXRfcmVsZWFzZSwgTlVMTCk7Cj4gPj4+Pgo+ID4+Pj4g
SWYgdGhpcyBmYWlscywgc2hvdWxkbid0IGRybV9tb2RlX2NvbmZpZ19jbGVhbnVwKCkgYmUgY2Fs
bGVkIGhlcmUgPwo+ID4+Pgo+ID4+PiBNYXliZSBmb3Igb2NkIHJlYXNvbnMsIGJ1dCBub3QgZm9y
IGFjdHVhbGx5IGNsZWFuaW5nIHVwIGFueXRoaW5nLiBJdCdzCj4gPj4+IGp1c3QgYSBidW5jaCBv
ZiBlbXB0eSBsaXN0cyB0aGF0IGRybV9tb2RlX2NvbmZpZ19jbGVhbnVwIHdpbGwgd2FsayBhbmQK
PiA+Pj4gZG8gbm90aGluZyBhYm91dC4gTm90IHN1cmUgSSBzaG91bGQgYWRkIHRoYXQgLi4uCj4g
Pj4KPiA+PiBIb3cgYWJvdXQgdGhlIGlkYSBpbml0LCBhbmQgdGhlIG11dGV4X2luaXQoKSB0aGF0
IGlzbid0IGEgbm8tb3Agd2hlbgo+ID4+IGxvY2sgZGVidWdnaW5nIGlzIGVuYWJsZWQgPwo+ID4K
PiA+IEhtIHJpZ2h0LCBJJ2xsIGZpeCB0aGlzLgo+ID4KPgo+IFlvdSBjb3VsZCBtYWtlIGEgZHJt
bV8gdmVyc2lvbiBvZiBkZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQoKSBmb3IgdGhpcy4KCi4uLgoK
SG93IGRpZCBJIG5vdCBzZWUgdGhhdCBpbiBkZXZyZXMuYy4gSW4gbXkgZGVmZW5zZSwgSSd2ZSBu
ZXZlciB3cml0dGVuCmEgZHJpdmVyIHVzaW5nIGRldm0gYmVjYXVzZSBvZiBhbGwgdGhlIGxpZmV0
aW1lIGJ1Z3MgdGhhdCB3b3VsZCBjYXVzZQppbiBkcm0sIGJ1dCB5ZXMgdGhpcyBpcyBleGFjdGx5
IHdoYXQgd2Ugd2FudCBoZXJlLgoKVGhhbmtzIGEgbG90IGZvciB0aGUgcG9pbnRlciwgSSdsbCBn
byBkbyBzb21lIHR5cGluZyEKCkNoZWVycywgRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3
YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0
dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
