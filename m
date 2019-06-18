Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C0D4ADEC
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 00:39:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FBE36E267;
	Tue, 18 Jun 2019 22:39:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 765FF6E267
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 22:39:44 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id z23so17162109ote.13
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 15:39:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tmcJiRSZb1apAJk3f03NhHSz8FMWdd4NCwngMXG3x24=;
 b=TYn4AZruAfaalPeg4xj1YD3L3TlPFnvEKGOYMrCmEc2+JqP7Ni45j833NTRrjJihU4
 X2s+kDy+r5WSE3j/N9Cfrr3xGUpZGqN1v2JpFhUckwchP0JnYH/A/isgPU8hXYW4yUoc
 7cJ3AXAalRC0A0DAO/8BGdyXXoUWZLWkAQJcrkyBtLKgCmLilLF4M4OK12OC7KWXNX+o
 74ugSm6ny1DNl/JKhzv0Wmn3Jyo2Or/0kcrvtXmNfoMZ8Ni0b+lhN2rEWabUHi9Qlcoy
 r5Zioc2NCmfP2vcZlZlGHB/w6P4p0Wa0r7nPOUNh8Fd20wxWDVA5shWpZxVJGpYFHAqd
 p6bA==
X-Gm-Message-State: APjAAAWQDoFY7nGeTU2TBz6BrlEKRRgRfnJYXobuqSjy4PbdbnCtWLuH
 FNmuTvuTxl9G0WwYyPfVog4XJnPxJNEtCXXRXjppmTVK
X-Google-Smtp-Source: APXvYqzT1c/KDGS1bQQ3xTL1HNvzSZBvxbatLOxeoOjbDNStWq/YDn7UUK7Zf9eU5JayT62IAWGqwWqiX7RrTdnIQrU=
X-Received: by 2002:a05:6830:ce:: with SMTP id
 x14mr1214719oto.188.1560897582755; 
 Tue, 18 Jun 2019 15:39:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190606222751.32567-1-daniel.vetter@ffwll.ch>
 <CADKXj+4MOQv1KZqPG=SpwsynLRBoFVdNXKt1qXZwxUFZVAYybQ@mail.gmail.com>
 <20190612144220.GO2458@phenom.ffwll.local>
 <20190618024904.nd3iuhyi4orkplu2@smtp.gmail.com>
 <20190618085647.GO12905@phenom.ffwll.local>
 <CADKXj+4dx-qzvtig-3nOi_UnKezXabxHOPaj8R4qWBnoiQtqMQ@mail.gmail.com>
 <CAKMK7uHpQOz1AUh4-yyh3CLxzY25frcVqU7e4vx8ASZkCC8puw@mail.gmail.com>
 <CAKMK7uFh4Gsn0hY3Ncyz-8yLnAw2_SD+8z2TuRHY3Oo-uO88TQ@mail.gmail.com>
 <CADKXj+6oSiqgE48W3M__WnaaZZ895KurOFJRP7R==+6qXRE2Mg@mail.gmail.com>
In-Reply-To: <CADKXj+6oSiqgE48W3M__WnaaZZ895KurOFJRP7R==+6qXRE2Mg@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 19 Jun 2019 00:39:30 +0200
Message-ID: <CAKMK7uEqtwZG8fo4NvmpmpLgUiM0CcZaWQ3+Rxsb2=hV1WAvxw@mail.gmail.com>
Subject: Re: [PATCH 00/10] drm/vkms: rework crc worker
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tmcJiRSZb1apAJk3f03NhHSz8FMWdd4NCwngMXG3x24=;
 b=E+YzktHHUTaBqNIJYCDKjZRX9t0qkKShVfzpa1sjQPY8u4V7PhF4vEcxmYL0hHNyq7
 Fa+MOGLPbKCigOR4ZUGlYL5wX2ZDcGCqYHjb3J28VnEUJz9XnmhSe6YCW257Mc+qZ73T
 mTYOLx0tyVnJ0danQcJO1ORWIhStKFnksHgP0=
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTksIDIwMTkgYXQgMTI6MjUgQU0gUm9kcmlnbyBTaXF1ZWlyYQo8cm9kcmln
b3NpcXVlaXJhbWVsb0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBKdW4gMTgsIDIwMTkg
YXQgNzowOCBQTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+IHdyb3RlOgo+ID4KPiA+
IE9uIFdlZCwgSnVuIDE5LCAyMDE5IGF0IDEyOjA2IEFNIERhbmllbCBWZXR0ZXIgPGRhbmllbEBm
ZndsbC5jaD4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIFR1ZSwgSnVuIDE4LCAyMDE5IGF0IDExOjU0
IFBNIFJvZHJpZ28gU2lxdWVpcmEKPiA+ID4gPHJvZHJpZ29zaXF1ZWlyYW1lbG9AZ21haWwuY29t
PiB3cm90ZToKPiA+ID4gPiBGaW5hbGx5LCBub3QgcmVsYXRlZCB3aXRoIHRoaXMgcGF0Y2hzZXQs
IGNhbiBJIGFwcGx5IHRoZSBwYXRjaAo+ID4gPiA+IOKAnGRybS9kcm1fdmJsYW5rOiBDaGFuZ2Ug
RUlOVkFMIGJ5IHRoZSBjb3JyZWN0IGVycm5v4oCdIFsxXSBvciBkbyBJIG5lZWQKPiA+ID4gPiBt
b3JlIFNvQj8gSeKAmWxsIGFsc28gYXBwbHkgT2xlZyBwYXRjaCAoZHJtL3ZrbXM6IGFkZCBjcmMg
c291cmNlcyBsaXN0KS4KPiA+ID4gPgo+ID4gPiA+IDEuIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVk
ZXNrdG9wLm9yZy9wYXRjaC8zMTAwMDYvP3Nlcmllcz01MDY5NyZyZXY9NAo+ID4gPgo+ID4gPiBJ
ZiB5b3Ugd2FudCBnZXQgc29tZSBhY2tzIGZyb20gaWd0IG1haW50YWluZXJzICh0aG9zZSBwYXRj
aGVzIGxhbmRlZAo+ID4gPiBub3csIHJpZ2h0KSwgYnV0IHRoaXMgaXMgZ29vZCBlbm91Z2guCj4g
Pgo+ID4gT2ggd2FpdCBjb3JyZWN0aW9uOiBNeSByZXZpZXcgaXMgY29uZGl0aW9uYWwgb24geW91
IGNoYW5naW5nIHRoYXQgb25lCj4gPiB0aGluZy4gU28gbmVlZHMgYW5vdGhlciB2ZXJzaW9uLiBT
aW5jZSB0aGlzIGlzIGEgZnVuY3Rpb25hbCBjaGFuZ2UgaW1vCj4gPiB0b28gbXVjaCB0byBmaXgg
dXAgd2hpbGUgYXBwbHlpbmcuCj4KPiBJbiB5b3VyIGNvbW1lbnQgeW91IHNhaWQ6Cj4KPiAgID4g
ICBpZiAodmJsd2FpdC0+cmVxdWVzdC50eXBlICYgX0RSTV9WQkxBTktfU0lHTkFMKQo+ICAgPiAt
IHJldHVybiAtRUlOVkFMOwo+ICAgPiArIHJldHVybiAtRU9QTk9UU1VQUDsKPgo+ICAgTm90IHN1
cmUgd2Ugd2FudCBFSU5WQUwgaGVyZSwgdGhhdCdzIGtpbmRhIGEgInBhcmFtZXRlcnMgYXJlIHdy
b25nIgo+ICAgdmVyc2lvbiB0b28uIFdpdGggdGhhdCBjaGFuZ2VkOgo+Cj4gSSB0aGluayBJIGRp
ZCBub3QgZ290IHlvdXIgcG9pbnQgaGVyZSwgc29ycnkgZm9yIHRoYXQuLi4gc28sIGRvIHlvdQo+
IHdhbnQgdGhhdCBJIGNoYW5nZSBFT1BOT1RTVVBQIGJ5IEVJTlZBTCBpbiB0aGUgYWJvdmUgY29k
ZT8KCk9vcHMsIHRoYXQgd2FzIHdyb25nLiBJIG1lYW50IHRvIHNheSB0aGF0IEkgZG9uJ3Qgc2Vl
IHdoeSB3ZSBzaG91bGQKdXNlIEVPUE5PVFNVUFAgaGVyZSwgdGhlIEVJTlZBTCBpbmRpY2F0aW5n
IGEgd3JvbmcgYXJndW1lbnQgc2VlbXMgbW9yZQpmaXR0aW5nIHRvIG1lLiBJdCdzIGJlZW4gcHJl
dHR5IG11Y2ggZm9yZXZlciAoaWYgd2UgZXZlcnkgc3VwcG9ydGVkCnRoaXMpIHRoYXQgdmJsYW5r
IHNpZ25hbCB3b3JrZWQgb24gbGludXguIE9rLCBkaWQgYSBxdWljayBjaGVjaywgaXQKZGllZCBp
biAyMDA5LiBUaGF0J3MgYmVmb3JlIHRoZSBrbXMgc3R1ZmYgbGFuZGVkLCB0aGVyZSdzIGRlZmlu
aXRlbHkKbm8gdXNlcnNwYWNlIGFyb3VuZCBhbnltb3JlIHRoYXQgZXZlciBleHBlY3RlZCB0aGlz
IHRvIHdvcmsgOi0pIEhlbmNlCndoeSBJIHRoaW5rIEVJTlZBTCBpcyBtb3JlIGZpdHRpbmcgLi4u
Ci1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBv
cmF0aW9uCis0MSAoMCkgNzkgMzY1IDU3IDQ4IC0gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
