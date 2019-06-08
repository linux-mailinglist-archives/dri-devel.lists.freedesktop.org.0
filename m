Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9049F39A93
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jun 2019 05:58:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 105398920C;
	Sat,  8 Jun 2019 03:58:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90EC98920F
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jun 2019 03:58:07 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id j2so2233427pfe.6
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jun 2019 20:58:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=l14jgAawlsDS1VZ8WGmfB4MOY8oLSSKNbX7PpDlwP4w=;
 b=dpe0VfeMIOmvGisV/5s2ZpRdkgjLzpGqzxB+ePS1DPc58KLk6sQ0ZIGT1AhmJhFDaP
 UK3SSeaGcLVoKAZkkZI7A0UpGvoHZjsWOrQ/UMbkLv7TNcnFX0CQ3gbTXxiNzKMhNfEA
 fId1zje+BLkkd8bEvAymr3v/z1cyL7soeiUu/gC3pv+lzUzv1ZCH/SINDb52WDlKsiC4
 t7okDQ43UO1N4OWxRiLrrgL5vqkiLuV5ZpklttVBmz7ebSAdoFx7JxrGGjYJTEui4NdS
 hiUOg29XREKHP0RP9wNlltT648WfNLWUMV38HD2E1V7btyeLxOALjOSHoKRFzjQMf7zX
 MYxg==
X-Gm-Message-State: APjAAAWy/MWAV3RMItYXdvlKbjk5GCQMBqZ7hTsSksMhmc6YxNE4VfTe
 EqRNsBLplQ4SzFsmsZlblsLdLw==
X-Google-Smtp-Source: APXvYqxfp4HEsqQlOvNH04bl9SHArYk4hyQYoSWfdJS+DhwTyJyuL+IfwdxORVSQ19uSVN9pTMHd5w==
X-Received: by 2002:a63:1657:: with SMTP id 23mr5550367pgw.98.1559966287061;
 Fri, 07 Jun 2019 20:58:07 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id l2sm246111pgs.33.2019.06.07.20.58.06
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 07 Jun 2019 20:58:06 -0700 (PDT)
Date: Fri, 7 Jun 2019 20:58:05 -0700
From: Kees Cook <keescook@chromium.org>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v16 15/16] vfio/type1, arm64: untag user pointers in
 vaddr_get_pfn
Message-ID: <201906072058.BB57EFA@keescook>
References: <cover.1559580831.git.andreyknvl@google.com>
 <c529e1eeea7700beff197c4456da6a882ce2efb7.1559580831.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c529e1eeea7700beff197c4456da6a882ce2efb7.1559580831.git.andreyknvl@google.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=l14jgAawlsDS1VZ8WGmfB4MOY8oLSSKNbX7PpDlwP4w=;
 b=C5Gjab6oABNd7uWOUXVxMun2EBOiIN1zQFBFmz4oVz6alLd7w4ZDoA104BjgrPqBY8
 M11UcHeF2K3I4znphl64bBg5eiZ8uh03AO1nktwVISAdyYWU8VZro1t6U3J4ibUtkAgv
 yam4Xd5rREh0IexVfq4tELDc0YZWvN5ZcS9CQ=
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
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
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

T24gTW9uLCBKdW4gMDMsIDIwMTkgYXQgMDY6NTU6MTdQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxv
diB3cm90ZToKPiBUaGlzIHBhdGNoIGlzIGEgcGFydCBvZiBhIHNlcmllcyB0aGF0IGV4dGVuZHMg
YXJtNjQga2VybmVsIEFCSSB0byBhbGxvdyB0bwo+IHBhc3MgdGFnZ2VkIHVzZXIgcG9pbnRlcnMg
KHdpdGggdGhlIHRvcCBieXRlIHNldCB0byBzb21ldGhpbmcgZWxzZSBvdGhlcgo+IHRoYW4gMHgw
MCkgYXMgc3lzY2FsbCBhcmd1bWVudHMuCj4gCj4gdmFkZHJfZ2V0X3BmbigpIHVzZXMgcHJvdmlk
ZWQgdXNlciBwb2ludGVycyBmb3Igdm1hIGxvb2t1cHMsIHdoaWNoIGNhbgo+IG9ubHkgYnkgZG9u
ZSB3aXRoIHVudGFnZ2VkIHBvaW50ZXJzLgo+IAo+IFVudGFnIHVzZXIgcG9pbnRlcnMgaW4gdGhp
cyBmdW5jdGlvbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgS29ub3ZhbG92IDxhbmRyZXlr
bnZsQGdvb2dsZS5jb20+CgpSZXZpZXdlZC1ieTogS2VlcyBDb29rIDxrZWVzY29va0BjaHJvbWl1
bS5vcmc+CgotS2VlcwoKPiAtLS0KPiAgZHJpdmVycy92ZmlvL3ZmaW9faW9tbXVfdHlwZTEuYyB8
IDIgKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3ZmaW8vdmZpb19pb21tdV90eXBlMS5jIGIvZHJpdmVycy92ZmlvL3ZmaW9faW9t
bXVfdHlwZTEuYwo+IGluZGV4IDNkZGMzNzVlNzA2My4uNTI4ZTM5YTFjMmRkIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvdmZpby92ZmlvX2lvbW11X3R5cGUxLmMKPiArKysgYi9kcml2ZXJzL3ZmaW8v
dmZpb19pb21tdV90eXBlMS5jCj4gQEAgLTM4NCw2ICszODQsOCBAQCBzdGF0aWMgaW50IHZhZGRy
X2dldF9wZm4oc3RydWN0IG1tX3N0cnVjdCAqbW0sIHVuc2lnbmVkIGxvbmcgdmFkZHIsCj4gIAo+
ICAJZG93bl9yZWFkKCZtbS0+bW1hcF9zZW0pOwo+ICAKPiArCXZhZGRyID0gdW50YWdnZWRfYWRk
cih2YWRkcik7Cj4gKwo+ICAJdm1hID0gZmluZF92bWFfaW50ZXJzZWN0aW9uKG1tLCB2YWRkciwg
dmFkZHIgKyAxKTsKPiAgCj4gIAlpZiAodm1hICYmIHZtYS0+dm1fZmxhZ3MgJiBWTV9QRk5NQVAp
IHsKPiAtLSAKPiAyLjIyLjAucmMxLjMxMS5nNWQ3NTczYTE1MS1nb29nCj4gCgotLSAKS2VlcyBD
b29rCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
