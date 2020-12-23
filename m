Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C86A2E2ACF
	for <lists+dri-devel@lfdr.de>; Fri, 25 Dec 2020 10:42:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C061189B8F;
	Fri, 25 Dec 2020 09:42:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F05776E891
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Dec 2020 20:48:14 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id o17so373739lfg.4
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Dec 2020 12:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XAOZFX5PmO3BnjJ+pCRmO9VP1XkSYch3y2iUGGqB3o8=;
 b=Hkvv+mPSRToI5mHA8J6YUX4CFXMXssDIGtVj6ay0ksThjJWupHF+KIutY8dH4sL7ed
 du7+7yoSg/YOCXgiTfEyg4CyB2NpnVsLGJ89dV9SqoWOqPUSKFl+2NZOIeKzMxyTNXs6
 pvuhxNC+RAkVqtQKrSVHWh94rQCm6AEAARMEmMKIyG0Cczj8D1kgdOX+ldMR9yzqHekC
 yDjSgnsDvou5/c8J+cRX0bs8foGprzKYHTXElxVD89Q6W5OlGffGLeI2A5ZfRV+Jo9KY
 pbKavgg6wX3W4BZM+XSfnGSMohsNPFg6mW2yFVUGZi/CUBKgPDlW8uQkMqeBWYVO60Tr
 617g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XAOZFX5PmO3BnjJ+pCRmO9VP1XkSYch3y2iUGGqB3o8=;
 b=OjiAFxAd0NAoFHxwQTH2P0jQwt6fDr/1poC4YNfEr11Om2yax0y7iB+XBd5XcscXlb
 JfXmkqtvWFTHJ1C7ji+Zo2A3/sutXsz8j02iIcqKZhO4L1dkyy650qEyK+tv9H3B95Qj
 wP9ruJCgrFzNnBNUKxrMmKI9ka1Z2PExSMEp1ysrrCxUMcd7mBzulnTd9pMnSMBVTHPF
 LhbJ48Y0dhnTm0/JiUmxQjmQY6M3fQh+5hiPGQCgSFZ9TJ8jOYaK2zM/zlwwcxzjqYgN
 qGpUsq76fVzrP9uM83FzNyd42iYFS4w2xJ+KS0/AiNLXbfhhiNjdcSXFeG0tdhfZYW/K
 2jBg==
X-Gm-Message-State: AOAM531awXIXWcUmdQ1k120fnzvNV+gmA2yzLA5kmGvChrb4d9HCQKf5
 xL3YCVhCATCrsBaLJo8n4pc=
X-Google-Smtp-Source: ABdhPJzjYrLYkWsalFBLSailKegbFX3ZOqy7cBTjqEzJ0UJwKuOkOkF6TKPSPxQv5z+pj73dmBDjnA==
X-Received: by 2002:a2e:9053:: with SMTP id n19mr10022964ljg.283.1608756493408; 
 Wed, 23 Dec 2020 12:48:13 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.googlemail.com with ESMTPSA id n8sm3351553lfi.48.2020.12.23.12.48.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Dec 2020 12:48:12 -0800 (PST)
Subject: Re: [PATCH v2 14/48] opp: Filter out OPPs based on availability of a
 required-OPP
To: Viresh Kumar <viresh.kumar@linaro.org>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-15-digetx@gmail.com>
 <20201222085940.y625zxee4tevbqm5@vireshk-i7>
 <9ed8bde3-f7b5-025c-c038-87f35ea39e5f@gmail.com>
 <20201223042200.ey2azaqizazrz6bp@vireshk-i7>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <3c6a1e43-02c7-30d3-3aee-fde1dbf76472@gmail.com>
Date: Wed, 23 Dec 2020 23:48:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201223042200.ey2azaqizazrz6bp@vireshk-i7>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 25 Dec 2020 09:42:09 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-clk@vger.kernel.org, devel@driverdev.osuosl.org,
 Kevin Hilman <khilman@kernel.org>, Nicolas Chauvet <kwizart@gmail.com>,
 Viresh Kumar <vireshk@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-tegra@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjMuMTIuMjAyMCAwNzoyMiwgVmlyZXNoIEt1bWFyINC/0LjRiNC10YI6Cj4gT24gMjItMTItMjAs
IDIyOjE3LCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+IDIyLjEyLjIwMjAgMTE6NTksIFZpcmVz
aCBLdW1hciDQv9C40YjQtdGCOgo+Pj4gT24gMTctMTItMjAsIDIxOjA2LCBEbWl0cnkgT3NpcGVu
a28gd3JvdGU6Cj4+Pj4gQSByZXF1aXJlZCBPUFAgbWF5IG5vdCBiZSBhdmFpbGFibGUsIGFuZCB0
aHVzLCBhbGwgT1BQcyB3aGljaCBhcmUgdXNpbmcKPj4+PiB0aGlzIHJlcXVpcmVkIE9QUCBzaG91
bGQgYmUgdW5hdmFpbGFibGUgdG9vLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogRG1pdHJ5IE9z
aXBlbmtvIDxkaWdldHhAZ21haWwuY29tPgo+Pj4+IC0tLQo+Pj4+ICBkcml2ZXJzL29wcC9jb3Jl
LmMgfCAxMSArKysrKysrKysrLQo+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQo+Pj4KPj4+IFBsZWFzZSBzZW5kIGEgc2VwYXJhdGUgcGF0Y2hzZXQg
Zm9yIGZpeGVzLCBhcyB0aGVzZSBjYW4gYWxzbyBnbyB0byA1LjExIGl0c2VsZi4KPj4KPj4gQWxy
aWdodCwgYWx0aG91Z2ggSSBkb24ndCB0aGluayB0aGF0IHRoaXMgcGF0Y2ggZml4ZXMgYW55IHBy
b2JsZW1zIGZvcgo+PiBleGlzdGluZyBPUFAgdXNlcnMuCj4gCj4gQmVjYXVzZSBub2JvZHkgaXMg
dXNpbmcgdGhpcyBmZWF0dXJlLCBidXQgb3RoZXJ3aXNlIHRoaXMgaXMgYSBmaXggZm9yIG1lLgo+
IAo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL29wcC9jb3JlLmMgYi9kcml2ZXJzL29wcC9jb3Jl
LmMKPj4+PiBpbmRleCBkOWZlYjc2Mzk1OTguLjNkMDJmZTMzNjMwYiAxMDA2NDQKPj4+PiAtLS0g
YS9kcml2ZXJzL29wcC9jb3JlLmMKPj4+PiArKysgYi9kcml2ZXJzL29wcC9jb3JlLmMKPj4+PiBA
QCAtMTU4OCw3ICsxNTg4LDcgQEAgaW50IF9vcHBfYWRkKHN0cnVjdCBkZXZpY2UgKmRldiwgc3Ry
dWN0IGRldl9wbV9vcHAgKm5ld19vcHAsCj4+Pj4gIAkgICAgIHN0cnVjdCBvcHBfdGFibGUgKm9w
cF90YWJsZSwgYm9vbCByYXRlX25vdF9hdmFpbGFibGUpCj4+Pj4gIHsKPj4+PiAgCXN0cnVjdCBs
aXN0X2hlYWQgKmhlYWQ7Cj4+Pj4gLQlpbnQgcmV0Owo+Pj4+ICsJaW50IGksIHJldDsKPj4+PiAg
Cj4+Pj4gIAltdXRleF9sb2NrKCZvcHBfdGFibGUtPmxvY2spOwo+Pj4+ICAJaGVhZCA9ICZvcHBf
dGFibGUtPm9wcF9saXN0Owo+Pj4+IEBAIC0xNjE1LDYgKzE2MTUsMTUgQEAgaW50IF9vcHBfYWRk
KHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldl9wbV9vcHAgKm5ld19vcHAsCj4+Pj4gIAkJ
CSBfX2Z1bmNfXywgbmV3X29wcC0+cmF0ZSk7Cj4+Pj4gIAl9Cj4+Pj4gIAo+Pj4+ICsJZm9yIChp
ID0gMDsgaSA8IG9wcF90YWJsZS0+cmVxdWlyZWRfb3BwX2NvdW50ICYmIG5ld19vcHAtPmF2YWls
YWJsZTsgaSsrKSB7Cj4+Pj4gKwkJaWYgKG5ld19vcHAtPnJlcXVpcmVkX29wcHNbaV0tPmF2YWls
YWJsZSkKPj4+PiArCQkJY29udGludWU7Cj4+Pj4gKwo+Pj4+ICsJCW5ld19vcHAtPmF2YWlsYWJs
ZSA9IGZhbHNlOwo+Pj4+ICsJCWRldl93YXJuKGRldiwgIiVzOiBPUFAgbm90IHN1cHBvcnRlZCBi
eSByZXF1aXJlZCBPUFAgJXBPRiAoJWx1KVxuIiwKPj4+PiArCQkJIF9fZnVuY19fLCBuZXdfb3Bw
LT5yZXF1aXJlZF9vcHBzW2ldLT5ucCwgbmV3X29wcC0+cmF0ZSk7Cj4+Pgo+Pj4gV2h5IG5vdCBq
dXN0IGJyZWFrIGZyb20gaGVyZSA/Cj4+Cj4+IFRoZSBuZXdfb3BwIGNvdWxkIGJlIGFscmVhZHkg
bWFya2VkIGFzIHVuYXZhaWxhYmxlIGJ5IGEgcHJldmlvdXMgdm9sdGFnZQo+PiBjaGVjaywgaGVu
Y2UgdGhpcyBsb29wIHNob3VsZCBiZSBza2lwcGVkIGVudGlyZWx5IGluIHRoYXQgY2FzZS4KPiAK
PiBUaGVuIGFkZCBhIHNlcGFyYXRlIGNoZWNrIGZvciB0aGF0IGJlZm9yZSB0aGUgbG9vcCBhcyB3
ZSBkb24ndCBuZWVkIHRoYXQgY2hlY2sKPiBvbiBldmVyeSBpdGVyYXRpb24gaGVyZS4KPiAKClBl
cmhhcHMgdGhlIGJyZWFrIHdpbGwgYmUgYSBiZXR0ZXIgb3B0aW9uIGluIHRoaXMgY2FzZSwgc2lu
Y2UgaXQgd29uJ3QKaHVydCBhdCBhbGwgdG8gcHJpbnQgdGhlIGFkZGl0aW9uYWwgbWVzc2FnZSBl
dmVuIGlmIE9QUCB3YXMgYWxyZWFkeQpkaXNhYmxlZCBieSBhbm90aGVyIGNoZWNrLiBJJ2xsIHVw
ZGF0ZSBpdCBpbiBuZXh0IHJldmlzaW9uLCB0aGFua3MuCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
