Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B8C5CC4C
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2019 11:02:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADD8E899F0;
	Tue,  2 Jul 2019 09:02:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3B4D899F0
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2019 09:02:06 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id x17so16815191wrl.9
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2019 02:02:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UYqevnI0spcyedfiOLJ3vdJN7KeUhPxc6owycWTRKgQ=;
 b=W0MhRtg6uxZLw8u+voXhWZVEaDTIh1GCxkvuz+8gedTj7Ewe4DOZhCsqYGbzKxNPd3
 gP0TEquo8dt65XktLv0zKZ+J3c4pWKe4qur6s3u+XbfK/lX0oFUQavwvNzw8Jqlldtjs
 UZXdfb6mlWJ5/NfmtJ+ULFrzuMgO14fXg/5sDuILZFY+SWelT+fYVEjV55jjCjk9bac3
 uxYowofM5ne0eFbWeJrBtv5PRPEP6jlylx8Ih78DH3RPo5+oAuYMbYtKTIw4w9tdFeCp
 QPCdPRLEq3VbE2w4xpvrE8qeK/tJgFwFEUMFPPosPuDra9heyccqAIKSWWxA1qQDQUUd
 0DDg==
X-Gm-Message-State: APjAAAXNIMJBnABaoPR3h/aHQA4tqejRJUS/fVDzAPhL3waIxmZ/dcec
 otUhJaYzMPthz4rqsFzDJpBVnQ==
X-Google-Smtp-Source: APXvYqwe8Sm/0nT25qcnzu4by7nlxEbs2dugrf6wEZ/ThBZTX0iMnPIhJfIGmRRbZlCWJVwSZilmew==
X-Received: by 2002:a5d:5450:: with SMTP id w16mr13519041wrv.128.1562058125256; 
 Tue, 02 Jul 2019 02:02:05 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.googlemail.com with ESMTPSA id z5sm11056873wrh.16.2019.07.02.02.02.04
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Jul 2019 02:02:04 -0700 (PDT)
Subject: Re: [PATCH 01/12] backlight: gpio: allow to probe non-pdata devices
 from board files
To: Bartosz Golaszewski <brgl@bgdev.pl>, Sekhar Nori <nsekhar@ti.com>,
 Kevin Hilman <khilman@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Lechner <david@lechnology.com>,
 Linus Walleij <linus.walleij@linaro.org>
References: <20190625163434.13620-1-brgl@bgdev.pl>
 <20190625163434.13620-2-brgl@bgdev.pl>
From: Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <57229b83-c876-1042-2866-1a63e6654bd4@linaro.org>
Date: Tue, 2 Jul 2019 10:02:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190625163434.13620-2-brgl@bgdev.pl>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UYqevnI0spcyedfiOLJ3vdJN7KeUhPxc6owycWTRKgQ=;
 b=kNZfMLh00xnDEGdyC0iMBLY3n5hKUNwtHEhscIYyRu5QdBU8iXikuYKclzZ4F+RGCK
 S6LNIhsKN0ymzqyVPrK9D4krSgW29DhsBIMN8qLF13phqddvbHbk3QsIowLUof5CiE3W
 Adhoe3+1xqurjhsFfPGGjmFerkhGU8fxZHZZ83yVnrtCXpMli/vgDurTNBYZYzIrK189
 ll8jNF8I6Ry98ZCfRnt3Luin+fFFYxhHCS3vDGnefmmSsVhe7w42q0IRzxQ3DrWrWBSy
 6Wv5vwS9v8z/uz7RDdfqT/GI1sdH96WAO0YFRg960KbLyx3V81mfc5Y2fr5RzWHcdzym
 nZdQ==
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
YXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29sYXN6ZXdza2lAYmF5bGlicmUuY29tPgo+IAo+IEN1cnJl
bnRseSB3ZSBjYW4gb25seSBwcm9iZSBkZXZpY2VzIHRoYXQgZWl0aGVyIHVzZSBkZXZpY2UgdHJl
ZSBvciBwYXNzCj4gcGxhdGZvcm0gZGF0YSB0byBwcm9iZSgpLiBSZW5hbWUgZ3Bpb19iYWNrbGln
aHRfcHJvYmVfZHQoKSB0bwo+IGdwaW9fYmFja2xpZ2h0X3Byb2JlX3Byb3AoKSBhbmQgdXNlIGdl
bmVyaWMgZGV2aWNlIHByb3BlcnRpZXMgaW5zdGVhZAo+IG9mIE9GIHNwZWNpZmljIGhlbHBlcnMu
CgpUaGlzIGhhcyBhbHJlYWR5IGJlZW4gZG9uZSBpbiAod2hpY2ggSUlSQyBkaWQgZ2V0IHF1ZXVl
ZCBmb3IgdGhlIG5leHQgCnJlbGVhc2UpOgpodHRwczovL3d3dy5zcGluaWNzLm5ldC9saXN0cy9k
cmktZGV2ZWwvbXNnMjE1MDUwLmh0bWwKCj4gUmV2ZXJzZSB0aGUgbG9naWMgY2hlY2tpbmcgdGhl
IHByZXNlbmNlIG9mCj4gcGxhdGZvcm0gZGF0YSBpbiBwcm9iZSgpLiBUaGlzIHdheSB3ZSBjYW4g
cHJvYmUgZGV2aWNlcygpIHJlZ2lzdGVyZWQKPiBmcm9tIG1hY2hpbmUgY29kZSB0aGF0IG5laXRo
ZXIgaGF2ZSBhIERUIG5vZGUgbm9yIHVzZSBwbGF0Zm9ybSBkYXRhLgoKQW5keSdzIHBhdGNoIGRp
ZCBub3QgcmV2ZXJzZSB0aGlzIGxvZ2ljLi4uIGJ1dCBpdCBkb2VzIGNoZWNrIApwZGV2LT5kZXYu
Zndub2RlIHJhdGhlciB0aGFuIG9mX25vZGUgLgoKCkRhbmllbC4KCgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJnb2xhc3pld3NraUBiYXlsaWJyZS5jb20+Cj4gLS0t
Cj4gICBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9ncGlvX2JhY2tsaWdodC5jIHwgMjQgKysrKysr
KystLS0tLS0tLS0tLS0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAx
NiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQv
Z3Bpb19iYWNrbGlnaHQuYyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0
LmMKPiBpbmRleCBiOTMwMGYzZTFlZTYuLjY1NGMxOWQzYTgxZCAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL3ZpZGVvL2JhY2tsaWdodC9ncGlvX2JhY2tsaWdodC5jCj4gKysrIGIvZHJpdmVycy92aWRl
by9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQuYwo+IEBAIC01NCwxNSArNTQsMTQgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBiYWNrbGlnaHRfb3BzIGdwaW9fYmFja2xpZ2h0X29wcyA9IHsKPiAgIAku
Y2hlY2tfZmIJPSBncGlvX2JhY2tsaWdodF9jaGVja19mYiwKPiAgIH07Cj4gICAKPiAtc3RhdGlj
IGludCBncGlvX2JhY2tsaWdodF9wcm9iZV9kdChzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
LAo+IC0JCQkJICAgc3RydWN0IGdwaW9fYmFja2xpZ2h0ICpnYmwpCj4gK3N0YXRpYyBpbnQgZ3Bp
b19iYWNrbGlnaHRfcHJvYmVfcHJvcChzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LAo+ICsJ
CQkJICAgICBzdHJ1Y3QgZ3Bpb19iYWNrbGlnaHQgKmdibCkKPiAgIHsKPiAgIAlzdHJ1Y3QgZGV2
aWNlICpkZXYgPSAmcGRldi0+ZGV2Owo+IC0Jc3RydWN0IGRldmljZV9ub2RlICpucCA9IGRldi0+
b2Zfbm9kZTsKPiAgIAllbnVtIGdwaW9kX2ZsYWdzIGZsYWdzOwo+ICAgCWludCByZXQ7Cj4gICAK
PiAtCWdibC0+ZGVmX3ZhbHVlID0gb2ZfcHJvcGVydHlfcmVhZF9ib29sKG5wLCAiZGVmYXVsdC1v
biIpOwo+ICsJZ2JsLT5kZWZfdmFsdWUgPSBkZXZpY2VfcHJvcGVydHlfcmVhZF9ib29sKGRldiwg
ImRlZmF1bHQtb24iKTsKPiAgIAlmbGFncyA9IGdibC0+ZGVmX3ZhbHVlID8gR1BJT0RfT1VUX0hJ
R0ggOiBHUElPRF9PVVRfTE9XOwo+ICAgCj4gICAJZ2JsLT5ncGlvZCA9IGRldm1fZ3Bpb2RfZ2V0
KGRldiwgTlVMTCwgZmxhZ3MpOwo+IEBAIC04NiwyNiArODUsMTUgQEAgc3RhdGljIGludCBncGlv
X2JhY2tsaWdodF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAgCXN0cnVj
dCBiYWNrbGlnaHRfcHJvcGVydGllcyBwcm9wczsKPiAgIAlzdHJ1Y3QgYmFja2xpZ2h0X2Rldmlj
ZSAqYmw7Cj4gICAJc3RydWN0IGdwaW9fYmFja2xpZ2h0ICpnYmw7Cj4gLQlzdHJ1Y3QgZGV2aWNl
X25vZGUgKm5wID0gcGRldi0+ZGV2Lm9mX25vZGU7Cj4gICAJaW50IHJldDsKPiAgIAo+IC0JaWYg
KCFwZGF0YSAmJiAhbnApIHsKPiAtCQlkZXZfZXJyKCZwZGV2LT5kZXYsCj4gLQkJCSJmYWlsZWQg
dG8gZmluZCBwbGF0Zm9ybSBkYXRhIG9yIGRldmljZSB0cmVlIG5vZGUuXG4iKTsKPiAtCQlyZXR1
cm4gLUVOT0RFVjsKPiAtCX0KPiAtCj4gICAJZ2JsID0gZGV2bV9remFsbG9jKCZwZGV2LT5kZXYs
IHNpemVvZigqZ2JsKSwgR0ZQX0tFUk5FTCk7Cj4gICAJaWYgKGdibCA9PSBOVUxMKQo+ICAgCQly
ZXR1cm4gLUVOT01FTTsKPiAgIAo+ICAgCWdibC0+ZGV2ID0gJnBkZXYtPmRldjsKPiAgIAo+IC0J
aWYgKG5wKSB7Cj4gLQkJcmV0ID0gZ3Bpb19iYWNrbGlnaHRfcHJvYmVfZHQocGRldiwgZ2JsKTsK
PiAtCQlpZiAocmV0KQo+IC0JCQlyZXR1cm4gcmV0Owo+IC0JfSBlbHNlIHsKPiArCWlmIChwZGF0
YSkgewo+ICAgCQkvKgo+ICAgCQkgKiBMZWdhY3kgcGxhdGZvcm0gZGF0YSBHUElPIHJldHJpZXZl
YWwuIERvIG5vdCBleHBhbmQKPiAgIAkJICogdGhlIHVzZSBvZiB0aGlzIGNvZGUgcGF0aCwgY3Vy
cmVudGx5IG9ubHkgdXNlZCBieSBvbmUKPiBAQCAtMTI2LDYgKzExNCwxMCBAQCBzdGF0aWMgaW50
IGdwaW9fYmFja2xpZ2h0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gICAJ
CWdibC0+Z3Bpb2QgPSBncGlvX3RvX2Rlc2MocGRhdGEtPmdwaW8pOwo+ICAgCQlpZiAoIWdibC0+
Z3Bpb2QpCj4gICAJCQlyZXR1cm4gLUVJTlZBTDsKPiArCX0gZWxzZSB7Cj4gKwkJcmV0ID0gZ3Bp
b19iYWNrbGlnaHRfcHJvYmVfcHJvcChwZGV2LCBnYmwpOwo+ICsJCWlmIChyZXQpCj4gKwkJCXJl
dHVybiByZXQ7Cj4gICAJfQo+ICAgCj4gICAJbWVtc2V0KCZwcm9wcywgMCwgc2l6ZW9mKHByb3Bz
KSk7Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
