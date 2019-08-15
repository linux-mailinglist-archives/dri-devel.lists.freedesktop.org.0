Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BC691143
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:24:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B93B76E53E;
	Sat, 17 Aug 2019 15:24:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 180576EA4A
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 18:57:46 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id u34so3466832qte.2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 11:57:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=FHRVs8d/XUYBFJ0v54ixeAZNXrYoqSp3PXhqb8jtHuk=;
 b=BZQ1yNbOrYEkGge+HvkJpNgKBa9p5yAQcvFzWpvQDPIWT0fW8icp5b7MnslbD35QsE
 00NnYDXHqKVTHy+PxHCQKtBqxKmqAk7HRQ3hG1LeMOLvsacRC24PPm3/Cb37h+l8DSfY
 tvl71R2ogjMhmBXCPbbaO2i5EhT3jdwyOwp6O3JfIBsbhtIOGURMjNTCUD3tdcjKRwND
 7JGCfEhgNvcRHFk9ZiFADrZxieA4bGdd1yN8jz7hQxm1OdVt1mpvcKzmCegiknU7AkLp
 A3+si58oUvSoSqYw9aGxSj7Fz5h3BKAErd2SMLjouAAfvOzsjMP3R9FbIMFSOeorQfZ8
 xQ4w==
X-Gm-Message-State: APjAAAUpQmcsviPVXaQeiIm6jhldxmkgyLDtuiudTGZ0+Guww1LoSK9X
 Zj7XllYU/uoU++IpQXf9uE03nw==
X-Google-Smtp-Source: APXvYqxjLmxNeFjmli8wX4zskAvMxPbirFP9zV8m/2PlRmhm3DonMF9Q6OJuAF/HRcwUiH7YcMzZ6g==
X-Received: by 2002:ad4:41cc:: with SMTP id a12mr4452947qvq.0.1565895465226;
 Thu, 15 Aug 2019 11:57:45 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id q62sm1993341qkb.69.2019.08.15.11.57.44
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 15 Aug 2019 11:57:44 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hyKwR-0007hH-UA; Thu, 15 Aug 2019 15:57:43 -0300
Date: Thu, 15 Aug 2019 15:57:43 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>
Subject: Re: [PATCH 2/5] kernel.h: Add non_block_start/end()
Message-ID: <20190815185743.GQ21596@ziepe.ca>
References: <20190815130415.GD21596@ziepe.ca>
 <CAKMK7uE9zdmBuvxa788ONYky=46GN=5Up34mKDmsJMkir4x7MQ@mail.gmail.com>
 <20190815143759.GG21596@ziepe.ca>
 <CAKMK7uEJQ6mPQaOWbT_6M+55T-dCVbsOxFnMC6KzLAMQNa-RGg@mail.gmail.com>
 <20190815151028.GJ21596@ziepe.ca>
 <CAKMK7uG33FFCGJrDV4-FHT2FWi+Z5SnQ7hoyBQd4hignzm1C-A@mail.gmail.com>
 <20190815173557.GN21596@ziepe.ca>
 <20190815173922.GH30916@redhat.com>
 <20190815180159.GO21596@ziepe.ca>
 <20190815182719.GB4920@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190815182719.GB4920@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=FHRVs8d/XUYBFJ0v54ixeAZNXrYoqSp3PXhqb8jtHuk=;
 b=f5hy2L4ne+Nk9hvc+Cs1SmyIY0e0sZgq3H9QjMGhICCOQyK1i3auQwTufLME4Mv974
 0aulvZuvp1aV19tl7YBvcpnpH4UbGlSErRpK6IN8M0MgEsCOm/Pd3elvLwczS1QoYGfZ
 CRLxHag/OPjHZ8TMWYRgHwSM8G5hs7ib7icsD2B5BZeSW9+S8YNH9RNazv0umrEp66sb
 fTeBUGnFlJ++gZcie138/gu1kox+IYbNnbpG13WRGRjjWQbzc1VFafHpodwfitsLNIep
 qRYhhiS1ZosqrJXeIbsiAVf0BXg8QpjquImzVnd4ua8nDBvtbBZ7CRxayONNl5vMbgjF
 5wYw==
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
Cc: Feng Tang <feng.tang@intel.com>, Randy Dunlap <rdunlap@infradead.org>,
 Kees Cook <keescook@chromium.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Peter Zijlstra <peterz@infradead.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Jann Horn <jannh@google.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Michal Hocko <mhocko@kernel.org>, Linux MM <linux-mm@kvack.org>,
 Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 David Rientjes <rientjes@google.com>, Wei Wang <wvw@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMDI6Mjc6MTlQTSAtMDQwMCwgSmVyb21lIEdsaXNzZSB3
cm90ZToKPiA+IEhvdyBleGFjdGx5PyBUaGlzIGlzIGhvbGRpbmcgdGhlIHBhZ2UgcGluLCBzbyB0
aGUgb25seSB3YXkgdGhlIFZBCj4gPiBtYXBwaW5nIGNhbiBiZSBjaGFuZ2VkIGlzIHZpYSBleHBs
aWNpdCB1c2VyIGFjdGlvbi4KPiA+IAo+ID4gaWU6Cj4gPiAKPiA+ICAgIGdwdV93cml0ZV9zb21l
dGhpbmcodmEsIHNpemUpCj4gPiAgICBtbWFwKC4uLCB2YSwgc2l6ZSwgTU1BUF9GSVhFRCk7Cj4g
PiAgICBncHVfd2FpdF9kb25lKCkKPiA+IAo+ID4gVGhpcyBpcyByYWN5IGFuZCBpbmRldGVybWlu
YXRlIHdpdGggYm90aCBtb2RlbHMuCj4gPiAKPiA+IEJhc2VkIG9uIHRoZSBjb21tZW50IGluIGk5
MTUgaXQgYXBwZWFycyB0byBiZSBnb2luZyBvbiB0aGUgbW9kZWwgdGhhdAo+ID4gY2hhbmdlcyB0
byB0aGUgbW1hcCBieSB1c2Vyc3BhY2Ugd2hlbiB0aGUgR1BVIGlzIHdvcmtpbmcgb24gaXQgaXMg
YQo+ID4gcHJvZ3JhbW1pbmcgYnVnLiBUaGlzIGlzIHJlYXNvbmFibGUsIGxvdHMgb2Ygc3lzdGVt
cyB1c2UgdGhpcyBraW5kIG9mCj4gPiBjb25zaXN0ZW5jeSBtb2RlbC4KPiAKPiBXZWxsIHVzZXJz
cGFjZSBwcm9jZXNzIGRvaW5nIG11bm1hcCgpLCBtcmVtYXAoKSwgZm9yaygpIGFuZCB0aGluZ3Mg
bGlrZQo+IHRoYXQgYXJlIGEgYnVnIGZyb20gdGhlIGk5MTUga2VybmVsIGFuZCB1c2Vyc3BhY2Ug
Y29udHJhY3QgcG9pbnQgb2Ygdmlldy4KPiAKPiBCdXQgdGhpbmdzIGxpa2UgbWlncmF0aW9uIG9y
IHJlY2xhaW0gYXJlIG5vdCBjb3ZlciB1bmRlciB0aGF0IGNvbnRyYWN0Cj4gYW5kIGZvciB0aG9z
ZSB0aGUgZXhwZWN0YXRpb24gaXMgdGhhdCBDUFUgYWNjZXNzIHRvIHRoZSBzYW1lIHZpcnR1YWwg
YWRkcmVzcwo+IHNob3VsZCBhbGxvdyB0byBnZXQgd2hhdCB3YXMgbGFzdCB3cml0dGVuIHRvIGl0
IGVpdGhlciBieSB0aGUgR1BVIG9yIHRoZQo+IENQVS4KCk9rYXksIHRoaXMgaXMgYSBtb3JlIHJl
YXNvbmFibGUgcG9pbnQgLSBJIGFncmVlIHRoZSBpOTE1IHJlZ2lzdHJhdGlvbgpjYWNoZSBtb2Rl
bCBwcmVjbHVkZXMgdXNpbmcgbWlncmF0aW9uIGFuZCB0aHVzIERFVklDRV9QUklWQVRFLiBUaGlz
IGlzCmEgc3Ryb25nIG1vdGl2YXRpb24gdG8gdXNlIHRoZSBobW0gYXBwcm9hY2gKCkJ1dCB3ZSBz
dGFydGVkIG91dCB0aGlzIGNvbnZlcnN0YXRpb24gYXNraW5nIGlmIGk5MTUgaXMgY29ycmVjdCwg
YW5kIEkKc3RpbGwgc2F5IGEgcmVnaXN0cmF0aW9uIGNhY2hlIG1vZGVsIGlzIGEgZnVuY3Rpb25h
bGx5IGNvcnJlY3Qgd2F5IHRvCnVzZSBub3RpZmllcnMuCgo+IEJlY2F1c2Ugb2YgdGhlIHJlZmVy
ZW5jZSBvbiB0aGUgcGFnZSB0aGUgaTkxNSBkcml2ZXIgY2FuIGZvcmVnbyB0aGUgbW11Cj4gbm90
aWZpZXIgZW5kIGNhbGxiYWNrLiBUaGUgdGhpbmcgaGVyZSBpcyB0aGF0IHRha2luZyBhIHBhZ2Ug
cmVmZXJlbmNlCj4gaXMgcG9pbnRsZXNzIGlmIHdlIGhhdmUgYmV0dGVyIHN5bmNocm9uaXphdGlv
biBhbmQgdHJhY2tpbmcgb2YgbW11Cj4gbm90aWZpZXIuIEhlbmNlIGNvbnZlcnRpbmcgdG8gaG1t
IG1pcnJvciBhbGxvd3MgdG8gYXZvaWQgdGFraW5nIGEgcmVmCj4gb24gdGhlIHBhZ2Ugd2hpbGUg
c3RpbGwga2VlcGluZyB0aGUgc2FtZSBmdW5jdGlvbmFsaXR5IGFzIG9mIHRvZGF5LgoKSG93ZXZl
ciwgdGhlcmUgaXMgYSBodWdlIHRyYWRlIG9mZiBoZXJlLiBEcml2ZXJzIGxpa2UgdGhpcyBhcmUg
Z29pbmcKdG8gaGF2ZSBhIHZlcnkgY29tcGxpY2F0ZWQgbG9ja2luZyBpbnNpZGUgaW52YWxpZGF0
ZV9yYW5nZV9zdGFydCBhcwp0aGV5IG11c3Qgc2xlZXAgd2FpdGluZyBmb3IgZG1hIGJ1ZmZlciBy
ZWZlcmVuY2VzIHRvIGdvIHRvIHplcm8uCgo+IEdQVSBkcml2ZXIgaGF2ZSBjb21wbGV4IHVzYWdl
IHBhdHRlcm4gdGhlIHRsYiBzaG9vdGRvd24gaXMgaW1wbGljaXQKPiBvbmNlIHRoZSBHRU0gb2Jq
ZWN0IGFzc29jaWF0ZWQgd2l0aCB0aGUgdXB0ciBpcyBpbnZhbGlkYXRlZCBpdCBtZWFucwo+IG5l
eHQgdGltZSB1c2Vyc3BhY2Ugc3VibWl0IGNvbW1hbmQgYWdhaW5zdCB0aGF0IEdFTSBvYmplY3Qg
aXQgd2lsbAo+IGhhdmUgdG8gcmUtdmFsaWRhdGUgaXQgd2hpY2ggbWVhbnMgcmUtcHJvZ3JhbSB0
aGUgR1BVIHBhZ2UgdGFibGUgdG8KPiBwb2ludCB0byB0aGUgcHJvcGVyIGFkZHJlc3MgKGFuZCBy
ZS1jYWxsIEdVUCkuCgpJIHRoaW5rIGl0IGlzIGEgbWlzdGFrZSB0byB0cnkgYW5kIGNyYW0gdGhl
IHZlcnkgZGlmZmVyZW50IGFwcHJvYWNoZXMKdG8gbm90aWZpZXJzIGludG8gdGhlIHNhbWUgQVBJ
LiBTVyByZWYgY291bnRpbmcgb2YgRE1BIGJ1ZmZlcnMgdnMgSFcKYXN5bmMgcGFnZSBmYXVsdGlu
ZyBoYXZlIHRvdGFsbHkgZGlmZmVyZW50IHJlcXVpcmVtZW50cyBhbmQgbG9ja2luZwpzY2hlbWVz
LgoKVGhpcyBleHBsYWlucyB3aHkgQU1ER1BVIGdldHMgYXdheSB3aXRoIG5vdCB1c2luZyB0aGUg
aG1tIEFQSQpwcm9wZXJseSwgaXQgaXMgcHJvYmFibHkgcmVseWluZyBvbiBpdHMgRE1BIHJlZmNv
dW50LCBub3QgdGhlIGhtbQp2YWxpZCwgdG8ga2VlcCB0aGluZ3MgaW4gb3JkZXI/CgpJIHRoaW5r
IHRoZSBBUEkgYXBwcm9hY2ggaW4gaG1tX21pcnJvciBpcyByZWFzb25hYmxlIGZvciBwYWdlIGZh
dWx0aW5nCkhXLCBidXQgZG9lcyBub3Qgc2VydmUgcmVmY291bnRpbmcgSFcgd2VsbCBhdCBhbGwu
CgpKYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
