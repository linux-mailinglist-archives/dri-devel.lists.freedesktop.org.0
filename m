Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A10E65CC57
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2019 11:05:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3A66899E9;
	Tue,  2 Jul 2019 09:05:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47E3B899E9
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2019 09:05:44 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id c2so16849485wrm.8
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2019 02:05:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dGGbbVrqx3epkvQ7DyUVG6YDxBKrBKIRNUqt51MsijM=;
 b=nsSWvWGoAyC94S/NA97xg+hvTQGDeHvHvc73QE92Cn30wOS63egXi689MBvQ96MqBI
 A1lM2Gi5H16ymZa2o2HyeaOu2L4hQbA7FZj8DXUPWTGEkTdLVF1irLPTHZxt/4IRFtbg
 XUMgOQkpCeYiKgTVV/3vEBosqOvGv4FFyo+8CbWYDm6o3sP0rKlkgt747jQGusmFO4re
 ArCA36oaCkHAv6eTInPIVO5Kp6PDCq9FGP9OsLtybyvbAERif3lf4dc1Ei+3eE2iYSeU
 uMmra7u8atxN58Yr+b4FEOiedb5AYwDrEMGzGnpKFa0U1P1cZLqva7MtBxwVVEf3FLYW
 dupw==
X-Gm-Message-State: APjAAAUdL3F1kUN/KgwNSaMy6Z2HNkEHjWAhmz4NMgL9bN8DKGAKYySx
 mrVkGGUVuuGxhbbKmDqVsZqlCQ==
X-Google-Smtp-Source: APXvYqyBUFgKUMPUQ1VT+uu50twL4iJvolYnaYIt4CMSKd/z9qxaRpeKXoSJKscs/7Q4ud6bG1ycrA==
X-Received: by 2002:a5d:618d:: with SMTP id j13mr22383402wru.195.1562058342873; 
 Tue, 02 Jul 2019 02:05:42 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.googlemail.com with ESMTPSA id u6sm2334585wml.9.2019.07.02.02.05.41
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Jul 2019 02:05:42 -0700 (PDT)
Subject: Re: [PATCH 02/12] backlight: gpio: use a helper variable for
 &pdev->dev
To: Bartosz Golaszewski <brgl@bgdev.pl>, Sekhar Nori <nsekhar@ti.com>,
 Kevin Hilman <khilman@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Lechner <david@lechnology.com>,
 Linus Walleij <linus.walleij@linaro.org>
References: <20190625163434.13620-1-brgl@bgdev.pl>
 <20190625163434.13620-3-brgl@bgdev.pl>
From: Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <ada53c47-c768-8390-928a-caf7cb72bcac@linaro.org>
Date: Tue, 2 Jul 2019 10:05:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190625163434.13620-3-brgl@bgdev.pl>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dGGbbVrqx3epkvQ7DyUVG6YDxBKrBKIRNUqt51MsijM=;
 b=wqvvFWgtmzbFxo8VIz+VxphSEkiKA5bEkqsSJbk4N9X6ToqP0Ug0T390wJ64sQNiSo
 0dpDPjUpSc4dprK2hO+WKHjiVjvMnqJRTwJAKJ3pYIQBTCVP4fwcnojimRI6/XX58fK1
 Zc/qyltOkfvRJdr7J9Ryjhfp1jccErLoyG6BY4djPD09BuaQMtJf2IjrxLSpyIi2ZR/E
 zFRrP032ysoweK5yydg5EfUMDUdCedbRQIlRBSZ4XFl4PjBhZIL8hUD54x073ZkjN3bv
 pptW0BFA1tZ9vGiIjVpOkl2MPRu/sV3gyYd8y+I81DB9m4RBX5JsYt2PXUULcovGkcGJ
 jyYQ==
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
YXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29sYXN6ZXdza2lAYmF5bGlicmUuY29tPgo+IAo+IEluc3Rl
YWQgb2YgZGVyZWZlcmVuY2luZyBwZGV2IGVhY2ggdGltZSwgdXNlIGEgaGVscGVyIHZhcmlhYmxl
IGZvcgo+IHRoZSBhc3NvY2lhdGVkIGRldmljZSBwb2ludGVyLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJnb2xhc3pld3NraUBiYXlsaWJyZS5jb20+CgpObyBvYmpl
Y3Rpb25zIGJ1dCBJIHRoaW5rIHRoaXMgd2lsbCBuZWVkIHRvIGJlIHJlc3B1biBhZ2FpbnN0IApi
YWNrbGlnaHQtbmV4dCAob3IgdjUuMykuCgo+IC0tLQo+ICAgZHJpdmVycy92aWRlby9iYWNrbGln
aHQvZ3Bpb19iYWNrbGlnaHQuYyB8IDE0ICsrKysrKystLS0tLS0tCj4gICAxIGZpbGUgY2hhbmdl
ZCwgNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3ZpZGVvL2JhY2tsaWdodC9ncGlvX2JhY2tsaWdodC5jIGIvZHJpdmVycy92aWRlby9iYWNr
bGlnaHQvZ3Bpb19iYWNrbGlnaHQuYwo+IGluZGV4IDY1NGMxOWQzYTgxZC4uOGFkYmM4ZDc1MDk3
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMK
PiArKysgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9ncGlvX2JhY2tsaWdodC5jCj4gQEAgLTgz
LDE1ICs4MywxNiBAQCBzdGF0aWMgaW50IGdwaW9fYmFja2xpZ2h0X3Byb2JlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpCj4gICAJc3RydWN0IGdwaW9fYmFja2xpZ2h0X3BsYXRmb3JtX2Rh
dGEgKnBkYXRhID0KPiAgIAkJZGV2X2dldF9wbGF0ZGF0YSgmcGRldi0+ZGV2KTsKCldoeSBsZWF2
ZSB0aGlzIG9uZSBvdXQ/CgoKRGFuaWVsLgoKCj4gICAJc3RydWN0IGJhY2tsaWdodF9wcm9wZXJ0
aWVzIHByb3BzOwo+ICsJc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsKPiAgIAlzdHJ1
Y3QgYmFja2xpZ2h0X2RldmljZSAqYmw7Cj4gICAJc3RydWN0IGdwaW9fYmFja2xpZ2h0ICpnYmw7
Cj4gICAJaW50IHJldDsKPiAgIAo+IC0JZ2JsID0gZGV2bV9remFsbG9jKCZwZGV2LT5kZXYsIHNp
emVvZigqZ2JsKSwgR0ZQX0tFUk5FTCk7Cj4gKwlnYmwgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXpl
b2YoKmdibCksIEdGUF9LRVJORUwpOwo+ICAgCWlmIChnYmwgPT0gTlVMTCkKPiAgIAkJcmV0dXJu
IC1FTk9NRU07Cj4gICAKPiAtCWdibC0+ZGV2ID0gJnBkZXYtPmRldjsKPiArCWdibC0+ZGV2ID0g
ZGV2Owo+ICAgCj4gICAJaWYgKHBkYXRhKSB7Cj4gICAJCS8qCj4gQEAgLTEwOCw3ICsxMDksNyBA
QCBzdGF0aWMgaW50IGdwaW9fYmFja2xpZ2h0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpCj4gICAJCXJldCA9IGRldm1fZ3Bpb19yZXF1ZXN0X29uZShnYmwtPmRldiwgcGRhdGEt
PmdwaW8sIGZsYWdzLAo+ICAgCQkJCQkgICAgcGRhdGEgPyBwZGF0YS0+bmFtZSA6ICJiYWNrbGln
aHQiKTsKPiAgIAkJaWYgKHJldCA8IDApIHsKPiAtCQkJZGV2X2VycigmcGRldi0+ZGV2LCAidW5h
YmxlIHRvIHJlcXVlc3QgR1BJT1xuIik7Cj4gKwkJCWRldl9lcnIoZGV2LCAidW5hYmxlIHRvIHJl
cXVlc3QgR1BJT1xuIik7Cj4gICAJCQlyZXR1cm4gcmV0Owo+ICAgCQl9Cj4gICAJCWdibC0+Z3Bp
b2QgPSBncGlvX3RvX2Rlc2MocGRhdGEtPmdwaW8pOwo+IEBAIC0xMjMsMTEgKzEyNCwxMCBAQCBz
dGF0aWMgaW50IGdwaW9fYmFja2xpZ2h0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpCj4gICAJbWVtc2V0KCZwcm9wcywgMCwgc2l6ZW9mKHByb3BzKSk7Cj4gICAJcHJvcHMudHlw
ZSA9IEJBQ0tMSUdIVF9SQVc7Cj4gICAJcHJvcHMubWF4X2JyaWdodG5lc3MgPSAxOwo+IC0JYmwg
PSBkZXZtX2JhY2tsaWdodF9kZXZpY2VfcmVnaXN0ZXIoJnBkZXYtPmRldiwgZGV2X25hbWUoJnBk
ZXYtPmRldiksCj4gLQkJCQkJJnBkZXYtPmRldiwgZ2JsLCAmZ3Bpb19iYWNrbGlnaHRfb3BzLAo+
IC0JCQkJCSZwcm9wcyk7Cj4gKwlibCA9IGRldm1fYmFja2xpZ2h0X2RldmljZV9yZWdpc3Rlcihk
ZXYsIGRldl9uYW1lKGRldiksIGRldiwgZ2JsLAo+ICsJCQkJCSAgICAmZ3Bpb19iYWNrbGlnaHRf
b3BzLCAmcHJvcHMpOwo+ICAgCWlmIChJU19FUlIoYmwpKSB7Cj4gLQkJZGV2X2VycigmcGRldi0+
ZGV2LCAiZmFpbGVkIHRvIHJlZ2lzdGVyIGJhY2tsaWdodFxuIik7Cj4gKwkJZGV2X2VycihkZXYs
ICJmYWlsZWQgdG8gcmVnaXN0ZXIgYmFja2xpZ2h0XG4iKTsKPiAgIAkJcmV0dXJuIFBUUl9FUlIo
YmwpOwo+ICAgCX0KPiAgIAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
