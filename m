Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A323123A138
	for <lists+dri-devel@lfdr.de>; Mon,  3 Aug 2020 10:45:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D78276E215;
	Mon,  3 Aug 2020 08:45:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC8576E215
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Aug 2020 08:45:18 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id e6so12398522oii.4
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Aug 2020 01:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gCUQRtjhgMP+4GbBlVgd/KVwJHXD6T5ihkhKQfTfDnU=;
 b=Hch2bh2tVN4GKSCCG47YFGcb33DidnAU0pRKNrC6oElbJ3glt2FoXG+13dUia3VYc/
 D7B6Ra3TG2G4k8P1ViHNYEhdkuYmmYwHY3uCpoPmJz4tunDAm1LbIDEMrc0y5b6U3NvB
 INwJeEmQ9u/BXHXS33nqaRRqxkdRL7GWZ5NLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gCUQRtjhgMP+4GbBlVgd/KVwJHXD6T5ihkhKQfTfDnU=;
 b=qZgSjBluDUJ1OFcL5VUkwhPG1AfUL3anYh1Tdywr/NqSJkfkG/fzzAm/F+uWgpcboz
 fN8eHQtDMR3QyDmR4E/IE+Ef95uj1VUO1DrP/eRcn8t846e58C+mwfk+dYUHa/Yp2XSD
 RONVA6dtfIYu8/G5sFzyWDYWY333Dz28ThUXSeP3ufHp67gHvo8IFF8zEekXgBjMIZ/V
 SThMa40zNeXv2ltG5IgkK8Bk42A1H29LvGsj9Czie/9Bb6eaTo800HRVukSmdkmh+PVW
 jyrh1oTbUHs5Kqt3LfKLutMBKLKcOOcgrTuluVTIN7FyaEKIOV9r+UZJxS48RdL4PIo1
 k42Q==
X-Gm-Message-State: AOAM532pOZOor4hhq2A6nH9YVHRjkZBdlzUnfJgj5xCwsbF+kyZZKCGF
 79I/Agac7WWpPlaIMnlTW5cJAmvMmniCeoVOU1QwIg==
X-Google-Smtp-Source: ABdhPJyId8XExJYVy8L0eC778A06mCCWCXZXLWXucocgDo0ClcYsQp5fGA/P5XZTfEUbLvnRb5egClDmVXOjvoGR4Ag=
X-Received: by 2002:aca:ab87:: with SMTP id
 u129mr11811035oie.128.1596444318309; 
 Mon, 03 Aug 2020 01:45:18 -0700 (PDT)
MIME-Version: 1.0
References: <659f8dcf-7802-1ca1-1372-eb7fefd4d8f4@kernel.org>
 <dbcf2841-7718-2ba7-11e0-efa4b9de8de1@nsfocus.com>
 <9fb43895-ca91-9b07-ebfd-808cf854ca95@nsfocus.com>
 <9386c640-34dd-0a50-5694-4f87cc600e0f@kernel.org>
 <20200803081823.GD493272@kroah.com>
In-Reply-To: <20200803081823.GD493272@kroah.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 3 Aug 2020 10:45:07 +0200
Message-ID: <CAKMK7uEV+CV89-L1Y=dijOEy8DKE=juRfQDnNnbhbAJhFh1fYw@mail.gmail.com>
Subject: Re: [PATCH] vgacon: fix out of bounds write to the scrollback buffer
To: Greg KH <greg@kroah.com>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Kyungtae Kim <kt0755@gmail.com>, Solar Designer <solar@openwall.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux kernel mailing list <linux-kernel@vger.kernel.org>,
 DRI devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?B?5byg5LqR5rW3?= <zhangyunhai@nsfocus.com>,
 Anthony Liguori <aliguori@amazon.com>,
 Yang Yingliang <yangyingliang@huawei.com>, xiao.zhang@windriver.com,
 Jiri Slaby <jirislaby@kernel.org>, "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgMywgMjAyMCBhdCAxMDoyNiBBTSBHcmVnIEtIIDxncmVnQGtyb2FoLmNvbT4g
d3JvdGU6Cj4KPiBPbiBNb24sIEF1ZyAwMywgMjAyMCBhdCAxMDowODo0M0FNICswMjAwLCBKaXJp
IFNsYWJ5IHdyb3RlOgo+ID4gSGksCj4gPgo+ID4gT24gMzEuIDA3LiAyMCwgNzoyMiwg5byg5LqR
5rW3IHdyb3RlOgo+ID4gPiBSZW1vdmUgd2hpdGVzcGFjZSBhdCBFT0wKPiA+Cj4gPiBJIGFtIGZp
bmUgd2l0aCB0aGUgcGF0Y2guIEhvd2V2ZXIgaXQgc2hvdWxkIGJlIHNlbnQgcHJvcGVybHkgKGlu
bGluZQo+ID4gbWFpbCwgaGF2aW5nIGEgUEFUQ0ggc3ViamVjdCBldGMuIC0tIHNlZQo+ID4gRG9j
dW1lbnRhdGlvbi9wcm9jZXNzL3N1Ym1pdHRpbmctcGF0Y2hlcy5yc3QpLiBnaXQgc2VuZC1lbWFp
bCBhZnRlciBnaXQKPiA+IGZvcm1hdC1wYXRjaCBoYW5kbGVzIG1vc3Qgb2YgaXQuCj4gPgo+ID4g
VGhlcmUgaXMgYWxzbyBxdWVzdGlvbiB3aG8gaXMgd2lsbGluZyB0byB0YWtlIGl0Pwo+ID4KPiA+
IEJhcnQ/IEdyZWc/IFNob3VsZCB3ZSByb3V0ZSBpdCB2aWEgYWtwbSwgb3Igd2lsbCB5b3UgTGlu
dXMgZGlyZWN0bHk/IChJCj4gPiBjYW4gc2lnbiBvZmYgYW5kIHJlc2VuZCB0aGUgcGF0Y2ggd2hp
Y2ggd2FzIGF0dGFjaGVkIHRvIHRoZSBtYWlsIEkgYW0KPiA+IHJlcGx5aW5nIHRvIHRvbywgaWYg
bmVlZCBiZS4pCj4KPiBJIGNhbiB0YWtlIGl0LCBpZiBCYXJ0IGNhbid0LCBqdXN0IGxldCBtZSBr
bm93LgoKWWVhaCB2dCBzdHVmZiBhbmQgY29uc29sZSBkcml2ZXJzICE9IGZiY29uIGdvIHRocm91
Z2ggR3JlZydzIHRyZWUgcGFzdApmZXcgeWVhcnMgLi4uCgpHcmVnLCBzaG91bGQgd2UgbWF5YmUg
YWRkIGEgTUFJTlRBSU5FUlMgZW50cnkgdGhhdCBtYXRjaGVzIG9uIGFsbAp0aGluZ3MgY29uc29s
ZT8gV2l0aCB0dHkvdnQgeW91IGRlZmluaXRlbHkgaGF2ZSB0aGUgb3RoZXIgc2lkZSBvZiB0aGF0
CmNvaW4gYWxyZWFkeSA6LSkKLURhbmllbAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdp
bmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
