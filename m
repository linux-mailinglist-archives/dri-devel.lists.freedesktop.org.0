Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DE96E192
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 09:16:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA8656E5BF;
	Fri, 19 Jul 2019 07:16:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17EDF6E3EF
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 15:17:23 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id s7so51913281iob.11
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 08:17:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lNr21Xxvun76oFcTohttI+fEqj00Jvnn+E2aS3PEEUA=;
 b=A1+MWSSmcXzJVSz/vmMiTIBrBqlTfMj6zK1+Jjct1U4ns7p+Yk9qPVPRYVr8Q6mjpE
 RdchzNQtCwPLfUrltvCo+90O6ko7Gwiy1BUpK0ycVCj0rP2H85M6AbfQfBaJnH4UhRmV
 cdJwelqvXzTK0oi5KRUIZYRtUUbU1qMqrr7IUHl2GY3vg2x/9g7vXQqKZ15h71L4+MhI
 dkQBjJIJfWJ1E/cpjH1fknuXLG9az+41UIr/3p9+Poy9rUf4vO4u3k7ccVw/Cw28ZohT
 1t5TeBSKG48rqju9YGQRgUlv0pEB5m4Q7y6HrFhE7W+pp5auuzf5oKSw6G7lJy5jE24F
 yQxQ==
X-Gm-Message-State: APjAAAXzsM0PRfnUaqDZCqWGRwFZo2el4kbriErqUCz6AvZzkmtAQI+b
 uMXPWskWD47jWU7e09777UCV99j3w1N5u4CCrRM=
X-Google-Smtp-Source: APXvYqxNmLrhjNA79cm/kVqf7d+Q5SHSJftO9uiWl0IW9ioT7MdB7s/V580kVwjs7CADY8ugWUpH2hOr8+QNwntOHVE=
X-Received: by 2002:a02:2245:: with SMTP id o66mr18526881jao.53.1563463042191; 
 Thu, 18 Jul 2019 08:17:22 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20190718134253epcas3p32a5afece52c47aaac0cd5795ff4cf022@epcas3p3.samsung.com>
 <20190718134240.2265724-1-arnd@arndb.de>
 <ea59751e-7391-e3e9-bb46-00e86b25f1a8@samsung.com>
 <CAK8P3a0q5xmi+mCvb1ET4d1uQmbnw+J2VkjRCzjemCXGy+5OBg@mail.gmail.com>
 <7da08013-5ee0-1c39-e16b-8b6843a28381@samsung.com>
 <CAK8P3a2nYArwNQrifW2xgzN=GUkN2wAjmZVo21JNw6YjHzwh7Q@mail.gmail.com>
In-Reply-To: <CAK8P3a2nYArwNQrifW2xgzN=GUkN2wAjmZVo21JNw6YjHzwh7Q@mail.gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Thu, 18 Jul 2019 18:17:09 +0300
Message-ID: <CAKdAkRS0w3KM-F95-F1jUicq2srAzWu21_7Npnw28F5fF+UxtA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: fix RC_CORE dependency
To: Arnd Bergmann <arnd@arndb.de>
X-Mailman-Approved-At: Fri, 19 Jul 2019 07:16:02 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=lNr21Xxvun76oFcTohttI+fEqj00Jvnn+E2aS3PEEUA=;
 b=URRIl3ZuHdXT55d5UnpugdudCrTxPjHu4Wu8xsigydt7FnxW2zWF592qetTV8Wa/Tk
 Vph/LKt2p8i8toal2eEjit/EcJ3SPYxw06c00xpt47/U0WqH1X66uL6b+lOXZL3HAOJI
 oSs+1irvQfwOCK09tCfhiZKoY9pTTNhOoQRUEK2hN6m9O5m37gRlXwkDgb7KpVcOK9tB
 4AB3JNuCDo8IeccCp87mDUaZ4gesARTE3bVA5VOUUuVvLEOhxlOeFNt/IrnI5ToyNLBL
 cXKkaTQfi5vqsI3dN7j75YlqdkgAZTttVtS90hmRLS7k8NauXvWmLpH3yLu5uBuBFhBl
 48Vg==
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
Cc: David Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Ronald_Tschal=C3=A4r?= <ronald@innovation.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgMTgsIDIwMTkgYXQgNjoxMyBQTSBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRi
LmRlPiB3cm90ZToKPgo+IE9uIFRodSwgSnVsIDE4LCAyMDE5IGF0IDQ6NTYgUE0gQW5kcnplaiBI
YWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4gd3JvdGU6Cj4gPiBPbiAxOC4wNy4yMDE5IDE2OjIx
LCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+ID4gPiBPbiBUaHUsIEp1bCAxOCwgMjAxOSBhdCA0OjE2
IFBNIEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+IHdyb3RlOgo+ID4gPj4gSGkg
QXJuZCwKPiA+ID4+Cj4gPiA+PiBPbiAxOC4wNy4yMDE5IDE1OjQyLCBBcm5kIEJlcmdtYW5uIHdy
b3RlOgo+ID4gPj4+IFVzaW5nICdpbXBseScgY2F1c2VzIGEgbmV3IHByb2JsZW0sIGFzIGl0IGFs
bG93cyB0aGUgY2FzZSBvZgo+ID4gPj4+IENPTkZJR19JTlBVVD1tIHdpdGggUkNfQ09SRT15LCB3
aGljaCBmYWlscyB0byBsaW5rOgo+ID4gPj4+Cj4gPiA+Pj4gZHJpdmVycy9tZWRpYS9yYy9yYy1t
YWluLm86IEluIGZ1bmN0aW9uIGBpcl9kb19rZXl1cCc6Cj4gPiA+Pj4gcmMtbWFpbi5jOigudGV4
dCsweDJiNCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGlucHV0X2V2ZW50Jwo+ID4gPj4+IGRy
aXZlcnMvbWVkaWEvcmMvcmMtbWFpbi5vOiBJbiBmdW5jdGlvbiBgcmNfcmVwZWF0JzoKPiA+ID4+
PiByYy1tYWluLmM6KC50ZXh0KzB4MzUwKTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgaW5wdXRf
ZXZlbnQnCj4gPiA+Pj4gZHJpdmVycy9tZWRpYS9yYy9yYy1tYWluLm86IEluIGZ1bmN0aW9uIGBy
Y19hbGxvY2F0ZV9kZXZpY2UnOgo+ID4gPj4+IHJjLW1haW4uYzooLnRleHQrMHg5MGMpOiB1bmRl
ZmluZWQgcmVmZXJlbmNlIHRvIGBpbnB1dF9hbGxvY2F0ZV9kZXZpY2UnCj4gPiA+Pj4KPiA+ID4+
PiBBZGQgYSAnZGVwZW5kcyBvbicgdGhhdCBhbGxvd3MgYnVpbGRpbmcgYm90aCB3aXRoIGFuZCB3
aXRob3V0Cj4gPiA+Pj4gQ09ORklHX1JDX0NPUkUsIGJ1dCBkaXNhbGxvd3MgY29tYmluYXRpb25z
IHRoYXQgZG9uJ3QgbGluay4KPiA+ID4+Pgo+ID4gPj4+IEZpeGVzOiA1MDIzY2YzMjIxMGQgKCJk
cm0vYnJpZGdlOiBtYWtlIHJlbW90ZSBjb250cm9sIG9wdGlvbmFsIikKPiA+ID4+PiBTaWduZWQt
b2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+ID4gPj4KPiA+ID4+IFByb3Bl
ciBzb2x1dGlvbiBoYXMgYmVlbiBhbHJlYWR5IG1lcmdlZCB2aWEgaW5wdXQgdHJlZVsxXS4KPiA+
ID4+Cj4gPiA+Pgo+ID4gPj4gWzFdOgo+ID4gPj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGtt
bC9DQUtkQWtSVEdYTmJVc3VLQVNOR0xmd1V3QzdBc29kOUs1YmFZTFBXUFU3RVgtNDIteUFAbWFp
bC5nbWFpbC5jb20vCj4gPiA+IEF0IHRoYXQgbGluaywgSSBvbmx5IHNlZSB0aGUgcGF0Y2ggdGhh
dCBjYXVzZWQgdGhlIHJlZ3Jlc3Npb24sIG5vdAo+ID4gPiB0aGUgc29sdXRpb24uIEFyZSB5b3Ug
c3VyZSBpdCdzIGZpeGVkPwo+ID4KPiA+Cj4gPiBVcHMsIHlvdSBhcmUgcmlnaHQsIEkgdGhvdWdo
IHlvdSBhcmUgZml4aW5nIHdoYXQgdGhpcyBwYXRjaCBhdHRlbXB0ZWQgdG8KPiA+IGZpeCA6KQo+
ID4KPiA+IEFueXdheSwgd2Ugd2FudCB0byBhdm9pZCBkZXBlbmRlbmN5IG9uIFJDX0NPUkUgLSB0
aGlzIGRyaXZlciBkb2VzIG5vdAo+ID4gcmVxdWlyZSBpdCwgYnV0IHdpdGggUkNfQ09SRSBpdCBo
YXMgYWRkaXRpb25hbCBmZWF0dXJlcy4KPgo+IFJpZ2h0LCB0aGF0J3Mgd2hhdCBteSBwYXRjaCBk
b2VzOiBpZiBSQ19DT1JFIGlzIGRpc2FibGVkLCB5b3UgY2FuCj4gc3RpbGwgc2V0IERSTV9TSUxf
U0lJODYyMD15LCBidXQgaWYgUkNfQ09SRT1tLCBEUk1fU0lMX1NJSTg2MjAKPiBjYW4gb25seSBi
ZSA9bSBvciA9bi4KPgo+ID4gTWF5YmUgImltcGx5IElOUFVUIiB3b3VsZCBoZWxwPwo+Cj4gTm8s
IHRoYXQgd291bGQgbWFrZSBpdCB3b3JzZS4gRGV2aWNlIGRyaXZlcnMgcmVhbGx5IGhhdmUgbm8g
YnVzaW5lc3MKPiB0dXJuaW5nIG9uIG90aGVyIHN1YnN5c3RlbXMuCj4KCk9LLCBpbiB0aGUgbWVh
bnRpbWUgSSB3aWxsIHJlZG8gdGhlIGJyYW5jaCBieSBkcm9wcGluZyB0aGUKc2lsLXNpaTg2MjAu
YyBLY29uZmlnIGNoYW5nZXMgYW5kIGFsc28gZHJvcCBhbGwgImltcGx5IiBidXNpbmVzcyBmcm9t
CmFwcGxlc3BpIGRyaXZlciBhcyB0aGV5IGdpdmUgdXMgbW9yZSB0cm91YmxlIHRoYW4gdGhleSBh
cmUgd29ydGguIFdlCmRvIG5vdCBoYXZlICJpbXBseSIgZm9yIGk4MDFfc21idXMgZm9yIFN5bWFw
dGljcyBTTUJVUyBtb2RlIGFuZCBpdAp3b3JrcyBmaW5lLiBJdCBpdCBkaXN0cm8ncyB0YXNrIHRv
IGNvbmZpZ3VyZSB0aGUga2VybmVsIHByb3Blcmx5LgoKVGhhbmtzLgoKLS0gCkRtaXRyeQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
