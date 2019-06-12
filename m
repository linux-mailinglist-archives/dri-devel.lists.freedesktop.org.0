Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8ECA43354
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:27:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AD39892D4;
	Thu, 13 Jun 2019 07:27:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E38B8916B
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 08:26:00 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id f97so6333719plb.5
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 01:26:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5KktLArBUOD7UNE/RSxB9p8yeyZnfK95gCsWMNHlRI8=;
 b=nd2jc0w9JIMjkYeYQEX1gYAuRoq6YcMx7qkH7isxU9oB46CIQ3PAB7pVf0cdcznZYM
 GXqhQbbnAe8I0n1vL8qmhcBJWfWqjys/h70TDnBPybp0uWCGCoEZgYWp3AUjHm2Bw9gD
 7QTZk3L8Zr9cMl21FMrrOTqmxtO1+KqspX5QWFMzj9zLITTPQm8pcU1Mw/bQ0eV6apVG
 2CMjTziQTU1kyyAQQUvCCbp59/K+H23gGKYZGA3AFPrONfjNHZp9n90OykW1j7I4aiw2
 eZNibIqaNE7mzhz3kRoBSya6RXYcwHBpyGcDByGWuFQtOYRI+GXmsyXY2K0OdXLS+BcL
 Uvfw==
X-Gm-Message-State: APjAAAWWEWpUpZF1e+ScRyYUuLPeZv/43kpU817/AQ8CfQR7s32vqJC7
 mD7Qufdu+ti2+PlqbDy7EtM=
X-Google-Smtp-Source: APXvYqy3uLUDObUndlzZKGCHTjtuqh5HyOuDno0Hn+nbevH0PlkBlwuEdIxdnRDaQ0zyrH0ATf2A9g==
X-Received: by 2002:a17:902:d717:: with SMTP id
 w23mr36501859ply.275.1560327959741; 
 Wed, 12 Jun 2019 01:25:59 -0700 (PDT)
Received: from Asurada (c-98-248-47-108.hsd1.ca.comcast.net. [98.248.47.108])
 by smtp.gmail.com with ESMTPSA id
 s15sm14381203pfd.183.2019.06.12.01.25.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Jun 2019 01:25:59 -0700 (PDT)
Date: Wed, 12 Jun 2019 01:25:49 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: Re: [PATCH] dma-buf: refcount the attachment for cache_sgt_mapping
Message-ID: <20190612082549.GA9072@Asurada>
References: <20190612012219.21652-1-nicoleotsuka@gmail.com>
 <261b46c7-0c5e-4268-619d-f8381fbc3aeb@amd.com>
 <20190612080214.GA8876@Asurada>
 <170c3828-115b-38e5-35fc-1b88c08c492a@amd.com>
 <20190612081554.GB8876@Asurada>
 <c5e04bf7-d07e-9e26-df65-d7382d6051ba@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c5e04bf7-d07e-9e26-df65-d7382d6051ba@amd.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Approved-At: Thu, 13 Jun 2019 07:27:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=5KktLArBUOD7UNE/RSxB9p8yeyZnfK95gCsWMNHlRI8=;
 b=ZYqaWP9lhPsCU5OjDxArTJB5bBr4l60KVhHS/jHUjG0wBQDRFQpBEhDmx5aof0x96V
 xjAt27Ss6TIkjXNmtY+RFHZnaxtcUoBKCrRq6hBJmyE5DsOXVe6qpikOqvhV+CrbPIrJ
 DRBQWcUkBtQ1EAClTDvvKXdT4YhaWCsWjjeoIJOO6AIStMNtxp9IA7BumEfocc3nIJCz
 2Dq4HNBkXl43mc40bIu2GAlyr6YqsVb+W2EftfI0vRHokLBujYKRXygDmHHK6+VuqI5P
 1K3ee0AjKVuyG69fEJvJPVGLFAdLSGldLcrjGD2Rfv9mrSlEKx8nan4G79zx9HsnIDuU
 1FAQ==
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
Cc: "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTIsIDIwMTkgYXQgMDg6MjA6NDFBTSArMDAwMCwgS29lbmlnLCBDaHJpc3Rp
YW4gd3JvdGU6Cj4gQW0gMTIuMDYuMTkgdW0gMTA6MTUgc2NocmllYiBOaWNvbGluIENoZW46Cj4g
PiBIaSBDaHJpc3RpYW4sCj4gPgo+ID4gT24gV2VkLCBKdW4gMTIsIDIwMTkgYXQgMDg6MDU6NTNB
TSArMDAwMCwgS29lbmlnLCBDaHJpc3RpYW4gd3JvdGU6Cj4gPj4gQW0gMTIuMDYuMTkgdW0gMTA6
MDIgc2NocmllYiBOaWNvbGluIENoZW46Cj4gPj4gW1NOSVBdCj4gPj4+IFdlIGhhdmVuJ3QgdXNl
ZCBEUk0vR1JNX1BSSU1FIHlldCBidXQgSSBhbSBhbHNvIGN1cmlvdXMgd291bGQgaXQKPiA+Pj4g
YmVuZWZpdCBEUk0gYWxzbyBpZiB3ZSByZWR1Y2UgdGhpcyBvdmVyaGVhZCBpbiB0aGUgZG1hX2J1
Zj8KPiA+PiBObywgbm90IGF0IGFsbC4KPiA+ICBGcm9tIHlvdSByZXBsaWVzLCBpbiBhIHN1bW1h
cnksIGRvZXMgaXQgbWVhbnMgdGhhdCB0aGVyZSB3b24ndCBiZSBhIGNhc2UKPiA+IG9mIERSTSBo
YXZpbmcgYSBkbWFfYnVmIGF0dGFjaGluZyB0byB0aGUgc2FtZSBkZXZpY2UsIGkuZS4gbXVsdGlw
bGUgY2FsbHMKPiA+IG9mIGRybV9nZW1fcHJpbWVfaW1wb3J0KCkgZnVuY3Rpb24gd2l0aCBzYW1l
IHBhcmFtZXRlcnMgb2YgZGV2ICsgZG1hX2J1Zj8KPiAKPiBXZWxsLCB0aGVyZSBhcmUgc29tZSBj
YXNlcyB3aGVyZSB0aGlzIGhhcHBlbnMuIEJ1dCBpbiB0aG9zZSBjYXNlcyB3ZSAKPiBpbnRlbnRp
b25hbGx5IHdhbnQgdG8gZ2V0IGEgbmV3IGF0dGFjaG1lbnQgOikKCkdvdCBpdC4KCj4gU28gdGhp
bmtpbmcgbW9yZSBhYm91dCBpdCB5b3Ugd291bGQgYWN0dWFsbHkgYnJlYWsgdGhvc2UgYW5kIHRo
YXQgaXMgbm90IAo+IHNvbWV0aGluZyB3ZSBjYW4gZG8uCgpUaGF0J3MgdHJ1ZS4uLgoKPiA+IElm
IHNvLCB3ZSBjYW4ganVzdCBpZ25vcmUvZHJvcCB0aGlzIHBhdGNoLiBTb3JyeSBmb3IgdGhlIG1p
c3VuZGVyc3RhbmRpbmcuCj4gCj4gSXQgbWlnaHQgYmUgaW50ZXJlc3RpbmcgZm9yIHRoaW5ncyBs
aWtlIFAyUCwgYnV0IGV2ZW4gdGhlbiBpdCBtaWdodCBiZSAKPiBiZXR0ZXIgdG8ganVzdCBjYWNo
ZSB0aGUgUDJQIHNldHRpbmdzIGluc3RlYWQgb2YgdGhlIGZ1bGwgYXR0YWNobWVudC4KCkkgc2Vl
LiBUaGFuayB5b3UgZm9yIHRoZSBhbnN3ZXJzIQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
