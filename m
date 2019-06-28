Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB7C5955D
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 09:51:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C1226E898;
	Fri, 28 Jun 2019 07:51:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 750826E898
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 07:51:02 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id t76so3622830oih.4
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 00:51:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dtEeeslQGtSEA9L6niIK/BiiKT9ny7fWORJgUMeGMeM=;
 b=mglchNhjyxCE6L5OFm/ZQPM8nDixNGWqjGMTBCWYp63lRdv+YBZD/vd0Ce1jSXKyXT
 Fx0zao8jLGPpLoRhh/pqjCRFbGu2khfOC6mb2YzWmlk1wa8lsGjvjni8EpV+pKNBjIsW
 HUoPLOH78VyOS6M3Jh72i/XIou7CYLMbIipZHus/qhCOXVSv7DYQhYQjbzSHa/N2lJCK
 Ewrkp7QkfNcotS/hRbyUHYUzicdj/1W4qmc7/1LAwtWW3YG1S0j8vTIdczep+Kpb4zVQ
 WKeiwcOEgFaUZ3MrBBVJN0lvk2L7e5c80D9w41RPGD3187RO9LiYvmtAGpY28cz9yKye
 TxJw==
X-Gm-Message-State: APjAAAWHONMHgOCDBMl5wqgT7iCsYyvZ91+kvxjm7NOmoAEET3yhi5Al
 d3IZriKuD/dF2kpkMyS8qRgzy6WIauPbgmWYZcH3vAC5XMY=
X-Google-Smtp-Source: APXvYqyk8bRZ5DrMcNPTQLIz0eecXfgskTMeKRlhIPO1v1UMKP/TvAGHP8JcOmbE44QLXsNbe1bQh8L6hk5XcGONS5o=
X-Received: by 2002:aca:5403:: with SMTP id i3mr910923oib.132.1561708261619;
 Fri, 28 Jun 2019 00:51:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190621115755.8481-1-kraxel@redhat.com>
 <20190621115755.8481-3-kraxel@redhat.com>
 <e3d8d1ee-c033-0402-6058-7c2410cc250b@suse.de>
In-Reply-To: <e3d8d1ee-c033-0402-6058-7c2410cc250b@suse.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 28 Jun 2019 09:50:49 +0200
Message-ID: <CAKMK7uFwsQ4pVpAtsP4RBCY2RNkvcnc+QqTkEX5VT+pkJ-kLVA@mail.gmail.com>
Subject: Re: [PATCH v2 02/18] drm/vram: use embedded gem object
To: Thomas Zimmermann <tzimmermann@suse.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=dtEeeslQGtSEA9L6niIK/BiiKT9ny7fWORJgUMeGMeM=;
 b=T5j70Eo4vp8nN+Svf88JQpEcxGjOkbz23tiEnT7qrDiszCiSqmelKH+f6fBQ/MAf9j
 gt56mV6PN6Bcg/epHs4JZymlfn8piiQStw/8xsAIP6Gi2J2KMkllwj78FWKCrfYgJzPA
 31XI50kNydlAEA0qL64xKa6CIRwQAAhvgLAJY=
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>, David Airlie <airlied@linux.ie>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Chen Feng <puck.chen@hisilicon.com>, Rongrong Zou <zourongrong@gmail.com>,
 Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMjgsIDIwMTkgYXQgOTozMCBBTSBUaG9tYXMgWmltbWVybWFubiA8dHppbW1l
cm1hbm5Ac3VzZS5kZT4gd3JvdGU6Cj4KPiBIaQo+Cj4gQW0gMjEuMDYuMTkgdW0gMTM6NTcgc2No
cmllYiBHZXJkIEhvZmZtYW5uOgo+ID4gRHJvcCBkcm1fZ2VtX29iamVjdCBmcm9tIGRybV9nZW1f
dnJhbV9vYmplY3QsIHVzZSB0aGUKPiA+IHR0bV9idWZmZXJfb2JqZWN0LmJhc2UgaW5zdGVhZC4K
PiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4K
PiA+IC0tLQo+ID4gIGluY2x1ZGUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuaCAgICAgICAgICAg
fCAgMyArLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tYWluLmMgICAgICAgICAgICAg
IHwgIDIgKy0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5jICAgICAg
IHwgMTYgKysrKysrKystLS0tLS0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24vaGli
bWMvaGlibWNfdHRtLmMgfCAgMiArLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcy
MDBfbWFpbi5jICAgICAgfCAgMiArLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS92Ym94dmlkZW8vdmJv
eF9tYWluLmMgICAgICAgfCAgMiArLQo+ID4gIDYgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9u
cygrKSwgMTQgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2Ry
bV9nZW1fdnJhbV9oZWxwZXIuaCBiL2luY2x1ZGUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuaAo+
ID4gaW5kZXggOTU4MWVhMGE0ZjdlLi43YjlmNTBiYTNmY2UgMTAwNjQ0Cj4gPiAtLS0gYS9pbmNs
dWRlL2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmgKPiA+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9n
ZW1fdnJhbV9oZWxwZXIuaAo+ID4gQEAgLTM2LDcgKzM2LDYgQEAgc3RydWN0IHZtX2FyZWFfc3Ry
dWN0Owo+ID4gICAqIHZpZGVvIG1lbW9yeSBiZWNvbWVzIHNjYXJjZS4KPiA+ICAgKi8KPiA+ICBz
dHJ1Y3QgZHJtX2dlbV92cmFtX29iamVjdCB7Cj4gPiAtICAgICBzdHJ1Y3QgZHJtX2dlbV9vYmpl
Y3QgZ2VtOwo+ID4gICAgICAgc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0IGJvOwo+ID4gICAgICAg
c3RydWN0IHR0bV9ib19rbWFwX29iaiBrbWFwOwo+ID4KPiA+IEBAIC02OCw3ICs2Nyw3IEBAIHN0
YXRpYyBpbmxpbmUgc3RydWN0IGRybV9nZW1fdnJhbV9vYmplY3QgKmRybV9nZW1fdnJhbV9vZl9i
bygKPiA+ICBzdGF0aWMgaW5saW5lIHN0cnVjdCBkcm1fZ2VtX3ZyYW1fb2JqZWN0ICpkcm1fZ2Vt
X3ZyYW1fb2ZfZ2VtKAo+ID4gICAgICAgc3RydWN0IGRybV9nZW1fb2JqZWN0ICpnZW0pCj4KPiBU
byBhdm9pZCBhbWJpZ3VpdGllcywgSSB1c2VkIHRoZSBmb3JtIDxkZXN0aW5hdGlvbiB0eXBlIG5h
bWU+X29mXzxmaWVsZAo+IG5hbWU+KCkgdG8gbmFtZSB0aGVzZSBjYXN0IGZ1bmN0aW9ucy4gVGhl
IGNhbm9uaWNhbCBuYW1lIGhlcmUgd291bGQgbm93Cj4gYmUgZHJtX2dlbV92cmFtX29mX2JvX2Jh
c2UoKS4gQnV0IHRoYXQncyBqdXN0IG5pdHBpY2tpbmcuIElmIHlvdSBkb24ndAo+IHdhbnQgdG8g
Y2hhbmdlIHRoZSBuYW1lIChhbmQgYWxsIGl0cyBjYWxsZXJzKSwgbWF5YmUgbGVhdmUgYSBGSVhN
RSBjb21tZW50LgoKQmlrZXNoZWQ6IEkgdGhpbmsgZ2VuZXJhbGx5IHdlIGNhbGwgdGhlc2UKPHNv
dXJjZV90eXBlPl90b188ZGVzdGluYXRpb25fdHlwZT4sIHdpdGggdGhlIHNvdXJjZSB0eXBlIGxl
ZnQgb3V0IGlmCnlvdSBjYXN0IGZyb20gdGhlIG1vc3QgZ2VuZXJpYyB2ZXJzaW9uLiBFLmcuIHRo
aXMgb25lIGhlcmUgd291bGQganVzdApiZQoKc3RhdGljIGlubGluZSBzdHJ1Y3QgZHJtX2dlbV92
cmFtX29iamVjdCAqZHJtX2dlbV90b192cmFtX2JvKHN0cnVjdApkcm1fZ2VtX29iamVjdCAqZ2Vt
KQoKb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4gSSBkb24ndCByZW1lbWJlciBoYXZpbmcgc2VlbiB0
aGUgKl9vZl8qCnBhdHRlcm4gYW55d2hlcmUuCi1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29m
dHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCis0MSAoMCkgNzkgMzY1IDU3IDQ4IC0g
aHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
