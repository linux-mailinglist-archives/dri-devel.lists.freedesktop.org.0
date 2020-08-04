Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B3223BDE2
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 18:14:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDCCA6E487;
	Tue,  4 Aug 2020 16:14:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D186E252
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 16:14:44 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id k12so14159848otr.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Aug 2020 09:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PRagu8tkVhwhGQa/akqU1D9FyDRiF79Ar2yX7OvaM9g=;
 b=POCVjGVKkjetq7BBmWbHLU+cJZMHvFLyWklwVTGKWWEW52ZIVqpvAkmpjUfAaSx+xS
 vxy49uqL45bsPN6FwomKerXWpmxjJUFFPpGPwp+zKi0GhxdbUfBJ07iDPAzAl92e4DGg
 os6CAR7WX4d5aeiDjDnC7OCFTQ/ebFY51thlE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PRagu8tkVhwhGQa/akqU1D9FyDRiF79Ar2yX7OvaM9g=;
 b=JWXz2AntXja9Uzus3UlyCEdk7LF0tc+bRrHW4YCaZZGoIx2KcdnOH/Hoj7GTDdlNuN
 VYAnz8arYBwQVUxcT8ge2m6IUbnCPS9gukD6l0bqiJx/o7TvNyz5oRJwXnWBlakWcSvQ
 C09CiC92LKI/V4q9IQGk9sjh5SNkieifW4xhvF6NRSoYU589ZyWpvFmEA9lvGyh5P64Z
 wnUM+BgmAeAKjxx8dh+9WBHyIwQvLGel+Xf7W0QxsTmXDmhDDyDlSJxG6a9SwmOZZdZj
 IQcUzmBQmOZnU2HciwyRRmuc3W09MtywsyiG1ibwUiFsEV6o18o7o/wbTl5k0SQIDu5O
 ZRVg==
X-Gm-Message-State: AOAM532pB7ECP4n4NL1Fr407elass+6GIHotaWvWYigXTWhcZGaNUoz/
 MAAXfZtZ7JZ1yZSxzZYjfRB19ZrNweQaBOfDWKOCqGc9
X-Google-Smtp-Source: ABdhPJw1zTjUCV5UEI70ZBw5dsEYQ1A05DyFUAwoFptwS1ZXAErRpzel9OxMKyoLqq4/CDASe54UkTo6JblqQZT2Cfk=
X-Received: by 2002:a9d:7283:: with SMTP id t3mr8553941otj.303.1596557683079; 
 Tue, 04 Aug 2020 09:14:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200715115147.11866-1-chris@chris-wilson.co.uk>
 <20200715115147.11866-11-chris@chris-wilson.co.uk>
 <dabc6756-3ba8-ee58-ca6c-e2ae2f0227ac@shipmail.org>
 <159594782797.665.3798858958968044733@build.alporthouse.com>
 <1804e5f6-7a1a-999b-cdfd-50903cc3cc1d@shipmail.org>
 <159655010494.4193.7855959524648425177@build.alporthouse.com>
In-Reply-To: <159655010494.4193.7855959524648425177@build.alporthouse.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 4 Aug 2020 18:14:31 +0200
Message-ID: <CAKMK7uE7Yp+=p2pUSgY59cwUyvhVAJTx94QGDu2wMnzfosy=Vg@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 11/66] drm/i915: Preallocate stashes for vma
 page-directories
To: Chris Wilson <chris@chris-wilson.co.uk>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Dave Airlie <airlied@redhat.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas_os@shipmail.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgNCwgMjAyMCBhdCA0OjA4IFBNIENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMt
d2lsc29uLmNvLnVrPiB3cm90ZToKPgo+IFF1b3RpbmcgVGhvbWFzIEhlbGxzdHLDtm0gKEludGVs
KSAoMjAyMC0wNy0zMCAxMzoyODoxOSkKPiA+Cj4gPiBPbiA3LzI4LzIwIDQ6NTAgUE0sIENocmlz
IFdpbHNvbiB3cm90ZToKPiA+ID4KPiA+ID4gSXQncyBpbiB0aGUgdXNlciBjcml0aWNhbCBwYXRo
ICh0aGUgc2hvcnRlc3QgcGF0aCB0byBwZXJmb3JtIHRoZWlyCj4gPiA+IHNlcXVlbmNlIG9mIG9w
ZXJhdGlvbnMpLCBidXQgaXQncyBiZWZvcmUgdGhlIGRtYS1mZW5jZSBpdHNlbGYuIEkgc2F5Cj4g
PiA+IHRoYXQncyBhIHBhcnRpY3VsYXJseSBuYXN0eSBmYWxzZSBjbGFpbSB0aGF0IGl0IGlzIG5v
dCBvbiB0aGUgY3JpdGljYWwKPiA+ID4gcGF0aCwgYnV0IGJlaW5nIHdoZXJlIGl0IGlzIGNpcmN1
bXZlbnRzIHRoZSB3aG9sZSBhcmd1bWVudC4KPiA+ID4KPiA+Cj4gPiBDb3VsZG4ndCB0aGUgZm9s
bG93aW5nIHNpdHVhdGlvbiBoYXBwZW4/Cj4gPgo+ID4gMS4gQ1Mgc3Bhd25zIHVzZXJwdHIgcGlu
bmluZyB3b3JrLgo+ID4gMi4gQ1MgY3JlYXRlcyBhbmQgcHVibGlzaGVzIGEgRE1BLWZlbmNlIHRo
YXQgZGVwZW5kcyBvbiB0aGF0IHBpbm5pbmcgd29yay4KPgo+IFRoZXJlJ3MgYSBicmVhayBiZWZv
cmUgMiBpbiB0aGF0IHdlIGRvIG5vdCBwdWJsaXNoIGEgZG1hLWZlbmNlIG9uIHBlbmRpbmcKPiB1
c2VycHRyIHdvcmsuIFRoZXJlJ3Mgbm8gYXN5bmMgd2FpdCBvbiB0aGUgdXNlcnB0ciwgaWYgdGhl
IHBhZ2VzIGFyZSBub3QKPiBhdmFpbGFibGUgYXQgdGhlIHBvaW50IG9mIGFjcXVpcmUsIHdlIGhp
dCBhbiAtRUFHQUlOLCBhbmQgdGFrZSB0aGUKPiBmbHVzaF93b3JrcXVldWUgcGF0aCB1bnRpbCB3
ZSBzdG9wIGhpdHRpbmcgLUVBR0FJTi4KPgo+IFRoYXQgaXMgYXMgcGFpbmZ1bCBhcyBpdCBzb3Vu
ZHMsIGFuZCBJIGNsYWltIHRoYXQgc2l0dGluZyBhbmQgc3Bpbm5pbmcgaW4KPiBhIHVzZXIgcGF0
aCBpcyBubyBiZXR0ZXIgaW4gdGVybXMgb2YgY3JpdGljYWwgcGF0aCB0aGFuIGhhdmluZyBpdCBp
bnNpZGUKPiB0aGUgZG1hLWZlbmNlIHNlY3Rpb24uIEhvd2V2ZXIsIHdpdGggdGhpcyBwcmV0ZW5z
ZSB3ZSBkbyBub3QgdmlvbGF0ZSB0aGF0Cj4gcnVsZS4KCllvdSB0cmFkZSBhIGRlYWRsb2NrIGZv
ciBhIGxpdmVsb2NrLCBhbmQgdGhlIGxpdmVsb2NrIGlzIGxpbWl0ZWQgZnVsbHkKdG8gdGhlIG9m
ZmVuZGluZyBwcm9jZXNzIHVzaW5nICh0b28gbXVjaCkgdXNlcnB0ciwgYW5kIHRoZSB1c2VyIGNh
bgpicmVhayBvdXQgb2YgaXQgd2l0aCBeQy4gVGhhdCdzIGEgZmFpcmx5IHNpZ25pZmljYW50IGRp
ZmZlcmVuY2UuIERvbid0Cm92ZXJydXNlIHVzZXJwdHIgc3RpbGwgYXBwbGllcy4KLURhbmllbAot
LSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0
cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
