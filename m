Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 504EA4C23A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 22:19:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B06EC6E461;
	Wed, 19 Jun 2019 20:18:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DBF86E467
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 20:18:57 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id e8so349168otl.7
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 13:18:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OMu1Eynp9KYFQ9eA5SmgvunmkEBDxoIzU+1szZNiCbA=;
 b=hPq4dc/RaAoc4ZEL7GJp7VBukyivAEbhcD3ss7KjDBkvj2Yyzl467VWytFtsPayF1n
 aMzZsWaHki9HRymp89uHgN6Zk2TfkZgIlzMxuIJa9XE5erveHCdiLWPWCz4DSENvd+wP
 n4u3NkPwOVSaKVcwEPHnaire6NvN0yDpmpfvy4IfF8nz2aCdMyHq0DDI2f8wHxjVZw7J
 LKJfxUxH+fQH2MggzZ+DkTbz8FKZSWJw4OzYxNiMdUqmNFhaEd7gFHO3FQ++vjusOE6E
 apYqdbWmcWzWQRdCye0J+u1M1OXZ/E+TZjFdKFvyq8/7G+YYEtcmsmzCSP08W+EGvgjS
 4J6A==
X-Gm-Message-State: APjAAAWSgshidwzfeEIVAzTkwGm95DtML0pE2rRrntrBo+ARTY2Hjx7z
 VE1WqKvwZKDIsWS/KGFS9vltQ5u8AOpq48wUWkRSjf5w
X-Google-Smtp-Source: APXvYqw6bgG2GsUkNVmJ8zuOKu1tc9Z6lf4W2oeXwaheE4AOJs5xOP8C+LQrEQLCr9yBSA9ecTAu4RInlgBAYdXylok=
X-Received: by 2002:a05:6830:ce:: with SMTP id
 x14mr5140545oto.188.1560975536589; 
 Wed, 19 Jun 2019 13:18:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190520213945.17046-1-daniel.vetter@ffwll.ch>
 <20190521154411.GD3836@redhat.com> <20190618152215.GG12905@phenom.ffwll.local>
 <20190619165055.GI9360@ziepe.ca>
 <CAKMK7uGpupxF8MdyX3_HmOfc+OkGxVM_b9WbF+S-2fHe0F5SQA@mail.gmail.com>
 <20190619201340.GL9360@ziepe.ca>
In-Reply-To: <20190619201340.GL9360@ziepe.ca>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 19 Jun 2019 22:18:43 +0200
Message-ID: <CAKMK7uGtXT1qLdUqnmTd9uUkdMrcreg4UmAxscx0Fp4Pv6uj_A@mail.gmail.com>
Subject: Re: [PATCH 1/4] mm: Check if mmu notifier callbacks are allowed to
 fail
To: Jason Gunthorpe <jgg@ziepe.ca>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=OMu1Eynp9KYFQ9eA5SmgvunmkEBDxoIzU+1szZNiCbA=;
 b=YlyPqPBiPTfkDOdJ5VJIj4DFNeLCKL8DI+SUapLpqcyHkZ3w7UdvlSsXa0Oewx+gIO
 ls8A9xGbEJDVy7wX+7Wrp2Y2dOkXE2UKcAt2aGPDe8APV+r21JZ69QC/JyzdhFWazDwg
 T44DzMD+35dNL6M4TaFtbY9aua85SEnMj9gpc=
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
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTksIDIwMTkgYXQgMTA6MTMgUE0gSmFzb24gR3VudGhvcnBlIDxqZ2dAemll
cGUuY2E+IHdyb3RlOgo+IE9uIFdlZCwgSnVuIDE5LCAyMDE5IGF0IDA5OjU3OjE1UE0gKzAyMDAs
IERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gPiBPbiBXZWQsIEp1biAxOSwgMjAxOSBhdCA2OjUwIFBN
IEphc29uIEd1bnRob3JwZSA8amdnQHppZXBlLmNhPiB3cm90ZToKPiA+ID4gT24gVHVlLCBKdW4g
MTgsIDIwMTkgYXQgMDU6MjI6MTVQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3cm90ZToKPiA+ID4g
PiBPbiBUdWUsIE1heSAyMSwgMjAxOSBhdCAxMTo0NDoxMUFNIC0wNDAwLCBKZXJvbWUgR2xpc3Nl
IHdyb3RlOgo+ID4gPiA+ID4gT24gTW9uLCBNYXkgMjAsIDIwMTkgYXQgMTE6Mzk6NDJQTSArMDIw
MCwgRGFuaWVsIFZldHRlciB3cm90ZToKPiA+ID4gPiA+ID4gSnVzdCBhIGJpdCBvZiBwYXJhbm9p
YSwgc2luY2UgaWYgd2Ugc3RhcnQgcHVzaGluZyB0aGlzIGRlZXAgaW50bwo+ID4gPiA+ID4gPiBj
YWxsY2hhaW5zIGl0J3MgaGFyZCB0byBzcG90IGFsbCBwbGFjZXMgd2hlcmUgYW4gbW11IG5vdGlm
aWVyCj4gPiA+ID4gPiA+IGltcGxlbWVudGF0aW9uIG1pZ2h0IGZhaWwgd2hlbiBpdCdzIG5vdCBh
bGxvd2VkIHRvLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBJbnNwaXJlZCBieSBzb21lIGNvbmZ1
c2lvbiB3ZSBoYWQgZGlzY3Vzc2luZyBpOTE1IG1tdSBub3RpZmllcnMgYW5kCj4gPiA+ID4gPiA+
IHdoZXRoZXIgd2UgY291bGQgdXNlIHRoZSBuZXdseS1pbnRyb2R1Y2VkIHJldHVybiB2YWx1ZSB0
byBoYW5kbGUgc29tZQo+ID4gPiA+ID4gPiBjb3JuZXIgY2FzZXMuIFVudGlsIHdlIHJlYWxpemVk
IHRoYXQgdGhlc2UgYXJlIG9ubHkgZm9yIHdoZW4gYSB0YXNrCj4gPiA+ID4gPiA+IGhhcyBiZWVu
IGtpbGxlZCBieSB0aGUgb29tIHJlYXBlci4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gQW4gYWx0
ZXJuYXRpdmUgYXBwcm9hY2ggd291bGQgYmUgdG8gc3BsaXQgdGhlIGNhbGxiYWNrIGludG8gdHdv
Cj4gPiA+ID4gPiA+IHZlcnNpb25zLCBvbmUgd2l0aCB0aGUgaW50IHJldHVybiB2YWx1ZSwgYW5k
IHRoZSBvdGhlciB3aXRoIHZvaWQKPiA+ID4gPiA+ID4gcmV0dXJuIHZhbHVlIGxpa2UgaW4gb2xk
ZXIga2VybmVscy4gQnV0IHRoYXQncyBhIGxvdCBtb3JlIGNodXJuIGZvcgo+ID4gPiA+ID4gPiBm
YWlybHkgbGl0dGxlIGdhaW4gSSB0aGluay4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gU3VtbWFy
eSBmcm9tIHRoZSBtLWwgZGlzY3Vzc2lvbiBvbiB3aHkgd2Ugd2FudCBzb21ldGhpbmcgYXQgd2Fy
bmluZwo+ID4gPiA+ID4gPiBsZXZlbDogVGhpcyBhbGxvd3MgYXV0b21hdGVkIHRvb2xpbmcgaW4g
Q0kgdG8gY2F0Y2ggYnVncyB3aXRob3V0Cj4gPiA+ID4gPiA+IGh1bWFucyBoYXZpbmcgdG8gbG9v
ayBhdCBldmVyeXRoaW5nLiBJZiB3ZSBqdXN0IHVwZ3JhZGUgdGhlIGV4aXN0aW5nCj4gPiA+ID4g
PiA+IHByX2luZm8gdG8gYSBwcl93YXJuLCB0aGVuIHdlJ2xsIGhhdmUgZmFsc2UgcG9zaXRpdmVz
LiBBbmQgYXMtaXMsIG5vCj4gPiA+ID4gPiA+IG9uZSB3aWxsIGV2ZXIgc3BvdCB0aGUgcHJvYmxl
bSBzaW5jZSBpdCdzIGxvc3QgaW4gdGhlIG1hc3NpdmUgYW1vdW50cwo+ID4gPiA+ID4gPiBvZiBv
dmVyYWxsIGRtZXNnIG5vaXNlLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiB2MjogRHJvcCB0aGUg
ZnVsbCBXQVJOX09OIGJhY2t0cmFjZSBpbiBmYXZvdXIgb2YganVzdCBhIHByX3dhcm4gZm9yCj4g
PiA+ID4gPiA+IHRoZSBwcm9ibGVtYXRpYyBjYXNlIChNaWNoYWwgSG9ja28pLgo+ID4gPgo+ID4g
PiBJIGRpc2FncmVlIHdpdGggdGhpcyB2MiBub3RlLCB0aGUgV0FSTl9PTi9XQVJOIHdpbGwgdHJp
Z2dlciBjaGVja2Vycwo+ID4gPiBsaWtlIHN5emthbGxlciB0byByZXBvcnQgYSBidWcsIHdoaWxl
IGEgcmFuZG9tIHByX3dhcm4gcHJvYmFibHkgd2lsbAo+ID4gPiBub3QuCj4gPiA+Cj4gPiA+IEkg
ZG8gYWdyZWUgdGhlIGJhY2t0cmFjZSBpcyBub3QgdXNlZnVsIGhlcmUsIGJ1dCB3ZSBkb24ndCBo
YXZlIGEKPiA+ID4gd2Fybi1uby1iYWNrdHJhY2UgdmVyc2lvbi4uCj4gPiA+Cj4gPiA+IElNSE8s
IGtlcm5lbC9kcml2ZXIgYnVncyBzaG91bGQgYWx3YXlzIGJlIHJlcG9ydGVkIGJ5IFdBUk4gJgo+
ID4gPiBmcmllbmRzLiBXZSBuZXZlciBleHBlY3QgdG8gc2VlIHRoZSBwcmludCwgc28gd2h5IGRv
IHdlIGNhcmUgaG93IGJpZwo+ID4gPiBpdCBpcz8KPiA+ID4KPiA+ID4gQWxzbyBub3RlIHRoYXQg
V0FSTiBpbnRlZ3JhdGVzIGFuIHVubGlrZWx5KCkgaW50byBpdCBzbyB0aGUgY29kZWdlbiBpcwo+
ID4gPiBhdXRvbWF0aWNhbGx5IGEgYml0IG1vcmUgb3B0aW1hbCB0aGF0IHRoZSBpZiAmIHByX3dh
cm4gY29tYmluYXRpb24uCj4gPgo+ID4gV2hlcmUgZG8geW91IG1ha2UgYSBkaWZmZXJlbmNlIGJl
dHdlZW4gYSBXQVJOIHdpdGhvdXQgYmFja3RyYWNlIGFuZCBhCj4gPiBwcl93YXJuPyBUaGV5J3Jl
IGJvdGggZHVtcGVkIGF0IHRoZSBzYW1lIGxvZy1sZXZlbCAuLi4KPgo+IFdBUk4gcGFuaWNzIHRo
ZSBrZXJuZWwgd2hlbiB5b3Ugc2V0Cj4KPiAvcHJvYy9zeXMva2VybmVsL3BhbmljX29uX3dhcm4K
Pgo+IFNvIGF1dG8gdGVzdGluZyB0b29scyBjYW4gc2V0IHRoYXQgYW5kIGdldCBhIGNsZWFuIGRl
dGVjdGlvbiB0aGF0IHRoZQo+IGtlcm5lbCBoYXMgZmFpbGVkIHRoZSB0ZXN0IGluIHNvbWUgd2F5
Lgo+Cj4gT3RoZXJ3aXNlIHlvdSBhcmUgbGVmdCB3aXRoIGZyYWlsL3VnbHkgZ3JlcHBpbmcgb2Yg
ZG1lc2cuCgpIbSByaWdodC4KCkFueXdheSwgSSdtIGhhcHB5IHRvIHJlcGFpbnQgdGhlIGJpa2Vz
aGVkIGluIGFueSBjb2xvciB0aGF0J3MgZGVzaXJlZCwKaWYgdGhhdCBoZWxwcyB3aXRoIGxhbmRp
bmcgaXQuIFdBUk5fV0lUSE9VVF9CQUNLVFJBQ0UgbWlnaHQgdGFrZSBhIGJpdApsb25nZXIgKG5l
ZWQgdG8gZmluZCBhIGJpdCBvZiB0aW1lLCBwbHVzIGl0J2xsIGRlZmluaXRlbHkgYXR0cmFjdCBt
b3JlCmNvbW1lbnRzKS4KCk1pY2hhbD8KLURhbmllbAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2Fy
ZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KKzQxICgwKSA3OSAzNjUgNTcgNDggLSBodHRw
Oi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
