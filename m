Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C06EC24EC7
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 14:17:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7E7E892EF;
	Tue, 21 May 2019 12:17:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A98E892EF;
 Tue, 21 May 2019 12:17:04 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id q16so4639589ljj.8;
 Tue, 21 May 2019 05:17:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=A140ZmHJV4l/9kENUMHZ0Ttn87p73wvOKynmugbF5Z8=;
 b=fgVKEHae5/gbjvtIyWwDidfo/cbfeejCojLG3qn2n/tsjyeziFFnvISEcHEk7MpnsB
 WVMwuiZ5BNvayUnm5H1zoMc3jpinVj/MNfrvvafIj5v1ZnDQL0lkLtEDS4SoQ9Q4UpsJ
 wU8Mz8t4nVK3ttOL6x6uQwqfSwKJM2wJF/JB1k5aVDmYSpam5/7QmmFGA5wsBGoO82qk
 F840U5YvEgMpylzd6536+wBbgdU7LdJKq4zQmaVAy2OkYlSQF/RH+vvIF7n0uuFuMDfS
 KcWJgvtu8NtnuXqLE2GU1bI/5lzqfigVIhOd3k/dKHlNwUQfsW2UG8gOBKrwTpi7UWkR
 ytsg==
X-Gm-Message-State: APjAAAVclCQuJJBCQ/hadJmoFrNwJMXbVnAxBNO1+1prC1Lfk960+aBF
 OHezrhPACDjmwE9IlEwChSXGXBmrG+9YQXb8RsY=
X-Google-Smtp-Source: APXvYqyH1wIWFUuhPb8CpBZJ42MJkHRE97o21fOVYa6BYU83IYYUoCGnNM8I/oU202vNopLST1Ed1qINNg0Z7Beb8P0=
X-Received: by 2002:a2e:6c0b:: with SMTP id h11mr5829601ljc.15.1558441022823; 
 Tue, 21 May 2019 05:17:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190520231649.24595-1-nunes.erico@gmail.com>
 <cff4f34a-c604-b662-c250-15c426062601@amd.com>
In-Reply-To: <cff4f34a-c604-b662-c250-15c426062601@amd.com>
From: Erico Nunes <nunes.erico@gmail.com>
Date: Tue, 21 May 2019 14:16:51 +0200
Message-ID: <CAK4VdL2jtyFXDXY1VvVXp=buk4tbY__eqAW5b7nigxuZaw6Wvw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/scheduler: Fix job cleanup without timeout handler
To: "Koenig, Christian" <Christian.Koenig@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=A140ZmHJV4l/9kENUMHZ0Ttn87p73wvOKynmugbF5Z8=;
 b=DVgj6P0+w24IM2ursAwonrfkOGDqGkyiP4+QxrjGVjTgUbaseZyiTudETq3Haz9264
 xLNj2ClVgr/Kj4I/bYVBw2xMsha+FUom+lsGiTwxk4W6az3ef75H5lfb/schjX/E8LXa
 5i+Jmo4ClWZP+/fp93AsabdNKRY7HWOZtG9YR8701X3AsJOZdWDzroWpWR4uaplGyU/y
 nkRHRyo9DumVhdymf17u7W06lP6wtKzVDw+iHPhzpYzdYElzxFe6CGvlTOy1spiPtmaj
 /cFurHe6XH8rK+VzjL91rJ41yuGKs3H4EJq/NMupEhorG6a2OY/IAbI3To+rnbw+yJDE
 ZmKw==
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
Cc: "lima@lists.freedesktop.org" <lima@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, Sharat Masetty <smasetty@codeaurora.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Nayan Deshmukh <nayan26deshmukh@gmail.com>, Qiang Yu <yuq825@gmail.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMjEsIDIwMTkgYXQgODo0NyBBTSBLb2VuaWcsIENocmlzdGlhbgo8Q2hyaXN0
aWFuLktvZW5pZ0BhbWQuY29tPiB3cm90ZToKPgo+IEFtIDIxLjA1LjE5IHVtIDAxOjE2IHNjaHJp
ZWIgRXJpY28gTnVuZXM6Cj4gPiBbQ0FVVElPTjogRXh0ZXJuYWwgRW1haWxdCj4gPgo+ID4gQWZ0
ZXIgIjU5MTgwNDVjNGVkNCBkcm0vc2NoZWR1bGVyOiByZXdvcmsgam9iIGRlc3RydWN0aW9uIiwg
am9icyBhcmUKPiA+IG9ubHkgZGVsZXRlZCB3aGVuIHRoZSB0aW1lb3V0IGhhbmRsZXIgaXMgYWJs
ZSB0byBiZSBjYW5jZWxsZWQKPiA+IHN1Y2Nlc3NmdWxseS4KPiA+Cj4gPiBJbiBjYXNlIG5vIHRp
bWVvdXQgaGFuZGxlciBpcyBydW5uaW5nICh0aW1lb3V0ID09IE1BWF9TQ0hFRFVMRV9USU1FT1VU
KSwKPiA+IGpvYiBjbGVhbnVwIHdvdWxkIGJlIHNraXBwZWQgd2hpY2ggbWF5IHJlc3VsdCBpbiBt
ZW1vcnkgbGVha3MuCj4gPgo+ID4gQWRkIHRoZSBoYW5kbGluZyBmb3IgdGhlICh0aW1lb3V0ID09
IE1BWF9TQ0hFRFVMRV9USU1FT1VUKSBjYXNlIGluCj4gPiBkcm1fc2NoZWRfY2xlYW51cF9qb2Jz
Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEVyaWNvIE51bmVzIDxudW5lcy5lcmljb0BnbWFpbC5j
b20+Cj4gPiBDYzogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+
Cj4gUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNv
bT4KPgo+IEdvaW5nIHRvIHBpY2sgdGhhdCB1cCBsYXRlciB0b2RheSBpbnRvIG91ciBpbnRlcm5h
bCBicmFuY2guCgpUaGFua3MuIEkgYWxzbyBwb3N0ZWQgb25lIHRvIHNldCBsaW1hIHRvIHVzZSBh
IHJlYWwgZGVmYXVsdCB0aW1lb3V0LgoKSXMgaXQgcG9zc2libGUgZm9yIHVzIHRvIHN0aWxsIGdl
dCBhdCBsZWFzdCBvbmUgb2YgdGhlc2UgaW50byBhIHRyZWUKdGhhdCBnb2VzIHRvIGEgbGludXgg
NS4yLXJjPwpUaGlzIGlzc3VlIG1heSBtYWtlIGxpbWEgdW51c2FibGUgYXMgdGhlIHN5c3RlbSBy
dW5zIG91dCBvZiBtZW1vcnkKcXVpY2tseSBpZiBtYW55IG9wZW5nbCBwcm9ncmFtcyBhcmUgbGF1
bmNoZWQuCgpFcmljbwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
