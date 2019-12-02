Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B75D10E942
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 12:06:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CE0F89D30;
	Mon,  2 Dec 2019 11:06:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A098F89D30
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 11:06:53 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id j6so30543799lja.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2019 03:06:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fqvFCSoiMROC8PKnR57NyUtZIgb+WnMib9i7dpJPeHY=;
 b=Pa2N7sqTsZ9CsNy5eY9icDW847/SjCkFXaZY0two2ZtZxaCJD1Olaz2rx2V8R2WVew
 86tc/wQ6IFtctqYUAnw153m+VzlMmyWffxxhlwd9Q1DLRH2jTdA3y2SpaZofHR9RO1yE
 1f5LySnc7XfmvKSP2XBWf04qeVfYoe4pzoYXAbozPY4pYnO37znRC04LRcs2+aqQO+t9
 ZYJxFo+szy4TnoS/b2uOpHLmIkWOx7sSfGJEMTqnUgjalYDN0KCxvxgdssF4+iigZonw
 OMZWuTeTkVSFrLWSWLX3oAsV1alAjCvR1LU93rQjjb+5FtY899phJ2WJqmGnfiHE4p+L
 uvlA==
X-Gm-Message-State: APjAAAX5dBhYCur14vyH3ADs3PsfJ7Q1HLDvieqx0mYZvgslnEdyTbdR
 nsy7hMBgauVoEdIvEmKZWN/8JHre1zHSh+JEnu41Sg==
X-Google-Smtp-Source: APXvYqzg0wuX6ZpIIMTZb5o7ylczQhT/yjJGKLrTZywwR5ZuTYOfgfOIK0IHbZS8WBRM2wH/HPb1M59oU60Dzu1/FTs=
X-Received: by 2002:a2e:8045:: with SMTP id p5mr1848420ljg.251.1575284812004; 
 Mon, 02 Dec 2019 03:06:52 -0800 (PST)
MIME-Version: 1.0
References: <20191202103028.102770-1-linus.walleij@linaro.org>
 <20191202104249.GB4929@pendragon.ideasonboard.com>
In-Reply-To: <20191202104249.GB4929@pendragon.ideasonboard.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 2 Dec 2019 12:06:40 +0100
Message-ID: <CACRpkdZTmrRvUpjxRpgTKOu0w1hX+zOemyekLA5DmY6YS2q6nA@mail.gmail.com>
Subject: Re: [PATCH] backlight: bd6107: Convert to use GPIO descriptor
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=fqvFCSoiMROC8PKnR57NyUtZIgb+WnMib9i7dpJPeHY=;
 b=DepHK/MbrQRLfF1qDM8dOIzxSfYDjTRQXWwfNcbD6IzRpDzouX/cidzUZHcBI4Q0ju
 Cg+AciE4lWe7oiRxhLTnkMng1kTZBX82BLg0Ssm1Mbi4AtCgslWgZyhtZK3L5CPw7UvX
 dy9UNS7e7q/JAefyamG/d6dltpkUOzyysuETLqCmV27/X/EnzBGumyscS68VsImZrg92
 cDg+1x4NWrUhEqClFVerHwv2ZRzAbaTZZMX774EZZJO5CELtGdMQegRa99QzTQUM71nC
 vhfsPoIgW8h/SwsR22mcOs45Im6r23aHPcZo+0aKslrqxM0JePXpEFLAj0Kk24hEyEKx
 FZtQ==
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
Cc: Jingoo Han <jingoohan1@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, Lee Jones <lee.jones@linaro.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBEZWMgMiwgMjAxOSBhdCAxMTo0MiBBTSBMYXVyZW50IFBpbmNoYXJ0CjxsYXVyZW50
LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+IHdyb3RlOgo+IE9uIE1vbiwgRGVjIDAyLCAyMDE5
IGF0IDExOjMwOjI4QU0gKzAxMDAsIExpbnVzIFdhbGxlaWogd3JvdGU6Cj4gPiBUaGUgUm9obSBC
RDYxMDcgZHJpdmVyIGNhbiBwYXNzIGEgZml4ZWQgR1BJTyBsaW5lIHVzaW5nIHRoZSBvbGQKPiA+
IEdQSU8gQVBJIHVzaW5nIHBsYXRmb3JtIGRhdGEuIEFzIHRoZXJlIGFyZSBubyBpbi10cmVlIHVz
ZXJzIG9mIHRoaXMKPiA+IHBsYXRmb3JtIGRhdGEgc2luY2UgMjAxMywgd2UgY2FuIGNvbnZlcnQg
dGhpcyB0byB1c2UgYSBHUElPIGRlc2NyaXB0b3IKPiA+IGFuZCByZXF1aXJlIGFueSBvdXQtb2Yt
dHJlZSBjb25zdW1lcnMgdG8gcGFzcyB0aGUgR1BJTyB1c2luZwo+ID4gYSBtYWNoaW5lIGRlc2Ny
aXB0b3IgdGFibGUgaW5zdGVhZC4KPgo+IE9yIGJldHRlciwgY29udmVydGluZyB0byBEVCA6LSkK
ClllYWggcmlnaHQgbm93IG15IG9iamVjdGl2ZSBpcyBqdXN0IHRvIGdldCB0aGUgb2xkIEdQSU8g
QVBJCm91dCBvZiB0aGUga2VybmVsLCBzbyBJJ20gZm9jdXNpbmcgb24gdGhhdC4KCj4gPiBDYzog
TGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgo+ID4g
U2lnbmVkLW9mZi1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgo+
Cj4gUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNv
bmJvYXJkLmNvbT4KPgo+IEhvdyBhYm91dCBnb2luZyBvbmUgc3RlcCBmdXJ0aGVyIGFuZCByZW1v
dmluZyBwbGF0Zm9ybSBkYXRhIHN1cHBvcnQgaW4gYQo+IHNlY29uZCBwYXRjaCA/CgpUaGF0IHNl
ZW1zIHRvIG1hbmRhdGUgYWxzbyBhZGRpbmcgYSBEVCBiaW5kaW5nIGFuZCBwcm9iZSBwYXRoCmZv
ciBEVCBvdGhlcndpc2UgdGhlcmUgaXMgbm8gd2F5IHRvIHByb2JlIHRoZSBkcml2ZXIgYXQgYWxs
IDpQLCBhbmQKSSB3b3VsZCByZWFsbHkgbmVlZCB0byBoYXZlIHRoZSBoYXJkd2FyZSB0byB0ZXN0
IHdpdGgKZm9yIHRoYXQuCgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
