Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8BC4C2CB
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 23:12:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 289B56E472;
	Wed, 19 Jun 2019 21:11:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B39896E46D
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 21:11:57 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id e5so1350344iok.4
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 14:11:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XY7aJ7dmXPxqNPvIOXdraSG/mXJqcFutpgqcMN/Km28=;
 b=AhkXG1x3Ab3piChHtpkf0Asd0VUH35yoieQQ8B5gQDMl7pRbn7s0+ITiR359kAHOqo
 t6cLs2b1SBne0151E3xN1HmoPgBR70NAD5kvHh1XlZRIKQDFs+I5ylc2V/NBROE9C9Uj
 b2mh4c51JctDcJIGv5Bl3rjCPnCA9RzF9QG/b4wqtm3DPv3ssiCgkMfB38jT0U+jzb8C
 4V58FnKyvik7KA4jK+DmH1sGLTc9aiCnDqZRmBZRm1afR2vj+9Ui90L7NEdW4pDXl13Q
 iKusg8V6qoWpLoZDfwSws6A4IgCuATkws9plHvrbMS6xJKazpwQRQl73ogvx7W1Au8vu
 pZsQ==
X-Gm-Message-State: APjAAAUDrVUsY8fQggCz7gxG9KmailRTf85tIgwj+e2XC7ASqzkRKSdb
 QbBXNphxjAH2twv9YnoZG4c/ky4z3xk=
X-Google-Smtp-Source: APXvYqx5w+4Jwr9ZmqzmCPbpKmwJxGbe6KQgzuyvrlBOtvfzWZnXAUfeE/64KbQpsj/kZbYRwSTy9A==
X-Received: by 2002:a5e:db02:: with SMTP id q2mr15608870iop.306.1560978716583; 
 Wed, 19 Jun 2019 14:11:56 -0700 (PDT)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com.
 [209.85.166.48])
 by smtp.gmail.com with ESMTPSA id d7sm14241356iob.67.2019.06.19.14.11.55
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Jun 2019 14:11:55 -0700 (PDT)
Received: by mail-io1-f48.google.com with SMTP id w25so127272ioc.8
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 14:11:55 -0700 (PDT)
X-Received: by 2002:a02:5b05:: with SMTP id g5mr93849116jab.114.1560978714620; 
 Wed, 19 Jun 2019 14:11:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190617235558.64571-1-dianders@chromium.org>
 <6219398.I55JWXAmVF@jernej-laptop>
 <9bba43cb-7070-8b2a-cfc6-f601fd22a315@baylibre.com>
In-Reply-To: <9bba43cb-7070-8b2a-cfc6-f601fd22a315@baylibre.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 19 Jun 2019 14:11:41 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V_xg3VfWDMfjJp158ELUQm5xJQCRn85H4mx_-YfjfWTg@mail.gmail.com>
Message-ID: <CAD=FV=V_xg3VfWDMfjJp158ELUQm5xJQCRn85H4mx_-YfjfWTg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge/synopsys: dw-hdmi: Handle audio for more clock
 rates
To: Neil Armstrong <narmstrong@baylibre.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XY7aJ7dmXPxqNPvIOXdraSG/mXJqcFutpgqcMN/Km28=;
 b=VNslJ7mhNRCKEXVbWHWhBbcjyZQQnZuTLynWJkzRy6HJWCzrYxgAE2HhkW/VSd5Pz9
 SHfFCPP+ICxn6nicRTh1QtGs0tabSVxS4XDWpZ26c2/+NvIS9qM5t7B+rePUZMndCsUY
 d/Xt1q1xsTgqaK/ACYSjZ3NODpHgZdE4uqn5I=
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
Cc: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Dylan Reid <dgreid@chromium.org>, Zheng Yang <zhengyang@rock-chips.com>,
 Sam Ravnborg <sam@ravnborg.org>, Thomas Gleixner <tglx@linutronix.de>,
 Cheng-Yi Chiang <cychiang@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBXZWQsIEp1biAxOSwgMjAxOSBhdCA4OjIzIEFNIE5laWwgQXJtc3Ryb25nIDxuYXJt
c3Ryb25nQGJheWxpYnJlLmNvbT4gd3JvdGU6Cj4KPiBPbiAxOC8wNi8yMDE5IDE5OjIzLCBKZXJu
ZWogxaBrcmFiZWMgd3JvdGU6Cj4gPiBIaSEKPiA+Cj4gPiBEbmUgdG9yZWssIDE4LiBqdW5paiAy
MDE5IG9iIDAxOjU1OjU4IENFU1QgamUgRG91Z2xhcyBBbmRlcnNvbiBuYXBpc2FsKGEpOgo+ID4+
IExldCdzIGFkZCBzb21lIGJldHRlciBzdXBwb3J0IGZvciBIRE1JIGF1ZGlvIHRvIGR3X2hkbWku
Cj4gPj4gU3BlY2lmaWNhbGx5Ogo+ID4+Cj4gPj4gMS4gRm9yIDQ0LjEga0h6IGF1ZGlvIHRoZSBv
bGQgY29kZSBtYWRlIHRoZSBhc3N1bXB0aW9uIHRoYXQgYW4gTiBvZgo+ID4+IDYyNzIgd2FzIHJp
Z2h0IG1vc3Qgb2YgdGhlIHRpbWUuICBUaGF0IHdhc24ndCB0cnVlIGFuZCB0aGUgbmV3IHRhYmxl
Cj4gPj4gc2hvdWxkIGdpdmUgYmV0dGVyIDQ0LjEga0h6IGF1ZGlvIGZvciBtYW55IG1vcmUgcmF0
ZXMuCj4gPj4KPiA+PiAyLiBUaGUgbmV3IHRhYmxlIGhhcyB2YWx1ZXMgZnJvbSB0aGUgSERNSSBz
cGVjIGZvciAyOTcgTUh6IGFuZCA1OTQKPiA+PiBNSHouCj4gPj4KPiA+PiAzLiBUaGVyZSBpcyBu
b3cgY29kZSB0byB0cnkgdG8gY29tZSB1cCB3aXRoIGEgbW9yZSBpZGVhIE4vQ1RTIGZvcgo+ID4+
IGNsb2NrIHJhdGVzIHRoYXQgYXJlbid0IGluIHRoZSB0YWJsZS4gIFRoaXMgY29kZSBpcyBhIGJp
dCBzbG93IGJlY2F1c2UKPiA+PiBpdCBpdGVyYXRlcyBvdmVyIGV2ZXJ5IHBvc3NpYmxlIHZhbHVl
IG9mIE4gYW5kIHBpY2tzIHRoZSBiZXN0IG9uZSwgYnV0Cj4gPj4gaXQgc2hvdWxkIG1ha2UgYSBn
b29kIGZhbGxiYWNrLgo+ID4+Cj4gPj4gNC4gVGhlIG5ldyBjb2RlIGFsbG93cyBmb3IgcGxhdGZv
cm1zIHRoYXQga25vdyB0aGV5IG1ha2UgYSBjbG9jayByYXRlCj4gPj4gc2xpZ2h0bHkgZGlmZmVy
ZW50bHkgdG8gcGljayBkaWZmZXJlbnQgTi9DVFMgdmFsdWVzLiAgRm9yIGluc3RhbmNlIG9uCj4g
Pj4gcmszMjg4IHdlIGNhbiBtYWtlIDI1LDE3Niw0NzEgSHogaW5zdGVhZCBvZiAyNSwxNzQsODI1
LjE3NDguLi4gSHoKPiA+PiAoMjUuMiBNSHogLyAxLjAwMSkuICBBIGZ1dHVyZSBwYXRjaCB0byB0
aGUgcmszMjg4IHBsYXRmb3JtIGNvZGUgY291bGQKPiA+PiBlbmFibGUgc3VwcG9ydCBmb3IgdGhp
cyBjbG9jayByYXRlIGFuZCBzcGVjaWZ5IHRoZSBOL0NUUyB0aGF0IHdvdWxkIGJlCj4gPj4gaWRl
YWwuCj4gPj4KPiA+PiBOT1RFOiB0aGUgb2RkZXN0IHBhcnQgb2YgdGhpcyBwYXRjaCBjb21lcyBh
Ym91dCBiZWNhdXNlIGNvbXB1dGluZyB0aGUKPiA+PiBpZGVhbCBOL0NUUyBtZWFucyBrbm93aW5n
IHRoZSBfZXhhY3RfIGNsb2NrIHJhdGUsIG5vdCBhIHJvdW5kZWQKPiA+PiB2ZXJzaW9uIG9mIGl0
LiAgVGhlIGRybSBmcmFtZXdvcmsgbWFrZXMgdGhpcyBoYXJkZXIgYnkgcm91bmRpbmcgcmF0ZXMK
PiA+PiB0byBrSHosIGJ1dCBldmVuIGlmIGl0IGRpZG4ndCB0aGVyZSBtaWdodCBiZSBjYXNlcyB3
aGVyZSB0aGUgaWRlYWwKPiA+PiByYXRlIGNvdWxkIG9ubHkgYmUgY2FsY3VsYXRlZCBpZiB3ZSBr
bmV3IHRoZSByZWFsIChub24taW50ZWdyYWwpIHJhdGUuCj4gPj4gVGhpcyBtZWFucyB0aGF0IGlu
IGNhc2VzIHdoZXJlIHdlIGtub3cgKG9yIGJlbGlldmUpIHRoYXQgdGhlIHRydWUgcmF0ZQo+ID4+
IGlzIHNvbWV0aGluZyBvdGhlciB0aGFuIHRoZSByYXRlIHdlIGFyZSB0b2xkIGJ5IGRybS4KPiA+
Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IERvdWdsYXMgQW5kZXJzb24gPGRpYW5kZXJzQGNocm9taXVt
Lm9yZz4KPiA+Cj4gPiBXaGljaCBidXMgaXMgdXNlZCBmb3IgYXVkaW8gdHJhbnNmZXIgb24geW91
ciBkZXZpY2U/IElmIGl0IGlzIEkyUywgd2hpY2ggaXMKPiA+IGNvbW1vbmx5IHVzZWQsIHRoZW4g
cGxlYXNlIGJlIGF3YXJlIG9mIHRoaXMgcGF0Y2g6Cj4gPiBodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9hcmNoaXZlcy9kcmktZGV2ZWwvMjAxOS1KdW5lLzIyMTUzOS5odG1sCj4gPgo+ID4g
SXQgYXZvaWRzIGV4YWN0IE4vQ1RTIGNhbGN1bGF0aW9uIGJ5IGVuYWJsaW5nIGF1dG8gZGV0ZWN0
aW9uLiBJdCBpcyB3ZWxsCj4gPiB0ZXN0ZWQgb24gbXVsdGlwbGUgU29DcyBmcm9tIEFsbHdpbm5l
ciwgQW1sb2dpYyBhbmQgUm9ja2NoaXAuCj4gPgo+ID4gQmVzdCByZWdhcmRzLAo+ID4gSmVybmVq
Cj4gPgo+ID4KPiBIaSBEb3VnbGFzLAo+Cj4gVGhhbmtzIGZvciB5b3VyIHdvcmsgIQo+Cj4gSWYg
eW91IGNvdWxkIHJlYmFzZSBvbiB0b3Agb2YgaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
YXJjaGl2ZXMvZHJpLWRldmVsLzIwMTktSnVuZS8yMjE1MzkuaHRtbAo+IHNvIHdlIGNhbiBtYWtl
IHVzZSBvZiB5b3VyIGV4dGVuZGVkIE4gdGFibGUgd2l0aCBhdXRvbWF0aWMgQ1RTIEhXIGNhbGN1
bGF0aW9uLCBpdCB3b3VsZCBiZSBncmVhdCAhCgpUaGFua3MgdG8geW91IGFuZCBKZXJuZWogZm9y
IHBvaW50aW5nIG1lIGF0IHRoaXMuICBJdCBzZWVtcyBsaWtlbHkKdGhhdCBwYXRjaCBieSBpdHNl
bGYgd291bGQgc29sdmUgcHJvYmxlbXMgd2UgZm91bmQgYW5kIEknbGwgcGljayB0aGF0CmludG8g
bXkgdHJlZS4KClByb2JhYmx5IG15IHBhdGNoIGlzIG5vIGxvbmdlciBxdWl0ZSBhcyB1c2VmdWwg
YXRvcCB5b3VycywgYnV0IEknbGwKc3RpbGwgcG9zdCBhIHYyIHNpbmNlIChpbiB0aGVvcnkpIGZv
bGtzIHRoYXQgYXJlbid0IHVzaW5nIEkyUyBtaWdodApmaW5kIGl0IHVzZWZ1bC4gIEkgZ3Vlc3Mg
aXQncyBhbHNvIHBvc3NpYmxlICg/KSB0aGF0IHBpY2tpbmcgYW4gTgp3aGVyZSBDVFMgd291bGQg
YmUgYWJsZSB0byBiZSBpbnRlZ3JhbCBoYXMgc29tZSB0eXBlIG9mIGFkdmFudGFnZSwKZXZlbiB3
aXRoIGF1dG8gQ1RTPwoKCj4gRmluYWxseSBjb3VsZCB5b3UgYWRkIHRoZSBwbGF0X2RhdGEgdG1k
cyB0YWJsZSBhcyBhIHNlcGFyYXRlIHBhdGNoIHRvIHNpbXBsaWZ5IHJldmlldyA/CgpTdXJlLiAg
SSdtIHByb2JhYmx5IG5vdCBnb2luZyB0byBiZSBhYmxlIHRvIHBvc3QgdGhlIHBhdGNoIHRvIGFj
dHVhbGx5CnVzZSBpdCwgc28gSSBndWVzcyB3ZSBjb3VsZCBqdXN0IG5vdCBib3RoZXIgYXBwbHlp
bmcgdGhlIDJuZCBwYXRjaAp1bmxlc3Mgc29tZW9uZSBldmVyIG5lZWRzIGl0LgoKLURvdWcKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
