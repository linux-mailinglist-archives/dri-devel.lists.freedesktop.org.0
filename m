Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6015357516
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 01:55:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C8376E55C;
	Wed, 26 Jun 2019 23:55:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 655C36E55C
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 23:55:33 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id j6so705749ioa.5
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 16:55:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WFOmBfL98emh/MYkHT7m04HAElQFNQEeVW5ROqlJL+Y=;
 b=tKoN9fCpv9VUlW08RvyJFIMFvzSEeXQ2LrpGb7AqoF/YR1twhi05BzzV/IQtk63i5X
 BGrVAqUm/bpGx6HKZ5vjF+PFcCwvvl9lqhT5rPO8u5hJODkRAghPELqQ3vcRHb+6Y70A
 kLKiuNdsfkjQIZMqt1poP5+iubUgl1JhiXe+Lk8E20EQSrzmvb4JbjgYCKhnp79jOzpi
 66/TlQG3dZ9qym7JutCS/AWlUYjQuOtP+Sx4ogQNmTdr536PTJHxbV/Z2x4ew7W6AmwT
 0xKThIVyBGvzLx05Fi9bnOfIz2tepO+hQrG+Dah81H8xCRrgkW3D2gv49/inbEQR9M9s
 yBFQ==
X-Gm-Message-State: APjAAAV+o6bsG9h+Ne7lcVZ2KwafHwDFoFlU4OkKDKoKGxOqvXLbQY89
 lbOpOZJ6iOtmbLnjCjts0pm72wSd4im48YH4ZJw=
X-Google-Smtp-Source: APXvYqxJskAboHi/EJpGElxVyZ0pbUBPtkqfxFuTpUiQaqkNzIP0fuT6ddNPHhSVOlefT8unJ7Gyt/hPlYS+l8eheig=
X-Received: by 2002:a02:b10b:: with SMTP id r11mr836507jah.140.1561593331304; 
 Wed, 26 Jun 2019 16:55:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190620060726.926-1-kraxel@redhat.com>
 <20190620060726.926-3-kraxel@redhat.com>
In-Reply-To: <20190620060726.926-3-kraxel@redhat.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Wed, 26 Jun 2019 16:55:20 -0700
Message-ID: <CAPaKu7RWpoRkTkoatdYHz6itHZFvUYgaBcQAXnSC2gDc+dFZxQ@mail.gmail.com>
Subject: Re: [PATCH v4 02/12] drm/virtio: switch virtio_gpu_wait_ioctl() to
 gem helper.
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=WFOmBfL98emh/MYkHT7m04HAElQFNQEeVW5ROqlJL+Y=;
 b=WkdsB90003wZlIbZPOM6yLKQ8fZBLPGqZD10BWCj96jgkU45YwHT5zGBlN5RrS2PjH
 pieBPX2NOzAKAgDARKZwvKO71cNZl1UlkkjYQCJ8lj0+qHwNg2VtG2cJECKc5bjHTmwr
 Dg2ykRz1tGxTbqn45qfr393V2c2KX0AW7GsXwEdu8Q6I8bmrjyz6wikBj4K0vP3QtNDL
 jZOKCHdQbEhllLoUcNHcFkD+UjcVIANEc6MnGoYQIwF0nMdBe1+OFnWXoxpXl1QQf8x0
 Qi/y2bncdtk52+xsoJb4kKI+4BKc8ZN8XP0Ag9T+uKf8XV9Lhwtg4+3bygxI5ufL+jnq
 +uUQ==
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTksIDIwMTkgYXQgMTE6MDcgUE0gR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJl
ZGhhdC5jb20+IHdyb3RlOgo+Cj4gVXNlIGRybV9nZW1fcmVzZXJ2YXRpb25fb2JqZWN0X3dhaXQo
KSBpbiB2aXJ0aW9fZ3B1X3dhaXRfaW9jdGwoKS4KPiBUaGlzIGFsc28gbWFrZXMgdGhlIGlvY3Rs
IHJ1biBsb2NrbGVzcy4KVGhlIHVzZXJzcGFjZSBoYXMgYSBCTyBjYWNoZSB0byBhdm9pZCBmcmVl
aW5nIEJPcyBpbW1lZGlhdGVseSBidXQgdG8KcmV1c2UgdGhlbSBvbiBuZXh0IGFsbG9jYXRpb25z
LiAgVGhlIEJPIGNhY2hlIGNoZWNrcyBpZiBhIEJPIGlzIGJ1c3kKYmVmb3JlIHJldXNlLCBhbmQg
SSBhbSBzZWVpbmcgYSBiaWcgbmVnYXRpdmUgcGVyZiBpbXBhY3QgYmVjYXVzZSBvZgpzbG93IHZp
cnRpb19ncHVfd2FpdF9pb2N0bC4gIEkgd29uZGVyIGlmIHRoaXMgaGVscHMuCgoKPgo+IHYyOiB1
c2UgcmVzZXJ2YXRpb25fb2JqZWN0X3Rlc3Rfc2lnbmFsZWRfcmN1IGZvciBWSVJUR1BVX1dBSVRf
Tk9XQUlULgo+Cj4gU2lnbmVkLW9mZi1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5j
b20+Cj4gUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+
Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9pb2N0bC5jIHwgMjQgKysr
KysrKysrKy0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCsp
LCAxNCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlv
L3ZpcnRncHVfaW9jdGwuYyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9pb2N0bC5j
Cj4gaW5kZXggYWM2MGJlOWI1YzE5Li4zMTNjNzcwZWEyYzUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2lvY3RsLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
dmlydGlvL3ZpcnRncHVfaW9jdGwuYwo+IEBAIC00NjQsMjMgKzQ2NCwxOSBAQCBzdGF0aWMgaW50
IHZpcnRpb19ncHVfd2FpdF9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRh
LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGUpCj4g
IHsKPiAgICAgICAgIHN0cnVjdCBkcm1fdmlydGdwdV8zZF93YWl0ICphcmdzID0gZGF0YTsKPiAt
ICAgICAgIHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqZ29iaiA9IE5VTEw7Cj4gLSAgICAgICBzdHJ1
Y3QgdmlydGlvX2dwdV9vYmplY3QgKnFvYmogPSBOVUxMOwo+ICsgICAgICAgc3RydWN0IGRybV9n
ZW1fb2JqZWN0ICpvYmo7Cj4gKyAgICAgICBsb25nIHRpbWVvdXQgPSAxNSAqIEhaOwo+ICAgICAg
ICAgaW50IHJldDsKPiAtICAgICAgIGJvb2wgbm93YWl0ID0gZmFsc2U7Cj4KPiAtICAgICAgIGdv
YmogPSBkcm1fZ2VtX29iamVjdF9sb29rdXAoZmlsZSwgYXJncy0+aGFuZGxlKTsKPiAtICAgICAg
IGlmIChnb2JqID09IE5VTEwpCj4gLSAgICAgICAgICAgICAgIHJldHVybiAtRU5PRU5UOwo+ICsg
ICAgICAgaWYgKGFyZ3MtPmZsYWdzICYgVklSVEdQVV9XQUlUX05PV0FJVCkgewo+ICsgICAgICAg
ICAgICAgICBvYmogPSBkcm1fZ2VtX29iamVjdF9sb29rdXAoZmlsZSwgYXJncy0+aGFuZGxlKTsK
RG9uJ3Qgd2UgbmVlZCBhIE5VTEwgY2hlY2sgaGVyZT8KPiArICAgICAgICAgICAgICAgcmV0ID0g
cmVzZXJ2YXRpb25fb2JqZWN0X3Rlc3Rfc2lnbmFsZWRfcmN1KG9iai0+cmVzdiwgdHJ1ZSk7Cj4g
KyAgICAgICAgICAgICAgIGRybV9nZW1fb2JqZWN0X3B1dF91bmxvY2tlZChvYmopOwo+ICsgICAg
ICAgICAgICAgICByZXR1cm4gcmV0ID8gMCA6IC1FQlVTWTsKPiArICAgICAgIH0KPgo+IC0gICAg
ICAgcW9iaiA9IGdlbV90b192aXJ0aW9fZ3B1X29iaihnb2JqKTsKPiAtCj4gLSAgICAgICBpZiAo
YXJncy0+ZmxhZ3MgJiBWSVJUR1BVX1dBSVRfTk9XQUlUKQo+IC0gICAgICAgICAgICAgICBub3dh
aXQgPSB0cnVlOwo+IC0gICAgICAgcmV0ID0gdmlydGlvX2dwdV9vYmplY3Rfd2FpdChxb2JqLCBu
b3dhaXQpOwo+IC0KPiAtICAgICAgIGRybV9nZW1fb2JqZWN0X3B1dF91bmxvY2tlZChnb2JqKTsK
PiAtICAgICAgIHJldHVybiByZXQ7Cj4gKyAgICAgICByZXR1cm4gZHJtX2dlbV9yZXNlcnZhdGlv
bl9vYmplY3Rfd2FpdChmaWxlLCBhcmdzLT5oYW5kbGUsCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB0cnVlLCB0aW1lb3V0KTsKPiAgfQo+Cj4gIHN0YXRp
YyBpbnQgdmlydGlvX2dwdV9nZXRfY2Fwc19pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAo+
IC0tCj4gMi4xOC4xCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
