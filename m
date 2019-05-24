Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6662B3F0
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 14:02:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4613D89129;
	Mon, 27 May 2019 12:02:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com
 [IPv6:2607:f8b0:4864:20::a43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F32DF6E126
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 16:53:03 +0000 (UTC)
Received: by mail-vk1-xa43.google.com with SMTP id r23so2313870vkd.12
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 09:53:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=BWxqjKZCed63tdrqv52w7wsfWcnck29Bguoecq4JyuE=;
 b=bff+nDe3DRFRDyUQcV5yq98GGCqVFi6q76oo7zQysFpvYsRzQcSBta9/nP+bAM29Zv
 7ZMJPoMC69nzKut0CXUEoYrT1hdTKauKKvsz6geTKRJl2hEO6qoLTjdA94fpYSh768mt
 U639TxKg4j0OANybjPb2UUIpvU8BoiRdoGO3GCZBINdLqc2RvU26g96234CceQlRwXZF
 K+DWL6wzz7G7Kyhd1B5pnwDSwybh4iRQ1JevmcaJBA1LjoPlcOE74Ho0Q4dzInMMM9NA
 yM8Vk37hVfZmbBtTmyd6aIuIkzY75/2zZnM7YoAmpLGlX9xpvRcz7xIcVdcEGEfYbz66
 lj3w==
X-Gm-Message-State: APjAAAUG2VW1MX9C2sBL3DQODpFMc73Oeta45AOjgonp2Ia2GE2r6Ley
 /yMEF/EX2Lx2uWRLrAvWCM+1hA==
X-Google-Smtp-Source: APXvYqxGf4YX6m1bc63rX3ITovS0x9J+uBVKSme0zDKMj1gtik5rsITucqSrT8VXY0G62c80cqSI9A==
X-Received: by 2002:a1f:fe81:: with SMTP id l123mr6286152vki.51.1558716782783; 
 Fri, 24 May 2019 09:53:02 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-49-251.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.49.251])
 by smtp.gmail.com with ESMTPSA id b2sm1470363vkf.16.2019.05.24.09.53.01
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 24 May 2019 09:53:01 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hUDRF-0008FA-F4; Fri, 24 May 2019 13:53:01 -0300
Date: Fri, 24 May 2019 13:53:01 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@infradead.org>, akpm@linux-foundation.org,
 Dave Airlie <airlied@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Jerome Glisse <jglisse@redhat.com>, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, Leon Romanovsky <leonro@mellanox.com>,
 Doug Ledford <dledford@redhat.com>,
 Artemy Kovalyov <artemyko@mellanox.com>, Moni Shoua <monis@mellanox.com>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 Kaike Wan <kaike.wan@intel.com>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 linux-mm@kvack.org, dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: RFC: Run a dedicated hmm.git for 5.3
Message-ID: <20190524165301.GD16845@ziepe.ca>
References: <20190523154149.GB12159@ziepe.ca>
 <20190523155207.GC5104@redhat.com>
 <20190523163429.GC12159@ziepe.ca>
 <20190523173302.GD5104@redhat.com>
 <20190523175546.GE12159@ziepe.ca>
 <20190523182458.GA3571@redhat.com>
 <20190523191038.GG12159@ziepe.ca>
 <20190524064051.GA28855@infradead.org>
 <20190524124455.GB16845@ziepe.ca>
 <20190524162709.GD21222@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190524162709.GD21222@phenom.ffwll.local>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Mon, 27 May 2019 12:02:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=BWxqjKZCed63tdrqv52w7wsfWcnck29Bguoecq4JyuE=;
 b=V2c3cbyoJqcZX30pcTkJEv7QnnWfFOVUG/SZKLtnQEgMJVwm89vkCiLejgP7M+iRpN
 q/gLFJwalceC5ic9vkHhbkH+U/d7dt/5gsWtZqSmPEamXKr1uoECt4WeGoJqd2HwGhbx
 9Occ1equYYbcXlCB88viJlGsBFmUVprPlSaUrUnpgJaFB5VgTgvCVd56gO+SEN+aAAgm
 xm1VbLsF+wb2n+Ta5LcBu1FilJNm/nl1Mj5onw2ziQywv/g3tjrYI+IB0DZ9YrwYdgB0
 VEIEcUTbHmI4X7mxwSOIeASg6iishBSuXQpcZN/RP20qWAgLsgkprlD05w//8ySkAW73
 D/4A==
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

T24gRnJpLCBNYXkgMjQsIDIwMTkgYXQgMDY6Mjc6MDlQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBTdXJlIHRvcGljIGJyYW5jaCBzb3VuZHMgZmluZSwgd2UgZG8gdGhhdCBhbGwgdGhl
IHRpbWUgd2l0aCB2YXJpb3VzCj4gc3Vic3lzdGVtcyBhbGwgb3Zlci4gV2UgaGF2ZSByZWFkeSBt
YWRlIHNjcmlwdHMgZm9yIHRvcGljIGJyYW5jaGVzIGFuZAo+IGFwcGx5aW5nIHB1bGxzIGZyb20g
YWxsIG92ZXIsIHNvIHdlIGNhbiBldmVuIHNvYWsgdGVzdCBldmVyeXRoaW5nIGluIG91cgo+IGlu
dGVncmF0aW9uIHRyZWUuIEluIGNhc2UgdGhlcmUncyBjb25mbGljdHMgb3IganVzdCB0byBtYWtl
IHN1cmUKPiBldmVyeXRoaW5nIHdvcmtzLCBiZWZvcmUgd2UgYmFrZSB0aGUgdG9waWMgYnJhbmNo
IGludG8gcGVybWFuZW50IGhpc3RvcnkKPiAodGhlIG1haW4gZHJtLmdpdCByZXBvIGp1c3QgY2Fu
J3QgYmUgcmViYXNlZCwgdG9vIG11Y2ggZ29pbmcgb24gYW5kIHRvbwo+IG1hbnkgcGVvcGxlIGlu
dm9sdmQpLgoKV2UgZG9uJ3QgcmViYXNlIHJkbWEuZ2l0IGVpdGhlciBmb3IgdGhlIHNhbWUgcmVh
c29ucyBhbmQgbm9yIGRvZXMKbmV0ZGV2CgpTbyB0aGUgdXN1YWwgZmxvdyBmb3IgYSBzaGFyZWQg
dG9waWMgYnJhbmNoIGlzIGFsc28gbm8tcmViYXNlIC0KdGVzdGluZy9ldGMgbmVlZHMgdG8gYmUg
ZG9uZSBiZWZvcmUgdGhpbmdzIGdldCBhcHBsaWVkIHRvIGl0LgoKQ2hlZXJzLApKYXNvbgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
