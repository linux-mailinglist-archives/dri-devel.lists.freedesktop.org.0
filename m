Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFA65B15C
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 20:56:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C7CF89DCF;
	Sun, 30 Jun 2019 18:56:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41C0E89DCF
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jun 2019 18:56:48 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id s7so23616147iob.11
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jun 2019 11:56:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NaLfjipo68BMwPOD4vQyPZ7y9beiaLM//1SyGkkxM5c=;
 b=E9/1pRCmf5rwcrGOOxTy29K1pbDOiKlt6bDmuPCLXeIDLrhjihSQ1jCiMT9fxb9oeQ
 +faGGjyKdS1KjiONH6/6tBxjMCreD68QmVTgrNjZJnBb/6EvcssXnp7YZ45RgdqTfHd1
 C/G+oYZz3i6mT+ZOIOL7Oo3/CChuoRTEokuTju4h/rnk90UFvWeuQa6TqfSCEWMiVbuK
 AAciIZjXa2w/pZ4TbK/HHtxL71kQxDACW6dM3E9OHFwF0KKvhy6h76ddVv6oiXm1LDO7
 aBzx5HyWGl+SizfldGc/MSR39ojj9VfNeHBoBufc+/cyjP+5Hv3sOmwyr6swXkiE6oLW
 hGlA==
X-Gm-Message-State: APjAAAV7RkyGqW+KV/hC5Bbi2ejiZdAMVWViQoEm2EzA+zYQwX5esqs3
 hmkZAXNg7M9/SVftd4KFN8c2MPCjtSON/Q3OSPg=
X-Google-Smtp-Source: APXvYqyMps6KCRaoTQcQY5rJRYIy3v+QD9VTGz6/p/YraTOJR2mc+l8GXQaEuQN1N1pOBWeesZMvghGdMdaXry7tnuk=
X-Received: by 2002:a02:9f84:: with SMTP id a4mr18440799jam.20.1561921007426; 
 Sun, 30 Jun 2019 11:56:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190620060726.926-1-kraxel@redhat.com>
 <20190620060726.926-3-kraxel@redhat.com>
 <CAPaKu7RWpoRkTkoatdYHz6itHZFvUYgaBcQAXnSC2gDc+dFZxQ@mail.gmail.com>
 <20190628100516.yrtiuxemyt4hvyra@sirius.home.kraxel.org>
In-Reply-To: <20190628100516.yrtiuxemyt4hvyra@sirius.home.kraxel.org>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Sun, 30 Jun 2019 11:56:36 -0700
Message-ID: <CAPaKu7QOegd=kzOQMZQcogGSWf1hVqJHuMs-mEX0sRufUhNAcA@mail.gmail.com>
Subject: Re: [PATCH v4 02/12] drm/virtio: switch virtio_gpu_wait_ioctl() to
 gem helper.
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=NaLfjipo68BMwPOD4vQyPZ7y9beiaLM//1SyGkkxM5c=;
 b=PyWYVlQnOFkdzGkNDuulU3+I3bDzqoT+eDsFc0z4yLtmvtxmJ/GdhMghXfjmwT1xgC
 TF2ruQzrIphDlACAApiQEeYhyAjvzd9h5mL6OOFa/Fn769cuxA7ZA11qLgAm9Ptvd25U
 E2N2W2Cr9L5yzfU5wHxu3NuDf5NxlhNrNwnyDk/BjYS4VzIFKxj6WXXQTdOHmAE7K2Lz
 pUKulussCCkCqtWGc8E6CqaHrupQk5Ud5w5IS+rn82WIjjS4yMDZAy8HYqKwrsufY/ft
 IAvz9rdJ2/e40j98btngjeo7Uf6fSW4vEpir2BhF1wbT1RI5+UiObopDQkJrgn1PMnfT
 lzBA==
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

T24gRnJpLCBKdW4gMjgsIDIwMTkgYXQgMzowNSBBTSBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIEp1biAyNiwgMjAxOSBhdCAwNDo1NToyMFBNIC0w
NzAwLCBDaGlhLUkgV3Ugd3JvdGU6Cj4gPiBPbiBXZWQsIEp1biAxOSwgMjAxOSBhdCAxMTowNyBQ
TSBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IFVz
ZSBkcm1fZ2VtX3Jlc2VydmF0aW9uX29iamVjdF93YWl0KCkgaW4gdmlydGlvX2dwdV93YWl0X2lv
Y3RsKCkuCj4gPiA+IFRoaXMgYWxzbyBtYWtlcyB0aGUgaW9jdGwgcnVuIGxvY2tsZXNzLgo+ID4g
VGhlIHVzZXJzcGFjZSBoYXMgYSBCTyBjYWNoZSB0byBhdm9pZCBmcmVlaW5nIEJPcyBpbW1lZGlh
dGVseSBidXQgdG8KPiA+IHJldXNlIHRoZW0gb24gbmV4dCBhbGxvY2F0aW9ucy4gIFRoZSBCTyBj
YWNoZSBjaGVja3MgaWYgYSBCTyBpcyBidXN5Cj4gPiBiZWZvcmUgcmV1c2UsIGFuZCBJIGFtIHNl
ZWluZyBhIGJpZyBuZWdhdGl2ZSBwZXJmIGltcGFjdCBiZWNhdXNlIG9mCj4gPiBzbG93IHZpcnRp
b19ncHVfd2FpdF9pb2N0bC4gIEkgd29uZGVyIGlmIHRoaXMgaGVscHMuCj4KPiBDb3VsZCBoZWxw
IGluZGVlZCAoYXNzdW1pbmcgaXQgY2hlY2tzIHdpdGggTk9XQUlUKS4KWWVhaCwgdGhhdCBpcyB0
aGUgY2FzZS4KPgo+IEhvdyBtYW55IG9iamVjdHMgZG9lcyB1c2Vyc3BhY2UgY2hlY2sgaW4gb25l
IGdvIHR5cGljYWxseT8gIE1heWJlIGl0Cj4gbWFrZXMgc2Vuc2UgdG8gYWRkIGFuIGlvY3RsIHdo
aWNoIGNoZWNrcyBhIGxpc3QsIHRvIHJlZHVjZSB0aGUgc3lzdGVtCj4gY2FsbCBvdmVyaGVhZC4K
T25lLiAgVGhlIGNhY2hlIHNvcnRzIEJPcyBieSB0aGUgdGltZSB0aGV5IGFyZSBmcmVlZCwgYW5k
IGNoZWNrcyBvbmx5CnRoZSBmaXJzdCAoY29tcGF0aWJsZSkgQk8uICBJZiBpdCBpcyBpZGxlLCBj
YWNoZSBoaXQuICBPdGhlcndpc2UsCmNhY2hlIG1pc3MuICBBIG5ldyBpb2N0bCBwcm9iYWJseSB3
b24ndCBoZWxwLgoKCj4KPiA+ID4gKyAgICAgICBpZiAoYXJncy0+ZmxhZ3MgJiBWSVJUR1BVX1dB
SVRfTk9XQUlUKSB7Cj4gPiA+ICsgICAgICAgICAgICAgICBvYmogPSBkcm1fZ2VtX29iamVjdF9s
b29rdXAoZmlsZSwgYXJncy0+aGFuZGxlKTsKPiA+IERvbid0IHdlIG5lZWQgYSBOVUxMIGNoZWNr
IGhlcmU/Cj4KPiBZZXMsIHdlIGRvLiAgV2lsbCBmaXguCj4KPiB0aGFua3MsCj4gICBHZXJkCj4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
