Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC865C141
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2019 18:39:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BA56893D5;
	Mon,  1 Jul 2019 16:39:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF2DE893D5
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2019 16:39:21 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id u13so30332186iop.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jul 2019 09:39:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kppcviH+BoC+77/HRSzA2CtnCng6H6sR34sahxlv0iM=;
 b=XKfqvY0XUZlTy7kdkgljY4DBL0TnGpPkx7I5Djj4HRFkjv0+Xaij7bCi3QyJ4vvuSL
 AAr/Ng+7iDtPVXoPVhhPQTogi0zi3WjoqwT8XCZR2cVo7STRkhIHF0sZH7TW5pxPIABx
 P3fZvM9PEvTNdY9gMop0vmUPTtUvaF7EZyK5yUOqstp16L2guJyI/P0xcRuwbS7PiBEM
 LbMe05WDjgajPPMDcCA5KHvKd8daPo0qn9aWuTwFRrtxKQszu7plQSnuOwD50e/wluEt
 D73JbqADD5w6gNnI5TDXSRBx72MeQW/H4hIOjkYQJpNXhJffgtVFFzs2rtzTkQQIiG9X
 tlew==
X-Gm-Message-State: APjAAAWo9Ei3L7NewLshsNWQA9dy0oqVbszsc6QRHAwWODIamgSeShHv
 ubek9v9d15977r7DprIxwz8336x7mns=
X-Google-Smtp-Source: APXvYqzCgZ4v+V3u30qdzcGbFJcinUWHovAxctr3EqCfPxZTJ5w/1mSjmoCXHwEwAB36/QOcZMN04w==
X-Received: by 2002:a05:6602:218b:: with SMTP id
 b11mr2468910iob.264.1561999160804; 
 Mon, 01 Jul 2019 09:39:20 -0700 (PDT)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com.
 [209.85.166.54])
 by smtp.gmail.com with ESMTPSA id o7sm10060812ioo.81.2019.07.01.09.39.19
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Jul 2019 09:39:19 -0700 (PDT)
Received: by mail-io1-f54.google.com with SMTP id n5so30251955ioc.7
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jul 2019 09:39:19 -0700 (PDT)
X-Received: by 2002:a02:6597:: with SMTP id u145mr30862693jab.26.1561999159046; 
 Mon, 01 Jul 2019 09:39:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190401171724.215780-1-dianders@chromium.org>
 <20190401171724.215780-3-dianders@chromium.org>
 <20190630202246.GB15102@ravnborg.org>
 <20190630205514.GA17046@ravnborg.org>
In-Reply-To: <20190630205514.GA17046@ravnborg.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 1 Jul 2019 09:39:06 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WH4kmhQA0kbKcAUx=oOeqTZiQOFCXYpVWwq+mG7Y7ofA@mail.gmail.com>
Message-ID: <CAD=FV=WH4kmhQA0kbKcAUx=oOeqTZiQOFCXYpVWwq+mG7Y7ofA@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] drm/panel: simple: Add ability to override typical
 timing
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=kppcviH+BoC+77/HRSzA2CtnCng6H6sR34sahxlv0iM=;
 b=l8cPKTj8ipi85OjiSdxsurBNgqkamorQzNfjx/xqkapjGRKCzoSEN1wrf0A0alRim5
 pqp047CPO1eIRcvQYOHaZ7kUNhu1N2LjG8SdFidYjiFofK4vUs9GcAZvA63g4wWTZ/CL
 zedE5gR5JSyeesKh8hGIk4cLkNCN36WaOwVAY=
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
Cc: devicetree@vger.kernel.org,
 =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
 David Airlie <airlied@linux.ie>, Jeffy Chen <jeffy.chen@rock-chips.com>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 =?UTF-8?Q?Enric_Balletb=C3=B2?= <enric.balletbo@collabora.com>,
 Sean Paul <seanpaul@chromium.org>, Ezequiel Garcia <ezequiel@collabora.com>,
 Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBTdW4sIEp1biAzMCwgMjAxOSBhdCAxOjU1IFBNIFNhbSBSYXZuYm9yZyA8c2FtQHJh
dm5ib3JnLm9yZz4gd3JvdGU6Cj4KPiBIaSBEb3VnbGFzLgo+Cj4gPiA+ICsKPiA+ID4gKyAgIC8q
IE9ubHkgYWRkIHRpbWluZ3MgaWYgb3ZlcnJpZGUgd2FzIG5vdCB0aGVyZSBvciBmYWlsZWQgdG8g
dmFsaWRhdGUgKi8KPiA+ID4gKyAgIGlmIChudW0gPT0gMCAmJiBwYW5lbC0+ZGVzYy0+bnVtX3Rp
bWluZ3MpCj4gPiA+ICsgICAgICAgICAgIG51bSA9IHBhbmVsX3NpbXBsZV9nZXRfdGltaW5nc19t
b2RlcyhwYW5lbCk7Cj4gPiA+ICsKPiA+ID4gKyAgIC8qCj4gPiA+ICsgICAgKiBPbmx5IGFkZCBm
aXhlZCBtb2RlcyBpZiB0aW1pbmdzL292ZXJyaWRlIGFkZGVkIG5vIG1vZGUuCj4gPgo+ID4gVGhp
cyBwYXJ0IEkgZmFpbCB0byB1bmRlcnN0YW5kLgo+ID4gSWYgd2UgaGF2ZSBhIHBhbmVsIHdoZXJl
IHdlIGluIHBhbmVsLXNpbXBsZSBoYXZlIHNwZWNpZmllZCB0aGUgdGltaW5ncywKPiA+IGFuZCBk
b25lIHNvIHVzaW5nIGRpc3BsYXlfdGltaW5nIHNvIHdpdGggcHJvcGVyIHttaW4sIHR5cCwgbWF4
fSB0aGVuIGl0Cj4gPiBzaG91bGQgYmUgcGVyZmVjdGx5IGxlZ2FsIHRvIHNwZWNpZnkgYSBtb3Jl
IHByZWNpc2UgdmFyaWFudCBpbiB0aGUgRFQKPiA+IGZpbGUuCj4gPiBPciB3aGF0IGRpZCBJIG1p
c3MgaGVyZT8KPgo+IEdvdCBpdCBub3cuCj4gSWYgZGlzcGxheV9tb2RlIGlzIHVzZWQgZm9yIHRp
bWluZ3MgdGhpcyBpcyB3aGF0IHlvdSBjYWxsICJmaXhlZCBtb2RlIi4KPiBIbW0sIGlmIEkgZ290
IGNvbmZ1c2VkIHNvbWVvbmUgZWxzZSBtYXkgYWxzbyBiZSBjb25mdXNlZCBieSB0aGlzIG5hbWlu
Zy4KClRoZSBuYW1lICJmaXhlZCBtb2RlIiBjb21lcyBmcm9tIHRoZSBvbGQgY29kZSwgdGhvdWdo
IEkgZ3Vlc3MgaW4gdGhlCm9sZCBjb2RlIGl0IHVzZWQgdG8gcmVmZXIgdG8gYSBtb2RlIHRoYXQg
Y2FtZSBmcm9tIGVpdGhlciB0aGUKZGlzcGxheV90aW1pbmcgb3IgdGhlIGRpc3BsYXlfbW9kZS4K
CkhvdyBhYm91dCBpZiBJIGNhbGwgaXQgInBhbmVsX3NpbXBsZV9nZXRfZnJvbV9maXhlZF9kaXNw
bGF5X21vZGUiPwouLi5vciBpZiB5b3UgaGF2ZSBhbm90aGVyIHN1Z2dlc3Rpb24gZmVlbCBmcmVl
IHRvIGNoaW1lIGluLgoKTk9URTogU2luY2UgdGhpcyBmZWVkYmFjayBpcyBtaW5vciBhbmQgdGhp
cyBwYXRjaCBoYXMgYmVlbiBvdXRzdGFuZGluZwpmb3IgYSB3aGlsZSAoYW5kIGlzIGJsb2NraW5n
IG90aGVyIHdvcmspLCBJIGFtIGFzc3VtaW5nIHRoYXQgdGhlIGJlc3QKcGF0aCBmb3J3YXJkIGlz
IGZvciBIZWlrbyB0byBsYW5kIHRoaXMgcGF0Y2ggd2l0aCBUaGllcnJ5J3MgQWNrIGFuZApJJ2xs
IHNlbmQgYSBmb2xsb3ctdXAuICBQbGVhc2UgeWVsbCBpZiB5b3UgZGlzYWdyZWUuICBJJ2xsIHJl
c3BvbmQgdG8KZWFjaCBvZiB5b3VyIGVtYWlscyBzZXBhcmF0ZWx5IGFuZCB0aGVuIHdhaXQgZm9y
IHlvdXIgcmVzcG9uc2UgYmVmb3JlCnNlbmRpbmcgdGhlIGZvbGxvdy11cCBzZXJpZXMuCgoKLURv
dWcKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
