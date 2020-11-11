Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5682B00FA
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 09:16:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB5E16E185;
	Thu, 12 Nov 2020 08:15:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABC7E89E47
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 09:01:48 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id r9so2113572lfn.11
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 01:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dF1XDJ7ZODBxc6x3qPKL/KXM2fUXOq3zx9bPFuRUXO4=;
 b=Okv7oV92Vzop5e10q4xGtyON8UStnGOatV7C6Rc1rswtvL8Mhvbx7aaT1jngShXIHC
 Osz6VLgrGitnho0/V3S1MlvG0Qqar+FgDTzgtlI6P6H9SrP/1XEUoW2sn1AbHotu/J5g
 gQY9PXvceBWtVpemh1+D95K+cGYUZ3Nx/zY1ZNQytZ+DqlH/VUFv6E9LcpD2cQVahn1y
 ZCbVvr3ReZIJb07NtKjo1veri8UhTMBeV2CtHwKGljl8RwjWZmaCqckVwVF2g8Z6K/Ue
 Pt+QrfQpyYF81qUGAm+rEy7pgm/uAP934PYsV7c0GekE16eJzHBdYXzYrMaIeG507054
 ry4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dF1XDJ7ZODBxc6x3qPKL/KXM2fUXOq3zx9bPFuRUXO4=;
 b=nePAb67MFGeUOJRGpjFMox2uoAUhJAjj6i8XXRmE2jRPOGLCFcadTqEss4BoIG7iSE
 7KcXwfUaR6mlh7LOvJenTR0qef7ah39++81CZL731GkOAfFgi11TwkaYoINAmg8DldNT
 I+HXrGk5euGKzFyRcZxRb1JFjq6SCFvWZCJQ/12zjK5k0C0rsJ7HhvKJVr3GNTbs1wt+
 on86N9c+8KocTVedP9CImPhCyM5CVvlPt6BoTMbQ32qR/TeGknVL6UDvx24vqBx11S5M
 bBiZOUckFit3ViObjLY/GPLSwLROymw08cdNO946UaOIZCukaDqi0+CowVswHPhrYVMm
 wezQ==
X-Gm-Message-State: AOAM531TB0eN0rhHytxHhov+ymZA9XEW1pWyGdX6Hw7xefMwCjTFkJ95
 OnFnlFnN7d7whi3euO8qqC3RqIoy8Rk=
X-Google-Smtp-Source: ABdhPJz6z3fUroQjNCVUQQmKeJpEYmQgvxFXJUBP4BbdvF5B4gMgXPhnWK/hACZZS1Hc4HkkoiMbAA==
X-Received: by 2002:ac2:43cf:: with SMTP id u15mr2352182lfl.382.1605085306963; 
 Wed, 11 Nov 2020 01:01:46 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.googlemail.com with ESMTPSA id o7sm163393ljg.41.2020.11.11.01.01.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2020 01:01:46 -0800 (PST)
Subject: Re: [PATCH v8 10/26] memory: tegra30-emc: Factor out clk
 initialization
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20201111011456.7875-1-digetx@gmail.com>
 <20201111011456.7875-11-digetx@gmail.com> <20201111085115.GA4050@kozik-lap>
 <20201111085250.GA11589@kozik-lap>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <0b9fd887-fd57-f948-19b0-d629ed4aa2e7@gmail.com>
Date: Wed, 11 Nov 2020 12:01:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201111085250.GA11589@kozik-lap>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 12 Nov 2020 08:15:51 +0000
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
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <cyndis@kapsi.fi>, dri-devel@lists.freedesktop.org,
 Nicolas Chauvet <kwizart@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTEuMTEuMjAyMCAxMTo1MiwgS3J6eXN6dG9mIEtvemxvd3NraSDQv9C40YjQtdGCOgo+PiBZb3Ug
YWRkZWQgdGhpcyBjb2RlIGluIHBhdGNoICM4LCBzbyBhZGRpbmctYW5kLXJlbW92aW5nIGEgcGll
Y2Ugb2YgY29kZQo+IENvcnJlY3Rpb246IHlvdSBhZGRlZCB0aGlzIGluIHBhdGNoICM5Lgo+IAo+
IEJlc3QgcmVnYXJkcywKPiBLcnp5c3p0b2YKPiAKPiAKPj4gaXMgYSBuaWNlIGhpbnQgdGhhdCB0
aGlzIHBhdGNoIHNob3VsZCBiZSBiZWZvcmUuIERvbid0IGFkZCBuZXcgY29kZQo+PiB3aGljaCBs
YXRlciB5b3Ugc2ltcGxpZnkuIE1vdmUgYWxsIGJ1Z2ZpeGVzIGFuZCBhbGwgc2ltcGxpZmljYXRp
b25zIHRvCj4+IGJlZ2lubmluZyBvZiBwYXRjaHNldC4KPj4KPj4gVGhhdCdzIHF1aXRlIHNpbWls
YXIgY2FzZSB0byB2NiB3aGVyZSB5b3UgcHV0IGJ1Z2ZpeGVzIGluIHRoZSBtaWRkbGUKPj4gb2Yg
cGF0Y2hzZXQuCj4+CgpJbmRlZWQsIEkgc3F1YXNoZWQgYSBzaW1pbGFyIGNoYW5nZSBpbiB0aGUg
VDEyNCBwYXRjaCAjMTMsIGJ1dCBmb3Jnb3QgdG8Kc3F1YXNoIGl0IGZvciB0aGUgVDMwLgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
