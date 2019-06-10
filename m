Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B943BD8F
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2019 22:36:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AE5B89153;
	Mon, 10 Jun 2019 20:36:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 496FD89153
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 20:36:06 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id n2so5619256pgp.11
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 13:36:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QIiaElKbYG7X2iRY6VXsdeM4+31zgx4vPIFfu4hUJug=;
 b=nq82FLXjYf3g9NIkS/RAvKxk0AvRu1yU/mY9EREUxnmuWTqvHoQw2bBrDWiwpEn917
 s4KCbXaaanJmrpBspKq8nK6MW6I4i13yPqn3Wrp88ZugjXilJ6VAgtwjJs5sLJfITZrY
 6xaffbXN0nLOh1/40Od48HQpNTa/vkxKVHHAQT7jlu0I6I0VneMm2CbNhSETPeBDcbl9
 HxN91oBAaZcq9UIkOp0bBs+IHgnUt7QcUU2W53cwegyPWvqcqj6aGfCuSaNsPBy1JwAN
 YtKkxTG41BTzWiqhyOT3/PqmHy+fiCQ7YxC8Xdcw5YbpqHpukgFfDfGQIlmvHdDACGQ7
 QqmA==
X-Gm-Message-State: APjAAAXtNxUdKecb3HhkMFIVeKLN9WqyTTnIhagTZ2uLi+O/GsKTseFT
 u9pu/v//KiwFeHh185w8HLuLhg==
X-Google-Smtp-Source: APXvYqz36v1zCKX0GRWb534Z9an9udGHI/NESxPlvuGqVOMCrwC97gsWY6mXQoFhLwcNndoWLde2ZA==
X-Received: by 2002:a62:1b85:: with SMTP id
 b127mr76850297pfb.165.1560198965895; 
 Mon, 10 Jun 2019 13:36:05 -0700 (PDT)
Received: from www.outflux.net
 (173-164-112-133-Oregon.hfc.comcastbusiness.net. [173.164.112.133])
 by smtp.gmail.com with ESMTPSA id k22sm11148457pfk.178.2019.06.10.13.36.04
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 10 Jun 2019 13:36:04 -0700 (PDT)
Date: Mon, 10 Jun 2019 13:36:04 -0700
From: Kees Cook <keescook@chromium.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v16 02/16] arm64: untag user pointers in access_ok and
 __uaccess_mask_ptr
Message-ID: <201906101335.DF80D631@keescook>
References: <cover.1559580831.git.andreyknvl@google.com>
 <4327b260fb17c4776a1e3c844f388e4948cfb747.1559580831.git.andreyknvl@google.com>
 <20190610175326.GC25803@arrakis.emea.arm.com>
 <201906101106.3CA50745E3@keescook>
 <20190610185329.xhjawzfy4uddrkrj@mbp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190610185329.xhjawzfy4uddrkrj@mbp>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QIiaElKbYG7X2iRY6VXsdeM4+31zgx4vPIFfu4hUJug=;
 b=aypLgRrX0btLwkQ78UmSd30OW9UF0AUZJnAd3r2/5HqpTZB7t9pPjkr79taehwRSBe
 Uf3LjKJsRGeyWW7niEs4BHLmd/27Tp++YcV8xUIXVrHXkWkhfr39ad2bGk73/2ccXpRd
 Krrfs143htc/xGI+Ppm9VimNWGnjKhQyxh//k=
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
Cc: Mark Rutland <mark.rutland@arm.com>, kvm@vger.kernel.org,
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Khalid Aziz <khalid.aziz@oracle.com>, linux-kselftest@vger.kernel.org,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dmitry Vyukov <dvyukov@google.com>, Dave Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>, linux-kernel@vger.kernel.org,
 Jens Wiklander <jens.wiklander@linaro.org>, Lee Smith <Lee.Smith@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, enh <enh@google.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMTAsIDIwMTkgYXQgMDc6NTM6MzBQTSArMDEwMCwgQ2F0YWxpbiBNYXJpbmFz
IHdyb3RlOgo+IE9uIE1vbiwgSnVuIDEwLCAyMDE5IGF0IDExOjA3OjAzQU0gLTA3MDAsIEtlZXMg
Q29vayB3cm90ZToKPiA+IE9uIE1vbiwgSnVuIDEwLCAyMDE5IGF0IDA2OjUzOjI3UE0gKzAxMDAs
IENhdGFsaW4gTWFyaW5hcyB3cm90ZToKPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQva2Vy
bmVsL3Byb2Nlc3MuYyBiL2FyY2gvYXJtNjQva2VybmVsL3Byb2Nlc3MuYwo+ID4gPiBpbmRleCAz
NzY3ZmIyMWE1YjguLmZkMTkxYzViOTJhYSAxMDA2NDQKPiA+ID4gLS0tIGEvYXJjaC9hcm02NC9r
ZXJuZWwvcHJvY2Vzcy5jCj4gPiA+ICsrKyBiL2FyY2gvYXJtNjQva2VybmVsL3Byb2Nlc3MuYwo+
ID4gPiBAQCAtNTUyLDMgKzU1MiwxOCBAQCB2b2lkIGFyY2hfc2V0dXBfbmV3X2V4ZWModm9pZCkK
PiA+ID4gIAo+ID4gPiAgCXB0cmF1dGhfdGhyZWFkX2luaXRfdXNlcihjdXJyZW50KTsKPiA+ID4g
IH0KPiA+ID4gKwo+ID4gPiArLyoKPiA+ID4gKyAqIEVuYWJsZSB0aGUgcmVsYXhlZCBBQkkgYWxs
b3dpbmcgdGFnZ2VkIHVzZXIgYWRkcmVzc2VzIGludG8gdGhlIGtlcm5lbC4KPiA+ID4gKyAqLwo+
ID4gPiAraW50IHVudGFnZ2VkX3VhZGRyX3NldF9tb2RlKHVuc2lnbmVkIGxvbmcgYXJnKQo+ID4g
PiArewo+ID4gPiArCWlmIChpc19jb21wYXRfdGFzaygpKQo+ID4gPiArCQlyZXR1cm4gLUVOT1RT
VVBQOwo+ID4gPiArCWlmIChhcmcpCj4gPiA+ICsJCXJldHVybiAtRUlOVkFMOwo+ID4gPiArCj4g
PiA+ICsJc2V0X3RocmVhZF9mbGFnKFRJRl9VTlRBR0dFRF9VQUREUik7Cj4gPiA+ICsKPiA+ID4g
KwlyZXR1cm4gMDsKPiA+ID4gK30KPiA+IAo+ID4gSSB0aGluayB0aGlzIHNob3VsZCBiZSBwYWly
ZWQgd2l0aCBhIGZsYWcgY2xlYXJpbmcgaW4gY29weV90aHJlYWQoKSwKPiA+IHllcz8gKGkuZS4g
ZWFjaCBiaW5hcnkgbmVlZHMgdG8gb3B0IGluKQo+IAo+IEl0IGluZGVlZCBuZWVkcyBjbGVhcmlu
ZyB0aG91Z2ggbm90IGluIGNvcHlfdGhyZWFkKCkgYXMgdGhhdCdzIHVzZWQgb24KPiBjbG9uZS9m
b3JrIGJ1dCByYXRoZXIgaW4gZmx1c2hfdGhyZWFkKCksIGNhbGxlZCBvbiB0aGUgZXhlY3ZlKCkg
cGF0aC4KCkFoISBZZXMsIHRoYW5rcy4KCj4gQW5kIGEgbm90ZSB0byBteXNlbGY6IEkgdGhpbmsg
UFJfVU5UQUdHRURfQUREUiAobm90IFVBRERSKSBsb29rcyBiZXR0ZXIKPiBpbiBhIHVhcGkgaGVh
ZGVyLCB0aGUgdXNlciBkb2Vzbid0IGRpZmZlcmVudGlhdGUgYmV0d2VlbiB1YWRkciBhbmQKPiBr
YWRkci4KCkdvb2QgcG9pbnQuIEkgd291bGQgYWdyZWUuIDopCgotLSAKS2VlcyBDb29rCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
