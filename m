Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C28EB07BA
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 06:15:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1E166EBC5;
	Thu, 12 Sep 2019 04:12:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D72C6E05D
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 02:39:04 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id d17so13902134wrq.13
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 19:39:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GrP39eh2tbg2zaFOB64oY1gm4vOgwRLVKmpoX2YX7FU=;
 b=a+OiN/f5KcH5qxpZCIGzx8Su6baiqst21XTriKTVbb64cKwqKYbAF0n7DSHStk8FU9
 iByR5kQqpL/aJy76AQtmhpAjDd6u2JHCn7JYF70VlDJX/8nwpsmWrsPFVy8dJ17FAPqM
 OLJpT58rxRCZR7aLyuOLUn6K5aV1RNqPhfs7/UPbWuPzc9EY1vWc963GeSy8JyqIA0TP
 cVaGLCuH/QOUyapF0GaqySTrCJYyyB4UH1S0tyxRqBPZCQ5Xv3eqaycBsW3wCCm/Xnij
 xr9PCPyyCkMaQg/PFaNHiCHCjvJW94hmK4p4uVAO5UEGSa8xIKD8M8YQAe1dnIyyvYdQ
 OBsA==
X-Gm-Message-State: APjAAAWZ/pRu5CR2H5iPJkOt3MCYQtDyat4G+kyJlcAHnfETWXi043n9
 jcOGhVOWyL5wlViRxinQJA8devQtmFOrwfStO6n/0g==
X-Google-Smtp-Source: APXvYqwzKJU1Cuvg5D1uPvbs+D7lcEhLXHP5b5fAhTci7k2EsFsUuU4QBxWKaKEWTfQ8aOt1qSnM1Geuc0dvJUUt4AA=
X-Received: by 2002:a5d:6943:: with SMTP id r3mr4535370wrw.21.1568255942965;
 Wed, 11 Sep 2019 19:39:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190829060550.62095-1-john.stultz@linaro.org>
 <CGME20190829173938epcas3p1276089cb3d6f9813840d1bb6cac8b1da@epcas3p1.samsung.com>
 <CAF6AEGvborwLmjfC6_vgZ-ZbfvF3HEFFyb_NHSLRoYWF35bw+g@mail.gmail.com>
 <ebdf3ff5-5a9b-718d-2832-f326138a5b2d@samsung.com>
 <CAF6AEGtkvRpXSoddjmxer2U6LxnV_SAe+jwE2Ct8B8dDpFy2mA@mail.gmail.com>
 <b925e340-4b6a-fbda-3d8d-5c27204d2814@samsung.com>
 <CALAqxLU5Ov+__b5gxnuMxQP1RLjndXkB4jAiGgmb-OMdaKePug@mail.gmail.com>
 <9d31af23-8a65-d8e8-b73d-b2eb815fcd6f@samsung.com>
In-Reply-To: <9d31af23-8a65-d8e8-b73d-b2eb815fcd6f@samsung.com>
From: John Stultz <john.stultz@linaro.org>
Date: Wed, 11 Sep 2019 19:38:50 -0700
Message-ID: <CALAqxLVP=x9+p9scGyfgFUMN2di+ngOz9-fWW=A1YCM4aN7JRA@mail.gmail.com>
Subject: Re: [RFC][PATCH] drm: kirin: Fix dsi probe/attach logic
To: Andrzej Hajda <a.hajda@samsung.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=GrP39eh2tbg2zaFOB64oY1gm4vOgwRLVKmpoX2YX7FU=;
 b=KE6LHdW4ZTuj4bvCJMtx+uM0Rb3HlKs6OrX55Tnau/FBW4gDZGaUPwnBTYJlReNGXi
 BE/+/1ZEEIwMcHYkgtZvQp1k9XOh8YsjhKGPwOqpD5hXMDnK6YJh6eBYZTAZrJsmy0Rw
 AqHgpH/mwPIe2ejnf6iSHuSUj9sqhzGoxaSQTmMB401IvgXUqRJ+3aMwREnWt8kq2B9C
 /l6zabO2bDa7QConQ0YCLq1PW0/CZ3mnHmnmc9X5YKe7giiLZu09AJhep8acXz8y7vYY
 o8IjNz5/QpI9hSBNq2FS4rhj39DhI4ZiYJyEd4WeaIhZa+FOYmm1zu7vIOVXsbxGAwQz
 N4JA==
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

T24gV2VkLCBTZXAgNCwgMjAxOSBhdCAzOjI2IEFNIEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ft
c3VuZy5jb20+IHdyb3RlOgo+IE9uIDAzLjA5LjIwMTkgMTg6MTgsIEpvaG4gU3R1bHR6IHdyb3Rl
Ogo+ID4gT24gTW9uLCBTZXAgMiwgMjAxOSBhdCA2OjIyIEFNIEFuZHJ6ZWogSGFqZGEgPGEuaGFq
ZGFAc2Ftc3VuZy5jb20+IHdyb3RlOgo+ID4+IE9uIDMwLjA4LjIwMTkgMTk6MDAsIFJvYiBDbGFy
ayB3cm90ZToKPiA+Pj4gT24gVGh1LCBBdWcgMjksIDIwMTkgYXQgMTE6NTIgUE0gQW5kcnplaiBI
YWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4gd3JvdGU6Cj4gPj4+PiBPZiBjb3Vyc2UgaXQgc2Vl
bXMgeW91IGhhdmUgZGlmZmVyZW50IG9waW5pb24gd2hhdCBpcyB0aGUgcmlnaHQgdGhpbmcgaW4K
PiA+Pj4+IHRoaXMgY2FzZSwgc28gaWYgeW91IGNvbnZpbmNlIHVzIHRoYXQgeW91ciBhcHByb2Fj
aCBpcyBiZXR0ZXIgb25lIGNhbgo+ID4+Pj4gcmV2ZXJ0IHRoZSBwYXRjaC4KPiA+Pj4gSSBndWVz
cyBteSBzdHJvbmdlc3QgLyBtb3N0IGltbWVkaWF0ZSBvcGluaW9uIGlzIHRvIG5vdCBicmVhayBv
dGhlcgo+ID4+PiBleGlzdGluZyBhZHY3NXh4IGJyaWRnZSB1c2Vycy4KPiA+Pgo+ID4+IEl0IGlz
IHBpdHkgdGhhdCBicmVha2FnZSBoYXBwZW5lZCwgYW5kIG5leHQgdGltZSB3ZSBzaG91bGQgYmUg
bW9yZQo+ID4+IHN0cmljdCBhYm91dCB0ZXN0aW5nIG90aGVyIHBsYXRmb3JtcywgYmVmb3JlIHBh
dGNoIGFjY2VwdGFuY2UuCj4gPj4KPiA+PiBCdXQgcmV2ZXJ0aW5nIGl0IG5vdyB3aWxsIGJyZWFr
IGFsc28gcGxhdGZvcm0gd2hpY2ggZGVwZW5kIG9uIGl0Lgo+ID4gSSdtIHJlYWxseSBvZiBubyBv
cGluaW9uIG9mIHdoaWNoIGFwcHJvYWNoIGlzIGJldHRlciBoZXJlLCBidXQgSSB3aWxsCj4gPiBz
YXkgdGhhdCB3aGVuIGEgcGF0Y2ggYnJlYWtzIHByZXZpb3VzbHkgd29ya2luZyBib2FyZHMsIHRo
YXQncyBhCj4gPiByZWdyZXNzaW9uIGFuZCBqdXN0aWZ5aW5nIHRoYXQgc29tZSBvdGhlciBib2Fy
ZCBpcyBub3cgZW5hYmxlZCB0aGF0Cj4gPiB3b3VsZCBiZSBicm9rZW4gYnkgdGhlIHJldmVydCAo
b2YgYSBwYXRjaCB0aGF0IGlzIG5vdCB5ZXQgdXBzdHJlYW0pCj4gPiBpc24ndCByZWFsbHkgYSBz
dHJvbmcgYXJndW1lbnQuCj4gPgo+ID4gSSdtIGhhcHB5IHRvIHdvcmsgd2l0aCBmb2xrcyB0byB0
cnkgdG8gZml4dXAgdGhlIGtpcmluIGRyaXZlciBpZiB0aGlzCj4gPiBwYXRjaCByZWFsbHkgaXMg
dGhlIHJpZ2h0IGFwcHJvYWNoLCBidXQgd2UgbmVlZCBzb21lb25lIHRvIGRvIHRoZSBzYW1lCj4g
PiBmb3IgdGhlIGRiNDEwYywgYW5kIEkgZG9uJ3QgdGhpbmsgaXRzIGZhaXIgdG8ganVzdCBkdW1w
IHRoYXQgd29yayBvbnRvCj4gPiBmb2xrcyB1bmRlciB0aGUgdGhyZWF0IG9mIHRoZSBib2FyZCBi
cmVha2luZy4KPgo+Cj4gVGhlc2UgZHJpdmVycyBzaG91bGQgYmUgZml4ZWQgYW55d2F5IC0gYXNz
dW1wdGlvbiB0aGF0Cj4gZHJtX2JyaWRnZS9kcm1fcGFuZWwgd2lsbCBiZSByZWdpc3RlcmVkIGJl
Zm9yZSB0aGUgYnVzIGl0IGlzIGF0dGFjaGVkIHRvCj4gaXMganVzdCBpbmNvcnJlY3QuCj4KPiBT
byBpbnN0ZWFkIG9mIHJldmVydGluZywgZml4aW5nIGFuZCB0aGVuIHJlLWFwcGx5aW5nIHRoZSBw
YXRjaCBJIGhhdmUKPiBnZW50bHkgcHJvcG9zZWQgc2hvcnRlciBwYXRoLiBJZiB5b3UgcHJlZmVy
IGxvbmcgcGF0aCB3ZSBjYW4gdHJ5IHRvIGdvCj4gdGhpcyB3YXkuCj4KPiBNYXR0LCBpcyB0aGUg
cHVyZSByZXZlcnQgT0sgZm9yIHlvdSBvciBpcyBpdCBwb3NzaWJsZSB0byBwcmVwYXJlIHNvbWUK
PiB3b3JrYXJvdW5kIGFsbG93aW5nIGNvb3BlcmF0aW9uIHdpdGggYm90aCBhcHByb2FjaGVzPwoK
Um9iL0FuZHJ6ZWo6IFdoYXQncyB0aGUgY2FsbCBoZXJlPwoKU2hvdWxkIEkgcmVzdWJtaXQgdGhl
IGtpcmluIGZpeCBmb3IgdGhlIGFkdjc1MTEgcmVncmVzc2lvbiBoZXJlPwpPciBkbyB3ZSByZXZl
cnQgdGhlIGFkdjc1MTEgcGF0Y2g/IEkgYmVsaWV2ZSBkYjQxMGMgc3RpbGwgbmVlZHMgYSBmaXgu
CgpJJ2QganVzdCBsaWtlIHRvIGtlZXAgdGhlIEhpS2V5IGJvYXJkIGZyb20gYnJlYWtpbmcsIHNv
IGxldCBtZSBrbm93IHNvCkkgY2FuIGdldCB0aGUgZml4IHN1Ym1pdHRlZCBpZiBuZWVkZWQuCgp0
aGFua3MKLWpvaG4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
