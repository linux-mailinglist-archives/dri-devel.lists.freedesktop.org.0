Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB0C303814
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jan 2021 09:38:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 970A86E444;
	Tue, 26 Jan 2021 08:38:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D53289A74
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 17:35:41 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id f11so16277786ljm.8
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 09:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=X83exQMOztH+V+6RKs+mLlDQ2mY3VBp/sSkBeCvqfIU=;
 b=dLDEE8ucdkDxl02KcwK9VxrydqBs7/Gis+S8JTrtOAWFi/WQ2uKwoU9Q0n56+15h3r
 aSmNSI9G8hFoxk3YQzFpVCI91y3DmPL9XgJIAq2g8j8j/jAbsIBrc+F7ulOCS37nbQYg
 9eYqthPf3ryUCi+MAYFY95WB5+VwYW1jbRrEAws9sQqTSH0R7F02CWQUp49KY0XgmQ3r
 PnohwYm4UdmIk6r+10eX+zdGXovwmpCQnmOlptiCJ3Q5Fz5PKe4GvpHik/geDbusdCzI
 jgfu6fd5aN08FVFs61+LacwrLE9YKq2SdzhzNugkfes6z/UJsgyZ3fanyZlI/uWQ/A3c
 fPjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=X83exQMOztH+V+6RKs+mLlDQ2mY3VBp/sSkBeCvqfIU=;
 b=ekGiOTBGKKRZTx1i4nI7dmLg1MKycDBfsojq/4lysSwTZ2xrI6I7RX+xKozNujrhZV
 4p3bmPUJq4agQaQJIucINnehsmxc1CCnhjDVHqDwJ4hi6DYvZq7YnnS6+YQGb13qaEjA
 Vc0ATfWB90nGL0UoIsDyl8MGtVuj3DdxgxJb60jarETh+AhhTmODJ1jg2YF1C6ZFRyrN
 rlysfCQrjJQG4XqF0hWHxRDAcFTbdxGswCwuY9oZ3olO6SZItqqZ0UE/gcR6x+je56BR
 Xt+TZOcPBxPjEANUlcyllsJHFBIS+lK9XGFXsEjA58U3ih8FBaAjlADl0MkxzqzGoFb6
 Vykg==
X-Gm-Message-State: AOAM53314Hm99h8MgeO9W/nTXNYCb51juPsY4iUo5dfkkhAm87r56aYU
 ERzJYKK+MdmL4IG3YCc9vWQ+wMCTp/Q=
X-Google-Smtp-Source: ABdhPJwrVRjKISUhGPG51fA4v6H3gH94RDNCwsh4GjGzdQwUIMcUpp8sUecuEHv6y7+L/VWT8pXIyA==
X-Received: by 2002:a2e:8059:: with SMTP id p25mr682526ljg.155.1611596139799; 
 Mon, 25 Jan 2021 09:35:39 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.googlemail.com with ESMTPSA id j2sm2023879lfe.134.2021.01.25.09.35.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jan 2021 09:35:39 -0800 (PST)
Subject: Re: [PATCH v12 4/5] drm/tegra: dc: Support memory bandwidth management
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>,
 Viresh Kumar <vireshk@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
References: <20201228154920.18846-1-digetx@gmail.com>
 <20201228154920.18846-5-digetx@gmail.com>
Message-ID: <f19789d5-fdf2-8cae-9b54-db885873032a@gmail.com>
Date: Mon, 25 Jan 2021 20:35:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201228154920.18846-5-digetx@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 26 Jan 2021 08:37:37 +0000
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
Cc: linux-tegra@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjguMTIuMjAyMCAxODo0OSwgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4gRGlzcGxheSBj
b250cm9sbGVyIChEQykgcGVyZm9ybXMgaXNvY2hyb25vdXMgbWVtb3J5IHRyYW5zZmVycywgYW5k
IHRodXMsCj4gaGFzIGEgcmVxdWlyZW1lbnQgZm9yIGEgbWluaW11bSBtZW1vcnkgYmFuZHdpZHRo
IHRoYXQgc2hhbGwgYmUgZnVsZmlsbGVkLAo+IG90aGVyd2lzZSBmcmFtZWJ1ZmZlciBkYXRhIGNh
bid0IGJlIGZldGNoZWQgZmFzdCBlbm91Z2ggYW5kIHRoaXMgcmVzdWx0cwo+IGluIGEgREMncyBk
YXRhLUZJRk8gdW5kZXJmbG93IHRoYXQgZm9sbG93cyBieSBhIHZpc3VhbCBjb3JydXB0aW9uLgo+
IAo+IFRoZSBNZW1vcnkgQ29udHJvbGxlciBkcml2ZXJzIHByb3ZpZGUgZmFjaWxpdHkgZm9yIG1l
bW9yeSBiYW5kd2lkdGgKPiBtYW5hZ2VtZW50IHZpYSBpbnRlcmNvbm5lY3QgQVBJLiBMZXQncyB3
aXJlIHVwIHRoZSBpbnRlcmNvbm5lY3QgQVBJCj4gc3VwcG9ydCB0byB0aGUgREMgZHJpdmVyIGlu
IG9yZGVyIHRvIGZpeCB0aGUgZGlzdG9ydGVkIGRpc3BsYXkgb3V0cHV0Cj4gb24gVDMwIE91eWEs
IFQxMjQgVEsxIGFuZCBvdGhlciBUZWdyYSBkZXZpY2VzLgo+IAo+IFRlc3RlZC1ieTogUGV0ZXIg
R2VpcyA8cGd3aXBlb3V0QGdtYWlsLmNvbT4KPiBUZXN0ZWQtYnk6IE5pY29sYXMgQ2hhdXZldCA8
a3dpemFydEBnbWFpbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogRG1pdHJ5IE9zaXBlbmtvIDxkaWdl
dHhAZ21haWwuY29tPgo+IC0tLQoKVGhpZXJyeSwgSSdtIGxvb2tpbmcgZm9yd2FyZCB0byB5b3Vy
cyByZXZpZXcuIE9ubHkgRFJNIHBhdGNoZXMgYXJlIGxlZnQKdW5tZXJnZWQgeWV0IGluIHRoaXMg
c2VyaWVzLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
