Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B3FC25DE
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 19:52:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BA386E4AF;
	Mon, 30 Sep 2019 17:52:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B335C6E4AF
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 17:52:48 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 75F84224EE
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 17:52:48 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id f16so8574440qkl.9
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 10:52:48 -0700 (PDT)
X-Gm-Message-State: APjAAAVs3lzLwmp38fo3Y1MPx04sgxJSChGXzmRPEabrvfkmipSFQvl6
 qBeor36B+xL/dZW/1IxgGhmAzDJGFvtcqPf4/g==
X-Google-Smtp-Source: APXvYqwSgFXNXIifS2TCwJyfW8UXbcMfsRC7IuB9Q/oOn9llMQFx1aqDBr5NmWeVhwufGbKzICqmqGALjAhfiaM6IFY=
X-Received: by 2002:a37:682:: with SMTP id 124mr1316439qkg.393.1569865967571; 
 Mon, 30 Sep 2019 10:52:47 -0700 (PDT)
MIME-Version: 1.0
References: <88dc6386929b3dcd7a65ba8063628c62b66b330c.1569856049.git.robin.murphy@arm.com>
 <1e499f85220b735849126171e64ebdd1da0302ce.1569856049.git.robin.murphy@arm.com>
 <167ec566-1936-8a05-83fc-74d20d9fb8bc@arm.com>
In-Reply-To: <167ec566-1936-8a05-83fc-74d20d9fb8bc@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 30 Sep 2019 12:52:36 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+GnSVTEPaLfwcWiAbbTwJFM=NzJB1WnS-D3SfW4xzCSw@mail.gmail.com>
Message-ID: <CAL_Jsq+GnSVTEPaLfwcWiAbbTwJFM=NzJB1WnS-D3SfW4xzCSw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/panfrost: Use coherent pagetable walk on Juno
To: Steven Price <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569865968;
 bh=VISkbcq9PrIKw4uSwLgeOR8cIOEhbkOGT8DrF2vMfH8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=JZZYJ+3TehBv+dThkEnIA1tz/i+GwCWs/S9WWNbVt37mA4zcDMDWmbtZe0ayNdo2I
 uGJpVKBMAhusGQP8qAbF5yYiCCsnmC4osuresTxr5w9aXFGaA803X9pKKr+raAWXN6
 zmnAO6zWpv2I74AQdnXukcn21aTmcb76TgRNUsqU=
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
Cc: devicetree@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sudeep Holla <sudeep.holla@arm.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMzAsIDIwMTkgYXQgMTE6MjYgQU0gU3RldmVuIFByaWNlIDxzdGV2ZW4ucHJp
Y2VAYXJtLmNvbT4gd3JvdGU6Cj4KPiBPbiAzMC8wOS8yMDE5IDE2OjI0LCBSb2JpbiBNdXJwaHkg
d3JvdGU6Cj4gPiBBbHRob3VnaCBnb2luZyBmdWxsICJkbWEtY29oZXJlbnQiIGVuZHMgYmFkbHkg
ZHVlIHRvIEdFTSBvYmplY3RzIHN0aWxsCj4gPiBiZWluZyBmb3JjaWJseSBtYXBwZWQgbm9uLWNh
Y2hlYWJsZSwgd2UgY2FuIGF0IGxlYXN0IHRha2UgYWR2YW50YWdlIG9mCj4gPiBKdW5vJ3MgQUNF
LWxpdGUgaW50ZWdyYXRpb24gdG8gc2tpcCBjYWNoZSBtYWludGVuYW5jZSBmb3IgcGFnZXRhYmxl
cy4KPiA+Cj4gPiBDQzogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KPiA+IENDOiBUb21l
dSBWaXpvc28gPHRvbWV1LnZpem9zb0Bjb2xsYWJvcmEuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTog
Um9iaW4gTXVycGh5IDxyb2Jpbi5tdXJwaHlAYXJtLmNvbT4KPiA+IC0tLQo+ID4KPiA+IFRoaXMg
aXNuJ3QgcmVhbGx5IG1lYW50IGFzIGEgc2VyaWVzLCBJJ20ganVzdCBzZW5kaW5nIGl0IHRvZ2V0
aGVyCj4gPiB3aXRoIHBhdGNoICMxIGZvciBjb250ZXh0Lgo+ID4KPiA+ICBkcml2ZXJzL2dwdS9k
cm0vcGFuZnJvc3QvcGFuZnJvc3RfbW11LmMgfCAzICsrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmZy
b3N0L3BhbmZyb3N0X21tdS5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X21t
dS5jCj4gPiBpbmRleCBiZGQ5OTA1Njg0NzYuLjU2MDQzOWY2MzI3NyAxMDA2NDQKPiA+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9tbXUuYwo+ID4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X21tdS5jCj4gPiBAQCAtMzY1LDYgKzM2NSw5IEBA
IGludCBwYW5mcm9zdF9tbXVfcGd0YWJsZV9hbGxvYyhzdHJ1Y3QgcGFuZnJvc3RfZmlsZV9wcml2
ICpwcml2KQo+ID4gICAgICAgICAgICAgICAuaW9tbXVfZGV2ICAgICAgPSBwZmRldi0+ZGV2LAo+
ID4gICAgICAgfTsKPiA+Cj4gPiArICAgICBpZiAob2ZfZGV2aWNlX2lzX2NvbXBhdGlibGUocGZk
ZXYtPmRldi0+b2Zfbm9kZSwgImFybSxqdW5vLW1hbGkiKSkKPiA+ICsgICAgICAgICAgICAgcGZk
ZXYtPm1tdS0+cGd0YmxfY2ZnLmNvaGVyZW50X3dhbGsgPSB0cnVlOwo+Cj4gU2hvdWxkIGJlOgo+
ICAgICAgICAgbW11LT5wZ3RibF9jZmcuY29oZXJlbnRfd2FsayA9IHRydWU7CgpJT1csIGJhc2Ug
dGhpcyBvbiA1LjQgb3IgZHJtLW1pc2MtbmV4dC4KCj4gQWxzbyBJJ20gbm90IHN1cmUgd2hldGhl
ciB3ZSBzaG91bGQgZG8gdGhpcyBiYXNlZCBvbiBhIGNvbXBhdGlibGUKPiBzdHJpbmcuIGtiYXNl
IGhhcyBhICJzeXN0ZW0tY29oZXJlbmN5IiBkZXZpY2UtdHJlZSBmbGFnIGZvciBpdC4gSW4KPiB0
aGVvcnkgd2UgY291bGQgZW5kIHVwIHdpdGggYSBsb25nIGxpc3Qgb2YgY29tcGF0aWJsZXMgaGVy
ZS4uLgoKV2h5IG5vdCB1c2UgJ2RtYS1jb2hlcmVudCcgd2hpY2ggeW91IHNldD8gSWYgbm90LCBJ
J20gY29uZnVzZWQgYXMgdG8Kd2hhdCAnZG1hLWNvaGVyZW50JyBpcyBzdXBwb3NlZCB0byBtZWFu
LiBJcyBpdCBwb3NzaWJsZSBmb3IgcGFnZSB0YWJsZQp3YWxrcyB0byBoYXZlIGRpZmZlcmVudCBj
b2hlcmVuY3kgdGhhbiB0aGUgcmVzdCBvZiB0aGUgYWNjZXNzZXM/CgpSb2IKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
