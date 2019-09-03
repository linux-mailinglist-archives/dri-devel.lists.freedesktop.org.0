Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59518A6DE7
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 18:18:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 742B189244;
	Tue,  3 Sep 2019 16:18:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E1FD89244
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2019 16:18:25 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id n10so162973wmj.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2019 09:18:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iMuj3lFzJDWtavcpi24jefzT+zvsqLDDbpsF6XRsTu0=;
 b=DLLaLCONyNcliscRf9q9xudRZwyh+FmyNj0qQXeSxYLDITB6aGcasdXKRamXv/r05U
 B01N8vQhZAp2JlltKOZhIUXJryLB3YceFhEe7m0r1rjdz10ginLQNyT2lpNe2H+FFof+
 Cn6JpZPBPl+osBvaU/h8vPvvEHktd5BUGnXHtPSecq3RvT1vl7X1bgWQSSeUQc6VNzjS
 WCFTBd37n9BkTITD+yPVfJBuL2H3KBILkftDQymKfiORyJrDqMSHzIcVkxWXoh24HE16
 LSdMek9Xme+d+F5jVqBwZHoWxW/90SRzR4USqRUVEflWRrnpAmPfqacZRj+C2JdMh23g
 cjCA==
X-Gm-Message-State: APjAAAW5+HzoMSYcljBLnUtDe7X+snA0KG/G/Y3O8NhLw6VDeDNEailh
 +fvi+vVFKEHdIiaI/Fa12O4ezuL4MfvS4jqHlcoNrA==
X-Google-Smtp-Source: APXvYqx5VExSHiCv9ahZNo4EZC6hNa48Mc2gIFoxrZJw+iuRJtwxjb7xHPC9NF6neLHfLLi9w6sv5MHQTKfGdPISbes=
X-Received: by 2002:a1c:7215:: with SMTP id n21mr114167wmc.152.1567527504112; 
 Tue, 03 Sep 2019 09:18:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190829060550.62095-1-john.stultz@linaro.org>
 <CGME20190829173938epcas3p1276089cb3d6f9813840d1bb6cac8b1da@epcas3p1.samsung.com>
 <CAF6AEGvborwLmjfC6_vgZ-ZbfvF3HEFFyb_NHSLRoYWF35bw+g@mail.gmail.com>
 <ebdf3ff5-5a9b-718d-2832-f326138a5b2d@samsung.com>
 <CAF6AEGtkvRpXSoddjmxer2U6LxnV_SAe+jwE2Ct8B8dDpFy2mA@mail.gmail.com>
 <b925e340-4b6a-fbda-3d8d-5c27204d2814@samsung.com>
In-Reply-To: <b925e340-4b6a-fbda-3d8d-5c27204d2814@samsung.com>
From: John Stultz <john.stultz@linaro.org>
Date: Tue, 3 Sep 2019 09:18:12 -0700
Message-ID: <CALAqxLU5Ov+__b5gxnuMxQP1RLjndXkB4jAiGgmb-OMdaKePug@mail.gmail.com>
Subject: Re: [RFC][PATCH] drm: kirin: Fix dsi probe/attach logic
To: Andrzej Hajda <a.hajda@samsung.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=iMuj3lFzJDWtavcpi24jefzT+zvsqLDDbpsF6XRsTu0=;
 b=LjgQiyjJt874qQEMVACZLuLXWgH0h1CPNZgTJGRSAsFz7dOyy4otRrKvPnbUGiX/6u
 r2uwm6uQOXyS4Uy8I2Rzdj6hmje4idltDWDYxhsq2zaev2Nm6i03RCtyl5FWpezoyOoz
 mu7EyelyLNWaCPI9StcMwoWnV9wU77iTM2z1GdGn31/rukOJi3q1ECuFb4bBXe5YyV1c
 S1Mm3LVEqEY/snswn8gflBX7uBuJOIxcIqHCAH/Dhk2737W1zEzGa5IaEdlx4rQ0zIaU
 5vvJV5PGHz5c2SdsGcHbWXNXA6mF8VGK1FVHrj9rr/mcScwZflCmyIcpiy7vxa7jWOq8
 CIBQ==
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, lkml <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Rongrong Zou <zourongrong@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Matt Redfearn <matt.redfearn@thinci.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMiwgMjAxOSBhdCA2OjIyIEFNIEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ft
c3VuZy5jb20+IHdyb3RlOgo+IE9uIDMwLjA4LjIwMTkgMTk6MDAsIFJvYiBDbGFyayB3cm90ZToK
PiA+IE9uIFRodSwgQXVnIDI5LCAyMDE5IGF0IDExOjUyIFBNIEFuZHJ6ZWogSGFqZGEgPGEuaGFq
ZGFAc2Ftc3VuZy5jb20+IHdyb3RlOgo+ID4+IE9mIGNvdXJzZSBpdCBzZWVtcyB5b3UgaGF2ZSBk
aWZmZXJlbnQgb3BpbmlvbiB3aGF0IGlzIHRoZSByaWdodCB0aGluZyBpbgo+ID4+IHRoaXMgY2Fz
ZSwgc28gaWYgeW91IGNvbnZpbmNlIHVzIHRoYXQgeW91ciBhcHByb2FjaCBpcyBiZXR0ZXIgb25l
IGNhbgo+ID4+IHJldmVydCB0aGUgcGF0Y2guCj4gPiBJIGd1ZXNzIG15IHN0cm9uZ2VzdCAvIG1v
c3QgaW1tZWRpYXRlIG9waW5pb24gaXMgdG8gbm90IGJyZWFrIG90aGVyCj4gPiBleGlzdGluZyBh
ZHY3NXh4IGJyaWRnZSB1c2Vycy4KPgo+Cj4gSXQgaXMgcGl0eSB0aGF0IGJyZWFrYWdlIGhhcHBl
bmVkLCBhbmQgbmV4dCB0aW1lIHdlIHNob3VsZCBiZSBtb3JlCj4gc3RyaWN0IGFib3V0IHRlc3Rp
bmcgb3RoZXIgcGxhdGZvcm1zLCBiZWZvcmUgcGF0Y2ggYWNjZXB0YW5jZS4KPgo+IEJ1dCByZXZl
cnRpbmcgaXQgbm93IHdpbGwgYnJlYWsgYWxzbyBwbGF0Zm9ybSB3aGljaCBkZXBlbmQgb24gaXQu
CgpJJ20gcmVhbGx5IG9mIG5vIG9waW5pb24gb2Ygd2hpY2ggYXBwcm9hY2ggaXMgYmV0dGVyIGhl
cmUsIGJ1dCBJIHdpbGwKc2F5IHRoYXQgd2hlbiBhIHBhdGNoIGJyZWFrcyBwcmV2aW91c2x5IHdv
cmtpbmcgYm9hcmRzLCB0aGF0J3MgYQpyZWdyZXNzaW9uIGFuZCBqdXN0aWZ5aW5nIHRoYXQgc29t
ZSBvdGhlciBib2FyZCBpcyBub3cgZW5hYmxlZCB0aGF0CndvdWxkIGJlIGJyb2tlbiBieSB0aGUg
cmV2ZXJ0IChvZiBhIHBhdGNoIHRoYXQgaXMgbm90IHlldCB1cHN0cmVhbSkKaXNuJ3QgcmVhbGx5
IGEgc3Ryb25nIGFyZ3VtZW50LgoKSSdtIGhhcHB5IHRvIHdvcmsgd2l0aCBmb2xrcyB0byB0cnkg
dG8gZml4dXAgdGhlIGtpcmluIGRyaXZlciBpZiB0aGlzCnBhdGNoIHJlYWxseSBpcyB0aGUgcmln
aHQgYXBwcm9hY2gsIGJ1dCB3ZSBuZWVkIHNvbWVvbmUgdG8gZG8gdGhlIHNhbWUKZm9yIHRoZSBk
YjQxMGMsIGFuZCBJIGRvbid0IHRoaW5rIGl0cyBmYWlyIHRvIGp1c3QgZHVtcCB0aGF0IHdvcmsg
b250bwpmb2xrcyB1bmRlciB0aGUgdGhyZWF0IG9mIHRoZSBib2FyZCBicmVha2luZy4KCnRoYW5r
cwotam9obgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
