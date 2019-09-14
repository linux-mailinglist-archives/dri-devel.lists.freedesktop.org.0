Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C81AB2BF8
	for <lists+dri-devel@lfdr.de>; Sat, 14 Sep 2019 17:43:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C1706F520;
	Sat, 14 Sep 2019 15:43:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B005A6F520
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Sep 2019 15:43:35 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id p2so28288823edx.11
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Sep 2019 08:43:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7hV0MZv/AgzA3SV2umv+bCKTqcvOG8PODShBqrdIfPQ=;
 b=fsx8aRKR5rR/jqd0K+gbjqfDh35ahehpmj5xfcH2649IzLPSN9QcmgHOZn5kQTm6px
 yGX2CyD9UmRQtrAmgoa3r+m/b6M7fEdWIvYNHFsIuA6Ez8Yc2mkAeq5lqtWQilLHhJLc
 Jty//JiQ1gCHa1W5HPkLNYHSFEW/KRVH64dLdXdWXezTxmFkbvvJRDyPF+uFdTvVkoX5
 IprsteN3cEimMKU+FYGNeJDN8DleLrDEr4oxwdkLsYIPMPR3oskDqriIB31XLz1aErpI
 FQ4Zl5HkGJrq1x2A/9utqk60iPnt7vNykLKpVy4su6onxKu8kb/mIu8oisDHK4p+MKG0
 Lcmg==
X-Gm-Message-State: APjAAAXVsoFlUdtig7QEXCCdVpCX+I7+Hgy01gpElt2ubuVeCRZvMaRM
 L63rrQPmAtpQXl4i82P8sinawW5ESMoBXpwO7/c=
X-Google-Smtp-Source: APXvYqznWW+0BxbJIAZP+1jswzi3dJcuHQKsaGdvPEqC2+VRjJW+e/KQnSnQZLZAE+WOXWyylHlrTrrhBE6G1kOrBB0=
X-Received: by 2002:a17:906:2451:: with SMTP id
 a17mr35125242ejb.164.1568475814084; 
 Sat, 14 Sep 2019 08:43:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190829060550.62095-1-john.stultz@linaro.org>
 <CGME20190829173938epcas3p1276089cb3d6f9813840d1bb6cac8b1da@epcas3p1.samsung.com>
 <CAF6AEGvborwLmjfC6_vgZ-ZbfvF3HEFFyb_NHSLRoYWF35bw+g@mail.gmail.com>
 <ebdf3ff5-5a9b-718d-2832-f326138a5b2d@samsung.com>
 <CAF6AEGtkvRpXSoddjmxer2U6LxnV_SAe+jwE2Ct8B8dDpFy2mA@mail.gmail.com>
 <b925e340-4b6a-fbda-3d8d-5c27204d2814@samsung.com>
 <CALAqxLU5Ov+__b5gxnuMxQP1RLjndXkB4jAiGgmb-OMdaKePug@mail.gmail.com>
 <9d31af23-8a65-d8e8-b73d-b2eb815fcd6f@samsung.com>
 <CALAqxLVP=x9+p9scGyfgFUMN2di+ngOz9-fWW=A1YCM4aN7JRA@mail.gmail.com>
In-Reply-To: <CALAqxLVP=x9+p9scGyfgFUMN2di+ngOz9-fWW=A1YCM4aN7JRA@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Sat, 14 Sep 2019 08:43:23 -0700
Message-ID: <CAF6AEGsaE9M_kyRxm5en1vxs=GQLcaaJsdREfR1kdegz8dHFcA@mail.gmail.com>
Subject: Re: [RFC][PATCH] drm: kirin: Fix dsi probe/attach logic
To: John Stultz <john.stultz@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=7hV0MZv/AgzA3SV2umv+bCKTqcvOG8PODShBqrdIfPQ=;
 b=HHVrhAInl82Mt5UsRke9ItQ0hbKadb+zGyYFA2p7t//I6afWDUISogJqVeDIgX70rN
 2JoXv5bkW2gTazwZ1tl6AsjMz4JNQmxPdneG27ankkEszRU4ngNGrzqEUqK7Tk5sGjem
 2k/2tf6Dg4eGCmrhx+CppejtiKG7Fi1RJqduFWOBFVLUf1ddwq2BjdOI6PZLY2LP+9My
 pcwqa0fmyhOpE0rpLHtsO0tGxQPDVrhA+UrJBKv/2+KhuZtsRy9y8sjnvSIn1/bENLuG
 HLQNLxPKdGPzuZ0DPN2dS1GESs5GBmzd9YDfBLDRBuc3wquzW7iv+3HRrGfZfp+5RL47
 F0tg==
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
Cc: Amit Pundir <amit.pundir@linaro.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
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

T24gV2VkLCBTZXAgMTEsIDIwMTkgYXQgNzozOSBQTSBKb2huIFN0dWx0eiA8am9obi5zdHVsdHpA
bGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIFNlcCA0LCAyMDE5IGF0IDM6MjYgQU0gQW5k
cnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4gd3JvdGU6Cj4gPiBPbiAwMy4wOS4yMDE5
IDE4OjE4LCBKb2huIFN0dWx0eiB3cm90ZToKPiA+ID4gT24gTW9uLCBTZXAgMiwgMjAxOSBhdCA2
OjIyIEFNIEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+IHdyb3RlOgo+ID4gPj4g
T24gMzAuMDguMjAxOSAxOTowMCwgUm9iIENsYXJrIHdyb3RlOgo+ID4gPj4+IE9uIFRodSwgQXVn
IDI5LCAyMDE5IGF0IDExOjUyIFBNIEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+
IHdyb3RlOgo+ID4gPj4+PiBPZiBjb3Vyc2UgaXQgc2VlbXMgeW91IGhhdmUgZGlmZmVyZW50IG9w
aW5pb24gd2hhdCBpcyB0aGUgcmlnaHQgdGhpbmcgaW4KPiA+ID4+Pj4gdGhpcyBjYXNlLCBzbyBp
ZiB5b3UgY29udmluY2UgdXMgdGhhdCB5b3VyIGFwcHJvYWNoIGlzIGJldHRlciBvbmUgY2FuCj4g
PiA+Pj4+IHJldmVydCB0aGUgcGF0Y2guCj4gPiA+Pj4gSSBndWVzcyBteSBzdHJvbmdlc3QgLyBt
b3N0IGltbWVkaWF0ZSBvcGluaW9uIGlzIHRvIG5vdCBicmVhayBvdGhlcgo+ID4gPj4+IGV4aXN0
aW5nIGFkdjc1eHggYnJpZGdlIHVzZXJzLgo+ID4gPj4KPiA+ID4+IEl0IGlzIHBpdHkgdGhhdCBi
cmVha2FnZSBoYXBwZW5lZCwgYW5kIG5leHQgdGltZSB3ZSBzaG91bGQgYmUgbW9yZQo+ID4gPj4g
c3RyaWN0IGFib3V0IHRlc3Rpbmcgb3RoZXIgcGxhdGZvcm1zLCBiZWZvcmUgcGF0Y2ggYWNjZXB0
YW5jZS4KPiA+ID4+Cj4gPiA+PiBCdXQgcmV2ZXJ0aW5nIGl0IG5vdyB3aWxsIGJyZWFrIGFsc28g
cGxhdGZvcm0gd2hpY2ggZGVwZW5kIG9uIGl0Lgo+ID4gPiBJJ20gcmVhbGx5IG9mIG5vIG9waW5p
b24gb2Ygd2hpY2ggYXBwcm9hY2ggaXMgYmV0dGVyIGhlcmUsIGJ1dCBJIHdpbGwKPiA+ID4gc2F5
IHRoYXQgd2hlbiBhIHBhdGNoIGJyZWFrcyBwcmV2aW91c2x5IHdvcmtpbmcgYm9hcmRzLCB0aGF0
J3MgYQo+ID4gPiByZWdyZXNzaW9uIGFuZCBqdXN0aWZ5aW5nIHRoYXQgc29tZSBvdGhlciBib2Fy
ZCBpcyBub3cgZW5hYmxlZCB0aGF0Cj4gPiA+IHdvdWxkIGJlIGJyb2tlbiBieSB0aGUgcmV2ZXJ0
IChvZiBhIHBhdGNoIHRoYXQgaXMgbm90IHlldCB1cHN0cmVhbSkKPiA+ID4gaXNuJ3QgcmVhbGx5
IGEgc3Ryb25nIGFyZ3VtZW50Lgo+ID4gPgo+ID4gPiBJJ20gaGFwcHkgdG8gd29yayB3aXRoIGZv
bGtzIHRvIHRyeSB0byBmaXh1cCB0aGUga2lyaW4gZHJpdmVyIGlmIHRoaXMKPiA+ID4gcGF0Y2gg
cmVhbGx5IGlzIHRoZSByaWdodCBhcHByb2FjaCwgYnV0IHdlIG5lZWQgc29tZW9uZSB0byBkbyB0
aGUgc2FtZQo+ID4gPiBmb3IgdGhlIGRiNDEwYywgYW5kIEkgZG9uJ3QgdGhpbmsgaXRzIGZhaXIg
dG8ganVzdCBkdW1wIHRoYXQgd29yayBvbnRvCj4gPiA+IGZvbGtzIHVuZGVyIHRoZSB0aHJlYXQg
b2YgdGhlIGJvYXJkIGJyZWFraW5nLgo+ID4KPiA+Cj4gPiBUaGVzZSBkcml2ZXJzIHNob3VsZCBi
ZSBmaXhlZCBhbnl3YXkgLSBhc3N1bXB0aW9uIHRoYXQKPiA+IGRybV9icmlkZ2UvZHJtX3BhbmVs
IHdpbGwgYmUgcmVnaXN0ZXJlZCBiZWZvcmUgdGhlIGJ1cyBpdCBpcyBhdHRhY2hlZCB0bwo+ID4g
aXMganVzdCBpbmNvcnJlY3QuCj4gPgo+ID4gU28gaW5zdGVhZCBvZiByZXZlcnRpbmcsIGZpeGlu
ZyBhbmQgdGhlbiByZS1hcHBseWluZyB0aGUgcGF0Y2ggSSBoYXZlCj4gPiBnZW50bHkgcHJvcG9z
ZWQgc2hvcnRlciBwYXRoLiBJZiB5b3UgcHJlZmVyIGxvbmcgcGF0aCB3ZSBjYW4gdHJ5IHRvIGdv
Cj4gPiB0aGlzIHdheS4KPiA+Cj4gPiBNYXR0LCBpcyB0aGUgcHVyZSByZXZlcnQgT0sgZm9yIHlv
dSBvciBpcyBpdCBwb3NzaWJsZSB0byBwcmVwYXJlIHNvbWUKPiA+IHdvcmthcm91bmQgYWxsb3dp
bmcgY29vcGVyYXRpb24gd2l0aCBib3RoIGFwcHJvYWNoZXM/Cj4KPiBSb2IvQW5kcnplajogV2hh
dCdzIHRoZSBjYWxsIGhlcmU/Cj4KPiBTaG91bGQgSSByZXN1Ym1pdCB0aGUga2lyaW4gZml4IGZv
ciB0aGUgYWR2NzUxMSByZWdyZXNzaW9uIGhlcmU/Cj4gT3IgZG8gd2UgcmV2ZXJ0IHRoZSBhZHY3
NTExIHBhdGNoPyBJIGJlbGlldmUgZGI0MTBjIHN0aWxsIG5lZWRzIGEgZml4Lgo+Cj4gSSdkIGp1
c3QgbGlrZSB0byBrZWVwIHRoZSBIaUtleSBib2FyZCBmcm9tIGJyZWFraW5nLCBzbyBsZXQgbWUg
a25vdyBzbwo+IEkgY2FuIGdldCB0aGUgZml4IHN1Ym1pdHRlZCBpZiBuZWVkZWQuCj4KCkRvZXMg
dGhlIGtpcmluIGZpeCBicmVhayB0aGluZ3MgaWYgdGhlIGFkdjc1MTEgcGF0Y2ggaXMgcmV2ZXJ0
ZWQ/ICBJZgpub3QsIEknZCBzdWJtaXQgaXQgYW55d2F5cy4KCkhvcGVmdWxseSBieSBuZXh0IHdl
ZWtlbmQgSSdsbCBiZSBmaW5pc2hlZCB3aXRoIG15IG1vdmUgYW5kIHVucGFja2VkCmVub3VnaCB0
byBiZSBhYmxlIHRvIHNldHVwIGRiNDEwYyArIG1vbml0b3IgdG8gc3RhcnQgd29ya2luZyBvbiBm
aXhpbmcKZGI0MTBjLiAgU28gcGVyaGFwcyBvbmUgb3B0aW9uIHdvdWxkIGJlIHRvIHdhaXQgYSB3
ZWVrLCBhbmQgc2VlIGlmIEkKY2FuIGNvbWUgdXAgd2l0aCBzb21ldGhpbmcgc21hbGwgZW5vdWdo
IHRvIGxhbmQgYXMgYSBwb3N0LW1lcmdlLXdpbmRvdwpmaXgsIHdpdGggdGhlIGZhbGxiYWNrIGJl
aW5nIHRvIHJldmVydCBhbmQgdHJ5IGFnYWluIG5leHQgbWVyZ2UKd2luZG93PwoKQlIsCi1SCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
