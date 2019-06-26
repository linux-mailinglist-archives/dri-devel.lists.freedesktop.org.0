Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB43571CE
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 21:32:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 249DC6E4F0;
	Wed, 26 Jun 2019 19:32:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03A2E6E4F0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 19:32:24 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id u19so4866434ior.9
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 12:32:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZMDBPgUsvp65+GDLE8L0NRSWZecIdZ0UtHWFD2Htqnw=;
 b=Wl9cxyoRfNfdvWr0zFipSuZj3NWxriIC0xLA9FGvx3k/C1ei8s2mlWOVOdYJfOwc22
 Jbz5cs89PglXX3TNH9vV8BwWdIhtuGaWSE/IZkNfMZvBEyxTz08/yGAbRPVJvVNjarLK
 laWPC72ltOBwIJUqtUO9hgRmL9F9VCXPixFrfalKHyCJqPh+7s2o71tQNY/hXkHmtd8c
 avzIeD0F1Dllh8w0zeBNUKWG6c2OED7e6IDD4Zmvfn5mexKPdvymuWt9LaqRgwu7Kmz2
 c6yInIgRZ6oVKHBdA5Vl4mY9KIsF5IqPmoxOXqPlnWjsCNHTqHwr5WCwcQJSnpgNCIze
 tT1g==
X-Gm-Message-State: APjAAAXxZUD4r3YGw2AkJGnywHSRPemstn1tFxslxQl2CyHZKoxgqu8x
 zaDxEXO1g+YagWK/RjPL/chcA33CFks=
X-Google-Smtp-Source: APXvYqxwMpcB4sp7evKN155nfm/jlZ+7Z3S+cKFJs/VvdAxi1jTTW85kwOLg1wqMR37ekoTCxPX3+w==
X-Received: by 2002:a05:6638:149:: with SMTP id
 y9mr6909638jao.76.1561577544151; 
 Wed, 26 Jun 2019 12:32:24 -0700 (PDT)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com.
 [209.85.166.44])
 by smtp.gmail.com with ESMTPSA id t5sm15720943iol.55.2019.06.26.12.32.24
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Jun 2019 12:32:24 -0700 (PDT)
Received: by mail-io1-f44.google.com with SMTP id m24so4430160ioo.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 12:32:24 -0700 (PDT)
X-Received: by 2002:a5e:8f08:: with SMTP id c8mr6956221iok.52.1561577085074;
 Wed, 26 Jun 2019 12:24:45 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20190619211151epcas3p4dbb163c034afa4063869c761b93e24b1@epcas3p4.samsung.com>
 <20190619210718.134951-1-dianders@chromium.org>
 <bec87373-48cc-0c55-9662-a74a7d2a47a0@samsung.com>
 <CAD=FV=WJBkYfRznh6aAyvgKgHb8-AG0hMORdKA0BXCL89wG_7w@mail.gmail.com>
 <a94d9554-fc93-a2d0-9a30-9604db8c123e@samsung.com>
In-Reply-To: <a94d9554-fc93-a2d0-9a30-9604db8c123e@samsung.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 26 Jun 2019 12:24:32 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VNR1z_WL7rrfv-O5cXFjDowq3qZe-3tg9o9YHjQgyCAA@mail.gmail.com>
Message-ID: <CAD=FV=VNR1z_WL7rrfv-O5cXFjDowq3qZe-3tg9o9YHjQgyCAA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/bridge/synopsys: dw-hdmi: Handle audio for
 more clock rates
To: Andrzej Hajda <a.hajda@samsung.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=ZMDBPgUsvp65+GDLE8L0NRSWZecIdZ0UtHWFD2Htqnw=;
 b=f8TY1v47mlNmVd21P8YuLUhvPcChePJhG5luDNvNOtOVM0rQxgkmqCwMDmf30Pudhf
 Z2bz0ZwXvpg8OX8mhH5NXCZszTpkwlUwUseq96CumbKwcURP9hZVRxWVqkhb/A+4g1V7
 DEcJcWvGjKFFkLhlwMo6C03JF99srWG00HP6c=
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Dylan Reid <dgreid@chromium.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Sam Ravnborg <sam@ravnborg.org>, Cheng-Yi Chiang <cychiang@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBXZWQsIEp1biAyNiwgMjAxOSBhdCAyOjU2IEFNIEFuZHJ6ZWogSGFqZGEgPGEuaGFq
ZGFAc2Ftc3VuZy5jb20+IHdyb3RlOgo+Cj4gPiAgIEFLQTogYW55b25lIHVzaW5nIGF1dG8tQ1RT
IHdvbid0IG5vdGljZSBhbnkgY2hhbmdlCj4gPiBhdCBhbGwuICBJIGd1ZXNzIHRoZSBxdWVzdGlv
biBpczogd2l0aCBBdXRvLUNUUyBzaG91bGQgeW91IHBpY2sgdGhlCj4gPiAiaWRlYWwiIDYyNzIg
b3IgYSB2YWx1ZSB0aGF0IGFsbG93cyBDVFMgdG8gYmUgdGhlIGNsb3Nlc3QgdG8gaW50ZWdyYWwK
PiA+IGFzIHBvc3NpYmxlLiAgQnkgcmVhZGluZyBiZXR3ZWVuIHRoZSBsaW5lcyBvZiB0aGUgc3Bl
YywgSSBkZWNpZGVkIHRoYXQKPiA+IGl0IHdhcyBzbGlnaHRseSBtb3JlIGltcG9ydGFudCB0byBh
bGxvdyBmb3IgYW4gaW50ZWdyYWwgQ1RTLiAgSWYKPiA+IGFjaGlldmluZyBhbiBpbnRlZ3JhbCBD
VFMgd2Fzbid0IGEgZ29hbCB0aGVuIHRoZSBzcGVjIHdvdWxkbid0IGV2ZW4KPiA+IGhhdmUgbGlz
dGVkIHNwZWNpYWwgY2FzZXMgZm9yIGFueSBvZiB0aGUgY2xvY2sgcmF0ZXMuICBXZSB3b3VsZCBq
dXN0Cj4gPiBiZSB1c2luZyB0aGUgaWRlYWwgTiBhbmQgQXV0by1DVFMgYW5kIGJlIGRvbmUgd2l0
aCBpdC4gIFRoZSB3aG9sZQo+ID4gcG9pbnQgb2YgdGhlIHRhYmxlcyB0aGV5IGxpc3QgaXMgdG8g
bWFrZSBDVFMgaW50ZWdyYWwuCj4KPgo+IFNwZWNpZmljYXRpb24gcmVjb21tZW5kcyBtYW55IGNv
bnRyYWRpY3RvcnkgdGhpbmdzIHdpdGhvdXQgZXhwbGljaXQKPiBwcmlvcml0aXphdGlvbiwgYXQg
bGVhc3QgSSBoYXZlIG5vdCBmb3VuZCBpdC4KPgo+IFNvIHdlIHNob3VsZCByZWxheSBvbiBvdXIg
aW50dWl0aW9uLgo+Cj4gSSBndWVzcyB0aGF0IHdpdGggYXV0by1jdHMgTiB3ZSBzaG91bGQgZm9s
bG93IHJlY29tbWVuZGF0aW9uIC0gSSBndWVzcwo+IG1vc3Qgc2lua3MgaGF2ZSBiZWVuIGJldHRl
ciB0ZXN0ZWQgd2l0aCByZWNvbW1lbmRlZCB2YWx1ZXMuCj4KPiBTbyB3aGF0IHdpdGggbm9uLWF1
dG8tY3RzIGNhc2U6Cj4KPiAxLiBIb3cgbWFueSBkZXZpY2VzIGRvIG5vdCBoYXZlIGF1dG8tY3Rz
PyBob3cgbWFueSBhbHRlcm5hdGl2ZSBUTURTCj4gY2xvY2tzIHdlIGhhdmU/IE1heWJlIGl0IGlz
IHRoZW9yZXRpY2FsIHByb2JsZW0uCj4KPiAyLiBBbHRlcm5hdGluZyBDVFMgaW4gc29mdHdhcmUg
aXMgcG9zc2libGUsIGJ1dCBxdWl0ZQo+IGNvbXBsaWNhdGVkL2Fubm95aW5nLCBidXQgYXQgbGVh
c3QgaXQgd2lsbCBmb2xsb3cgcmVjb21tZW5kYXRpb24gOikKCkl0IGlzIE9LIHcvIG1lIGlmIHdl
IHdhbnQgdG8gZHJvcCBteSBwYXRjaC4gIFdpdGggdGhlIGF1dG8tQ1RTIHBhdGNoCml0IHNob3Vs
ZG4ndCBtYXR0ZXIgYW55bW9yZS4gIC4uLmJ1dCBJIHN0aWxsIHdhbnRlZCB0byBwb3N0IGl0IHRv
IHRoZQpsaXN0IGZvciBwb3N0ZXJpdHkgaW4gY2FzZSBpdCBpcyBldmVyIHVzZWZ1bCBmb3Igc29t
ZW9uZSBlbHNlLgoKLURvdWcKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
