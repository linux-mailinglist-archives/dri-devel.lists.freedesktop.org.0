Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 653B6EE76B
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 19:32:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 676396E802;
	Mon,  4 Nov 2019 18:32:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1081B6E802
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2019 18:32:50 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id k2so15001862oij.12
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2019 10:32:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CuoEqQL2KebTopf41oEH+8ZFIOF1Y0zb5FGL5THAEuM=;
 b=uJdQ/B9V7toQdi+9F7Or+6NiZ7tugkOKAyiNCu4IaGeiwuU602N+xbE+bVPI7x8Zc9
 EvV3TwjVSwRBpENu+bytX5FYC3yVBQBhd0Emi+VxcD+k1i8YxTqEev5KhYj6D02ITOv7
 uQHJAGHKlEmg5W/kgf2GMCVwfcPKX05atWX6dAs7Hfwji0auley24tESh8r4zy/OgLCl
 JtOYe0BWkOAeKxbpW2EnF5nPgVjQSYgSIrIl1LRXML+zGNury8FFqpiCaFs+9ocdrq7I
 rTSLON+ZhfaV1SFT32l5h8uBmVnqR8bz05nrLFCMWxGJheToYhIdsvYfMb87dnrfkmv1
 U/vg==
X-Gm-Message-State: APjAAAV+J/uTu7njdSWrLqfuSjltSIsu0TPuF2b3GD40jpn7BJN9sdEI
 4tNWUCBIhJyp7JhghElGNahFgvCo5pTinf1dVUHwNQ==
X-Google-Smtp-Source: APXvYqxzL7/7wJOJVUvH16w+QAISOOtNnm2/b5W3JNn1FGUmUr3Uh54+UjraGD6AcXkBB/veySBVsA+RG1Rjuz032Rw=
X-Received: by 2002:aca:c64c:: with SMTP id w73mr363929oif.161.1572892369118; 
 Mon, 04 Nov 2019 10:32:49 -0800 (PST)
MIME-Version: 1.0
References: <20191101214238.78015-1-john.stultz@linaro.org>
 <20191101214238.78015-2-john.stultz@linaro.org>
 <20191103160225.GA13344@google.com>
In-Reply-To: <20191103160225.GA13344@google.com>
From: John Stultz <john.stultz@linaro.org>
Date: Mon, 4 Nov 2019 10:32:38 -0800
Message-ID: <CALAqxLXjRmWWTiQNZnypk+r7am9STd_UBDgK4b73icS8UfZwpA@mail.gmail.com>
Subject: Re: [PATCH v14 1/5] dma-buf: Add dma-buf heaps framework
To: Sandeep Patil <sspatil@google.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=CuoEqQL2KebTopf41oEH+8ZFIOF1Y0zb5FGL5THAEuM=;
 b=ZwZbZIBWQ+1OPsCtH8o21sKLwWYTv0Kawog0LE/+kqZNZkKsrkMxmIP2M2Fb9jXc7H
 PfBqNkyAv4wjM1gG1iSziv44ViPJDPX9/dSI9wUBBPa3fkwlAFoHnhh9qBZBvkqzlee9
 UVbTycJm7wH3UBOVZm0jBLDmKjfKhsthLVfDpqxEnOkFamie1kQZ1YwX6Z4xjkx4PKu1
 IAQFGY0QW6ISt3Yd7pbZg2zTQXAT6TQ1R5VemL4iN1V6uMgMOnGbP6Wq6fklFoGWEpeD
 tzQntg3Xf6gSomNDRKzSt0EiGf+gzvgF3idrJbJPMNKYifm2EjJTUaE+2oEG5hnqaSZm
 KTtw==
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
Cc: Hillf Danton <hdanton@sina.com>, Sudipto Paul <Sudipto.Paul@arm.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>, Chenbo Feng <fengc@google.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 "Andrew F. Davis" <afd@ti.com>, Christoph Hellwig <hch@infradead.org>,
 Alistair Strachan <astrachan@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hridya Valsaraju <hridya@google.com>, Pratik Patel <pratikp@codeaurora.org>,
 sspatil+mutt@google.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBOb3YgMywgMjAxOSBhdCA4OjAyIEFNIDxzc3BhdGlsQGdvb2dsZS5jb20+IHdyb3Rl
Ogo+ID4gK3N0YXRpYyBsb25nIGRtYV9oZWFwX2lvY3RsX2dldF9mZWF0dXJlcyhzdHJ1Y3QgZmls
ZSAqZmlsZSwgdm9pZCAqZGF0YSkKPiA+ICt7Cj4gPiArICAgICBzdHJ1Y3QgZG1hX2hlYXBfZ2V0
X2ZlYXR1cmVzX2RhdGEgKmhlYXBfZmVhdHVyZXMgPSBkYXRhOwo+ID4gKwo+ID4gKyAgICAgLyog
bm90aGluZyBzaG91bGQgYmUgcGFzc2VkIGluICovCj4gPiArICAgICBpZiAoaGVhcF9mZWF0dXJl
cy0+ZmVhdHVyZXMpCj4gPiArICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+Cj4gY3VyaW91
cywgd2hhdCBhcmUgd2UgdHJ5aW5nIHRvIHByb3RlY3QgaGVyZT8gVW5sZXNzIEkgbWlzdW5kZXJz
dG9vZCB0aGlzLCB5b3UKPiBhcmUgZm9yY2luZyB1c2Vyc3BhY2UgdG8gMCBpbml0aWFsaXplIHRo
ZSBzdHJ1Y3R1cmUgcGFzc2VkIGludG8gdGhlIGlvY3RsLgo+IFNvIGFuIHVuaW5pdGlhbGl6ZWQg
c3RhY2sgdmFyaWFibGUgcGFzc2VkIGludG8gaW9jdGwoKSB3aWxsIGVuZCB1cCByZXR1cm5pbmcK
PiAtRUlOVkFMIC4uIEkgYW0gbm90IHN1cmUgdGhhdHMgb2s/CgpZZWEsIHNvIHRoZSByYXRpb25h
bCBtb3N0bHkgY29tZXMgZnJvbSB0aGUgZG9jdW1lbnQgaGVyZToKICBodHRwczovL3d3dy5rZXJu
ZWwub3JnL2RvYy9Eb2N1bWVudGF0aW9uL2lvY3RsL2JvdGNoaW5nLXVwLWlvY3Rscy5yc3QKClRo
ZSBnZW5lcmFsIGlkZWEgaXMgdG8gYmUgdmVyeSBjb25zZXJ2YXRpdmUgaW4gd2hhdCB5b3UgYWNj
ZXB0IG9uCklPQ1RMcyB0byBhdm9pZCBhbnkgZXh0ZW5zaW9ucyBtYWRlIGZyb20gYnJlYWtpbmcg
ZXhpc3RpbmcgdXNlcmxhbmQuCgpVc3VhbGx5IHRoaXMgaXMgbW9zdCBjcml0aWNhbCBmb3Igd3Jp
dGUtaW9jdGxzLCBhbmQgcHJvYmFibHkgaXNuJ3QgYXMKaW1wb3J0YW50IGZvciByZWFkIG9uZXMg
bGlrZSBnZXRfZmVhdHVyZXMsIGJ1dCBJIGRvbid0IHNlZSBtdWNoCmRvd25zaWRlIHRvIGVuZm9y
Y2luZyBpdC4KCj4gUGx1cywgdGhlIHBvaW50IGlzIHBvaW50aW5nIGludG8gdGhlIGttYWxsb2Mn
ZWQgbWVtb3J5IG9yIHRoZSBsb2NhbCAnY2hhcgo+IHN0YWNrX2RhdGFbMTI4XSBmcm9tIHRoZSBp
b2N0bCgpIGZ1bmN0aW9uLCBzbyBub3Qgc3VyZSBpZiB0aGlzIGNoZWNrIHdhcwo+IGludGVudGlv
bmFsPyBJZiBzbywgbWF5IGJlIGVhc2llciB0byAwIGluaXRpYWxpemUgKmtkYXRhIGluIHRoZSBp
b2N0bAo+IGZ1bmN0aW9uIGJlbG93PwoKU28gdGhlIGJpdHMgaW4gdGhlIGtkYXRhIChiZSBpdCBr
bWFsbG9jZWQgb3Igb24gdGhlIHN0YWNrKSBpcyBhbGwKY29waWVkIG92ZXIgZnJvbSB0aGUgdXNl
cnBvaW50ZXIuIFNvIHdlJ3JlIGp1c3QgdHJ5aW5nIHRvIGVuZm9yY2UgdGhhdAp1c2VybGFuZCB6
ZXJvcyBpdCBiZWZvcmUgcGFzc2luZyBpdCBpbi4KClRoYW5rcyBhZ2FpbiBmb3IgeW91ciBvdGhl
ciBmZWVkYmFjaywgSSdsbCBhZGRyZXNzIHRoZW0gaW4gdGhlIG5leHQgcmV2aXNpb24hCgp0aGFu
a3MKLWpvaG4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
