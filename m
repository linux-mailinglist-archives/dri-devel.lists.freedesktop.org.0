Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BFC4336A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:28:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1658589337;
	Thu, 13 Jun 2019 07:28:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6CBD89617
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 16:38:08 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id t76so12165905oih.4
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 09:38:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l3c5d5wFxnJqFhOlXZZH+vKbuhkaAhV6LdoIlw0rjOA=;
 b=XkDBUYZxdn6AN6TDHFJWTGrFFdjaAeiKO36+jqxrgiLAO3lKX/LR3A/Hje1pbVWyYE
 YEhojUwp+QOvbd+H5dLjJP4f6nfBtTjOYLniwMPdKVOeARRAISsFvYNWK33PLY0Bpw2n
 JO+BM6Wz9rcO29I3OD1MacPtn6ZcBh1wOym4REpR81W7ZQfTI+Og5UEW7ey73r03dmm7
 pIf6cC7DUFvJMWw/xqwGHcSA34GsjdgFxUFseN81GNyTRVB76pvTNoufkYE7F8UR2ziV
 Or6e1g3dMp2VX31s9De4/5ClBOkXsCRez/qfznYZ2PKc1syITFbkHn7si1Eo6X5SBem6
 hLAA==
X-Gm-Message-State: APjAAAVSTR5HbnbSjMakkocCs7Y2yBEoo92+FXrqEEvyaeY+uAxIx5Nu
 RtzR45aE7F2z1u3aRPWwlholOBblaH9vUAIlt4I=
X-Google-Smtp-Source: APXvYqykzEz3nz5y+Q6Yxo10To2csFuZER4pd6GKNH22q2yX0pdc1I7UzDBW05yRHRLRz8ipWwEnDEfF5byULZbk0Jk=
X-Received: by 2002:aca:cf0f:: with SMTP id f15mr40859oig.169.1560357488087;
 Wed, 12 Jun 2019 09:38:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190611110052.iw6qbw2yvypxus6t@shell.armlinux.org.uk>
 <E1haeXI-0001y0-S5@rmk-PC.armlinux.org.uk>
 <CAGngYiWT5xsVgP4R=LPozpxFwdoCtpGSn76fwWEDiNXtYzBA9g@mail.gmail.com>
 <20190612162812.ovy6wu3fmck5mmp4@shell.armlinux.org.uk>
In-Reply-To: <20190612162812.ovy6wu3fmck5mmp4@shell.armlinux.org.uk>
From: Sven Van Asbroeck <thesven73@gmail.com>
Date: Wed, 12 Jun 2019 12:37:57 -0400
Message-ID: <CAGngYiWiKUknxkMxyoKVDHk07EiPGdxVaOiXfTd3ieDow3roAA@mail.gmail.com>
Subject: Re: [PATCH 04/13] drm/i2c: tda998x: derive CTS_N value from aclk
 sample rate ratio
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
X-Mailman-Approved-At: Thu, 13 Jun 2019 07:27:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=l3c5d5wFxnJqFhOlXZZH+vKbuhkaAhV6LdoIlw0rjOA=;
 b=DiEAHYRCygx7TYXhNzOFXuansGI0cMoyyq3EmlzxCL9X93Fv3marN1PrM406UkboKr
 RNvUUZzxJE8XxxfX2cOjN+n1HkJzKBAm5tUQVuGxICV7+SioVXuPEUUsMrqlMRHbRM2/
 ktR3Q2CvFmP46xRZIKq3VCJWf8CpiXrXznQlLyu4JlEKy6L8XC3WPPtp6GcIgPo3KNfI
 6iHy6vpufbSvR2gXtLLtoR9nUEr0PYzeeRh5a+xjNgcCkM15rJ7+k4R2pZy93ZKkDGwl
 5ux3H8Av9p/ld/D9JVl8+S8aRzWG1uoBtf2PPbbe+Vp4VZIUBz1N/dp1HseT6jEJHMAu
 l7ZQ==
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Mark Brown <broonie@kernel.org>,
 Jyri Sarha <jsarha@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTIsIDIwMTkgYXQgMTI6MjggUE0gUnVzc2VsbCBLaW5nIC0gQVJNIExpbnV4
IGFkbWluCjxsaW51eEBhcm1saW51eC5vcmcudWs+IHdyb3RlOgo+Cj4gVGhlIHBsYXRmb3JtIGRh
dGEgcGF0aCBoYXMgbmV2ZXIgc3VwcG9ydGVkIHRoZSBIRE1JIGNvZGVjIHdheSBvZiBkb2luZwo+
IHRoaW5ncywgc28gdGhhdCByZWFsbHkgaXNuJ3QgYSBjb25jZXJuIGhlcmUuICBUaGUgcGxhdGZv
cm0gZGF0YSB3YXkKPiB3YXMgc3VmZmljaWVudCB0byBhbGxvdyBTUERJRiBzdHJlYW1zIHRvIHdv
cmsgd2l0aCBhIHN0YXRpYyBzZXR1cCBvZgo+IHRoZSBUREE5OTh4LCBhbmQgaGFzIG5ldmVyIGJl
ZW4gaW50ZW5kZWQgdG8gc3VwcG9ydCBhbnl0aGluZyBiZXlvbmQKPiB0aGF0LgoKVGhhbmsgeW91
LCBJIGFtIG5vdCB1c2luZyB0aGUgcGxhdGZvcm0gZGF0YSBwYXRoLCBzbyBJIGhhZCBubyBpZGVh
LgoKV291bGRuJ3QgdGhlIGN1cnJlbnQgY29kZSBhbHdheXMgZmFpbCBvbiB0aGUgcGxhdGZvcm0g
ZGF0YSBwYXRoIHRob3VnaD8KCmNyZWF0ZSgpIGNhbGxzIHRkYTk5OHhfc2V0X2NvbmZpZygpIGlu
IHRoZSBwbGF0Zm9ybSBkYXRhIGNhc2UuCklmIHRoZSBhdWRpb19wYXJhbXMuZm9ybWF0IGlzIHVz
ZWQgKGkuZS4gdGhlIHBsYXRmb3JtIGRhdGEgY29uZmlndXJlcwphdWRpbyksIHRoZSBmdW5jdGlv
biB0aGVuIHJldHVybnMgdGhlIHJldHVybiB2YWx1ZSBvZiB0ZGE5OTh4X2Rlcml2ZV9jdHNfbigp
LAp3aGljaCBpcyBhIHBvc2l0aXZlIGRpdmlkZXIgKGNhbiBiZSAwIGlmIC8xKS4KClRoZW4gaW4g
Y3JlYXRlKCk6IGlmIChyZXQpIGdvdG8gZmFpbDsKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
