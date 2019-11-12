Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B908F90D9
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 14:41:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E706F6E442;
	Tue, 12 Nov 2019 13:41:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95BFC6E442
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 13:41:06 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id z25so996132oti.5
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 05:41:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WEtD4NUsNII9Q5Y5URDwxzsb3Zvwk1zRHFdwetuuY/U=;
 b=OV+bq8IZsXcvP9zt8GsqR7mU4MKqcnhoxSuSSiFbQSMATZ5441SwD/ABSNLqzlSlZn
 kttYyhD64ihbQrRJeL39n4QWrLZtPCfTuzfXUY9aj5hzA60Gxv6+3iQHYqJzivcczXyi
 jQZPFHHYcKfdE8Bv+TziNXqM3hoisGSLhQZSAhY725bn5VaqKMH9UaY1a0qTUQlIRuT6
 utjEJVpXRD43Qk1/JvH3NPbwWCp50KywQ2TIAhdup/OCYMlLNhFAue0KbaOrw7bTHqpZ
 FciNmJL+IFEHJoc0S5vVIaIppZfT8CUJfzFweXp6Q1UiXNdx1ISY/gn8Uyx9UIXMLmWz
 QGkw==
X-Gm-Message-State: APjAAAXLSk35+Xhd/JNg2FpiwDD9/OMJau/j3ZG8IlRT1ZuObOcjj3KW
 LeCAfS4vW8fJg6Klt3eQgFysuFQmgVgHxcRtlfuCDQ==
X-Google-Smtp-Source: APXvYqz+trtRVvHuGhYuXNRd23JUvGyCZ5uPJlMHc9VjEKibVDcUhTyYPCQEbZ+1L3TP3/vpVDew2g3nlMoCBXcE1Eo=
X-Received: by 2002:a9d:4c15:: with SMTP id l21mr26098625otf.204.1573566065828; 
 Tue, 12 Nov 2019 05:41:05 -0800 (PST)
MIME-Version: 1.0
References: <20191108123333.25274-1-tzimmermann@suse.de>
 <20191108123333.25274-2-tzimmermann@suse.de>
 <e8b90928-fdae-36e0-f116-8b49159c4aad@tronnes.org>
 <1704c1d6-ec08-211b-0677-6c22f96ca7aa@suse.de>
In-Reply-To: <1704c1d6-ec08-211b-0677-6c22f96ca7aa@suse.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 12 Nov 2019 14:40:54 +0100
Message-ID: <CAKMK7uF7M60NcPTGicQVJ=09pqf4ua4kWaCmdCcDaC13AgTFQw@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/udl: Replace fbdev code with generic emulation
To: Thomas Zimmermann <tzimmermann@suse.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WEtD4NUsNII9Q5Y5URDwxzsb3Zvwk1zRHFdwetuuY/U=;
 b=CGVqN/929T51ir6AFCMC33cfbZ4w6S/tP81VFFe0MW1RydZkWuJdoXLKakHm7OEwyx
 nqa6sUdfU4r0gfK+LReWvmh84u4ullxuUs+Tx2sWIw6Bt6KFnXDL5OBcTQZD1QHzTcO9
 QciaedqtTV/vcOlot/6LPDm0e6J/u9KXNjL1o=
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Sean Paul <sean@poorly.run>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMTIsIDIwMTkgYXQgMTI6NTUgUE0gVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1t
ZXJtYW5uQHN1c2UuZGU+IHdyb3RlOgo+Cj4gSGkKPgo+IEFtIDA4LjExLjE5IHVtIDE2OjM3IHNj
aHJpZWIgTm9yYWxmIFRyw7hubmVzOgo+ID4KPiA+Cj4gPiBEZW4gMDguMTEuMjAxOSAxMy4zMywg
c2tyZXYgVGhvbWFzIFppbW1lcm1hbm46Cj4gPj4gVGhlIHVkbCBkcml2ZXIgY2FuIHVzZSB0aGUg
Z2VuZXJpYyBmYmRldiBpbXBsZW1lbnRhdGlvbi4gQ29udmVydCBpdC4KPiA+Pgo+ID4+IFNpZ25l
ZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgo+ID4+IC0t
LQo+ID4KPiA+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZHJ2LmMgYi9k
cml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9kcnYuYwo+ID4+IGluZGV4IDU2M2NjNTgwOWU1Ni4uNTVj
MGY5ZGZlZTI5IDEwMDY0NAo+ID4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2Rydi5j
Cj4gPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZHJ2LmMKPiA+Cj4gPj4gQEAgLTQ3
LDYgKzQ4LDggQEAgc3RhdGljIHN0cnVjdCBkcm1fZHJpdmVyIGRyaXZlciA9IHsKPiA+PiAgICAg
IC5kcml2ZXJfZmVhdHVyZXMgPSBEUklWRVJfTU9ERVNFVCB8IERSSVZFUl9HRU0sCj4gPj4gICAg
ICAucmVsZWFzZSA9IHVkbF9kcml2ZXJfcmVsZWFzZSwKPiA+Pgo+ID4+ICsgICAgLmxhc3RjbG9z
ZSA9IGRybV9mYl9oZWxwZXJfbGFzdGNsb3NlLAo+ID4+ICsKPiA+Cj4gPiBObyBuZWVkIHRvIHNl
dCB0aGlzLCBpdCdzIGFscmVhZHkgd2lyZWQgdXA6Cj4gPgo+ID4gZHJtX2xhc3RjbG9zZSAtPiBk
cm1fY2xpZW50X2Rldl9yZXN0b3JlIC0+IGRybV9mYmRldl9jbGllbnRfcmVzdG9yZSAtPgo+ID4g
ZHJtX2ZiX2hlbHBlcl9sYXN0Y2xvc2UKPiA+Cj4gPj4gICAgICAvKiBnZW0gaG9va3MgKi8KPiA+
PiAgICAgIC5nZW1fY3JlYXRlX29iamVjdCA9IHVkbF9kcml2ZXJfZ2VtX2NyZWF0ZV9vYmplY3Qs
Cj4gPj4KPiA+Cj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2ZiLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9mYi5jCj4gPj4gaW5kZXggZjgxNTNiNzI2MzQzLi5h
ZmU3NGY4OTJhMmIgMTAwNjQ0Cj4gPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZmIu
Ywo+ID4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2ZiLmMKPiA+PiBAQCAtMjAsMTkg
KzIwLDkgQEAKPiA+Pgo+ID4+ICAjaW5jbHVkZSAidWRsX2Rydi5oIgo+ID4+Cj4gPj4gLSNkZWZp
bmUgRExfREVGSU9fV1JJVEVfREVMQVkgICAgKEhaLzIwKSAvKiBmYl9kZWZlcnJlZF9pby5kZWxh
eSBpbiBqaWZmaWVzICovCj4gPj4gLQo+ID4+IC1zdGF0aWMgaW50IGZiX2RlZmlvID0gMDsgIC8q
IE9wdGlvbmFsbHkgZW5hYmxlIGV4cGVyaW1lbnRhbCBmYl9kZWZpbyBtbWFwIHN1cHBvcnQgKi8K
PiA+PiAgc3RhdGljIGludCBmYl9icHAgPSAxNjsKPiA+Pgo+ID4+ICBtb2R1bGVfcGFyYW0oZmJf
YnBwLCBpbnQsIFNfSVdVU1IgfCBTX0lSVVNSIHwgU19JV0dSUCB8IFNfSVJHUlApOwo+ID4KPiA+
IE1heWJlIGZiX2JwcCBjYW4gYmUgZHJvcHBlZCB0b28/Cj4KPiBTdXJlLCBtYWtlcyBzZW5zZS4K
Pgo+IFRoZSBkcml2ZXIgZXhwb3NlcyBhIHByZWZlcnJlZCBjb2xvciBkZXB0aCBvZiAyNCBicHAs
IHdoaWNoIHdlIG1heSB3YW50Cj4gdG8gY2hhbmdlIHRvIDE2IHRoZW4uIFRoZSBpbnRlcm5hbCBm
cmFtZWJ1ZmZlciBpcyBvbmx5IDE2IGJwcCBhbnl3YXkuCgpKdXN0IHNvbWV0aGluZyB0aGF0IGNy
b3NzZWQgbXkgbWluZDogU2hvdWxkIHdlIGVuc3VyZSB0aGF0IHRoZQpwcmVmZXJyZWQgZm9ybWF0
IG9mIHRoZSBwcmltYXJ5IHBsYW5lIChzaG91bGQgYmUgdGhlIGZpcnN0IGluIHRoZQpmb3JtYXQg
YXJyYXkpIG1hdGNoZXMgdXAgd2l0aCB0aGUgcHJlZmVycmVkIGJwcCBzZXR0aW5nPyBNYXliZSBl
dmVuCmVuZm9yY2UgdGhhdCBmb3IgZHJpdmVycyB3aXRoIGFuIGV4cGxpY2l0IHByaW1hcnkgcGxh
bmUgKGkuZS4gYXRvbWljCmRyaXZlcnMpLiBJIHRoaW5rIHRpbnkgZHJpdmVycyBnZXQgdGhpcyBy
aWdodCBhbHJlYWR5LgotRGFuaWVsCgo+Cj4gQmVzdCByZWdhcmRzCj4gVGhvbWFzCj4KPiA+Cj4g
PiBJdCdzIHBvc3NpYmxlIHRvIHNldCBpdCBvbiB0aGUgY29tbWFuZCBsaW5lOgo+ID4KPiA+IHZp
ZGVvPTx4cmVzPng8eXJlcz4tPGJwcD4KPiA+Cj4gPiBJIGhhdmVuJ3QgdHJpZWQgaXQgc28gSSBj
YW4ndCBzYXkgZm9yIGNlcnRhaW4gdGhhdCBpdCBhY3R1YWxseSB3b3Jrcz4KPiA+IFJlZjogRG9j
dW1lbnRhdGlvbi9mYi9tb2RlZGIucnN0IGFuZCBkcm1fZmJfaGVscGVyX3NpbmdsZV9mYl9wcm9i
ZSgpCj4gPgo+ID4+IC1tb2R1bGVfcGFyYW0oZmJfZGVmaW8sIGludCwgU19JV1VTUiB8IFNfSVJV
U1IgfCBTX0lXR1JQIHwgU19JUkdSUCk7Cj4gPj4gLQo+ID4KPiA+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3VkbC91ZGxfbW9kZXNldC5jIGIvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxf
bW9kZXNldC5jCj4gPj4gaW5kZXggYmMxYWI2MDYwZGM2Li4xNTE3ZDVlODgxYjggMTAwNjQ0Cj4g
Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfbW9kZXNldC5jCj4gPj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL3VkbC91ZGxfbW9kZXNldC5jCj4gPgo+ID4+IEBAIC00MjIsNyArNDIzLDcg
QEAgc3RhdGljIGludCB1ZGxfY3J0Y19pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCj4gPj4K
PiA+PiAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fbW9kZV9jb25maWdfZnVuY3MgdWRsX21vZGVf
ZnVuY3MgPSB7Cj4gPj4gICAgICAuZmJfY3JlYXRlID0gdWRsX2ZiX3VzZXJfZmJfY3JlYXRlLAo+
ID4+IC0gICAgLm91dHB1dF9wb2xsX2NoYW5nZWQgPSBOVUxMLAo+ID4+ICsgICAgLm91dHB1dF9w
b2xsX2NoYW5nZWQgPSBkcm1fZmJfaGVscGVyX291dHB1dF9wb2xsX2NoYW5nZWQsCj4gPgo+ID4g
Tm8gbmVlZCB0byBzZXQgdGhpcywgaXQncyBhbHJlYWR5IHdpcmVkIHVwOgo+ID4KPiA+IGRybV9r
bXNfaGVscGVyX2hvdHBsdWdfZXZlbnQgLT4gZHJtX2NsaWVudF9kZXZfaG90cGx1ZyAtPgo+ID4g
ZHJtX2ZiZGV2X2NsaWVudF9ob3RwbHVnIC0+IGRybV9mYl9oZWxwZXJfaG90cGx1Z19ldmVudAo+
ID4KPiA+IE5vcmFsZi4KPiA+Cj4gPj4gIH07Cj4gPj4KPiA+PiAgaW50IHVkbF9tb2Rlc2V0X2lu
aXQoc3RydWN0IGRybV9kZXZpY2UgKmRldikKPiA+Pgo+Cj4gLS0KPiBUaG9tYXMgWmltbWVybWFu
bgo+IEdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXIKPiBTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBH
ZXJtYW55IEdtYkgKPiBNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkKPiAo
SFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpCj4gR2VzY2jDpGZ0c2bDvGhyZXI6IEZlbGl4IEltZW5k
w7ZyZmZlcgo+CgoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENv
cnBvcmF0aW9uCis0MSAoMCkgNzkgMzY1IDU3IDQ4IC0gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
