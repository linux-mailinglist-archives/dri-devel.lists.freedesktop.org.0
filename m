Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D34AB6D2
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 13:10:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6514A6E1D3;
	Fri,  6 Sep 2019 11:10:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53FF06E1D3
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2019 11:10:53 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1998A206BB
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2019 11:10:53 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id a13so6597682qtj.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Sep 2019 04:10:53 -0700 (PDT)
X-Gm-Message-State: APjAAAUpQQqNW1A+TRKDkOQD5yFyCpzuZtJkaGMtuKpkplF8j9TaG0gb
 zeBVojPbH2/BiJRm33yFSmHmOA/Q/pQIc/3s+A==
X-Google-Smtp-Source: APXvYqwxtJ2nxLsP9EuH4mMTLaDZPmidxeZD/Ez80LDFh4lXToL9ygmYpFYBKD1c0/Epcj8dt9cSUuE4W77RloAjVnY=
X-Received: by 2002:a0c:f70c:: with SMTP id w12mr4284929qvn.200.1567768252224; 
 Fri, 06 Sep 2019 04:10:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190905121141.42820-1-steven.price@arm.com>
In-Reply-To: <20190905121141.42820-1-steven.price@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 6 Sep 2019 12:10:41 +0100
X-Gmail-Original-Message-ID: <CAL_JsqKyKUBOK7+fSpr+ShjUz72oXC91ySOKCST9WyWjd0nqww@mail.gmail.com>
Message-ID: <CAL_JsqKyKUBOK7+fSpr+ShjUz72oXC91ySOKCST9WyWjd0nqww@mail.gmail.com>
Subject: Re: [PATCH] drm/panfrost: Prevent race when handling page fault
To: Steven Price <steven.price@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1567768253;
 bh=8J7vhVPmmaH9VUTrqUcBmnghWw79eGkl8RkGxlSWzfo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=2tH17ab0r7UVbqybsCAzXSFz8s8fx7N0RDZLd3K3qEf2t1BWCGA/kbbgRnRvE2I0R
 CsWBkREnQKOV+3gBw5jsQUirVldIY5NrEkrZsOv2D9bJo7AMBBw5dl0x4aG7tHd5F4
 hUPkkn/5KWLiZrnEQsQNjA+iXd1wJTbzI67l+YmE=
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgNSwgMjAxOSBhdCAxOjExIFBNIFN0ZXZlbiBQcmljZSA8c3RldmVuLnByaWNl
QGFybS5jb20+IHdyb3RlOgo+Cj4gV2hlbiBoYW5kbGluZyBhIEdQVSBwYWdlIGZhdWx0IGFkZHJf
dG9fZHJtX21tX25vZGUoKSBpcyB1c2VkIHRvCj4gdHJhbnNsYXRlIHRoZSBHUFUgYWRkcmVzcyB0
byBhIGJ1ZmZlciBvYmplY3QuIEhvd2V2ZXIgaXQgaXMgcG9zc2libGUgZm9yCj4gdGhlIGJ1ZmZl
ciBvYmplY3QgdG8gYmUgZnJlZWQgYWZ0ZXIgdGhlIGZ1bmN0aW9uIGhhcyByZXR1cm5lZCByZXN1
bHRpbmcKPiBpbiBhIHVzZS1hZnRlci1mcmVlIG9mIHRoZSBCTy4KPgo+IENoYW5nZSBhZGRyX3Rv
X2RybV9tbV9ub2RlIHRvIHJldHVybiB0aGUgcGFuZnJvc3RfZ2VtX29iamVjdCB3aXRoIGFuCj4g
ZXh0cmEgcmVmZXJlbmNlIG9uIGl0LCBwcmV2ZW50aW5nIHRoZSBCTyBmcm9tIGJlaW5nIGZyZWVk
IHVudGlsIGFmdGVyCj4gdGhlIHBhZ2UgZmF1bHQgaGFzIGJlZW4gaGFuZGxlZC4KPgo+IFNpZ25l
ZC1vZmYtYnk6IFN0ZXZlbiBQcmljZSA8c3RldmVuLnByaWNlQGFybS5jb20+Cj4gLS0tCj4KPiBJ
J3ZlIG1hbmFnZWQgdG8gdHJpZ2dlciB0aGlzLCBnZW5lcmF0aW5nIHRoZSBmb2xsb3dpbmcgc3Rh
Y2sgdHJhY2UuCgpIdW1tLCB0aGUgYXNzdW1wdGlvbiB3YXMgdGhhdCBhIGZhdWx0IGNvdWxkIG9u
bHkgaGFwcGVuIGR1cmluZyBhIGpvYgphbmQgc28gYSByZWZlcmVuY2Ugd291bGQgYWxyZWFkeSBi
ZSBoZWxkLiBPdGhlcndpc2UsIGNvdWxkbid0IHRoZSBHUFUKYWxzbyBiZSBhY2Nlc3NpbmcgdGhl
IEJPIGFmdGVyIGl0IGlzIGZyZWVkPwoKQWxzbywgbG9va2luZyBhdCB0aGlzIGFnYWluLCBJIHRo
aW5rIHdlIG5lZWQgdG8gaG9sZCB0aGUgbW1fbG9jawphcm91bmQgdGhlIGRybV9tbV9mb3JfZWFj
aF9ub2RlKCkuCgpSb2IKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
