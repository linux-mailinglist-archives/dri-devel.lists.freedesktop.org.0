Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 899FE2D5CA
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 08:58:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D384B6E219;
	Wed, 29 May 2019 06:58:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 978DD6E219
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 06:58:32 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id f20so1991980edt.12
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 23:58:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=dZheSy6eAz59xj2yDsqlWC0RxAZP0KDbyPv0jrye2TQ=;
 b=PtJ+N+FUkZmlIyX2Rlh0uRnksBJGukzxrKuJ5MgDv70lwLMROix8+ApeT1dz5m5Z9c
 wcIE2LgV+ElfKREQ4gNaqEBuOOaOQabVchEAaqaxQwz4JTSsoVjC6fziAD7tsxbKC/8U
 54/GBZ9crKg2ncdv8IeiXCSEXDoO1BfI8Zg3DyFwx0YxgHH30p1kx1qTxcMq2A8K19lB
 KZ0LLMqG4Tn6R4O90duWMWx1D3B8BZf5T2jAjQkIDdKQHsI3XgvffZugqlyg+7YfoqoH
 ji3jCkgs0GuW70CBHC4PbWrWz4JqLNpH2wFas6L7OgGfwV7BzQoL30MnGJDJEeQe+v1+
 6OeA==
X-Gm-Message-State: APjAAAUSrd4t1TsDwQfxEAhqfObodpfWm/9j8ujVh1Ox+4PVKm2/Nggt
 TAcfmTmHKJNes3rSy5LaV1N8WQ==
X-Google-Smtp-Source: APXvYqzmLSvOLaEop6lyVH/1HsjXzeEcq7DudmzmthpYZJAEbuxaYSNBlDX1OdsqLSvDjEa93SFgkg==
X-Received: by 2002:a17:906:5048:: with SMTP id
 e8mr50369556ejk.91.1559113111267; 
 Tue, 28 May 2019 23:58:31 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id d4sm4950287edk.46.2019.05.28.23.58.29
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 28 May 2019 23:58:30 -0700 (PDT)
Date: Wed, 29 May 2019 08:58:28 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH] drm/gem_shmem: Use a writecombine mapping for ->vaddr
Message-ID: <20190529065828.GU21222@phenom.ffwll.local>
References: <20190529065121.13485-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190529065121.13485-1-boris.brezillon@collabora.com>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=dZheSy6eAz59xj2yDsqlWC0RxAZP0KDbyPv0jrye2TQ=;
 b=OEa/eHU+nb2uVm/fNC8cTOhCP/UgI2H2J0f6WlYVrjpYdFwpj7A/g89v4+jBIQePst
 qtOAvlesQh5adK0tCoqyF5z2Ckb5nHtrYIzs9PWM7m/JZQkPNh4Trz8aouysnxUM4n+I
 yQ6qfBCVLrRbMY/Gstjmwhi4BkIQQNajTY73I=
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
Cc: Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMjksIDIwMTkgYXQgMDg6NTE6MjFBTSArMDIwMCwgQm9yaXMgQnJlemlsbG9u
IHdyb3RlOgo+IFJpZ2h0IG5vdywgdGhlIEJPIGlzIG1hcHBlZCBhcyBhIGNhY2hlZCByZWdpb24g
d2hlbiAtPnZtYXAoKSBpcyBjYWxsZWQKPiBhbmQgdGhlIHVuZGVybHlpbmcgb2JqZWN0IGlzIG5v
dCBhIGRtYWJ1Zi4KPiBEb2luZyB0aGF0IG1ha2VzIGNhY2hlIG1hbmFnZW1lbnQgYSBiaXQgbW9y
ZSBjb21wbGljYXRlZCAoeW91J2QgbmVlZAo+IHRvIGNhbGwgZG1hX21hcC91bm1hcF9zZygpIG9u
IHRoZSAtPnNndCBmaWVsZCBldmVyeXRpbWUgdGhlIEJPIGlzIGFib3V0Cj4gdG8gYmUgcGFzc2Vk
IHRvIHRoZSBHUFUvQ1BVKSwgc28gbGV0J3MgbWFwIHRoZSBCTyB3aXRoIHdyaXRlY29tYmluZQo+
IGF0dHJpYnV0ZXMgaW5zdGVhZCAoYXMgZG9uZSBpbiBtb3N0IGRyaXZlcnMpLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+
Cj4gLS0tCj4gRm91bmQgdGhpcyBpc3N1ZSB3aGlsZSB3b3JraW5nIG9uIHBhbmZyb3N0IHBlcmZj
bnQgd2hlcmUgdGhlIEdQVSBkdW1wcwo+IHBlcmYgY291bnRlciB2YWx1ZXMgaW4gbWVtb3J5IGFu
ZCB0aGUgQ1BVIHJlYWRzIHRoZW0gYmFjayBpbgo+IGtlcm5lbC1zcGFjZS4gVGhpcyBwYXRjaCBz
ZWVtcyB0byBzb2x2ZSB0aGUgdW5wcmVkaWN0YWJsZSBiZWhhdmlvciBJCj4gaGFkLgo+IAo+IEkg
Y2FuIGFsc28gZ28gZm9yIHRoZSBvdGhlciBvcHRpb24gKGNhbGwgZG1hX21hcC91bm1hcC9fc2co
KSB3aGVuCj4gbmVlZGVkKSBpZiB5b3UgdGhpbmsgdGhhdCdzIG1vcmUgYXBwcm9wcmlhdGUuCgpV
aCwgSSBndWVzcyBzaG1lbSBoZWxwZXJzIChvciBnZW0gaGVscGVycyBpbiBnZW5lcmFsKSBuZWVk
IHNvbWUgY29uY2VwdAphYm91dCB3aGF0IGtpbmQgb2YgY3B1IG1hcHBpbmcgaXMgZGVzaXJlZC4g
U2luY2Ugc29tZSBjcHVzIChsaWtlIGUuZy4KaTkxNSkgZG8gYWN0dWFsbHkgd2FudCBjYWNoZWQg
bW9kZSBmb3IgZXZlcnl0aGluZy4KClNhbWUgaXMgbmVlZGVkIGZvciB0aGUgdXNlcnNwYWNlIG1t
YXAsIHRob3NlIHNob3VsZCBhbGwgYWdyZWUuCgpEZWZhdWx0IHByb2JhYmx5IGJlc3QgaWYgd2Ug
Z28gd2l0aCB1bmNhY2hlZC4KLURhbmllbAoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9n
ZW1fc2htZW1faGVscGVyLmMgfCAzICsrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
Z2VtX3NobWVtX2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVy
LmMKPiBpbmRleCAxZWUyMDhjMmM4NWUuLjQ3MmVhNWQ4MWY4MiAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZ2VtX3NobWVtX2hlbHBlci5jCj4gQEAgLTI1NSw3ICsyNTUsOCBAQCBzdGF0aWMgdm9p
ZCAqZHJtX2dlbV9zaG1lbV92bWFwX2xvY2tlZChzdHJ1Y3QgZHJtX2dlbV9zaG1lbV9vYmplY3Qg
KnNobWVtKQo+ICAJaWYgKG9iai0+aW1wb3J0X2F0dGFjaCkKPiAgCQlzaG1lbS0+dmFkZHIgPSBk
bWFfYnVmX3ZtYXAob2JqLT5pbXBvcnRfYXR0YWNoLT5kbWFidWYpOwo+ICAJZWxzZQo+IC0JCXNo
bWVtLT52YWRkciA9IHZtYXAoc2htZW0tPnBhZ2VzLCBvYmotPnNpemUgPj4gUEFHRV9TSElGVCwg
Vk1fTUFQLCBQQUdFX0tFUk5FTCk7Cj4gKwkJc2htZW0tPnZhZGRyID0gdm1hcChzaG1lbS0+cGFn
ZXMsIG9iai0+c2l6ZSA+PiBQQUdFX1NISUZULAo+ICsJCQkJICAgIFZNX01BUCwgcGdwcm90X3dy
aXRlY29tYmluZShQQUdFX0tFUk5FTCkpOwo+ICAKPiAgCWlmICghc2htZW0tPnZhZGRyKSB7Cj4g
IAkJRFJNX0RFQlVHX0tNUygiRmFpbGVkIHRvIHZtYXAgcGFnZXNcbiIpOwo+IC0tIAo+IDIuMjAu
MQo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
ZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9u
Cmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
