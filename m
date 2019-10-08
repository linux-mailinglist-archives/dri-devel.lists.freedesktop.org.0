Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B39CF60D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 11:31:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B472C6E2B0;
	Tue,  8 Oct 2019 09:31:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFC5E6E2B0
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 09:31:49 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id b9so18576978wrs.0
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Oct 2019 02:31:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=EazPgAo0KA2L5bP4whOU0gOC5nZeJshj93xKT7W2t+s=;
 b=klhmNufJY9+b2BWYNNy1aOsumASjYHDypG9K7/EgPm634W3wEc3WBL28Sfl+5E/LPe
 uAYYtkMFx/J4g0su00t9ew0CSLL4/bZjKihqcl5qC8xB+cGGbqSWcNpaQvFLHaU3Kc73
 +liY+4To9Akrpv+wkKfy2wDrRW+hd/Xp7srWCRy+lhuh4+NI35hpLIq7mKVhJMDdjH3H
 XsdtKZE3ECjmh8sgZUrcbXZD2RiRPoon1P5zctxe4s2qgFlxSANy3m47Wb4dXkexitrB
 hXhKzHE8YB2LahzyGUYHPIM57Cl849f87HGEXWpgfp2lZEQt2Wg0YaCvb3kxFuOEgLlF
 6Ngw==
X-Gm-Message-State: APjAAAUmYRdateCFexlPM8LDvUZALnqmvmWd6bWTIh3+k4zMDFxEp86Q
 Ef5Dn1ogbuWdPGca1Xbn4vrtMw==
X-Google-Smtp-Source: APXvYqwB7AB3D9uRJhoIYfpbGU3+i/oZ+UjAk1ESfaX46FXfeAEMx/zSwkXAZlDmwRpq//zo58NovA==
X-Received: by 2002:adf:e3c8:: with SMTP id k8mr14526118wrm.268.1570527108416; 
 Tue, 08 Oct 2019 02:31:48 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id i11sm7291389wrw.57.2019.10.08.02.31.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 02:31:47 -0700 (PDT)
Date: Tue, 8 Oct 2019 10:31:45 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH 3/5] backlight: pwm_bl: drop use of int_pow()
Message-ID: <20191008093145.kgx6ytkbycmmkist@holly.lan>
References: <20190919140620.32407-1-linux@rasmusvillemoes.dk>
 <20190919140620.32407-3-linux@rasmusvillemoes.dk>
 <20191007152800.3nhbf7h7knumriz4@holly.lan>
 <5f19e307-29c4-f077-568d-b2bd6ae74608@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5f19e307-29c4-f077-568d-b2bd6ae74608@rasmusvillemoes.dk>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=EazPgAo0KA2L5bP4whOU0gOC5nZeJshj93xKT7W2t+s=;
 b=LvRJZ6xdJUrFyuFeAodhiVrfTO3DINKsAGx5CCndd95qCzlD3/66+r3BM6b4TVrhk8
 Qcgcu2flQ2+Umci8gVj+SNBnKTRagow1zCD7w+Nc1xtPRN+0+xMTp+adeKR92rYh5Y8P
 ZL9bIDvNsNdzq3OwbVBOY+1I/eF0YDPhfTzMPpOFZ9rtQrdHk86cgQLIN0q44I0qa2yG
 9+WhoLIspFeot/bC/hvdfCot1SYQi0S+uCAJe2t9uzGAPIC0waYd+AnylUcFUXwyWG7w
 6h/9fe1CFTmkV24gQe0sTW8D8A8y3Cutm0sZgtDX6ywbw6oa6vDO4xmLo0+HvVKuYwL2
 hKDw==
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMDcsIDIwMTkgYXQgMDg6NDM6MzFQTSArMDIwMCwgUmFzbXVzIFZpbGxlbW9l
cyB3cm90ZToKPiBPbiAwNy8xMC8yMDE5IDE3LjI4LCBEYW5pZWwgVGhvbXBzb24gd3JvdGU6Cj4g
PiBPbiBUaHUsIFNlcCAxOSwgMjAxOSBhdCAwNDowNjoxOFBNICswMjAwLCBSYXNtdXMgVmlsbGVt
b2VzIHdyb3RlOgo+ID4gCj4gPiBJdCBmZWVscyBsaWtlIHRoZXJlIGlzIHNvbWUgcmF0aW9uYWxl
IG1pc3NpbmcgaW4gdGhlIGRlc2NyaXB0aW9uIGhlcmUuCj4gPiAKPiA+IFdoYXQgaXMgdGhlIGJl
bmVmaXQgb2YgcmVwbGFjaW5nIHRoZSBleHBsaWNpdCBpbnRfcG93KCkgd2l0aCB0aGUKPiA+IGlt
cGxpY2l0IG11bHRpcGxpY2F0aW9ucz8KPiA+IAo+ID4gCj4gPiBEYW5pZWwuCj4gPiAKPiA+IAo+
ID4+Cj4gPj4gV2UgY291bGQgKGFuZCBhIGZvbGxvd2luZyBwYXRjaCB3aWxsKSBjaGFuZ2UgdG8g
dXNlIGEgcG93ZXItb2YtMiBzY2FsZSwKPiA+PiBidXQgZm9yIGEgZml4ZWQgc21hbGwgZXhwb25l
bnQgb2YgMywgdGhlcmUncyBubyBhZHZhbnRhZ2UgaW4gdXNpbmcKPiA+PiByZXBlYXRlZCBzcXVh
cmluZy4KPiAKPiAgICBeXl5eXl5eXl5eXl5eXl5eXl4gICAgICAgICAgICAgICAgICAgXl5eXl5e
Xl5eXl5eXl5eXl5eXl5eXl5eXl5eXgo+IAo+IEFwYXJ0IGZyb20gdGhlIGZ1bmN0aW9uIGNhbGwg
b3ZlcmhlYWQgKGFuZCByZXN1bHRpbmcgcmVnaXN0ZXIgcHJlc3N1cmUKPiBldGMuKSwgdXNpbmcg
aW50X3BvdyBpcyBsZXNzIGVmZmljaWVudCAoZm9yIGFuIGV4cG9uZW50IG9mIDMsIGl0IGVuZHMg
dXAKPiBkb2luZyBmb3VyIDY0eDY0IG11bHRpcGxpY2F0aW9ucyBpbnN0ZWFkIG9mIGp1c3QgdHdv
KS4gQnV0IGZlZWwgZnJlZSB0bwo+IGRyb3AgaXQsIEknbSBub3QgZ29pbmcgdG8gcHVyc3VlIGl0
IGZ1cnRoZXIgLSBpdCBqdXN0IHNlZW1lZCBsaWtlIGEKPiBzZW5zaWJsZSB0aGluZyB0byBkbyB3
aGlsZSBJIHdhcyBvcHRpbWl6aW5nIHRoZSBjb2RlIGFueXdheS4KPiAKPiBbQXQgdGhlIHRpbWUg
SSB3cm90ZSB0aGUgcGF0Y2gsIHRoaXMgd2FzIGFsc28gdGhlIG9ubHkgdXNlciBvZiBpbnRfcG93
Cj4gaW4gdGhlIHRyZWUsIHNvIGl0IGFsc28gYWxsb3dlZCByZW1vdmluZyBpbnRfcG93IGFsdG9n
ZXRoZXIuXQoKVG8gYmUgaG9uZXN0IHRoZSBjaGFuZ2UgaXMgZmluZSBidXQgdGhlIHBhdGNoIGRl
c2NyaXB0aW9uIGRvZXNuJ3QgbWFrZQpzZW5zZSBpZiB0aGUgb25seSBjdXJyZW50IHB1cnBvc2Ug
b2YgdGhlIHBhdGNoIGlzIGFzIGEgb3B0aW1pemF0aW9uLgoKCkRhbmllbC4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
