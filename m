Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 261E54E831
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 14:41:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1E556E8B0;
	Fri, 21 Jun 2019 12:41:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D8A66E8B0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 12:41:48 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id v14so6454343wrr.4
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 05:41:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UyII8E/E3mshPHrIMsqTxjJtV2uC2oH9mjOQblUJ9/o=;
 b=AMzvf9nezCM1KIuzxejMOiaPiDhEQp52eV52eKSoMhKkGhfQ8YSFPSDO3aB97wnf2y
 gh1dI9UwtUOo2qbcBUR+h3gxrso408q8x80MVxBRrR3GQfOp+c16YhtXyo3izmgVtJd8
 Ux35f/qnyeg8UO8NCOzUgIFmmJREN1SZgZEoJSdSQ4sapEnbpBmLg86vKfRwTGwH8Nz1
 TniB9VRp/bhpZRNLEaunpG3FG1/FTdqVfDI2gR4+ApB7OLMD4MEsraqVhfH5D8TWEpui
 X739J7c9yucT37ZWsNxzpNNf8SEh+2f6rkwoE/o2EcARsEYbqL5qn5jhM5qtNQ3Yq/gW
 4NeQ==
X-Gm-Message-State: APjAAAVh53hkHWSE3XNm8+osay4W58tbQVm2e+bZ2SR8FD4+kyh1LJNI
 f7K+hP1frZkHgAkmyys9WK1Ppg==
X-Google-Smtp-Source: APXvYqx7sEWjAoCocqkTEAccH5DTaTuYTnicvzBiGr/LTPl3+FpUS7jIbDEbXYD+xr2QoDp98s9PmQ==
X-Received: by 2002:a5d:4708:: with SMTP id y8mr1982160wrq.85.1561120907035;
 Fri, 21 Jun 2019 05:41:47 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.googlemail.com with ESMTPSA id o20sm6964907wrh.8.2019.06.21.05.41.45
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 21 Jun 2019 05:41:46 -0700 (PDT)
Subject: Re: [PATCH] backlight: pwm_bl: Set pin to sleep state when powered
 down
To: Paul Cercueil <paul@crapouillou.net>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
References: <20190522163428.7078-1-paul@crapouillou.net>
From: Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <5b0f8bb3-e7b0-52c1-1f2f-9709992b76fc@linaro.org>
Date: Fri, 21 Jun 2019 13:41:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190522163428.7078-1-paul@crapouillou.net>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UyII8E/E3mshPHrIMsqTxjJtV2uC2oH9mjOQblUJ9/o=;
 b=JrgRZGiBTmjujp1DAceFMwZAzGMDtr8E0Ek2p5PEfVsS473YGQb4eZz/hSfRCUa4PT
 PCL/0VmmsvC3bwMDGBcwLtoEV3CsVenV3I9cy9JAgXOfRedFJHPzAJH14pTHhhmRhJuH
 zSIgviNgNjnQ3q+QyY+x7yM/+irnqrLXG54A9xvJR793m0llXVeuC9hc/QtscAlcp2uC
 qjQ2GkqaHziMVeJ3Ci94+48IV1FaLhgc0tWBdIIHeAoHYeSifPU45Fuu/dX1MKphi8Jp
 jHCcbZrHc4m9hYCz01MRC6bnnKjkjoypabgBcEunqnOnVoFRUlq3mS6ZA+911H28wTVE
 WBAA==
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org, od@zcrc.me,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjIvMDUvMjAxOSAxNzozNCwgUGF1bCBDZXJjdWVpbCB3cm90ZToKPiBXaGVuIHRoZSBkcml2
ZXIgcHJvYmVzLCB0aGUgUFdNIHBpbiBpcyBhdXRvbWF0aWNhbGx5IGNvbmZpZ3VyZWQgdG8gaXRz
Cj4gZGVmYXVsdCBzdGF0ZSwgd2hpY2ggc2hvdWxkIGJlIHRoZSAicHdtIiBmdW5jdGlvbi4KCkF0
IHdoaWNoIHBvaW50IGluIHRoZSBwcm9iZS4uLiBhbmQgYnkgd2hvPwoKPiBIb3dldmVyLCBhdCB0
aGlzCj4gcG9pbnQgd2UgZG9uJ3Qga25vdyB0aGUgYWN0dWFsIGxldmVsIG9mIHRoZSBwaW4sIHdo
aWNoIG1heSBiZSBhY3RpdmUgb3IKPiBpbmFjdGl2ZS4gQXMgYSByZXN1bHQsIGlmIHRoZSBkcml2
ZXIgcHJvYmVzIHdpdGhvdXQgZW5hYmxpbmcgdGhlCj4gYmFja2xpZ2h0LCB0aGUgUFdNIHBpbiBt
aWdodCBiZSBhY3RpdmUsIGFuZCB0aGUgYmFja2xpZ2h0IHdvdWxkIGJlCj4gbGl0IHdheSBiZWZv
cmUgYmVpbmcgb2ZmaWNpYWxseSBlbmFibGVkLgo+IAo+IFRvIHdvcmsgYXJvdW5kIHRoaXMsIGlm
IHRoZSBwcm9iZSBmdW5jdGlvbiBkb2Vzbid0IGVuYWJsZSB0aGUgYmFja2xpZ2h0LAo+IHRoZSBw
aW4gaXMgc2V0IHRvIGl0cyBzbGVlcCBzdGF0ZSBpbnN0ZWFkIG9mIHRoZSBkZWZhdWx0IG9uZSwg
dW50aWwgdGhlCj4gYmFja2xpZ2h0IGlzIGVuYWJsZWQuIFdoZW5rIHRoZSBiYWNrbGlnaHQgaXMg
ZGlzYWJsZWQsIHRoZSBwaW4gaXMgcmVzZXQKPiB0byBpdHMgc2xlZXAgc3RhdGUuCkRvZXNuJ3Qg
dGhpcyB3b3JrYXJvdW5kIHJlc3VsdCBpbiBhIGJhY2tsaWdodCBmbGFzaCBiZXR3ZWVuIHdoYXRl
dmVyIAplbmFibGVzIGl0IGFuZCB0aGUgbmV3IGNvZGUgdHVybmluZyBpdCBvZmYgYWdhaW4/Cgo+
IAo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PiA+
IC0tLQo+ICAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcHdtX2JsLmMgfCA5ICsrKysrKysrKwo+
ICAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3ZpZGVvL2JhY2tsaWdodC9wd21fYmwuYyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3B3
bV9ibC5jCj4gaW5kZXggZmI0NWY4NjZiOTIzLi40MjJmNzkwM2IzODIgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcHdtX2JsLmMKPiArKysgYi9kcml2ZXJzL3ZpZGVvL2Jh
Y2tsaWdodC9wd21fYmwuYwo+IEBAIC0xNiw2ICsxNiw3IEBACj4gICAjaW5jbHVkZSA8bGludXgv
bW9kdWxlLmg+Cj4gICAjaW5jbHVkZSA8bGludXgva2VybmVsLmg+Cj4gICAjaW5jbHVkZSA8bGlu
dXgvaW5pdC5oPgo+ICsjaW5jbHVkZSA8bGludXgvcGluY3RybC9jb25zdW1lci5oPgo+ICAgI2lu
Y2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgo+ICAgI2luY2x1ZGUgPGxpbnV4L2ZiLmg+
Cj4gICAjaW5jbHVkZSA8bGludXgvYmFja2xpZ2h0Lmg+Cj4gQEAgLTUwLDYgKzUxLDggQEAgc3Rh
dGljIHZvaWQgcHdtX2JhY2tsaWdodF9wb3dlcl9vbihzdHJ1Y3QgcHdtX2JsX2RhdGEgKnBiKQo+
ICAgCXN0cnVjdCBwd21fc3RhdGUgc3RhdGU7Cj4gICAJaW50IGVycjsKPiAgIAo+ICsJcGluY3Ry
bF9wbV9zZWxlY3RfZGVmYXVsdF9zdGF0ZShwYi0+ZGV2KTsKPiArCj4gICAJcHdtX2dldF9zdGF0
ZShwYi0+cHdtLCAmc3RhdGUpOwo+ICAgCWlmIChwYi0+ZW5hYmxlZCkKPiAgIAkJcmV0dXJuOwo+
IEBAIC05MCw2ICs5Myw4IEBAIHN0YXRpYyB2b2lkIHB3bV9iYWNrbGlnaHRfcG93ZXJfb2ZmKHN0
cnVjdCBwd21fYmxfZGF0YSAqcGIpCj4gICAKPiAgIAlyZWd1bGF0b3JfZGlzYWJsZShwYi0+cG93
ZXJfc3VwcGx5KTsKPiAgIAlwYi0+ZW5hYmxlZCA9IGZhbHNlOwo+ICsKPiArCXBpbmN0cmxfcG1f
c2VsZWN0X3NsZWVwX3N0YXRlKHBiLT5kZXYpOwo+ICAgfQo+ICAgCj4gICBzdGF0aWMgaW50IGNv
bXB1dGVfZHV0eV9jeWNsZShzdHJ1Y3QgcHdtX2JsX2RhdGEgKnBiLCBpbnQgYnJpZ2h0bmVzcykK
PiBAQCAtNjI2LDYgKzYzMSwxMCBAQCBzdGF0aWMgaW50IHB3bV9iYWNrbGlnaHRfcHJvYmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgIAliYWNrbGlnaHRfdXBkYXRlX3N0YXR1cyhi
bCk7Cj4gICAKPiAgIAlwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBibCk7Cj4gKwo+ICsJaWYg
KGJsLT5wcm9wcy5wb3dlciA9PSBGQl9CTEFOS19QT1dFUkRPV04pCj4gKwkJcGluY3RybF9wbV9z
ZWxlY3Rfc2xlZXBfc3RhdGUoJnBkZXYtPmRldik7CgpEaWRuJ3QgYmFja2xpZ2h0X3VwZGF0ZV9z
dGF0dXMoYmwpIGFscmVhZHkgZG8gdGhpcz8KCgpEYW5pZWwuCgoKPiArCj4gICAJcmV0dXJuIDA7
Cj4gICAKPiAgIGVycl9hbGxvYzoKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
