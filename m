Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B750D8DC32
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 19:48:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D300889BAF;
	Wed, 14 Aug 2019 17:48:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A360689BAF
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 17:48:32 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id z51so23182313edz.13
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 10:48:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=qwqWaeu+GhOdKofjdqb5LYI6e2TpebWGOHjix0xqdCI=;
 b=XNPPLMHG5nMJAZGD5PG+PGUTsZmvw1ulOZu/Thgn9gt+puli+DK9Ad3tb0YuYtUtqF
 dBoip1GPj2A3R+tgPcpt0R7o+stLmIjRMPXl49FizuVTK9llJCaw3mlQ3NxRMQK/khNG
 XH00TlRDP+BL9hP2QF9HjudhvjTl3ixgQiQktCXWhxB/zPvyZypj8gOxawcJ+f13VUlC
 m1MYiWBZEKNFtlVYXD4BLOAXrlZLSjaBkSHLPez+ZZGAv2Mqr8GFK7DPBYJOhtgigAG9
 83pZ4LLnSfLCatctU9dRqwY3ohGWrUrZ0RIvtNA/gpxnqR+tzcffbpsUcKePQ5Lo6NhL
 5/jQ==
X-Gm-Message-State: APjAAAXEaOwJyn1xMQTBHMusqBynrTQBH4U7qhmzCLhDgkNIIkAvACB8
 iUwE6Gxq1SSfe6ZEGWDoKrm0xg==
X-Google-Smtp-Source: APXvYqy0XZqW2pohQNep9BKDJAa/CK2Zn7VFhcrL2tO0wF1v5ThIITP720l/YgaLoGaD8PbSSAy77A==
X-Received: by 2002:a50:b62b:: with SMTP id b40mr870003ede.56.1565804911248;
 Wed, 14 Aug 2019 10:48:31 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id j57sm81611eda.61.2019.08.14.10.48.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2019 10:48:30 -0700 (PDT)
Date: Wed, 14 Aug 2019 19:48:28 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH 4/4] dma-buf: nuke reservation_object seq number
Message-ID: <20190814174828.GS7444@phenom.ffwll.local>
References: <20190807135312.1730-1-christian.koenig@amd.com>
 <20190807135312.1730-4-christian.koenig@amd.com>
 <156518744066.6198.17572013738158664135@skylake-alporthouse-com>
 <ccc20434-0380-c0b8-1ccb-1f7d9ae1a4a5@gmail.com>
 <20190814153908.GI7444@phenom.ffwll.local>
 <156580096818.2714.13643616122908209617@skylake-alporthouse-com>
 <20190814170625.GK7444@phenom.ffwll.local>
 <156580322834.2301.14370001730544642496@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <156580322834.2301.14370001730544642496@skylake-alporthouse-com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=qwqWaeu+GhOdKofjdqb5LYI6e2TpebWGOHjix0xqdCI=;
 b=QVbTD/0xQq0bTvsTrfzlenq5N7p8f/k0epiPhBGtPiovI9iZ3weNv9gDkU+EVynXEP
 ZYV9LUarXDTZZnit0EJ6lxB7KWtQgbCPjEyWUUioLma3hxMivAJdVNtgkH+AOEcQ3qj1
 uc2bwo6G1unBD+d0QBvYx00AmwuwMkdoixp2k=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 christian.koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMTQsIDIwMTkgYXQgMDY6MjA6MjhQTSArMDEwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IFF1b3RpbmcgRGFuaWVsIFZldHRlciAoMjAxOS0wOC0xNCAxODowNjoyNikKPiA+IE9u
IFdlZCwgQXVnIDE0LCAyMDE5IGF0IDA1OjQyOjQ4UE0gKzAxMDAsIENocmlzIFdpbHNvbiB3cm90
ZToKPiA+ID4gUXVvdGluZyBEYW5pZWwgVmV0dGVyICgyMDE5LTA4LTE0IDE2OjM5OjA4KQo+IFtz
bmlwXQo+ID4gPiA+ID4gPiA+ICAgICAgICAgIGlmIChvbGQpCj4gPiA+ID4gPiA+ID4gLSAgICAg
ICAgICAgICAgIG9sZC0+c2hhcmVkX2NvdW50ID0gMDsKPiA+ID4gPiA+ID4gPiAtICAgICAgIHdy
aXRlX3NlcWNvdW50X2VuZCgmb2JqLT5zZXEpOwo+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAg
ICBzbXBfc3RvcmVfbWIob2xkLT5zaGFyZWRfY291bnQsIDApOwo+ID4gPiA+IAo+ID4gPiA+IFNv
IHlvdXIgY29tbWVudCBhbmQgdGhlIGtlcm5lbGRvYyBkb24ndCBtYXRjaCB1cC4gUXVvdGluZwo+
ID4gPiA+IERvY3VtZW50YXRpb24vbWVtb3J5LWJhcnJpZXJzLnR4dDoKPiA+ID4gPiAKPiA+ID4g
PiAgICAgIFRoaXMgYXNzaWducyB0aGUgdmFsdWUgdG8gdGhlIHZhcmlhYmxlIGFuZCB0aGVuIGlu
c2VydHMgYSBmdWxsIG1lbW9yeQo+ID4gPiA+ICAgICAgYmFycmllciBhZnRlciBpdC4gIEl0IGlz
bid0IGd1YXJhbnRlZWQgdG8gaW5zZXJ0IGFueXRoaW5nIG1vcmUgdGhhbiBhCj4gPiA+ID4gICAg
ICBjb21waWxlciBiYXJyaWVyIGluIGEgVVAgY29tcGlsYXRpb24uCj4gPiA+ID4gCj4gPiA+ID4g
U28gb3JkZXIgaXMgMS4gc3RvcmUgMi4gZmVuY2UsIGJ1dCB5b3VyIGNvbW1lbnQgc3VnZ2VzdHMg
eW91IHdhbnQgaXQgdGhlCj4gPiA+ID4gb3RoZXIgd2F5IHJvdW5kLgo+ID4gPiAKPiA+ID4gV2hh
dCdzIG1vcmUgd2VpcmQgaXMgdGhhdCBpdCBpcyBhIGZ1bGx5IHNlcmlhbGlzaW5nIGluc3RydWN0
aW9uIHRoYXQgaXMKPiA+ID4gdXNlZCB0byBmZW5jZSBmaXJzdCBhcyBwYXJ0IG9mIHRoZSB1cGRh
dGUuIElmIHRoYXQncyB3YXkgUGV0ZXJaIHVzZXMKPiA+ID4gaXQuLi4KPiA+IAo+ID4gSSBoYXZl
bid0IGxvb2tlZCBhdCB0aGUgaW1wbGVtZW50YXRpb25zIHRiaCwganVzdCBnb2luZyB3aXRoIHRo
ZSB0ZXh0LiBPcgo+ID4gZG8geW91IG1lYW4gaW4gdGhlIHdyaXRlX3NlcWxvY2sgdGhhdCB3ZSdy
ZSByZXBsYWNpbmc/Cj4gCj4gTmFoLCBJIG1pc3JlbWVtYmVyZWQgc2V0X2N1cnJlbnRfc3RhdGUo
KSwgYWxsIHRoYXQgaW1wbGllcyBpcyB0aGUgZmVuY2UKPiBpcyBiZWZvcmUgdGhlIGZvbGxvd2lu
ZyBpbnN0cnVjdGlvbnMuIEkgaGF2ZSBzb21lIHJlY29sbGVjdGlvbiB0aGF0IGl0Cj4gY2FuIGJl
IHVzZWQgYXMgYSBSRUxFQVNFIG9wZXJhdGlvbiAoaWYgb25seSBiZWNhdXNlIGl0IGlzIGEgbG9j
a2VkIHhjaGcpLgo+IElmIGFsbCBlbHNlIGZhaWxzLCBtYWtlIGl0IGFuIHhjaGdfcmVsZWFzZSgp
LiBPciBub3JtYWwgYXNzaWdubWVudCArCj4gc21wX3dtYigpLgoKWWVhaCB0aGF0IG9uZSBpcyBj
YWxsZWQgc21wX3N0b3JlX3JlbGVhc2UsIG5vdCBzbXBfc3RvcmVfbWIuIEkgdGhpbmsKc21wX3N0
b3JlX3JlbGVhc2UgaXMgdGhlIHJpZ2h0IG9uZSBoZXJlLgoKPiA+ID4gSXQncyBhbiBleGNsdXNp
dmUgZmVuY2UuIElmIGl0IGlzIHJlcGxhY2VkLCBpdCBtdXN0IGJlIGxhdGVyIHRoYW4gYWxsCj4g
PiA+IHRoZSBzaGFyZWQgZmVuY2VzIChhbmQgZGVwZW5kZW50IG9uIHRoZW0gZGlyZWN0bHkgb3Ig
aW5kaXJlY3RseSksIGFuZAo+ID4gPiBzbyBzdGlsbCBhIGNvbnNpc3RlbnQgc25hcHNob3QuCj4g
PiAKPiA+IEknbSBub3Qgd29ycmllZCBhYm91dCB0aGUgZmVuY2UsIHRoYXQgcGFydCBpcyBmaW5l
LiBCdXQgd2UncmUgZGVmYWN0bwo+ID4gdXNpbmcgdGhlIGZlbmNlIGFzIGEgZmFuY3kgc2VxbG9j
ay1vZi1zb3J0cy4gQW5kIGlmIHRoZSBmZW5jZSBnZXRzIHJldXNlZAo+ID4gYW5kIHRoZSBwb2lu
dGVycyBtYXRjaCwgdGhlbiBvdXIgc2VxbG9jay1vZi1zb3J0cyBicmVha3MuIEJ1dCBJIGhhdmVu
J3QKPiA+IGxvb2tlZCBhcm91bmQgd2hldGhlciB0aGVyZSdzIG1vcmUgaW4gdGhlIGNvZGUgdGhh
dCBtYWtlcyB0aGlzIGFuCj4gPiBpcnJlbGV2YW50IGlzc3VlLgo+IAo+IE5vLCBpdCBzaG91bGQg
bm90IGJyZWFrIGlmIHdlIHJlcGxhY2UgdGhlIGZlbmNlIHdpdGggdGhlIHNhbWUgcG9pbnRlci4K
PiBJZiB0aGUgZmVuY2UgcG9pbnRlciBleHBpcmVzLCByZXVzZWQgYW5kIGFzc2lnbmVkIGJhY2sg
YXMgdGhlIGV4Y2xfZmVuY2UKPiAtLSBpdCBpcyBzdGlsbCB0aGUgZXhjbF9mZW5jZSBhbmQgYnkg
dGhlIHByb3BlcnRpZXMgb2YgdGhhdAo+IGV4Y2xfZmVuY2UgY29uc3RydWN0aW9uLCBpdCBpcyBs
YXRlciB0aGFuIHRoZSBzaGFyZWRfZmVuY2VzLgoKU28gSSB0aG91Z2h0IHRoZSBydWxlcyBhcmUg
dGhhdCBpZiB3ZSBoYXZlIGFuIGV4Y2x1c2l2ZSBmZW5jZSBhbmQgc2hhcmVkCmZlbmNlcyBib3Ro
IHByZXNlbnQsIHRoZW4gdGhlIHNoYXJlZCBmZW5jZXMgYXJlIGFmdGVyIHRoZSBleGNsdXNpdmUg
b25lLgoKQnV0IGlmIHdlIHJhY2UgaGVyZSwgdGhlbiBJIHRoaW5rIHdlIGNvdWxkIGFjY2lkZW50
YWxseSBzYW1wbGUgc2hhcmVkCmZlbmNlcyBmcm9tIF9iZWZvcmVfIHRoZSBleGNsdXNpdmUgZmVu
Y2VzLiBSb3VnaCB0aW1lbGluZToKCmV4bHVzaXZlIGZlbmNlIDEgLT4gc2hhcmVkIGZlbmNlIDIg
LT4gZXhjbHVzaXZlIGZlbmNlLCBidXQgcmV1c2VzIG1lbW9yeQpvZiBmZW5jZSAxCgpUaGVuIHdl
IHNhbXBsZSBmZW5jZSAxLCBjYXB0dXJlIHRoZSBzaGFyZWQgZmVuY2UgMiwgYW5kIG5vdGljZSB0
aGF0IHRoZQpleGNsdXNpdmUgZmVuY2UgcG9pbnRlciBpcyB0aGUgc2FtZSAoYnV0IG5vdCB0aGUg
ZmVuY2Ugb24gdGhlIHRpbWVsaW5lKQphbmQgY29uY2x1ZGUgdGhhdCB3ZSBnb3QgYSBjb25zaXN0
ZW50IHNhbXBsZS4KCkJ1dCB0aGUgb25seSBjb25zaXN0ZW50IHNhbXBsZSB3aXRoIHRoZSBuZXcg
ZmVuY2Ugc3RhdGUgd291bGQgYmUgb25seSB0aGUKZXhjbHVzaXZlIGZlbmNlLgoKUmVtaW5kcyBt
ZSBJIGZvcmdvdCB0byBsb29rIGZvciB0aGUgdXN1YWwga3JlZl9nZXRfdW5sZXNzX3plcm8gdHJp
Y2tlcnkgd2UKYWxzbyBuZWVkIHRvIGRvIGhlcmUgdG8gbWFrZSBzdXJlIHdlIGhhdmUgdGhlIHJp
Z2h0IGZlbmNlLgotRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJ
bnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
