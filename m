Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7EF4C80C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 09:15:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 225026E50C;
	Thu, 20 Jun 2019 07:14:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E86156E464
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 20:42:44 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id c70so445733qkg.7
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 13:42:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=TBgu1F4abnQgrkAM7sC23aDSMvrhGnN7FBKN+b/i6is=;
 b=tFWGKLh+QcnOhhyc2wnEjb3lIuo9YvSuppaNesj+mC5GDqRVo829D3VHCdCLMdXPsY
 65LjPmB+5OWHtZ0W289qGi138LAAGhvuScgwAiHZFPMM/3BCThF6SR0pdtVYwPrQnqTH
 BnNoEhO36n0Soug4+IV+4MG3LB5TUmJyt7cz5n1XUeyZ24ezIn9Vg7XVYnctkwhVoLgc
 04DvKVq5dhFuZul9U0eQi9tNQykg88JhUJQaRqggNBVWIwxohpnKmzzATtx3oKUo4laj
 Jcuy+IKuJ43YGiwQfJCSpeGhdmN2JP3QcMQpIAspSDOIsvurFkOjJ2IpsOgrQrue0N+Q
 hbIQ==
X-Gm-Message-State: APjAAAWLh2OekB+yxamRd1WAp5aLpH3ouyzzTuMYNve7GJpdKbLqc63u
 SwwgnzyFJsIEZAyxku3cEZ1fgg==
X-Google-Smtp-Source: APXvYqwkpP3oHvZN3nRaQ3RbrtVXeyrf0MwnUp9n/IQIWK8LXxln8+qpmD6ZJN85f7XPHS4TGxx0zg==
X-Received: by 2002:a37:a854:: with SMTP id r81mr25171872qke.53.1560976964070; 
 Wed, 19 Jun 2019 13:42:44 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id q36sm14171694qtc.12.2019.06.19.13.42.43
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 19 Jun 2019 13:42:43 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hdhPn-00033G-4Y; Wed, 19 Jun 2019 17:42:43 -0300
Date: Wed, 19 Jun 2019 17:42:43 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 1/4] mm: Check if mmu notifier callbacks are allowed to
 fail
Message-ID: <20190619204243.GM9360@ziepe.ca>
References: <20190520213945.17046-1-daniel.vetter@ffwll.ch>
 <20190521154411.GD3836@redhat.com>
 <20190618152215.GG12905@phenom.ffwll.local>
 <20190619165055.GI9360@ziepe.ca>
 <CAKMK7uGpupxF8MdyX3_HmOfc+OkGxVM_b9WbF+S-2fHe0F5SQA@mail.gmail.com>
 <20190619201340.GL9360@ziepe.ca>
 <CAKMK7uGtXT1qLdUqnmTd9uUkdMrcreg4UmAxscx0Fp4Pv6uj_A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uGtXT1qLdUqnmTd9uUkdMrcreg4UmAxscx0Fp4Pv6uj_A@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Thu, 20 Jun 2019 07:13:36 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=TBgu1F4abnQgrkAM7sC23aDSMvrhGnN7FBKN+b/i6is=;
 b=EaQyYCufZoEOHUrhA5C65HJeWWPQ44TPFwOFRGPSs/kadihvsNLaI7C/q5Lx8nN+Ag
 sSDJ00GlbBb7AJQltrBt4pAJwniFtTcJwmPfocq+9b/luxO0IGfSUSCUcqNBfJDLTEJK
 tB9u05+y9B2z2wjTFsd1vtJjyBLIpYpd/eq94rM0W2qq4HuwikeZhRhGE2DCMw8Kh+XN
 k5mEjEVJVKN3SSaBa9vFnUXWcZjDEkf4Rj6INQpXctWJQ+wQ2KMy1BsL2lqcmQdWLVPw
 rX7ZLwMaAvHaIuHIm75mR3SW8q1aJpTlLjILf0Y2XNeQqa7qWoAclPlvugKKMyVxXGnU
 tGhQ==
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

T24gV2VkLCBKdW4gMTksIDIwMTkgYXQgMTA6MTg6NDNQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBXZWQsIEp1biAxOSwgMjAxOSBhdCAxMDoxMyBQTSBKYXNvbiBHdW50aG9ycGUg
PGpnZ0B6aWVwZS5jYT4gd3JvdGU6Cj4gPiBPbiBXZWQsIEp1biAxOSwgMjAxOSBhdCAwOTo1Nzox
NVBNICswMjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+ID4gPiBPbiBXZWQsIEp1biAxOSwgMjAx
OSBhdCA2OjUwIFBNIEphc29uIEd1bnRob3JwZSA8amdnQHppZXBlLmNhPiB3cm90ZToKPiA+ID4g
PiBPbiBUdWUsIEp1biAxOCwgMjAxOSBhdCAwNToyMjoxNVBNICswMjAwLCBEYW5pZWwgVmV0dGVy
IHdyb3RlOgo+ID4gPiA+ID4gT24gVHVlLCBNYXkgMjEsIDIwMTkgYXQgMTE6NDQ6MTFBTSAtMDQw
MCwgSmVyb21lIEdsaXNzZSB3cm90ZToKPiA+ID4gPiA+ID4gT24gTW9uLCBNYXkgMjAsIDIwMTkg
YXQgMTE6Mzk6NDJQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3cm90ZToKPiA+ID4gPiA+ID4gPiBK
dXN0IGEgYml0IG9mIHBhcmFub2lhLCBzaW5jZSBpZiB3ZSBzdGFydCBwdXNoaW5nIHRoaXMgZGVl
cCBpbnRvCj4gPiA+ID4gPiA+ID4gY2FsbGNoYWlucyBpdCdzIGhhcmQgdG8gc3BvdCBhbGwgcGxh
Y2VzIHdoZXJlIGFuIG1tdSBub3RpZmllcgo+ID4gPiA+ID4gPiA+IGltcGxlbWVudGF0aW9uIG1p
Z2h0IGZhaWwgd2hlbiBpdCdzIG5vdCBhbGxvd2VkIHRvLgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4g
PiA+ID4gSW5zcGlyZWQgYnkgc29tZSBjb25mdXNpb24gd2UgaGFkIGRpc2N1c3NpbmcgaTkxNSBt
bXUgbm90aWZpZXJzIGFuZAo+ID4gPiA+ID4gPiA+IHdoZXRoZXIgd2UgY291bGQgdXNlIHRoZSBu
ZXdseS1pbnRyb2R1Y2VkIHJldHVybiB2YWx1ZSB0byBoYW5kbGUgc29tZQo+ID4gPiA+ID4gPiA+
IGNvcm5lciBjYXNlcy4gVW50aWwgd2UgcmVhbGl6ZWQgdGhhdCB0aGVzZSBhcmUgb25seSBmb3Ig
d2hlbiBhIHRhc2sKPiA+ID4gPiA+ID4gPiBoYXMgYmVlbiBraWxsZWQgYnkgdGhlIG9vbSByZWFw
ZXIuCj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBBbiBhbHRlcm5hdGl2ZSBhcHByb2FjaCB3
b3VsZCBiZSB0byBzcGxpdCB0aGUgY2FsbGJhY2sgaW50byB0d28KPiA+ID4gPiA+ID4gPiB2ZXJz
aW9ucywgb25lIHdpdGggdGhlIGludCByZXR1cm4gdmFsdWUsIGFuZCB0aGUgb3RoZXIgd2l0aCB2
b2lkCj4gPiA+ID4gPiA+ID4gcmV0dXJuIHZhbHVlIGxpa2UgaW4gb2xkZXIga2VybmVscy4gQnV0
IHRoYXQncyBhIGxvdCBtb3JlIGNodXJuIGZvcgo+ID4gPiA+ID4gPiA+IGZhaXJseSBsaXR0bGUg
Z2FpbiBJIHRoaW5rLgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gU3VtbWFyeSBmcm9tIHRo
ZSBtLWwgZGlzY3Vzc2lvbiBvbiB3aHkgd2Ugd2FudCBzb21ldGhpbmcgYXQgd2FybmluZwo+ID4g
PiA+ID4gPiA+IGxldmVsOiBUaGlzIGFsbG93cyBhdXRvbWF0ZWQgdG9vbGluZyBpbiBDSSB0byBj
YXRjaCBidWdzIHdpdGhvdXQKPiA+ID4gPiA+ID4gPiBodW1hbnMgaGF2aW5nIHRvIGxvb2sgYXQg
ZXZlcnl0aGluZy4gSWYgd2UganVzdCB1cGdyYWRlIHRoZSBleGlzdGluZwo+ID4gPiA+ID4gPiA+
IHByX2luZm8gdG8gYSBwcl93YXJuLCB0aGVuIHdlJ2xsIGhhdmUgZmFsc2UgcG9zaXRpdmVzLiBB
bmQgYXMtaXMsIG5vCj4gPiA+ID4gPiA+ID4gb25lIHdpbGwgZXZlciBzcG90IHRoZSBwcm9ibGVt
IHNpbmNlIGl0J3MgbG9zdCBpbiB0aGUgbWFzc2l2ZSBhbW91bnRzCj4gPiA+ID4gPiA+ID4gb2Yg
b3ZlcmFsbCBkbWVzZyBub2lzZS4KPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IHYyOiBEcm9w
IHRoZSBmdWxsIFdBUk5fT04gYmFja3RyYWNlIGluIGZhdm91ciBvZiBqdXN0IGEgcHJfd2FybiBm
b3IKPiA+ID4gPiA+ID4gPiB0aGUgcHJvYmxlbWF0aWMgY2FzZSAoTWljaGFsIEhvY2tvKS4KPiA+
ID4gPgo+ID4gPiA+IEkgZGlzYWdyZWUgd2l0aCB0aGlzIHYyIG5vdGUsIHRoZSBXQVJOX09OL1dB
Uk4gd2lsbCB0cmlnZ2VyIGNoZWNrZXJzCj4gPiA+ID4gbGlrZSBzeXprYWxsZXIgdG8gcmVwb3J0
IGEgYnVnLCB3aGlsZSBhIHJhbmRvbSBwcl93YXJuIHByb2JhYmx5IHdpbGwKPiA+ID4gPiBub3Qu
Cj4gPiA+ID4KPiA+ID4gPiBJIGRvIGFncmVlIHRoZSBiYWNrdHJhY2UgaXMgbm90IHVzZWZ1bCBo
ZXJlLCBidXQgd2UgZG9uJ3QgaGF2ZSBhCj4gPiA+ID4gd2Fybi1uby1iYWNrdHJhY2UgdmVyc2lv
bi4uCj4gPiA+ID4KPiA+ID4gPiBJTUhPLCBrZXJuZWwvZHJpdmVyIGJ1Z3Mgc2hvdWxkIGFsd2F5
cyBiZSByZXBvcnRlZCBieSBXQVJOICYKPiA+ID4gPiBmcmllbmRzLiBXZSBuZXZlciBleHBlY3Qg
dG8gc2VlIHRoZSBwcmludCwgc28gd2h5IGRvIHdlIGNhcmUgaG93IGJpZwo+ID4gPiA+IGl0IGlz
Pwo+ID4gPiA+Cj4gPiA+ID4gQWxzbyBub3RlIHRoYXQgV0FSTiBpbnRlZ3JhdGVzIGFuIHVubGlr
ZWx5KCkgaW50byBpdCBzbyB0aGUgY29kZWdlbiBpcwo+ID4gPiA+IGF1dG9tYXRpY2FsbHkgYSBi
aXQgbW9yZSBvcHRpbWFsIHRoYXQgdGhlIGlmICYgcHJfd2FybiBjb21iaW5hdGlvbi4KPiA+ID4K
PiA+ID4gV2hlcmUgZG8geW91IG1ha2UgYSBkaWZmZXJlbmNlIGJldHdlZW4gYSBXQVJOIHdpdGhv
dXQgYmFja3RyYWNlIGFuZCBhCj4gPiA+IHByX3dhcm4/IFRoZXkncmUgYm90aCBkdW1wZWQgYXQg
dGhlIHNhbWUgbG9nLWxldmVsIC4uLgo+ID4KPiA+IFdBUk4gcGFuaWNzIHRoZSBrZXJuZWwgd2hl
biB5b3Ugc2V0Cj4gPgo+ID4gL3Byb2Mvc3lzL2tlcm5lbC9wYW5pY19vbl93YXJuCj4gPgo+ID4g
U28gYXV0byB0ZXN0aW5nIHRvb2xzIGNhbiBzZXQgdGhhdCBhbmQgZ2V0IGEgY2xlYW4gZGV0ZWN0
aW9uIHRoYXQgdGhlCj4gPiBrZXJuZWwgaGFzIGZhaWxlZCB0aGUgdGVzdCBpbiBzb21lIHdheS4K
PiA+Cj4gPiBPdGhlcndpc2UgeW91IGFyZSBsZWZ0IHdpdGggZnJhaWwvdWdseSBncmVwcGluZyBv
ZiBkbWVzZy4KPiAKPiBIbSByaWdodC4KPiAKPiBBbnl3YXksIEknbSBoYXBweSB0byByZXBhaW50
IHRoZSBiaWtlc2hlZCBpbiBhbnkgY29sb3IgdGhhdCdzIGRlc2lyZWQsCj4gaWYgdGhhdCBoZWxw
cyB3aXRoIGxhbmRpbmcgaXQuIFdBUk5fV0lUSE9VVF9CQUNLVFJBQ0UgbWlnaHQgdGFrZSBhIGJp
dAo+IGxvbmdlciAobmVlZCB0byBmaW5kIGEgYml0IG9mIHRpbWUsIHBsdXMgaXQnbGwgZGVmaW5p
dGVseSBhdHRyYWN0IG1vcmUKPiBjb21tZW50cykuCgpJIHdhcyBhY3R1YWxseSBqdXN0IHdyaXRp
bmcgc29tZXRoaW5nIHZlcnkgc2ltaWxhciB3aGVuIGxvb2tpbmcgYXQgdGhlCmhtbSB0aGluZ3Mu
LgoKQWxzbywgaXMgdGhlIHRlc3QgYmFja3dhcmRzPwoKbW11X25vdGlmaWVyX3JhbmdlX2Jsb2Nr
YWJsZSgpID09IHRydWUgbWVhbnMgdGhlIGNhbGxiYWNrIG11c3QgcmV0dXJuCnplcm8KCm1tdV9u
b3RpZmlmZXJfcmFuZ2VfYmxvY2thYmxlKCkgPT0gZmFsc2UgbWVhbnMgdGhlIGNhbGxiYWNrIGNh
biByZXR1cm4KMCBvciAtRUFHQUlOLgoKU3VnZ2VzdCB0aGlzOgoKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBwcl9pbmZvKCIlcFMgY2FsbGJhY2sgZmFpbGVkIHdpdGggJWQgaW4gJXNi
bG9ja2FibGUgY29udGV4dC5cbiIsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBtbi0+b3BzLT5pbnZhbGlkYXRlX3JhbmdlX3N0YXJ0LCBfcmV0LAogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIW1tdV9ub3RpZmllcl9yYW5nZV9ibG9ja2FibGUo
cmFuZ2UpID8gIm5vbi0iIDogIiIpOworICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFdB
Uk5fT04obW11X25vdGlmaWVyX3JhbmdlX2Jsb2NrYWJsZShyYW5nZSkgfHwKKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIF9yZXQgIT0gLUVBR0FJTik7CiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcmV0ID0gX3JldDsKICAgICAgICAgICAgICAgICAgICAgICAg
fQogICAgICAgICAgICAgICAgfQoKVG8gZXhwcmVzcyB0aGUgQVBJIGludmFyaWFudC4KCkphc29u
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
