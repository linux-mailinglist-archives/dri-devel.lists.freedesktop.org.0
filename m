Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A416091154
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:25:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F8C36EA37;
	Sat, 17 Aug 2019 15:24:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 879C76E963
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 17:19:06 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id x4so6866403qts.5
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 10:19:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=aAuJkx3tYtzzL6W59IWOcvDtZCZIe1mJoCimZUlEFnw=;
 b=BhsQuXhFuddiooYT9OVgLP98/xB9u7bwqGM801uTEovSOCLoj5MSqUqh+QJNFAZaT8
 6ARkWfuGVZH2IKtSpjFkRn7qUeedIXZEBejfRC6eUa9v7bK9ZrEYFNexy28xYCg3YHTu
 3R1YGNlWf2eQ/gPzwSBIbkg7Mf/eQ1pBTx27eFHf//D33pUwTC4pW4qy0VjFA8fN9B/w
 MPwJ+gwOrxeekVXYuGFtZs9jNc1dm/5JTyu1Ip7MT4F6C+XaOT79y6XZFz2mb6hnsF8U
 Y+wVoyO+lfdRhHjh4FpoPkmSu0H35nwf7/yXLLC1CVpH8grPs+F/uvEJ/CsP+Pcxvbdh
 laEg==
X-Gm-Message-State: APjAAAVLVqmLjt6rhb5C+IUcOTA3UqZIg6J6La3N//yhNoAkxhLpAn16
 b3uS3cdP80I8QkRIw0+DA9GBAQ==
X-Google-Smtp-Source: APXvYqwT9qpP8xS/SEWzOUT0qxlqBNBY2XPEKDcBsyQzLY2w+EuruYBh4SnhqRD+DeiOPjnm58LqcA==
X-Received: by 2002:ac8:450c:: with SMTP id q12mr9723027qtn.298.1565975945646; 
 Fri, 16 Aug 2019 10:19:05 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id f133sm3160880qke.62.2019.08.16.10.19.04
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 16 Aug 2019 10:19:05 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hyfsW-0000pk-Hu; Fri, 16 Aug 2019 14:19:04 -0300
Date: Fri, 16 Aug 2019 14:19:04 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 1/5] mm: Check if mmu notifier callbacks are allowed to
 fail
Message-ID: <20190816171904.GA3166@ziepe.ca>
References: <20190814202027.18735-1-daniel.vetter@ffwll.ch>
 <20190814202027.18735-2-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190814202027.18735-2-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=aAuJkx3tYtzzL6W59IWOcvDtZCZIe1mJoCimZUlEFnw=;
 b=kbat1qAeKGkrmhubzeBSEX8UlXXey9lnVfQ/Vx0g766LW7GP2lpryQR7t+0vkFRRGb
 Jbg7BZUZkb7DQaUs/r2IBK+ejH2xzPCnmBv1XUEwYR4RJushKgYjcaKQFI1RQe5rxK2u
 iur/yAF+59Yi7khOcb0j1JRo9YgGqPOFo6YmToQ8a2GmkZUYQJzcSUeijq+xHVelXCf1
 SOBFkRoNZd6kH5Ae3nP7KGtraL7KLomnzgXBrJ+y2e8mrPRSpM/Bdc74HMV39ga4awdz
 VMW6PcO2Z8gNJRCIQXyLtl+PzOxTnwGROhY174YQjkrcOzSPj7hlg9pNW9UlEhadULXM
 hQ+Q==
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
Cc: Michal Hocko <mhocko@suse.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-mm@kvack.org,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 David Rientjes <rientjes@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMTQsIDIwMTkgYXQgMTA6MjA6MjNQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBKdXN0IGEgYml0IG9mIHBhcmFub2lhLCBzaW5jZSBpZiB3ZSBzdGFydCBwdXNoaW5n
IHRoaXMgZGVlcCBpbnRvCj4gY2FsbGNoYWlucyBpdCdzIGhhcmQgdG8gc3BvdCBhbGwgcGxhY2Vz
IHdoZXJlIGFuIG1tdSBub3RpZmllcgo+IGltcGxlbWVudGF0aW9uIG1pZ2h0IGZhaWwgd2hlbiBp
dCdzIG5vdCBhbGxvd2VkIHRvLgo+IAo+IEluc3BpcmVkIGJ5IHNvbWUgY29uZnVzaW9uIHdlIGhh
ZCBkaXNjdXNzaW5nIGk5MTUgbW11IG5vdGlmaWVycyBhbmQKPiB3aGV0aGVyIHdlIGNvdWxkIHVz
ZSB0aGUgbmV3bHktaW50cm9kdWNlZCByZXR1cm4gdmFsdWUgdG8gaGFuZGxlIHNvbWUKPiBjb3Ju
ZXIgY2FzZXMuIFVudGlsIHdlIHJlYWxpemVkIHRoYXQgdGhlc2UgYXJlIG9ubHkgZm9yIHdoZW4g
YSB0YXNrCj4gaGFzIGJlZW4ga2lsbGVkIGJ5IHRoZSBvb20gcmVhcGVyLgo+IAo+IEFuIGFsdGVy
bmF0aXZlIGFwcHJvYWNoIHdvdWxkIGJlIHRvIHNwbGl0IHRoZSBjYWxsYmFjayBpbnRvIHR3bwo+
IHZlcnNpb25zLCBvbmUgd2l0aCB0aGUgaW50IHJldHVybiB2YWx1ZSwgYW5kIHRoZSBvdGhlciB3
aXRoIHZvaWQKPiByZXR1cm4gdmFsdWUgbGlrZSBpbiBvbGRlciBrZXJuZWxzLiBCdXQgdGhhdCdz
IGEgbG90IG1vcmUgY2h1cm4gZm9yCj4gZmFpcmx5IGxpdHRsZSBnYWluIEkgdGhpbmsuCj4gCj4g
U3VtbWFyeSBmcm9tIHRoZSBtLWwgZGlzY3Vzc2lvbiBvbiB3aHkgd2Ugd2FudCBzb21ldGhpbmcg
YXQgd2FybmluZwo+IGxldmVsOiBUaGlzIGFsbG93cyBhdXRvbWF0ZWQgdG9vbGluZyBpbiBDSSB0
byBjYXRjaCBidWdzIHdpdGhvdXQKPiBodW1hbnMgaGF2aW5nIHRvIGxvb2sgYXQgZXZlcnl0aGlu
Zy4gSWYgd2UganVzdCB1cGdyYWRlIHRoZSBleGlzdGluZwo+IHByX2luZm8gdG8gYSBwcl93YXJu
LCB0aGVuIHdlJ2xsIGhhdmUgZmFsc2UgcG9zaXRpdmVzLiBBbmQgYXMtaXMsIG5vCj4gb25lIHdp
bGwgZXZlciBzcG90IHRoZSBwcm9ibGVtIHNpbmNlIGl0J3MgbG9zdCBpbiB0aGUgbWFzc2l2ZSBh
bW91bnRzCj4gb2Ygb3ZlcmFsbCBkbWVzZyBub2lzZS4KPiAKPiB2MjogRHJvcCB0aGUgZnVsbCBX
QVJOX09OIGJhY2t0cmFjZSBpbiBmYXZvdXIgb2YganVzdCBhIHByX3dhcm4gZm9yCj4gdGhlIHBy
b2JsZW1hdGljIGNhc2UgKE1pY2hhbCBIb2NrbykuCj4gCj4gdjM6IFJlYmFzZSBvbiB0b3Agb2Yg
R2xpc3NlJ3MgYXJnIHJld29yay4KPiAKPiB2NDogTW9yZSByZWJhc2Ugb24gdG9wIG9mIEdsaXNz
ZSByZXdvcmtpbmcgZXZlcnl0aGluZy4KPiAKPiB2NTogRml4dXAgcmViYXNlIGRhbWFnZSBhbmQg
YWxzbyBjYXRjaCBmYWlsdXJlcyAhPSBFQUdBSU4gZm9yCj4gIWJsb2NrYWJsZSAoSmFzb24pLiBB
bHNvIGdvIGJhY2sgdG8gV0FSTl9PTiBhcyByZXF1ZXN0ZWQgYnkgSmFzb24sIHNvCj4gYXV0b21h
dGljIGNoZWNrZXJzIGNhbiBlYXNpbHkgY2F0Y2ggYnVncyBieSBzZXR0aW5nIHBhbmljX29uX3dh
cm4uCj4gCj4gQ2M6IEFuZHJldyBNb3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+Cj4g
Q2M6IE1pY2hhbCBIb2NrbyA8bWhvY2tvQHN1c2UuY29tPgo+IENjOiAiQ2hyaXN0aWFuIEvDtm5p
ZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBDYzogRGF2aWQgUmllbnRqZXMgPHJpZW50
amVzQGdvb2dsZS5jb20+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwu
Y2g+Cj4gQ2M6ICJKw6lyw7RtZSBHbGlzc2UiIDxqZ2xpc3NlQHJlZGhhdC5jb20+Cj4gQ2M6IGxp
bnV4LW1tQGt2YWNrLm9yZwo+IENjOiBQYW9sbyBCb256aW5pIDxwYm9uemluaUByZWRoYXQuY29t
Pgo+IENjOiBKYXNvbiBHdW50aG9ycGUgPGpnZ0B6aWVwZS5jYT4KPiBTaWduZWQtb2ZmLWJ5OiBE
YW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiAtLS0KPiAgbW0vbW11X25v
dGlmaWVyLmMgfCAyICsrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCkFwcGxp
ZWQgdG8gaG1tLmdpdCwgdGhhbmtzCgpKYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
