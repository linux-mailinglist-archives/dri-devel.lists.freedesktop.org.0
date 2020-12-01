Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 376912CA914
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 17:58:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 103E06E5A4;
	Tue,  1 Dec 2020 16:58:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc44.google.com (mail-oo1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 339126E5A4
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 16:58:46 +0000 (UTC)
Received: by mail-oo1-xc44.google.com with SMTP id p15so553823oop.12
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Dec 2020 08:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zAjJCE4RFBNsZNOaMwuBYSM8amxnaZCYSnqnBf6wdJ8=;
 b=GAvEb+KIUsg7d0WrZtHscZSZfeXQfE1AQQRkQ+uCoUO3z93/8pNbdmSocF85p0WdE0
 MPmsoWN9LWknEl210HGAKJOGa9/i4cnBqIHE8Cn5uRoQ3g5gGaz+SzSrVSh87FtwF6iZ
 J9zuTDDEL39tKYuHjAv6mSNms1qtY22RgemDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zAjJCE4RFBNsZNOaMwuBYSM8amxnaZCYSnqnBf6wdJ8=;
 b=RtgaMDTkWrx2jzqGr4az8XqmOkh6N9nPQQrw+y3zaiQtLoBDBXJVtrCc6iv6Du2IAb
 B7SCVqBvMql7Y146GfzXUxKJGRo9Jk+Y1VdKoAoaWeJN9D+0LJTctkSFuyFspLaQss0u
 ez/gaB+oNFdqo0drnkfEUuCRth31kLMpjOjaM2MVtpOWVrVuvSdIVi8vg+ODnsONI6Pp
 S1J44hc213ZVXlTooRC5Ci+CBT61LRISYDlOyZ7IbbPu4M0217W7MJsA0Pb9NbNRnrkU
 cpBhXvANjH0GnZN6is0FzCtRXV5mx3WpZIfltDVdE4g/DYeK8q99dvqMxr01UjGKb1pQ
 s4VA==
X-Gm-Message-State: AOAM533hE0xQg54uqQTT+d86pk13CaVrqTOI1ue0YF0Ulr5CoCkj+8mv
 Ya1Yg3F708lRA/IiwkzzpVUGws9sjrsuPPQm7Z4f7g==
X-Google-Smtp-Source: ABdhPJyIJs8QOoxjYHhJnZMEj/bf7ZLz1L8mXda8XG0/F2rJLTAetbuBJhFnr5018b2Dynw3P8/MFQXKhswIIJUQva4=
X-Received: by 2002:a4a:84c9:: with SMTP id o9mr2499810oog.28.1606841925485;
 Tue, 01 Dec 2020 08:58:45 -0800 (PST)
MIME-Version: 1.0
References: <20201201133210.109309-1-christian.koenig@amd.com>
In-Reply-To: <20201201133210.109309-1-christian.koenig@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 1 Dec 2020 17:58:34 +0100
Message-ID: <CAKMK7uGvq4ZDzGuTF_FJ6nVAXS0Stmr4aBdUrbRrES_1ROHs1g@mail.gmail.com>
Subject: Re: [PATCH] drm/ttm: stop destroying pinned ghost object
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBEZWMgMSwgMjAyMCBhdCAyOjMyIFBNIENocmlzdGlhbiBLw7ZuaWcKPGNrb2VuaWcu
bGVpY2h0enVtZXJrZW5AZ21haWwuY29tPiB3cm90ZToKPgo+IERhbmllbCBhZGRlZCBhIHdhcm5p
bmcgZm9yIHRoaXMsIGJ1dCB3ZSB3ZXJlIGFidXNpbmcgdGhhdCBiZWhhdmlvciBoZXJlLgo+Cj4g
U2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29t
Pgo+IEZpeGVzOiA1N2ZjZDU1MGViMTUgKCJkcm0vdHRtOiBXYXJuIG9uIHBpbm5pbmcgd2l0aG91
dCBob2xkaW5nIGEgcmVmZXJlbmNlIikKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1f
Ym9fdXRpbC5jIHwgNCArKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191
dGlsLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMKPiBpbmRleCA3Y2NiMjI5
NWNhYzEuLjViYmMxMzM5ZDI4ZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0
bV9ib191dGlsLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMKPiBA
QCAtMzEwLDcgKzMxMCw3IEBAIHN0YXRpYyBpbnQgdHRtX2J1ZmZlcl9vYmplY3RfdHJhbnNmZXIo
c3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKPiAgICAgICAgIGtyZWZfaW5pdCgmZmJvLT5i
YXNlLmtyZWYpOwo+ICAgICAgICAgZmJvLT5iYXNlLmRlc3Ryb3kgPSAmdHRtX3RyYW5zZmVyZWRf
ZGVzdHJveTsKPiAgICAgICAgIGZiby0+YmFzZS5hY2Nfc2l6ZSA9IDA7Cj4gLSAgICAgICBmYm8t
PmJhc2UucGluX2NvdW50ID0gMTsKPiArICAgICAgIGZiby0+YmFzZS5waW5fY291bnQgPSAwOwoK
V2FzIHRoaXMganVzdCB0byBwcmV2ZW50IGxydSByZWFwaW5nLCBhbmQgbGV0IHRoZSBidWZmZXIg
ZGVsZXRpb24gY29kZQpjbGVhbiB1cCBldmVyeXRoaW5nIHdoZW4gaXQncyBhbGwgZG9uZT8gSnVz
dCBraW5kYSBmcmVha2luZyBvdXQgdGhhdAp0aGVyZSdzIG5vIHVucGluIGFueXdoZXJlIC4uLgoK
QW55d2F5IHRyYWNraW5nIGdob3N0IG9iamVjdHMgd2l0aCB0aGUgbHJ1IGxpa2UgYW55dGhpbmcg
ZWxzZSBpbnN0ZWFkCm9mIHRyaWNrcyB3aXRoIHBpbiBjb3VudCBzb3VuZHMgbGlrZSBhIGdvb2Qg
aWRlYS4KCkFja2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgoK
QnV0IG1heWJlIGFzayBEYXZlIG9yIFRob21hcyBmb3IgYSBzZWNvbmQgY2hlY2suCi1EYW5pZWwK
Cj4gICAgICAgICBpZiAoYm8tPnR5cGUgIT0gdHRtX2JvX3R5cGVfc2cpCj4gICAgICAgICAgICAg
ICAgIGZiby0+YmFzZS5iYXNlLnJlc3YgPSAmZmJvLT5iYXNlLmJhc2UuX3Jlc3Y7Cj4KPiBAQCAt
MzE5LDYgKzMxOSw4IEBAIHN0YXRpYyBpbnQgdHRtX2J1ZmZlcl9vYmplY3RfdHJhbnNmZXIoc3Ry
dWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKPiAgICAgICAgIHJldCA9IGRtYV9yZXN2X3RyeWxv
Y2soJmZiby0+YmFzZS5iYXNlLl9yZXN2KTsKPiAgICAgICAgIFdBUk5fT04oIXJldCk7Cj4KPiAr
ICAgICAgIHR0bV9ib19tb3ZlX3RvX2xydV90YWlsX3VubG9ja2VkKCZmYm8tPmJhc2UpOwo+ICsK
PiAgICAgICAgICpuZXdfb2JqID0gJmZiby0+YmFzZTsKPiAgICAgICAgIHJldHVybiAwOwo+ICB9
Cj4gLS0KPiAyLjI1LjEKPgoKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJ
bnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
