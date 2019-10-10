Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEE9D30DC
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 20:49:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEF1A6E3BC;
	Thu, 10 Oct 2019 18:49:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3EA76E3BC
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 18:49:34 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id r2so2285056ybg.3
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 11:49:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n9glmzMsjEQ54wWh9m1TLXnnqt0zz0o1L0ZQOtKhkaY=;
 b=N5jKqZs4LqCIVm1xFyFVXc2ax5aOTORDihqFvTPNjQgfAC5KsM/HClE1DSH6EMo5nN
 dadCP6qIVqOw1D6t9ic0Ou/fmHyYz5j/h35JlnkdSCYgmhiW1l+RDsP6jFo2ZVjVDV34
 H/MBx3uz40stLacpg5N/XE0729rAkOffedl+uwdHf3DMI8YyLQcR++WNimXVedfCQ5Lb
 R4G2necZtFn3J3QKWbundr0hs70X3cS6xf6BfzR7qVezyiYLUBPmoLeHp/5odi8LxjP9
 kcSSBC4z/EbpKa0h3LfkOmXKqpThaBgpbIC5irTMWnYCTUVvWP/V8hpxjIHckNoGc8jf
 0f8Q==
X-Gm-Message-State: APjAAAWOLFB/E4UdPZevswJPLI+URWv3wFJzDdREoMZ9XeoikqiekTYg
 ir8nF+Mq5hLcqOMDw5UlbTaXZ7j4kXvbobAwJh7ilA==
X-Google-Smtp-Source: APXvYqxO5LUzQhIB19OQbbQWkVY2d5dQOnkoMxjj/mE3lLAFUU2bvc4EQPHrOOU7RC7bODaE4Hf14hqvDHZ5NbFXHnQ=
X-Received: by 2002:a25:348e:: with SMTP id b136mr7032957yba.159.1570733373815; 
 Thu, 10 Oct 2019 11:49:33 -0700 (PDT)
MIME-Version: 1.0
References: <20191009213454.32891-1-jeffrey.l.hugo@gmail.com>
 <20191010184544.GK85762@art_vandelay>
In-Reply-To: <20191010184544.GK85762@art_vandelay>
From: Sean Paul <sean@poorly.run>
Date: Thu, 10 Oct 2019 14:48:57 -0400
Message-ID: <CAMavQKJ7iMD+4a0eftNre9xMvyoZy_=sAPRAuMctX5bueugk1g@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dsi: Implement reset correctly
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=n9glmzMsjEQ54wWh9m1TLXnnqt0zz0o1L0ZQOtKhkaY=;
 b=fDdQv6ZqcWcquRA0TqInY5GiGIZQO3lADzd19fpsRGR6VxXATIBGBh0cAm1MT69jW6
 fezVNb3MvUHgvELpLib8es8l5CGYbc8+ZeHVwm5pd2oCvKl5dN0dIfJFJlR2IeeNW81N
 xODItm3Q1JB4veO/2+rLOtqc5wFGXPm/XCdevrrGnQ1L8ZF3GR+VtmD+4fURxM22Tl+j
 8e6ZMiTeIV5oyEf5j5Uilzmd9fzfE60h4zXloDON32Iug1gvf5m8/eQLQA8d09A05dpu
 WiFvmJQ2fltbQ8xbgb0iZ55JkTQE94yd+YgfXV00R+2Dke1JqkRvEm9R1UsuDXmy84gK
 9IhQ==
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

T24gVGh1LCBPY3QgMTAsIDIwMTkgYXQgMjo0NSBQTSBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1
bj4gd3JvdGU6Cj4KPiBPbiBXZWQsIE9jdCAwOSwgMjAxOSBhdCAwMjozNDo1NFBNIC0wNzAwLCBK
ZWZmcmV5IEh1Z28gd3JvdGU6Cj4gPiBPbiBtc204OTk4LCB2YmxhbmsgdGltZW91dHMgYXJlIG9i
c2VydmVkIGJlY2F1c2UgdGhlIERTSSBjb250cm9sbGVyIGlzIG5vdAo+ID4gcmVzZXQgcHJvcGVy
bHksIHdoaWNoIGVuZHMgdXAgc3RhbGxpbmcgdGhlIE1EUC4gIFRoaXMgaXMgYmVjYXVzZSB0aGUg
cmVzZXQKPiA+IGxvZ2ljIGlzIG5vdCBjb3JyZWN0IHBlciB0aGUgaGFyZHdhcmUgZG9jdW1lbnRh
dGlvbi4KPiA+Cj4gPiBUaGUgZG9jdW1lbnRhdGlvbiBzdGF0ZXMgdGhhdCBhZnRlciBhc3NlcnRp
bmcgcmVzZXQsIHNvZnR3YXJlIHNob3VsZCB3YWl0Cj4gPiBzb21lIHRpbWUgKG5vIGluZGljYXRp
b24gb2YgaG93IGxvbmcpLCBvciBwb2xsIHRoZSBzdGF0dXMgcmVnaXN0ZXIgdW50aWwgaXQKPiA+
IHJldHVybnMgMCBiZWZvcmUgZGVhc3NlcnRpbmcgcmVzZXQuCj4gPgo+ID4gd21iKCkgaXMgaW5z
dWZmaWNpZW50IGZvciB0aGlzIHB1cnBvc2Ugc2luY2UgaXQganVzdCBlbnN1cmVzIG9yZGVyaW5n
LCBub3QKPiA+IHRpbWluZyBiZXR3ZWVuIHdyaXRlcy4gIFNpbmNlIGFzc2VydGluZyBhbmQgZGVh
c3NlcnRpbmcgcmVzZXQgb2NjdXJzIG9uIHRoZQo+ID4gc2FtZSByZWdpc3Rlciwgb3JkZXJpbmcg
aXMgYWxyZWFkeSBndWFyYW50ZWVkIGJ5IHRoZSBhcmNoaXRlY3R1cmUsIG1ha2luZwo+ID4gdGhl
IHdtYiBleHRyYW5lb3VzLgo+ID4KPiA+IFNpbmNlIHdlIHdvdWxkIGRlZmluZSBhIHRpbWVvdXQg
Zm9yIHBvbGxpbmcgdGhlIHN0YXR1cyByZWdpc3RlciB0byBhdm9pZCBhCj4gPiBwb3NzaWJsZSBp
bmZpbml0ZSBsb29wLCBsZXRzIGp1c3QgdXNlIGEgc3RhdGljIGRlbGF5IG9mIDIwIG1zLCBzaW5j
ZSAxNi42NjYKPiA+IG1zIGlzIHRoZSB0aW1lIGF2YWlsYWJsZSB0byBwcm9jZXNzIG9uZSBmcmFt
ZSBhdCA2MCBmcHMuCj4gPgo+ID4gRml4ZXM6IGE2ODk1NTRiYTZlZCAoZHJtL21zbTogSW5pdGlh
bCBhZGQgRFNJIGNvbm5lY3RvciBzdXBwb3J0KQo+ID4gU2lnbmVkLW9mZi1ieTogSmVmZnJleSBI
dWdvIDxqZWZmcmV5LmwuaHVnb0BnbWFpbC5jb20+Cj4gPiAtLS0KPiA+Cj4gPiBSb2IgZXQgYWws
IGlzIGl0IHBvc3NpYmxlIGZvciB0aGlzIHRvIGdvIGludG8gYSA1LjQtcmM/CgpTb3JyeSwgSSBt
aXNzZWQgdGhpcyBvbiB0aGUgZmlyc3QgZ28tYXJvdW5kLCBJJ20gT2sgd2l0aCB0aGlzIGdldHRp
bmcKaW50byA1LjQuIFJvYiwgaWYgeW91J3JlIE9rIHdpdGggdGhpcywgSSBjYW4gc2VuZCBpdCB0
aHJvdWdoIC1taXNjCnVubGVzcyB5b3UncmUgcGxhbm5pbmcgYW4gbXNtLWZpeGVzIFBSLgoKPiA+
Cj4gPiAgZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvZHNpX2hvc3QuYyB8IDQgKystLQo+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL2RzaV9ob3N0LmMgYi9kcml2ZXJzL2dw
dS9kcm0vbXNtL2RzaS9kc2lfaG9zdC5jCj4gPiBpbmRleCA2NjNmZjlmNGZhYzkuLjY4ZGVkOWI0
NzM1ZCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL2RzaV9ob3N0LmMK
PiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL2RzaV9ob3N0LmMKPiA+IEBAIC05ODYs
NyArOTg2LDcgQEAgc3RhdGljIHZvaWQgZHNpX3N3X3Jlc2V0KHN0cnVjdCBtc21fZHNpX2hvc3Qg
Km1zbV9ob3N0KQo+ID4gICAgICAgd21iKCk7IC8qIGNsb2NrcyBuZWVkIHRvIGJlIGVuYWJsZWQg
YmVmb3JlIHJlc2V0ICovCj4gPgo+ID4gICAgICAgZHNpX3dyaXRlKG1zbV9ob3N0LCBSRUdfRFNJ
X1JFU0VULCAxKTsKPiA+IC0gICAgIHdtYigpOyAvKiBtYWtlIHN1cmUgcmVzZXQgaGFwcGVuICov
Cj4gPiArICAgICBtc2xlZXAoMjApOyAvKiBtYWtlIHN1cmUgcmVzZXQgaGFwcGVuICovCj4KPiBD
b3VsZCB5b3UgcGxlYXNlIHB1bGwgdGhpcyBvdXQgaW50byBhICNkZWZpbmUgdXNlZCBmb3IgYm90
aCBpbiBjYXNlIHdlIGRlY2lkZSB0bwo+IHR3ZWFrIGl0PyBJIGRvbid0IHdhbnQgdGhlc2UgMiB2
YWx1ZXMgdG8gZHJpZnQuCj4KCm9oIHllYWgsIGFuZCB3aXRoIHRoYXQgZml4ZWQsCgpSZXZpZXdl
ZC1ieTogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+Cgo+IFRoYW5rcywKPiBTZWFuCj4KPiA+
ICAgICAgIGRzaV93cml0ZShtc21faG9zdCwgUkVHX0RTSV9SRVNFVCwgMCk7Cj4gPiAgfQo+ID4K
PiA+IEBAIC0xMzk2LDcgKzEzOTYsNyBAQCBzdGF0aWMgdm9pZCBkc2lfc3dfcmVzZXRfcmVzdG9y
ZShzdHJ1Y3QgbXNtX2RzaV9ob3N0ICptc21faG9zdCkKPiA+Cj4gPiAgICAgICAvKiBkc2kgY29u
dHJvbGxlciBjYW4gb25seSBiZSByZXNldCB3aGlsZSBjbG9ja3MgYXJlIHJ1bm5pbmcgKi8KPiA+
ICAgICAgIGRzaV93cml0ZShtc21faG9zdCwgUkVHX0RTSV9SRVNFVCwgMSk7Cj4gPiAtICAgICB3
bWIoKTsgIC8qIG1ha2Ugc3VyZSByZXNldCBoYXBwZW4gKi8KPiA+ICsgICAgIG1zbGVlcCgyMCk7
ICAgICAvKiBtYWtlIHN1cmUgcmVzZXQgaGFwcGVuICovCj4gPiAgICAgICBkc2lfd3JpdGUobXNt
X2hvc3QsIFJFR19EU0lfUkVTRVQsIDApOwo+ID4gICAgICAgd21iKCk7ICAvKiBjb250cm9sbGVy
IG91dCBvZiByZXNldCAqLwo+ID4gICAgICAgZHNpX3dyaXRlKG1zbV9ob3N0LCBSRUdfRFNJX0NU
UkwsIGRhdGEwKTsKPiA+IC0tCj4gPiAyLjE3LjEKPiA+Cj4KPiAtLQo+IFNlYW4gUGF1bCwgU29m
dHdhcmUgRW5naW5lZXIsIEdvb2dsZSAvIENocm9taXVtIE9TCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
