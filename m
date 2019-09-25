Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AA0BE54A
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 21:01:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BAFD6F3E5;
	Wed, 25 Sep 2019 19:01:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 649406ECF3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 19:01:00 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id g9so1438894ybi.7
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 12:01:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=f/jxq31Chxv3B7qohD7ZMPi0ff06Ouw1g9e6KDnszS4=;
 b=ptAY6mfQ9qbHlMKlGMHzrrALO644avnQ+HlZWat2bEgwOqMkSQPu83YcBEbc4j1fwn
 33HKVaT0J5OejDIGNY/YKUlLLOCE14M9TZqksrRJjzKnC1KKUfSgdYwpj/yEo0QZqN1q
 NYnVL6UzAq6fCX9KMQPxwkicGetM6ibV5YPp05fmeDxoOQJ+cwfflm+RbKCHXrzRy8lm
 Hd9nVmiaPvNAlbZ0QeBW4MlTynMXl4wCaa8Hg/+mmsJydCxgth7LuHFc4fzzI2QOA4zG
 oAz/GuarjhdfEsbPXG9AOB1YtxuSXC1anqs34JR7ws811c1dfMh3Zblr34zE3ufY+rJi
 DYhQ==
X-Gm-Message-State: APjAAAW33mi0LH3VYmNjONscCBtjzRI5HX4PG3lBmcCVNHfG8a6WEw7u
 2vUq50lynsC2QqtBPHqD4YaeOQ==
X-Google-Smtp-Source: APXvYqzfKz4T8IkinJTWtRrtM1fBKmKHmnrN8NDTD4zU/RM5ipGhD03BlIVvS2tvJfGBLi13R2mjng==
X-Received: by 2002:a25:f509:: with SMTP id a9mr4048605ybe.85.1569438059472;
 Wed, 25 Sep 2019 12:00:59 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id i14sm1346933ywe.107.2019.09.25.12.00.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2019 12:00:58 -0700 (PDT)
Date: Wed, 25 Sep 2019 15:00:58 -0400
From: Sean Paul <sean@poorly.run>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH v2 08/27] drm/dp_mst: Remove PDT teardown in
 drm_dp_destroy_port() and refactor
Message-ID: <20190925190058.GF218215@art_vandelay>
References: <20190903204645.25487-1-lyude@redhat.com>
 <20190903204645.25487-9-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190903204645.25487-9-lyude@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=f/jxq31Chxv3B7qohD7ZMPi0ff06Ouw1g9e6KDnszS4=;
 b=dqP9WlggW+YzUAoVttZW7SbwyfyXhXuvQ/pcf4gDYZUkEDO9fc6yg8+WBDvn/WnSvW
 35Nl8J+tlxvpTC/4O/q1YIn9TF/ZNJnSahvy7o+Iy6/OyrA41FQY4bu55o2OP6B62XcP
 9qmn70iZALGTGQ5d3m73y9qacyWfO5Oo1z6WNbnM+hH991JewFPFaKUFJ58DICRMmN8w
 ec+EXWP+WSEMn8g6a6qx+dB+mIms/bAsrPwDZNw2RIYWKmx1Ow8WVdejtzIS0KbABryg
 cHRJOTuOtfeM3M/aH521kcbThOT79EFrlzuuv7i15fuwr4B1JoJknvepLeApFe3477NB
 DqAA==
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
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Juston Li <juston.li@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Harry Wentland <hwentlan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMDMsIDIwMTkgYXQgMDQ6NDU6NDZQTSAtMDQwMCwgTHl1ZGUgUGF1bCB3cm90
ZToKPiBUaGlzIHdpbGwgYWxsb3cgdXMgdG8gYWRkIHNvbWUgbG9ja2luZyBmb3IgcG9ydC0+KiBt
ZW1iZXJzLCBpbgo+IHBhcnRpY3VsYXIgdGhlIFBEVCBhbmQgLT5jb25uZWN0b3IsIHdoaWNoIGNh
bid0IGJlIGRvbmUgZnJvbQo+IGRybV9kcF9kZXN0cm95X3BvcnQoKSBzaW5jZSB3ZSBkb24ndCBr
bm93IHdoYXQgbG9ja3MgdGhlIGNhbGxlciBtaWdodCBiZQo+IGhvbGRpbmcuCgpNaWdodCBiZSBu
aWNlIHRvIG1lbnRpb24gdGhhdCB0aGlzIGlzIGFscmVhZHkgZG9uZSBpbiB0aGUgZGVsYXllZCBk
ZXN0cm95IHdvcmtlcgpzbyByZWFkZXJzIGRvbid0IG5lZWQgdG8gZ28gbG9va2luZyBmb3IgaXQu
IFBlcmhhcHMgdXBkYXRlIHRoaXMgd2hlbiB5b3UgYXBwbHkKdGhlIHBhdGNoLgoKPiAKPiBDaGFu
Z2VzIHNpbmNlIHYyOgo+ICogQ2xhcmlmeSBjb21taXQgbWVzc2FnZQo+IAo+IENjOiBKdXN0b24g
TGkgPGp1c3Rvbi5saUBpbnRlbC5jb20+Cj4gQ2M6IEltcmUgRGVhayA8aW1yZS5kZWFrQGludGVs
LmNvbT4KPiBDYzogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNv
bT4KPiBDYzogSGFycnkgV2VudGxhbmQgPGh3ZW50bGFuQGFtZC5jb20+Cj4gQ2M6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cj4gU2lnbmVkLW9mZi1ieTogTHl1ZGUgUGF1
bCA8bHl1ZGVAcmVkaGF0LmNvbT4KClJldmlld2VkLWJ5OiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5
LnJ1bj4KCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgfCA0
MCArKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2Vy
dGlvbnMoKyksIDI0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX2RwX21zdF90b3BvbG9neS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9w
b2xvZ3kuYwo+IGluZGV4IGY1ZjFkOGI1MGZiNi4uYWYzMTg5ZGYyOGFhIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCj4gQEAgLTE1MTEsMzEgKzE1MTEsMjIgQEAgc3Rh
dGljIHZvaWQgZHJtX2RwX2Rlc3Ryb3lfcG9ydChzdHJ1Y3Qga3JlZiAqa3JlZikKPiAgCQljb250
YWluZXJfb2Yoa3JlZiwgc3RydWN0IGRybV9kcF9tc3RfcG9ydCwgdG9wb2xvZ3lfa3JlZik7Cj4g
IAlzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9tZ3IgKm1nciA9IHBvcnQtPm1ncjsKPiAgCj4g
LQlpZiAoIXBvcnQtPmlucHV0KSB7Cj4gLQkJa2ZyZWUocG9ydC0+Y2FjaGVkX2VkaWQpOwo+ICsJ
LyogVGhlcmUncyBub3RoaW5nIHRoYXQgbmVlZHMgbG9ja2luZyB0byBkZXN0cm95IGFuIGlucHV0
IHBvcnQgeWV0ICovCj4gKwlpZiAocG9ydC0+aW5wdXQpIHsKPiArCQlkcm1fZHBfbXN0X3B1dF9w
b3J0X21hbGxvYyhwb3J0KTsKPiArCQlyZXR1cm47Cj4gKwl9Cj4gIAo+IC0JCS8qCj4gLQkJICog
VGhlIG9ubHkgdGltZSB3ZSBkb24ndCBoYXZlIGEgY29ubmVjdG9yCj4gLQkJICogb24gYW4gb3V0
cHV0IHBvcnQgaXMgaWYgdGhlIGNvbm5lY3RvciBpbml0Cj4gLQkJICogZmFpbHMuCj4gLQkJICov
Cj4gLQkJaWYgKHBvcnQtPmNvbm5lY3Rvcikgewo+IC0JCQkvKiB3ZSBjYW4ndCBkZXN0cm95IHRo
ZSBjb25uZWN0b3IgaGVyZSwgYXMKPiAtCQkJICogd2UgbWlnaHQgYmUgaG9sZGluZyB0aGUgbW9k
ZV9jb25maWcubXV0ZXgKPiAtCQkJICogZnJvbSBhbiBFRElEIHJldHJpZXZhbCAqLwo+ICsJa2Zy
ZWUocG9ydC0+Y2FjaGVkX2VkaWQpOwo+ICAKPiAtCQkJbXV0ZXhfbG9jaygmbWdyLT5kZWxheWVk
X2Rlc3Ryb3lfbG9jayk7Cj4gLQkJCWxpc3RfYWRkKCZwb3J0LT5uZXh0LCAmbWdyLT5kZXN0cm95
X3BvcnRfbGlzdCk7Cj4gLQkJCW11dGV4X3VubG9jaygmbWdyLT5kZWxheWVkX2Rlc3Ryb3lfbG9j
ayk7Cj4gLQkJCXNjaGVkdWxlX3dvcmsoJm1nci0+ZGVsYXllZF9kZXN0cm95X3dvcmspOwo+IC0J
CQlyZXR1cm47Cj4gLQkJfQo+IC0JCS8qIG5vIG5lZWQgdG8gY2xlYW4gdXAgdmNwaQo+IC0JCSAq
IGFzIGlmIHdlIGhhdmUgbm8gY29ubmVjdG9yIHdlIG5ldmVyIHNldHVwIGEgdmNwaSAqLwo+IC0J
CWRybV9kcF9wb3J0X3RlYXJkb3duX3BkdChwb3J0LCBwb3J0LT5wZHQpOwo+IC0JCXBvcnQtPnBk
dCA9IERQX1BFRVJfREVWSUNFX05PTkU7Cj4gLQl9Cj4gLQlkcm1fZHBfbXN0X3B1dF9wb3J0X21h
bGxvYyhwb3J0KTsKPiArCS8qCj4gKwkgKiB3ZSBjYW4ndCBkZXN0cm95IHRoZSBjb25uZWN0b3Ig
aGVyZSwgYXMgd2UgbWlnaHQgYmUgaG9sZGluZyB0aGUKPiArCSAqIG1vZGVfY29uZmlnLm11dGV4
IGZyb20gYW4gRURJRCByZXRyaWV2YWwKPiArCSAqLwo+ICsJbXV0ZXhfbG9jaygmbWdyLT5kZWxh
eWVkX2Rlc3Ryb3lfbG9jayk7Cj4gKwlsaXN0X2FkZCgmcG9ydC0+bmV4dCwgJm1nci0+ZGVzdHJv
eV9wb3J0X2xpc3QpOwo+ICsJbXV0ZXhfdW5sb2NrKCZtZ3ItPmRlbGF5ZWRfZGVzdHJveV9sb2Nr
KTsKPiArCXNjaGVkdWxlX3dvcmsoJm1nci0+ZGVsYXllZF9kZXN0cm95X3dvcmspOwo+ICB9Cj4g
IAo+ICAvKioKPiBAQCAtMzk5OCw3ICszOTg5LDggQEAgc3RhdGljIHZvaWQgZHJtX2RwX3R4X3dv
cmsoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQo+ICBzdGF0aWMgaW5saW5lIHZvaWQKPiAgZHJt
X2RwX2RlbGF5ZWRfZGVzdHJveV9wb3J0KHN0cnVjdCBkcm1fZHBfbXN0X3BvcnQgKnBvcnQpCj4g
IHsKPiAtCXBvcnQtPm1nci0+Y2JzLT5kZXN0cm95X2Nvbm5lY3Rvcihwb3J0LT5tZ3IsIHBvcnQt
PmNvbm5lY3Rvcik7Cj4gKwlpZiAocG9ydC0+Y29ubmVjdG9yKQo+ICsJCXBvcnQtPm1nci0+Y2Jz
LT5kZXN0cm95X2Nvbm5lY3Rvcihwb3J0LT5tZ3IsIHBvcnQtPmNvbm5lY3Rvcik7Cj4gIAo+ICAJ
ZHJtX2RwX3BvcnRfdGVhcmRvd25fcGR0KHBvcnQsIHBvcnQtPnBkdCk7Cj4gIAlwb3J0LT5wZHQg
PSBEUF9QRUVSX0RFVklDRV9OT05FOwo+IC0tIAo+IDIuMjEuMAo+IAoKLS0gClNlYW4gUGF1bCwg
U29mdHdhcmUgRW5naW5lZXIsIEdvb2dsZSAvIENocm9taXVtIE9TCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
