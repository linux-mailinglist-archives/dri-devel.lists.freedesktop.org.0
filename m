Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5466B1002ED
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 11:50:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63BD06E424;
	Mon, 18 Nov 2019 10:50:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E4576E40C;
 Mon, 18 Nov 2019 10:50:31 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id n21so18305296ljg.12;
 Mon, 18 Nov 2019 02:50:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=ISrQ5sKbmu2dQggEErUdRfIHugpvTJGlxKeIPkGDdHA=;
 b=aPNyTfsms0C7HviBRilNLXT97A0qW0A6dj8a/8rYCHUuo2J90dftJcgO5serodKw5G
 LAlXC42g3DA6eFjSfA66e6GUPmSrOrs11NFEMkNElfcu8bdPfD7lwLjq3lah/Nb5xRp1
 Xrj3S2B+L1cPAhw/CmV61ISCysJoeygYITfijieDnlm5NBaJad212FJjR1LMd8VcG/La
 76uMv3kTiESJb4tcIHYxYucankP2MsjiO1Dkw9PwZaDMSRfa+YstweVa2jgx+Vh+qrGs
 5sG7pOm8c6ki+idfK0xxZEGy1mG7hGsO1hnxTqrgEj64+QQ0wUDaRKb+BY7PEMb1uac1
 BneA==
X-Gm-Message-State: APjAAAXYaiD0fqXeaso5wwIM5RDAJfgl0WFIQG2BjZw+3W0dmfkeRApt
 yl+p/irxMgSV3D5Nr+SIRnI=
X-Google-Smtp-Source: APXvYqxWCiwzujghNL2buvDwxtuXuC0i3NaZEv7ob3D8BF+pct9/0Ryf6eZ712c8O0Ktr/btoWSP0Q==
X-Received: by 2002:a2e:8544:: with SMTP id u4mr21222346ljj.25.1574074229623; 
 Mon, 18 Nov 2019 02:50:29 -0800 (PST)
Received: from [10.17.182.20] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id
 u23sm84438lfc.88.2019.11.18.02.50.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 Nov 2019 02:50:28 -0800 (PST)
Subject: Re: [Xen-devel] [PATCH 13/15] xen/gntdev-dmabuf: Ditch dummy map
 functions
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20191118103536.17675-1-daniel.vetter@ffwll.ch>
 <20191118103536.17675-14-daniel.vetter@ffwll.ch>
From: Oleksandr Andrushchenko <andr2000@gmail.com>
Message-ID: <5425173d-30f7-88d8-b717-a310a53a9ddb@gmail.com>
Date: Mon, 18 Nov 2019 12:50:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191118103536.17675-14-daniel.vetter@ffwll.ch>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=ISrQ5sKbmu2dQggEErUdRfIHugpvTJGlxKeIPkGDdHA=;
 b=TchGGWiBUYb7Rt2E+7BzjpXrZGgMFjvW3ikZ59mT5vuYQBSUtvIIHhGP/mBTZcWpe6
 XItofUMS2xfrsDJOlizf019b88UC9CuLF0y0O+HT6Q3IJIc9i3BgcbN2IF0cIIVu/9j+
 +P6OHJHiQcPU/5m5CMMx2Srx1qo5ioJIRA2Rc7JctSs0aFsKKqxyf/xqLpGNxsL3vLml
 amEG1d2pD8LRl8pQjGvQRVlqunRDdjC01ULewQj9hNRUAQ4N8JJ+2iE480lVUV4D8tz2
 NyUfHCtPBfVA4m5TRCqL03rRs60TXl79XbhOgWh295r0Pl/Yz00vtq3R335gmK1Oo/Li
 imLQ==
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTEvMTgvMTkgMTI6MzUgUE0sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gVGhlcmUncyBubyBp
bi1rZXJuZWwgdXNlcnMgZm9yIHRoZSBrKHVuKW1hcCBzdHVmZi4gQW5kIHRoZSBtbWFwIG9uZSBp
cwo+IGFjdGl2ZWx5IGhhcm1mdWwgLSByZXR1cm4gMCBhbmQgdGhlbiBfbm90XyBhY3R1YWxseSBt
bWFwaW5nIGNhbid0IGVuZAo+IHdlbGwuCj4KPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVy
IDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KUmV2aWV3ZWQtYnk6IE9sZWtzYW5kciBBbmRydXNo
Y2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4KPiBDYzogQm9yaXMgT3N0
cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KPiBDYzogSnVlcmdlbiBHcm9zcyA8
amdyb3NzQHN1c2UuY29tPgo+IENjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtl
cm5lbC5vcmc+Cj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+IC0tCj4gQWNr
IGZvciBtZXJnaW5nIHRoaXMgdGhyb3VnaCBkcm0gdHJlZXMgdmVyeSBtdWNoIGFwcHJlY2lhdGVk
Lgo+IC1EYW5pZWwKPiAtLS0KPiAgIGRyaXZlcnMveGVuL2dudGRldi1kbWFidWYuYyB8IDIzIC0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMjMgZGVsZXRpb25zKC0p
Cj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4vZ250ZGV2LWRtYWJ1Zi5jIGIvZHJpdmVycy94
ZW4vZ250ZGV2LWRtYWJ1Zi5jCj4gaW5kZXggMmM0ZjMyNGY4NjI2Li5mZTdiZDY5ZDY5NTUgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy94ZW4vZ250ZGV2LWRtYWJ1Zi5jCj4gKysrIGIvZHJpdmVycy94
ZW4vZ250ZGV2LWRtYWJ1Zi5jCj4gQEAgLTM0MiwzNSArMzQyLDEyIEBAIHN0YXRpYyB2b2lkIGRt
YWJ1Zl9leHBfb3BzX3JlbGVhc2Uoc3RydWN0IGRtYV9idWYgKmRtYV9idWYpCj4gICAJbXV0ZXhf
dW5sb2NrKCZwcml2LT5sb2NrKTsKPiAgIH0KPiAgIAo+IC1zdGF0aWMgdm9pZCAqZG1hYnVmX2V4
cF9vcHNfa21hcChzdHJ1Y3QgZG1hX2J1ZiAqZG1hX2J1ZiwKPiAtCQkJCSB1bnNpZ25lZCBsb25n
IHBhZ2VfbnVtKQo+IC17Cj4gLQkvKiBOb3QgaW1wbGVtZW50ZWQuICovCj4gLQlyZXR1cm4gTlVM
TDsKPiAtfQo+IC0KPiAtc3RhdGljIHZvaWQgZG1hYnVmX2V4cF9vcHNfa3VubWFwKHN0cnVjdCBk
bWFfYnVmICpkbWFfYnVmLAo+IC0JCQkJICB1bnNpZ25lZCBsb25nIHBhZ2VfbnVtLCB2b2lkICph
ZGRyKQo+IC17Cj4gLQkvKiBOb3QgaW1wbGVtZW50ZWQuICovCj4gLX0KPiAtCj4gLXN0YXRpYyBp
bnQgZG1hYnVmX2V4cF9vcHNfbW1hcChzdHJ1Y3QgZG1hX2J1ZiAqZG1hX2J1ZiwKPiAtCQkJICAg
ICAgIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQo+IC17Cj4gLQkvKiBOb3QgaW1wbGVtZW50
ZWQuICovCj4gLQlyZXR1cm4gMDsKPiAtfQo+IC0KPiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZG1h
X2J1Zl9vcHMgZG1hYnVmX2V4cF9vcHMgPSAgewo+ICAgCS5hdHRhY2ggPSBkbWFidWZfZXhwX29w
c19hdHRhY2gsCj4gICAJLmRldGFjaCA9IGRtYWJ1Zl9leHBfb3BzX2RldGFjaCwKPiAgIAkubWFw
X2RtYV9idWYgPSBkbWFidWZfZXhwX29wc19tYXBfZG1hX2J1ZiwKPiAgIAkudW5tYXBfZG1hX2J1
ZiA9IGRtYWJ1Zl9leHBfb3BzX3VubWFwX2RtYV9idWYsCj4gICAJLnJlbGVhc2UgPSBkbWFidWZf
ZXhwX29wc19yZWxlYXNlLAo+IC0JLm1hcCA9IGRtYWJ1Zl9leHBfb3BzX2ttYXAsCj4gLQkudW5t
YXAgPSBkbWFidWZfZXhwX29wc19rdW5tYXAsCj4gLQkubW1hcCA9IGRtYWJ1Zl9leHBfb3BzX21t
YXAsCj4gICB9Owo+ICAgCj4gICBzdHJ1Y3QgZ250ZGV2X2RtYWJ1Zl9leHBvcnRfYXJncyB7Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
