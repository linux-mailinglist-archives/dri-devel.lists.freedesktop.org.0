Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE903A5CB
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2019 14:56:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB91A88FC8;
	Sun,  9 Jun 2019 12:55:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB0EF89E06
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 12:36:49 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id a27so1108097qkk.5
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jun 2019 05:36:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=U9t6ZQ44UYTUT/2bmYoJaPHlaVA4zF3kDc6HTj92QLY=;
 b=arcPIt2S7OMWXdWy1qtYN5zGLHRqPLc5WyQFzeEDjXn0gggjzp+e2OJJ6o79SkuX//
 TyT/f+hhiLAH+BEgNdk8rLiyWIXdnpuiHR6MaRzVsW4fiwAEAZVAqw5UEZdAsyfrqOyD
 m1d0AdDIvwLQQKrGPlOIM+eVsRzCERI2Qgfu7ufNqAcIzr1esxiMQmzgu/G27BlsrM5g
 EW63Ogeb7AaKMRyhd22IMeF2XLhBu6FY7Jrcl5moHUTnTv3ue/qxweT2zxtrC+GugKg9
 9U3OFOkHH0gew2j3PJ5r3fLAdSLwlgwSKD20qHHt9BFLgJfy3KmzYzxXZtIrOToRr0/F
 0ZbQ==
X-Gm-Message-State: APjAAAVZbCS2DVUTRv0YXkH7ag7g1Q5b2U2+Mj5qsPv80HkuUeUjY+ge
 Hdxv/wep/cmtveCDJePhXmCp4a4li3P6TA==
X-Google-Smtp-Source: APXvYqypoZ+b6025sI65OH/L42IdhXMlYJe+1m7dJypoBd+4mL7LK+2bgSIQr1nAwsZ9NZSKGMrcsw==
X-Received: by 2002:a37:6601:: with SMTP id a1mr42814748qkc.282.1559911008855; 
 Fri, 07 Jun 2019 05:36:48 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id w143sm960651qka.22.2019.06.07.05.36.48
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 07 Jun 2019 05:36:48 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hZE6x-00073H-NM; Fri, 07 Jun 2019 09:36:47 -0300
Date: Fri, 7 Jun 2019 09:36:47 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v2 hmm 03/11] mm/hmm: Hold a mmgrab from hmm to mm
Message-ID: <20190607123647.GC14802@ziepe.ca>
References: <20190606184438.31646-1-jgg@ziepe.ca>
 <20190606184438.31646-4-jgg@ziepe.ca>
 <48fcaa19-6ac3-59d0-cd51-455abeca7cdb@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <48fcaa19-6ac3-59d0-cd51-455abeca7cdb@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Sun, 09 Jun 2019 12:54:16 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=U9t6ZQ44UYTUT/2bmYoJaPHlaVA4zF3kDc6HTj92QLY=;
 b=GHaZaDHn+WrXy9wAWUNhR98Z2ZnPQcEwHBA0fNreTeMFXYMI0TLIdk30sXIfGaoz6Z
 2Wm1tuJvJYWlqm5H0fGGQz48oT3T8YpadC8btMOQB92/NfQmMva+TJZd6EYG9aWCgG26
 VHxwQ3DfM5qDIlpn7ZQApr/l2ZVC97Wts0DZMciAn9C59MY+B2uE/S8xHsY80afFLUwE
 fVTvzqyFZhI3ahb8xUOy+dvzr4y8fvz0m08BooWKjV0QROJkrcKdRBobe7fC7zZwdrvn
 wdtfrz0yNTz3DcVP1O7PZIY5gTipTaSJOWppd9hp9gzmpCYl6I49MMbnYyuKQtl1CqSP
 QnwA==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>, linux-rdma@vger.kernel.org,
 Felix.Kuehling@amd.com, dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMDYsIDIwMTkgYXQgMDc6NDQ6NThQTSAtMDcwMCwgSm9obiBIdWJiYXJkIHdy
b3RlOgo+IE9uIDYvNi8xOSAxMTo0NCBBTSwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+ID4gRnJv
bTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgo+ID4gCj4gPiBTbyBsb25nIGEg
YSBzdHJ1Y3QgaG1tIHBvaW50ZXIgZXhpc3RzLCBzbyBzaG91bGQgdGhlIHN0cnVjdCBtbSBpdCBp
cwo+ID4gbGlua2VkIHRvby4gSG9sZCB0aGUgbW1ncmFiKCkgYXMgc29vbiBhcyBhIGhtbSBpcyBj
cmVhdGVkLCBhbmQgbW1kcm9wKCkgaXQKPiA+IG9uY2UgdGhlIGhtbSByZWZjb3VudCBnb2VzIHRv
IHplcm8uCj4gPiAKPiA+IFNpbmNlIG1tZHJvcCgpIChpZSBhIDAga3JlZiBvbiBzdHJ1Y3QgbW0p
IGlzIG5vdyBpbXBvc3NpYmxlIHdpdGggYSAhTlVMTAo+ID4gbW0tPmhtbSBkZWxldGUgdGhlIGht
bV9obW1fZGVzdHJveSgpLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbiBHdW50aG9ycGUg
PGpnZ0BtZWxsYW5veC5jb20+Cj4gPiBSZXZpZXdlZC1ieTogSsOpcsO0bWUgR2xpc3NlIDxqZ2xp
c3NlQHJlZGhhdC5jb20+Cj4gPiB2MjoKPiA+ICAtIEZpeCBlcnJvciB1bndpbmQgcGF0aHMgaW4g
aG1tX2dldF9vcl9jcmVhdGUgKEplcm9tZS9KYXNvbikKPiA+ICBpbmNsdWRlL2xpbnV4L2htbS5o
IHwgIDMgLS0tCj4gPiAga2VybmVsL2ZvcmsuYyAgICAgICB8ICAxIC0KPiA+ICBtbS9obW0uYyAg
ICAgICAgICAgIHwgMjIgKysrKy0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gIDMgZmlsZXMgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspLCAyMiBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUvbGludXgvaG1tLmggYi9pbmNsdWRlL2xpbnV4L2htbS5oCj4gPiBpbmRleCAyZDUx
OTc5N2NiMTM0YS4uNGVlM2FjYWJlNWVkMjIgMTAwNjQ0Cj4gPiArKysgYi9pbmNsdWRlL2xpbnV4
L2htbS5oCj4gPiBAQCAtNTg2LDE0ICs1ODYsMTEgQEAgc3RhdGljIGlubGluZSBpbnQgaG1tX3Zt
YV9mYXVsdChzdHJ1Y3QgaG1tX21pcnJvciAqbWlycm9yLAo+ID4gIH0KPiA+ICAKPiA+ICAvKiBC
ZWxvdyBhcmUgZm9yIEhNTSBpbnRlcm5hbCB1c2Ugb25seSEgTm90IHRvIGJlIHVzZWQgYnkgZGV2
aWNlIGRyaXZlciEgKi8KPiA+IC12b2lkIGhtbV9tbV9kZXN0cm95KHN0cnVjdCBtbV9zdHJ1Y3Qg
Km1tKTsKPiA+IC0KPiA+ICBzdGF0aWMgaW5saW5lIHZvaWQgaG1tX21tX2luaXQoc3RydWN0IG1t
X3N0cnVjdCAqbW0pCj4gPiAgewo+ID4gIAltbS0+aG1tID0gTlVMTDsKPiA+ICB9Cj4gPiAgI2Vs
c2UgLyogSVNfRU5BQkxFRChDT05GSUdfSE1NX01JUlJPUikgKi8KPiA+IC1zdGF0aWMgaW5saW5l
IHZvaWQgaG1tX21tX2Rlc3Ryb3koc3RydWN0IG1tX3N0cnVjdCAqbW0pIHt9Cj4gPiAgc3RhdGlj
IGlubGluZSB2b2lkIGhtbV9tbV9pbml0KHN0cnVjdCBtbV9zdHJ1Y3QgKm1tKSB7fQo+ID4gICNl
bmRpZiAvKiBJU19FTkFCTEVEKENPTkZJR19ITU1fTUlSUk9SKSAqLwo+ID4gIAo+ID4gZGlmZiAt
LWdpdCBhL2tlcm5lbC9mb3JrLmMgYi9rZXJuZWwvZm9yay5jCj4gPiBpbmRleCBiMmI4N2Q0NTBi
ODBiNS4uNTg4Yzc2OGFlNzI0NTEgMTAwNjQ0Cj4gPiArKysgYi9rZXJuZWwvZm9yay5jCj4gPiBA
QCAtNjczLDcgKzY3Myw2IEBAIHZvaWQgX19tbWRyb3Aoc3RydWN0IG1tX3N0cnVjdCAqbW0pCj4g
PiAgCVdBUk5fT05fT05DRShtbSA9PSBjdXJyZW50LT5hY3RpdmVfbW0pOwo+ID4gIAltbV9mcmVl
X3BnZChtbSk7Cj4gPiAgCWRlc3Ryb3lfY29udGV4dChtbSk7Cj4gPiAtCWhtbV9tbV9kZXN0cm95
KG1tKTsKPiAKPiAKPiBUaGlzIGlzIHBhcnRpY3VsYXJseSB3ZWxjb21lLCBub3QgdG8gaGF2ZSBh
biAiSE1NIGlzIHNwZWNpYWwiIGNhc2UKPiBpbiBzdWNoIGEgY29yZSBwYXJ0IG9mIHByb2Nlc3Mv
bW0gY29kZS4gCgpJIHdvdWxkIHZlcnkgbXVjaCBsaWtlIHRvIHByb3Bvc2Ugc29tZXRoaW5nIGxp
a2UgJ3Blci1uZXQnIGZvciBzdHJ1Y3QKbW0sIGFzIHJkbWEgYWxzbyBuZWVkIHRvIGFkZCBzb21l
IGRhdGEgdG8gZWFjaCBtbSB0byBtYWtlIGl0J3MgdXNlIG9mCm1tdSBub3RpZmllcnMgd29yayAo
Zm9yIGJhc2ljYWxseSB0aGlzIHNhbWUgcmVhc29uIGFzIEhNTSkKClRoYW5rcywKSmFzb24KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
