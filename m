Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79090B7F6D
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 18:53:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83D616F536;
	Thu, 19 Sep 2019 16:53:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1E036F536
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 16:53:43 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 122F321928
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 16:53:43 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id u186so4103628qkc.5
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 09:53:43 -0700 (PDT)
X-Gm-Message-State: APjAAAVIH72cWm/EgQox53RDf2QI+PAKAozXRllDggQg3ImJGhK9OEjm
 rVcVVsuGc/7KKWnK9O0an4IRYkbbkZ1BJw0heQ==
X-Google-Smtp-Source: APXvYqz2I7+d2ST7dqTncIUVd79T+TgL3EwsoQ408VFi3nroSJ0HjZZSQ1StT9xLMNL7INlnAComuhodW8LklS4qtxU=
X-Received: by 2002:a05:620a:549:: with SMTP id
 o9mr4018717qko.223.1568912022261; 
 Thu, 19 Sep 2019 09:53:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190913160310.50444-1-steven.price@arm.com>
In-Reply-To: <20190913160310.50444-1-steven.price@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 19 Sep 2019 11:53:31 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKnyGpU-W1s-LbwPh6huLxWeW4-onD91fknUe0DO3DwdA@mail.gmail.com>
Message-ID: <CAL_JsqKnyGpU-W1s-LbwPh6huLxWeW4-onD91fknUe0DO3DwdA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panfrost: Prevent race when handling page fault
To: Steven Price <steven.price@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1568912023;
 bh=FFjfzYLjbs6xiYqzb5TUJVAKnXU4IQmkmRJVbwHd9kQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=X5FHl49n9rz4MbQ8i9Mta4NQgCpNcRFFwra4mQrtdHclDL/kI0RmP2Xyy1nbN5STk
 sZPVsme46Ws+NDePKeKaEq/reeT7D2S9MuY0ZtpQ/MlxfqBc6zmBNSQhqY8s30GNAg
 G26st+c838VrD7na2hPqx9AXs1/KUJ4zc7Y05RBU=
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMTMsIDIwMTkgYXQgMTE6MDMgQU0gU3RldmVuIFByaWNlIDxzdGV2ZW4ucHJp
Y2VAYXJtLmNvbT4gd3JvdGU6Cj4KPiBXaGVuIGhhbmRsaW5nIGEgR1BVIHBhZ2UgZmF1bHQgYWRk
cl90b19kcm1fbW1fbm9kZSgpIGlzIHVzZWQgdG8KPiB0cmFuc2xhdGUgdGhlIEdQVSBhZGRyZXNz
IHRvIGEgYnVmZmVyIG9iamVjdC4gSG93ZXZlciBpdCBpcyBwb3NzaWJsZSBmb3IKPiB0aGUgYnVm
ZmVyIG9iamVjdCB0byBiZSBmcmVlZCBhZnRlciB0aGUgZnVuY3Rpb24gaGFzIHJldHVybmVkIHJl
c3VsdGluZwo+IGluIGEgdXNlLWFmdGVyLWZyZWUgb2YgdGhlIEJPLgo+Cj4gQ2hhbmdlIGFkZHJf
dG9fZHJtX21tX25vZGUgdG8gcmV0dXJuIHRoZSBwYW5mcm9zdF9nZW1fb2JqZWN0IHdpdGggYW4K
PiBleHRyYSByZWZlcmVuY2Ugb24gaXQsIHByZXZlbnRpbmcgdGhlIEJPIGZyb20gYmVpbmcgZnJl
ZWQgdW50aWwgYWZ0ZXIKPiB0aGUgcGFnZSBmYXVsdCBoYXMgYmVlbiBoYW5kbGVkLgo+Cj4gU2ln
bmVkLW9mZi1ieTogU3RldmVuIFByaWNlIDxzdGV2ZW4ucHJpY2VAYXJtLmNvbT4KPiAtLS0KPiBD
aGFuZ2VzIHNpbmNlIHYxOgo+ICAqIEhvbGQgdGhlIG1tX2xvY2sgYXJvdW5kIGRybV9tbV9mb3Jf
ZWFjaF9ub2RlKCkKPgo+IEkndmUgYWxzbyBwb3N0ZWQgYSBuZXcgSUdUIHRlc3QgZm9yIHRoaXM6
Cj4gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzMzMDUxMy8KPgo+ICBk
cml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfbW11LmMgfCA1NSArKysrKysrKysrKysr
KysrLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspLCAxOSBkZWxl
dGlvbnMoLSkKCkFwcGxpZWQuCgpSb2IKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
