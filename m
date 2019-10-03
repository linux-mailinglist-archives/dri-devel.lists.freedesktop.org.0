Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1D9C9781
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 06:37:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B62366E103;
	Thu,  3 Oct 2019 04:37:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E3656E103
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 04:37:25 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id c6so2384606ioo.13
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Oct 2019 21:37:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MlekqaDeWFJgEd5A1fBRjx/7k1tl63XnhZuTSyHIz4o=;
 b=c850F0CJpDn7iGNAGJeQAETXjKiPhjJSagF4yuNiiS0no496Gwh4y/GXWM08fIpjWl
 YG3JZ+/N+xlYkVUE3G8pUN/7Ti5EA5QPwxGOXvYa95ouD7aYhUjat+3+X5J1+RH/lLoI
 79+rFG+XG+OAG4VFkssTp4kShCyM/+KcdOmIC92noEP0PFY5ijGcgw2XUA2wy42Hi0rP
 t1XHNLdgaV3du9laJgrOU8PQO4Y7pFGKJloVL1JAzPQKwzdx3OBttSmq7d5p3EzM2G3R
 lLHawOhbQpYJ/Rt2gLHUc4L/zeO5N0Ay8dDRDS3AZDHHnxtyhLKVerWD+UGLNcETJeiZ
 teMQ==
X-Gm-Message-State: APjAAAUiDoSLkwAdPa80DK7qCLHoucDkj6MwELNiO7TlLb4UMM7u2Ww8
 hS91ru9vXJoQYVTYjcrLflduhG0rY4/q2N6rLyaifw==
X-Google-Smtp-Source: APXvYqwIWNbnxgMtuGs8BYHnctnPvSODa9WWOtei664E5I8ipwXWBsAKeY9LVmjih5hknlLYsQ8lj89ZirBa1m/Sfzg=
X-Received: by 2002:a92:c74d:: with SMTP id y13mr8131989ilp.77.1570077444611; 
 Wed, 02 Oct 2019 21:37:24 -0700 (PDT)
MIME-Version: 1.0
References: <20191001080253.6135-1-icenowy@aosc.io>
 <20191001080253.6135-3-icenowy@aosc.io>
In-Reply-To: <20191001080253.6135-3-icenowy@aosc.io>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 3 Oct 2019 10:07:13 +0530
Message-ID: <CAMty3ZC-5czGhOwtk7pE+JGbMRKxo7GrpUgnX3dpY8Jt5j_Afg@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH 2/3] drm/sun4i: dsi: fix DRQ calculation
To: Icenowy Zheng <icenowy@aosc.io>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=MlekqaDeWFJgEd5A1fBRjx/7k1tl63XnhZuTSyHIz4o=;
 b=N2K/o9viZlp1wU82nZeoxpgVml0anhGjTES+V5f7ZmBrN6KXsn0+yIR9qkonlHBcoT
 QTHH63dWxWdeC69Z26P8Len8fBpb+sf26Th2APGZEmm/zT4fcBOA9pShLkEbLizr1o/a
 j6JdKtQ/qw8Yu2WVUJFzygEFLvK0EOs3C2ihQ=
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
Cc: David Airlie <airlied@linux.ie>, linux-sunxi <linux-sunxi@googlegroups.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <mripard@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBUdWUsIE9jdCAxLCAyMDE5IGF0IDE6MzQgUE0gSWNlbm93eSBaaGVuZyA8aWNlbm93
eUBhb3NjLmlvPiB3cm90ZToKPgo+IEFjY29yZGluZyB0byB0aGUgQlNQIHNvdXJjZSBjb2RlLCB3
aGVuIGNhbGN1bGF0aW5nIHRoZSBtYWdpYyBEUlEgdmFsdWUKPiBvdXRzaWRlIGJ1cnN0IG1vZGUs
IGEgZm9ybXVsYSBvZiAibGNkX2h0IC0gbGNkX3ggLSBsY2RfaGJwIiwgd2hpY2ggaXMKPiBpbnRl
cnByZXRlZCBhcyByaWdodCBtYXJnaW4gKEhGUCB2YWx1ZSkuIEhvd2V2ZXIsIGN1cnJlbnRseSB0
aGUKPiBzdW42aV9taXBpX2RzaSBkcml2ZXIgY29kZSBjYWxjdWxhdGVzIGl0IHdyb25nbHkgYXMg
SEZQICsgc3luYyBsZW5ndGgsCj4gd2hpY2ggbGVhZCB0byB0aW1pbmcgZXJyb3IuCj4KPiBGaXgg
dGhlIERSUSBjYWxjdWxhdGlvbiBieSBjaGFuZ2UgaXQgdG8gdXNlIEhGUC4KPgo+IFNpZ25lZC1v
ZmYtYnk6IEljZW5vd3kgWmhlbmcgPGljZW5vd3lAYW9zYy5pbz4KPiAtLS0KPiAgZHJpdmVycy9n
cHUvZHJtL3N1bjRpL3N1bjZpX21pcGlfZHNpLmMgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vc3VuNGkvc3VuNmlfbWlwaV9kc2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9z
dW42aV9taXBpX2RzaS5jCj4gaW5kZXggYzg2ZTExNjMxZWJjLi4yZDNlODIyYTc3MzkgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjZpX21pcGlfZHNpLmMKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNmlfbWlwaV9kc2kuYwo+IEBAIC00MzYsOSArNDM2LDkg
QEAgc3RhdGljIHZvaWQgc3VuNmlfZHNpX3NldHVwX2J1cnN0KHN0cnVjdCBzdW42aV9kc2kgKmRz
aSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNVTjZJX0RTSV9CVVJTVF9MSU5FX1NZ
TkNfUE9JTlQoU1VONklfRFNJX1NZTkNfUE9JTlQpKTsKPgo+ICAgICAgICAgICAgICAgICB2YWwg
PSBTVU42SV9EU0lfVENPTl9EUlFfRU5BQkxFX01PREU7Cj4gLSAgICAgICB9IGVsc2UgaWYgKCht
b2RlLT5oc3luY19lbmQgLSBtb2RlLT5oZGlzcGxheSkgPiAyMCkgewo+ICsgICAgICAgfSBlbHNl
IGlmICgobW9kZS0+aHN5bmNfc3RhcnQgLSBtb2RlLT5oZGlzcGxheSkgPiAyMCkgewo+ICAgICAg
ICAgICAgICAgICAvKiBNYWFhYWFhZ2ljICovCj4gLSAgICAgICAgICAgICAgIHUxNiBkcnEgPSAo
bW9kZS0+aHN5bmNfZW5kIC0gbW9kZS0+aGRpc3BsYXkpIC0gMjA7Cj4gKyAgICAgICAgICAgICAg
IHUxNiBkcnEgPSAobW9kZS0+aHN5bmNfc3RhcnQgLSBtb2RlLT5oZGlzcGxheSkgLSAyMDsKCkkg
aGF2ZSBzaW1pbGFyIHBhdGNoIGluIHRoZSBNTCwgd2hpY2ggcmVxdWlyZWQgY29tbWl0IGRldGFp
bHMKY29tbWVudGVkIGJ5IENoZW4tWXUgWzFdLiBTbywgSSdtIHRyeWluZyB0byBzZW5kIGl0IGFj
Y29yZGluZ2x5LCBsZXQKbWUga25vdyBpZiB5b3UgaGF2ZSBpc3N1ZXMuCgpbMV0gaHR0cHM6Ly9w
YXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzMwNTkyMC8KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
