Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C387C4340E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 10:21:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78308892B5;
	Thu, 13 Jun 2019 08:21:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B397A892B5
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 08:21:51 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id m10so29945268edv.6
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 01:21:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=/5Q5aUaRAcEEPNriaL09NE2LBrtuC+UfFWkB6hD3AL0=;
 b=OPhxMWMMnUGu2XZPxS7hYzrvhqL9qIwJ4I8CuqLzuIC9Bee85cdxMefdclKFoJmJ5c
 K8WmgkUDdGDHEHKCGq8m0BS2BKFQ3LLXyRApelXQOQz9fMJXA3OfWTfwX8hQ6Kud7y8y
 n3EVqikUaCQDSu2BhDv3ElIPDUgD0xk2uBT2duOQhneX6i14C5qyHtNXAd7BIetoUX3g
 oNIAQvhNUhmIloodY9cVBFFkKrzb9MNQxmRgRE908f+EWr+g0npZMh+jtNzuAiYpdr6I
 ZaXGBTfjhM/71L8JJZS5szqRIHSG3uQgim7fv5ivPcBnOERRSOp0a/hpxBLVruWPYiq6
 TqRg==
X-Gm-Message-State: APjAAAUPPN0Pg8Xc8V0+Hk18CtbZAcu8sbdAinIQD5BwG8pHaLa4fHQJ
 6z2J+gyQXhIGkYe2RjcKqy7MIA==
X-Google-Smtp-Source: APXvYqyuHNHI3b36rm4k6jVjf5YQ4S6ebCAH64O/yrmvhY4OJMhpcxY3jnmxNU5QJu6XRHEVCYxqiw==
X-Received: by 2002:a50:97c8:: with SMTP id f8mr45283000edb.176.1560414110413; 
 Thu, 13 Jun 2019 01:21:50 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id z10sm684614edl.35.2019.06.13.01.21.49
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 13 Jun 2019 01:21:49 -0700 (PDT)
Date: Thu, 13 Jun 2019 10:21:47 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Subject: Re: [RESEND PATCH V3] drm/drm_vblank: Change EINVAL by the correct
 errno
Message-ID: <20190613082147.GG23020@phenom.ffwll.local>
Mail-Followup-To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, intel-gfx@lists.freedesktop.org
References: <20190613021054.cdewdb3azy6zuoyw@smtp.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190613021054.cdewdb3azy6zuoyw@smtp.gmail.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=/5Q5aUaRAcEEPNriaL09NE2LBrtuC+UfFWkB6hD3AL0=;
 b=CNPZ9BSaAlskYq9oJPK3nw+RHvlOS+kmhCaPVmRqdv2KGR7tiu8aOdrFbya1btWYrV
 /LL4gCUeCIqqlSTrQRyon/4otVWW808zDERPOuLa1zZ/UvAr46hYZgQ5D+TFonXqs0e5
 6FRikD9geEaT5shYlUm40D03a+O3W7C6AcYwE=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, kernel-janitors@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTIsIDIwMTkgYXQgMTE6MTA6NTRQTSAtMDMwMCwgUm9kcmlnbyBTaXF1ZWly
YSB3cm90ZToKPiBGb3IgaGlzdG9yaWNhbCByZWFzb24sIHRoZSBmdW5jdGlvbiBkcm1fd2FpdF92
YmxhbmtfaW9jdGwgYWx3YXlzIHJldHVybgo+IC1FSU5WQUwgaWYgc29tZXRoaW5nIGdldHMgd3Jv
bmcuIFRoaXMgc2NlbmFyaW8gbGltaXRzIHRoZSBmbGV4aWJpbGl0eQo+IGZvciB0aGUgdXNlcnNw
YWNlIG1ha2UgZGV0YWlsZWQgdmVyaWZpY2F0aW9uIG9mIHRoZSBwcm9ibGVtIGFuZCB0YWtlCj4g
c29tZSBhY3Rpb24uIEluIHBhcnRpY3VsYXIsIHRoZSB2YWxpZGF0aW9uIG9mIOKAnGlmICghZGV2
LT5pcnFfZW5hYmxlZCnigJ0KPiBpbiB0aGUgZHJtX3dhaXRfdmJsYW5rX2lvY3RsIGlzIHJlc3Bv
bnNpYmxlIGZvciBjaGVja2luZyBpZiB0aGUgZHJpdmVyCj4gc3VwcG9ydCB2Ymxhbmsgb3Igbm90
LiBJZiB0aGUgZHJpdmVyIGRvZXMgbm90IHN1cHBvcnQgVkJsYW5rLCB0aGUKPiBmdW5jdGlvbiBk
cm1fd2FpdF92YmxhbmtfaW9jdGwgcmV0dXJucyBFSU5WQUwgd2hpY2ggZG9lcyBub3QgcmVwcmVz
ZW50Cj4gdGhlIHJlYWwgaXNzdWU7IHRoaXMgcGF0Y2ggY2hhbmdlcyB0aGlzIGJlaGF2aW9yIGJ5
IHJldHVybiBFT1BOT1RTVVBQLgo+IEFkZGl0aW9uYWxseSwgc29tZSBvcGVyYXRpb25zIGFyZSB1
bnN1cHBvcnRlZCBieSB0aGlzIGZ1bmN0aW9uLCBhbmQKPiByZXR1cm5zIEVJTlZBTDsgdGhpcyBw
YXRjaCBhbHNvIGNoYW5nZXMgdGhlIHJldHVybiB2YWx1ZSB0byBFT1BOT1RTVVBQCj4gaW4gdGhp
cyBjYXNlLiBMYXN0bHksIHRoZSBmdW5jdGlvbiBkcm1fd2FpdF92YmxhbmtfaW9jdGwgaXMgaW52
b2tlZCBieQo+IGxpYmRybSwgd2hpY2ggaXMgdXNlZCBieSBtYW55IGNvbXBvc2l0b3JzOyBiZWNh
dXNlIG9mIHRoaXMsIGl0IGlzCj4gaW1wb3J0YW50IHRvIGNoZWNrIGlmIHRoaXMgY2hhbmdlIGJy
ZWFrcyBhbnkgY29tcG9zaXRvci4gSW4gdGhpcyBzZW5zZSwKPiB0aGUgZm9sbG93aW5nIHByb2pl
Y3RzIHdlcmUgZXhhbWluZWQ6Cj4gCj4gKiBEcm0taHdjb21wb3Nlcgo+ICogS3dpbgo+ICogU3dh
eQo+ICogV2xyb290cwo+ICogV2F5bGFuZC1jb3JlCj4gKiBXZXN0b24KPiAqIFhvcmcgKDY3IGRp
ZmZlcmVudCBkcml2ZXJzKQo+IAo+IEZvciBlYWNoIHJlcG9zaXRvcnkgdGhlIHZlcmlmaWNhdGlv
biBoYXBwZW5lZCBpbiB0aHJlZSBzdGVwczoKPiAKPiAqIFVwZGF0ZSB0aGUgbWFpbiBicmFuY2gK
PiAqIExvb2sgZm9yIGFueSBvY2N1cnJlbmNlICJkcm1XYWl0VkJsYW5rIiB3aXRoIHRoZSBjb21t
YW5kOgo+ICAgZ2l0IGdyZXAgLW4gImRybVdhaXRWQmxhbmsiCj4gKiBMb29rIGluIHRoZSBnaXQg
aGlzdG9yeSBvZiB0aGUgcHJvamVjdCB3aXRoIHRoZSBjb21tYW5kOgo+ICAgZ2l0IGxvZyAtU2Ry
bVdhaXRWQmxhbmsKPiAKPiBGaW5hbGx5LCBub25lIG9mIHRoZSBhYm92ZSBwcm9qZWN0cyB2YWxp
ZGF0ZSB0aGUgdXNlIG9mIEVJTlZBTCB3aGljaAo+IG1ha2Ugc2FmZSwgYXQgbGVhc3QgZm9yIHRo
ZXNlIHByb2plY3RzLCB0byBjaGFuZ2UgdGhlIHJldHVybiB2YWx1ZXMuCj4gCj4gQ2hhbmdlIHNp
bmNlIFYyOgo+ICBEYW5pZWwgVmV0dGVyIGFuZCBDaHJpcyBXaWxzb24KPiAgLSBSZXBsYWNlIEVO
T1RUWSBieSBFT1BOT1RTVVBQCj4gIC0gUmV0dXJuIEVJTlZBTCBpZiB0aGUgcGFyYW1ldGVycyBh
cmUgd3JvbmcKPiAKPiBTaWduZWQtb2ZmLWJ5OiBSb2RyaWdvIFNpcXVlaXJhIDxyb2RyaWdvc2lx
dWVpcmFtZWxvQGdtYWlsLmNvbT4KPiAtLS0KPiBVcGRhdGU6Cj4gICBOb3cgSUdUIGhhcyBhIHdh
eSB0byB2YWxpZGF0ZSBpZiBhIGRyaXZlciBoYXMgdmJsYW5rIHN1cHBvcnQgb3Igbm90Lgo+ICAg
U2VlOiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2lndC1ncHUtdG9vbHMvY29t
bWl0LzJkMjQ0YWVkNjkxNjU3NTNmM2FkYmJkNjQ2OGRiMDczZGMxYWNmOUEKPiAKPiAgZHJpdmVy
cy9ncHUvZHJtL2RybV92YmxhbmsuYyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX3ZibGFuay5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYwo+IGluZGV4IDBk
NzA0YmRkYjFhNi4uZDc2YTc4M2E3ZDRiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9k
cm1fdmJsYW5rLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3ZibGFuay5jCj4gQEAgLTE1
NzgsMTAgKzE1NzgsMTAgQEAgaW50IGRybV93YWl0X3ZibGFua19pb2N0bChzdHJ1Y3QgZHJtX2Rl
dmljZSAqZGV2LCB2b2lkICpkYXRhLAo+ICAJdW5zaWduZWQgaW50IGZsYWdzLCBwaXBlLCBoaWdo
X3BpcGU7Cj4gIAo+ICAJaWYgKCFkZXYtPmlycV9lbmFibGVkKQo+IC0JCXJldHVybiAtRUlOVkFM
Owo+ICsJCXJldHVybiAtRU9QTk9UU1VQUDsKPiAgCj4gIAlpZiAodmJsd2FpdC0+cmVxdWVzdC50
eXBlICYgX0RSTV9WQkxBTktfU0lHTkFMKQo+IC0JCXJldHVybiAtRUlOVkFMOwo+ICsJCXJldHVy
biAtRU9QTk9UU1VQUDsKCk5vdCBzdXJlIHdlIHdhbnQgRUlOVkFMIGhlcmUsIHRoYXQncyBraW5k
YSBhICJwYXJhbWV0ZXJzIGFyZSB3cm9uZyIKdmVyc2lvbiB0b28uIFdpdGggdGhhdCBjaGFuZ2Vk
OgoKUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cgo+
ICAKPiAgCWlmICh2Ymx3YWl0LT5yZXF1ZXN0LnR5cGUgJgo+ICAJICAgIH4oX0RSTV9WQkxBTktf
VFlQRVNfTUFTSyB8IF9EUk1fVkJMQU5LX0ZMQUdTX01BU0sgfAo+IC0tIAo+IDIuMjEuMAoKCgot
LSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0
cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
