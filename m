Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0F17B2F0
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 21:08:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BFA46E5C3;
	Tue, 30 Jul 2019 19:08:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19B126E5C3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 19:08:53 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D1F3021773
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 19:08:52 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id d23so64137567qto.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 12:08:52 -0700 (PDT)
X-Gm-Message-State: APjAAAXydW2uSHWaxIjEqNaVFObVI32PkHaEIhmbvKenFtneOSRnZpcR
 aT48DFbRCnHmcfXlrbfeDLMNn7Sh9Zj4Q4IR7A==
X-Google-Smtp-Source: APXvYqy0jspWal9ubOgvvuqYtVCT55RLWezIjvcmGnJEzwKjaIPIGTeYkoj8Bxfz9xAY3MRz8AB8V621IRwQhoPOjbQ=
X-Received: by 2002:a0c:b786:: with SMTP id l6mr84872378qve.148.1564513732004; 
 Tue, 30 Jul 2019 12:08:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190725011003.30837-1-robh@kernel.org>
 <20190725011003.30837-7-robh@kernel.org>
 <ab9c3277-9e34-2712-975b-7c59b64e52d0@arm.com>
 <9eaf879c-bd7b-aded-e8f6-8efc2394fef5@arm.com>
 <20190725161344.GA2950@kevin> <482dc837-3ca8-dd93-bbc6-0eb97f3627e7@arm.com>
 <20190725174006.GA2876@kevin> <1c54bd6c-a594-614d-7de0-badb00269ea1@arm.com>
 <CAL_JsqLepsMdvJbi_=3xxgVH-Hasu_6=MK6NnXK0CdM7YPwubg@mail.gmail.com>
 <20190730185455.GA3205@kevin>
In-Reply-To: <20190730185455.GA3205@kevin>
From: Rob Herring <robh@kernel.org>
Date: Tue, 30 Jul 2019 13:08:39 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKVr6Wr7ufxKQHG0pGaUm3nWryDB1iB-qbzTbFEg1EPeQ@mail.gmail.com>
Message-ID: <CAL_JsqKVr6Wr7ufxKQHG0pGaUm3nWryDB1iB-qbzTbFEg1EPeQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] drm/panfrost: Add support for GPU heap allocations
To: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1564513733;
 bh=XuciGXy5Yq7unass+9g3UIo3ZetNWQvCLuhYR02gqKc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=JyIAq/Rq8nQDUZW12pzeB1QZA4o88sdvc2/MasgjbXCjpGDikX6L0lIRRF8awOhoJ
 pXJgeN1U45s/Mz5gPAV7ba1OVTWgA2l27fjmzOrcOeEv/rsxDfViMvgAjNA+PPYlXl
 13OHio651hKBuoAP82uNiEn0kJT7WXuSfb3v5XW0=
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Robin Murphy <Robin.Murphy@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, David Airlie <airlied@linux.ie>,
 Boris Brezillon <boris.brezillon@collabora.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMzAsIDIwMTkgYXQgMTI6NTUgUE0gQWx5c3NhIFJvc2VuendlaWcKPGFseXNz
YS5yb3Nlbnp3ZWlnQGNvbGxhYm9yYS5jb20+IHdyb3RlOgo+Cj4gPiBJbiBhbnkgY2FzZSwgcGVy
IHByb2Nlc3MgQVMgaXMgYSBwcmVyZXF1aXNpdGUgdG8gYWxsIHRoaXMuCj4KPiBPaCwgSSBoYWRu
J3QgcmVhbGl6ZWQgdGhhdCB3YXMgc3RpbGwgYSB0b2RvLiBJbiB0aGUgbWVhbnRpbWUsIHdoYXQn
cyB0aGUKPiBpbXBsaWNhdGlvbiBvZiBzaGlwcGluZyB3aXRob3V0IGl0PyAoSS5lLiBpbiB3aGlj
aCB0aHJlYXQgbW9kZWwgYXJlCj4gdXNlcnMgdnVsbmVyYWJsZSB3aXRob3V0IGl0PykgTWFsaWNp
b3VzIHVzZXJzcGFjZSBwcm9jZXNzIHNub29waW5nIG9uCj4gb3RoZXIgZnJhbWVidWZmZXJzIChv
biBYMTEsIHRoZXkgY291bGQgZG8gdGhhdCBhbnl3YXkuLi4pPyBNYWxpY2lvdXMKPiB1c2Vyc3Bh
Y2UgYWN0dWFsbHkgaW50ZXJmZXJpbmcgd2l0aCBvcGVyYXRpb24gb2Ygb3RoZXIgcHJvY2Vzc2Vz
IChpcwo+IHRoaXMgcmVhbGx5IGV4cGxvaXRhYmxlIG9yIGp1c3QgYSB0aGVvcmV0aWNhbCBjb25j
ZXJuKT8gTWFsaWNpb3VzIDNECj4gYXBwcyBicmVha2luZyBvdXQgb2YgdGhlIHNhbmRib3ggKGku
ZS4gV2ViR0wpIHZpYSBhIGRyaXZlciBidWcgYW5kCj4gc25vb3Bpbmcgb24gb3RoZXIgcHJvY2Vz
c2VzPwoKSSBkb24ndCBrbm93LiBIb3dldmVyLCBpdCdzIG5vdCB0aGF0IHVuY29tbW9uLiBmcmVl
ZHJlbm8gaXMgb25seSBub3cKaW4gdGhlIHByb2Nlc3Mgb2Ygc3VwcG9ydGluZyBpdC4gdmM0IGNh
bid0LiB2M2QgZG9lc24ndCB5ZXQgc3VwcG9ydApzZXBhcmF0ZSBhZGRyZXNzIHNwYWNlcy4KClJv
YgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
