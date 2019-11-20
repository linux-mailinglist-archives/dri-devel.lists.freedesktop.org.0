Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F7D103998
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 13:10:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6B386E41D;
	Wed, 20 Nov 2019 12:09:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DF306E41D
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 12:09:58 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id d5so20969024otp.4
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 04:09:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=goxTE6Gl5d52lIQcOGPh5H94ZMm/ut6VPUBympYkYHs=;
 b=JZHujLhTxUBeQB22dLa3kqjG0Ca594IZzT+rwlnuJ7Ybwoe28xDRiLbpw8p3cioj05
 6ezRRL9zSzCrgRBLhUxlvFXDNLtYu+hM/9bNq2dlAcfm0/RMyxymGKhvC6pcHNXVjfjc
 OUKK5k/jcP6SRCBLSFmFvFqyp9aH89iGmYvE6oksmE7/IWgRe6cV02tI/1bqH+sicN/C
 A+DaLrJAS5I8xeREtb3jWjqObyOr37sKrRpsrHH4ob3EYHTl4+c8YRSRDXIAx/NUQzFx
 ex5QTQaenZg+7dEweKfZhQHSdJpV1j0k5XqHDsw7vfb5ocZJDkelnL8wpqYoDrCmVOWo
 6KsA==
X-Gm-Message-State: APjAAAXuq/1KJC9C7Had0JFvdh6rdOAKoS2VhJ/9f+LpAnFytiux7qFd
 XESExaBsN1nY+4jcTFXM4T3isxFffmgjKbL0W2KjCg==
X-Google-Smtp-Source: APXvYqwzEadZESEELS3Q8/j57i1nnwmNZrbJhS59kNiW2pmX9eLskE3I4AGfTg0z1bIKHekQJalSvtdGximIthf7knI=
X-Received: by 2002:a9d:1b4b:: with SMTP id l69mr1713997otl.303.1574251797703; 
 Wed, 20 Nov 2019 04:09:57 -0800 (PST)
MIME-Version: 1.0
References: <CAKMK7uHagBk6nGKenWZfd-ufb0h=WjzDVhctJyZ7g0Pi+H0+5Q@mail.gmail.com>
 <6540938e-b555-82c9-28e5-bbef3741863a@amd.com>
In-Reply-To: <6540938e-b555-82c9-28e5-bbef3741863a@amd.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 20 Nov 2019 13:09:46 +0100
Message-ID: <CAKMK7uEB9AqObaURdi8KdVBnwi8bWsmzZZ1WnSugutd4Zo0L0Q@mail.gmail.com>
Subject: Re: locking&resource refcounting for ttm_bo_kmap/dma_buf_vmap
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=goxTE6Gl5d52lIQcOGPh5H94ZMm/ut6VPUBympYkYHs=;
 b=WKM+Z73zZsY4qupjkMm9aDtBxdn9wrzdccvb+84yQrsLPwNXhMuQZB0fPqFqE7kWhB
 jKz+fkJOTTFB8kWhksYNFoeF299oYoCZRM5QoaUfdJ8QI9PhSBLHmNlU3JcjjEUtuzar
 uggZVmkUhiM0XaN818fpKAzs0BcTxJVQ9Qovk=
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel <dri-devel@lists.freedesktop.org>, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMTowMiBQTSBDaHJpc3RpYW4gS8O2bmlnCjxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+IHdyb3RlOgo+Cj4gPiBXaGF0IGFtIEkgbWlzc2luZz8KPiBUaGUg
YXNzdW1wdGlvbiBpcyB0aGF0IHdoZW4geW91IHdhbnQgdG8gY3JlYXRlIGEgdm1hcCBvZiBhIERN
QS1idWYKPiBidWZmZXIgdGhlIGJ1ZmZlciBuZWVkcyB0byBiZSBwaW5uZWQgc29tZWhvdy4KPgo+
IEUuZy4gd2l0aG91dCBkeW5hbWljIGRtYS1idWYgaGFuZGxpbmcgeW91IHdvdWxkIG5lZWQgdG8g
aGF2ZSBhbiBhY3RpdmUKPiBhdHRhY2htZW50LiBXaXRoIGR5bmFtaWMgaGFuZGxpbmcgdGhlIHJl
cXVpcmVtZW50cyBjb3VsZCBiZSBsb3dlcmVkIHRvCj4gdXNpbmcgdGhlIHBpbigpL3VucGluKCkg
Y2FsbGJhY2tzLgoKWWVhaCByaWdodCBub3cgZXZlcnlvbmUgc2VlbXMgdG8gaGF2ZSBhbiBhdHRh
Y2htZW50LCBhbmQgdGhhdCdzIGhvdyB3ZQpnZXQgYXdheSB3aXRoIGFsbCB0aGlzLiBCdXQgdGhl
IGludGVyZmFjZSBpc24ndCBzdXBwb3NlZCB0byB3b3JrIGxpa2UKdGhhdCwgZG1hX2J1Zl92bWFw
L3VubWFwIGlzIHN1cHBvc2VkIHRvIGJlIGEgc3RhbmQtYWxvbmUgdGhpbmcgKHlvdQpjYW4gY2Fs
bCBpdCBkaXJlY3RseSBvbiB0aGUgc3RydWN0IGRtYV9idWYsIG5vIG5lZWQgZm9yIGFuCmF0dGFj
aG1lbnQpLiBBbHNvIEkgZG9uJ3QgdGhpbmsgbm9uLWR5bmFtaWMgZHJpdmVycyBzaG91bGQgZXZl
ciBjYWxsCnBpbi91bnBpbiwgbm90IHRoZWlyIGpvYiwgaG9sZGluZyBvbnRvIGEgbWFwcGluZyBz
aG91bGQgYmUgZW5vdWdoIHRvCmdldCB0aGluZ3MgcGlubmVkLgoKPiBZb3UgYWxzbyBjYW4ndCBs
b2NrL3VubG9jayBpbnNpZGUgeW91ciB2bWFwIGNhbGxiYWNrIGJlY2F1c2UgeW91IGRvbid0Cj4g
aGF2ZSBhbnkgZ3VhcmFudGVlIHRoYXQgdGhlIHBvaW50ZXIgc3RheXMgdmFsaWQgYXMgc29vbiBh
cyB5b3VyIGRyb3AKPiB5b3VyIGxvY2suCgpXZWxsIHRoYXQncyB3aHkgSSBhc2tlZCB3aGVyZSB0
aGUgcGluL3VucGluIHBhaXIgaXMuIElmIHlvdSBsb2NrJnBpbiwKdGhlbiB5b3UgZG8ga25vdyB0
aGF0IHRoZSBwb2ludGVyIHdpbGwgc3RheSBhcm91bmQuIEJ1dCBsb29rcyBsaWtlIHRoZQpvcmln
aW5hbCBwYXRjaCBmcm9tIERhdmUgZm9yIHR0bSBiYXNlZCBkcml2ZXJzIHBsYXllZCBmYXN0Jmxv
b3NlIGhlcmUKd2l0aCB3aGF0IHNob3VsZCBiZSBkb25lLgoKPiBCVFc6IFdoYXQgaXMgdm1hcCgp
IHN0aWxsIHVzZWQgZm9yPwoKdWRsLCBidW5jaCBvZiBvdGhlciB0aGluZ3MgKGUuZy4gYnVuY2gg
b2YgdGlueSBkcml2ZXJzKS4gTm90IG11Y2gsIGJ1dApub3Qgc3R1ZmYgd2UgY2FuIGRyb3AuCi1E
YW5pZWwKCj4KPiBSZWdhcmRzLAo+IENocmlzdGlhbi4KPgo+IEFtIDIwLjExLjE5IHVtIDEyOjQ3
IHNjaHJpZWIgRGFuaWVsIFZldHRlcjoKPiA+IEhpIGFsbCwKPiA+Cj4gPiBJJ3ZlIGJlZW4gbG9v
a2luZyBhdCBkbWFfYnVmX3YodW4pbWFwLCB3aXRoIGEgZ29hbCB0byBzdGFuZGFyZGl6ZQo+ID4g
bG9ja2luZyBmb3IgYXQgbGVhc3QgZHluYW1pYyBkbWEtYnVmIGV4cG9ydGVycy9pbXBvcnRlcnMs
IG1vc3QgbGlrZWx5Cj4gPiBieSByZXF1aXJpbmcgZG1hX3Jlc3ZfbG9jay4gQW5kIEkgZ290IHF1
ZXN0aW9ucyBhcm91bmQgaG93IHRoaXMgaXMKPiA+IHN1cHBvc2VkIHRvIHdvcmssIHNpbmNlIGEg
YmlnIGNodW5rIG9mIGRyaXZlcnMgc2VlbSB0byBlbnRpcmVseSBsYWNrCj4gPiBsb2NraW5nIGFy
b3VuZCB0dG1fYm9fa21hcC4gVHdvIGJpZyBvbmVzOgo+ID4KPiA+IC0gdHRtX2JvX2ttYXAgbG9v
a3MgYXQgYm8tPm1lbSB0byBmaWd1cmUgb3V0IHdoYXQvd2hlcmUgdG8ga21hcCB0byBnZXQKPiA+
IGF0IHRoYXQgYnVmZmVyLiBiby0+bWVtIGlzIHN1cHBvc2VkIHRvIGJlIHByb3RlY3RlZCB3aXRo
Cj4gPiBkbWFfcmVzdl9sb2NrLCBidXQgYXQgbGVhc3QgYW1ncHUvbm91dmVhdS9yYWRlb24vcXhs
IGRvbid0IGdyYWIgdGhhdAo+ID4gaW4gdGhlaXIgcHJpbWUgdm1hcCBmdW5jdGlvbi4KPiA+Cj4g
PiAtIGJldHdlZW4gdGhlIHZtYXAgYW5kIHZ1bm1hcCBzb21ldGhpbmcgbmVlZHMgdG8gbWFrZSBz
dXJlIHRoZSBiYWNraW5nCj4gPiBzdG9yYWdlIGRvZXNuJ3QgbW92ZSBhcm91bmQuIEkgZGlkbid0
IGZpbmQgdGhhdCBlaXRoZXIgYW55d2hlcmUsCj4gPiB0dG1fYm9fa21hcCBzaW1wbHkgc2VlbXMg
dG8gc2V0IHVwIHRoZSBtYXBwaW5nLCBsZWF2aW5nIGxvY2tpbmcgYW5kCj4gPiByZWZjb3VudGlu
ZyB0byBjYWxsZXJzLgo+ID4KPiA+IC0gdnJhbSBoZWxwZXJzIGhhdmUgYXQgbGVhc3QgbG9ja2lu
ZywgYnV0IEknbSBzdGlsbCBtaXNzaW5nIHRoZQo+ID4gcmVmY291bnRpbmcuIHZtd2dmeCBkb2Vz
bid0IGJvdGhlciB3aXRoIHZtYXAuCj4gPgo+ID4gV2hhdCBhbSBJIG1pc3Npbmc/Cj4gPgo+ID4g
VGhhbmtzLCBEYW5pZWwKPgoKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJ
bnRlbCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xs
LmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
