Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC60A4C805
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 09:14:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C7AE6E50D;
	Thu, 20 Jun 2019 07:14:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 807136E444
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 16:50:57 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id j19so20698543qtr.12
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 09:50:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qZ7DILVFzp78tcp4G5VOohWGeQIPrvQGvihKnIg9H7E=;
 b=oFq3hkUpjThK5AhreAk55lotYTsNj/U2R6UZmCLdjOuwQdckeMmEX+JU9eyrFiba2b
 ZD8r2kazTsUmVhl1lWrNouDcr/oFfGxes7P11y6GjJT4G0qNNIkOpxke946XjLjFBg8g
 cJScMExzXw1phiw0kb8JNiW1EZTq0xBzQoSCIRTjpTCoNlKI7mCrlYqHSu8hkCePbxUH
 C1g073mTGeoiamjSuRyF/EjSvWFqJcv/2N6PFvWxSrAAWlE8BqWzYd2qiuO+jZmWrkSz
 I82DA/F73Sr/QlNYW7i2meEkp3PlWmxmve+B99IRAKfznIxHu6IUQymUEilPiU0CeRdW
 BtVQ==
X-Gm-Message-State: APjAAAWGaJHnF/3MYpLGp9eESP3DgLuxzMJUrCR2RZ4mCYd+UTqxK2zW
 dMT1evSIHFhKtm/YG4+ZwJYj7A==
X-Google-Smtp-Source: APXvYqwORT7n/pvkyNBXMNfOBu1GA78NLHvBz3GZoS2rYJCKw8+BpnU4WCUnG74vXzc78GqCKrZy8g==
X-Received: by 2002:a0c:e6a2:: with SMTP id j2mr32663508qvn.190.1560963056606; 
 Wed, 19 Jun 2019 09:50:56 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id m44sm14096849qtm.54.2019.06.19.09.50.56
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 19 Jun 2019 09:50:56 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hddnT-00022a-N7; Wed, 19 Jun 2019 13:50:55 -0300
Date: Wed, 19 Jun 2019 13:50:55 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Michal Hocko <mhocko@suse.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>, David Rientjes <rientjes@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [PATCH 1/4] mm: Check if mmu notifier callbacks are allowed to
 fail
Message-ID: <20190619165055.GI9360@ziepe.ca>
References: <20190520213945.17046-1-daniel.vetter@ffwll.ch>
 <20190521154411.GD3836@redhat.com>
 <20190618152215.GG12905@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190618152215.GG12905@phenom.ffwll.local>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Thu, 20 Jun 2019 07:13:36 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=qZ7DILVFzp78tcp4G5VOohWGeQIPrvQGvihKnIg9H7E=;
 b=KMoNMAk8Ui9/LtKeNa7HIyVKWhexKtOyUwM0YsZQI+1McUXlVPzPHPca+hUWtgwo/6
 03T2AvAUYyMxuNukN8dIy79whNPI9nkupfg9cH6LdySpEzUgauwhQFADzdyRe4Hvu1pY
 fDPLXTlCjygXw/QMhggf2P4CsbK4+s0v1QuBXUz4vFWJeGTQZFX/hUl7EC5MO9D/u2Xs
 NbXmeZUZ9Rt9lNVx3eXE/mU35xwWdDiw3jHn52j89OeRFlTDfy6CEZ1RraQEIP19d7mm
 VyWkyW+DGheaUcNRMXcsg92KDqLEdhfiLfFXP/kmU/pLCATJWbXUUz0VDhB0JqXgdvW1
 UIiQ==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTgsIDIwMTkgYXQgMDU6MjI6MTVQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBUdWUsIE1heSAyMSwgMjAxOSBhdCAxMTo0NDoxMUFNIC0wNDAwLCBKZXJvbWUg
R2xpc3NlIHdyb3RlOgo+ID4gT24gTW9uLCBNYXkgMjAsIDIwMTkgYXQgMTE6Mzk6NDJQTSArMDIw
MCwgRGFuaWVsIFZldHRlciB3cm90ZToKPiA+ID4gSnVzdCBhIGJpdCBvZiBwYXJhbm9pYSwgc2lu
Y2UgaWYgd2Ugc3RhcnQgcHVzaGluZyB0aGlzIGRlZXAgaW50bwo+ID4gPiBjYWxsY2hhaW5zIGl0
J3MgaGFyZCB0byBzcG90IGFsbCBwbGFjZXMgd2hlcmUgYW4gbW11IG5vdGlmaWVyCj4gPiA+IGlt
cGxlbWVudGF0aW9uIG1pZ2h0IGZhaWwgd2hlbiBpdCdzIG5vdCBhbGxvd2VkIHRvLgo+ID4gPiAK
PiA+ID4gSW5zcGlyZWQgYnkgc29tZSBjb25mdXNpb24gd2UgaGFkIGRpc2N1c3NpbmcgaTkxNSBt
bXUgbm90aWZpZXJzIGFuZAo+ID4gPiB3aGV0aGVyIHdlIGNvdWxkIHVzZSB0aGUgbmV3bHktaW50
cm9kdWNlZCByZXR1cm4gdmFsdWUgdG8gaGFuZGxlIHNvbWUKPiA+ID4gY29ybmVyIGNhc2VzLiBV
bnRpbCB3ZSByZWFsaXplZCB0aGF0IHRoZXNlIGFyZSBvbmx5IGZvciB3aGVuIGEgdGFzawo+ID4g
PiBoYXMgYmVlbiBraWxsZWQgYnkgdGhlIG9vbSByZWFwZXIuCj4gPiA+IAo+ID4gPiBBbiBhbHRl
cm5hdGl2ZSBhcHByb2FjaCB3b3VsZCBiZSB0byBzcGxpdCB0aGUgY2FsbGJhY2sgaW50byB0d28K
PiA+ID4gdmVyc2lvbnMsIG9uZSB3aXRoIHRoZSBpbnQgcmV0dXJuIHZhbHVlLCBhbmQgdGhlIG90
aGVyIHdpdGggdm9pZAo+ID4gPiByZXR1cm4gdmFsdWUgbGlrZSBpbiBvbGRlciBrZXJuZWxzLiBC
dXQgdGhhdCdzIGEgbG90IG1vcmUgY2h1cm4gZm9yCj4gPiA+IGZhaXJseSBsaXR0bGUgZ2FpbiBJ
IHRoaW5rLgo+ID4gPiAKPiA+ID4gU3VtbWFyeSBmcm9tIHRoZSBtLWwgZGlzY3Vzc2lvbiBvbiB3
aHkgd2Ugd2FudCBzb21ldGhpbmcgYXQgd2FybmluZwo+ID4gPiBsZXZlbDogVGhpcyBhbGxvd3Mg
YXV0b21hdGVkIHRvb2xpbmcgaW4gQ0kgdG8gY2F0Y2ggYnVncyB3aXRob3V0Cj4gPiA+IGh1bWFu
cyBoYXZpbmcgdG8gbG9vayBhdCBldmVyeXRoaW5nLiBJZiB3ZSBqdXN0IHVwZ3JhZGUgdGhlIGV4
aXN0aW5nCj4gPiA+IHByX2luZm8gdG8gYSBwcl93YXJuLCB0aGVuIHdlJ2xsIGhhdmUgZmFsc2Ug
cG9zaXRpdmVzLiBBbmQgYXMtaXMsIG5vCj4gPiA+IG9uZSB3aWxsIGV2ZXIgc3BvdCB0aGUgcHJv
YmxlbSBzaW5jZSBpdCdzIGxvc3QgaW4gdGhlIG1hc3NpdmUgYW1vdW50cwo+ID4gPiBvZiBvdmVy
YWxsIGRtZXNnIG5vaXNlLgo+ID4gPiAKPiA+ID4gdjI6IERyb3AgdGhlIGZ1bGwgV0FSTl9PTiBi
YWNrdHJhY2UgaW4gZmF2b3VyIG9mIGp1c3QgYSBwcl93YXJuIGZvcgo+ID4gPiB0aGUgcHJvYmxl
bWF0aWMgY2FzZSAoTWljaGFsIEhvY2tvKS4KCkkgZGlzYWdyZWUgd2l0aCB0aGlzIHYyIG5vdGUs
IHRoZSBXQVJOX09OL1dBUk4gd2lsbCB0cmlnZ2VyIGNoZWNrZXJzCmxpa2Ugc3l6a2FsbGVyIHRv
IHJlcG9ydCBhIGJ1Zywgd2hpbGUgYSByYW5kb20gcHJfd2FybiBwcm9iYWJseSB3aWxsCm5vdC4K
CkkgZG8gYWdyZWUgdGhlIGJhY2t0cmFjZSBpcyBub3QgdXNlZnVsIGhlcmUsIGJ1dCB3ZSBkb24n
dCBoYXZlIGEKd2Fybi1uby1iYWNrdHJhY2UgdmVyc2lvbi4uCgpJTUhPLCBrZXJuZWwvZHJpdmVy
IGJ1Z3Mgc2hvdWxkIGFsd2F5cyBiZSByZXBvcnRlZCBieSBXQVJOICYKZnJpZW5kcy4gV2UgbmV2
ZXIgZXhwZWN0IHRvIHNlZSB0aGUgcHJpbnQsIHNvIHdoeSBkbyB3ZSBjYXJlIGhvdyBiaWcKaXQg
aXM/CgpBbHNvIG5vdGUgdGhhdCBXQVJOIGludGVncmF0ZXMgYW4gdW5saWtlbHkoKSBpbnRvIGl0
IHNvIHRoZSBjb2RlZ2VuIGlzCmF1dG9tYXRpY2FsbHkgYSBiaXQgbW9yZSBvcHRpbWFsIHRoYXQg
dGhlIGlmICYgcHJfd2FybiBjb21iaW5hdGlvbi4KCkphc29uCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
