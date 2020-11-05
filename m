Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FA22A9154
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 09:34:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B8C66EA71;
	Fri,  6 Nov 2020 08:34:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D07636ED64
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 17:54:51 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id 126so3559869lfi.8
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 09:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gA6OLdD6ilrl1MlK7OiJsrdds83PpowmxPmjVFzKPLU=;
 b=XXHF9HTK2ugJChM+FIFMCW2E53QGEH1yguNWVVsZT4/1tb/wA72NsMDzQdgSY44iRC
 mV3oLf1MLXH5haz2YuP1CDRT8aUuzPTl7F2/RMHftpwIeYEBCAs3NG+BR4dNeGs187mI
 XbuGXQroBJTTOWAvgupbT5YRyuuxAIsIhg4fLFlZAAdVH++d1JBlqRiVgDhJ8kvrw9/J
 CoeoXoFGkh8y4iwGjCRTehbz/gI/F1PorRz0eVlctXoG9S08Uk7T6RBaUSdPCHSWuFmU
 /CTWZV/yrLcMfC8ZqzKcUNZKBSSDhWAWRgAsWN1XiInqnWC0QIShxySn34YF6hnFOplx
 3LEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gA6OLdD6ilrl1MlK7OiJsrdds83PpowmxPmjVFzKPLU=;
 b=ePak25IQzZrcjoS7rAiLbnGrpZzrrPgFFYsZ6t07IBeOEW9nkJQnCH6eHf36rEinw2
 MrtX3+Vy+sebOQl16v/iDEUyhI1nHZdE06mfQG7xttQ3HxCDmWIBXuSq3Bn9wsVuC91t
 OP+ioLi5OyosEFFDjMWQYutBcBWHkatcY7cXCGzRmol/UsNug+BVKldoFl0EWHlG8TPG
 Um16LANOywPmR0PSGJJPV8z8SbjizvYNL0mTdNuz6LOKhb585ugMXQOjz8orIVg7iyAQ
 Q0fURzxm2AWeKlTMtnBaQ05d4VMnl/HyRr7OEHTmTg6c2BI+dOukM8MoRkOC9kNY6WET
 f53A==
X-Gm-Message-State: AOAM533K5jtaPVYg3SuR7k5VoxdWZL3FCrc+91oYql4LypbR27mc+irx
 apgoKFd7D7sMrLqa8RUDU/o=
X-Google-Smtp-Source: ABdhPJyehz6KeITPmKFKw6lYd3zXe4BcIJiDjnQqHKJZPRp9Z41GNG8/Y3X7JzcgSQn251Z5j8SlyQ==
X-Received: by 2002:a19:4206:: with SMTP id p6mr1372241lfa.151.1604598890223; 
 Thu, 05 Nov 2020 09:54:50 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-83.dynamic.spd-mgts.ru.
 [109.252.192.83])
 by smtp.googlemail.com with ESMTPSA id v20sm248899lfd.178.2020.11.05.09.54.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2020 09:54:49 -0800 (PST)
Subject: Re: [PATCH v1 21/30] usb: host: ehci-tegra: Support OPP and SoC core
 voltage scaling
To: Alan Stern <stern@rowland.harvard.edu>
References: <20201104234427.26477-1-digetx@gmail.com>
 <20201104234427.26477-22-digetx@gmail.com>
 <20201105160743.GA1613614@rowland.harvard.edu>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <cbc6bf1f-eccb-dee5-d2aa-2c60f1d365e2@gmail.com>
Date: Thu, 5 Nov 2020 20:54:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201105160743.GA1613614@rowland.harvard.edu>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 06 Nov 2020 08:34:42 +0000
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
Cc: Peter Chen <Peter.Chen@nxp.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org,
 Adrian Hunter <adrian.hunter@intel.com>, devicetree@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, devel@driverdev.osuosl.org,
 linux-samsung-soc@vger.kernel.org, Nicolas Chauvet <kwizart@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-media@vger.kernel.org, linux-pwm@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDUuMTEuMjAyMCAxOTowNywgQWxhbiBTdGVybiDQv9C40YjQtdGCOgo+IERvIHlvdSByZWFsbHkg
d2FudCB0byB1c2UgdGhlIHNhbWUgZXJyb3IgdW53aW5kaW5nIGZvciBvcHBfdGFibGUgdmFsdWVz
IAo+IG9idGFpbmVkIGZyb20gZGV2X3BtX29wcF9zZXRfcmVndWxhdG9ycygpIGFzIGZyb20gCj4g
ZGV2X3BtX29wcF9nZXRfb3BwX3RhYmxlKCk/CgpUaGV5IGJvdGggYXJlIHBvaW50aW5nIGF0IHRo
ZSBzYW1lIG9wcF90YWJsZSwgd2hpY2ggaXMgcmVmY291bnRlZC4KClRoZSBkZXZfcG1fb3BwX3Nl
dF9yZWd1bGF0b3JzKCkgaXMgZGV2X3BtX29wcF9nZXRfb3BwX3RhYmxlKCkgKyBpdCBzZXRzCnJl
Z3VsYXRvciBmb3IgdGhlIHRhYmxlLgoKaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgv
djUuMTAtcmMyL3NvdXJjZS9kcml2ZXJzL29wcC9jb3JlLmMjTDE3NTYKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
