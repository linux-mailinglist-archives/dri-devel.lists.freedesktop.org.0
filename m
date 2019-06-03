Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E247E3345E
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 17:57:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1154989267;
	Mon,  3 Jun 2019 15:57:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 078A189269
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 15:57:24 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id s184so2185127oie.9
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jun 2019 08:57:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sxS3lxwdySjEC6B76icYsmV6fQfjP96EC0MWCsnfqhk=;
 b=py4brW5qgSiIBEci7Y5BW5CizwJvhhyy/sGbyjeGcHL4/hKhCrrEcD20YpkdowLZAo
 dV2fHVcURvnQzxEbKUtV7Xtx61Y0GyRxSUvytgG9lZu5RoVj1VCrdUo5oe9FSMCtJlaL
 5ynH9NwRadMm2j40E2xZs1egrtrfT4zL++w9EhRwqBK+ZwusXVhNWHpmf1G9e3oN6t3y
 qkt3rP1lUevfV1d04aHnsHtBR0mBX8BtEJXQGvzdFrbx5goRK6MomVZkfbyzJD44ZEem
 VKcIZiNHViu86Ps6mA6ixuP9J+ap90eyIAyuZGf/sGfElhGm8nNFbM6XoaIC6VfZ/ckd
 cWUg==
X-Gm-Message-State: APjAAAVsaX8STE0rIR7xshmRt6GKhTlxkoZfLf1rWHeMnWCedpl9n2V4
 vzew7g5DkVw7LvflQwc0jRUgBb5FxaUQm8n9XKFw2rC6VWY=
X-Google-Smtp-Source: APXvYqyAKGBHZEc1TxlDJF5kRLBkDzG6dJ1Fh6zIYFuZW59m3p/OqX20cWH5ElGv1a9nMmz0KLIxsnQTINCuWj1j8nU=
X-Received: by 2002:aca:e60a:: with SMTP id d10mr1331625oih.101.1559577444204; 
 Mon, 03 Jun 2019 08:57:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190529065121.13485-1-boris.brezillon@collabora.com>
 <87woi6wrrh.fsf@anholt.net> <20190603072133.GY21222@phenom.ffwll.local>
 <871s0aznbu.fsf@anholt.net>
In-Reply-To: <871s0aznbu.fsf@anholt.net>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 3 Jun 2019 17:57:12 +0200
Message-ID: <CAKMK7uGAwvuuZL0Wm2fjy86irVzEx-STxKAhNT1p_PTuQv6KSg@mail.gmail.com>
Subject: Re: [PATCH] drm/gem_shmem: Use a writecombine mapping for ->vaddr
To: Eric Anholt <eric@anholt.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=sxS3lxwdySjEC6B76icYsmV6fQfjP96EC0MWCsnfqhk=;
 b=LnD+U7SAdK8ETBvfFj/pdLotvvMKI2SHrx8XObr/jYgj9csdYeZMvIkva12miCcAyT
 Mxo8n6pkYQvuG+tVndeICcvKj6Yp8lsk2UnZjgqVkx7arJyPxDQTRPt1aP0nr3JAHYJv
 3vWbZm2VcGDsQJU7MSGZw398rPrIeg7nhiySg=
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMywgMjAxOSBhdCA1OjQzIFBNIEVyaWMgQW5ob2x0IDxlcmljQGFuaG9sdC5u
ZXQ+IHdyb3RlOgo+Cj4gRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPiB3cml0ZXM6Cj4K
PiA+IE9uIEZyaSwgTWF5IDMxLCAyMDE5IGF0IDA4OjQ2OjU4QU0gLTA3MDAsIEVyaWMgQW5ob2x0
IHdyb3RlOgo+ID4+IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5j
b20+IHdyaXRlczoKPiA+Pgo+ID4+ID4gUmlnaHQgbm93LCB0aGUgQk8gaXMgbWFwcGVkIGFzIGEg
Y2FjaGVkIHJlZ2lvbiB3aGVuIC0+dm1hcCgpIGlzIGNhbGxlZAo+ID4+ID4gYW5kIHRoZSB1bmRl
cmx5aW5nIG9iamVjdCBpcyBub3QgYSBkbWFidWYuCj4gPj4gPiBEb2luZyB0aGF0IG1ha2VzIGNh
Y2hlIG1hbmFnZW1lbnQgYSBiaXQgbW9yZSBjb21wbGljYXRlZCAoeW91J2QgbmVlZAo+ID4+ID4g
dG8gY2FsbCBkbWFfbWFwL3VubWFwX3NnKCkgb24gdGhlIC0+c2d0IGZpZWxkIGV2ZXJ5dGltZSB0
aGUgQk8gaXMgYWJvdXQKPiA+PiA+IHRvIGJlIHBhc3NlZCB0byB0aGUgR1BVL0NQVSksIHNvIGxl
dCdzIG1hcCB0aGUgQk8gd2l0aCB3cml0ZWNvbWJpbmUKPiA+PiA+IGF0dHJpYnV0ZXMgaW5zdGVh
ZCAoYXMgZG9uZSBpbiBtb3N0IGRyaXZlcnMpLgo+ID4+ID4KPiA+PiA+IFNpZ25lZC1vZmYtYnk6
IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+Cj4gPj4gPiAt
LS0KPiA+PiA+IEZvdW5kIHRoaXMgaXNzdWUgd2hpbGUgd29ya2luZyBvbiBwYW5mcm9zdCBwZXJm
Y250IHdoZXJlIHRoZSBHUFUgZHVtcHMKPiA+PiA+IHBlcmYgY291bnRlciB2YWx1ZXMgaW4gbWVt
b3J5IGFuZCB0aGUgQ1BVIHJlYWRzIHRoZW0gYmFjayBpbgo+ID4+ID4ga2VybmVsLXNwYWNlLiBU
aGlzIHBhdGNoIHNlZW1zIHRvIHNvbHZlIHRoZSB1bnByZWRpY3RhYmxlIGJlaGF2aW9yIEkKPiA+
PiA+IGhhZC4KPiA+PiA+Cj4gPj4gPiBJIGNhbiBhbHNvIGdvIGZvciB0aGUgb3RoZXIgb3B0aW9u
IChjYWxsIGRtYV9tYXAvdW5tYXAvX3NnKCkgd2hlbgo+ID4+ID4gbmVlZGVkKSBpZiB5b3UgdGhp
bmsgdGhhdCdzIG1vcmUgYXBwcm9wcmlhdGUuCj4gPj4KPiA+PiB3cml0ZWNvbWJpbmVkIHdhcyB0
aGUgaW50ZW50LCBhbmQgdGhpcyBtYWtlcyBrZXJuZWwgdm1hcCBtYXRjaCB0aGUKPiA+PiB1c2Vy
c3BhY2UgbW1hcCBwYXRoLgo+ID4KPiA+IFNpbmNlIEkgbWlzc2VkIHRoYXQgb2J2aW91c2x5OiBX
aGVyZSBkbyB0aGUgc2htZW0gaGVscGVycyBzZXQgd3JpdGUKPiA+IGNvbWJpbmVkIG1vZGUgZm9y
IHVzZXJzcGFjZSBtbWFwPwo+Cj4gVGhhdCB3YXMgdGhlIHRyaWNrIHdoZW4gSSBhc2tlZCB0aGUg
cXVlc3Rpb24sIHRvby4gIGRybV9nZW0uYyBpcyB3aGF0Cj4gc2V0cyBXQyBieSBkZWZhdWx0LgoK
VElMLiBBbmQgbG9va3MgbGlrZSB0aGlzIGhhcyBiZWVuIHRoZSBjYXNlIGZvcmV2ZXIsIGl0IGxh
bmVkIGluCgpjb21taXQgYTJjMGE5N2I3ODRmODM3MzAwZjdiMDg2OWM4MmFiNzEyYzYwMDk1MgpB
dXRob3I6IEplc3NlIEJhcm5lcyA8amJhcm5lc0B2aXJ0dW91c2dlZWsub3JnPgpEYXRlOiAgIFdl
ZCBOb3YgNSAxMDozMTo1MyAyMDA4IC0wODAwCgogICAgZHJtOiBHRU0gbW1hcCBzdXBwb3J0CgpJ
J2xsIHJldHJhY3QgbXkgY29uY2VybiwgbWFraW5nIHRoaXMgd2MgZXZlcnl3aGVyZSBpcyB0aGUg
cmlnaHQgdGhpbmcgdG8gZG8uCgpSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZl
dHRlckBmZndsbC5jaD4KCkNoZWVycywgRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJl
IEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6
Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
