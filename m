Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FD352673
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 10:24:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B370891CE;
	Tue, 25 Jun 2019 08:24:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 059758912C
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 08:24:15 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id x25so15354449ljh.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 01:24:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kyNh64vzFXSeI1tkchYjecumEHdzHA1vMGmESae1z+g=;
 b=X2Gy9I5nDyKTD1l4Ae/z1+D+7Q3NdOylq8gRuk2LQy5NUeDvtN+CniykjaZ0j5xdGH
 uvK4Ab/rJ3ReXqj82aqOonHbBcXHMBtheSYde/C+vWdv0e5qbBzYW5TPefXDFYoWS0eZ
 jIIr5BSYnx05xR/RBjb+JRbiLhorN0jWXV8obKW+5niTKkGoleJDo9X3MJ0m1D5XRdcn
 0Zet9HVrfOWhc962RFLX8bO/GePWe3Z06tgzW0t+XN6Kv07firIBPKvGSSaQP01fNg6H
 k0r72La8epbpbvbkCTDYxdoFrtt5DAchr5lXIDaPu529ZBPX7ztGiVlPA7UNZJnGIeDo
 mxdA==
X-Gm-Message-State: APjAAAVk4femikPAA1M8RMKJ+fotPdKBi4mMDqrouM0dW1JG1UKYNpry
 1UaafoGl/q5jN4sUtpfu0e35Wy//h6pC2XTF6+DE8Q==
X-Google-Smtp-Source: APXvYqzMQ1jqy6BTXdm0qPFneYC0Sj4kOm+3+r9eFU23I/xT5CMTJkUNJrOdLfUbxn8VZbDBNcr8J9R8jkuRkzDR24I=
X-Received: by 2002:a2e:2c14:: with SMTP id s20mr15065319ljs.54.1561451054468; 
 Tue, 25 Jun 2019 01:24:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190618115245.13915-1-linus.walleij@linaro.org>
 <20190618123045.GF18776@kadam>
 <CACRpkdaqKzF=WaRiDPi6XmV_=30=A2rigWLSjuFw=PdG=cG4OQ@mail.gmail.com>
 <20190625071354.GW18776@kadam>
In-Reply-To: <20190625071354.GW18776@kadam>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Jun 2019 10:24:03 +0200
Message-ID: <CACRpkdZBsM8wob7bDuVOgG1eE8UUJURURjx4XLKdAtnDnMwmNQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mcde: Fix uninitialized variable
To: Dan Carpenter <dan.carpenter@oracle.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=kyNh64vzFXSeI1tkchYjecumEHdzHA1vMGmESae1z+g=;
 b=IpI4ANDyiicb/utKnOp5TkfTybrppK8AjxMLIU2tQSvFgwuIoy916NAoQTqc1fbX0N
 qvYSJ+kBzSzuLw6DKIlYTWxOtxI3RJ1kT0G07asE4h9bobJiX/yzyyS03NTzo6NFMUl3
 PRN17upKCeHENCK8Ti3jxFGegC2ePIP62qmtlwIYFxadxFpM3FimKg/n/S0+1jRsdjna
 7r4l7RHkXQYSYJTqgTaEgpNuBvrTENX2L7GHATbTzX3ZK7ZCzhcGuvFD9xSuvqyNv5Xh
 jE7eeejg8k4x0ZWsZEgpfKpaQYZtYcgwS72pZXhLYyUEoSLnJtgvjNhgAg5EVSx/CFXx
 ZeTw==
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
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgOToxNCBBTSBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVu
dGVyQG9yYWNsZS5jb20+IHdyb3RlOgo+IE9uIFR1ZSwgSnVuIDI1LCAyMDE5IGF0IDEyOjA5OjU0
QU0gKzAyMDAsIExpbnVzIFdhbGxlaWogd3JvdGU6Cj4gPiBPbiBUdWUsIEp1biAxOCwgMjAxOSBh
dCAyOjMxIFBNIERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4gd3JvdGU6
Cj4gPgo+ID4gPiBUaGFua3MhCj4gPgo+ID4gUmVjb3JkaW5nIHRoaXMgYXMgQWNrZWQtYnk6IHdo
ZW4gYXBwbHlpbmcuCj4gPgo+Cj4gVGhhdCdzIGlzIGFuIGhvbm91ciBmb3IgbWUuICBJIGZpZ3Vy
ZWQgdGhhdCB5b3VyIFNpZ25lZC1vZmYtYnkgZHdhcmZlZAo+IG15IEFjay4gIDpQCgpOb3QgYXQg
YWxsLiBJbiBEUk0gd2UgaGF2ZSBhIHJ1bGUgdG8gbm90IHB1c2ggYW55IGNoYW5nZXMgd2l0aG91
dAphIHByb3BlciBBQ0suCgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
