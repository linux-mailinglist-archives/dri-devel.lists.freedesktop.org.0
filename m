Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FF11ED121
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jun 2020 15:47:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 454A989C49;
	Wed,  3 Jun 2020 13:47:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F91889C49
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jun 2020 13:47:02 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id q25so2155971wmj.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jun 2020 06:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=OQIprdtrVjtP62bZcoKpQVCgWT34ebTQAfzTo1SmbVI=;
 b=Kp/kJz3t3inOS5ejlXO58XnqG0WmCPzCgXpyWtrm8ddq8WydV9dxOsP2yAZA98/kdi
 SZh862Zmi6trZdy/R9q+rB7HcuA1aWuAljmDyI1s/3g2LgRqD8hss1rpgXFkHRNjCaxN
 WK7yi1+wam78LGNMQTndnf3DX1e6FkG8D83AQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=OQIprdtrVjtP62bZcoKpQVCgWT34ebTQAfzTo1SmbVI=;
 b=iOQ7avBIpozkpryu86tSsAySoBr0wyoKueyYYfrJpM0cjFE/dE51LXj6g47srtOy6O
 usbS11bIOTRjjqltKbBPjYC9Om4nDvkwR+3n2aQhVgcDpNmAauXnw6M/6VKDpQ7HGpNm
 BhljrVH9R7XBupcN09HttJPfaBQOryun3j9+l0Y91tjKLJYko5nk31h72UMOVwyKIgUn
 u7145/5p+VAgUU9mASf1tEb8PQW1w9aOgonuk9WwWX0bkrAAk1HG96Z6ptHticQ1/GxP
 3MRHMzla0JqMOdBadkYjHTFkQpOpVhGOlXx791vUB8oeLGSbkGJQex0RknQfE8DmFXdi
 JudQ==
X-Gm-Message-State: AOAM530niQoPfxhyHIxQX5pYTyAbOa0WQv8ueFlNNgqgngsWzfsNfQTh
 H9z84UlFMPTNvQIpsWtHM7q0SA==
X-Google-Smtp-Source: ABdhPJzR+ou0oB3EXnBrRJJTQKzUn3GuFfq3BMN5h3Cbs8pdS7KkagwQTnmeL/AwgGhlnBWqgIoN1w==
X-Received: by 2002:a05:600c:2259:: with SMTP id
 a25mr9262872wmm.32.1591192020717; 
 Wed, 03 Jun 2020 06:47:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id i74sm3493772wri.49.2020.06.03.06.46.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2020 06:47:00 -0700 (PDT)
Date: Wed, 3 Jun 2020 15:46:58 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Liviu Dudau <liviu.dudau@arm.com>
Subject: Re: [PATCH 3/3] drm/hdlcd: Don't call drm_crtc_vblank_off on unbind
Message-ID: <20200603134658.GQ20149@phenom.ffwll.local>
References: <20200602095140.36678-1-daniel.vetter@ffwll.ch>
 <20200602095140.36678-3-daniel.vetter@ffwll.ch>
 <20200602130016.GR159988@e110455-lin.cambridge.arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200602130016.GR159988@e110455-lin.cambridge.arm.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMDIsIDIwMjAgYXQgMDI6MDA6MTZQTSArMDEwMCwgTGl2aXUgRHVkYXUgd3Jv
dGU6Cj4gT24gVHVlLCBKdW4gMDIsIDIwMjAgYXQgMTE6NTE6NDBBTSArMDIwMCwgRGFuaWVsIFZl
dHRlciB3cm90ZToKPiA+IFRoaXMgaXMgYWxyZWFkeSB0YWtlbiBjYXJlIG9mIGJ5IGRybV9hdG9t
aWNfaGVscGVyX3NodXRkb3duKCksIGFuZAo+ID4gaW4gdGhhdCBjYXNlIG9ubHkgZm9yIHRoZSBD
UlRDIHdoaWNoIGFyZSBhY3R1YWxseSBvbi4KPiA+IAo+ID4gT25seSB0cmlja3kgYml0IGhlcmUg
aXMgdGhhdCB3ZSBraWxsIHRoZSBpbnRlcnJ1cHQgaGFuZGxpbmcgYmVmb3JlIHdlCj4gPiBzaHV0
IGRvd24gY3J0Yywgc28gbmVlZCB0byByZW9yZGVyIHRoYXQuCj4gPiAKPiA+IFNpZ25lZC1vZmYt
Ynk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+ID4gQ2M6IExpdml1
IER1ZGF1IDxsaXZpdS5kdWRhdUBhcm0uY29tPgo+IAo+IEFja2VkLWJ5OiBMaXZpdSBEdWRhdSA8
bGl2aXUuZHVkYXVAYXJtLmNvbT4KCk9rIEkgbWVyZ2VkIHRoZSB0d28gYXJtIHBhdGNoZXMsIHRo
YW5rcyBmb3IgdGFraW5nIGEgbG9vay4gRmlyc3QgcGF0Y2gKbmVlZHMgbW9yZSB3b3JrIC4uLgot
RGFuaWVsCgo+IAo+IEJlc3QgcmVnYXJkcywKPiBMaXZpdQo+IAo+ID4gQ2M6IEJyaWFuIFN0YXJr
ZXkgPGJyaWFuLnN0YXJrZXlAYXJtLmNvbT4KPiA+IENjOgo+ID4gLS0tCj4gPiAgZHJpdmVycy9n
cHUvZHJtL2FybS9oZGxjZF9kcnYuYyB8IDMgKy0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FybS9oZGxjZF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vaGRsY2RfZHJ2LmMK
PiA+IGluZGV4IDE5NDQxOWY0N2M1ZS4uMjZiYzVkNzc2NmY1IDEwMDY0NAo+ID4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FybS9oZGxjZF9kcnYuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Fy
bS9oZGxjZF9kcnYuYwo+ID4gQEAgLTM0Nyw5ICszNDcsOCBAQCBzdGF0aWMgdm9pZCBoZGxjZF9k
cm1fdW5iaW5kKHN0cnVjdCBkZXZpY2UgKmRldikKPiA+ICAJb2Zfbm9kZV9wdXQoaGRsY2QtPmNy
dGMucG9ydCk7Cj4gPiAgCWhkbGNkLT5jcnRjLnBvcnQgPSBOVUxMOwo+ID4gIAlwbV9ydW50aW1l
X2dldF9zeW5jKGRldik7Cj4gPiAtCWRybV9jcnRjX3ZibGFua19vZmYoJmhkbGNkLT5jcnRjKTsK
PiA+IC0JZHJtX2lycV91bmluc3RhbGwoZHJtKTsKPiA+ICAJZHJtX2F0b21pY19oZWxwZXJfc2h1
dGRvd24oZHJtKTsKPiA+ICsJZHJtX2lycV91bmluc3RhbGwoZHJtKTsKPiA+ICAJcG1fcnVudGlt
ZV9wdXQoZGV2KTsKPiA+ICAJaWYgKHBtX3J1bnRpbWVfZW5hYmxlZChkZXYpKQo+ID4gIAkJcG1f
cnVudGltZV9kaXNhYmxlKGRldik7Cj4gPiAtLSAKPiA+IDIuMjYuMgo+ID4gCj4gCj4gLS0gCj4g
PT09PT09PT09PT09PT09PT09PT0KPiB8IEkgd291bGQgbGlrZSB0byB8Cj4gfCBmaXggdGhlIHdv
cmxkLCAgfAo+IHwgYnV0IHRoZXkncmUgbm90IHwKPiB8IGdpdmluZyBtZSB0aGUgICB8Cj4gIFwg
c291cmNlIGNvZGUhICAvCj4gICAtLS0tLS0tLS0tLS0tLS0KPiAgICAgwq9cXyjjg4QpXy/CrwoK
LS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0
dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
