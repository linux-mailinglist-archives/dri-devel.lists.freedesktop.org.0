Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 659E17DE9F
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 17:19:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70BD96E6D3;
	Thu,  1 Aug 2019 15:19:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A80A36E6D3
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 15:18:58 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id d4so69563447edr.13
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Aug 2019 08:18:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gIfSabpVp9eE7lJHzBppB62vKhN84Wb7zIuuCObxbsE=;
 b=AvCGt/YbgwuGBJO5zlY27gZBJtlbLPpUVGAZfbxmvzMvePTvGkEgl6XI30qGUXrccF
 TAavmNzJ4KwT0uJlzjC9J/EBERMML2MNxEV+toVFpyx9ilMSxfKHa9lKgvs6fxGmP8+F
 6/tk8hBeLsF5D0w+6ljlJT4Oz7PswAKqJ0xhz9xQZjCEaWO/LHLrjSpGzgjMqUBU1a6F
 nw42C/mVQOHywBcOFW3rWTTTYXsAhhgJFMY6/AtqK2kRJ4ratNzJwFDXm78aCqHTMNFD
 tDollLH4g8XsQXA+mLZurom7rOqEKgtsFrArw56dvwqwKZvhJOwqhc+QFbhuSFhVvhrh
 hKdw==
X-Gm-Message-State: APjAAAVDLXk2e2M5RyIHoq3NUzJNhMSHQ0I5tyaO5ZF8pXXQrniV7Fs2
 1s4M4jY7Ydm5FQHMqyARRFFzYQcZDWDcnKTm+18=
X-Google-Smtp-Source: APXvYqxi0dJxQtEdKZtFvGG3TF56BLjVuzQQjIsbAkPejhzpILAjKGsAIJYs66UGezOdwa7K1pdcB1cSy+80rGdyxho=
X-Received: by 2002:a17:906:3612:: with SMTP id
 q18mr102805422ejb.278.1564672736964; 
 Thu, 01 Aug 2019 08:18:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190717211542.30482-1-robdclark@gmail.com>
 <20190719092153.GJ15868@phenom.ffwll.local>
 <20190731192331.GT104440@art_vandelay>
 <156466322613.6045.7313079853087889718@skylake-alporthouse-com>
In-Reply-To: <156466322613.6045.7313079853087889718@skylake-alporthouse-com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 1 Aug 2019 08:18:45 -0700
Message-ID: <CAF6AEGu8K+PwRyY738aFyv+fdZ_UZDhY3XcFY-w4uLMW+w6X9Q@mail.gmail.com>
Subject: Re: [PATCH] drm/vgem: fix cache synchronization on arm/arm64
To: Chris Wilson <chris@chris-wilson.co.uk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=gIfSabpVp9eE7lJHzBppB62vKhN84Wb7zIuuCObxbsE=;
 b=ZNrTD/egNWyggNQI4aKhw3rt484V0kvyB4GuTDajjJPMP/vSaPJ0VuKljCqlbb+P5A
 hiRrdAK2QJlU7pZ92i3/6LTZgDwgXzRHGJeelw/vI2reaGscjHx1CxZiBhfL960X6Ml+
 TfZdbaazxJGcfI2xZ1kF0Z1/sVrMw6Sq9ea+zlCmGiovy2qkcz0EUWurWeapH8GvMTni
 12OJLt1vEQYnJKMakup4T/6eArPfE72r6UQ4h9n3BY/xPpxWimbCg7s6E108ASiiW1qI
 eVS9DIQBAFDZmVUk4nZDVsgHA/Z3b12+wE+0CJbESVN03dDSpW8pM3e7reqOp1fVXXnj
 Obbg==
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
Cc: Deepak Sharma <deepak.sharma@amd.com>, Rob Clark <robdclark@chromium.org>,
 Eric Biggers <ebiggers@google.com>, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <sean@poorly.run>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMSwgMjAxOSBhdCA1OjQwIEFNIENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMt
d2lsc29uLmNvLnVrPiB3cm90ZToKPgo+IFF1b3RpbmcgU2VhbiBQYXVsICgyMDE5LTA3LTMxIDIw
OjIzOjMxKQo+ID4gT24gRnJpLCBKdWwgMTksIDIwMTkgYXQgMTE6MjE6NTNBTSArMDIwMCwgRGFu
aWVsIFZldHRlciB3cm90ZToKPiA+ID4gT24gV2VkLCBKdWwgMTcsIDIwMTkgYXQgMDI6MTU6MzdQ
TSAtMDcwMCwgUm9iIENsYXJrIHdyb3RlOgo+ID4gPiA+IEZyb206IFJvYiBDbGFyayA8cm9iZGNs
YXJrQGNocm9taXVtLm9yZz4KPiA+ID4gPgo+ID4gPiA+IGRybV9jZmx1c2hfcGFnZXMoKSBpcyBu
by1vcCBvbiBhcm0vYXJtNjQuICBCdXQgaW5zdGVhZCB3ZSBjYW4gdXNlCj4gPiA+ID4gZG1hX3N5
bmMgQVBJLgo+ID4gPiA+Cj4gPiA+ID4gRml4ZXMgZmFpbHVyZXMgdy8gdmdlbV90ZXN0Lgo+ID4g
PiA+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0u
b3JnPgo+ID4gPiA+IC0tLQo+ID4gPiA+IEFuIGFsdGVybmF0aXZlIGFwcHJvYWNoIHRvIHRoZSBz
ZXJpZXNbMV0gSSBzZW50IHllc3RlcmRheQo+ID4gPiA+Cj4gPiA+ID4gT24gdGhlIHBsdXMgc2lk
ZSwgaXQga2VlcHMgdGhlIFdDIGJ1ZmZlcnMgYW5kIGF2b2lkcyBhbnkgZHJtIGNvcmUKPiA+ID4g
PiBjaGFuZ2VzLiAgT24gdGhlIG1pbnVzIHNpZGUsIEkgZG9uJ3QgdGhpbmsgaXQgd2lsbCB3b3Jr
IChhdCBsZWFzdAo+ID4gPiA+IG9uIGFybTY0KSBwcmlvciB0byB2NS4wWzJdLCBzbyB0aGUgZml4
IGNhbid0IGJlIGJhY2twb3J0ZWQgdmVyeQo+ID4gPiA+IGZhci4KPiA+ID4KPiA+ID4gWWVhaCBz
ZWVtcyBhIGxvdCBtb3JlIHJlYXNvbmFibGUuCj4gPiA+Cj4gPiA+IEFja2VkLWJ5OiBEYW5pZWwg
VmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+ID4KPiA+IEFwcGxpZWQgdG8gZHJtLW1p
c2MtZml4ZXMsIHRoYW5rcyEKPgo+IEJ1dCBpdCBkaWRuJ3QgYWN0dWFsbHkgZml4IHRoZSBmYWls
dXJlcyBpbiBDSS4KCkhtbSwgdGhhdCBpcyB1bmZvcnR1bmF0ZSwgSSdkIGFzc3VtZWQgdGhhdCBz
aWxlbmNlIG1lYW50IGxhdGVzdAp2ZXJzaW9uIHdhcyB3b3JraW5nIGluIENJLi4KCmRtYV9zeW5j
X3NnXyogZG9lc24ndCB3b3JrIG9uIHg4Nj8gIEl0IHdvdWxkIGJlIGtpbmRhIHVuZm9ydHVuYXRl
IHRvCmhhdmUgdmdlbSBvbmx5IHdvcmsgb24geDg2ICpvciogYXJtLi4gIG1heWJlIGJyaW5naW5n
IGJhY2sKZHJtX2NmbHVzaF9wYWdlcygpIGNvdWxkIG1ha2UgaXQgd29yayBpbiBib3RoIGNhc2Vz
CgpCUiwKLVIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
