Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C766A2E2AE4
	for <lists+dri-devel@lfdr.de>; Fri, 25 Dec 2020 10:43:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5A7189C1C;
	Fri, 25 Dec 2020 09:42:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2D9C89B29
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Dec 2020 12:14:04 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id x20so4287033lfe.12
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Dec 2020 04:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=56xAzTWTQQ5e5SGZuO7IksvEZZ4TGll9FyZCHqwaIyI=;
 b=IEomQfiR8gvwpl9AJ1ADx1wLAiBTpBe0MzDzBHrVnyksFAtoCQusyt2aOpddZtgnt0
 G2xrtk7dkAbPh5mrBpegI3zf7dejgxqz8zhdkTojfBT5HjUiBLt6rBGSE5riltq/UOKr
 3ZKU17K+r+LGVo70URY/QRisS+jbgdr71ZJH5blzCGp5+H4gymXTDKfWnCB9KDIcl+HM
 T4HCqn3iAd24R4Z9GQoCK9zagFdGfHbYb5fdrnMoYTtBGpdwl9FSDpYdZD074Gbqtp4/
 p1NmX52oYCijEX+U1K+BtSTXWdk/xK9mxVFoLZQ+izHlWVXianvWcZvnwwq9UECfsz1T
 g4cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=56xAzTWTQQ5e5SGZuO7IksvEZZ4TGll9FyZCHqwaIyI=;
 b=agTJoOTGBXwuFy5ffbxBjMBDtX786eVDKufxvazjOBAHk1OwbPnG059AinfDSsXx+1
 goeIF/pv+HGhcGUhPo0oO0mGlrnHRL6paP2zT84jJiDVBdyXujUTUCs2f/rbUcl3PDBc
 mkO4qIJH74pPR7SeZm3Eo4yUJz7KwPvjdu/2vUHPj2yRJwFLAsspm59alVxS2qiDRoxs
 FpqBi9B4P5m8w+baiXI0isUH8TDGWQSsJONmjp9F0XfhXsyKwZrSoglbQkdZ0gwwqqEy
 yy6SX8Z+QqK4Hx8NeTpngjehagydxsAdC9n/lhgSo0k8LL3PWDSnKh9Zd4Hc5+6arPyJ
 cpAA==
X-Gm-Message-State: AOAM533UST9YzYDuIa3nk+L2TbsT2JaBb8e/31exHWloGbXEkNGcW3nS
 Hif56jkjdZ1pNVEPHxo6tyc=
X-Google-Smtp-Source: ABdhPJxP11G59ZBkHMu4vd9Pr+ZWgnwRAd9GQgXayLcOGdnmuBtZJBd/bU3MOd1t2CqE+vlRVXlXOw==
X-Received: by 2002:a2e:80d4:: with SMTP id r20mr10520885ljg.495.1608812043389; 
 Thu, 24 Dec 2020 04:14:03 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57]) by smtp.googlemail.com with ESMTPSA id
 c142sm3572365lfg.309.2020.12.24.04.14.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Dec 2020 04:14:02 -0800 (PST)
Subject: Re: [PATCH v2 19/48] opp: Fix adding OPP entries in a wrong order if
 rate is unavailable
To: Viresh Kumar <viresh.kumar@linaro.org>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-20-digetx@gmail.com>
 <20201222091255.wentz5hyt726qezg@vireshk-i7>
 <db6273e6-8406-b7ae-b51d-48ceb6d21962@gmail.com>
 <20201223043443.rklw5er6hck3gl4y@vireshk-i7>
 <7688d6b9-52a2-d30f-123f-43c01e03b968@gmail.com>
 <20201224062826.frppxddfinjomfui@vireshk-i7>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <fa54a097-7edd-89af-6233-1e71c131668c@gmail.com>
Date: Thu, 24 Dec 2020 15:14:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201224062826.frppxddfinjomfui@vireshk-i7>
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

MjQuMTIuMjAyMCAwOToyOCwgVmlyZXNoIEt1bWFyINC/0LjRiNC10YI6Cj4gT24gMjMtMTItMjAs
IDIzOjM2LCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+IDIzLjEyLjIwMjAgMDc6MzQsIFZpcmVz
aCBLdW1hciDQv9C40YjQtdGCOgo+Pj4gT24gMjItMTItMjAsIDIyOjE5LCBEbWl0cnkgT3NpcGVu
a28gd3JvdGU6Cj4+Pj4gMjIuMTIuMjAyMCAxMjoxMiwgVmlyZXNoIEt1bWFyINC/0LjRiNC10YI6
Cj4+Pj4+IHJhdGUgd2lsbCBiZSAwIGZvciBib3RoIHRoZSBPUFBzIGhlcmUgaWYgcmF0ZV9ub3Rf
YXZhaWxhYmxlIGlzIHRydWUgYW5kIHNvIHRoaXMKPj4+Pj4gY2hhbmdlIHNob3VsZG4ndCBiZSBy
ZXF1aXJlZC4KPj4+Pgo+Pj4+IFRoZSByYXRlX25vdF9hdmFpbGFibGUgaXMgbmVnYXRlZCBpbiB0
aGUgY29uZGl0aW9uLiBUaGlzIGNoYW5nZSBpcwo+Pj4+IHJlcXVpcmVkIGJlY2F1c2UgYm90aCBy
YXRlcyBhcmUgMCBhbmQgdGhlbiB3ZSBzaG91bGQgcHJvY2VlZCB0byB0aGUKPj4+PiBsZXZlbHMg
Y29tcGFyaXNvbi4KPj4+Cj4+PiBXb24ndCB0aGF0IGhhcHBlbiB3aXRob3V0IHRoaXMgcGF0Y2gg
Pwo+Pgo+PiBObwo+IAo+IFRoaXMgaXMgaG93IHRoZSBjb2RlIGxvb2tzIGxpa2UgY3VycmVudGx5
Ogo+IAo+IGludCBfb3BwX2NvbXBhcmVfa2V5KHN0cnVjdCBkZXZfcG1fb3BwICpvcHAxLCBzdHJ1
Y3QgZGV2X3BtX29wcCAqb3BwMikKPiB7Cj4gCWlmIChvcHAxLT5yYXRlICE9IG9wcDItPnJhdGUp
Cj4gCQlyZXR1cm4gb3BwMS0+cmF0ZSA8IG9wcDItPnJhdGUgPyAtMSA6IDE7Cj4gCWlmIChvcHAx
LT5iYW5kd2lkdGggJiYgb3BwMi0+YmFuZHdpZHRoICYmCj4gCSAgICBvcHAxLT5iYW5kd2lkdGhb
MF0ucGVhayAhPSBvcHAyLT5iYW5kd2lkdGhbMF0ucGVhaykKPiAJCXJldHVybiBvcHAxLT5iYW5k
d2lkdGhbMF0ucGVhayA8IG9wcDItPmJhbmR3aWR0aFswXS5wZWFrID8gLTEgOiAxOwo+IAlpZiAo
b3BwMS0+bGV2ZWwgIT0gb3BwMi0+bGV2ZWwpCj4gCQlyZXR1cm4gb3BwMS0+bGV2ZWwgPCBvcHAy
LT5sZXZlbCA/IC0xIDogMTsKPiAJcmV0dXJuIDA7Cj4gfQo+IAo+IExldHMgY29uc2lkZXIgdGhl
IGNhc2UgeW91IGFyZSBmb2N1c3Npbmcgb24sIHdoZXJlIHJhdGUgaXMgMCBmb3IgYm90aCB0aGUg
T1BQcywKPiBiYW5kd2lkdGggaXNuJ3QgdGhlcmUgYW5kIHdlIHdhbnQgdG8gcnVuIHRoZSBsZXZl
bCBjb21wYXJpc29uIGhlcmUuCj4gCj4gU2luY2UgYm90aCB0aGUgcmF0ZXMgYXJlIDAsIChvcHAx
LT5yYXRlICE9IG9wcDItPnJhdGUpIHdpbGwgZmFpbCBhbmQgc28gd2Ugd2lsbAo+IG1vdmUgdG8g
YmFuZHdpZHRoIGNoZWNrIHdoaWNoIHdpbGwgZmFpbCB0b28uIEFuZCBzbyB3ZSB3aWxsIGdldCB0
byB0aGUgbGV2ZWwKPiBjb21wYXJpc29uLgo+IAo+IFdoYXQgYW0gSSBtaXNzaW5nIGhlcmUgPyBJ
IGFtIHN1cmUgdGhlcmUgaXMgc29tZXRoaW5nIGZvciBzdXJlIGFzIHlvdSB3b24ndCBoYXZlCj4g
bWlzc2VkIHRoaXMuLgo+IAoKQWgsIHlvdSdyZSByaWdodC4gSXQgd2FzIG1lIHdobyB3YXMgbWlz
c2luZyBzb21ldGhpbmcgYXMgSSBzZWUgbm93LAphZnRlciB0YWtpbmcgYSBjbG9zZXIgbG9vayBh
bmQgdHJ5aW5nIHRvIGltcGxlbWVudCB5b3VycyBzdWdnZXN0aW9uLCBteQpiYWQuIEknbGwgaW1w
cm92ZSB0aGlzIHBhdGNoIGluIHRoZSBuZXh0IHJldmlzaW9uLCB0aGFua3MhCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
