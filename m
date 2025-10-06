Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0C6BBFB8B
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 00:44:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34DA210E167;
	Mon,  6 Oct 2025 22:44:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gIK75P3O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A242810E409
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 13:49:54 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-71d6051aeafso52084237b3.2
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 06:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759758594; x=1760363394; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=naBllE4IE535a1UhrtE/NG5vtCFsBFvSt2Qvtj+AiGw=;
 b=gIK75P3OAx5O6fuQl4eqDJZqarZpAz5TP1er8YhnnDomyEWJdezSDhqac+xw8KyvlR
 D5WJcPwANKgSvR1kNqUe3Uzdwey6OD0Eu6RYVm5nmNOr5g9crbZIocVuuiucMs3AGWuQ
 NbR90F6EjIKLcx1CymFROo3W5XWw4CH/JaZd+WpeqQdLT+ghixjc+1D+dSN9IjuKpMwz
 vas5ZHf8TpZ5y687n737Wdq4zte7KPghkobPBSyLamUKFXqxd+wQ/DkuDpk18KqlrQEG
 3KaS0+KuqSKIYJQuQWb2NwzyjA2U4ywbGDNjzWAELPqWVfdq3I09ZCpC9EV61/JJVSPm
 GwhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759758594; x=1760363394;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=naBllE4IE535a1UhrtE/NG5vtCFsBFvSt2Qvtj+AiGw=;
 b=Js+jI5wkWuGhFuIzpvFa0cUkz2YeXTo5ARdEUARCAiZtP5XlB5+4yK/HpsGHprvKkd
 jpIoXxr0yy5o8DvFUivzUHOC3RAbyMr5X3GuHduk5z6eMoikS75DqibLzViugdh92imN
 pwNQ1C8t2Wa4rqTvP4DsQ739rnwcqnjePDG/EXXTgy4wMl6UqHzEQWuBE9EHr6fUKZSO
 m5pMzWoa2A8os4ageZYSL71aITuWtmOIM8gxV4C7ms7Uxfh6adrLuyJ9XipOl5G5Nd4m
 y32m9dxmXNuuFPXSYHmj1n5Z6SM1MOFFsrOPZsjW4Jv2ubS4ckpIlnlmWSDa3cSNzner
 U4/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUB7RMGSueO0kkyJ54nbMJy2vH1YDRhKc26GtZtG6GNZGHvT9XK2YyZ+RjomTYExiCsBAljqtzNJZA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZ/g6UrHRMT4mPrXiS+uXlyOiFkcqX0Xkcm2iT3g0jL1JpKWiv
 Z2bZGqY6VImKNTWR2BTPrB0eaH5Jo4+a8eeDQcUoSwe/0LhYrGcnPAdQ
X-Gm-Gg: ASbGncvptpn82owlZqEvsnzTfUyHX0/vB/Kk68JEKGV5n0rTt8XgO6uOgl7cRAiqwXu
 2jD/5uGfgyxRIMsFX/f1CvBJvrdbSnZHSO5+K3OPPP5UsQE0izFOliRHBmpznrfCaSbOncMNj4C
 RegMJ8i1VfpwlMWmUL1rcQ0vJOPkl/L9r9se0L+x6PY/0OwSDJwg7AsdUT0NmV/1L9I533O1PuZ
 u/18rAvMWsxjkWst0ilz+hvEIQcVaqEqMxqWeQ30kYbEVGoM+Kxo0ednCefhf3OCd9+KXLdLdsG
 RwjbMBJv21EM+RGLvrcdxsoiaCQ8u8vCdry8zn5IPPGbX+qSxPODby4NraycVC9tHKlgUjq61jQ
 LrfSjv1bJt6j775vk8KYt4FvJgZsQKci//n+5sqqFmulFdlWz2O83eVtVI1GvCTwxUqyt3bLvBB
 lf/vnpBspHUsNd8M/2+8eB1iaAi9HCDA==
X-Google-Smtp-Source: AGHT+IF95I/GWMOy7K0yQH9P573Gh61Ga6VWxZPEu4GIRjFsPKAyfm6hJudD/c1aH+Spd7nOuM10XA==
X-Received: by 2002:a05:690c:f8f:b0:731:76db:a5e0 with SMTP id
 00721157ae682-77f946a89e6mr163041287b3.25.1759758593563; 
 Mon, 06 Oct 2025 06:49:53 -0700 (PDT)
Received: from ?IPV6:2600:1700:6165:1c10:83e:4131:1b09:7d81?
 ([2600:1700:6165:1c10:83e:4131:1b09:7d81])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-77fa19a7d6asm27562527b3.55.2025.10.06.06.49.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Oct 2025 06:49:53 -0700 (PDT)
Message-ID: <51030f00-48c6-49b6-a4be-0b4e238f71bd@gmail.com>
Date: Mon, 6 Oct 2025 09:49:48 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: udlfb: make CONFIG_FB_DEVICE optional
To: sukrut heroorkar <hsukrut3@gmail.com>
Cc: kernel test robot <lkp@intel.com>, Helge Deller <deller@gmx.de>,
 Bernie Thompson <bernie@plugable.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Randy Dunlap <rdunlap@infradead.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Zsolt Kajtar <soci@c64.rulez.org>,
 Gonzalo Silvalde Blanco <gonzalo.silvalde@gmail.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, skhan@linuxfoundation.org
References: <20250924175743.6790-1-hsukrut3@gmail.com>
 <202509272320.3K8kdDCw-lkp@intel.com>
 <bb9d90ca-aa4d-4168-bdc5-543109c74493@gmail.com>
 <CAHCkknrZ-ieNKeg-aj3-NVqgGSk770jJpUpCvn_SuffkPu+ZrQ@mail.gmail.com>
Content-Language: en-US
From: David Hunter <david.hunter.linux@gmail.com>
In-Reply-To: <CAHCkknrZ-ieNKeg-aj3-NVqgGSk770jJpUpCvn_SuffkPu+ZrQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 06 Oct 2025 22:44:46 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/2/25 02:35, sukrut heroorkar wrote:
>>> kernel test robot noticed the following build errors:
>>>
>> Did you compile and test this code before submitting this patch?
>>
>>
> Yes, I had compiled & loaded the udlfb module with no errors. Please
> let me know how to proceed
> in this case.

Hey Sukrut,

When you make code that deletes something from the kernel, you need to
make sure that all other code that references that code will still
function properly.

When you surround things in the #ifdev, depending on the config file,
the compiler strips those things out and compiles without them. That
means that you actually need to compile and test under two conditions.
Once when CONFIG_FB_DEVICE=y and another time when CONFIG_FB_DEVICE=n.

The test robot gave you a sample config file that you can use. Please
ensure that you have the proper version of Clang on your Host machine
for that particular config file, if you choose to use it.

Also, I strongly recommend that you run the code on a sufficient
hardware or emulator after you test it so that you can verify that the
code does what you think it does.

Thanks,
David Hunter



