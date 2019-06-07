Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EAD385FB
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 10:09:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CE7A89CE0;
	Fri,  7 Jun 2019 08:09:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DFD489CE0
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 08:09:35 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id x17so1159165wrl.9
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jun 2019 01:09:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ap0XAetM+pT0J8lzDb15ksHa3sKJqhSdyqZL0XBCEG4=;
 b=fMCaafBl/fOT9gioAjL2MW8MNakNbvgGzWX2fUuSnUhgL/XmhoNZdTwRSnUxTvsu/g
 81EAbdTHaYSJl5WyouO6oxY2RRAJBeq30m3mAXkuH/z76AlfCbrW5v74yrzys0ZAD+eM
 6TgIZE/h2DICXq3RyCxRdpXZYH2gJNq6Ts3bmL/sBQxxYwwB2/t9eu/YBmCkntGJZ+8D
 EnXRHF42YI7sP0ArHYDyF7YvwbQ2BSSsH8MFhsWh4f/ujhhRf52C+fGtC2ewYRY5gbrQ
 xgohsYQ1S46P2DJ5BAMHAyjP37sx0HsCFy24Ba2RYceE608GEPBucfgP0v0tRQp0qdZv
 UwlQ==
X-Gm-Message-State: APjAAAVuyQnHpmRr5+nR5efx6WVZWIR1M5y/4KmKyv5xTnmUD+Zfbazm
 eivfPfrxWh+JsRCmlnHjANk9fA==
X-Google-Smtp-Source: APXvYqxP6A+8A3KS84/Et4P9G/ZJC2IBacGunUaWZeHsk1vVP/T5CFd8ysxnZm05uOsKCYWFFibizg==
X-Received: by 2002:adf:aa09:: with SMTP id p9mr11794798wrd.59.1559894973940; 
 Fri, 07 Jun 2019 01:09:33 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id r9sm1114935wrq.0.2019.06.07.01.09.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Jun 2019 01:09:33 -0700 (PDT)
Subject: Re: [PATCH] drm/meson: fix G12A HDMI PLL settings for 4K60 1000/1001
 variations
To: Kevin Hilman <khilman@baylibre.com>, dri-devel@lists.freedesktop.org
References: <20190605125320.8708-1-narmstrong@baylibre.com>
 <7hh892fzgj.fsf@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <abf63289-dd97-75d7-d3ae-e41e171d59cc@baylibre.com>
Date: Fri, 7 Jun 2019 10:09:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <7hh892fzgj.fsf@baylibre.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ap0XAetM+pT0J8lzDb15ksHa3sKJqhSdyqZL0XBCEG4=;
 b=ZfHB7PA9Hz6ves72j99VkQp94oROxR3wx2SUlb3gGT3XFITeqkXSLhQ5tkbK3Vxr7X
 vQHIGyuVgENQcIqma1vXhRpu8pSfMWPbSYnNJiJfFzxci9Dvkups+OE6dW8oRbc8UJLB
 Fg4kHSC2AcerCfBDhoEg3tEJ/YcxsbSJwFO21JcKC9dyHxlF73CJtez6rvZ0W5W2yncp
 Msb9YgCmuwmbTGgRbsqYj/rlkslBn2ASoplqc9a3QBSHrMkb/CzQZ8zoeJNJD74v6/jp
 4WsVRVE1AkZh/1KBSAV7DW1tYMu9155X/5MuNmQnJVqW+e26vssRF+Tjar8J1wEGIbk5
 jMfA==
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDYvMDYvMjAxOSAxODozMCwgS2V2aW4gSGlsbWFuIHdyb3RlOgo+IE5laWwgQXJtc3Ryb25n
IDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4gd3JpdGVzOgo+IAo+PiBUaGUgQW1sb2dpYyBHMTJB
IEhETUkgUExMIG5lZWRzIHNvbWUgc3BlY2lmaWMgc2V0dGluZ3MgdG8gbG9jayB3aXRoCj4+IGRp
ZmZlcmVudCBmcmFjdGlvbmFsIHZhbHVlcyBmb3IgdGhlIDUsNEdIeiBtb2RlLgo+Pgo+PiBIYW5k
bGUgdGhlIDEwMDAvMTAwMSB2YXJpYXRpb24gZnJhY3Rpb25hbCBjYXNlIGhlcmUgdG8gYXZvaWQg
aGF2aW5nCj4+IHRoZSBQTEwgaW4gYW4gbm9uIGxvY2thYmxlIHN0YXRlLgo+Pgo+PiBGaXhlczog
MjAyYjk4MDhmOGVkICgiZHJtL21lc29uOiBBZGQgRzEyQSBWaWRlbyBDbG9jayBzZXR1cCIpCj4+
IFNpZ25lZC1vZmYtYnk6IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4K
Pj4gLS0tCj4+ICBkcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdmNsay5jIHwgMTMgKysrKysr
KysrKystLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdmNsay5j
IGIvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3ZjbGsuYwo+PiBpbmRleCA0NDI1MGVmZjhh
M2YuLjgzZmMyZmM4MjAwMSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lc29uL21l
c29uX3ZjbGsuYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdmNsay5jCj4+
IEBAIC01NTMsOCArNTUzLDE3IEBAIHZvaWQgbWVzb25faGRtaV9wbGxfc2V0X3BhcmFtcyhzdHJ1
Y3QgbWVzb25fZHJtICpwcml2LCB1bnNpZ25lZCBpbnQgbSwKPj4gIAo+PiAgCQkvKiBHMTJBIEhE
TUkgUExMIE5lZWRzIHNwZWNpZmljIHBhcmFtZXRlcnMgZm9yIDUuNEdIeiAqLwo+PiAgCQlpZiAo
bSA+PSAweGY3KSB7Cj4+IC0JCQlyZWdtYXBfd3JpdGUocHJpdi0+aGhpLCBISElfSERNSV9QTExf
Q05UTDQsIDB4ZWE2OGRjMDApOwo+PiAtCQkJcmVnbWFwX3dyaXRlKHByaXYtPmhoaSwgSEhJX0hE
TUlfUExMX0NOVEw1LCAweDY1NzcxMjkwKTsKPj4gKwkJCWlmIChmcmFjIDwgMHgxMDAwMCkgewo+
PiArCQkJCXJlZ21hcF93cml0ZShwcml2LT5oaGksIEhISV9IRE1JX1BMTF9DTlRMNCwKPj4gKwkJ
CQkJCQkweDZhNjg1YzAwKTsKPj4gKwkJCQlyZWdtYXBfd3JpdGUocHJpdi0+aGhpLCBISElfSERN
SV9QTExfQ05UTDUsCj4+ICsJCQkJCQkJMHgxMTU1MTI5Myk7Cj4+ICsJCQl9IGVsc2Ugewo+PiAr
CQkJCXJlZ21hcF93cml0ZShwcml2LT5oaGksIEhISV9IRE1JX1BMTF9DTlRMNCwKPj4gKwkJCQkJ
CQkweGVhNjhkYzAwKTsKPj4gKwkJCQlyZWdtYXBfd3JpdGUocHJpdi0+aGhpLCBISElfSERNSV9Q
TExfQ05UTDUsCj4+ICsJCQkJCQkJMHg2NTc3MTI5MCk7Cj4+ICsJCQl9Cj4+ICAJCQlyZWdtYXBf
d3JpdGUocHJpdi0+aGhpLCBISElfSERNSV9QTExfQ05UTDYsIDB4MzkyNzIwMDApOwo+PiAgCQkJ
cmVnbWFwX3dyaXRlKHByaXYtPmhoaSwgSEhJX0hETUlfUExMX0NOVEw3LCAweDU1NTQwMDAwKTsK
Pj4gIAkJfSBlbHNlIHsKPiAKPiBSZXZpZXdlZC1ieTogS2V2aW4gSGlsbWFuIDxraGlsbWFuQGJh
eWxpYnJlLmNvbT4KCkFwcGxpZWQgdG8gZHJtLW1pc2MtZml4ZXMKCj4gCj4gbml0OiB0aGlzIGlz
IGNvbnRpbnVpbmcgd2l0aCBtb3JlIG1hZ2ljIGNvbnN0YW50cywgYW5kIGl0IHdvdWxkIGJlIG5p
Y2UKPiB0byBoYXZlIHRoZW0gY29udmVydGVkIHRvICNkZWZpbmUnZCBiaXRmaWVsZHMuICBCdXQg
c2luY2UgdGhhdCBpc24ndCBhCj4gbmV3IHByb2JsZW0gaW4gdGhpcyBwYXRjaCwgaXQncyBmaW5l
IHRvIGNsZWFudXAgbGF0ZXIuCgpZZXAsIGl0J3Mgb24gb3VyIHRvIHByaW9yaXR5LgoKTmVpbAoK
Cj4gCj4gS2V2aW4KPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
