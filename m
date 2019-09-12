Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48ED8B1604
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 23:48:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3035F6EE3B;
	Thu, 12 Sep 2019 21:48:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E5636EE3B
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 21:47:59 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id h144so58374641iof.7
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 14:47:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Nsh9wMtR+piWKMVssRxEW2CCDveInH3zQuunz33C6pw=;
 b=MQwHCzNgb6yYHX04GQzT/P6Rj5aPCRHfADGRSzMp3B//2xIozg8AKClIkVIGkfvJ3R
 51yuGahnhCOJqFAID9xBq4OCTxyLc3qUStXoQbE5LVXJXzn2QU/f8bel/NvAMRi8IgC/
 9IcSqvISaZEuVZi3Rd5SUfxA3OEC+s/CxaRp920MzsjgTCG717nXrRB8gbZ4JZd0JBLP
 fNpzPpV9niZbvs0x02IdlaQXMLQdpHWI2yxLrmLao7ICY5XQNh4BPGv5HMpKnTTHnd1C
 Aus56eFD6UvbobPlP7j9WL4T+jAUSw6r+JHMk9ikZqoQOQxuju5HZRp3BIDS8EjwWsWW
 hZlA==
X-Gm-Message-State: APjAAAX5nrqELsBO3mz8Ijw54kdVCeh6W+XQ3Ru+126J9MAup93Gspok
 a7qsltVQu6Eu5IHoKOzxO6Y6+mvpve9XitrK40c=
X-Google-Smtp-Source: APXvYqzNx4+RAMwUP0AmKza386+UJ1O8aCkriLtdGYKB0a3YLsBG+HWOAjyS4JOKf/XHHXzSp5FmG2p5vw1yFzQk8as=
X-Received: by 2002:a6b:db0e:: with SMTP id t14mr7016055ioc.93.1568324878498; 
 Thu, 12 Sep 2019 14:47:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190912114627.20176-1-kraxel@redhat.com>
In-Reply-To: <20190912114627.20176-1-kraxel@redhat.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 12 Sep 2019 14:47:47 -0700
Message-ID: <CAPaKu7T_TrCUEyjthshTjr_=uDQs+iJuPV68QYmmDJ7vodR35Q@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: enable prime mmap support
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Nsh9wMtR+piWKMVssRxEW2CCDveInH3zQuunz33C6pw=;
 b=HvE2JMW9DzbOnl+GJq4DI6qFxnw9TBb1eNu3XAJmXzaj7H21B/fTsn/qhRSoMS6r0Y
 jqt72xjKycAC7WPfc0t8jkHr3Pky0s11I8NjLHyrolMES9x+IWJsc7wYD2hG/9Fes2Ik
 nGxgHcJfhQISv8I2FcUw/ng61z1YORiGfiVeASwoda5a4J8R39JWJdAfEasQhs2ItKW2
 6ynBtqYv3FAA1LDnwigBmH9w4Hb+X8d1qIG1FA+MiZAQQ6DAgKekp9P5XVlaB2BCBRM9
 E80xav8My8RbT71tBoGsurjYpBALHN/v+wfEkBrRyqL82xOzLAxYFiPDUdsY1QX+WZnB
 JZaA==
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

T24gVGh1LCBTZXAgMTIsIDIwMTkgYXQgNDo0NiBBTSBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4KPiBTaWduZWQtb2ZmLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxA
cmVkaGF0LmNvbT4KUmV2aWV3ZWQtYnk6IENoaWEtSSBXdSA8b2x2YWZmZUBnbWFpbC5jb20+Cj4g
LS0tCj4gIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYuYyB8IDEgKwo+ICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vdmlydGlvL3ZpcnRncHVfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVf
ZHJ2LmMKPiBpbmRleCAwYzk1NTNlYTlmM2YuLjk2YzI0MGRiZjQ1MiAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZHJ2LmMKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vdmlydGlvL3ZpcnRncHVfZHJ2LmMKPiBAQCAtMjAwLDYgKzIwMCw3IEBAIHN0YXRpYyBzdHJ1
Y3QgZHJtX2RyaXZlciBkcml2ZXIgPSB7Cj4gICNlbmRpZgo+ICAgICAgICAgLnByaW1lX2hhbmRs
ZV90b19mZCA9IGRybV9nZW1fcHJpbWVfaGFuZGxlX3RvX2ZkLAo+ICAgICAgICAgLnByaW1lX2Zk
X3RvX2hhbmRsZSA9IGRybV9nZW1fcHJpbWVfZmRfdG9faGFuZGxlLAo+ICsgICAgICAgLmdlbV9w
cmltZV9tbWFwID0gZHJtX2dlbV9wcmltZV9tbWFwLAo+ICAgICAgICAgLmdlbV9wcmltZV9pbXBv
cnRfc2dfdGFibGUgPSB2aXJ0Z3B1X2dlbV9wcmltZV9pbXBvcnRfc2dfdGFibGUsCj4KPiAgICAg
ICAgIC5nZW1fY3JlYXRlX29iamVjdCA9IHZpcnRpb19ncHVfY3JlYXRlX29iamVjdCwKPiAtLQo+
IDIuMTguMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
