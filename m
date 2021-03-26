Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F71534AEA3
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 19:31:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 906086F473;
	Fri, 26 Mar 2021 18:31:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E77F6F473
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 18:31:48 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id u10so8491756lju.7
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 11:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=b2f3xr/E6w81sQbdXcFGqRZ/LRTr2HKluT/8xyuicEY=;
 b=anBDIsvJQaiW+vBb4EedAzxD90CO27pMMbFt18tJUd3w/p4gpHowiPFYUQylyz5e0j
 FPcsf62mER1pt3M/jRHlMADhkkwLva/gUotioijOddK5duFIBfFXIXGBPcCLy+5Uqi3X
 FhNYGSArDtm3UV1sl83S+7qo+2sc4IBzYipF+dEM1q/Rq4pzBaJJgLITcuFb0sgXMVQa
 BpV55ITkYQpN6Txbpw0DvCGQxdoNKcaPbVk4ZeG6znhLnvczGQg39DJBdY12WJSUznmX
 6dDZ8f70loqHAoWh4tuepJQ+igWmvKW5+2YE6zDvXokj3MDtmmFK49zPeyZKqvcxiUes
 Bs0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=b2f3xr/E6w81sQbdXcFGqRZ/LRTr2HKluT/8xyuicEY=;
 b=r72t9yqZQ+4DdY9ktznor+TbAGqQBMsHKIcGmojJcn857vFHqydraZVuFmJggd2Gsa
 mf+tnHrONF9w0FUTe9EYmeRV+UxGcGLaJiJFinVG2pR4W8ruzCqrHOJnb8nWcvbanRcc
 j9OQT2MSoQvim1zfSnybbbGWf1GXcMn3mEFTKCJVlzgpv2cX/Peo/wRgQIbh/Wzvev7c
 8DvvhMPHmzgpBAquXSMMvl8CH/+Xw+mGGngIbAYOP7c8+rNrdZunMeZBsEq1vN36qYul
 dSJbvqqDFgQ+Mj+7/HolsS7WZeJnWQ9wMVFzJp4SPYoCB/JuRpUqN+oLVJ3Nrc3KGkj0
 eYCw==
X-Gm-Message-State: AOAM533n8HdbIYDDMlO0EK2uMHmXRWDTL9buFJsHFRdyz74Ly7B429hP
 ZYQ6bGMuCvC4h8TttXKtopg=
X-Google-Smtp-Source: ABdhPJy289DCEIf8dD3WRBerWrKHG0ziMy/geZZWJ162h8jJ8f6SvLDejcO0WbSIVaEU2VOrnuVTnw==
X-Received: by 2002:a2e:b814:: with SMTP id u20mr9662743ljo.370.1616783506900; 
 Fri, 26 Mar 2021 11:31:46 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-60.dynamic.spd-mgts.ru.
 [109.252.193.60])
 by smtp.googlemail.com with ESMTPSA id g9sm938729lfc.258.2021.03.26.11.31.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Mar 2021 11:31:46 -0700 (PDT)
Subject: Re: [PATCH v5 01/21] gpu: host1x: Use different lock classes for each
 client
To: Mikko Perttunen <cyndis@kapsi.fi>, Mikko Perttunen
 <mperttunen@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-2-mperttunen@nvidia.com>
 <YFitsk3I2l7IBnLR@orome.fritz.box>
 <6615105f-ccf1-7833-512c-090817c47952@gmail.com>
 <645366c2-c500-efcc-f44c-b933f6f470c4@nvidia.com>
 <0fb1b458-66bb-c9d8-04c7-174165b39811@kapsi.fi>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <222f5544-6710-c931-5992-7ac11e440042@gmail.com>
Date: Fri, 26 Mar 2021 21:31:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <0fb1b458-66bb-c9d8-04c7-174165b39811@kapsi.fi>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, jonathanh@nvidia.com,
 talho@nvidia.com, bhuntsman@nvidia.com, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjYuMDMuMjAyMSAxNzo1NCwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4gCj4gTG9ja2Rl
cCBkb2Vzbid0IHNlZW0gdG8gYmUgbGlraW5nIGRldl9uYW1lKCkgZm9yIHRoZSBuYW1lLCBhbmQg
SSB0aGluawo+IGFsbG9jYXRpbmcgYSBzdHJpbmcgZm9yIHRoaXMgcHVycG9zZSBzZWVtcyBhIGJp
dCBvdmVya2lsbCwgc28gSSdsbCBrZWVwCj4gdGhlIGxvY2sgbmFtZSBhcyBpcyBpZiB0aGVyZSBh
cmUgbm8gb2JqZWN0aW9ucy4KCldoYXQgZG9lcyAibGlraW5nIiBtZWFuPwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
