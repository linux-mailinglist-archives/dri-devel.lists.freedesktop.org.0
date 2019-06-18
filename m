Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A45C94B2C9
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 09:11:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C59A16E2DC;
	Wed, 19 Jun 2019 07:11:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E396E21D
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 18:57:58 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id p15so16750462qtl.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 11:57:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=PttUnfJR2Mh5w8ZNX8UBClI5Uo9DGdQHvLC9b9+U4Hc=;
 b=g/+MBTK7uRc4wO0HPB2C2u3GuPzvS/FfZMYKPL5cgFZj14R2GbiQJf8xmv4Gq5ASg2
 sWSoJhpCrdFo4TJD2h3B7p1NGPKiOy3rKRkJ3Ww/TGnBUul2QKwMLBXjSzRP/ZYYREPW
 EHJHfzuElhKTC0XWeWpejnD2WsGHhJYMBt82dv+ZLhiDQ44woM579SV/H+UDZ/G75Wzl
 DfJjlBi6RPH685jlpn6DfyZEqLxUeAVlt2fg/3hoOrN9GiGrHtc5P7s9/W+v/AvrfFCW
 +Pp/PQ9Qp9HehVsxW+Wrmwqsc3/lQqpTwuqKmCbaPc2WY3EkMqXNJyfVGEVj2H8U6/OJ
 Gg+w==
X-Gm-Message-State: APjAAAWnl9sK3Ak/nOJLo5aHr3DndJNo8Pvtc1zu+dpsdtVzz3iZYf+3
 G3X4EWlPMelp22Ss8n414ZmBVQ==
X-Google-Smtp-Source: APXvYqwnCmKjPrstr3X9a/omza5K8iCghkX9+cWplH9fTwptdxDxjvrYmzpam1j8Twpi6fT6wctRWw==
X-Received: by 2002:aed:21f0:: with SMTP id m45mr87408989qtc.391.1560884277919; 
 Tue, 18 Jun 2019 11:57:57 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id m44sm11840255qtm.54.2019.06.18.11.57.57
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 18 Jun 2019 11:57:57 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hdJIr-0000A8-2v; Tue, 18 Jun 2019 15:57:57 -0300
Date: Tue, 18 Jun 2019 15:57:57 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v3 hmm 08/12] mm/hmm: Remove racy protection against
 double-unregistration
Message-ID: <20190618185757.GP6961@ziepe.ca>
References: <20190614004450.20252-1-jgg@ziepe.ca>
 <20190614004450.20252-9-jgg@ziepe.ca>
 <20190615141612.GH17724@infradead.org>
 <20190618131324.GF6961@ziepe.ca>
 <20190618132722.GA1633@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190618132722.GA1633@infradead.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Wed, 19 Jun 2019 07:10:14 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=PttUnfJR2Mh5w8ZNX8UBClI5Uo9DGdQHvLC9b9+U4Hc=;
 b=PXeS3vrprzJCfOdHHqzsyJuksx6Jm56D2ltYr60kDgSXAubt62volsRxeiJYH3eQEA
 qkIDep9gBltu/VFi4HJjTckykz/IF/uFm7scvosf85B+lHsbj0dpRu3aDtM8neaO1TM8
 jn75MRkzxtq6VT6WxVud/XCv4fiC/Hs/QuY23+nW+QuinJo8UTrJFA4I2rX38F3Pxeiw
 eP9rL5iIlAFSNbpVdB19/9eqmpnvMNQsySfc/gSbru2YJ1r1laZ6myv5v4YTCDELSwVm
 yt0NAobLw0i6IyHq1SKxS6BjkonU3m5GhldixnjUWA6n0jM3Ie3wseLt5i4fZPceHLH1
 /ZTQ==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, Philip Yang <Philip.Yang@amd.com>,
 Ralph Campbell <rcampbell@nvidia.com>, linux-rdma@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, amd-gfx@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTgsIDIwMTkgYXQgMDY6Mjc6MjJBTSAtMDcwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gVHVlLCBKdW4gMTgsIDIwMTkgYXQgMTA6MTM6MjRBTSAtMDMwMCwgSmFz
b24gR3VudGhvcnBlIHdyb3RlOgo+ID4gPiBJIGRvbid0IGV2ZW4gdGhpbmsgd2UgZXZlbiBuZWVk
IHRvIGJvdGhlciB3aXRoIHRoZSBQT0lTT04sIG5vcm1hbCBsaXN0Cj4gPiA+IGRlYnVnZ2luZyB3
aWxsIGFscmVhZHkgY2F0Y2ggYSBkb3VibGUgdW5yZWdpc3RyYXRpb24gYW55d2F5Lgo+ID4gCj4g
PiBtaXJyb3ItPmhtbSBpc24ndCBhIGxpc3Qgc28gbGlzdCBkZWJ1Z2dpbmcgd29uJ3QgaGVscC4K
PiA+IAo+ID4gTXkgY29uY2VybiB3aGVuIEkgd3JvdGUgdGhpcyB3YXMgdGhhdCBvbmUgb2YgdGhl
IGluIGZsaWdodCBwYXRjaGVzIEkKPiA+IGNhbid0IHNlZSBtaWdodCBiZSBkZXBlbmRpbmcgb24g
dGhpcyBkb3VibGUtdW5yZWdpc3Rlci1pcy1zYWZlCj4gPiBiZWhhdmlvciwgc28gSSB3YW50ZWQg
dGhlbSB0byBjcmFzaCByZWxpYWJseS4KPiA+IAo+ID4gSXQgaXMgYSByZWFsbHkgb3Zlcmx5IGNv
bnNlcnZhdGl2ZSB0aGluZyB0byBkby4uCj4gCj4gbWlycm9yLT5saXN0IGlzIGEgbGlzdCwgYW5k
IGlmIHdlIGRvIGEgbGlzdF9kZWwgb24gaXQgZHVyaW5nIHRoZQo+IHNlY29uZCB1bnJlZ2lzdHJh
dGlvbiBpdCB3aWxsIHRyaXAgdXAgb24gdGhlIGxpc3QgcG9pc29uaW5nLgoKV2l0aCB0aGUgcHJl
dmlvdXMgbG9vc2UgY291cGxpbmcgb2YgdGhlIG1pcnJvciBhbmQgdGhlIHJhbmdlIHNvbWUgY29k
ZQptaWdodCByYW5jZSB0byB0cnkgdG8gY3JlYXRlIGEgcmFuZ2Ugd2l0aG91dCBhIG1pcnJvciwg
d2hpY2ggd2lsbCBub3cKcmVsaWFibHkgY3Jhc2ggd2l0aCB0aGUgcG9pc29uLgoKSXQgaXNuJ3Qg
c28gbXVjaCB0aGUgZG91YmxlIHVucmVnaXN0ZXIgdGhhdCB3b3JyaWVzIG1lLCBidXQgcmFjaW5n
CnVucmVnaXN0ZXIgd2l0aCByYW5nZSBmdW5jdGlvbnMuCgpKYXNvbgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
