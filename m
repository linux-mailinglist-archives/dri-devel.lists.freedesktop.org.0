Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E6722CC3A
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jul 2020 19:33:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 400196E0C6;
	Fri, 24 Jul 2020 17:33:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BEB66E0C6
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jul 2020 17:33:52 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id t15so5691593pjq.5
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jul 2020 10:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=6fXu93/1jlX07Hr4lqHKy5c8vfIRiF2jqmKmeTYOgAM=;
 b=Q1QRkHycMk52/bKVqxlla4kawMVY7rJ9Glz8gLDV/8MbzJ1hbsWxA2Nvw14uWnHUyR
 7i0ZEaE+GxwOv5WddwQKgaFbyK/Zqqm89mDtGLrSm4Eo9MCONhkoAcHQdJYOautUQtIl
 BrY8mEeiP/cjryNq+KgqmCIVo1Ikw2cnJeoJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=6fXu93/1jlX07Hr4lqHKy5c8vfIRiF2jqmKmeTYOgAM=;
 b=poHUGrXe1BD+9c3TrJDStGj4Bd5DH0M3y+DuVXJ2LNSkpI8dQlT4qZILNefpxTGEAT
 H96TREQEpT0XzN+lSxTiytJ2r+RQx3oJIpmhSbIj/OmENXtYQMuh28QCjPcWZuEKX9WR
 Ex2gi07bJY8bALsnFbIkMwFr6waGYBQHvd4Kt8tyWUI34VO7J0VQIg0tr/2sdspI4Q/m
 bhbqIl6u3UZk8yLVWnX1M+CBygt4gHCTvkQUzeyFv/avZ3+iVCR5SmTNqc/tCqgTS/z9
 TiyGPvfzbrOTIXIz9Uqp3k27WAXmX2jauLSikq6CPaPwTy8JA5Y5/j2EuC4x4BOh2d+k
 ejaQ==
X-Gm-Message-State: AOAM530WF4rAy5N3L9bpdBP+V2lPLF1zIvuYiVmVxsvP03Az4wCBGVT2
 T36Iv6MeV3I8ldtxZgvN9QMzmg==
X-Google-Smtp-Source: ABdhPJw0sCIj9SGPQi9/3pSeTdjP3tUKlGQY9tYxdh47l36JCwKd/wL2+T5d4l7kWEKYH9l49xhmsg==
X-Received: by 2002:a17:90b:238a:: with SMTP id
 mr10mr6130742pjb.187.1595612031653; 
 Fri, 24 Jul 2020 10:33:51 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id a9sm6938080pfr.103.2020.07.24.10.33.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jul 2020 10:33:50 -0700 (PDT)
Date: Fri, 24 Jul 2020 10:33:49 -0700
From: Kees Cook <keescook@chromium.org>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: Re: [PATCH] amdgpu_dm: fix nonblocking atomic commit use-after-free
Message-ID: <202007241016.922B094AAA@keescook>
References: <YIGsJ9LlFquvBI2iWPKhJwjKBwDUr_C-38oVpLJJHJ5rDCY_Zrrv392o6UPNxHoeQrcpLYC9U4fZdpD9ilz6Amg2IxkSexGLQMCQIBek8rc=@protonmail.com>
 <202007231524.A24720C@keescook>
 <a86cba0b-4513-e7c3-ae75-bb331433f664@molgen.mpg.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a86cba0b-4513-e7c3-ae75-bb331433f664@molgen.mpg.de>
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
Cc: anthony.ruhier@gmail.com, 1i5t5.duncan@cox.net, sunpeng.li@amd.com,
 Mazin Rezk <mnrzk@protonmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, regressions@leemhuis.info,
 amd-gfx@lists.freedesktop.org, Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, mphantomx@yahoo.com.br,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMjQsIDIwMjAgYXQgMDk6NDU6MThBTSArMDIwMCwgUGF1bCBNZW56ZWwgd3Jv
dGU6Cj4gQW0gMjQuMDcuMjAgdW0gMDA6MzIgc2NocmllYiBLZWVzIENvb2s6Cj4gPiBPbiBUaHUs
IEp1bCAyMywgMjAyMCBhdCAwOToxMDoxNVBNICswMDAwLCBNYXppbiBSZXprIHdyb3RlOgo+IEFz
IExpbnV4IDUuOC1yYzcgaXMgZ29pbmcgdG8gYmUgcmVsZWFzZWQgdGhpcyBTdW5kYXksIEkgd29u
ZGVyLCBpZiBjb21taXQKPiAzMjAyZmE2MmYgKCJzbHViOiByZWxvY2F0ZSBmcmVlbGlzdCBwb2lu
dGVyIHRvIG1pZGRsZSBvZiBvYmplY3QiKSBzaG91bGQgYmUKPiByZXZlcnRlZCBmb3Igbm93IHRv
IGZpeCB0aGUgcmVncmVzc2lvbiBmb3IgdGhlIHVzZXJzIGFjY29yZGluZyB0byBMaW51eOKAmSBu
bwo+IHJlZ3Jlc3Npb24gcG9saWN5LiBPbmNlIHRoZSBBTURHUFUvRFJNIGRyaXZlciBpc3N1ZSBp
cyBmaXhlZCwgaXQgY2FuIGJlCj4gcmVhcHBsaWVkLiBJIGtub3cgaXTigJlzIG5vdCBvcHRpbWFs
LCBidXQgYXMgc29tZSB0ZXN0aW5nIGlzIGdvaW5nIHRvIGJlCj4gaW52b2x2ZWQgZm9yIHRoZSBm
aXgsIEnigJlkIGFyZ3VlIGl04oCZcyB0aGUgYmVzdCBvcHRpb24gZm9yIHRoZSB1c2Vycy4KCldl
bGwsIHRoZSBTTFVCIGRlZmVuc2Ugd2FzIGFscmVhZHkgcmVsZWFzZWQgaW4gdjUuNywgc28gSSdt
IG5vdCBzdXJlIGl0CnJlYWxseSBoZWxwcyBmb3IgYW1kZ3B1X2RtIHVzZXJzIHNlZWluZyBpdCB0
aGVyZSB0b28uIFRoZXJlIHdhcyBhIGZpeCB0bwpkaXNhYmxlIHRoZSBhc3luYyBwYXRoIGZvciB0
aGlzIGRyaXZlciB0aGF0IHdvcmtlZCBhcm91bmQgdGhlIGJ1ZyB0b28sCnllcz8gVGhhdCBzZWVt
cyBsaWtlIGEgc2FmZXIgYW5kIG1vcmUgZm9jdXNlZCBjaGFuZ2UgdGhhdCBkb2Vzbid0IHJldmVy
dAp0aGUgU0xVQiBkZWZlbnNlIGZvciBhbGwgdXNlcnMsIGFuZCB3b3VsZCBhY3R1YWxseSBwcm92
aWRlIGEgY29tcGxldGUsCkkgdGhpbmssIHdvcmthcm91bmQgd2hlcmVhcyByZXZlcnRpbmcgdGhl
IFNMVUIgY2hhbmdlIG1lYW5zIHRoZSByYWNlCnN0aWxsIGV4aXN0cy4gRm9yIGV4YW1wbGUsIGl0
IHdvdWxkIGJlIGhpdCB3aXRoIHNsYWIgcG9pc29uaW5nLCBldGMuCgotLSAKS2VlcyBDb29rCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
