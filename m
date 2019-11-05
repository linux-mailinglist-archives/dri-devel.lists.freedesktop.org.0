Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08594EFA65
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 11:05:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C3516E9AB;
	Tue,  5 Nov 2019 10:04:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 301A46E9AB
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 10:04:57 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id k15so8977001lja.3
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Nov 2019 02:04:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Syu30Am6BErl09auW6zTpaceggouTxknVxJ/Bz3Nu6s=;
 b=mlyf/4PeX8l1S9PcvmMZg/WNYUoPXF+sdg6zWGfUfe/JZ3mpOe7PhP8GoCUmIGKljp
 7llWXQsvt07tD5zn+xW4inzVbcuiaM+RtNnB6pZlwUorwOSXuS5EtOdFAEpWt0RvPdQa
 YJIKoH6sp3C5g2O5Ui0zN4IFDAQiWZj/r7CB/TnyD8HL5QqUTLVDXX+vQls0Jde+ehtJ
 SJedI6DKJsVT4NkgQbUI8zfP2Jm8Jv7lHidqlgpH5F6HiXrkvnKMfncAYFOboiP3zAGO
 NAS4hJMH4jElBUDsi8aEo1qLFi4KNHbsCzvusiZqAay5dSVGxkUEiGb9CIWdcLfP110J
 C2zQ==
X-Gm-Message-State: APjAAAU9IeSqftHr4DEsflGm4sg0obH+FmLHs2YWLTAsoROoDKlszVO5
 7TFWt3ajKN3Ur2aW6LTOGYn0UbPrgeWwfyx3vUVvmg==
X-Google-Smtp-Source: APXvYqzNQn4xnOeOTV9UejT9zf0JppB8XIps/M7O6A+dhmKjufcoOTliNdNUw1qqwcAYUPtRHSb50EJJlG+Vv1iRlcY=
X-Received: by 2002:a2e:9a55:: with SMTP id k21mr8950214ljj.251.1572948295656; 
 Tue, 05 Nov 2019 02:04:55 -0800 (PST)
MIME-Version: 1.0
References: <20191018154052.1276506-1-arnd@arndb.de>
 <20191018154201.1276638-38-arnd@arndb.de>
In-Reply-To: <20191018154201.1276638-38-arnd@arndb.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 5 Nov 2019 11:04:44 +0100
Message-ID: <CACRpkdajkSh6Bbvpfycm83j1GuCm+pTfw9fQS53JEfG2i07MKg@mail.gmail.com>
Subject: Re: [PATCH 38/46] video: backlight: tosa: use gpio lookup table
To: Arnd Bergmann <arnd@arndb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Syu30Am6BErl09auW6zTpaceggouTxknVxJ/Bz3Nu6s=;
 b=F3UmVNykzWHUTwNdwBuIbGn2Gmfwp0lPCaec0SGFmqb3Uet67QafNd3kCYlw6Ko+iZ
 xv75pN0y9ypmC6pikz0liwOGhAiNts/UROWuHig/DbuhUeFBXD4yqjhPU382v6bC9Ru0
 /j8rerZpggbnjA3tv+Ouiy3Tj9W/7DfdMcsnk1B6kFVShopOgMjoLO9MthZ4KIHuWxuc
 BQP4u2JN974kAVhnIVbXsl02XqxL6+gMbv3UJRx1mRF+XO8D2Fmke5YyV809sOBHqgmv
 rvgASQ5uItepUr0wXaAijVdeu8uYwD5Cz3CiEi/f3Yi1VzBKw690MH7685YqlBJAUyAK
 /oMw==
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Daniel Mack <daniel@zonque.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMTgsIDIwMTkgYXQgNTo0MyBQTSBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRi
LmRlPiB3cm90ZToKCj4gVGhlIGRyaXZlciBzaG91bGQgbm90IHJlcXVpcmUgYSBtYWNoaW5lIHNw
ZWNpZmljIGhlYWRlci4gQ2hhbmdlCj4gaXQgdG8gcGFzcyB0aGUgZ3BpbyBsaW5lIHRocm91Z2gg
YSBsb29rdXAgdGFibGUsIGFuZCBtb3ZlIHRoZQo+IHRpbWluZyBnZW5lcmF0b3IgZGVmaW5pdGlv
bnMgaW50byB0aGUgZHJpdmVycyBpdHNlbGYuCj4KPiBDYzogTGVlIEpvbmVzIDxsZWUuam9uZXNA
bGluYXJvLm9yZz4KPiBDYzogRGFuaWVsIFRob21wc29uIDxkYW5pZWwudGhvbXBzb25AbGluYXJv
Lm9yZz4KPiBDYzogSmluZ29vIEhhbiA8amluZ29vaGFuMUBnbWFpbC5jb20+Cj4gQ2M6IEJhcnRs
b21pZWogWm9sbmllcmtpZXdpY3ogPGIuem9sbmllcmtpZUBzYW1zdW5nLmNvbT4KPiBDYzogZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBsaW51eC1mYmRldkB2Z2VyLmtlcm5l
bC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+Cj4g
LS0tCj4gSSdtIG5vdCBvdmVybHkgY29uZmlkZW50IHRoYXQgSSBnb3QgdGhlIGNvcnJlY3QgZGV2
aWNlIG5hbWVzCj4gZm9yIHRoZSBsb29rdXAgdGFibGUsIGl0IHdvdWxkIGJlIGdvb2QgaWYgc29t
ZW9uZSBjb3VsZAo+IGRvdWJsZS1jaGVjay4KCllvdSdyZSBhbnl3YXkgZG9pbmcgbW9yZSB0aGFu
IHJlcXVpcmVkIGZvciB0aGUgcGVvcGxlIHdobwptYXkgb3IgbWF5IG5vdCBiZSB1c2luZyB0aGlz
IHBsYXRmb3JtLiBCcm9rZW5uZXNzIGNhbiBzdXJlbHkKYmUgZml4ZWQgbGF0ZXIsIGl0J3Mgbm90
IGxpa2Ugd2UgYXJlIHRha2luZyBkb3duIHRoZSBlbnRpcmUgQW1hem9uCmNsb3VkIG9yIHNvbWV0
aGluZy4KClJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5v
cmc+CgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
