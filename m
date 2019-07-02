Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 565115CC6F
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2019 11:11:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD94189A14;
	Tue,  2 Jul 2019 09:11:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C383389A14
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2019 09:11:18 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id c6so119978wml.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2019 02:11:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YL/v7kwpoAOgfrWESvYJW+oEOt7FvpXlkjkTWAE20U0=;
 b=XXSerdOmxa26XII8m6QeicgRjiW4oOTk5lqtlFp/UoEUwp65wMBHkHpvU9dWgUuezq
 fJahbbBh8b67CtK+lkY3+IQaOxC4yIt9cNbBHw8VgQl77W71AeI2MRptq333951Sb/WZ
 dzbrPCtuFtKYTk2Mii5aC4gfimjDPzLJBevWMcY9cVXC/6AfYImgyfa+t5rpxK4EkINH
 NH4aD76DZhNP3knFcX5vZ2j6fgMgCrJYzrtY/eT1jz2voopxL3M6lN4bP9QcveMHrvlh
 FiqdVD7h8V87j2qOdxIAlYe0dN/L9jCn7K924D2TVKwqRud9CX9gtsWe8QJwkPEMUY7q
 uQ/g==
X-Gm-Message-State: APjAAAWuzcVWwAo3ZlEZ6miNRVJxbFgAZCosYZDi1oHHMHEv1QvrNf7u
 xHy/pJ8IWp80MsPvwbUfbP3jaA==
X-Google-Smtp-Source: APXvYqyixyro0WIMqI0C7CGaQ2nlzq7IOMfvK1UOk36VvkyNl9VTipL9Hb/JJxMLaV9Nrsw90+v0Yg==
X-Received: by 2002:a7b:cd84:: with SMTP id y4mr779871wmj.79.1562058677297;
 Tue, 02 Jul 2019 02:11:17 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.googlemail.com with ESMTPSA id t15sm12269862wrx.84.2019.07.02.02.11.16
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Jul 2019 02:11:16 -0700 (PDT)
Subject: Re: [PATCH 03/12] backlight: gpio: pull the non-pdata device probing
 code into probe()
To: Bartosz Golaszewski <brgl@bgdev.pl>, Sekhar Nori <nsekhar@ti.com>,
 Kevin Hilman <khilman@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Lechner <david@lechnology.com>,
 Linus Walleij <linus.walleij@linaro.org>
References: <20190625163434.13620-1-brgl@bgdev.pl>
 <20190625163434.13620-4-brgl@bgdev.pl>
From: Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <920a5359-d662-5111-8b3d-4f5c63b2afb6@linaro.org>
Date: Tue, 2 Jul 2019 10:11:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190625163434.13620-4-brgl@bgdev.pl>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YL/v7kwpoAOgfrWESvYJW+oEOt7FvpXlkjkTWAE20U0=;
 b=g8XO7GiaR9I/8MSq8vNOC8n9Zjdf9iwOmT25kQ4xcSoHEFAaUVXiioDJpXSFEGM/FX
 QiRHrnXy4C3eZbMS/HKHHHjfTNbwQKYvjDzOAeoK37i9GxcyCUnr7oP3jMf/093uPLP2
 gIexxaR99d8BsZFHxFMms0ILgNIgHYtwtUJD9vCPbgRPpY1aIQTsTiokf3xlDM3IT+Hf
 hr0Bq9xF4PbuQR81x6ZodSzm+rS6cI/6wQH1K7/J9qs9v06RUDnqh0t/3VINH2ZWbg50
 DVfRErAm0zplGE9wp8ZiAFxl11rqLvItVbBQWxNu3NOE0Qfq4H/BPMrUo0RpkwlRjL45
 XhqQ==
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
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjUvMDYvMjAxOSAxNzozNCwgQmFydG9zeiBHb2xhc3pld3NraSB3cm90ZToKPiBGcm9tOiBC
YXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29sYXN6ZXdza2lAYmF5bGlicmUuY29tPgo+IAo+IFRoZXJl
J3Mgbm8gZ29vZCByZWFzb24gdG8gaGF2ZSB0aGUgZ2VuZXJpYyBwcm9iaW5nIGNvZGUgaW4gYSBz
ZXBhcmF0ZQo+IHJvdXRpbmUuIFRoaXMgZnVuY3Rpb24gaXMgc2hvcnQgYW5kIGlzIGlubGluZWQg
YnkgdGhlIGNvbXBpbGVyIGFueXdheS4KPiBNb3ZlIGl0IGludG8gcHJvYmUgdW5kZXIgdGhlIHBk
YXRhLXNwZWNpZmljIHBhcnQuCj4gCj4gU2lnbmVkLW9mZi1ieTogQmFydG9zeiBHb2xhc3pld3Nr
aSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KCkxpa2UgdGhlIG90aGVycywgdGhpcyB3aWxs
IG5lZWQgdG8gYmUgcmVzcHVuIHRvIG1hdGNoIGxhdGVzdCBjb2RlIGJ1dCAKd2hlbiBpdCBjb21l
cyByb3VuZCBhZ2FpbjoKQWNrZWQtYnk6IERhbmllbCBUaG9tcHNvbiA8ZGFuaWVsLnRob21wc29u
QGxpbmFyby5vcmc+CgoKRGFuaWVsLgoKCj4gLS0tCj4gICBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdo
dC9ncGlvX2JhY2tsaWdodC5jIHwgMzkgKysrKysrKystLS0tLS0tLS0tLS0tLS0tCj4gICAxIGZp
bGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMjYgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMgYi9kcml2ZXJz
L3ZpZGVvL2JhY2tsaWdodC9ncGlvX2JhY2tsaWdodC5jCj4gaW5kZXggOGFkYmM4ZDc1MDk3Li44
OWUxMGJjY2ZkM2MgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19i
YWNrbGlnaHQuYwo+ICsrKyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0
LmMKPiBAQCAtNTQsMzAgKzU0LDYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBiYWNrbGlnaHRfb3Bz
IGdwaW9fYmFja2xpZ2h0X29wcyA9IHsKPiAgIAkuY2hlY2tfZmIJPSBncGlvX2JhY2tsaWdodF9j
aGVja19mYiwKPiAgIH07Cj4gICAKPiAtc3RhdGljIGludCBncGlvX2JhY2tsaWdodF9wcm9iZV9w
cm9wKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYsCj4gLQkJCQkgICAgIHN0cnVjdCBncGlv
X2JhY2tsaWdodCAqZ2JsKQo+IC17Cj4gLQlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2
Owo+IC0JZW51bSBncGlvZF9mbGFncyBmbGFnczsKPiAtCWludCByZXQ7Cj4gLQo+IC0JZ2JsLT5k
ZWZfdmFsdWUgPSBkZXZpY2VfcHJvcGVydHlfcmVhZF9ib29sKGRldiwgImRlZmF1bHQtb24iKTsK
PiAtCWZsYWdzID0gZ2JsLT5kZWZfdmFsdWUgPyBHUElPRF9PVVRfSElHSCA6IEdQSU9EX09VVF9M
T1c7Cj4gLQo+IC0JZ2JsLT5ncGlvZCA9IGRldm1fZ3Bpb2RfZ2V0KGRldiwgTlVMTCwgZmxhZ3Mp
Owo+IC0JaWYgKElTX0VSUihnYmwtPmdwaW9kKSkgewo+IC0JCXJldCA9IFBUUl9FUlIoZ2JsLT5n
cGlvZCk7Cj4gLQo+IC0JCWlmIChyZXQgIT0gLUVQUk9CRV9ERUZFUikgewo+IC0JCQlkZXZfZXJy
KGRldiwKPiAtCQkJCSJFcnJvcjogVGhlIGdwaW9zIHBhcmFtZXRlciBpcyBtaXNzaW5nIG9yIGlu
dmFsaWQuXG4iKTsKPiAtCQl9Cj4gLQkJcmV0dXJuIHJldDsKPiAtCX0KPiAtCj4gLQlyZXR1cm4g
MDsKPiAtfQo+IC0KPiAgIHN0YXRpYyBpbnQgZ3Bpb19iYWNrbGlnaHRfcHJvYmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikKPiAgIHsKPiAgIAlzdHJ1Y3QgZ3Bpb19iYWNrbGlnaHRfcGxh
dGZvcm1fZGF0YSAqcGRhdGEgPQo+IEBAIC04Niw2ICs2Miw3IEBAIHN0YXRpYyBpbnQgZ3Bpb19i
YWNrbGlnaHRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgIAlzdHJ1Y3Qg
ZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2Owo+ICAgCXN0cnVjdCBiYWNrbGlnaHRfZGV2aWNlICpi
bDsKPiAgIAlzdHJ1Y3QgZ3Bpb19iYWNrbGlnaHQgKmdibDsKPiArCWVudW0gZ3Bpb2RfZmxhZ3Mg
ZmxhZ3M7Cj4gICAJaW50IHJldDsKPiAgIAo+ICAgCWdibCA9IGRldm1fa3phbGxvYyhkZXYsIHNp
emVvZigqZ2JsKSwgR0ZQX0tFUk5FTCk7Cj4gQEAgLTExNiw5ICs5MywxOSBAQCBzdGF0aWMgaW50
IGdwaW9fYmFja2xpZ2h0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gICAJ
CWlmICghZ2JsLT5ncGlvZCkKPiAgIAkJCXJldHVybiAtRUlOVkFMOwo+ICAgCX0gZWxzZSB7Cj4g
LQkJcmV0ID0gZ3Bpb19iYWNrbGlnaHRfcHJvYmVfcHJvcChwZGV2LCBnYmwpOwo+IC0JCWlmIChy
ZXQpCj4gKwkJZ2JsLT5kZWZfdmFsdWUgPSBkZXZpY2VfcHJvcGVydHlfcmVhZF9ib29sKGRldiwg
ImRlZmF1bHQtb24iKTsKPiArCQlmbGFncyA9IGdibC0+ZGVmX3ZhbHVlID8gR1BJT0RfT1VUX0hJ
R0ggOiBHUElPRF9PVVRfTE9XOwo+ICsKPiArCQlnYmwtPmdwaW9kID0gZGV2bV9ncGlvZF9nZXQo
ZGV2LCBOVUxMLCBmbGFncyk7Cj4gKwkJaWYgKElTX0VSUihnYmwtPmdwaW9kKSkgewo+ICsJCQly
ZXQgPSBQVFJfRVJSKGdibC0+Z3Bpb2QpOwo+ICsKPiArCQkJaWYgKHJldCAhPSAtRVBST0JFX0RF
RkVSKSB7Cj4gKwkJCQlkZXZfZXJyKGRldiwKPiArCQkJCQkiRXJyb3I6IFRoZSBncGlvcyBwYXJh
bWV0ZXIgaXMgbWlzc2luZyBvciBpbnZhbGlkLlxuIik7Cj4gKwkJCX0KPiAgIAkJCXJldHVybiBy
ZXQ7Cj4gKwkJfQo+ICAgCX0KPiAgIAo+ICAgCW1lbXNldCgmcHJvcHMsIDAsIHNpemVvZihwcm9w
cykpOwo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
