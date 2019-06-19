Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6154C7FC
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 09:14:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 044A76E506;
	Thu, 20 Jun 2019 07:13:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19DED6E437
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 20:13:42 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id i125so393659qkd.6
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 13:13:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=pgcngtEs9uVcYhtJPpPurWF53FUixqD8oD/gTijpCZs=;
 b=kOFtJhg4SIWFU7efWsq0ZcncJRevjRDXA+e2/8MaPmP8GV+e5MyT3kLDlQ6h1bs8Ka
 HjLgIghVj01LJvNXpAE9EPNGu2MRNihft4mFf56Ik6jj/SccYY+aPmou2EHysQJb2gH6
 jP1Zx3nJR1nnXpIz9UUOD7/fqlGUYuKJlszLB9Oi2PScnO8KjDdWd4TM3Sg8Ixet2Xr2
 t9lVKEbEHid1Jm6HeIYssSjWmBt8BN6+q7ZFOXGbvzzGuOA1U1ocYDuXshPKOXhhKq4Z
 JpuOGG1rscISZCgiAvwQ9UBVKQ7E9vn12mqixGFkIE4umoh6MXTEZ8Qk1Tn8c8iMhVUc
 7P8g==
X-Gm-Message-State: APjAAAVEBSqZUYNuXsL9MFEQAuA+vZNS3x/WHThJ4MRw9TTxgnE7UAKd
 rEzQ/8Y+6JwCm/aPy/WYqiN2Hw==
X-Google-Smtp-Source: APXvYqx89CcDrXNyjbTWXMmP5tm+atmaNtgywjB10MJ+6xvDJdWKl3S7Qx9ZNBRu4t92EqyHMT9VzA==
X-Received: by 2002:a37:4cd2:: with SMTP id
 z201mr54688926qka.284.1560975221161; 
 Wed, 19 Jun 2019 13:13:41 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id 34sm12796326qtq.59.2019.06.19.13.13.40
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 19 Jun 2019 13:13:40 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hdgxg-0002nE-42; Wed, 19 Jun 2019 17:13:40 -0300
Date: Wed, 19 Jun 2019 17:13:40 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 1/4] mm: Check if mmu notifier callbacks are allowed to
 fail
Message-ID: <20190619201340.GL9360@ziepe.ca>
References: <20190520213945.17046-1-daniel.vetter@ffwll.ch>
 <20190521154411.GD3836@redhat.com>
 <20190618152215.GG12905@phenom.ffwll.local>
 <20190619165055.GI9360@ziepe.ca>
 <CAKMK7uGpupxF8MdyX3_HmOfc+OkGxVM_b9WbF+S-2fHe0F5SQA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uGpupxF8MdyX3_HmOfc+OkGxVM_b9WbF+S-2fHe0F5SQA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Thu, 20 Jun 2019 07:13:36 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=pgcngtEs9uVcYhtJPpPurWF53FUixqD8oD/gTijpCZs=;
 b=cLoTJVojiiY28gDdbS4BiMud3Q2ttCA35wRWS9+enmEKV/fFhoK5HMbRgWCMRNjzCQ
 b5ZrG1xcUBu7h6XelJpG4UMUjYJIzXdXfvpPiSyGYKdOweQ8twH8VntPLrq71j/TsSLy
 jpJZxemlj6uSAxjIlpkxEfVLL6t4SnPV1Na+7aRJWlC/JUKSKlZ2Kb2Z4WwTJsvlN637
 Cevv50iZDvZBGXCN6Gv70gfCH3gmRKeT9j0XQcvmKxIGDNpJ19N3X2W+pEIfCgtmESSX
 foHoQot+LMBKmcpM4/NBKgRFPmN0qLPKRN6ubqbiqKhMYESz50hc7k0uZOGPL7CFxZJG
 aZsA==
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
Cc: Michal Hocko <mhocko@suse.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>, Jerome Glisse <jglisse@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Rientjes <rientjes@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTksIDIwMTkgYXQgMDk6NTc6MTVQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBXZWQsIEp1biAxOSwgMjAxOSBhdCA2OjUwIFBNIEphc29uIEd1bnRob3JwZSA8
amdnQHppZXBlLmNhPiB3cm90ZToKPiA+IE9uIFR1ZSwgSnVuIDE4LCAyMDE5IGF0IDA1OjIyOjE1
UE0gKzAyMDAsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gPiA+IE9uIFR1ZSwgTWF5IDIxLCAyMDE5
IGF0IDExOjQ0OjExQU0gLTA0MDAsIEplcm9tZSBHbGlzc2Ugd3JvdGU6Cj4gPiA+ID4gT24gTW9u
LCBNYXkgMjAsIDIwMTkgYXQgMTE6Mzk6NDJQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3cm90ZToK
PiA+ID4gPiA+IEp1c3QgYSBiaXQgb2YgcGFyYW5vaWEsIHNpbmNlIGlmIHdlIHN0YXJ0IHB1c2hp
bmcgdGhpcyBkZWVwIGludG8KPiA+ID4gPiA+IGNhbGxjaGFpbnMgaXQncyBoYXJkIHRvIHNwb3Qg
YWxsIHBsYWNlcyB3aGVyZSBhbiBtbXUgbm90aWZpZXIKPiA+ID4gPiA+IGltcGxlbWVudGF0aW9u
IG1pZ2h0IGZhaWwgd2hlbiBpdCdzIG5vdCBhbGxvd2VkIHRvLgo+ID4gPiA+ID4KPiA+ID4gPiA+
IEluc3BpcmVkIGJ5IHNvbWUgY29uZnVzaW9uIHdlIGhhZCBkaXNjdXNzaW5nIGk5MTUgbW11IG5v
dGlmaWVycyBhbmQKPiA+ID4gPiA+IHdoZXRoZXIgd2UgY291bGQgdXNlIHRoZSBuZXdseS1pbnRy
b2R1Y2VkIHJldHVybiB2YWx1ZSB0byBoYW5kbGUgc29tZQo+ID4gPiA+ID4gY29ybmVyIGNhc2Vz
LiBVbnRpbCB3ZSByZWFsaXplZCB0aGF0IHRoZXNlIGFyZSBvbmx5IGZvciB3aGVuIGEgdGFzawo+
ID4gPiA+ID4gaGFzIGJlZW4ga2lsbGVkIGJ5IHRoZSBvb20gcmVhcGVyLgo+ID4gPiA+ID4KPiA+
ID4gPiA+IEFuIGFsdGVybmF0aXZlIGFwcHJvYWNoIHdvdWxkIGJlIHRvIHNwbGl0IHRoZSBjYWxs
YmFjayBpbnRvIHR3bwo+ID4gPiA+ID4gdmVyc2lvbnMsIG9uZSB3aXRoIHRoZSBpbnQgcmV0dXJu
IHZhbHVlLCBhbmQgdGhlIG90aGVyIHdpdGggdm9pZAo+ID4gPiA+ID4gcmV0dXJuIHZhbHVlIGxp
a2UgaW4gb2xkZXIga2VybmVscy4gQnV0IHRoYXQncyBhIGxvdCBtb3JlIGNodXJuIGZvcgo+ID4g
PiA+ID4gZmFpcmx5IGxpdHRsZSBnYWluIEkgdGhpbmsuCj4gPiA+ID4gPgo+ID4gPiA+ID4gU3Vt
bWFyeSBmcm9tIHRoZSBtLWwgZGlzY3Vzc2lvbiBvbiB3aHkgd2Ugd2FudCBzb21ldGhpbmcgYXQg
d2FybmluZwo+ID4gPiA+ID4gbGV2ZWw6IFRoaXMgYWxsb3dzIGF1dG9tYXRlZCB0b29saW5nIGlu
IENJIHRvIGNhdGNoIGJ1Z3Mgd2l0aG91dAo+ID4gPiA+ID4gaHVtYW5zIGhhdmluZyB0byBsb29r
IGF0IGV2ZXJ5dGhpbmcuIElmIHdlIGp1c3QgdXBncmFkZSB0aGUgZXhpc3RpbmcKPiA+ID4gPiA+
IHByX2luZm8gdG8gYSBwcl93YXJuLCB0aGVuIHdlJ2xsIGhhdmUgZmFsc2UgcG9zaXRpdmVzLiBB
bmQgYXMtaXMsIG5vCj4gPiA+ID4gPiBvbmUgd2lsbCBldmVyIHNwb3QgdGhlIHByb2JsZW0gc2lu
Y2UgaXQncyBsb3N0IGluIHRoZSBtYXNzaXZlIGFtb3VudHMKPiA+ID4gPiA+IG9mIG92ZXJhbGwg
ZG1lc2cgbm9pc2UuCj4gPiA+ID4gPgo+ID4gPiA+ID4gdjI6IERyb3AgdGhlIGZ1bGwgV0FSTl9P
TiBiYWNrdHJhY2UgaW4gZmF2b3VyIG9mIGp1c3QgYSBwcl93YXJuIGZvcgo+ID4gPiA+ID4gdGhl
IHByb2JsZW1hdGljIGNhc2UgKE1pY2hhbCBIb2NrbykuCj4gPgo+ID4gSSBkaXNhZ3JlZSB3aXRo
IHRoaXMgdjIgbm90ZSwgdGhlIFdBUk5fT04vV0FSTiB3aWxsIHRyaWdnZXIgY2hlY2tlcnMKPiA+
IGxpa2Ugc3l6a2FsbGVyIHRvIHJlcG9ydCBhIGJ1Zywgd2hpbGUgYSByYW5kb20gcHJfd2FybiBw
cm9iYWJseSB3aWxsCj4gPiBub3QuCj4gPgo+ID4gSSBkbyBhZ3JlZSB0aGUgYmFja3RyYWNlIGlz
IG5vdCB1c2VmdWwgaGVyZSwgYnV0IHdlIGRvbid0IGhhdmUgYQo+ID4gd2Fybi1uby1iYWNrdHJh
Y2UgdmVyc2lvbi4uCj4gPgo+ID4gSU1ITywga2VybmVsL2RyaXZlciBidWdzIHNob3VsZCBhbHdh
eXMgYmUgcmVwb3J0ZWQgYnkgV0FSTiAmCj4gPiBmcmllbmRzLiBXZSBuZXZlciBleHBlY3QgdG8g
c2VlIHRoZSBwcmludCwgc28gd2h5IGRvIHdlIGNhcmUgaG93IGJpZwo+ID4gaXQgaXM/Cj4gPgo+
ID4gQWxzbyBub3RlIHRoYXQgV0FSTiBpbnRlZ3JhdGVzIGFuIHVubGlrZWx5KCkgaW50byBpdCBz
byB0aGUgY29kZWdlbiBpcwo+ID4gYXV0b21hdGljYWxseSBhIGJpdCBtb3JlIG9wdGltYWwgdGhh
dCB0aGUgaWYgJiBwcl93YXJuIGNvbWJpbmF0aW9uLgo+IAo+IFdoZXJlIGRvIHlvdSBtYWtlIGEg
ZGlmZmVyZW5jZSBiZXR3ZWVuIGEgV0FSTiB3aXRob3V0IGJhY2t0cmFjZSBhbmQgYQo+IHByX3dh
cm4/IFRoZXkncmUgYm90aCBkdW1wZWQgYXQgdGhlIHNhbWUgbG9nLWxldmVsIC4uLgoKV0FSTiBw
YW5pY3MgdGhlIGtlcm5lbCB3aGVuIHlvdSBzZXQgCgovcHJvYy9zeXMva2VybmVsL3BhbmljX29u
X3dhcm4KClNvIGF1dG8gdGVzdGluZyB0b29scyBjYW4gc2V0IHRoYXQgYW5kIGdldCBhIGNsZWFu
IGRldGVjdGlvbiB0aGF0IHRoZQprZXJuZWwgaGFzIGZhaWxlZCB0aGUgdGVzdCBpbiBzb21lIHdh
eS4KCk90aGVyd2lzZSB5b3UgYXJlIGxlZnQgd2l0aCBmcmFpbC91Z2x5IGdyZXBwaW5nIG9mIGRt
ZXNnLgoKSmFzb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
