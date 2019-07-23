Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3F271EF7
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 20:21:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71E0B6E33F;
	Tue, 23 Jul 2019 18:21:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F72E6E31D
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 17:17:34 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id 190so29344753vsf.9
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 10:17:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QqrUJzkPpAaDRvvKsmPrqxCm6oyy05uDqHmCovyhL70=;
 b=N4rCb+uu+a97Xj11jT9vMVgIcifjQoMpisaecRjDkOy3ZSmXTm2IPKGSLGJRxMFbOw
 4Yr+Uqbb1h0G6qt+nzLOlJiKoGaTk0LOllNluR/17o0alZe++c9PiYDrbRmIubmxCPn0
 dm42AHof/3G/b2FL1Nmw/WbReDmoG6eqj8vavZxdNIP5mY0Q6gISPwYKOvzMvXkwSZmH
 uB7S8Fl1WvLFDgbU2EdlOAYKctlzymao54fjdqqXBlY4/o6tKQZ8QDnYMRX5xA9UNKal
 61bOROtk1Kveypq7tvwz0uzGEbXg3wNZsA4LY7P0ahvgQmBTr+H8gNAcyHWiHiGNz8ww
 t5sA==
X-Gm-Message-State: APjAAAUMxuB3ExJhm5U1zjATmGa+0guaPnb57ZBYqrojzoppFq62SIt7
 MW37N8G3Fuck4dAMGUUehLsDBg==
X-Google-Smtp-Source: APXvYqy/BnQGomP9bfEv9fcbGXC5naUZNkETCjo5R1Jblm92pT8i/VM8xtUGyS2NeeXimmoMCnZGHQ==
X-Received: by 2002:a67:db89:: with SMTP id f9mr45182090vsk.150.1563902253192; 
 Tue, 23 Jul 2019 10:17:33 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id i12sm9556385vsr.17.2019.07.23.10.17.32
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 23 Jul 2019 10:17:32 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hpyPr-0002YL-Ko; Tue, 23 Jul 2019 14:17:31 -0300
Date: Tue, 23 Jul 2019 14:17:31 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 4/6] nouveau: unlock mmap_sem on all errors from
 nouveau_range_fault
Message-ID: <20190723171731.GD15357@ziepe.ca>
References: <20190722094426.18563-1-hch@lst.de>
 <20190722094426.18563-5-hch@lst.de>
 <20190723151824.GL15331@mellanox.com>
 <20190723163048.GD1655@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190723163048.GD1655@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Tue, 23 Jul 2019 18:21:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=QqrUJzkPpAaDRvvKsmPrqxCm6oyy05uDqHmCovyhL70=;
 b=KClY5whBhZJkA8IHSLzSHzX+WVj0t87uGT0lzsUub/COP4/3SMvz4Iet5QPzraFXgF
 3H5sIXzzJFzGpd9sIfkxKMU0QO4M2bcDm0G+Tf39YMzAJvr0jbNxuRcY7ooqKTXsAWgH
 /tofHFhod7aDMEbGJKL6+i0RWw2prFK/Z4DJ6IZYxw+ZrvIyV2lPSgSvI1ubA+ize+sf
 ljiHEYoC3nR0bUaWqY/zvkbdhaQFxXvwycHLfBlxo6jBsBWETWn9TDMISL99sGP0pZng
 cvD04P8wscxYGTWuyLPSEz5GL4VPipUGVTAGOpCofseTd/SoqMw3MQ4eC8DD0yCVjXMt
 0xNg==
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
Cc: Ralph Campbell <rcampbell@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMDY6MzA6NDhQTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMDM6MTg6MjhQTSArMDAwMCwgSmFz
b24gR3VudGhvcnBlIHdyb3RlOgo+ID4gSHVtLi4KPiA+IAo+ID4gVGhlIGNhbGxlciBkb2VzIHRo
aXM6Cj4gPiAKPiA+IGFnYWluOgo+ID4gCQlyZXQgPSBub3V2ZWF1X3JhbmdlX2ZhdWx0KCZzdm1t
LT5taXJyb3IsICZyYW5nZSk7Cj4gPiAJCWlmIChyZXQgPT0gMCkgewo+ID4gCQkJbXV0ZXhfbG9j
aygmc3ZtbS0+bXV0ZXgpOwo+ID4gCQkJaWYgKCFub3V2ZWF1X3JhbmdlX2RvbmUoJnJhbmdlKSkg
ewo+ID4gCQkJCW11dGV4X3VubG9jaygmc3ZtbS0+bXV0ZXgpOwo+ID4gCQkJCWdvdG8gYWdhaW47
Cj4gPiAKPiA+IEFuZCB3ZSBjYW4ndCBjYWxsIG5vdXZlYXVfcmFuZ2VfZmF1bHQoKSAtPiBobW1f
cmFuZ2VfZmF1bHQoKSB3aXRob3V0Cj4gPiBob2xkaW5nIHRoZSBtbWFwX3NlbSwgc28gd2UgY2Fu
J3QgYWxsb3cgbm91dmVhdV9yYW5nZV9mYXVsdCB0byB1bmxvY2sKPiA+IGl0Lgo+IAo+IEdvdG8g
YWdhaW4gY2FuIG9ubHkgaGFwcGVuIGlmIG5vdXZlYXVfcmFuZ2VfZmF1bHQgd2FzIHN1Y2Nlc3Nm
dWwsCj4gaW4gd2hpY2ggY2FzZSB3ZSBkaWQgbm90IGRyb3AgbW1hcF9zZW0uCgpPaCwgcmlnaHQg
d2Ugc3dpdGNoIGZyb20gc3VjY2VzcyA9IG51bWJlciBvZiBwYWdlcyB0byBzdWNjZXNzID0wLi4K
Ckhvd2V2ZXIgdGhlIHJlYXNvbiB0aGlzIGxvb2tzIHNvIHdlaXJkIHRvIG1lIGlzIHRoYXQgdGhl
IGxvY2tpbmcKcGF0dGVybiBpc24ndCBiZWluZyBmb2xsb3dlZCwgYW55IHJlc3VsdCBvZiBobW1f
cmFuZ2VfZmF1bHQgc2hvdWxkIGJlCmlnbm9yZWQgdW50aWwgd2UgZW50ZXIgdGhlIHN2bW0tPm11
dGV4IGFuZCBjaGVjayBpZiB0aGVyZSB3YXMgYQpjb2xsaWRpbmcgaW52YWxpZGF0aW9uLgoKU28g
dGhlICdnb3RvIGFnYWluJyAqc2hvdWxkKiBiZSBwb3NzaWJsZSBldmVuIGlmIHJhbmdlX2ZhdWx0
IGZhaWxlZC4KCkJ1dCB0aGF0IGlzIG5vdCBmb3IgdGhpcyBwYXRjaC4uCgo+ID4gIAlyZXQgPSBo
bW1fcmFuZ2VfZmF1bHQocmFuZ2UsIHRydWUpOwo+ID4gIAlpZiAocmV0IDw9IDApIHsKPiA+ICAJ
CWlmIChyZXQgPT0gMCkKPiA+ICAJCQlyZXQgPSAtRUJVU1k7Cj4gPiAtCQl1cF9yZWFkKCZyYW5n
ZS0+dm1hLT52bV9tbS0+bW1hcF9zZW0pOwo+ID4gIAkJaG1tX3JhbmdlX3VucmVnaXN0ZXIocmFu
Z2UpOwo+IAo+IFRoaXMgd291bGQgaG9sZCBtbWFwX3NlbSBvdmVyIGhtbV9yYW5nZV91bnJlZ2lz
dGVyLCB3aGljaCBjYW4gbGVhZAo+IHRvIGRlYWRsb2NrIGlmIHdlIGNhbGwgZXhpdF9tbWFwIGFu
ZCB0aGVuIGFjcXVpcmUgbW1hcF9zZW0gYWdhaW4uCgpUaGF0IHJlbWluZHMgbWUsIHRoaXMgY29k
ZSBpcyBhbHNvIGxlYWtpbmcgaG1tX3JhbmdlX3VucmVnaXN0ZXIoKSBpbgp0aGUgc3VjY2VzcyBw
YXRoLCByaWdodD8KCkkgdGhpbmsgdGhlIHJpZ2h0IHdheSB0byBzdHJ1Y3R1cmUgdGhpcyBpcyB0
byBtb3ZlIHRoZSBnb3RvIGFnYWluIGFuZApyZWxhdGVkIGludG8gdGhlIG5vdXZlYXVfcmFuZ2Vf
ZmF1bHQoKSBzbyB0aGUgd2hvbGUgcmV0cnkgYWxnb3JpdGhtIGlzCnNlbnNpYmx5IHNlbGYgY29u
dGFpbmVkLgoKSmFzb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
