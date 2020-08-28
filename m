Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A81E225665E
	for <lists+dri-devel@lfdr.de>; Sat, 29 Aug 2020 11:22:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CD8E6EC14;
	Sat, 29 Aug 2020 09:22:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54E4F89AAD
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 08:30:28 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id k10so277126lfm.5
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 01:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LflMgJmibSpFeOHc4WL2YJ+POCyG0pEvbGVH5SBOv0E=;
 b=sdCwCAI9GltezF0rEB2fLfVxKx/8qRdfoKbbiRoFKxvVCYIkR3/N1t+zeTEEbig46m
 +Kyj/BDTYw6OGVtSPlqNjGOO+fv9AYhJPWBogZ4zZlmC2yxHp+dH2Ko7FVvt1wfQtAEJ
 C3EGMetrjmTC/sV3gobl9IyF5UkoeKSYqq3m2hVHVbaEPYOGuzFFd5jgWMxslMdgQGer
 9+UFDbyhkm+yhdM7yCy9ywuHycOSmJv+CRYhHhUfXf/FoN7mgRZ9eqL8dvW5VmgrW/Oe
 mvL9YOYm9HUrthueMnVNdX9U8x9oc0gEqLz7mTAFACitArMxyd1dGhLSQEfC89ew0Qql
 tX3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LflMgJmibSpFeOHc4WL2YJ+POCyG0pEvbGVH5SBOv0E=;
 b=a/AsGrcTAksaKHATkc6hiY3kHDkTyEHOHaPhQ8B6XymWs+s6xtBTM6GxXUGSDtve5N
 4YfDzGMUcCWQ9CUUvAv37GNtFonh53rfpbEL7UldauLtdZee9FXEPHHtuO8i7Ilvme5B
 juwhHgPsJCqeEgizosOCZToP2qS82L0y+N7Y3W7nLRfBgJNrwfytUkgoQTbDusJyEhAF
 zh3lFITyhdqYRwLUeOD1KoXeqLRJJTAWbCNU+gwqR6AUCZHYezpXbDQmcTv7sesThGaj
 QiVHYCFoh4VbqxHp6RtRvG57taHVZIqM+j5QjdVuY4K+tiflmwGHLpyLf126wRA/OyY/
 waag==
X-Gm-Message-State: AOAM533QvJ9MI8XsD+kaNUpVeU9VMNvZaaPRX6vjQ00C91MNOA/+tR+H
 Pl7mEVn4KZ4QKf/QrcqXOAo=
X-Google-Smtp-Source: ABdhPJzLnvqVFe/sNW/j+lmpEBM4x5/CZ5x6tV+zcsDznlhemeqh60v+eDDBRVDdroYZaI53iNUCkA==
X-Received: by 2002:a19:24c2:: with SMTP id k185mr276673lfk.120.1598603426636; 
 Fri, 28 Aug 2020 01:30:26 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.googlemail.com with ESMTPSA id h6sm130676lfc.84.2020.08.28.01.30.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2020 01:30:25 -0700 (PDT)
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
 <1de8aa41-8001-cf46-026c-b00f8df0b9a3@gmail.com>
 <2a255211-5426-d78f-d266-cdb958f4c658@samsung.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a11d60af-3a67-6a76-57ae-7cb9bad13bed@gmail.com>
Date: Fri, 28 Aug 2020 11:30:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2a255211-5426-d78f-d266-cdb958f4c658@samsung.com>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 29 Aug 2020 09:21:18 +0000
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

MjguMDguMjAyMCAwNDo0NywgQ2hhbndvbyBDaG9pINC/0LjRiNC10YI6Cj4gSGksCi4uLgo+PiBI
ZW5jZSB0aGUgTlVMTC1jaGVja2luZyBpcyB1bm5lY2Vzc2FyeS4KPj4KPj4gV2hlbiBJIGZpcnN0
IGVuY291bnRlcmVkIHRoZSBvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEoKSwgSSB3YXMgYWxzbwo+
PiB0aGlua2luZyB0aGF0IGFkZGluZyB0aGUgTlVMTC1jaGVja3MgaXMgYSBnb29kIGlkZWEsIGJ1
dCBsYXRlciBvbgo+PiBzb21lYm9keSBwb2ludGVkIG91dCB0byBtZSAobWF5YmUgVGhpZXJyeSkg
dGhhdCBpdCdzIHVubmVjZXNzYXJ5IHRvIGRvLgo+IAo+IE9LLiBUaGFua3MuCj4gCj4+Cj4+Pj4g
Kwo+Pj4+ICsJbWMgPSB0ZWdyYV9nZXRfbWVtb3J5X2NvbnRyb2xsZXIoc29jX2RhdGEtPm1jX2Nv
bXBhdGlibGUpOwo+Pj4+ICsJaWYgKElTX0VSUihtYykpCj4+Pj4gKwkJcmV0dXJuIFBUUl9FUlIo
bWMpOwo+Pj4KPj4+IFlvdSBiZXR0ZXIgdG8gYWRkIGVycm9yIGxvZy4KPj4KPj4gSW4gcHJhY3Rp
Y2Ugd2Ugc2hvdWxkIGdldCBvbmx5IC1FUFJPQkVfREVGRVIgaGVyZSBldmVyLiBJJ2xsIGNvbnNp
ZGVyCj4+IGFkZGluZyB0aGUgbWVzc2FnZSBpbiB0aGUgbmV4dCByZXZpc2lvbiwgYXQgbGVhc3Qg
anVzdCBmb3IgY29uc2lzdGVuY3kuCj4gCj4gSW4gb3JkZXIgdG8gaGFuZGxlIC1FUFJPQkVfREVG
RVIsIHJlY29tbWVuZCB0aGUgdXNpbmcgb2YgZGV2X2Vycl9wcm9iZSgpLgoKSGVsbG8sIENoYW53
b28hCgpUaGFuayB5b3UgZm9yIHRoZSBzdWdnZXN0aW9uISBJIHdhc24ndCBhd2FyZSBhYm91dCB0
aGUgZGV2X2Vycl9wcm9iZSgpCnVudGlsIHJlY2VudGx5IGFuZCB3aWxsIHVzZSB0aGlzIG5ldyBo
ZWxwZXIgaW4gdGhlIHY2IQoKVGhhbmtzIQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
