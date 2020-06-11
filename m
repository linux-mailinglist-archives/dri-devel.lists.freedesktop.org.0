Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A962D1F8291
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jun 2020 12:17:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A45DD6E3CB;
	Sat, 13 Jun 2020 10:16:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C148C6E91E
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 14:29:55 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id r16so2719623qvm.6
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 07:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=iS2yXa8gKHNwS2UChvutG5V1O7eVsWQuqeZ34MVLXc0=;
 b=FseEPp8Fso/6As15zVP3Ym7NPs9kvuOvCIptWPzePslhXjFzBDqQXKhNnYWATD+15R
 Al/WYp+hbHsKFK4X2ojiK+EHs7yhQmmL+EDMNyPnOR89aEMfOJc5yjRH0aJYrgc62Vs4
 Doe6mzmOoH4EXTAuqTBF2FSP/hDXXwvjF9/30kmpRxNG9NB7+P9LM/fisKeD5/yoOQW2
 PEChRlkS/fkvSbixN4O37472Uu4NlrAggCY6VhNzkkPK4SDvGr55LxYD+4T/EdoOhWVl
 4gdKknLaMPLAltUrhRVsboI89uK5/pkjAghK31JbmOaIh7KRRHIu3+t+3Jd7dolDArof
 vWaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=iS2yXa8gKHNwS2UChvutG5V1O7eVsWQuqeZ34MVLXc0=;
 b=akI8DybS163DSAUxPEWVxgB97CFYXJ3MCHz2wcFE9A/L6sJDSM3E1xF55Br7tt6aeS
 eUHm3T9RvGkNbn6Q3hRUdBa3hbJt6MTcXDJbsd9S2nANIie+McCv9HjFGHbuxrzPb4yz
 LlI40vP7fdmCFG0AuoOuhE+avLBvdq/iJvegKiCDbFUur4jMZxvnPhJen9O3hOLFnOuo
 FuUiwS9vLXcJKEi5/LM2FBACbZaYD3aWDNvectjFCiWbrsDU69IEi0yb2wSnFHsw+v1h
 pe7QCihYaqe18V4iZGiVDIZyQ+oYh7jnc4185ZXBgX+t+bgwTbSQWXMjXSwRdW9ya5Oa
 0zWA==
X-Gm-Message-State: AOAM533Wx3xvWzAfVApIkSibyp1MR+LiM0XDSXBWXpVFf8wIvzkywphl
 pxsnaXabF4/qdjkaubMAl0AR6Q==
X-Google-Smtp-Source: ABdhPJyglizbugl/WH3rPRKasgzr+R/H6TfhyQSpLDpaYV29o2R1YgDECnGExOwsuREk0P31Na2jyw==
X-Received: by 2002:a05:6214:13e6:: with SMTP id
 ch6mr8093893qvb.29.1591885794923; 
 Thu, 11 Jun 2020 07:29:54 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id 195sm2287728qkg.74.2020.06.11.07.29.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2020 07:29:54 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.93) (envelope-from <jgg@ziepe.ca>)
 id 1jjODJ-005xNV-Ml; Thu, 11 Jun 2020 11:29:53 -0300
Date: Thu, 11 Jun 2020 11:29:53 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] mm: Track mmu notifiers in fs_reclaim_acquire/release
Message-ID: <20200611142953.GA1419658@ziepe.ca>
References: <20200604081224.863494-2-daniel.vetter@ffwll.ch>
 <20200610194101.1668038-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200610194101.1668038-1-daniel.vetter@ffwll.ch>
X-Mailman-Approved-At: Sat, 13 Jun 2020 10:16:46 +0000
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
Cc: linux-rdma@vger.kernel.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, amd-gfx@lists.freedesktop.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, linux-mm@kvack.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas_os@shipmail.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTAsIDIwMjAgYXQgMDk6NDE6MDFQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBmc19yZWNsYWltX2FjcXVpcmUvcmVsZWFzZSBuaWNlbHkgY2F0Y2ggcmVjdXJzaW9u
IGlzc3VlcyB3aGVuCj4gYWxsb2NhdGluZyBHRlBfS0VSTkVMIG1lbW9yeSBhZ2FpbnN0IHNocmlu
a2VycyAod2hpY2ggZ3B1IGRyaXZlcnMgdGVuZAo+IHRvIHVzZSB0byBrZWVwIHRoZSBleGNlc3Np
dmUgY2FjaGVzIGluIGNoZWNrKS4gRm9yIG1tdSBub3RpZmllcgo+IHJlY3Vyc2lvbnMgd2UgZG8g
aGF2ZSBsb2NrZGVwIGFubm90YXRpb25zIHNpbmNlIDIzYjY4Mzk1YzdjNwo+ICgibW0vbW11X25v
dGlmaWVyczogYWRkIGEgbG9ja2RlcCBtYXAgZm9yIGludmFsaWRhdGVfcmFuZ2Vfc3RhcnQvZW5k
IikuCj4gCj4gQnV0IHRoZXNlIG9ubHkgZmlyZSBpZiBhIHBhdGggYWN0dWFsbHkgcmVzdWx0cyBp
biBzb21lIHB0ZQo+IGludmFsaWRhdGlvbiAtIGZvciBtb3N0IHNtYWxsIGFsbG9jYXRpb25zIHRo
YXQncyB2ZXJ5IHJhcmVseSB0aGUgY2FzZS4KPiBUaGUgb3RoZXIgdHJvdWJsZSBpcyB0aGF0IHB0
ZSBpbnZhbGlkYXRpb24gY2FuIGhhcHBlbiBhbnkgdGltZSB3aGVuCj4gX19HRlBfUkVDTEFJTSBp
cyBzZXQuIFdoaWNoIG1lYW5zIG9ubHkgcmVhbGx5IEdGUF9BVE9NSUMgaXMgYSBzYWZlCj4gY2hv
aWNlLCBHRlBfTk9JTyBpc24ndCBnb29kIGVub3VnaCB0byBhdm9pZCBwb3RlbnRpYWwgbW11IG5v
dGlmaWVyCj4gcmVjdXJzaW9uLgo+IAo+IEkgd2FzIHBvbmRlcmluZyB3aGV0aGVyIHdlIHNob3Vs
ZCBqdXN0IGRvIHRoZSBnZW5lcmFsIGFubm90YXRpb24sIGJ1dAo+IHRoZXJlJ3MgYWx3YXlzIHRo
ZSByaXNrIGZvciBmYWxzZSBwb3NpdGl2ZXMuIFBsdXMgSSdtIGFzc3VtaW5nIHRoYXQKPiB0aGUg
Y29yZSBmcyBhbmQgaW8gY29kZSBpcyBhIGxvdCBiZXR0ZXIgcmV2aWV3ZWQgYW5kIHRlc3RlZCB0
aGFuCj4gcmFuZG9tIG1tdSBub3RpZmllciBjb2RlIGluIGRyaXZlcnMuIEhlbmNlIHdoeSBJIGRl
Y2lkZSB0byBvbmx5Cj4gYW5ub3RhdGUgZm9yIHRoYXQgc3BlY2lmaWMgY2FzZS4KPiAKPiBGdXJ0
aGVybW9yZSBldmVuIGlmIHdlJ2QgY3JlYXRlIGEgbG9ja2RlcCBtYXAgZm9yIGRpcmVjdCByZWNs
YWltLCB3ZSdkCj4gc3RpbGwgbmVlZCB0byBleHBsaWNpdCBwdWxsIGluIHRoZSBtbXUgbm90aWZp
ZXIgbWFwIC0gdGhlcmUncyBhIGxvdAo+IG1vcmUgcGxhY2VzIHRoYXQgZG8gcHRlIGludmFsaWRh
dGlvbiB0aGFuIGp1c3QgZGlyZWN0IHJlY2xhaW0sIHRoZXNlCj4gdHdvIGNvbnRleHRzIGFyZW50
IHRoZSBzYW1lLgo+IAo+IE5vdGUgdGhhdCB0aGUgbW11IG5vdGlmaWVycyBuZWVkaW5nIHRoZWly
IG93biBpbmRlcGVuZGVudCBsb2NrZGVwIG1hcAo+IGlzIGFsc28gdGhlIHJlYXNvbiB3ZSBjYW4n
dCBob2xkIHRoZW0gZnJvbSBmc19yZWNsYWltX2FjcXVpcmUgdG8KPiBmc19yZWNsYWltX3JlbGVh
c2UgLSBpdCB3b3VsZCBuZXN0IHdpdGggdGhlIGFjcXVpc3Rpb24gaW4gdGhlIHB0ZQo+IGludmFs
aWRhdGlvbiBjb2RlLCBjYXVzaW5nIGEgbG9ja2RlcCBzcGxhdC4gQW5kIHdlIGNhbid0IHJlbW92
ZSB0aGUKPiBhbm5vdGF0aW9ucyBmcm9tIHB0ZSBpbnZhbGlkYXRpb24gYW5kIGFsbCB0aGUgb3Ro
ZXIgcGxhY2VzIHNpbmNlCj4gdGhleSdyZSBjYWxsZWQgZnJvbSBtYW55IG90aGVyIHBsYWNlcyB0
aGFuIHBhZ2UgcmVjbGFpbS4gSGVuY2Ugd2UgY2FuCj4gb25seSBkbyB0aGUgZXF1aXZhbGVudCBv
ZiBtaWdodF9sb2NrLCBidXQgb24gdGhlIHJhdyBsb2NrZGVwIG1hcC4KPiAKPiBXaXRoIHRoaXMg
d2UgY2FuIGFsc28gcmVtb3ZlIHRoZSBsb2NrZGVwIHByaW1pbmcgYWRkZWQgaW4gNjYyMDRmMWQy
ZDFiCj4gKCJtbS9tbXVfbm90aWZpZXJzOiBwcmltZSBsb2NrZGVwIikgc2luY2UgdGhlIG5ldyBh
bm5vdGF0aW9ucyBhcmUKPiBzdHJpY3RseSBtb3JlIHBvd2VyZnVsLgo+IAo+IHYyOiBSZXZpZXcg
ZnJvbSBUaG9tYXMgSGVsbHN0cm9tOgo+IC0gdW5ib3RjaCB0aGUgZnNfcmVjbGFpbSBjb250ZXh0
IGNoZWNrLCBJIGFjY2lkZW50YWxseSBpbnZlcnRlZCBpdCwKPiAgIGJ1dCBpdCBkaWRuJ3QgYmxv
dyB1cCBiZWNhdXNlIEkgaW52ZXJ0ZWQgaXQgaW1tZWRpYXRlbHkKPiAtIGZpeCBjb21waWxpbmcg
Zm9yICFDT05GSUdfTU1VX05PVElGSUVSCj4gCj4gQ2M6IFRob21hcyBIZWxsc3Ryw7ZtIChJbnRl
bCkgPHRob21hc19vc0BzaGlwbWFpbC5vcmc+Cj4gQ2M6IEFuZHJldyBNb3J0b24gPGFrcG1AbGlu
dXgtZm91bmRhdGlvbi5vcmc+Cj4gQ2M6IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNv
bT4KPiBDYzogbGludXgtbW1Aa3ZhY2sub3JnCj4gQ2M6IGxpbnV4LXJkbWFAdmdlci5rZXJuZWwu
b3JnCj4gQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRl
bC5jb20+Cj4gQ2M6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4K
PiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4K
PiAtLS0KPiBUaGlzIGlzIHBhcnQgb2YgYSBncHUgbG9ja2RlcCBhbm5vdGF0aW9uIHNlcmllcyBz
aW1wbHkgYmVjYXVzZSBpdAo+IHJlYWxseSBoZWxwcyB0byBjYXRjaCBpc3N1ZXMgd2hlcmUgZ3B1
IHN1YnN5c3RlbSBsb2NrcyBhbmQgcHJpbWl0aXZlcwo+IGNhbiBkZWFkbG9jayB3aXRoIHRoZW1z
ZWx2ZXMgdGhyb3VnaCBhbGxvY2F0aW9ucyBhbmQgbW11IG5vdGlmaWVycy4KPiBCdXQgYXNpZGUg
ZnJvbSB0aGF0IG1vdGl2YXRpb24gaXQgc2hvdWxkIGJlIGNvbXBsZXRlbHkgZnJlZS1zdGFuZGlu
ZywKPiBhbmQgY2FuIGxhbmQgdGhyb3VnaCAtbW0vLXJkbWEvLWhtbSBvciBhbnkgb3RoZXIgdHJl
ZSByZWFsbHkgd2hlbmV2ZXIuCj4gLURhbmllbAoKSSdtIHN0aWxsIG5vdCB0b3RhbGx5IGNsZWFy
IG9uIGhvdyBhbGwgdGhlIEdGUCBmbGFncyBtYXAgdG8KZGlmZmVyZW50IGJlaGF2aW9ycywgYnV0
IHRoaXMgc2VlbXMgcGxhdXNpYmxlIHRvIG1lCgpBdCB0aGlzIHBvaW50IGl0IHNob3VsZCBnbyB0
aHJvdWdoIEFuZHJldydzIHRyZWUsIHRoYW5rcwoKQWNrZWQtYnk6IEphc29uIEd1bnRob3JwZSA8
amdnQG1lbGxhbm94LmNvbT4gIyBGb3IgbW11X25vdGlmaWVycwoKSmFzb24KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
