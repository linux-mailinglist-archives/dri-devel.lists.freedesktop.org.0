Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4082897393
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 09:33:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 218FF6E923;
	Wed, 21 Aug 2019 07:33:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0BC86E3D6
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 13:31:36 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id 44so5958614qtg.11
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 06:31:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=Rau8DTLhA75HN92GYpCRUTjDJzQh4QiLbDwyZ3veNCQ=;
 b=SxIAh3axTQCtURTLB5tPaHnXguwcTmV+VsF8ZxzBFnSKvlPsv21sEKaHSSyY5wIYo5
 dMkwTI+mseFlGFxexbrtwRGbrxsCQd4O3kAfWE9D4WhRJZRh36BTO3ZWqx2HZ6bWVBie
 FBAmSQ3NAl9191NAcebix+a6zKJF9bz1vir/KrOEbDnJSL3kHrttafH/8ABCS0AOg/u3
 9wkYgwLOBaf+8XqWtr5BIEOVAt0ZCQe6HA+VfR2BWjtbnbxTpgNX/2tTQIaLnCYotvV1
 OVsZtdE9BThFyS678SyGQghw54lt/Cz+rgWkJr80JKYB9XRXKgjehALgK4T/SB8D8aDI
 OBUQ==
X-Gm-Message-State: APjAAAXq2l9ABMEtwRlLslpuAf7qGIY1X5QtzB4Rw86okTvUNVmJPuR/
 V3desGhIhT7dDNhIGj9L7lcMqXlTcHA=
X-Google-Smtp-Source: APXvYqysNleRHIxweJW4kUQqWciO4PnA7inG5RNUTSkUVmb1nCNlKeN951d2NRIAKVBELcjqlvEfqQ==
X-Received: by 2002:ac8:425a:: with SMTP id r26mr23111414qtm.309.1566307896020; 
 Tue, 20 Aug 2019 06:31:36 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id m129sm2560940qkf.86.2019.08.20.06.31.35
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 20 Aug 2019 06:31:35 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1i04EZ-0000YV-7s; Tue, 20 Aug 2019 10:31:35 -0300
Date: Tue, 20 Aug 2019 10:31:35 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 2/4] mm, notifier: Prime lockdep
Message-ID: <20190820133135.GF29246@ziepe.ca>
References: <20190820081902.24815-1-daniel.vetter@ffwll.ch>
 <20190820081902.24815-3-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190820081902.24815-3-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Wed, 21 Aug 2019 07:33:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=Rau8DTLhA75HN92GYpCRUTjDJzQh4QiLbDwyZ3veNCQ=;
 b=mas8Y/k2E852sfqmdBjki4+0c1zN+LWS95nZTvMODhRIXI5GRMbl9nccZ2+Vn6Woih
 Dah3xe19RUlkaa8o8IAFI40KKcQCWwBByL9kruX7QZlYKSD28X9fpbFwjPAZ86Dg/P1C
 cKFVKPhsro3UuqpcILFlAdo2eCq4NfBBI4O2+cQgL0Xjq3KsNiSUtC0PZMujNQLZkADv
 fE85d5hTmL1EJlG7jN+QczJ//3IFTSDXBw2EaAQXElYg13df3UJWU12j4jOOVPidGmhH
 GHXHFT/eIhecUzAgfQQFMqL1Ja9lCaB7rVn8U6eyVc5ng2FRVHBhvw37gsGE18A95KXO
 ZILg==
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Mike Rapoport <rppt@linux.vnet.ibm.com>, David Rientjes <rientjes@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMjAsIDIwMTkgYXQgMTA6MTk6MDBBTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBXZSB3YW50IHRvIHRlYWNoIGxvY2tkZXAgdGhhdCBtbXUgbm90aWZpZXJzIGNhbiBi
ZSBjYWxsZWQgZnJvbSBkaXJlY3QKPiByZWNsYWltIHBhdGhzLCBzaW5jZSBvbiBtYW55IENJIHN5
c3RlbXMgbG9hZCBtaWdodCBuZXZlciByZWFjaCB0aGF0Cj4gbGV2ZWwgKGUuZy4gd2hlbiBqdXN0
IHJ1bm5pbmcgZnV6emVyIG9yIHNtYWxsIGZ1bmN0aW9uYWwgdGVzdHMpLgo+IAo+IE1vdGl2YXRl
ZCBieSBhIGRpc2N1c3Npb24gd2l0aCBKYXNvbi4KPiAKPiBJJ3ZlIHB1dCB0aGUgYW5ub3RhdGlv
biBpbnRvIG1tdV9ub3RpZmllcl9yZWdpc3RlciBzaW5jZSBvbmx5IHdoZW4gd2UKPiBoYXZlIG1t
dSBub3RpZmllcnMgcmVnaXN0ZXJlZCBpcyB0aGVyZSBhbnkgcG9pbnQgaW4gdGVhY2hpbmcgbG9j
a2RlcAo+IGFib3V0IHRoZW0uIEFsc28sIHdlIGFscmVhZHkgaGF2ZSBhIGttYWxsb2MoLCBHRlBf
S0VSTkVMKSwgc28gdGhpcyBpcwo+IHNhZmUuCj4gCj4gQ2M6IEphc29uIEd1bnRob3JwZSA8amdn
QHppZXBlLmNhPgo+IENjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4K
PiBDYzogQW5kcmV3IE1vcnRvbiA8YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz4KPiBDYzogRGF2
aWQgUmllbnRqZXMgPHJpZW50amVzQGdvb2dsZS5jb20+Cj4gQ2M6ICJKw6lyw7RtZSBHbGlzc2Ui
IDxqZ2xpc3NlQHJlZGhhdC5jb20+Cj4gQ2M6IE1pY2hhbCBIb2NrbyA8bWhvY2tvQHN1c2UuY29t
Pgo+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBD
YzogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KPiBDYzog
RGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPiBDYzogTWlrZSBSYXBvcG9y
dCA8cnBwdEBsaW51eC52bmV0LmlibS5jb20+Cj4gQ2M6IGxpbnV4LW1tQGt2YWNrLm9yZwo+IFNp
Z25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+ICBt
bS9tbXVfbm90aWZpZXIuYyB8IDcgKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRp
b25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL21tL21tdV9ub3RpZmllci5jIGIvbW0vbW11X25vdGlm
aWVyLmMKPiBpbmRleCBkMTJlMzA3OWU3YTQuLjUzOGQzYmI4N2Y5YiAxMDA2NDQKPiArKysgYi9t
bS9tbXVfbm90aWZpZXIuYwo+IEBAIC0yNTYsNiArMjU2LDEzIEBAIHN0YXRpYyBpbnQgZG9fbW11
X25vdGlmaWVyX3JlZ2lzdGVyKHN0cnVjdCBtbXVfbm90aWZpZXIgKm1uLAo+ICAKPiAgCUJVR19P
TihhdG9taWNfcmVhZCgmbW0tPm1tX3VzZXJzKSA8PSAwKTsKPiAgCj4gKwlpZiAoSVNfRU5BQkxF
RChDT05GSUdfTE9DS0RFUCkpIHsKPiArCQlmc19yZWNsYWltX2FjcXVpcmUoR0ZQX0tFUk5FTCk7
Cj4gKwkJbG9ja19tYXBfYWNxdWlyZSgmX19tbXVfbm90aWZpZXJfaW52YWxpZGF0ZV9yYW5nZV9z
dGFydF9tYXApOwo+ICsJCWxvY2tfbWFwX3JlbGVhc2UoJl9fbW11X25vdGlmaWVyX2ludmFsaWRh
dGVfcmFuZ2Vfc3RhcnRfbWFwKTsKPiArCQlmc19yZWNsYWltX3JlbGVhc2UoR0ZQX0tFUk5FTCk7
Cj4gKwl9CgpMZXRzIHRyeSBpdCBvdXQgYXQgbGVhc3QKClJldmlld2VkLWJ5OiBKYXNvbiBHdW50
aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+CgpKYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
