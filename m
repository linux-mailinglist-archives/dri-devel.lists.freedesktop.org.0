Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 542C1ADC44
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2019 17:41:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C5F289C28;
	Mon,  9 Sep 2019 15:41:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D6A389C28
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2019 15:41:46 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 23A4221A4A
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2019 15:41:46 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id c9so16657306qth.9
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Sep 2019 08:41:46 -0700 (PDT)
X-Gm-Message-State: APjAAAUyf4X16Q0cKKreUvavk71fibVAOSNBbPIa1TaDjVRR1HtPJNPa
 3LigNUXjj+dU/PAU1LncIeWddavv0fGrmYRHJw==
X-Google-Smtp-Source: APXvYqz141Z8J3amoWSNvEnWBMcRo8P2gwc1042x2UJzSiJd8NyLDaEMcfylKvyhtyaKCZweTwgZC/eZ9i/0FZ1Xa0s=
X-Received: by 2002:ac8:4a05:: with SMTP id x5mr12045321qtq.110.1568043705274; 
 Mon, 09 Sep 2019 08:41:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190904123032.23263-1-broonie@kernel.org>
 <ccd81530-2dbd-3c02-ca0a-1085b00663b5@arm.com>
In-Reply-To: <ccd81530-2dbd-3c02-ca0a-1085b00663b5@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 9 Sep 2019 16:41:32 +0100
X-Gmail-Original-Message-ID: <CAL_JsqKWEe=+X5AYRJ-_8peTzfrOrRBfFWgk8c6h3TN6f0ZHtA@mail.gmail.com>
Message-ID: <CAL_JsqKWEe=+X5AYRJ-_8peTzfrOrRBfFWgk8c6h3TN6f0ZHtA@mail.gmail.com>
Subject: Re: [PATCH] drm/panfrost: Fix regulator_get_optional() misuse
To: Steven Price <steven.price@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1568043706;
 bh=fM4JbSVJbGXAjoftVI6cCaz2ZaDS1dmEdNr69EQNLl4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=QHv+pIF0WkKCXPobKnhnm+m3bLWKtzErPwv9PJb/Q9LP2fL+MarhCoXM/uwRzAUgE
 zD+eK2DD1rxsaNWmHnvUfoa5cFmfJWNWBmNP1TCG6ZGdM/k7ePwCma0B3v0gMbRo3c
 IiRiUAseAivRcmSGGSDHZgXCSbLvGJdZVJ35g0d0=
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
 dri-devel <dri-devel@lists.freedesktop.org>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgNiwgMjAxOSBhdCA0OjIzIFBNIFN0ZXZlbiBQcmljZSA8c3RldmVuLnByaWNl
QGFybS5jb20+IHdyb3RlOgo+Cj4gT24gMDQvMDkvMjAxOSAxMzozMCwgTWFyayBCcm93biB3cm90
ZToKPiA+IFRoZSBwYW5mcm9zdCBkcml2ZXIgcmVxdWVzdHMgYSBzdXBwbHkgdXNpbmcgcmVndWxh
dG9yX2dldF9vcHRpb25hbCgpCj4gPiBidXQgYm90aCB0aGUgbmFtZSBvZiB0aGUgc3VwcGx5IGFu
ZCB0aGUgdXNhZ2UgcGF0dGVybiBzdWdnZXN0IHRoYXQgaXQgaXMKPiA+IGJlaW5nIHVzZWQgZm9y
IHRoZSBtYWluIHBvd2VyIGZvciB0aGUgZGV2aWNlIGFuZCBpcyBub3QgYXQgYWxsIG9wdGlvbmFs
Cj4gPiBmb3IgdGhlIGRldmljZSBmb3IgZnVuY3Rpb24sIHRoZXJlIGlzIG5vIG1lYW5pbmdmdWwg
aGFuZGxpbmcgZm9yIGFic2VudAo+ID4gc3VwcGxpZXMuICBTdWNoIHJlZ3VsYXRvcnMgc2hvdWxk
IHVzZSB0aGUgdmFuaWxsYSByZWd1bGF0b3JfZ2V0KCkKPiA+IGludGVyZmFjZSwgaXQgd2lsbCBl
bnN1cmUgdGhhdCBldmVuIGlmIGEgc3VwcGx5IGlzIG5vdCBkZXNjcmliZWQgaW4gdGhlCj4gPiBz
eXN0ZW0gaW50ZWdyYXRpb24gb25lIHdpbGwgYmUgcHJvdmlkZWQgaW4gc29mdHdhcmUuCj4gPgo+
ID4gU2lnbmVkLW9mZi1ieTogTWFyayBCcm93biA8YnJvb25pZUBrZXJuZWwub3JnPgo+Cj4gVGVz
dGVkLWJ5OiBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmljZUBhcm0uY29tPgo+Cj4gTG9va3MgbGlr
ZSBteSBhcHByb2FjaCB0byB0aGlzIHdhcyB3cm9uZyAtIHNvIHdlIHNob3VsZCBhbHNvIHJldmVy
dCB0aGUKPiBjaGFuZ2VzIEkgbWFkZSBwcmV2aW91c2x5Lgo+Cj4gLS0tLTg8LS0tLQo+IEZyb20g
ZmUyMGY4YWJjZGU4NDQ0YmI0MWE4ZjcyZmIzNWRlOTQzYTI3ZWM1YyBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKPiBGcm9tOiBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmljZUBhcm0uY29tPgo+IERh
dGU6IEZyaSwgNiBTZXAgMjAxOSAxNToyMDo1MyArMDEwMAo+IFN1YmplY3Q6IFtQQVRDSF0gZHJt
L3BhbmZyb3N0OiBSZXZlcnQgY2hhbmdlcyB0byBjb3BlIHdpdGggTlVMTCByZWd1bGF0b3IKPgo+
IEhhbmRsaW5nIGEgTlVMTCByZXR1cm4gZnJvbSBkZXZtX3JlZ3VsYXRvcl9nZXRfb3B0aW9uYWwo
KSBkb2Vzbid0IHNlZW0KPiBsaWtlIHRoZSBjb3JyZWN0IHdheSBvZiBoYW5kbGluZyB0aGlzLiBJ
bnN0ZWFkIHJldmVydCB0aGUgY2hhbmdlcyBpbgo+IGZhdm91ciBvZiBzd2l0Y2hpbmcgdG8gdXNp
bmcgZGV2bV9yZWd1bGF0b3JfZ2V0KCkgd2hpY2ggd2lsbCByZXR1cm4gYQo+IGR1bW15IHJlZ3Vs
YXRvciBpbnN0ZWFkLgo+Cj4gUmV2ZXJ0cyBjb21taXQgNTIyODIxNjNkZmE2ICgiZHJtL3BhbmZy
b3N0OiBBZGQgbWlzc2luZyBjaGVjayBmb3IgcGZkZXYtPnJlZ3VsYXRvciIpCj4gUmV2ZXJ0cyBj
b21taXQgZTIxZGQyOTA4ODFiICgiZHJtL3BhbmZyb3N0OiBFbmFibGUgZGV2ZnJlcSB0byB3b3Jr
IHdpdGhvdXQgcmVndWxhdG9yIikKCkRvZXMgYSBzdHJhaWdodCByZXZlcnQgb2YgdGhlc2UgMiBw
YXRjaGVzIG5vdCB3b3JrPyBJZiBpdCBkb2VzIHdvcmssCmNhbiB5b3UgZG8gdGhhdCBhbmQgc2Vu
ZCB0byB0aGUgbGlzdC4gSSBkb24ndCB3YW50IG15IGhhbmQgc2xhcHBlZAphZ2FpbiByZXZlcnRp
bmcgdGhpbmdzLgoKUm9iCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
