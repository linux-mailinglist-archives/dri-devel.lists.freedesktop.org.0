Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B61F3EFABB
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 11:17:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8D2A6E9AD;
	Tue,  5 Nov 2019 10:17:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 425826E9AD
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 10:17:48 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id z26so7008327wmi.4
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Nov 2019 02:17:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fNwu5Brajivr2NZ+53CyrBT2A5quV+LusyMm1pW2iI4=;
 b=X9CrI+ZOg27C2/Fab3aG+MUKzdOiveJhVmUFaJhNTuvwjtzdDrcolukn1pr487rlcc
 lf/1VBQkqTAAIHFTb2Y84XZL2LyJmEmz8MjKHiCfGvq4S5rvD0l/o3E17SqBRNOj7Tt5
 S1ZtTIQO9u03Ma3YPU17AJtrgyGPmZPsqvyVzOFpEH8kU3eevinVwWW728fkbX4kj3Mz
 Dib7E/ji5jJhxmDndFt/FJ1TA1R1HzxkU5NyASJ8lfWMsJWWHfd3Y6sUDTrWOieQ/nHl
 lO+V2ivBLz4gapOk66EgtKNXQrr0av5KFxm73I9gemhhM9N3eZjv/C1Gvy6HR8ReYOGJ
 6Ldg==
X-Gm-Message-State: APjAAAVjkZHwTXIGqwEr/wLjdl8z8mZzUtVQBnvoZzbrdFuXQqJR0xa+
 9vchJtIS3/O5+dOPzz78doYMHA==
X-Google-Smtp-Source: APXvYqwco7NI1yNgZpp2/qpqSq4V+HjXy7jIUynHKwu8FbE4cdXYH516yi26h8p96gVT/T4eKt2BBg==
X-Received: by 2002:a7b:c5c9:: with SMTP id n9mr3623783wmk.94.1572949066778;
 Tue, 05 Nov 2019 02:17:46 -0800 (PST)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id d2sm25272593wmd.2.2019.11.05.02.17.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2019 02:17:46 -0800 (PST)
Date: Tue, 5 Nov 2019 10:17:44 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 38/46] video: backlight: tosa: use gpio lookup table
Message-ID: <20191105101744.kzdpopq25slbfuue@holly.lan>
References: <20191018154052.1276506-1-arnd@arndb.de>
 <20191018154201.1276638-38-arnd@arndb.de>
 <CACRpkdajkSh6Bbvpfycm83j1GuCm+pTfw9fQS53JEfG2i07MKg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdajkSh6Bbvpfycm83j1GuCm+pTfw9fQS53JEfG2i07MKg@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=fNwu5Brajivr2NZ+53CyrBT2A5quV+LusyMm1pW2iI4=;
 b=Svr0IOsnkV9uVg/wKUTFvPy0qCkSTYOZs+R3aU79Dp+7ujp/ZXBprGDTPc0rLHfI7s
 VXryGU7kIKqHDwe5tREK11WYlbZq4eWm3Kc2rtO7mC+OpAWnx4dlQKjg6NEfCRyLa5ea
 bLew8FfugD4c6fjaiQY+vFWl9Z1poGasldw4clK9AQEJxMgQ4KxSTmV5PKOdZYCmwfPV
 9i1t3A/3UK5mO6Trk1Skr6MyslHPEnuzjTWerWmFz20fGmbsaoe1u5HC2DI4sPp8xukM
 yfMq8tdIjgrLh0cCpwnPQRm+X9bEDFydYxFRKXammO4Kq3Kw0D6cJhX5XpaNlE4VInNV
 itfg==
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Lee Jones <lee.jones@linaro.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Jingoo Han <jingoohan1@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Daniel Mack <daniel@zonque.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMDUsIDIwMTkgYXQgMTE6MDQ6NDRBTSArMDEwMCwgTGludXMgV2FsbGVpaiB3
cm90ZToKPiBPbiBGcmksIE9jdCAxOCwgMjAxOSBhdCA1OjQzIFBNIEFybmQgQmVyZ21hbm4gPGFy
bmRAYXJuZGIuZGU+IHdyb3RlOgo+IAo+ID4gVGhlIGRyaXZlciBzaG91bGQgbm90IHJlcXVpcmUg
YSBtYWNoaW5lIHNwZWNpZmljIGhlYWRlci4gQ2hhbmdlCj4gPiBpdCB0byBwYXNzIHRoZSBncGlv
IGxpbmUgdGhyb3VnaCBhIGxvb2t1cCB0YWJsZSwgYW5kIG1vdmUgdGhlCj4gPiB0aW1pbmcgZ2Vu
ZXJhdG9yIGRlZmluaXRpb25zIGludG8gdGhlIGRyaXZlcnMgaXRzZWxmLgo+ID4KPiA+IENjOiBM
ZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgo+ID4gQ2M6IERhbmllbCBUaG9tcHNvbiA8
ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+Cj4gPiBDYzogSmluZ29vIEhhbiA8amluZ29vaGFu
MUBnbWFpbC5jb20+Cj4gPiBDYzogQmFydGxvbWllaiBab2xuaWVya2lld2ljeiA8Yi56b2xuaWVy
a2llQHNhbXN1bmcuY29tPgo+ID4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
PiA+IENjOiBsaW51eC1mYmRldkB2Z2VyLmtlcm5lbC5vcmcKPiA+IFNpZ25lZC1vZmYtYnk6IEFy
bmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4gPgo+ID4gLS0tCj4gPiBJJ20gbm90IG92ZXJs
eSBjb25maWRlbnQgdGhhdCBJIGdvdCB0aGUgY29ycmVjdCBkZXZpY2UgbmFtZXMKPiA+IGZvciB0
aGUgbG9va3VwIHRhYmxlLCBpdCB3b3VsZCBiZSBnb29kIGlmIHNvbWVvbmUgY291bGQKPiA+IGRv
dWJsZS1jaGVjay4KPiAKPiBZb3UncmUgYW55d2F5IGRvaW5nIG1vcmUgdGhhbiByZXF1aXJlZCBm
b3IgdGhlIHBlb3BsZSB3aG8KPiBtYXkgb3IgbWF5IG5vdCBiZSB1c2luZyB0aGlzIHBsYXRmb3Jt
LiBCcm9rZW5uZXNzIGNhbiBzdXJlbHkKPiBiZSBmaXhlZCBsYXRlciwgaXQncyBub3QgbGlrZSB3
ZSBhcmUgdGFraW5nIGRvd24gdGhlIGVudGlyZSBBbWF6b24KPiBjbG91ZCBvciBzb21ldGhpbmcu
Cj4gCj4gUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9y
Zz4KClNhbWUgaGVyZS4gSSByZWFkLCBJIGRpZCd0IHNlZSBhbnl0aGluZyB3cm9uZyBidXQgSSBj
YW4ndCB0ZXN0LgoKUmV2aWV3ZWQtYnk6IERhbmllbCBUaG9tcHNvbiA8ZGFuaWVsLnRob21wc29u
QGxpbmFyby5vcmc+CgoKRGFuaWVsLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
