Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB2C37ABC
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 19:16:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF262892B5;
	Thu,  6 Jun 2019 17:16:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3CCB892B5
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 17:16:22 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id 20so1725009pgr.4
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 10:16:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=xnaB2870GZB3eebBLaFXdIrfqP4QtLP9AtgtNluS/2w=;
 b=CQSR+/gQZVFQheVjEH7yCdNA5jkBFKFirz6dVqneXO/F/uqbq4+5HHc31TLK8yEDKn
 vbShZy+ESzdwJ5dzt9UoBbvrMJCpo0+/ilYQ5Do+85IUyUYyJbDeaA7O6jqgGg6+ycfM
 aMhNl7bIrDD0IlP7ei+r8LjImFe41tSmrF9ftHnR6rokHZ5+HyQj/YGwkuOShdHL38Eh
 9o6cFxnEPBMpXneGhrOvNNQJgAOsW8X863A6123/CrJXRweMjSqda4Z1KgQ4oDEFeBXW
 mqtAbi9P16hCXTV84il9RZw/gziW13toyFLeXYODVxJR+a4Q8UY9vUuFu+QhpeRgO7I+
 UGLQ==
X-Gm-Message-State: APjAAAVCRzSg519wHQn9loLY6ssVHXK+8uvqgYkRNzQaToEt77+J/3Xs
 cFH6+bCZrrXjT8FkCGC7K4vZ4w==
X-Google-Smtp-Source: APXvYqyxt+I5fwIWa+rOJ3CMdaB+VSpYPzAApL3FPlNe9rZ6tKjDn2zuvoTOimphMtLb3sU0PFMQXQ==
X-Received: by 2002:aa7:82cd:: with SMTP id f13mr55621104pfn.203.1559841382186; 
 Thu, 06 Jun 2019 10:16:22 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.googlemail.com with ESMTPSA id o66sm2377363pje.8.2019.06.06.10.16.21
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 06 Jun 2019 10:16:21 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, a.hajda@samsung.com,
 Laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH 5/5] drm/meson: Output in YUV444 if sink supports it
In-Reply-To: <20190520133753.23871-6-narmstrong@baylibre.com>
References: <20190520133753.23871-1-narmstrong@baylibre.com>
 <20190520133753.23871-6-narmstrong@baylibre.com>
Date: Thu, 06 Jun 2019 10:16:20 -0700
Message-ID: <7hblzaeisb.fsf@baylibre.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version;
 bh=xnaB2870GZB3eebBLaFXdIrfqP4QtLP9AtgtNluS/2w=;
 b=JvFJGBllEIiVn10M5nTs1mgkkLBPu51n9nLenLTex4m91pcKEXxMcR8HgL38rDgxpt
 /7kpJqIJXpaRYIMqyI/IJUvNaDNLcGVNfYJUuuGPPdSPKPzZzAngwCjjezS7DWKqlvjG
 xfz6nAZrcalJOVS8eO8PMqMLkVwGjHE2VrZosDZ7wDGAb8ILHFHz6Oz5JEmqJtKBGssG
 pe0DO2MFLSTWPVGrQmVJZi1gOy0zRxzO//aBA2BLR80LRx4g6pss0bcRUjIE3B7eCI5e
 Q8YqCc7E9uk25MyirLfO3B3kl6rrVlQwLHZ67vz/C+iv0QEGnUYhzz0f0K2jdwGyFpST
 qutQ==
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
Cc: jernej.skrabec@siol.net, jonas@kwiboo.se, maxime.ripard@bootlin.com,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hverkuil@xs4all.nl,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPiB3cml0ZXM6Cgo+IFdpdGgg
dGhlIFlVVjQyMCBoYW5kbGluZywgd2UgY2FuIGR5bmFtaWNhbGx5IHNldHVwIHRoZSBIRE1JIG91
dHB1dAo+IHBpeGVsIGZvcm1hdCBkZXBlbmRpbmcgb24gdGhlIG1vZGUgYW5kIGNvbm5lY3RvciBp
bmZvLgo+IFNvIG5vdywgd2UgY2FuIG91dHB1dCBpbiBZVVY0NDQsIHdoaWNoIGlzIHRoZSBuYXRp
dmUgdmlkZW8gcGlwZWxpbmUKPiBmb3JtYXQsIGRpcmVjdGx5IHRvIHRoZSBIRE1JIFNpbmsgaWYg
aXQncyBzdXBwb3J0ZWQgd2l0aG91dAo+IG5lY2Vzc2FyaWx5IGludm9sdmluZyB0aGUgSERNSSBD
b250cm9sbGVyIENTQy4KPgo+IFNpZ25lZC1vZmYtYnk6IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ry
b25nQGJheWxpYnJlLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2R3
X2hkbWkuYyB8IDEzICsrKysrKysrKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVz
b24vbWVzb25fZHdfaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2R3X2hkbWku
Ywo+IGluZGV4IDVkNjdlMmJlYmE1OC4uOGJmOWRiN2YzOWE0IDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kd19oZG1pLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
bWVzb24vbWVzb25fZHdfaGRtaS5jCj4gQEAgLTcyMywxMiArNzIzLDIzIEBAIHN0YXRpYyBpbnQg
bWVzb25fdmVuY19oZG1pX2VuY29kZXJfYXRvbWljX2NoZWNrKHN0cnVjdCBkcm1fZW5jb2RlciAq
ZW5jb2RlciwKPiAgCXN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlID0gJmNydGNfc3RhdGUt
Pm1vZGU7Cj4gIAlib29sIGlzX2hkbWkyX3NpbmsgPQo+ICAJCWNvbm5fc3RhdGUtPmNvbm5lY3Rv
ci0+ZGlzcGxheV9pbmZvLmhkbWkuc2NkYy5zdXBwb3J0ZWQ7Cj4gKwlib29sIHNwZWNpZnlfb3V0
X2Zvcm1hdCA9IGZhbHNlOwo+ICsJdTMyIG91dF9mb3JtYXQ7Cj4gIAo+ICAJaWYgKGRybV9tb2Rl
X2lzXzQyMF9vbmx5KGluZm8sIG1vZGUpIHx8Cj4gIAkgICAgKCFpc19oZG1pMl9zaW5rICYmIGRy
bV9tb2RlX2lzXzQyMF9hbHNvKGluZm8sIG1vZGUpKSkKPiAgCQlkd19oZG1pLT5pbnB1dF9idXNf
Zm9ybWF0ID0gTUVESUFfQlVTX0ZNVF9VWVlWWVk4XzBfNVgyNDsKPiAtCWVsc2UKPiArCWVsc2Ug
ewoKbml0OiBpZiB0aGUgZWxzZSBoYXMge30geW91IHNob3VsZCBhZGQgdG8gdGhlICdpZicgKGV2
ZW4gaWYgdGhlIGlmIHNpZGUKaXMgYSBzaW5nbGUgc3RhdGVtZW50KTogYy5mLiBlbmQgb2YgdGhp
cyBzZWN0aW9uIG9mIENvZGluZ1N0eWxlOgpodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1s
L2xhdGVzdC9wcm9jZXNzL2NvZGluZy1zdHlsZS5odG1sI3BsYWNpbmctYnJhY2VzLWFuZC1zcGFj
ZXMKCj4gIAkJZHdfaGRtaS0+aW5wdXRfYnVzX2Zvcm1hdCA9IE1FRElBX0JVU19GTVRfWVVWOF8x
WDI0Owo+ICsJCWlmIChpbmZvLT5jb2xvcl9mb3JtYXRzICYgRFJNX0NPTE9SX0ZPUk1BVF9ZQ1JD
QjQ0NCkgewo+ICsJCQlvdXRfZm9ybWF0ID0gTUVESUFfQlVTX0ZNVF9ZVVY4XzFYMjQ7Cj4gKwkJ
CXNwZWNpZnlfb3V0X2Zvcm1hdCA9IHRydWU7Cj4gKwkJfQo+ICsJfQo+ICsKPiArCS8qIFNldCBh
IGNvbm5lY3RvciBidXMgZm9ybWF0IGlmIHJlcXVpcmVkICovCj4gKwlkcm1fZGlzcGxheV9pbmZv
X3NldF9idXNfZm9ybWF0cyhpbmZvLCAmb3V0X2Zvcm1hdCwKPiArCQkJCQkgKHNwZWNpZnlfb3V0
X2Zvcm1hdCA/IDEgOiAwKSk7Cj4gIAoKT3RoZXJ3aXNlLAoKUmV2aWV3ZWQtYnk6IEtldmluIEhp
bG1hbiA8a2hpbG1hbkBiYXlsaWJyZS5jb20+CgpLZXZpbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
