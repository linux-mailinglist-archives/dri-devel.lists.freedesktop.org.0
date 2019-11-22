Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD421068B7
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2019 10:17:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E7D96F508;
	Fri, 22 Nov 2019 09:17:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E32E6F502
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2019 09:17:38 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id b16so5576876otk.9
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2019 01:17:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pzjjzH4UgTeG40VA2UV6AHDBfr0Ocw4jXqlZWXYFvJ8=;
 b=aFpcU9ElA6h0nDbEjb+ACZ1rKxZ2698wbWMl0pQwXwT9ByOdMM/qR4lja2js9IUYA/
 MYcdAf60pJT1NxVbIiYJes2mxNe8wQNP+V8GVrBVt0mWHAO9bO9kHdyjhaiuJZ1DkO56
 YXngRzAZJEIYQBPXgqDp/s0yBRliczff5645DvaWo83koGmTX6ncjqGChu60PO4gA/5Q
 sS9OrBkRu0b4nMn7y21TKr2vHE7lnA25/hDa4GBqqTtlQMb8KvZ916ljd+jDEX2YDZLB
 TccMRR8cFPxvUBjA9xopWIrGJTUmGcacBTqMVlZwncs5gXATKuCThu0pfoJO1Qcgg/KJ
 Jziw==
X-Gm-Message-State: APjAAAUi09Sc+rws7j/DnADIzWyLONrwAO/Iph0IvEGZls2k2iJQa8vb
 8GYY8vFPzcXjSTSP1gBotq625zGxkw1N+xi8VcSjKg==
X-Google-Smtp-Source: APXvYqyhv427Hxx7/MmUbtqChclXEe6nJWw6xg1yaWUV406sDc3FO9lJ2GvjbigdCij390dY9m18ZCX2Ku6kj6cEKso=
X-Received: by 2002:a05:6830:1649:: with SMTP id
 h9mr10352872otr.281.1574414257767; 
 Fri, 22 Nov 2019 01:17:37 -0800 (PST)
MIME-Version: 1.0
References: <20191122063749.27113-1-kraxel@redhat.com>
 <20191122063749.27113-3-kraxel@redhat.com>
In-Reply-To: <20191122063749.27113-3-kraxel@redhat.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 22 Nov 2019 10:17:27 +0100
Message-ID: <CAKMK7uFz3hmPT3OE8UtUQwmv+tXsjazUWT2RVHLxAq47X+EaXA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm: share address space for dma bufs
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=pzjjzH4UgTeG40VA2UV6AHDBfr0Ocw4jXqlZWXYFvJ8=;
 b=PuTHrRo6gLJNu4P4PUUZivkRf9R8+X7UdnrZdLbDNmrrt/TpJ5FOmxGiHBbktnLk7p
 0L/NwFPVLdJbjnvUE+rXbTFVQk2JD4/qkscDImWPNAQqc2A2LZeJ94l8S2wH6NIG/TjM
 Lguv1/sk/Rm80MHeMl/ogckNAQlZmDWVrIRac=
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
Cc: "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, intel-gfx <intel-gfx@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMjIsIDIwMTkgYXQgNzozNyBBTSBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4KPiBVc2UgdGhlIHNoYXJlZCBhZGRyZXNzIHNwYWNlIG9mIHRoZSBk
cm0gZGV2aWNlIChzZWUgZHJtX29wZW4oKSBpbgo+IGRybV9maWxlLmMpIGZvciBkbWEtYnVmcyB0
b28uICBUaGF0IHJlbW92ZXMgYSBkaWZmZXJlbmNlIGJldHdlZW0gZHJtCj4gZGV2aWNlIG1tYXAg
dm1hcyBhbmQgZG1hLWJ1ZiBtbWFwIHZtYXMgYW5kIGZpeGVzIGNvcm5lciBjYXNlcyBsaWtlCj4g
ZHJvcHBpbmcgcHRlcyAodXNpbmcgbWFkdmlzZShET05UTkVFRCkgZm9yIGV4YW1wbGUpIG5vdCB3
b3JraW5nCj4gcHJvcGVybHkuCj4KPiBBbHNvIHJlbW92ZSBhbWRncHUgZHJpdmVyJ3MgcHJpdmF0
ZSBkbWFidWYgdXBkYXRlLiAgSXQgaXMgbm90IG5lZWRlZAo+IGFueSBtb3JlIG5vdyB0aGF0IHdl
IGFyZSBkb2luZyB0aGlzIGZvciBldmVyeWJvZHkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBHZXJkIEhv
ZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KClJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxk
YW5pZWwudmV0dGVyQGZmd2xsLmNoPgoKQnV0IEkgdGhpbmsgeW91IHdhbnQgYXQgbGVhc3QgYW4g
YWNrIGZyb20gYW1kIGd1eXMgZm9yIGRvdWJsZSBjaGVja2luZyBoZXJlLgotRGFuaWVsCj4gLS0t
Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kbWFfYnVmLmMgfCA0ICstLS0K
PiAgZHJpdmVycy9ncHUvZHJtL2RybV9wcmltZS5jICAgICAgICAgICAgICAgICB8IDQgKysrLQo+
ICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZG1hX2J1Zi5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RtYV9idWYuYwo+IGluZGV4IGQ1YmNk
ZmVmYmFkNi4uNTg2ZGI0ZmI0NmJkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9kbWFfYnVmLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZG1hX2J1Zi5jCj4gQEAgLTM2MSwxMCArMzYxLDggQEAgc3RydWN0IGRtYV9idWYg
KmFtZGdwdV9nZW1fcHJpbWVfZXhwb3J0KHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqZ29iaiwKPiAg
ICAgICAgICAgICAgICAgcmV0dXJuIEVSUl9QVFIoLUVQRVJNKTsKPgo+ICAgICAgICAgYnVmID0g
ZHJtX2dlbV9wcmltZV9leHBvcnQoZ29iaiwgZmxhZ3MpOwo+IC0gICAgICAgaWYgKCFJU19FUlIo
YnVmKSkgewo+IC0gICAgICAgICAgICAgICBidWYtPmZpbGUtPmZfbWFwcGluZyA9IGdvYmotPmRl
di0+YW5vbl9pbm9kZS0+aV9tYXBwaW5nOwo+ICsgICAgICAgaWYgKCFJU19FUlIoYnVmKSkKPiAg
ICAgICAgICAgICAgICAgYnVmLT5vcHMgPSAmYW1kZ3B1X2RtYWJ1Zl9vcHM7Cj4gLSAgICAgICB9
Cj4KPiAgICAgICAgIHJldHVybiBidWY7Cj4gIH0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9wcmltZS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wcmltZS5jCj4gaW5kZXggYTk2
MzNiZDI0MWJiLi5jM2ZjMzQxNDUzYzAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV9wcmltZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wcmltZS5jCj4gQEAgLTI0MCw2
ICsyNDAsNyBAQCB2b2lkIGRybV9wcmltZV9kZXN0cm95X2ZpbGVfcHJpdmF0ZShzdHJ1Y3QgZHJt
X3ByaW1lX2ZpbGVfcHJpdmF0ZSAqcHJpbWVfZnByaXYpCj4gIHN0cnVjdCBkbWFfYnVmICpkcm1f
Z2VtX2RtYWJ1Zl9leHBvcnQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBkbWFfYnVmX2V4cG9ydF9pbmZvICpleHBf
aW5mbykKPiAgewo+ICsgICAgICAgc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmogPSBleHBfaW5m
by0+cHJpdjsKPiAgICAgICAgIHN0cnVjdCBkbWFfYnVmICpkbWFfYnVmOwo+Cj4gICAgICAgICBk
bWFfYnVmID0gZG1hX2J1Zl9leHBvcnQoZXhwX2luZm8pOwo+IEBAIC0yNDcsNyArMjQ4LDggQEAg
c3RydWN0IGRtYV9idWYgKmRybV9nZW1fZG1hYnVmX2V4cG9ydChzdHJ1Y3QgZHJtX2RldmljZSAq
ZGV2LAo+ICAgICAgICAgICAgICAgICByZXR1cm4gZG1hX2J1ZjsKPgo+ICAgICAgICAgZHJtX2Rl
dl9nZXQoZGV2KTsKPiAtICAgICAgIGRybV9nZW1fb2JqZWN0X2dldChleHBfaW5mby0+cHJpdik7
Cj4gKyAgICAgICBkcm1fZ2VtX29iamVjdF9nZXQob2JqKTsKPiArICAgICAgIGRtYV9idWYtPmZp
bGUtPmZfbWFwcGluZyA9IG9iai0+ZGV2LT5hbm9uX2lub2RlLT5pX21hcHBpbmc7Cj4KPiAgICAg
ICAgIHJldHVybiBkbWFfYnVmOwo+ICB9Cj4gLS0KPiAyLjE4LjEKPgoKCi0tIApEYW5pZWwgVmV0
dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5IDM2NSA1
NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
