Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FA5B766C
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 11:37:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D263D6F4F9;
	Thu, 19 Sep 2019 09:36:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACE536F4F9
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 09:36:57 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id g13so2468824otp.8
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 02:36:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZOSBD7CGhyDOfvgbBTFvLCEJImnePecfbZLBWvYyxgo=;
 b=s4KU4+CrbpB/2nkpM6m/6wt1IB3vh1nM3VDS9+iR/vvdvRG7Jh++o0aAt7ZGvM1Rj8
 0eheDS39qp5hxT8U4f/WUmjn+aLOoz9M7XbD6U8mNJYlESWL4MeHYWXh2KFd1BeEoOZB
 o16rjZ/J+NVMVIkwdK5Wg7JUQslN4rFMtKuGSQfAaD6pHAfbz7+5BFCmhNFmXMQMVjkL
 0W9De6kFJY1IOLp9EpXI2Sf62j3LYcQhKVSsG6sYicsoW5dy671/RZ+hbCNTsQHGKBm/
 +1gkifQseBk+yLeR0UMjWXf6LDotLC34O7xAMHVBH040hu4x51g/7g/VI34Zk6ZlNzL5
 /m2w==
X-Gm-Message-State: APjAAAVnmX//GWUkXqhaf0l2m+g/3LhXHKrzdBFsQtUHvuAjaWxWagpV
 lbU631llDayyCbJ0affyfQ84r8vvXPgArT3r9SncqZND
X-Google-Smtp-Source: APXvYqxTsthM04ipr/VO0yhsgq0CTkhu8GaaU+BwU3P2g+BHDRUT/cHGs3I6DMcYAA2CpPi6/pnJ02DMqUQeBLACEg4=
X-Received: by 2002:a05:6830:1594:: with SMTP id
 i20mr2663196otr.188.1568885816902; 
 Thu, 19 Sep 2019 02:36:56 -0700 (PDT)
MIME-Version: 1.0
References: <KJRi1ROX2_eM1WjtEQ1e1-f--VK4hwMQJQt1nPaS6lcmt3v4yIfdttLIu_EOGdkwXwEMAEo66Xa7ksp7iQABWT5GuMu6UgKoiuEm6EU2N1U=@emersion.fr>
 <20190910133810.64e973f4@eldfell.localdomain>
 <uIh7eDYXe7Cj_3_8V0-WIdUfSrRlIHw8yb91myRQqlv5A7dS8TtfXZTsz0R84_LSQBdqkZvEHc6uWPnGJKIIqa_SnTr6RtmPRwr4d2u13JA=@emersion.fr>
 <20190911103604.4c05ba6b@eldfell.localdomain>
 <fNZQmqVgMDGSK8zIcxQHCsbo-z5GPhcd6GxIEVrpt6ubbauLhe9IbPo77ilXH0SccjutcCbq3iym-DnBQ5Q3wyY1WGPiDxwz3_Pj9--fgZY=@emersion.fr>
 <20190919101836.76d735ba@eldfell.localdomain>
 <CAKMK7uFRtFntwDtiT9+AS1QVMsfVwbA1XVMa+EEn_SphMxqp-w@mail.gmail.com>
 <20190919120152.54875c21@eldfell.localdomain>
In-Reply-To: <20190919120152.54875c21@eldfell.localdomain>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 19 Sep 2019 11:36:45 +0200
Message-ID: <CAKMK7uHaYP+zVWB5rY04EM8X1y_tqixZkomZM71aHTUK5t6B0w@mail.gmail.com>
Subject: Re: [PATCH] drm: two planes with the same zpos have undefined ordering
To: Pekka Paalanen <ppaalanen@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=ZOSBD7CGhyDOfvgbBTFvLCEJImnePecfbZLBWvYyxgo=;
 b=cHxoQ7KncbhJzC8g9ECqzve9ixtrbdlpz09jTENUNPczQoL0Ewzab8el+WjGNAblX0
 tRWrPO1St2iuz79qSM2cYGjaN8DD8re6atMHKZvys8/++3ZU0naDVWDEctPsbJnSeqdY
 BHY6Ng2gYAvpX4ycvE5eTRUGJtEyE+FPeEC0c=
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
Cc: Simon Ser <contact@emersion.fr>,
 "daniels@collabora.com" <daniels@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Marius-Cristian Vlad <marius.vlad@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMTksIDIwMTkgYXQgMTE6MDIgQU0gUGVra2EgUGFhbGFuZW4gPHBwYWFsYW5l
bkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCAxOSBTZXAgMjAxOSAxMDoxODowNCArMDIw
MAo+IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+IHdyb3RlOgo+Cj4gPiBP
biBUaHUsIFNlcCAxOSwgMjAxOSBhdCA5OjE4IEFNIFBla2thIFBhYWxhbmVuIDxwcGFhbGFuZW5A
Z21haWwuY29tPiB3cm90ZToKPiA+ID4KPgo+IC4uLgo+Cj4gPiA+IFJpZ2h0LCBhbmQgd2UgYXJl
IHN1ZmZlcmluZyBmcm9tIHRoYXQgY29uZnVzaW9uIGFscmVhZHkuIFNob3VsZAo+ID4gPiB1c2Vy
c3BhY2UgdXNlIElEIG9yZGVyIGlmIHpwb3MgcHJvcGVydHkgaXMgbm90IHRoZXJlIG9yIG5vdD8g
SSBoYXZlIG5vCj4gPiA+IGlkZWEuCj4gPgo+ID4gTm9wZS4gSSB0aGluayB0aGUgb25seSBvcHRp
b25zIGZvciB0aGlzIGNhc2UgYXJlOgo+ID4gLSBmaWxlIGJ1ZyBhZ2FpbnN0IHVwc3RyZWFtIGRy
aXZlciBzbyB0aGV5IGFkZCB6cG9zCj4gPiAtIHlvdSBtYWdpY2FsbHkga25vdyBob3cgcGxhbmVz
IHdvcmsgb24gdGhhdCBodwo+ID4gLSB5b3UgZG9uJ3Qgb3ZlcmxhcCBwbGFuZXMgYXQgYWxsCj4g
PiAtIGN1cnNvciBpcyBhYm92ZSBwcmltYXJ5LCB0aGF0IG11Y2ggd2UgY2FuIGd1YXJhbnRlZQo+
ID4KPiA+IFllcyBpdCdzIGtpbmRhIHVhcGkgZmFpbCB3ZSBkaWRuJ3QgYWRkIHpwb3MgZnJvbSB0
aGUgc3RhcnQgOi0vCj4KPiBHb29kLiBXZXN0b24gZG9lcyB0aGUgbGFzdCB0d28uIFRoZSBjb25m
dXNpb24gZGlkIG5vdCBsYXN0IGxvbmcKPiBlbm91Z2ggdG8gbGV0IHVzIGFkZCBjb2RlIHVzaW5n
IHRoZSBvYmplY3QgSUQgdG8gaW5mZXIgc3RhY2tpbmcgb3JkZXIuCj4KPiBBbHRob3VnaCwgV2Vz
dG9uIGRvZXMgaGF2ZSB0aGUgYXNzdW1wdGlvbiB0aGF0IG92ZXJsYXlzIGFyZSBpbiB1bmtub3du
Cj4gb3JkZXIgYmV0d2VlbiBwcmltYXJ5IGFuZCBjdXJzb3IsIHdoaWNoIG5vdyBzZWVtcyBmYWxz
ZS4KCkkgdGhpbmsgY3Vyc29yIGlzIGFsd2F5cyBvbiB0b3AsIGJ1dCBzb21lIG9mIHRoZSBvdmVy
bGF5cyBjYW4gYmUgdW5kZXJsYXlzLgotRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJl
IEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6
Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
