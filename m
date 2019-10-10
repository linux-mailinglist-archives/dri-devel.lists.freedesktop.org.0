Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB10D3995
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 08:48:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EBBF6EBB6;
	Fri, 11 Oct 2019 06:48:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3E096E3B5;
 Thu, 10 Oct 2019 19:00:03 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id c25so16041592iot.12;
 Thu, 10 Oct 2019 12:00:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cA1nu7WjrWAqmer6330wc0ijhhk83SGo4tS7biMmkzM=;
 b=iGUbKdGhttRIkoCOs2tJYKveful5X8RCzeXcilFen3+wm6V4VvlrppU9URBWKbCPf8
 S4KvszztJN6RbVAZSfZp98xmgQrnFz454enhkI2UOYUxLL+01fhjNlyoSmIynqnq/ir/
 b0fi+UevkWmhBUQYiSzerL+h/hpIQLEQmS5HVXx1sjFyLuiF2Pw0ZMNpjK3bT6mdELlP
 BVsEpy63X3TCA17LAne46d8pX1T11WVmUisFGlR23Xa/8nIQo8OKxCCgHakpr6DWJRyc
 or6SL+jV+t4joCZC41ykm/S7uCeT7d1ijgxAYpZyBtKasXUNnW4rw+TgD0AfO2fD8mIA
 IrSg==
X-Gm-Message-State: APjAAAV9EJCETov3QPEATdDNxVfPyfqD7PZsLxrNLVdVHfXybrIVUltX
 TTNsU9wnvHf+8gBJwwb3zHL1HJtsK9l/Lp52Wg8=
X-Google-Smtp-Source: APXvYqy2jIsV/0okFyYF1KBC8/M37CPZIxf/tq3+cYPkx00MgiScI6/1sGtqXgBQgssHUI2lYs/pujp8uSI9sAIhI4E=
X-Received: by 2002:a5d:904e:: with SMTP id v14mr11728084ioq.33.1570734003178; 
 Thu, 10 Oct 2019 12:00:03 -0700 (PDT)
MIME-Version: 1.0
References: <20191009213454.32891-1-jeffrey.l.hugo@gmail.com>
 <20191010184544.GK85762@art_vandelay>
 <CAMavQKJ7iMD+4a0eftNre9xMvyoZy_=sAPRAuMctX5bueugk1g@mail.gmail.com>
In-Reply-To: <CAMavQKJ7iMD+4a0eftNre9xMvyoZy_=sAPRAuMctX5bueugk1g@mail.gmail.com>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Thu, 10 Oct 2019 12:59:52 -0600
Message-ID: <CAOCk7NqW=85qduSFquCgivHTDxDpJ7xK9zBjgbd1nM8QS7xM=Q@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dsi: Implement reset correctly
To: Sean Paul <sean@poorly.run>
X-Mailman-Approved-At: Fri, 11 Oct 2019 06:48:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=cA1nu7WjrWAqmer6330wc0ijhhk83SGo4tS7biMmkzM=;
 b=ZgAEAuKGNSm1/2mqvjdNeg2BeAXi21dVyn9q62E+Iu/ozmBo3wcCaT/7BKIoBAZOTj
 dDAHRUs/OzQ4mTOWyMfo+0XcOuQL0I26UncPEfNPzUC804jb3T4Ly123g8ax48QIngr6
 ER3d5u50DZRrZBkNfjBnSDd9Ru7og2vz6dQCKOlRmNo8Q6gP2XcFXUmp1fISS1lJQO3C
 7yVg8gGSq3+aJ1brvf7pGPBu/31vmXwMNyeEIdVATaihqc7Q3kjg9bKwkGJF57w2L3RJ
 /5EEERwn/sqHHPy8HoLZ9eMxPloJNKEjdVsMYUrO2tZps2E0fU1HCPGcaKdEWGBDtoXi
 1xRw==
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
Cc: Dave Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMTAsIDIwMTkgYXQgMTI6NDkgUE0gU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5y
dW4+IHdyb3RlOgo+Cj4gT24gVGh1LCBPY3QgMTAsIDIwMTkgYXQgMjo0NSBQTSBTZWFuIFBhdWwg
PHNlYW5AcG9vcmx5LnJ1bj4gd3JvdGU6Cj4gPgo+ID4gT24gV2VkLCBPY3QgMDksIDIwMTkgYXQg
MDI6MzQ6NTRQTSAtMDcwMCwgSmVmZnJleSBIdWdvIHdyb3RlOgo+ID4gPiBPbiBtc204OTk4LCB2
YmxhbmsgdGltZW91dHMgYXJlIG9ic2VydmVkIGJlY2F1c2UgdGhlIERTSSBjb250cm9sbGVyIGlz
IG5vdAo+ID4gPiByZXNldCBwcm9wZXJseSwgd2hpY2ggZW5kcyB1cCBzdGFsbGluZyB0aGUgTURQ
LiAgVGhpcyBpcyBiZWNhdXNlIHRoZSByZXNldAo+ID4gPiBsb2dpYyBpcyBub3QgY29ycmVjdCBw
ZXIgdGhlIGhhcmR3YXJlIGRvY3VtZW50YXRpb24uCj4gPiA+Cj4gPiA+IFRoZSBkb2N1bWVudGF0
aW9uIHN0YXRlcyB0aGF0IGFmdGVyIGFzc2VydGluZyByZXNldCwgc29mdHdhcmUgc2hvdWxkIHdh
aXQKPiA+ID4gc29tZSB0aW1lIChubyBpbmRpY2F0aW9uIG9mIGhvdyBsb25nKSwgb3IgcG9sbCB0
aGUgc3RhdHVzIHJlZ2lzdGVyIHVudGlsIGl0Cj4gPiA+IHJldHVybnMgMCBiZWZvcmUgZGVhc3Nl
cnRpbmcgcmVzZXQuCj4gPiA+Cj4gPiA+IHdtYigpIGlzIGluc3VmZmljaWVudCBmb3IgdGhpcyBw
dXJwb3NlIHNpbmNlIGl0IGp1c3QgZW5zdXJlcyBvcmRlcmluZywgbm90Cj4gPiA+IHRpbWluZyBi
ZXR3ZWVuIHdyaXRlcy4gIFNpbmNlIGFzc2VydGluZyBhbmQgZGVhc3NlcnRpbmcgcmVzZXQgb2Nj
dXJzIG9uIHRoZQo+ID4gPiBzYW1lIHJlZ2lzdGVyLCBvcmRlcmluZyBpcyBhbHJlYWR5IGd1YXJh
bnRlZWQgYnkgdGhlIGFyY2hpdGVjdHVyZSwgbWFraW5nCj4gPiA+IHRoZSB3bWIgZXh0cmFuZW91
cy4KPiA+ID4KPiA+ID4gU2luY2Ugd2Ugd291bGQgZGVmaW5lIGEgdGltZW91dCBmb3IgcG9sbGlu
ZyB0aGUgc3RhdHVzIHJlZ2lzdGVyIHRvIGF2b2lkIGEKPiA+ID4gcG9zc2libGUgaW5maW5pdGUg
bG9vcCwgbGV0cyBqdXN0IHVzZSBhIHN0YXRpYyBkZWxheSBvZiAyMCBtcywgc2luY2UgMTYuNjY2
Cj4gPiA+IG1zIGlzIHRoZSB0aW1lIGF2YWlsYWJsZSB0byBwcm9jZXNzIG9uZSBmcmFtZSBhdCA2
MCBmcHMuCj4gPiA+Cj4gPiA+IEZpeGVzOiBhNjg5NTU0YmE2ZWQgKGRybS9tc206IEluaXRpYWwg
YWRkIERTSSBjb25uZWN0b3Igc3VwcG9ydCkKPiA+ID4gU2lnbmVkLW9mZi1ieTogSmVmZnJleSBI
dWdvIDxqZWZmcmV5LmwuaHVnb0BnbWFpbC5jb20+Cj4gPiA+IC0tLQo+ID4gPgo+ID4gPiBSb2Ig
ZXQgYWwsIGlzIGl0IHBvc3NpYmxlIGZvciB0aGlzIHRvIGdvIGludG8gYSA1LjQtcmM/Cj4KPiBT
b3JyeSwgSSBtaXNzZWQgdGhpcyBvbiB0aGUgZmlyc3QgZ28tYXJvdW5kLCBJJ20gT2sgd2l0aCB0
aGlzIGdldHRpbmcKPiBpbnRvIDUuNC4gUm9iLCBpZiB5b3UncmUgT2sgd2l0aCB0aGlzLCBJIGNh
biBzZW5kIGl0IHRocm91Z2ggLW1pc2MKPiB1bmxlc3MgeW91J3JlIHBsYW5uaW5nIGFuIG1zbS1m
aXhlcyBQUi4KPgo+ID4gPgo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvZHNpX2hvc3Qu
YyB8IDQgKystLQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNp
L2RzaV9ob3N0LmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9kc2lfaG9zdC5jCj4gPiA+IGlu
ZGV4IDY2M2ZmOWY0ZmFjOS4uNjhkZWQ5YjQ3MzVkIDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vbXNtL2RzaS9kc2lfaG9zdC5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9t
c20vZHNpL2RzaV9ob3N0LmMKPiA+ID4gQEAgLTk4Niw3ICs5ODYsNyBAQCBzdGF0aWMgdm9pZCBk
c2lfc3dfcmVzZXQoc3RydWN0IG1zbV9kc2lfaG9zdCAqbXNtX2hvc3QpCj4gPiA+ICAgICAgIHdt
YigpOyAvKiBjbG9ja3MgbmVlZCB0byBiZSBlbmFibGVkIGJlZm9yZSByZXNldCAqLwo+ID4gPgo+
ID4gPiAgICAgICBkc2lfd3JpdGUobXNtX2hvc3QsIFJFR19EU0lfUkVTRVQsIDEpOwo+ID4gPiAt
ICAgICB3bWIoKTsgLyogbWFrZSBzdXJlIHJlc2V0IGhhcHBlbiAqLwo+ID4gPiArICAgICBtc2xl
ZXAoMjApOyAvKiBtYWtlIHN1cmUgcmVzZXQgaGFwcGVuICovCj4gPgo+ID4gQ291bGQgeW91IHBs
ZWFzZSBwdWxsIHRoaXMgb3V0IGludG8gYSAjZGVmaW5lIHVzZWQgZm9yIGJvdGggaW4gY2FzZSB3
ZSBkZWNpZGUgdG8KPiA+IHR3ZWFrIGl0PyBJIGRvbid0IHdhbnQgdGhlc2UgMiB2YWx1ZXMgdG8g
ZHJpZnQuCj4gPgoKT2gsIHllYWguICBUaGF0J3MgYSByZWFsbHkgZ29vZCBwb2ludC4gIFdpbGwg
Zml4LgoKPgo+IG9oIHllYWgsIGFuZCB3aXRoIHRoYXQgZml4ZWQsCj4KPiBSZXZpZXdlZC1ieTog
U2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+CgpUaGFua3MuCgo+Cj4gPiBUaGFua3MsCj4gPiBT
ZWFuCj4gPgo+ID4gPiAgICAgICBkc2lfd3JpdGUobXNtX2hvc3QsIFJFR19EU0lfUkVTRVQsIDAp
Owo+ID4gPiAgfQo+ID4gPgo+ID4gPiBAQCAtMTM5Niw3ICsxMzk2LDcgQEAgc3RhdGljIHZvaWQg
ZHNpX3N3X3Jlc2V0X3Jlc3RvcmUoc3RydWN0IG1zbV9kc2lfaG9zdCAqbXNtX2hvc3QpCj4gPiA+
Cj4gPiA+ICAgICAgIC8qIGRzaSBjb250cm9sbGVyIGNhbiBvbmx5IGJlIHJlc2V0IHdoaWxlIGNs
b2NrcyBhcmUgcnVubmluZyAqLwo+ID4gPiAgICAgICBkc2lfd3JpdGUobXNtX2hvc3QsIFJFR19E
U0lfUkVTRVQsIDEpOwo+ID4gPiAtICAgICB3bWIoKTsgIC8qIG1ha2Ugc3VyZSByZXNldCBoYXBw
ZW4gKi8KPiA+ID4gKyAgICAgbXNsZWVwKDIwKTsgICAgIC8qIG1ha2Ugc3VyZSByZXNldCBoYXBw
ZW4gKi8KPiA+ID4gICAgICAgZHNpX3dyaXRlKG1zbV9ob3N0LCBSRUdfRFNJX1JFU0VULCAwKTsK
PiA+ID4gICAgICAgd21iKCk7ICAvKiBjb250cm9sbGVyIG91dCBvZiByZXNldCAqLwo+ID4gPiAg
ICAgICBkc2lfd3JpdGUobXNtX2hvc3QsIFJFR19EU0lfQ1RSTCwgZGF0YTApOwo+ID4gPiAtLQo+
ID4gPiAyLjE3LjEKPiA+ID4KPiA+Cj4gPiAtLQo+ID4gU2VhbiBQYXVsLCBTb2Z0d2FyZSBFbmdp
bmVlciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
