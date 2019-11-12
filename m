Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E319F923D
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 15:26:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EDF86EB29;
	Tue, 12 Nov 2019 14:26:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 794106EB29
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 14:26:48 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id j7so14934713oib.3
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 06:26:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vOq3Ga6TU7d+OBIVxdc75mj6tT8YQYRdorOOD6OFfXY=;
 b=fm9cQqY1VgaEMcWAvQ5Wqq+gfIJXpRAwRuy0O5JYHnAPMc1VgtmlyAVrYd/jWn+Ehl
 K2/g2OYIVeUkj8xrWmjMgBmn3YKUc21mx1FxmRTgZYRC0njIaqRrHIdv54TelyuT0Jv/
 PYt+NoKFinPUOfrPCBZ6FJITpn8pH6aR0/qdL9DuNt/Iiw/6geJdER1V9h++Xj7JMnnX
 u5NYaGnGztd5kvN/51wdoROisABCvj0KSNlSIkt38bruoeGzog+Bd2+ccvZ7kFDRf3ee
 gidJ6MRg90MY7YrxxvfP5w7ENpj+biTVHYoEOEnoomKz4vjITlSvP5fKEmA3kY1UHq41
 pZIg==
X-Gm-Message-State: APjAAAUHsrGJ09oLQsCqvVzQyKwlatC46Z8CGGk0AWPzHiOhkPgvBeyR
 3xMmK9Iqn/6byfXjCB/88GcDCWf0fV9g7n1TbieYLA==
X-Google-Smtp-Source: APXvYqzxht4Kq/NUweMLOm8iFPqZy+ybMvdqrPmbR2Vb2ZUVHK8mNb/HzPnUuK+o0IXo9qRHecPgclqQzte2uFHRgyY=
X-Received: by 2002:aca:ead7:: with SMTP id i206mr4359423oih.128.1573568807592; 
 Tue, 12 Nov 2019 06:26:47 -0800 (PST)
MIME-Version: 1.0
References: <20191111192258.2234502-1-arnd@arndb.de>
 <20191112105507.GA7122@lst.de>
 <CAKMK7uEEz1n+zuTs29rbPHU74Dspaib=prpMge63L_-rUk_o4A@mail.gmail.com>
 <20191112140631.GA10922@lst.de>
In-Reply-To: <20191112140631.GA10922@lst.de>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 12 Nov 2019 15:26:35 +0100
Message-ID: <CAKMK7uFaA607rOS6x_FWjXQ2+Qdm8dQ1dQ+Oi-9if_Qh_wHWPg@mail.gmail.com>
Subject: Re: [PATCH] video: fbdev: atyfb: only use ioremap_uc() on i386 and
 ia64
To: Christoph Hellwig <hch@lst.de>, Tuowen Zhao <ztuowen@gmail.com>,
 AceLan Kao <acelan.kao@canonical.com>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Roman Gilg <subdiff@gmail.com>, 
 Lee Jones <lee.jones@linaro.org>, "Luis R. Rodriguez" <mcgrof@suse.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=vOq3Ga6TU7d+OBIVxdc75mj6tT8YQYRdorOOD6OFfXY=;
 b=BxRrXJzCCx1hIyEvZSBVA0yZXvf4Od5JT6l96C9dyN0qzywU8gAzJY+k+1FXxp5U8b
 mjqYVSvosbEgInhTINXOvCrJh8KWb8Cq/gr9rEqAPGz2C4d7Q6wn4rqp9tqzAZjAWs82
 j6Ape7bP7RYA6XvgX0LqZl9CF1t26JVGPpTz8=
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
Cc: Fenghua Yu <fenghua.yu@intel.com>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Tony Luck <tony.luck@intel.com>, linux-ia64@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, X86 ML <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Souptick Joarder <jrdr.linux@gmail.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMTIsIDIwMTkgYXQgMzowNiBQTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxz
dC5kZT4gd3JvdGU6Cj4gT24gVHVlLCBOb3YgMTIsIDIwMTkgYXQgMDI6MDQ6MTZQTSArMDEwMCwg
RGFuaWVsIFZldHRlciB3cm90ZToKPiA+IFd1dCAuLi4gTWF5YmUgSSdtIG1pc3Npbmcgc29tZXRo
aW5nLCBidXQgZnJvbSBob3cgd2UgdXNlIG10cnIgaW4gb3RoZXIKPiA+IGdwdSBkcml2ZXJzIGl0
J3MgYSkgZWl0aGVyIHlvdSB1c2UgTVRSUiBiZWNhdXNlIHRoYXQncyBhbGwgeW91IGdvdCBvcgo+
ID4gYikgeW91IHVzZSBwYXQuIE1peGluZyBib3RoIHNvdW5kcyBsaWtlIGEgcHJldHR5IGJhZCBp
ZGVhLCBzaW5jZSBpZgo+ID4geW91IG5lZWQgTVRSUiBmb3IgcGVyZm9ybWFuY2UgKGJlY2F1c2Ug
eW91IGRvbnQgaGF2ZSBQQVQpIHRoZW4geW91Cj4gPiBjYW4ndCBmaXggdGhlIHdjIHdpdGggdGhl
IFBBVC1iYXNlZCBpb3JlbWFwX3VjLiBBbmQgaWYgeW91IGhhdmUgUEFULAo+ID4gdGhlbiB5b3Ug
ZG9uJ3QgcmVhbGx5IG5lZWQgYW4gTVRSUiB0byBnZXQgd2MuCj4gPgo+ID4gU28gSSdkIHJldmVy
dCB0aGlzIHBhdGNoIGZyb20gTHVpcyBhbmQgLi4uCj4KPiBTb3VuZHMgZ3JlYXQgdG8gbWUuLgo+
Cj4gPiAuLi4gYXBwbHkgdGhpcyBvbmUuIFNpbmNlIHRoZSBzYW1lIHJlYXNvbmluZyBzaG91bGQg
YXBwbHkgdG8gYW55dGhpbmcKPiA+IHRoYXQncyBydW5uaW5nIG9uIGFueSBjcHUgd2l0aCBQQVQu
Cj4KPiBDYW4geW91IHRha2UgYSBsb29rIGF0ICJtZmQ6IGludGVsLWxwc3M6IFVzZSBkZXZtX2lv
cmVtYXBfdWMgZm9yIE1NSU8iCj4gaW4gbGludXgtbmV4dCwgd2hpY2ggYWxzbyBsb29rcyByYXRo
ZXIgZmlzaHkgdG8gbWU/ICBDYW4ndCB3ZSB1c2UKPiB0aGUgTVRSUiBBUElzIHRvIG92ZXJyaWRl
IHRoZSBicm9rZW4gQklPUyBNVFJSIHNldHVwIHRoZXJlIGFzIHdlbGw/CgpIbSBzbyB0aGF0J3Mg
d2F5IG91dCBvZiBteSBrbm93bGVkZ2UsIGJ1dCBJIHRoaW5rIG10cnJfY2xlYW51cCgpIHdhcwpz
dXBwb3NlZCB0byBmaXggdXAgbWVzc3kvYnJva2VuIE1UUlIgc2V0dXBzIGJ5IHRoZSBiaW9zLiBT
byBtYXliZSB0aGV5CnNpbXBseSBkaWRuJ3QgZW5hYmxlIHRoYXQgaW4gdGhlaXIgLmNvbmZpZyB3
aXRoIENPTkZJR19NVFJSX1NBTklUSVpFUi4KCkFuIGV4cGxpY2l0IGNsZWFudXAgaXMgY3VycmVu
dGx5IG5vdCBwb3NzaWJsZSBmb3IgZHJpdmVycywgc2luY2UgdGhlCm9ubHkgaW50ZXJmYWNlIGV4
cG9ydGVkIHRvIGRyaXZlcnMgaXMgYXJjaF9waHlzX3djX2FkZC9kZWwgKHdoaWNoCnNob3J0LWNp
cmN1aXRzIGlmIHBhdCB3b3JrcyBzaW5jZSB5b3UgZG9uJ3QgbmVlZCBtdHJyIGluIHRoYXQgY2Fz
ZSkuCkFkZGluZyBldmVyeW9uZSBmcm9tIHRoYXQgY29tbWl0LCBwbHVzIEx1aXMuIERyaXZlcnMg
cmVhbGx5IHNob3VsZG4ndAphc3N1bWUvd29yayBhcm91bmQgdGhlIGJpb3Mgc2V0dGluZyB1cCBz
dXBlcmZsb3VzL3dyb25nIE1UUlIuCgo+IFdpdGggdGhhdCB3ZSBjb3VsZCBraWxsIGlvcmVtYXBf
dWMgZW50aXJlbHkuCgpTbyB5ZWFoIHJlbW92aW5nIHRoYXQgc2VlbXMgZGVmaW5pdGVseSBsaWtl
IHRoZSByaWdodCB0aGluZy4KLURhbmllbAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdp
bmVlciwgSW50ZWwgQ29ycG9yYXRpb24KKzQxICgwKSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxv
Zy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
