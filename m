Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAB371524
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 11:27:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CC418973E;
	Tue, 23 Jul 2019 09:27:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1493D8973E
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 09:27:50 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id z3so80415104iog.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 02:27:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jTUXSBPQ44MqMp9ffo+fxQOThxqdBrKsgm41qkuyP8Q=;
 b=lSDtP5P6gm6ctqJBqc1hzPyzqbXS/QeWHg53EggXaruE7U7lwqZG+ByOkcpJ+YO/0Q
 81VLqsREv201MFcYi0vF1hMyvovlEEAsHOtGbzoRJUpXKrciwz63CClWnNx5vFonHdYE
 qtkZxtuqAAj2iNLi7VPGZBMrkRb7+SeAN2B0iOCIjG1Z4GDW4F26tCuFHE1Bw8K/XLPO
 eyfYWYRAVC2YispIANaCoMsTfO60X61tanbJ50hYSv+MTaittuuRr4oCTMXHsmL9jxWz
 OCbG6cZMUS7uEISn2D6I7M77CHXv17dYr3SJFNd0GyMFI+FUqN7weSL3zSvZdXJCJ0kb
 wmgg==
X-Gm-Message-State: APjAAAVdGwtng1Ctm57RxQQdK0sqgwEjVg0ocBTHFEaKEPWFSUNanHUs
 Qe/Zdi6ixoOFiowehwK0RtE/8T5aHjWmoZ+kWQlyxg==
X-Google-Smtp-Source: APXvYqzwM0qHEdqiupuYRTXbQRjxMiyJCyaoEPmn9FrP967+B1KSxkHbzJBwEMFnEovt3smYbA7T02h122B/muB/d4c=
X-Received: by 2002:a5e:d507:: with SMTP id e7mr61067374iom.284.1563874069373; 
 Tue, 23 Jul 2019 02:27:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190717183352.22519-1-robh@kernel.org>
 <20190717183352.22519-4-robh@kernel.org>
 <0605b17e-4a6b-df9d-6684-38952ce5a09d@arm.com>
 <CAL_JsqK54bV7GQs+=Q0Ye6owwegPXZxj0UHDe-mQmoXJ_mDfnQ@mail.gmail.com>
 <604cb426-6034-1e92-f653-9ee5a3d4c180@arm.com>
 <20190722141256.GE2156@rosenzweig.io>
In-Reply-To: <20190722141256.GE2156@rosenzweig.io>
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Date: Tue, 23 Jul 2019 11:27:37 +0200
Message-ID: <CAAObsKBsMvN3R27r8Zce8jabAtOU02tt2eeCH-Z9R3AFxrkiwg@mail.gmail.com>
Subject: Re: [PATCH 4/5] drm/panfrost: Add support for GPU heap allocations
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMyBKdWwgMjAxOSBhdCAwOToxNCwgQWx5c3NhIFJvc2VuendlaWcgPGFseXNzYUBy
b3Nlbnp3ZWlnLmlvPiB3cm90ZToKPgo+ID4gQSBmYWlyIGJpdCBvZiB0aGUgY29tcGxleGl0eSBv
ZiBrYmFzZSBjb21lcyBmcm9tIHRyeWluZyB0byBhdm9pZCB0aGUKPiA+IHBvc3NpYmlsaXR5IG9m
IG9uZSBwcm9jZXNzIERvU2luZyBhbm90aGVyIGJ5IHN1Ym1pdHRpbmcgbWFsaWNpb3VzIGpvYnMu
Cj4KPiAuLi5hbmQgeWV0IGl0IHdhcyBzdGlsbCBkb2FibGUgc28gZWFzaWx5IChieSBhY2NpZGVu
dCwgd2l0aCBidWdneSBqb2JzCj4gaW5zdGVhZCBvZiBtYWxpY2lvdXMgam9icykuLi4uIHNpZ2gu
Li4KPgo+IFN0aWxsIGlzIG9uIHRoZSBtYWlubGluZSBrZXJuZWwgKGUuZy4gcnVubmluZyBkRVFQ
IGluIGEgd2luZG93IGluCj4gV2VzdG9uLCBzb21lIGZhdWx0cyB0cmlnZ2VyZWQgaW4gZEVRUCBl
bmQgdXAgbWVzc2luZyB1cCBXZXN0b24ncwo+IHJlbmRlcmluZyBvdXRzaWRlIHRoZSBkZXFwIHdp
bmRvdykuIFdoYXQncyBvdXIgdGhyZWF0IG1vZGVsIGhlcmU/Cj4KPiBJcyAiYmFubmluZyBXZWJH
TCBvbiBQYW5mcm9zdCIgYWxsb3dlZD8gOikKCkkgdGhpbmsgd2hhdCBQYW5mcm9zdCBuZWVkcyB0
byBkbyBpcyB0byBnaXZlIGJyb3dzZXJzIGFzIG11Y2ggc3VwcG9ydAphcyBwb3NzaWJsZSB0byBt
YWtlIFdlYkdMIHNlY3VyZS4gVGhpcyBpbmNsdWRlcyBtYWtpbmcgYmVzdCB1c2Ugb2YgdGhlCkhX
IHRvIHRoYXQgZW5kLCBhbmQgaW1wbGVtZW50aW5nIGFueSByb2J1c3RuZXNzLXJlbGF0ZWQgZXh0
ZW5zaW9ucwp0aGF0IG1heSBiZSBhdmFpbGFibGUuCgpDaGVlcnMsCgpUb21ldQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
