Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC8684AC1
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 13:40:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F7536E6B3;
	Wed,  7 Aug 2019 11:40:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FA876E6B3
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 11:40:28 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id z23so74603421ote.13
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2019 04:40:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u29YZUSF8gmWkdHKDYGSBVYcnPuAF9Z+Z15UNCjQBh4=;
 b=cYB3poH4i5A89hqGws3q6gRgNK+J1QlQRZW0ZN+V35Pot71ReHkuh26iFIfEAdf6mX
 YOMq05t35jrjk7oYND3AD6CyBQ/vTuNWp5wRd+n6ije4moAxSyn50xcAZLDFSfUovrNA
 UTtmOHWeJbIyPjs21OTygIRyKXixMfCMitBM0ZlonMbXrld+0n3xrTDAjfGR8rvHP1M4
 Mxtcdy8N/Jsx8Y7lNGDMxlzZR8IxH0NUHDRIEb3UI7iBKmbFJXtTSDfJO+tSr6c8q8zJ
 EhvT4CtLUYLxsV8Yt1s3pE9mJuOEf4u/6WOlZ9D1SxXAVwK/6lRwIsVbxFN7vRryxTlD
 ebEg==
X-Gm-Message-State: APjAAAW60ugKywhHnGhLg3KujUTEbPzVdUSHICxQlscpTE6oMN6WvuzR
 pFbGP6nt8IlolINCzepSa7FaQy/R+UUo61BqpgSRSw==
X-Google-Smtp-Source: APXvYqxT2XiKla161CdG5VV7N+Sxvaq+Mpb5UevTVHAAluDye0YEIyY1lAlxhgJ2u3t8QW3N9fXzNTi1uwKXFob7AjY=
X-Received: by 2002:a05:6808:118:: with SMTP id
 b24mr5059229oie.128.1565178027368; 
 Wed, 07 Aug 2019 04:40:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190806133454.8254-1-kraxel@redhat.com>
 <20190806133454.8254-2-kraxel@redhat.com>
 <20190806135426.GA7444@phenom.ffwll.local>
 <20190807072654.arqvx37p4yxhegcu@sirius.home.kraxel.org>
 <CAKMK7uFyKd71w4H8nFk=WPSHL3KMwQ6kLwAMXTd_TAkrkJ++KQ@mail.gmail.com>
 <20190807103649.aedmac63eop6ktlk@sirius.home.kraxel.org>
In-Reply-To: <20190807103649.aedmac63eop6ktlk@sirius.home.kraxel.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 7 Aug 2019 13:40:15 +0200
Message-ID: <CAKMK7uHNXjSsuUTkxzVbeDNP4ESFBObHZe6xxJYEHE1-QyKqhQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm: add gem ttm helpers
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=u29YZUSF8gmWkdHKDYGSBVYcnPuAF9Z+Z15UNCjQBh4=;
 b=iYQBlMMi7h2rWOIbCa0SK9ioKSJCm+YmQyXG61XP56+485S8fAX4FvlL+H942DNVYo
 DFZRw8kyejuPYyd2V5djtNNKwvVPvKGQjeeAhrgYj6dzyDVPHjUgX0lfnIe/7ijxi8o3
 8Ju0JeK7qHlU6SrPbsgwEaMYQxJHv7xQGIGa4=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgNywgMjAxOSBhdCAxMjozNiBQTSBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4KPiAgIEhpLAo+Cj4gPiA+ID4gU2FtZSBmb3IgdGhpcywgeW91J3Jl
IGp1c3QgdXBjYXN0aW5nIHRvIHR0bV9ibyBhbmQgdGhlbiBkb3duY2FzdGluZyB0bwo+ID4gPiA+
IGdlbV9ibyBhZ2FpbiAuLi4gSSB0aGluayBqdXN0IGEgc2VyaWVzIHRvIHJvbGwgb3V0IHRoZSBl
eGlzdGluZyBnZW0KPiA+ID4gPiBoZWxwZXJzIGV2ZXJ5d2hlcmUgc2hvdWxkIHdvcms/Cj4gPiA+
Cj4gPiA+IEkgZG9uJ3QgdGhpbmsgc28uICBkcm1fZ2VtX2R1bWJfbWFwX29mZnNldCgpIGNhbGxz
Cj4gPiA+IGRybV9nZW1fY3JlYXRlX21tYXBfb2Zmc2V0KCksIHdoaWNoIEkgdGhpbmsgaXMgbm90
IGNvcnJlY3QgZm9yIHR0bQo+ID4gPiBvYmplY3RzIGJlY2F1c2UgdHRtX2JvX2luaXQoKSBoYW5k
bGVzIHZtYV9ub2RlIGluaXRpYWxpemF0aW9uLgo+ID4KPiA+IE1vcmUgY29kZSB0byB1bmlmeSBm
aXJzdD8gVGhpcyBzaG91bGQgd29yayBleGFjdGx5IHRoZSBzYW1lIHdheSBmb3IKPiA+IGFsbCBn
ZW0gYmFzZWQgZHJpdmVycyBJIHRoaW5rIC4uLiBPbmx5IHRyaWNreSBiaXQgaXMgbWFraW5nIHN1
cmUKPiA+IHZtd2dmeCBrZWVwcyB3b3JraW5nIGNvcnJlY3RseS4KPgo+IFllYS4gIFVuaWZ5aW5n
IG9uIHRoZSBnZW0gd2F5IG9mIGRvaW5nIHRoaW5ncyBpc24ndCBnb2luZyB0byB3b3JrIHZlcnkK
PiB3ZWxsLiAgV2Ugd291bGQgaGF2ZSB0byBrZWVwIHRoZSBjdXJyZW50IHdheSBvZiBkb2luZyB0
aGluZ3MgaW4gdGhlIHR0bQo+IGNvZGUsIHdyYXBwZWQgaW50byAiaWYgKHR0bV9ib191c2VzX2Vt
YmVkZGVkX2dlbV9vYmplY3QoKSkgeyAuLi4gfSIsIHRvCj4gbm90IGJyZWFrIHZtd2dmeC4KPgo+
IFNvIGFkZGluZyBnZW0gdHRtIGhlbHBlcnMgKHdoZXJlIGdlbSt0dG0gZHJpdmVycyBjYW4gb3B0
LWluKSBsb29rZWQgbGlrZQo+IHRoZSBiZXR0ZXIgd2F5IG9mIGhhbmRsaW5nIHRoaXMgdG8gbWUg
Li4uCgpPayBJIGxvb2tlZCBhZ2FpbiwgYW5kIHlvdXIgdHRtIHZlcnNpb24gc2VlbXMgdG8gZXhh
Y3RseSBtYXRjaApkcm1fZ2VtX2R1bWJfbWFwX29mZnNldCgpLCB3aGljaCB3ZSBhbG1vc3QgY2Fs
bGVkCmRybV9nZW1fbWFwX29mZnNldCgpLiBBbmQgY291bGQgZG8gdGhhdCBhZ2FpbiBieSB1bmRv
aW5nIHRoYXQgcmV2ZXJ0LgpTbyBJJ20gbm90IHNlZWluZyBob3cgYSBnZW5lcmljIHZlcnNpb24g
Zm9yIHRoaXMgc3R1ZmYgaGVyZSB3b3VsZG4ndAphbHNvIHdvcmsgZm9yIHR0bSAuLi4gT2ZjIGlm
IHZtd2dmeCBkb2VzIHNvbWV0aGluZyBlbHNlIHRoZXkgY2FuIGtlZXAKdGhlaXIgb3duIHNwZWNp
ZmljIGR1bWIgbWFwX29mZnNldCBpbXBsZW1lbnRhdGlvbi4KCldoYXQgYW0gSSBtaXNzaW5nPwot
RGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3Jh
dGlvbgorNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
