Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF2D5FD4D
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 21:08:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52BCD6E3C1;
	Thu,  4 Jul 2019 19:08:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFD816E3C1
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 19:08:25 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id g20so4999770ioc.12
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jul 2019 12:08:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9btak+fKeivJpFWumZoTjMC0trVA+9MBYmqaPWrOHn0=;
 b=pMxtfR65boL2GDyuFnE8H3MMonrCroeHOoqqawzZ+xnMNOxwyPKS0XkTss4Trigv/T
 6nnI2mYPUxAnV0qESjM/s0D+sGd5Z5ZeYWRYzlYhX20HjgQgqk59voJdEcMGuSPgtPv3
 RlYEuQC4KnlTLfArmK0EYNkMgJB0ACKEzAI4wPsqDNb/njfSgH9i3LOY0ppREcUdb3TY
 ND80UB/IG6xTJXLj5t8K17s8XRnpw4mxhVjXerS8XjoRZuHtDpP/XurRC+wgDoo1XFel
 cknDBeRdODoDCF2Z/8h7EZy+yqYAg1Gv9E/t/+dP2ujYEbpuTYtHU6pOwUtPz3B7BhcZ
 4Mcw==
X-Gm-Message-State: APjAAAXtukgb8JXMOt2kUhn3rziLwLtcbnZumqS+19CkL9AD/UntzFRe
 glQ/VsUUR/+K0Bk4mOY0GV1ZQJAWg5oihn6GjyiYEjE7
X-Google-Smtp-Source: APXvYqwVyWfwlxBxJohecI/H5oxgmdJ1n8iHxHi16NUSGnX6AI3z95oR6ILRv45iTfcdHoNfZuLXFs+sMg1SjT1yH1E=
X-Received: by 2002:a6b:6012:: with SMTP id r18mr5922135iog.241.1562267305070; 
 Thu, 04 Jul 2019 12:08:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190702141903.1131-1-kraxel@redhat.com>
 <20190702141903.1131-16-kraxel@redhat.com>
 <CAPaKu7S0n=E7g0o2e6fEk1YjP+u=tsoV8upw7J=noSx88PgP+A@mail.gmail.com>
 <20190704115138.ou77sb3rlrex67tj@sirius.home.kraxel.org>
In-Reply-To: <20190704115138.ou77sb3rlrex67tj@sirius.home.kraxel.org>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 4 Jul 2019 12:08:14 -0700
Message-ID: <CAPaKu7SDwR1TgFQK2XGEbRqSkCO0XZYxGhcjzsAwOH42aOHEEw@mail.gmail.com>
Subject: Re: [PATCH v6 15/18] drm/virtio: rework
 virtio_gpu_transfer_to_host_ioctl fencing
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=9btak+fKeivJpFWumZoTjMC0trVA+9MBYmqaPWrOHn0=;
 b=kKiKA2Bj2KAI7YLiGcXr0lnUd35Z3UyghngWdqXiuA02WwEsXazhsQZ2v/rgyYCWIH
 QIHGE6M8JPkfdOpDTW3UzfojE/jdlxwLksTRbmJMTtStjpQz8CGWJu/qF7ygua0YZEgx
 MZAT43VECo5VkmOouhrKOC82DAu+xzsJ9+fYC364Z+Ux3E64M4LkH+0oB4H2QVUGDLuc
 RT5MGIzK7yMVUmB8K99/ot6LYVjDmM2Mz+qfqYj+PU7GDG5x0Y3gx9YQJiemTx42YtI4
 MZpCNrpKfIjAWtnU5SUwmQ7+d79p6bmIychFN/kp1I0+ymcIhPYGJS4UOPL1qIcZDu6a
 K6Rg==
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

T24gVGh1LCBKdWwgNCwgMjAxOSBhdCA0OjUxIEFNIEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRo
YXQuY29tPiB3cm90ZToKPgo+ICAgSGksCj4KPiA+ID4gICAgICAgICBjb252ZXJ0X3RvX2h3X2Jv
eCgmYm94LCAmYXJncy0+Ym94KTsKPiA+ID4gICAgICAgICBpZiAoIXZnZGV2LT5oYXNfdmlyZ2xf
M2QpIHsKPiA+ID4gICAgICAgICAgICAgICAgIHZpcnRpb19ncHVfY21kX3RyYW5zZmVyX3RvX2hv
c3RfMmQKPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgKHZnZGV2LCBxb2JqLCBvZmZzZXQs
Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICh2Z2RldiwgZ2VtX3RvX3ZpcnRpb19ncHVf
b2JqKG9ianMtPm9ianNbMF0pLCBvZmZzZXQsCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAg
ICBib3gudywgYm94LmgsIGJveC54LCBib3gueSwgTlVMTCk7Cj4gPiA+ICsgICAgICAgICAgICAg
ICB2aXJ0aW9fZ3B1X2FycmF5X3B1dF9mcmVlKG9ianMpOwo+ID4gRG9uJ3Qgd2UgbmVlZCB0aGlz
IGluIG5vbi0zRCBjYXNlIGFzIHdlbGw/Cj4KPiBObywgLi4uCj4KPiA+ID4gICAgICAgICAgICAg
ICAgIHZpcnRpb19ncHVfY21kX3RyYW5zZmVyX3RvX2hvc3RfM2QKPiA+ID4gLSAgICAgICAgICAg
ICAgICAgICAgICAgKHZnZGV2LCBxb2JqLAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAo
dmdkZXYsCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICB2ZnByaXYgPyB2ZnByaXYtPmN0
eF9pZCA6IDAsIG9mZnNldCwKPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgIGFyZ3MtPmxl
dmVsLCAmYm94LCBmZW5jZSk7Cj4gPiA+IC0gICAgICAgICAgICAgICByZXNlcnZhdGlvbl9vYmpl
Y3RfYWRkX2V4Y2xfZmVuY2UocW9iai0+YmFzZS5iYXNlLnJlc3YsCj4gPiA+IC0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmZlbmNlLT5mKTsKPiA+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgIGFyZ3MtPmxldmVsLCAmYm94LCBvYmpzLCBmZW5jZSk7
Cj4KPiAuLi4gM2QgY2FzZSBwYXNzZXMgdGhlIG9ianMgbGlzdCB0byB2aXJ0aW9fZ3B1X2NtZF90
cmFuc2Zlcl90b19ob3N0XzNkLAo+IHNvIGl0IGdldHMgYWRkZWQgdG8gdGhlIHZidWYgYW5kIHJl
bGVhc2VkIHdoZW4gdGhlIGNvbW1hbmQgaXMgZmluaXNoZWQuCldoeSBkb2Vzbid0IHRoaXMgYXBw
bHkgdG8gdmlydGlvX2dwdV9jbWRfdHJhbnNmZXJfdG9faG9zdF8yZD8KCldoZW4gb2JqZWN0IGFy
cmF5IHdhcyBpbnRyb2R1Y2VkLCBpdCB3YXMgc2FpZCB0aGF0IHRoZSBvYmplY3QgYXJyYXkKd2Fz
IHRvIGtlZXAgdGhlIG9iamVjdHMgYWxpdmUgdW50aWwgdGhlIHZidWYgdXNpbmcgdGhlIG9iamVj
dHMgaXMKcmV0aXJlZC4uICBUaGF0IHNvdW5kZWQgYXBwbGljYWJsZSB0byBhbnkgdmJ1ZiB0aGF0
IHVzZXMgb2JqZWN0cy4KCgo+Cj4gY2hlZXJzLAo+ICAgR2VyZAo+Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
