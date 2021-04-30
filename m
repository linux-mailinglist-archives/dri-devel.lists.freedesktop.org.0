Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCAB36FCF9
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 17:03:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB7BF89725;
	Fri, 30 Apr 2021 15:03:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB2289725
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 15:03:01 +0000 (UTC)
Received: by mail-qv1-xf2b.google.com with SMTP id t14so4445544qvl.10
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 08:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZIejMIMjIiwTAMSt151Fok2VM86kKD61U4Wla4q/OKk=;
 b=feub5h4lpKZTJjpolnsZG3m3Kpvyb4puUq0JN0vYe2XRztsQo4ylkneW/Tm724GQfi
 t5uQZ8eY6ynrEBHQD1/tCJdS/g4U/oczJTirOCnmWuwt6Czf1r6+KJPjQZIulr/xQ1qb
 XPaEg/gnEwnouq0AUZFhkeuIoLqjl0DUQmVTxSLnlpc+KhHQaWVztHNrGRVy6u2JOjgD
 qRrooMPPdgsN5nftjItOnugD6FJRexl1LPPleOVFrj3pL7dH44/zkP+WgdAk+M49RMPd
 lnBWg4gPNhGPXaYj/Pf7Sct+y+Rr9Sto3rxS0nNyUGHNRMQ9YYm3+K0k/WgqFabwCYlz
 +36w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZIejMIMjIiwTAMSt151Fok2VM86kKD61U4Wla4q/OKk=;
 b=dIGTJuNGYYz4lFnUlgfr0M21hcLu5COAHb7geXW+niCDpvFXt34gtXTUJY5kR5Tgb2
 Q+6G09y8HeSDD1qNfqFr+XLHys8p+1UlcVxv3DWNs8EvPoiRCchNa+DeO2LrUJhfUQwC
 RURc2S+fvFhV3atFMb+qajobIYUyBmtJKf5tNb7UWYAVIXe70TCOHZoXIId6VhzXlfLd
 ssZRfMsr7ZSexXX+s16o3gF9pPJSMDaubxiP+rE0BrqWrjRwB2vgvM0xUXyf2bbXpp2H
 nHtENSoWgh4LaeOF9FJ2wL79S80PbrWLfokxIlfUrOx+pT/ZzUfUabLKp7X7I4AmqHdo
 +suA==
X-Gm-Message-State: AOAM532mUzd13020FCmlkcZCGaH91Izzv/WOxps8XnylLmhH4BtvOiyZ
 nF1+ATT3Lijfa4bF1laDRv/TSPujyZKDhmVXcCY=
X-Google-Smtp-Source: ABdhPJxLg07RCf6qyehjjWsvaKReYB2jbDph6fV3j2AWY6sM8fViSE5hvMaq0azoUJDqMD+e/hIL12l2lAIHm9Yqjbs=
X-Received: by 2002:ad4:4109:: with SMTP id i9mr6132083qvp.30.1619794980866;
 Fri, 30 Apr 2021 08:03:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210430092508.60710-1-christian.koenig@amd.com>
 <20210430092508.60710-11-christian.koenig@amd.com>
In-Reply-To: <20210430092508.60710-11-christian.koenig@amd.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 30 Apr 2021 16:02:31 +0100
Message-ID: <CAM0jSHN0+w-VxmB9edWhbeq6faWfsC-r2R9N7q4p6PtjZUEdhA@mail.gmail.com>
Subject: Re: [PATCH 11/13] drm/nouveau: switch the TTM backends to self alloc
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAzMCBBcHIgMjAyMSBhdCAxMDoyNSwgQ2hyaXN0aWFuIEvDtm5pZwo8Y2tvZW5pZy5s
ZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gU2ltaWxhciB0byB0aGUgVFRNIHJh
bmdlIG1hbmFnZXIuCj4KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZl
YXVfbWVtLmggfCAxICsKPiAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV90dG0uYyB8
IDQgKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfbWVtLmggYi9kcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9ub3V2ZWF1X21lbS5oCj4gaW5kZXggN2RmMzg0OGU4NWFhLi4zYTZhMWJlMmVk
NTIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9tZW0uaAo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfbWVtLmgKPiBAQCAtMTMsNiAr
MTMsNyBAQCBub3V2ZWF1X21lbShzdHJ1Y3QgdHRtX3Jlc291cmNlICpyZWcpCj4gIH0KPgo+ICBz
dHJ1Y3Qgbm91dmVhdV9tZW0gewo+ICsgICAgICAgc3RydWN0IHR0bV9yZXNvdXJjZSBiYXNlOwo+
ICAgICAgICAgc3RydWN0IG5vdXZlYXVfY2xpICpjbGk7Cj4gICAgICAgICB1OCBraW5kOwo+ICAg
ICAgICAgdTggY29tcDsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91
dmVhdV90dG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfdHRtLmMKPiBpbmRl
eCAxNWM3NjI3ZjhmNTguLjVlNWNlMmVjODlmMCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9ub3V2ZWF1X3R0bS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUv
bm91dmVhdV90dG0uYwo+IEBAIC01OSw2ICs1OSw4IEBAIG5vdXZlYXVfdnJhbV9tYW5hZ2VyX25l
dyhzdHJ1Y3QgdHRtX3Jlc291cmNlX21hbmFnZXIgKm1hbiwKPiAgICAgICAgIGlmIChyZXQpCj4g
ICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4KPiArICAgICAgIHR0bV9yZXNvdXJjZV9pbml0
KGJvLCBwbGFjZSwgcmVnLT5tbV9ub2RlKTsKPiArCgpXaGF0IGhhcHBlbmVkIGhlcmU/IEkgYXNz
dW1lIHRoaXMgbmVlZHMgdG8gYmUgbm91dmVhdV9tZW0uYmFzZSBub3QgdGhlIG1tX25vZGU/Cgo+
ICAgICAgICAgcmV0ID0gbm91dmVhdV9tZW1fdnJhbShyZWcsIG52Ym8tPmNvbnRpZywgbnZiby0+
cGFnZSk7Cj4gICAgICAgICBpZiAocmV0KSB7Cj4gICAgICAgICAgICAgICAgIG5vdXZlYXVfbWVt
X2RlbChyZWcpOwo+IEBAIC04Nyw2ICs4OSw3IEBAIG5vdXZlYXVfZ2FydF9tYW5hZ2VyX25ldyhz
dHJ1Y3QgdHRtX3Jlc291cmNlX21hbmFnZXIgKm1hbiwKPiAgICAgICAgIGlmIChyZXQpCj4gICAg
ICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4KPiArICAgICAgIHR0bV9yZXNvdXJjZV9pbml0KGJv
LCBwbGFjZSwgcmVnLT5tbV9ub2RlKTsKPiAgICAgICAgIHJlZy0+c3RhcnQgPSAwOwo+ICAgICAg
ICAgcmV0dXJuIDA7Cj4gIH0KPiBAQCAtMTEyLDYgKzExNSw3IEBAIG52MDRfZ2FydF9tYW5hZ2Vy
X25ldyhzdHJ1Y3QgdHRtX3Jlc291cmNlX21hbmFnZXIgKm1hbiwKPiAgICAgICAgIGlmIChyZXQp
Cj4gICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4KPiArICAgICAgIHR0bV9yZXNvdXJjZV9p
bml0KGJvLCBwbGFjZSwgcmVnLT5tbV9ub2RlKTsKPiAgICAgICAgIHJldCA9IG52aWZfdm1tX2dl
dCgmbWVtLT5jbGktPnZtbS52bW0sIFBURVMsIGZhbHNlLCAxMiwgMCwKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAobG9uZylyZWctPm51bV9wYWdlcyA8PCBQQUdFX1NISUZULCAmbWVtLT52
bWFbMF0pOwo+ICAgICAgICAgaWYgKHJldCkgewo+IC0tCj4gMi4yNS4xCj4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
