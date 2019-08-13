Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 045BA8BC2E
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 16:55:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2DC66E172;
	Tue, 13 Aug 2019 14:55:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21A786E172
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 14:55:14 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id z51so19735842edz.13
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 07:55:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=tICg/V6ETORM9pfCRmLD3TLnpZGBTlGaeuCvuCv5TCc=;
 b=CeAwi2WDqnDKHiLR4F/T/FhOhKgejxiZoN9IRqNwBLq/rwWZZWOPIO4sI86bRULkbD
 KJL2U1e9JItpC4Ibxhmp/i3qFdriIlzIWQ3tHC5laVf2fSPsjejScbB6TWpS8O45YjQp
 rh3jyHXZHd/tVcdp8UhW+oDsqXFGpIMx3KRle1vx4KVgyF+I5Bpr4txt3pDCorQJlrOb
 /uUMfavTvBYHCgJuMhHQ9cbRZKQTWh5qAnlUYZALobr5R9mkgHGmdmf1/qMEUvU0JNGv
 Tbbbgvk5HrN3bFFPa+NOyY2YEmMiibdP8G7h50cdfPUVUgK1cizhl7ScGITcdBBVesfX
 gtCA==
X-Gm-Message-State: APjAAAXsWxmO8wYLLZRDjk1CQMnj9SBhvJlnCn/AU9pJSNu6hc5X7Y64
 Q4t9JBfNLePnV4ZQhDSUMpqgFg==
X-Google-Smtp-Source: APXvYqxuK867gLSFUvuzX85s579SR5whpAswIiVkcNxwXxfyTEuAyGzBczOhzNpaxZSDusx38vBxnw==
X-Received: by 2002:a50:e618:: with SMTP id y24mr42302798edm.142.1565708112721; 
 Tue, 13 Aug 2019 07:55:12 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id c14sm2166531edb.5.2019.08.13.07.55.11
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 13 Aug 2019 07:55:11 -0700 (PDT)
Date: Tue, 13 Aug 2019 16:55:09 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH 07/26] drm/dp_mst: Get rid of list clear in
 drm_dp_finish_destroy_port()
Message-ID: <20190813145509.GX7444@phenom.ffwll.local>
Mail-Followup-To: Lyude Paul <lyude@redhat.com>,
 dri-devel@lists.freedesktop.org, Juston Li <juston.li@intel.com>,
 Imre Deak <imre.deak@intel.com>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Harry Wentland <hwentlan@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org
References: <20190718014329.8107-1-lyude@redhat.com>
 <20190718014329.8107-8-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190718014329.8107-8-lyude@redhat.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=tICg/V6ETORM9pfCRmLD3TLnpZGBTlGaeuCvuCv5TCc=;
 b=VKfSU73cdgLiNJ0QL6ha2YwVCeHHA8P/z1P51N5Ovdj3ggIoo/bUrIPO9/Rk7eGKd0
 WY7qwl2uf3YorrMetIsbrmqUIyTy3S6y5FJcvzS12PofM7imZ2KSQK7hNKO5mGBPdBJr
 bHynZ+XKTHpeFRjG8GPE6cZ5Y/ACIVtjlFDvk=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Juston Li <juston.li@intel.com>,
 Harry Wentland <hwentlan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMTcsIDIwMTkgYXQgMDk6NDI6MzBQTSAtMDQwMCwgTHl1ZGUgUGF1bCB3cm90
ZToKPiBUaGlzIHNlZW1zIHRvIGJlIHNvbWUgbGVmdG92ZXIgZGV0cml0dXMgZnJvbSBiZWZvcmUg
dGhlIHBvcnQvbXN0YiBrcmVmCj4gY2xlYW51cCBhbmQgZG9lc24ndCBkbyBhbnl0aGluZyBhbnlt
b3JlLCBzbyBnZXQgcmlkIG9mIGl0Lgo+IAo+IENjOiBKdXN0b24gTGkgPGp1c3Rvbi5saUBpbnRl
bC5jb20+Cj4gQ2M6IEltcmUgRGVhayA8aW1yZS5kZWFrQGludGVsLmNvbT4KPiBDYzogVmlsbGUg
U3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiBDYzogSGFycnkgV2Vu
dGxhbmQgPGh3ZW50bGFuQGFtZC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogTHl1ZGUgUGF1bCA8bHl1
ZGVAcmVkaGF0LmNvbT4KCk1heWJlIG1vdmUgdGhpcyBlYXJsaWVyLCBiZWZvcmUgcGF0Y2ggMi4g
RWl0aGVyIHdheToKClJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZm
d2xsLmNoPgoKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMg
fCAyIC0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jIGIvZHJpdmVycy9ncHUvZHJt
L2RybV9kcF9tc3RfdG9wb2xvZ3kuYwo+IGluZGV4IDAyOTVlMDA3YzgzNi4uZWM2ODY1ZTFhZjc1
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCj4gQEAgLTM4NzAsOCAr
Mzg3MCw2IEBAIHN0YXRpYyB2b2lkIGRybV9kcF90eF93b3JrKHN0cnVjdCB3b3JrX3N0cnVjdCAq
d29yaykKPiAgc3RhdGljIGlubGluZSB2b2lkCj4gIGRybV9kcF9maW5pc2hfZGVzdHJveV9wb3J0
KHN0cnVjdCBkcm1fZHBfbXN0X3BvcnQgKnBvcnQpCj4gIHsKPiAtCUlOSVRfTElTVF9IRUFEKCZw
b3J0LT5uZXh0KTsKPiAtCj4gIAlpZiAocG9ydC0+Y29ubmVjdG9yKQo+ICAJCXBvcnQtPm1nci0+
Y2JzLT5kZXN0cm95X2Nvbm5lY3Rvcihwb3J0LT5tZ3IsIHBvcnQtPmNvbm5lY3Rvcik7Cj4gIAo+
IC0tIAo+IDIuMjEuMAo+IAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIElu
dGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
