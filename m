Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADBBCF6BB2
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 06:07:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B54AD10E47B;
	Tue,  6 Jan 2026 05:07:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SLilXLDm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA86310E47B
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 05:07:54 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-7b8e49d8b35so788338b3a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jan 2026 21:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767676074; x=1768280874; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0gtGPUtnrtvwlzSCngVczC/q2RK/CQdmnl4xMzqGXCo=;
 b=SLilXLDmoyY+rS2imHdKwAlR6hNpUwO8+BQdNEsZfbuXTogBCwrqm2WxF+rZNwgMke
 i99eUVVynXsTLz3jR+vy61E9VL39mXglrax1PFbzkZyG6G4Ph/BXHb3fwJDbJAVQVBjD
 DjM0r7DrTFmVQ2nsvdlzOs2YbE5toyhgKNtT2mPgmACoQuZdBp+Nk+P7emeZgERvyThX
 9ZL8RPHSjGaXnRVpJa/k2VrLRaK/uwpsPLpKYho+iFS+R/ZGgVW8w3KU5L0Yw7RCM7Nb
 2CgrxIgjMuInHVsYL89GQnMgdqLyrVqhqqy5ZIY6SyHJgetR98SL7lyZmJAZv15x0xls
 hA5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767676074; x=1768280874;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0gtGPUtnrtvwlzSCngVczC/q2RK/CQdmnl4xMzqGXCo=;
 b=HKec8L20o99YZwkEk0iP4tntjLku7ZNcr+Djd8r6doweJiprrBOZ8uAhJkrbmaAfaF
 AaK3ahtp20BMY+v3eIBeGRlXg7St//2hHbak3+5M2DlmtbaorKD/bI0eYF3pvP0WSquo
 QpBxzsfO2qxtYqoo5bHDFwdi7FKF0pg0NIA8IUOYzcwOa9sguy0PPJrY8mSqqSTRReYP
 /P+R9GmR9LkjeyWF+VQG8/jSTyEi5mm1e3FgNzG7/qR1IXebi84/2NbmhBeVJCfchgf7
 VbXEdHxhNF/JzohuDij9uvhXnjQ3Tjok0hm0axI7u18bvoRb+MluBlHhtXarHyLzYW1t
 DGZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXl7UtUd4hZdXB8oIh9kLlF6AlnV8mVVbXh5YUo+/HOMNtFrTaJW6CfpPmMW3bgTSxs/+IppF87zE8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/UdEGQ0DyrwNuw4h0HPOtjnamFa87BDwxE23jNmX44MA7i/nH
 ssQ5HIMFWJDO8Xkhn3ujuA67U2lSwO9HWHOGB/DvZsQGvhR3wZF6R5UO
X-Gm-Gg: AY/fxX6bv4+ddMD26gn7ZnqOcAmfqWsgevWZ7bm8Nw/KFSbC9GQd4i1UVw1ma85Zkd0
 DXwFliWs9/krVLJ0ldaZUeja4SGvb0EEByeEDk7IxVpjEnwNzkUO86eXMScvHb/2Fe4JaiTey9P
 A2lJmtQUvk6Me7bDh66a2BsjO0SfxUiAkAfqTGbVKyWtB1yzeZd7AW+DJanRa6SHOSjDzlQqV77
 qfv2DaoNX3muib9rWXSz7GBHwncTZTf4Qp0CfydDLsNBPRtwCgPEw573kgSSU9FRwJATnmyZZXX
 rpSEVFm6Le63FEzwD5wXRz+kkvB8GmImdOYLNh657Mo/IHq69eQnZ04vSnYnTJYL+HGmczUgb7O
 wpCBATFXP6EibSKBHRFUZ8EAy2cSpC5F42IskidldkXQKUXA9VFLryBQlqTlMOtVS7R/hK8vSxw
 hdxAQTNZ4hd6Uf4eKKO1wFe+l2pizHsvhuBPCNg7A9Sroq8FwGTNN5xsBwgrq5
X-Google-Smtp-Source: AGHT+IELk3bSN8b6/uvhBy79lAtP4nFKRyXfqVo09Vl9Sea1jJstOayAx+4sJKgZc+BInTNtDc92kA==
X-Received: by 2002:a05:6a00:f8e:b0:7f6:2b06:7129 with SMTP id
 d2e1a72fcca58-8187f4a1122mr1578438b3a.43.1767676074134; 
 Mon, 05 Jan 2026 21:07:54 -0800 (PST)
Received: from ?IPV6:2601:1c0:5780:9200:980d:1373:5653:99ac?
 ([2601:1c0:5780:9200:980d:1373:5653:99ac])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-819c52f8ff7sm752055b3a.37.2026.01.05.21.07.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jan 2026 21:07:53 -0800 (PST)
Message-ID: <af800a37-150b-4b7f-ad83-4db6e7e72df9@gmail.com>
Date: Mon, 5 Jan 2026 21:07:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] fbdev: sh_mobile_lcdc: Make FB_DEVICE dependency
 optional
To: Andy Shevchenko <andriy.shevchenko@intel.com>, Helge Deller <deller@gmx.de>
Cc: Helge Deller <deller@kernel.org>, andy <andy@kernel.org>,
 linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251230052827.4676-1-chintanlike@gmail.com>
 <20251230052827.4676-5-chintanlike@gmail.com> <aVOJovo-k6-0KnVg@carbonx1>
 <aa2b08f8-e6c3-4768-bce9-e36ad9d1e74b@gmail.com>
 <73007a0a-dd96-43eb-be2e-ccbf8b19cd79@gmx.de>
 <aVkWigAQWC1dZBAv@smile.fi.intel.com>
Content-Language: en-US
From: Chintan Patel <chintanlike@gmail.com>
In-Reply-To: <aVkWigAQWC1dZBAv@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



On 1/3/26 05:15, Andy Shevchenko wrote:
> On Sat, Jan 03, 2026 at 10:59:44AM +0100, Helge Deller wrote:
>> On 12/30/25 19:25, Chintan Patel wrote:
>>> On 12/30/25 00:13, Helge Deller wrote:
> 
> ...
> 
>>>>> -ATTRIBUTE_GROUPS(overlay_sysfs);
>>>>
>>>> Instead of replacing the ^ ATTRIBUTE_GROUPS() by the code below,
>>>> isn't it possible to just mark the overlay_sysfs_attrs[] array
>>>> _maybe_unused, and just do:
>>>> + #ifdef CONFIG_FB_DEVICE
>>>> + ATTRIBUTE_GROUPS(overlay_sysfs);
>>>> + #endif
>>>>
>>>> ?
>>>
>>> Yes, the __maybe_unused + #ifdef ATTRIBUTE_GROUPS() approach would work.
>>>
>>> I went with the PTR_IF(IS_ENABLED()) pattern because Andy suggested
>>> using PTR_IF() to conditionally include overlay_sysfs_group in
>>> overlay_sysfs_groups, and to keep .dev_groups always populated while
>>> letting the device core skip NULL groups. This avoids conditional
>>> wiring via #ifdef and keeps the code type-checked without
>>> CONFIG_FB_DEVICE.
>>> If you still prefer the simpler #ifdef ATTRIBUTE_GROUPS() approach
>>> for this driver, I can switch to that, but I wanted to follow Andy’s
>>> guidance here.
>>
>> I assume Andy will agree to my suggested approach, as it's cleaner
>> and avoids code bloat/duplication. Maybe you send out a v4 with my
>> suggested approach, then it's easier to judge... ?
> 
> I'm also fine with original code. But a suggested approach would work as well
> (at least like it sounds from the above description). Ideally would be nice to
> get rid of ifdeffery completely (that's why we have PTR_IF() for), although
> it might be not so readable. TL;DR: the most readable solution is the winner.
> 
Thank you both! I will send v4 with Helge's suggestion and take it from 
there.

