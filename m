Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 150B5245CFE
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:06:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E62456E422;
	Mon, 17 Aug 2020 07:06:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 188326EB94
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 16:47:06 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id i10so10629817ljn.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 09:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZmnQ4vUhgXM2is2ULbt6oEQrTJKTXGTCE402XB71Dck=;
 b=We/FVSeWrjP0+MIiJxhGwCzfNF3FWjWCzWB0nN5SzPgQeyXr9kou5Fg1G6xwmODZ9W
 zExpR2CW8OFInlbyttpitOEdHHPVzSF71HNvUTn4l1VP6YEPQPc5pGgNRcbcYUfYDWJN
 HUsiKIWEGgsiYUuz/OVIsK2RGGZwLMlO9vQWI+c3/aaEXs+0qdGtpf9rVeFD6fG7WeDf
 G1HKVVIYwVUN0QPDX+ccBKdcifMjTU2ihgqzA/QrFXkLPvkeW19oC7PqU9s4PagQK27z
 ewemK3ELH1ss9E0v2Qlqb6QFRu43KeADbn7yTJQVw00RXb8KL7qPH6taCW/IERgVRHJz
 g9+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZmnQ4vUhgXM2is2ULbt6oEQrTJKTXGTCE402XB71Dck=;
 b=n+fsezsw2GfRYFzwQMN0m/WADlrqeJ6cZeVli6OZTGhnYdB5NFfc9uY+cjXAxcO4JV
 P7MkvEuPjuTNuroic3FRqk2HYugr/dABYuVcZC4kASu31ltu0P+bgL3ormptqXxFLUBl
 P0TVteeZ+MpjMg4ze8kJfg4KkPH2apQr5Aly4rquWoO4YwkQLanzztB6+01/WGgjZBBG
 K8TO+MXy9flYTwn8KNu0v3AvGYG1nWQAC9fKo2wJMoXiLaCfpK2Tak9D9BmSEWwSi30c
 3Py4LJXg4yMsb1g1bbMlAsXUPN+PSJ8pIpEFDFGD+Rmm1BryHwuzf4+bf0s767K4Eb2A
 qnVQ==
X-Gm-Message-State: AOAM533vslDdN+pNYmEoadBp4j65EKPJbl8Jt9Ba5fmkg/AchQwUvxvD
 eLMHg2MTWDk9FYA3xVR2Jzo=
X-Google-Smtp-Source: ABdhPJxRFdX8dMKX0zpz4P0YHR+SyK3OD8HyoKXvo125A32O6XK/VTWaU2KYfAdlkk4oum8Xf4i2FQ==
X-Received: by 2002:a05:651c:106a:: with SMTP id
 y10mr1705452ljm.296.1597423624384; 
 Fri, 14 Aug 2020 09:47:04 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.googlemail.com with ESMTPSA id v23sm1992608lfa.5.2020.08.14.09.47.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2020 09:47:03 -0700 (PDT)
Subject: Re: [PATCH v5 13/36] PM / devfreq: tegra30: Use MC timings for
 building OPP table
To: Chanwoo Choi <cw00.choi@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>
References: <20200814000621.8415-1-digetx@gmail.com>
 <CGME20200814000944epcas1p3dfd0104c5fa640695dfcd4949f6b1818@epcas1p3.samsung.com>
 <20200814000621.8415-14-digetx@gmail.com>
 <1b0d75fe-79af-70eb-8450-999a3bc72bac@samsung.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <1de8aa41-8001-cf46-026c-b00f8df0b9a3@gmail.com>
Date: Fri, 14 Aug 2020 19:47:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1b0d75fe-79af-70eb-8450-999a3bc72bac@samsung.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 17 Aug 2020 07:06:11 +0000
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTQuMDguMjAyMCAwNTowMiwgQ2hhbndvbyBDaG9pINC/0LjRiNC10YI6Cj4gSGkgRG1pdHJ5LAo+
IAo+IEkgYWRkIHRoZSBtaW5vciBjb21tZW50LiBFeGNlcHQgb2Ygc29tZSBjb21tZW50cywgaXQg
bG9va3MgZ29vZCB0byBtZS4KCkhlbGxvLCBDaGFud29vISBUaGFuayB5b3UgZm9yIHRoZSByZXZp
ZXchCgouLi4KPj4gK3N0cnVjdCB0ZWdyYV9kZXZmcmVxX3NvY19kYXRhIHsKPj4gKwljb25zdCBj
aGFyICptY19jb21wYXRpYmxlOwo+PiArfTsKPj4gKwo+PiArc3RhdGljIGNvbnN0IHN0cnVjdCB0
ZWdyYV9kZXZmcmVxX3NvY19kYXRhIHRlZ3JhMzBfc29jID0gewo+PiArCS5tY19jb21wYXRpYmxl
ID0gIm52aWRpYSx0ZWdyYTMwLW1jIiwKPj4gK307Cj4+ICsKPj4gK3N0YXRpYyBjb25zdCBzdHJ1
Y3QgdGVncmFfZGV2ZnJlcV9zb2NfZGF0YSB0ZWdyYTEyNF9zb2MgPSB7Cj4+ICsJLm1jX2NvbXBh
dGlibGUgPSAibnZpZGlhLHRlZ3JhMTI0LW1jIiwKPj4gK307Ci4KPj4gKwlzb2NfZGF0YSA9IG9m
X2RldmljZV9nZXRfbWF0Y2hfZGF0YSgmcGRldi0+ZGV2KTsKPiAKPiBJIHRoaW5rIHRoYXQgYmV0
dGVyIHRvIGNoZWNrIHdoZXRoZXIgJ3NvY19kYXRhJyBpcyBub3QgTlVMTC4KCkl0J3MgYSBxdWl0
ZSBjb21tb24gbWlzY29uY2VwdGlvbiBhbW9uZyBrZXJuZWwgZGV2ZWxvcGVycyB0aGF0Cm9mX2Rl
dmljZV9nZXRfbWF0Y2hfZGF0YSgpIG1heSAiYWNjaWRlbnRhbGx5IiByZXR1cm4gTlVMTCwgYnV0
IGl0CmNvdWxkbid0IGlmIGV2ZXJ5IGRyaXZlcidzIG9mX21hdGNoW10gZW50cnkgaGFzIGEgbm9u
LU5VTEwgLmRhdGEgZmllbGQKYW5kIGJlY2F1c2UgdGhlIE9GLW1hdGNoaW5nIGFscmVhZHkgaGFw
cGVuZWQgYXQgdGhlIGRyaXZlcidzIHByb2JlLXRpbWUKWzFdLCB3aGljaCBpcyB0aGUgY2FzZSBv
ZiB0aGlzIGRyaXZlci4KClsxXSBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92NS44
L3NvdXJjZS9kcml2ZXJzL29mL2RldmljZS5jI0wxODkKCkhlbmNlIHRoZSBOVUxMLWNoZWNraW5n
IGlzIHVubmVjZXNzYXJ5LgoKV2hlbiBJIGZpcnN0IGVuY291bnRlcmVkIHRoZSBvZl9kZXZpY2Vf
Z2V0X21hdGNoX2RhdGEoKSwgSSB3YXMgYWxzbwp0aGlua2luZyB0aGF0IGFkZGluZyB0aGUgTlVM
TC1jaGVja3MgaXMgYSBnb29kIGlkZWEsIGJ1dCBsYXRlciBvbgpzb21lYm9keSBwb2ludGVkIG91
dCB0byBtZSAobWF5YmUgVGhpZXJyeSkgdGhhdCBpdCdzIHVubmVjZXNzYXJ5IHRvIGRvLgoKPj4g
Kwo+PiArCW1jID0gdGVncmFfZ2V0X21lbW9yeV9jb250cm9sbGVyKHNvY19kYXRhLT5tY19jb21w
YXRpYmxlKTsKPj4gKwlpZiAoSVNfRVJSKG1jKSkKPj4gKwkJcmV0dXJuIFBUUl9FUlIobWMpOwo+
IAo+IFlvdSBiZXR0ZXIgdG8gYWRkIGVycm9yIGxvZy4KCkluIHByYWN0aWNlIHdlIHNob3VsZCBn
ZXQgb25seSAtRVBST0JFX0RFRkVSIGhlcmUgZXZlci4gSSdsbCBjb25zaWRlcgphZGRpbmcgdGhl
IG1lc3NhZ2UgaW4gdGhlIG5leHQgcmV2aXNpb24sIGF0IGxlYXN0IGp1c3QgZm9yIGNvbnNpc3Rl
bmN5LgoKVGhhbmtzIQoKLi4uCj4+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCB0
ZWdyYV9kZXZmcmVxX29mX21hdGNoW10gPSB7Cj4+IC0JeyAuY29tcGF0aWJsZSA9ICJudmlkaWEs
dGVncmEzMC1hY3Rtb24iIH0sCj4+IC0JeyAuY29tcGF0aWJsZSA9ICJudmlkaWEsdGVncmExMjQt
YWN0bW9uIiB9LAo+PiArCXsgLmNvbXBhdGlibGUgPSAibnZpZGlhLHRlZ3JhMzAtYWN0bW9uIiwg
IC5kYXRhID0gJnRlZ3JhMzBfc29jLCB9LAo+PiArCXsgLmNvbXBhdGlibGUgPSAibnZpZGlhLHRl
Z3JhMTI0LWFjdG1vbiIsIC5kYXRhID0gJnRlZ3JhMTI0X3NvYywgfSwKPj4gIAl7IH0sCj4+ICB9
OwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
