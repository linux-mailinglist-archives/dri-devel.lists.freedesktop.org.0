Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF91DE8F44
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2019 19:27:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B81F6E524;
	Tue, 29 Oct 2019 18:27:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63B8C6E524
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2019 18:27:30 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2D1D520874
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2019 18:27:30 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id h202so5734506ybg.13
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2019 11:27:30 -0700 (PDT)
X-Gm-Message-State: APjAAAVDZNfdM4Z9CJHjCT8jt+taQoxRQK3vE1RwkcVyP5P6cYiy9xuh
 r9d7FG1iATYpf3vZcSjq6YOW/5P2RzrZ+E0jYg==
X-Google-Smtp-Source: APXvYqxRyyqPo2+lGJYLHZpSU0d/i9I6p739hIebEMvjXrssaV6r1vzGfDhydNzp51UWwcKohxGJRazXeypZW+DZ0iA=
X-Received: by 2002:a25:bc04:: with SMTP id i4mr19282746ybh.427.1572373649289; 
 Tue, 29 Oct 2019 11:27:29 -0700 (PDT)
MIME-Version: 1.0
References: <9a0b09e6b5851f0d4428b72dd6b8b4c0d0ef4206.1572293305.git.robin.murphy@arm.com>
In-Reply-To: <9a0b09e6b5851f0d4428b72dd6b8b4c0d0ef4206.1572293305.git.robin.murphy@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 29 Oct 2019 13:27:17 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLfKOQrut_i=038zFF6Bb8vGNRjuG2sE2m2GsoWo6vr4g@mail.gmail.com>
Message-ID: <CAL_JsqLfKOQrut_i=038zFF6Bb8vGNRjuG2sE2m2GsoWo6vr4g@mail.gmail.com>
Subject: Re: [PATCH] drm/panfrost: Don't dereference bogus MMU pointers
To: Robin Murphy <robin.murphy@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1572373650;
 bh=/E2fVhCHekOqPKt9Ps7vbQev1xOf+FN9GA5rs0TsWL8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Bavd8bzTkyChea7ixRdZiKHrN1CkaRznY/Rwwkp91boGKkdf3LRQBOQ/6q48Adzp3
 twS2gWAvrXw1muN9kEfzCfc+mkpAtWvC1/VIOwMl333yg7fSGDoLMAVi7IvFc1q8aU
 caq7MnWmwi1Mz2y62iJltZ+f477oQeLqACCf7g0I=
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMjgsIDIwMTkgYXQgMzowOCBQTSBSb2JpbiBNdXJwaHkgPHJvYmluLm11cnBo
eUBhcm0uY29tPiB3cm90ZToKPgo+IEl0IHNlZW1zIHRoYXQga2lsbGluZyBhbiBhcHBsaWNhdGlv
biB3aGlsZSBmYXVsdHMgYXJlIG9jY3VycmluZwo+IChwYXJ0aWN1bGFybHkgd2l0aCBhIEdQVSBp
biBGUEdBIGF0IGEgd2hvcHBpbmcgNDBNSHopIGNhbiBsZWFkIHRvCj4gaGFuZGxpbmcgYSBsaW5n
ZXJpbmcgcGFnZSBmYXVsdCBhZnRlciBhbGwgdGhlIGFkZHJlc3Mgc3BhY2UgY29udGV4dHMKPiBo
YXZlIGFscmVhZHkgYmVlbiBmcmVlZC4gSW4gdGhpcyBzaXR1YXRpb24sIHRoZSBMUlUgbGlzdCBp
cyBlbXB0eSBzbwo+IGFkZHJfdG9fZHJtX21tX25vZGUoKSBlbmRzIHVwIGRlcmVmZXJlbmNpbmcg
dGhlIGxpc3QgaGVhZCBhcyBpZiBpdCB3ZXJlCj4gYSBzdHJ1Y3QgcGFuZnJvc3RfbW11IGVudHJ5
OyB0aGlzIGxlYXZlcyAibW11LT5hcyIgYWN0dWFsbHkgcG9pbnRpbmcgYXQKPiB0aGUgcGZkZXYt
PmFsbG9jX21hc2sgYml0bWFwLCB3aGljaCBpcyBhbHNvIGVtcHR5LCBhbmQgZ2l2ZW4gdGhhdCB0
aGUKPiBmYXVsdCBoYXMgYSBoaWdoIGxpa2VsaWhvb2Qgb2YgYmVpbmcgaW4gQVMwLCBoaWxhcml0
eSBlbnN1ZXMuCj4KPiBTYWRseSwgdGhlIGNsZWFuZXN0IHNvbHV0aW9uIHNlZW1zIHRvIGludm9s
dmUgYW5vdGhlciBnb3RvLiBPaCB3ZWxsLCBhdAo+IGxlYXN0IGl0J3Mgcm9idXN0Li4uCj4KPiBT
aWduZWQtb2ZmLWJ5OiBSb2JpbiBNdXJwaHkgPHJvYmluLm11cnBoeUBhcm0uY29tPgo+IC0tLQo+
ICBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfbW11LmMgfCA2ICsrKy0tLQo+ICAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKQXBwbGllZCB0
byBkcm0tbWlzYy1maXhlcwoKUm9iCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
