Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD64346703
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 18:57:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D32326EC77;
	Tue, 23 Mar 2021 17:57:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC4F66EC77
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 17:57:44 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id a1so26826634ljp.2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 10:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XLxTdLFQwwFdrnajKUv88Hjw3uCEQcJZ82QDErheT38=;
 b=vKLRoS37YEt73kxWpvOi12Ya1/JLN6HWmCTEYDGadUSpMiUfwkpR6cplisdJ5G0gOB
 IW2OFKz4c7uu/GWBwGamyUND6VBQSnPcCyGdSRq79trM1LuhP89ZbViMD3DN/8o0iBl4
 a5AIcWsEHnQRJHS2rlOikrg5Khn48nCjP5T9fdrZYDwEm7TzIcUzixeLdYIUxZoFICf7
 U8zXpkcd/Q5bagOJuaHTt4ptBjyX6u2Q7Z1EQY13biJz1WcujjhoOAFDNV8+nfRRmtki
 0i4mShKW3h6222+1zZqSwLStrzf9KH8CtCAirHFn6D8y21Bf3k6rO3HY/jgkYFYFs/Uu
 UAnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XLxTdLFQwwFdrnajKUv88Hjw3uCEQcJZ82QDErheT38=;
 b=RiZWYsPuUSsb+ZcXAlP8ki50TC5PTg2tMEuTDyRblfdqjb9MOKBnmHVG5yR6VtJVNg
 3WJ4CTfoy/zGMedrhg0zMPkUsAf0hdscarrtX+L6hwPQcm4P9md1T4RWtMdu4JvlU/am
 xJjSnPleaVBvagm7oy1oShv7UZUa7lsWMsVx/fUQkrz5Zq+ZpXFMQw2CZPzQ6dzGdlSt
 ttU1Mt2Bco5adIisVXtqo5yiJjvyCRLiHF+FfMT7AxdAhRpdWRanGVMrY7Dxy/9raT3+
 0m2GHKV7tUoBfU55wQGcMJgtgh5hjMwbTKFQ/JapSz0NLO1qIyQ1wFhr2XhWdkTfJLcw
 tXEw==
X-Gm-Message-State: AOAM530b6QauO6P3RItEkdVuLE+Eu3efoD3f5Nra1FbzM2fQY9bTrZlU
 R7fTBLhByLag1mPYCim91jk=
X-Google-Smtp-Source: ABdhPJwK3fQlVVk9I27uIymCqYnIErWow5dboq0PHU9jO11WR0Dp3DjLysQJxJifOlmFND5GyNc3xg==
X-Received: by 2002:a2e:140e:: with SMTP id u14mr3924997ljd.413.1616522263119; 
 Tue, 23 Mar 2021 10:57:43 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-60.dynamic.spd-mgts.ru.
 [109.252.193.60])
 by smtp.googlemail.com with ESMTPSA id t13sm1917433lfq.66.2021.03.23.10.57.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Mar 2021 10:57:42 -0700 (PDT)
Subject: Re: [PATCH 4/9] drm/tegra: dc: Implement hardware cursor on Tegra186
 and later
To: Thierry Reding <thierry.reding@gmail.com>
References: <20210323155437.513497-1-thierry.reding@gmail.com>
 <20210323155437.513497-5-thierry.reding@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <454aea05-ee94-5789-2cab-513342cf7614@gmail.com>
Date: Tue, 23 Mar 2021 20:57:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210323155437.513497-5-thierry.reding@gmail.com>
Content-Language: en-US
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
Cc: David Airlie <airlied@linux.ie>, linux-tegra@vger.kernel.org,
 James Jones <jajones@nvidia.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjMuMDMuMjAyMSAxODo1NCwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPiBAQCAtOTIwLDE1
ICs5MzQsNDIgQEAgc3RhdGljIHZvaWQgdGVncmFfY3Vyc29yX2F0b21pY191cGRhdGUoc3RydWN0
IGRybV9wbGFuZSAqcGxhbmUsCj4gIAl2YWx1ZSA9IHRlZ3JhX2RjX3JlYWRsKGRjLCBEQ19ESVNQ
X0JMRU5EX0NVUlNPUl9DT05UUk9MKTsKPiAgCXZhbHVlICY9IH5DVVJTT1JfRFNUX0JMRU5EX01B
U0s7Cj4gIAl2YWx1ZSAmPSB+Q1VSU09SX1NSQ19CTEVORF9NQVNLOwo+IC0JdmFsdWUgfD0gQ1VS
U09SX01PREVfTk9STUFMOwo+ICsKPiArCWlmIChkYy0+c29jLT5oYXNfbnZkaXNwbGF5KQo+ICsJ
CXZhbHVlICY9IH5DVVJTT1JfQ09NUE9TSVRJT05fTU9ERV9YT1I7Cj4gKwllbHNlCj4gKwkJdmFs
dWUgfD0gQ1VSU09SX01PREVfTk9STUFMOwo+ICsKPiAgCXZhbHVlIHw9IENVUlNPUl9EU1RfQkxF
TkRfTkVHX0sxX1RJTUVTX1NSQzsKPiAgCXZhbHVlIHw9IENVUlNPUl9TUkNfQkxFTkRfSzFfVElN
RVNfU1JDOwo+ICAJdmFsdWUgfD0gQ1VSU09SX0FMUEhBOwo+ICAJdGVncmFfZGNfd3JpdGVsKGRj
LCB2YWx1ZSwgRENfRElTUF9CTEVORF9DVVJTT1JfQ09OVFJPTCk7Cj4gIAo+ICsJLyogbnZkaXNw
bGF5IHJlbGllcyBvbiBzb2Z0d2FyZSBmb3IgY2xpcHBpbmcgKi8KPiArCWlmIChkYy0+c29jLT5o
YXNfbnZkaXNwbGF5KSB7CgpCdXQgY29vcmRpbmF0ZXMgYWxyZWFkeSBzaG91bGQgYmUgY2xpcHBl
ZCBieQpkcm1fYXRvbWljX2hlbHBlcl9jaGVja19wbGFuZV9zdGF0ZSgpLgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
