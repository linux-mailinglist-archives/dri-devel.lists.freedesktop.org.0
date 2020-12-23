Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C1B2E2AE5
	for <lists+dri-devel@lfdr.de>; Fri, 25 Dec 2020 10:43:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B55C589B8E;
	Fri, 25 Dec 2020 09:42:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5112B89EF7
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Dec 2020 20:36:32 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id o19so350212lfo.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Dec 2020 12:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=z8D0v9w6eLHS5d5x0vZY+QzqYtTC2mP/fYl8494giiU=;
 b=HadHxSMLhDZhkJqBkxDVtRCRHgzsranQMuvvPkCW8ZvWERI0I/IV3jmYhrnnUiBMI+
 7bhhS0TCu++x3528jZkIg0GBh93HvAHa4m5GFYkt4lut2M+43qdrkbdbQymCHGAvtZwS
 gPa9zaEGRLx854V8GzVDPvoNJd/vl09zAQV4+eIvWEF9DfOM/DN+IVabjMlyg7bFptR3
 peW/KIS0flnlEUh9OP1v+48hjIhLMv1IqpfCsHwsT5faZmJPdepA2s80mn0eUyUHOa0I
 zE3A8fT2QV1G2b1n/M8N0awGXrQEuf+3I6INY8xv14mX3oKWJIO6Mv1Ys47bGKcm+cBi
 Mqag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=z8D0v9w6eLHS5d5x0vZY+QzqYtTC2mP/fYl8494giiU=;
 b=uGkJ5wLXvzprsUrMwvoBD2G+2dTUsvordM9QUEsuHXyHePT9jCvOr4NdD4ytC+ZP0X
 Rdr77KJ+DsgmF4J4X94+QHrEywJJUQwS3Jcc9OlLy+obVnEgxzNtrKc/2VICI6FBM2kJ
 KEmGTEfW7E8rv5c+Hv5WVjKHJjBwqGKt2AHvn3uKesLVzm8Bs8h4lUKxZZaa6kOEBG4z
 gQDvelWruA6VDS8TeWcO7t8yZOS72mGUe9ntqvJK8RQNZd2qrriFpuhGH4fBar6Jk0bL
 bKKabCLbXLVsDQFIzBLfYvRnRgzay1+1pbn29R/dqxSXZfZWkoEmmkNn7jx3+ljWc+6G
 gU5A==
X-Gm-Message-State: AOAM530jinbsHWC0ALVh89kUZeZvE7T0hRGss9E8DYX07SzSUPNJvTBT
 9H1omSK9mrsTm3VCv93w3qM=
X-Google-Smtp-Source: ABdhPJysbMlvfYnsC/QFSGO0Bwu3xJ1EeyAih0QH/oKOK6cjPT+k0t3f+Uj1mCTnFpE6RS2H9psSPA==
X-Received: by 2002:a2e:980f:: with SMTP id a15mr12009304ljj.301.1608755790793; 
 Wed, 23 Dec 2020 12:36:30 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.googlemail.com with ESMTPSA id y20sm3658851lji.86.2020.12.23.12.36.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Dec 2020 12:36:30 -0800 (PST)
Subject: Re: [PATCH v2 19/48] opp: Fix adding OPP entries in a wrong order if
 rate is unavailable
To: Viresh Kumar <viresh.kumar@linaro.org>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-20-digetx@gmail.com>
 <20201222091255.wentz5hyt726qezg@vireshk-i7>
 <db6273e6-8406-b7ae-b51d-48ceb6d21962@gmail.com>
 <20201223043443.rklw5er6hck3gl4y@vireshk-i7>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <7688d6b9-52a2-d30f-123f-43c01e03b968@gmail.com>
Date: Wed, 23 Dec 2020 23:36:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201223043443.rklw5er6hck3gl4y@vireshk-i7>
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

MjMuMTIuMjAyMCAwNzozNCwgVmlyZXNoIEt1bWFyINC/0LjRiNC10YI6Cj4gT24gMjItMTItMjAs
IDIyOjE5LCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+IDIyLjEyLjIwMjAgMTI6MTIsIFZpcmVz
aCBLdW1hciDQv9C40YjQtdGCOgo+Pj4gT24gMTctMTItMjAsIDIxOjA2LCBEbWl0cnkgT3NpcGVu
a28gd3JvdGU6Cj4+Pj4gRml4IGFkZGluZyBPUFAgZW50cmllcyBpbiBhIHdyb25nIChvcHBvc2l0
ZSkgb3JkZXIgaWYgT1BQIHJhdGUgaXMKPj4+PiB1bmF2YWlsYWJsZS4gVGhlIE9QUCBjb21wYXJp
c29uIGlzIGVycm9uZW91c2x5IHNraXBwZWQgaWYgT1BQIHJhdGUgaXMKPj4+PiBtaXNzaW5nLCB0
aHVzIE9QUHMgYXJlIGxlZnQgdW5zb3J0ZWQuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBEbWl0
cnkgT3NpcGVua28gPGRpZ2V0eEBnbWFpbC5jb20+Cj4+Pj4gLS0tCj4+Pj4gIGRyaXZlcnMvb3Bw
L2NvcmUuYyB8IDIzICsrKysrKysrKysrKy0tLS0tLS0tLS0tCj4+Pj4gIGRyaXZlcnMvb3BwL29w
cC5oICB8ICAyICstCj4+Pj4gIDIgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMTIg
ZGVsZXRpb25zKC0pCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9vcHAvY29yZS5jIGIv
ZHJpdmVycy9vcHAvY29yZS5jCj4+Pj4gaW5kZXggMzRmN2U1MzBkOTQxLi41YzdmMTMwYThkZTIg
MTAwNjQ0Cj4+Pj4gLS0tIGEvZHJpdmVycy9vcHAvY29yZS5jCj4+Pj4gKysrIGIvZHJpdmVycy9v
cHAvY29yZS5jCj4+Pj4gQEAgLTE1MzEsOSArMTUzMSwxMCBAQCBzdGF0aWMgYm9vbCBfb3BwX3N1
cHBvcnRlZF9ieV9yZWd1bGF0b3JzKHN0cnVjdCBkZXZfcG1fb3BwICpvcHAsCj4+Pj4gIAlyZXR1
cm4gdHJ1ZTsKPj4+PiAgfQo+Pj4+ICAKPj4+PiAtaW50IF9vcHBfY29tcGFyZV9rZXkoc3RydWN0
IGRldl9wbV9vcHAgKm9wcDEsIHN0cnVjdCBkZXZfcG1fb3BwICpvcHAyKQo+Pj4+ICtpbnQgX29w
cF9jb21wYXJlX2tleShzdHJ1Y3QgZGV2X3BtX29wcCAqb3BwMSwgc3RydWN0IGRldl9wbV9vcHAg
Km9wcDIsCj4+Pj4gKwkJICAgICBib29sIHJhdGVfbm90X2F2YWlsYWJsZSkKPj4+PiAgewo+Pj4+
IC0JaWYgKG9wcDEtPnJhdGUgIT0gb3BwMi0+cmF0ZSkKPj4+PiArCWlmICghcmF0ZV9ub3RfYXZh
aWxhYmxlICYmIG9wcDEtPnJhdGUgIT0gb3BwMi0+cmF0ZSkKPj4+Cj4+PiByYXRlIHdpbGwgYmUg
MCBmb3IgYm90aCB0aGUgT1BQcyBoZXJlIGlmIHJhdGVfbm90X2F2YWlsYWJsZSBpcyB0cnVlIGFu
ZCBzbyB0aGlzCj4+PiBjaGFuZ2Ugc2hvdWxkbid0IGJlIHJlcXVpcmVkLgo+Pgo+PiBUaGUgcmF0
ZV9ub3RfYXZhaWxhYmxlIGlzIG5lZ2F0ZWQgaW4gdGhlIGNvbmRpdGlvbi4gVGhpcyBjaGFuZ2Ug
aXMKPj4gcmVxdWlyZWQgYmVjYXVzZSBib3RoIHJhdGVzIGFyZSAwIGFuZCB0aGVuIHdlIHNob3Vs
ZCBwcm9jZWVkIHRvIHRoZQo+PiBsZXZlbHMgY29tcGFyaXNvbi4KPiAKPiBXb24ndCB0aGF0IGhh
cHBlbiB3aXRob3V0IHRoaXMgcGF0Y2ggPwoKTm8KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
