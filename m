Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5960E2E7F67
	for <lists+dri-devel@lfdr.de>; Thu, 31 Dec 2020 11:42:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F32F089B06;
	Thu, 31 Dec 2020 10:42:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E55788920D
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Dec 2020 14:56:32 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id b26so38141894lff.9
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Dec 2020 06:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0U/3l2R/FqwbzeCe0bIFbSAR6mJKbOIzSVkvfhl/Js8=;
 b=L5HLkr9WfhVAUPpunjEjaBQBUl1SlW/zUa5O1VDTRHUBdAxB+/HWrJ8GTcGCsF7mWO
 jel4JTGI4sJHATbOPY2XRlk82AhD92G5EShm59syyPsbyXRC6CAgoynITJGCI7+lFoOJ
 +dE+2O9gdBFrC94ljSMv9aR/2vIPUYsetKfpgKpwXYFulpQAA+rX0JUiL9MKb2gPS8g/
 a2Gyez6We5e3I87NlBGkD6YUnUjAnV246QogA89sf84uan1KmmQrFDut1Jl3FzZSqVeb
 j9F6Ep46eJ6oht7szUO90Kq+IKBdD8OA01xvHwsbL0aa7MlsihfPr64TIiKyPGupP+ed
 DINg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0U/3l2R/FqwbzeCe0bIFbSAR6mJKbOIzSVkvfhl/Js8=;
 b=Aq5a3QJIbgfIMOi8j5nuEUKaNSYJETXa4UYjWTzEX4n4KCMQsNQuKYGQHIu4p5EzQn
 VcCxw9aCQ4Ectjw+IlOlDBsxjwFQD6DPwFV0+AFnXMO/9D4rhPvKFkmclXjvJnpg9Q3H
 +YiXCldln6s2oN2pQVvToQwsxaDbmJ+LSQdqeXXIfF1YMftqNFVMOi7OYecrs+ic1pB2
 NjCuPanDNA3zGztl83jrMsrFuPQiuPrYPrzHHmSLFk2AcEbA3k0dLxt9XAPX7GrYE5+u
 W/G2vsN1XEX8RbG1PviXNADEoxNS1W37ID6MtoGQmgirBk1x08sCGSy1LSlfiQ26pSOw
 TaVA==
X-Gm-Message-State: AOAM531cCb1oDlx6x6j5yY9N5BtwC9virNjyrDGPVWpYlgCxGh8Lkwxx
 /72WKchrZWKZmmNrPKC1NeI=
X-Google-Smtp-Source: ABdhPJxdcNRH3UKPiAgxGLAONS9JS5ghRNZ2hrGFDfGyakfQGnF6WF4EeDtjyRL5+3uSyAGBKXvc5w==
X-Received: by 2002:a2e:b80c:: with SMTP id u12mr25529775ljo.490.1609340191355; 
 Wed, 30 Dec 2020 06:56:31 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.googlemail.com with ESMTPSA id u22sm4247296lfu.46.2020.12.30.06.56.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Dec 2020 06:56:30 -0800 (PST)
Subject: Re: [PATCH v2 23/48] soc/tegra: pmc: Pulse resets after removing
 power clamp
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Kevin Hilman <khilman@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-24-digetx@gmail.com>
Message-ID: <c21796c2-0278-66bc-5e68-cae03ca950ca@gmail.com>
Date: Wed, 30 Dec 2020 17:56:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201217180638.22748-24-digetx@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 31 Dec 2020 10:42:13 +0000
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
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTcuMTIuMjAyMCAyMTowNiwgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4gVGhlIEdSM0Qx
IGhhcmR3YXJlIHVuaXQgbmVlZHMgdG8gcHVsc2UgaGFyZHdhcmUgcmVzZXQgYWZ0ZXIgcmVtb3Zp
bmcgcG93ZXIKPiBjbGFtcCwgb3RoZXJ3aXNlIHJlc2V0IHdvbid0IGJlIGRlYXNzZXJ0ZWQuIEhl
bmNlIGdpdmUgcmVzZXQgYSBwdWxzZSBhZnRlcgo+IHJlbW92aW5nIHRoZSBjbGFtcC4gVGhpcyBz
dGF5ZWQgdW5ub3RpY2VkIHByZXZpb3VzbHkgYmVjYXVzZSBwb3dlcgo+IG1hbmFnZW1lbnQgd2Fz
bid0IHN1cHBvcnRlZCBieSB0aGUgM0QgZHJpdmVyIHVudGlsIHJlY2VudGx5IGFuZCBhbGwgcG93
ZXIKPiBnYXRlcyBhcmUgdXN1YWxseSB1bmdhdGVkIGFmdGVyIGJvb3Rsb2FkZXIgYnkgZGVmYXVs
dC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBnbWFpbC5jb20+
Cj4gLS0tCj4gIGRyaXZlcnMvc29jL3RlZ3JhL3BtYy5jIHwgOCArKysrKysrKwo+ICAxIGZpbGUg
Y2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc29jL3Rl
Z3JhL3BtYy5jIGIvZHJpdmVycy9zb2MvdGVncmEvcG1jLmMKPiBpbmRleCBmZDJiYTNjNTkxNzgu
Ljk4NTM3M2NlNTJiMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3NvYy90ZWdyYS9wbWMuYwo+ICsr
KyBiL2RyaXZlcnMvc29jL3RlZ3JhL3BtYy5jCj4gQEAgLTY1NCw2ICs2NTQsMTQgQEAgc3RhdGlj
IGludCB0ZWdyYV9wb3dlcmdhdGVfcG93ZXJfdXAoc3RydWN0IHRlZ3JhX3Bvd2VyZ2F0ZSAqcGcs
Cj4gIAo+ICAJdXNsZWVwX3JhbmdlKDEwLCAyMCk7Cj4gIAo+ICsJLyoKPiArCSAqIFNvbWUgaGFy
ZHdhcmUgYmxvY2tzIG1heSBuZWVkIGEgMC0+MS0+MCByZXNldCBwdWxzZSBpbiBvcmRlcgo+ICsJ
ICogdG8gcHJvcGFnYXRlIHRoZSByZXNldCwgVGVncmEzMCAzRDEgaXMgb25lIGV4YW1wbGUuCj4g
KwkgKi8KPiArCWVyciA9IHJlc2V0X2NvbnRyb2xfcmVzZXQocGctPnJlc2V0KTsKPiArCWlmIChl
cnIpCj4gKwkJZ290byBwb3dlcmdhdGVfb2ZmOwo+ICsKPiAgCWlmIChwZy0+cG1jLT5zb2MtPm5l
ZWRzX21iaXN0X3dhcikKPiAgCQllcnIgPSB0ZWdyYTIxMF9jbGtfaGFuZGxlX21iaXN0X3dhcihw
Zy0+aWQpOwo+ICAJaWYgKGVycikKPiAKCkFmdGVyIHNvbWUgbW9yZSB0ZXN0aW5nLCBJIGZvdW5k
IHRoYXQgM0QxIGlzIHJlc2V0IHByb3Blcmx5IGlmIGl0cwptZW1vcnkgY2xpZW50IGlzIHBsYWNl
ZCBpbiByZXNldCBiZWZvcmUgcG93ZXIgZG9tYWluIGlzIHR1cm5lZCBvZmYuIFRoZQptZW1vcnkg
Y2xpZW50IHJlc2V0dGluZyBpcyBjb21wbGV0ZWx5IG1pc3NlZCBpbiB2Mi4gSSdsbCBpbXByb3Zl
IGl0IGluCnYzIGFuZCB0aGVuIHRoaXMgUE1DIHdvcmthcm91bmQtcGF0Y2ggd29uJ3QgYmUgbmVl
ZGVkIGFueW1vcmUuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
