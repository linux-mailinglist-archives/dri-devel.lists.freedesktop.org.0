Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E50AF98026
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 18:32:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEAF76E975;
	Wed, 21 Aug 2019 16:32:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37BCE6E975
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 16:32:46 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id f22so3673359edt.4
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 09:32:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=3Xi6uQ6yEqg3E9ju3JU1pZ9DyMhrE8RA/Aksdy8NcFY=;
 b=rhCdW9flmIyX+QoDfTuo7QFkMOy5pnVw1kRvCxh5pOux4X6WZ4/HWft2nZWli+4LrJ
 YQvPQ1kvtDjuNhExeH3+puyCkExZ1XZiZHZniSeHoM+aM0U9QayNWsDNBL17D8pDQKvm
 zgn7AvtSzFvaQIZ3HzpT2vZSShb9zbj7vSiCmcVpvMeA0Ae87WG0BJQDU27VCHB4Nxp0
 GvL3umBoggE6AwYPr8z6dr727t3RowtyHRf/ltXQufHDdlat7tIm9dE04lXotYx1c158
 GiTGyUwXQBNAalBF844PL2BOAx+KW1oSh0hflj5ErIkiHFTUdEdW4re1MGtrS1JvrOcC
 bPuA==
X-Gm-Message-State: APjAAAUcxTjNw2A6qHhk8zhAdltGiFtXn+WoK+zBCAElyHxJ4t7FYXjo
 1YUgiGIntk42fdEjdqZggPZx5g==
X-Google-Smtp-Source: APXvYqyxfGusRgyb+PMPLOANNqboqpQw1nNTeFrbpkbnPriKNVgxpWYyFfRp48Xf3a6tMEBFvqRyXQ==
X-Received: by 2002:a05:6402:518:: with SMTP id
 m24mr36459847edv.169.1566405164778; 
 Wed, 21 Aug 2019 09:32:44 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id d3sm1775962ejp.77.2019.08.21.09.32.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 09:32:44 -0700 (PDT)
Date: Wed, 21 Aug 2019 18:32:41 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/4] drm/shmem: Use mutex_trylock in drm_gem_shmem_purge
Message-ID: <20190821163241.GP11147@phenom.ffwll.local>
References: <20190819161204.3106-1-robh@kernel.org>
 <20190819161204.3106-3-robh@kernel.org>
 <20190820090543.GE11147@phenom.ffwll.local>
 <CAL_JsqL5JsFbQAe1DJ1AbtYjZjVv1++ooH4hxEhiQUzw3MVjXA@mail.gmail.com>
 <20190821082343.GJ11147@phenom.ffwll.local>
 <CAL_JsqL01_fLEkZgsmynWLw+fT-HQ-bfUhHO5mcmN0wMOCxZSw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_JsqL01_fLEkZgsmynWLw+fT-HQ-bfUhHO5mcmN0wMOCxZSw@mail.gmail.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=3Xi6uQ6yEqg3E9ju3JU1pZ9DyMhrE8RA/Aksdy8NcFY=;
 b=A7/hn+gKHyb8BVm/xbaF+QQHAH/vsLKc1kK1dkXDd8CbwkT04SlfsDdpd+imAj/IGA
 +e1hBXaq9MiHRHNLhzlagx+eN64HizV5YMLf7z7ghL8/23XBfhrC+74VNN2+X5JEkMna
 zxjmGBBznJVmb7ev6gcsdxeN1tV3ruXA70kcg=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMjEsIDIwMTkgYXQgMTE6MDM6NTVBTSAtMDUwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj4gT24gV2VkLCBBdWcgMjEsIDIwMTkgYXQgMzoyMyBBTSBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWxAZmZ3bGwuY2g+IHdyb3RlOgo+ID4KPiA+IE9uIFR1ZSwgQXVnIDIwLCAyMDE5IGF0IDA3OjM1
OjQ3QU0gLTA1MDAsIFJvYiBIZXJyaW5nIHdyb3RlOgo+ID4gPiBPbiBUdWUsIEF1ZyAyMCwgMjAx
OSBhdCA0OjA1IEFNIERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4gd3JvdGU6Cj4gPiA+
ID4KPiA+ID4gPiBPbiBNb24sIEF1ZyAxOSwgMjAxOSBhdCAxMToxMjowMkFNIC0wNTAwLCBSb2Ig
SGVycmluZyB3cm90ZToKPiA+ID4gPiA+IExvY2tkZXAgcmVwb3J0cyBhIGNpcmN1bGFyIGxvY2tp
bmcgZGVwZW5kZW5jeSB3aXRoIHBhZ2VzX2xvY2sgdGFrZW4gaW4KPiA+ID4gPiA+IHRoZSBzaHJp
bmtlciBjYWxsYmFjay4gVGhlIGRlYWRsb2NrIGNhbid0IGFjdHVhbGx5IGhhcHBlbiB3aXRoIGN1
cnJlbnQKPiA+ID4gPiA+IHVzZXJzIGF0IGxlYXN0IGFzIGEgQk8gd2lsbCBuZXZlciBiZSBwdXJn
ZWFibGUgd2hlbiBwYWdlc19sb2NrIGlzIGhlbGQuCj4gPiA+ID4gPiBUbyBiZSBzYWZlLCBsZXQn
cyB1c2UgbXV0ZXhfdHJ5bG9jaygpIGluc3RlYWQgYW5kIGJhaWwgaWYgYSBCTyBpcyBsb2NrZWQK
PiA+ID4gPiA+IGFscmVhZHkuCj4gCj4gWy4uLl0KPiAKPiA+ID4gPiA+IC12b2lkIGRybV9nZW1f
c2htZW1fcHVyZ2Uoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopCj4gPiA+ID4gPiArYm9vbCBk
cm1fZ2VtX3NobWVtX3B1cmdlKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqKQo+ID4gPiA+ID4g
IHsKPiA+ID4gPiA+ICAgICAgIHN0cnVjdCBkcm1fZ2VtX3NobWVtX29iamVjdCAqc2htZW0gPSB0
b19kcm1fZ2VtX3NobWVtX29iaihvYmopOwo+ID4gPiA+ID4KPiA+ID4gPiA+IC0gICAgIG11dGV4
X2xvY2soJnNobWVtLT5wYWdlc19sb2NrKTsKPiA+ID4gPiA+ICsgICAgIGlmICghbXV0ZXhfdHJ5
bG9jaygmc2htZW0tPnBhZ2VzX2xvY2spKQo+ID4gPiA+Cj4gPiA+ID4gRGlkIHlvdSBzZWUgbXkg
cGluZyBhYm91dCBjdXR0aW5nIGFsbCB0aGUgbG9ja2luZyBvdmVyIHRvIGRtYV9yZXN2Pwo+ID4g
Pgo+ID4gPiBZZXMsIGJ1dCB5b3UgZGlkbid0IHJlcGx5IHRvIFJvYiBDLiBhYm91dCBpdC4gSSBn
dWVzcyBJJ2xsIGhhdmUgdG8gZ28KPiA+ID4gZmlndXJlIG91dCBob3cgcmVzZXJ2YXRpb24gb2Jq
ZWN0cyB3b3JrLi4uCj4gPgo+ID4gbXNtIHdhcyB0aGUgbGFzdCBkcml2ZXIgdGhhdCBzdGlsbCB1
c2VkIHN0cnVjdF9tdXRleC4gSXQncyBhIGxvbmctdGVybQo+ID4gZGVhZC1lbmQsIGFuZCBJIHRo
aW5rIHdpdGggYWxsIHRoZSBlZmZvcnQgcmVjZW50bHkgdG8gY3JlYXRlIGhlbHBlcnMgZm9yCj4g
PiByZW5kZXJpbmcgZHJpdmVycyAoc2htZW0sIHZyYW0sIHR0bSByZWZhY3RvcmluZykgd2Ugc2hv
dWxkIG1ha2UgYSBzb2xpZAo+ID4gYXR0ZW1wdCB0byBnZXQgYWxpZ25lZC4gT3IgZGlkIHlvdSBt
ZWFuIHRoYXQgUm9iIENsYXJrIGhhZCBzb21lCj4gPiByZXBseS9xdWVzdGlvbnMgdGhhdCBJIGRp
ZG4nIHJlc3BvbmQgdG8gYmVjYXVzZSBpdCBmZWxsIHRocm91Z2ggY3JhY2tzPwo+IAo+IEknbSBu
b3QgdXNpbmcgc3RydWN0X211dGV4LCBzbyBJJ20gY29uZnVzZWQgYXMgdG8gd2h5IHlvdSBrZWVw
Cj4gbWVudGlvbmluZyBpdC4gVGhlIGxpc3Qgb2YgQk9zIGZvciB0aGUgc2hyaW5rZXIgaXMgcHJv
dGVjdGVkIHdpdGggYQo+IG11dGV4IGZvciB0aGUgbGlzdC4gVGhhdCBsaXN0IGhlYWQsIGxpc3Qg
bXV0ZXgsIGFuZCB0aGUgc2hyaW5rZXIKPiBpbnN0YW5jZSBhbGwgaGF2ZSB0byBsaXZlIGF0IHRo
ZSBkcml2ZXIgbGV2ZWwsIHNvIHRoZXkgY2FuJ3QgYmUgbW92ZWQKPiBpbnRvIHNobWVtIGFzIHlv
dSBzdWdnZXN0ZWQuIEFncmVlZD8KCnN0cnVjdF9tdXRleCBpcyBqdXN0IHRoZSBoaXN0b3JpY2Fs
IGJhZ2dhZ2UuCgpXcnQgc2hyaW5rZXIvbHJ1LCB3aHkgbm90PyBXZSd2ZSB0YWxrZWQgYWJvdXQg
bWF5YmUgbW92aW5nIHRoYXQgdG8gbWFrZSBpdAplYXNpZXIgdG8gc2hhcmUgLi4uCgo+IFRoZW4g
dGhlcmUgaXMgdGhlIHBhZ2VzX2xvY2sgd2l0aGluIHRoZSBzaG1lbSBCTy4gSSBhc3N1bWUgdGhh
dCBpcwo+IHdoYXQgeW91IGFyZSBzdWdnZXN0aW5nIGNvbnZlcnRpbmcgdG8gZG1hX3Jlc3Y/IEkn
bSBub3QgcmVhbGx5IHN1cmUKPiB3aGF0IHRoYXQgd291bGQgbG9vayBsaWtlLiBZb3UncmUgZ29p
bmcgdG8gaGF2ZSB0byBzcGVsbCBpdCBvdXQgZm9yCj4gbWUuIEluIG15IGJyaWVmIGxvb2sgYXQg
aXQsIGl0IHNlZW1zIGxpa2UgYWRkZWQgY29tcGxleGl0eSBhbmQgaXQncwo+IG5vdCBjbGVhciB0
byBtZSB3aGF0IHRoYXQgYnV5cy4gQWxzbywgSSB0aGluayBpdCB3b3VsZCBtb3N0bHkgYmUgYW4K
PiBpbnRlcm5hbCBpbXBsZW1lbnRhdGlvbiBkZXRhaWwgb2Ygc2htZW0gaGVscGVycywgdGhvdWdo
IHRoZXJlIGlzIG9uZQo+IHNwb3QgaW4gcGFuZnJvc3QgdGhhdCB0YWtlcyB0aGUgbG9jayAoMiBi
ZWZvcmUgdGhpcyBzZXJpZXMpLiBTbyBpdCdzCj4ga2luZCBvZiBvcnRob2dvbmFsIHRvIHRoaXMg
c2VyaWVzLgoKVGhlIGlzc3VlIHJvdWdobHkgaXMgdGhhdCBoYXZpbmcgbXVsdGlwbGUgcGVyLWJv
IGxvY2tzIGdldHMgZnVuLCBvbmNlIHlvdQphZGQgaW4gbXVsdGlwbGUgZHJpdmVycyBhbmQgZHlu
YW1pYyBkbWEtYnVmIHNoYXJpbmcuIE1heWJlIHRoYXQncyBuZXZlcgpnb2luZyB0byBiZSBhbiBp
c3N1ZSBmb3IgZHJpdmVycyB1c2luZyBzaG1lbSBoZWxwZXJzLCBidXQgd2hvIGtub3dzLiBUaGUK
Y3Jvc3MtZHJpdmVyIHBlci1ibyBsb2NrIHRvIHVudGFuZ2xlIHRoYXQgbWF6ZSBpcyBkbWFfcmVz
diwgYW5kIGlmIHlvdQp0aGVuIGFsc28gaGF2ZSB5b3VyIG93biBwZXItYm8gbG9ja3MgaXQgY2Fu
IGdldCByYXRoZXIgaW50ZXJlc3RpbmcuIEJlc3QKY2FzZSB5b3UgZW5kIHVwIHdpdGggdHdvIGxv
Y2tzIG5lc3RpbmcsIGFuZCB5b3VyIG93biBwZXItYm8gbG9jayBiZWluZwpmdWxseSByZWR1bmRh
bnQuIFdvcnN0IGNhc2UgeW91IGdldCBkaWZmZXJlbnQgbmVzdGluZyBkZXBlbmRpbmcgd2hldGhl
cgp5b3UgaW1wb3J0IG9yIGV4cG9ydC4gU28gdGhhdCdzIHJvdWdobHkgdGhlIGNvbnRleHQuCgpP
ZiBjb3Vyc2UgZml4aW5nIGxvY2tpbmcgaXMgZ29pbmcgdG8gYmUgZWFzaWVyIHRoZSBmZXdlciB1
c2VycyB5b3UgaGF2ZS4KT25jZSB0aGVyZSdzIGxvdHMgb2YgY29kZSBhbmQgdXNlcnMgb2YgaXQg
b3V0IHRoZXJlLCBpdCdzIHByZXR0eSBtdWNoCmltcG9zc2libGUuCgpTbyB5ZWFoIGl0IHdvdWxk
IGJlIGEgMToxIHJlcGxhY2VtZW50IHdpdGggYWxsIHRoZSBwZXItYm8gbG9ja3MgeW91IGhhdmUK
bm93LCBhbmQgc2VlaW5nIGhvdyBiYWRseSBpdCBiaXRlcy4KCj4gQWxzbywgSSB0aGluayBnZXR0
aW5nIG1vcmUgZHJpdmVycyB1c2luZyBzaG1lbSBpcyBtb3JlIGJlbmVmaWNpYWwgdGhhbgo+IGFs
aWduaW5nIHRoZSBpbXBsZW1lbnRhdGlvbnMgb2YgdGhlIEdFTSBoZWxwZXJzLiBXZSBzaG91bGQg
YXQgbGVhc3QgYmUKPiBhYmxlIHRvIGNvbnZlcnQgdmdlbSBhbmQgdmttcyBJIHdvdWxkIHRoaW5r
LiBWYXJpb3VzIEtNUyBkcml2ZXJzIHRvbywKPiBidXQgdGhlcmUncyBhbiBpc3N1ZSBhcm91bmQg
a2VybmVsIG1hcHBpbmdzIChvciBsYWNrIG9mKS4gVGhlcmUgcmVhbGx5Cj4gc2hvdWxkIGJlIGxp
dHRsZSByZWFzb24gZm9yIG1vc3QgS01TIGRyaXZlcnMgdG8gaGF2ZSBhIGN1c3RvbSBCTyBhcwo+
IENNQSBvciBzaG1lbSBoZWxwZXJzIHNob3VsZCB3b3JrLgoKWWVhaCBhZ3JlZWQgb24gdGhpcywg
SSBqdXN0IHdhbnQgdG8gbWFrZSBzdXJlIHdlJ3JlIG5vdCBkb2luZyB0aGlzCm11bHRpcGxlIHRp
bWVzIC4uLgotRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRl
bCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
