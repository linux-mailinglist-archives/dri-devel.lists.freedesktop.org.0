Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1DC182A94
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 09:09:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EA7A6EA41;
	Thu, 12 Mar 2020 08:08:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 695586E993
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 14:33:37 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id h16so1667282qtr.11
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 07:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=QjyTvSQWp7wXiW80SCmTpIkz991znEvPrY90Z8F0Ea0=;
 b=ki4OrgHa3iak9x3AxiHwBw6mOcMdV5ahUWAgccTnc+6NpxvuosfWOQ3Bil0UZ2amhE
 6JeQ6nQPILtRijYiU649UBGUpIMrrdU7D7+URkO1PECphlvH63o7OZZpMrwor+1VjmWR
 5gaNL/RN2Z8+mVD+Uyq4rmz9fhTKqAw/zrO7GLDIhGd2t4Oj0AyYm912bxbJ7DR5DWkz
 /B7zSanHP00JYww6FUc/oe3zgyZyWTRU2DUqWoqxjfNeIXijsyIf4Ox9xhbmuBTGoT0/
 /nsT2Qc//E4XQQCxQ0DYeAUvv/i0is72h8cG0YDoq5F6PRmh0O7qH39V4euIp73sYF5e
 s/AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=QjyTvSQWp7wXiW80SCmTpIkz991znEvPrY90Z8F0Ea0=;
 b=BcF4Fr7IpzbHa5iVbKWdAZislAp7mZpFGO/Codp1BThmEelshzAehsfZ+8PGq/kssf
 HW8DjPZhNsoPXcvg3E5cqMaAsk/JjrcxudELZSBZyaQ5TIlSVgN83f+vumBzcjQTGzrg
 8Qv3UNaP1cRUDfcOAibuwELCHFyst0D4PhUbLibWNglmXndxe1/ypbdKO25VFBciJEBA
 HKaoO4votckGIiALGM3OeheJ92zBcWe+7ZvkoG9XgqbfHV+cmaJJzWWsf8BjU4uV12/5
 jAt1tBg1Rp+liaR76RkFDvGw17uOzLJHkB1IWUu+tHLegETUeHNi9NBsMxjYx+wyt05g
 Wneg==
X-Gm-Message-State: ANhLgQ0umnCLDU0FJctxlpg4bBC1o3+shcdFa6hfBCx5bDty/A/eVOM3
 tGum1NONbKUPU2b3ZZdWWU2WnA==
X-Google-Smtp-Source: ADFU+vvsFXYUPWQs9C+FVbXmgb2w7g5wN/7MMuSOPzzEOQXBV2I3NnHDKstzxAptvMbJXD0UU2fglg==
X-Received: by 2002:ac8:776c:: with SMTP id h12mr2992096qtu.38.1583937216490; 
 Wed, 11 Mar 2020 07:33:36 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id n46sm10364367qtb.48.2020.03.11.07.33.35
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 11 Mar 2020 07:33:35 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jC2QR-0004oM-D0; Wed, 11 Mar 2020 11:33:35 -0300
Date: Wed, 11 Mar 2020 11:33:35 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 5/6] drm/amdgpu: add support for exporting VRAM using
 DMA-buf v2
Message-ID: <20200311143335.GC31668@ziepe.ca>
References: <20200311135158.3310-1-christian.koenig@amd.com>
 <20200311135158.3310-6-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200311135158.3310-6-christian.koenig@amd.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Thu, 12 Mar 2020 08:08:13 +0000
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 hch@infradead.org, linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXIgMTEsIDIwMjAgYXQgMDI6NTE6NTdQTSArMDEwMCwgQ2hyaXN0aWFuIEvDtm5p
ZyB3cm90ZToKPiArLyoqCj4gKyAqIGFtZGdwdV92cmFtX21ncl9hbGxvY19zZ3QgLSBhbGxvY2F0
ZSBhbmQgZmlsbCBhIHNnIHRhYmxlCj4gKyAqCj4gKyAqIEBhZGV2OiBhbWRncHUgZGV2aWNlIHBv
aW50ZXIKPiArICogQG1lbTogVFRNIG1lbW9yeSBvYmplY3QKPiArICogQGRldjogdGhlIG90aGVy
IGRldmljZQo+ICsgKiBAZGlyOiBkbWEgZGlyZWN0aW9uCj4gKyAqIEBzZ3Q6IHJlc3VsdGluZyBz
ZyB0YWJsZQo+ICsgKgo+ICsgKiBBbGxvY2F0ZSBhbmQgZmlsbCBhIHNnIHRhYmxlIGZyb20gYSBW
UkFNIGFsbG9jYXRpb24uCj4gKyAqLwo+ICtpbnQgYW1kZ3B1X3ZyYW1fbWdyX2FsbG9jX3NndChz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKPiArCQkJICAgICAgc3RydWN0IHR0bV9tZW1fcmVn
ICptZW0sCj4gKwkJCSAgICAgIHN0cnVjdCBkZXZpY2UgKmRldiwKPiArCQkJICAgICAgZW51bSBk
bWFfZGF0YV9kaXJlY3Rpb24gZGlyLAo+ICsJCQkgICAgICBzdHJ1Y3Qgc2dfdGFibGUgKipzZ3Qp
CgpzaW5nbGUgKiogcG9pbnRlciB3aXRoIGFuIGludCByZXR1cm4gaXMgb2RkLCB1c2UgRVJSX1BU
Uj8KCj4gK3sKPiArCXN0cnVjdCBkcm1fbW1fbm9kZSAqbm9kZTsKPiArCXN0cnVjdCBzY2F0dGVy
bGlzdCAqc2c7Cj4gKwlpbnQgbnVtX2VudHJpZXMgPSAwOwo+ICsJdW5zaWduZWQgaW50IHBhZ2Vz
Owo+ICsJaW50IGksIHI7Cj4gKwo+ICsJKnNndCA9IGttYWxsb2Moc2l6ZW9mKCpzZyksIEdGUF9L
RVJORUwpOwo+ICsJaWYgKCEqc2d0KQo+ICsJCXJldHVybiAtRU5PTUVNOwo+ICsKPiArCWZvciAo
cGFnZXMgPSBtZW0tPm51bV9wYWdlcywgbm9kZSA9IG1lbS0+bW1fbm9kZTsKPiArCSAgICAgcGFn
ZXM7IHBhZ2VzIC09IG5vZGUtPnNpemUsICsrbm9kZSkKPiArCQkrK251bV9lbnRyaWVzOwo+ICsK
PiArCXIgPSBzZ19hbGxvY190YWJsZSgqc2d0LCBudW1fZW50cmllcywgR0ZQX0tFUk5FTCk7Cj4g
KwlpZiAocikKPiArCQlnb3RvIGVycm9yX2ZyZWU7Cj4gKwo+ICsJZm9yX2VhY2hfc2coKCpzZ3Qp
LT5zZ2wsIHNnLCBudW1fZW50cmllcywgaSkKPiArCQlzZy0+bGVuZ3RoID0gMDsKPiArCj4gKwlu
b2RlID0gbWVtLT5tbV9ub2RlOwo+ICsJZm9yX2VhY2hfc2coKCpzZ3QpLT5zZ2wsIHNnLCBudW1f
ZW50cmllcywgaSkgewo+ICsJCXBoeXNfYWRkcl90IHBoeXMgPSAobm9kZS0+c3RhcnQgPDwgUEFH
RV9TSElGVCkgKwo+ICsJCQlhZGV2LT5nbWMuYXBlcl9iYXNlOwo+ICsJCXNpemVfdCBzaXplID0g
bm9kZS0+c2l6ZSA8PCBQQUdFX1NISUZUOwo+ICsJCWRtYV9hZGRyX3QgYWRkcjsKPiArCj4gKwkJ
Kytub2RlOwo+ICsJCWFkZHIgPSBkbWFfbWFwX3Jlc291cmNlKGRldiwgcGh5cywgc2l6ZSwgZGly
LAo+ICsJCQkJCURNQV9BVFRSX1NLSVBfQ1BVX1NZTkMpOwo+ICsJCXIgPSBkbWFfbWFwcGluZ19l
cnJvcihkZXYsIGFkZHIpOwo+ICsJCWlmIChyKQo+ICsJCQlnb3RvIGVycm9yX3VubWFwOwo+ICsK
PiArCQlzZ19zZXRfZG1hX2FkZHIoc2csIGFkZHIsIHNpemUsIDApOwoKSXMgaXQgcG9zc2libGUg
dGhhdCBwaHlzIHdpbGwgbmVlZCB0byBoYXZlIGNvbnRpZ3VvdXMgcGFnZXMgam9pbmVkCmhlcmUs
IG9yIGhhcyAnbm9kZScgYWxyZWFkeSBlbnN1cmVkIGNvbnRpZ3VvdXMgcGFnZXM/CgpKYXNvbgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
