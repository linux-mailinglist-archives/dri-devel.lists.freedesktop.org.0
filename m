Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B31885FD2C
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 20:56:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF27C6E3AA;
	Thu,  4 Jul 2019 18:56:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15D176E3AA
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 18:56:11 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id g20so4946171ioc.12
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jul 2019 11:56:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dVPI54F8WztxoPvvjrKlk6t2iT7s82kVikoygRX/3n8=;
 b=ASPj3r5bytix8s8PMzifvH/ZSPXRhvCKJAv5pc72Z3k198UoP4SCxJ89dQIU3M1pnT
 zJRsth1L5nPvVZXI+0zBhEXXgZe8foJVfuKo4PkI9stymtp2YO7UoBxF9EZYHeaLiHVf
 e0GjGJHGsDX013KrEW5uXG1Wcdd+Urj31C/kBMEAlo0LGTq8lMSKwKOc1BYOHPKLIQLA
 VNBTA0Qu8F5Q6+Z2GjFMx5FQhH8W72fcjFtUj4qlLikeNz/ms+RH3e3r9zvSsPjNeJ/L
 aKD16c+FQ9cWjLE57IGAZybU+6jQTDrWrX7aIsGdtprvftdoqpOFdRw8qQc0A4hR5+hK
 G3BA==
X-Gm-Message-State: APjAAAUINBdhJg1/v0uG/5/d5OL5vGqclKklDoMuR3jglluu/cXbrcLG
 1KQmUy2iT3aPU6z61zIz7BWEBGUF5VBP8Uxg5hM=
X-Google-Smtp-Source: APXvYqyuufs960P1/vdGPNwzz71qxLDK4zx/ys1xqg1z6vid7XwTdQRhtt9ehbnzPiPsMMVOwUiY5nfaXOyov9XPTsE=
X-Received: by 2002:a05:6602:104:: with SMTP id
 s4mr39095774iot.200.1562266570329; 
 Thu, 04 Jul 2019 11:56:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190702141903.1131-1-kraxel@redhat.com>
 <20190702141903.1131-15-kraxel@redhat.com>
 <CAPaKu7T3GvYVMueYgJFhADFSFEVbHEdaupw8=mq_+i150a1mLA@mail.gmail.com>
 <20190704114756.eavkszsgsyymns3m@sirius.home.kraxel.org>
In-Reply-To: <20190704114756.eavkszsgsyymns3m@sirius.home.kraxel.org>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 4 Jul 2019 11:55:59 -0700
Message-ID: <CAPaKu7SXJwDg1uE0qDOYNS6J44UuQUh6m5rpJ3hBtW2tqYmMKA@mail.gmail.com>
Subject: Re: [PATCH v6 14/18] drm/virtio: rework
 virtio_gpu_transfer_from_host_ioctl fencing
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=dVPI54F8WztxoPvvjrKlk6t2iT7s82kVikoygRX/3n8=;
 b=DIf/ee9k2Z3dPthl5Ioi3W+zUz0Naw3h98O8/cIJvOQr2OguAQaYQ9/kWMGcp8zUI8
 MAT9owEMUZvzIHfO94gDHaf7rjxGpW8Z4FlIsOhETeickK9dOPi7j0OwJgMph6sSg9CW
 HWKDxvhqH4+zwwXhEQzOyKGxFLSohHnGiAo9nxOHWGhA2iZbGTYfSWuR+73+PhMJtyIb
 /LvwizkK5g44YnpbwLdy+qB+qFZIoY4meT65RCjC1K/RMNS9+qHgrhcuUB7+FCkx5Hld
 vXQs1+iaUhtVDJH1hFaxqm9343a0RehxmKCxkdm+UssSPkqKaHjitzLG8uyJPFXXNFs/
 jd0A==
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
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgNCwgMjAxOSBhdCA0OjQ4IEFNIEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRo
YXQuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgSnVsIDAzLCAyMDE5IGF0IDAxOjA1OjEyUE0gLTA3
MDAsIENoaWEtSSBXdSB3cm90ZToKPiA+IE9uIFR1ZSwgSnVsIDIsIDIwMTkgYXQgNzoxOSBBTSBH
ZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IFN3aXRj
aCB0byB0aGUgdmlydGlvX2dwdV9hcnJheV8qIGhlbHBlciB3b3JrZmxvdy4KPiA+IChqdXN0IHJl
cGVhdGluZyBteSBxdWVzdGlvbiBvbiBwYXRjaCA2KQo+ID4KPiA+IERvZXMgdGhpcyBmaXggdGhl
IG9iaiByZWZjb3VudCBpc3N1ZT8gIFdoZW4gd2FzIHRoZSBpc3N1ZSBpbnRyb2R1Y2VkPwo+Cj4g
b2JqIHJlZmNvdW50IHNob3VsZCBiZSBmaW5lIGluIGJvdGggb2xkIGFuZCBuZXcgY29kZS4KPgo+
IG9sZCBjb2RlOgo+ICAgZHJtX2dlbV9vYmplY3RfbG9va3VwCj4gICBkcm1fZ2VtX29iamVjdF9w
dXRfdW5sb2NrZWQKPgo+IG5ldyBjb2RlOgo+ICAgdmlydGlvX2dwdV9hcnJheV9mcm9tX2hhbmRs
ZXMKPiAgIHZpcnRpb19ncHVfYXJyYXlfcHV0X2ZyZWUgKGluIHZpcnRpb19ncHVfZGVxdWV1ZV9j
dHJsX2Z1bmMpLgo+Cj4gT3IgZGlkIEkgbWlzcyBzb21ldGhpbmc/CkluIHRoZSBvbGQgY29kZSwg
ZHJtX2dlbV9vYmplY3RfcHV0X3VubG9ja2VkIGlzIGNhbGxlZCBiZWZvcmUgdGhlIHZidWYKdXNp
bmcgdGhlIG9iamVjdCBpcyByZXRpcmVkLiAgSXNuJ3QgdGhhdCB3aGF0IG9iamVjdCBhcnJheSB3
YW50cyB0bwpmaXg/CgpXZSBnZXQgYXdheSB3aXRoIHRoYXQgYmVjYXVzZSB0aGUgaG9zdCBvbmx5
IHNlZXMgIGh3X3Jlc19oYW5kbGVzLCBhbmQKZXhlY3V0ZXMgdGhlIGNvbW1hbmRzIGluIG9yZGVy
LgoKTWF5YmUgaXQgd2FzIG1lIHdobyBtaXNzZWQgc29tZXRoaW5nLi4/Cgo+Cj4gY2hlZXJzLAo+
ICAgR2VyZAo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
