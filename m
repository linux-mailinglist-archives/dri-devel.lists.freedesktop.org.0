Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E709DCEA774
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 19:25:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D435910E939;
	Tue, 30 Dec 2025 18:25:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TAG9utiX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0698810E939
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 18:25:49 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-7aa2170adf9so7556673b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 10:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767119148; x=1767723948; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZqTUGT/buUVKhGmIbkmEN3zb8z3R3/y5Q/VjnKNHpcQ=;
 b=TAG9utiXYe5Ra8uwQHDFxI+mpLoCxLTIxdlquNa6m/YXn54WhFzdoVrcgf3uJy1U6A
 h7GcSn4V2SNHviXN8/yH5nn6n1CNjMJA2M5LkeOTvtzN59Ft8c/dnXnkqbLIyNgNp5S4
 DcNASiWk1KBA1AHCANMXcNTSlCW/peF+OBaDXmOjxg8GjwPh/VZoVPMbPM/cz/PcjW9j
 L+NzsKPRKFnYLYqTRP77EKSrswbLKoaLfRxVn2ocXwK3VSvNWiuBfVeh0LoIMt2wbJeK
 WsGlmY61snFOIZwzU5OOfA8JwhTCfmuYGyFH9ZzcGrirCztDOjibYlRstxD/2WL98Owm
 WUaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767119148; x=1767723948;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZqTUGT/buUVKhGmIbkmEN3zb8z3R3/y5Q/VjnKNHpcQ=;
 b=ISfeEL1wrTHVn4NtFsbb3jNunUyfNIpEenzwOcMMrj0KgJ9OTtkPwBgykZy7RIDQKK
 SwZA4AQ6U86qeNOg/yPcnQM/EklbLchEOh4nEEOUpxK/BFVNi3EY6UkrJOuc9YiQdnJX
 j+AAB4vnT1lk7Rv8ZNE03jCeyhZQhpJGuCXM4m8K0ZGsFODey1OzF6jJeAjDCQ683CNT
 7rbC19QsFL1sH/Zqxeenpss8knBXk+9ljqtM4InD+YANjjp50a/XnUiUUHQAOmj6m593
 G5athLlJ9q9oYZ4nTSb+pQqu0zcYYUs0xvALU7UtkRqFLDGbh7RQIgxjEn6jtW5bcakz
 JzpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhVgHUTwQjlmdPZ8Fz99neUtK3m9EUrv8lu9tvPMt6EZJLluJt7Jdj6cKj2Mtp2gapxRzniqhCAeg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTf0Bnvc309QnSz+WJ618FfvbBKb5iSSOISZIBJ0ff/u9fFg1p
 XyKuLi2gfNFvk3aQ9BdNaLoBzAF+qk3i+52W0Drqpdpp/nnlCyd6LAvd
X-Gm-Gg: AY/fxX79J6Lmjbekwx2zua809CANyp5g6vAQXr1xSnYlN6j4aCQGyZ/39JDLilPhWVq
 kD4qSv6ihaIGOwrw45gyg6pgbhFTVW3zyyoR7YTtAcw+vORUGOziszx+KC/ECqvHTOlrEkkWZ9g
 Sohde+JyQRhm3dMbSq8tosIVNzGcSaM+dUNhnx1K3jriZ6715dg0qhYNlHnv+J/Ep/UqyOAXWea
 syMQ8h6KP/+u95KvrZymb5XiEQkYVHGmyk/LRqwrLl0QOMdwtD1bEw0vUUp36vxwyzAlOidWAB4
 XMLmuj9G4l4w7CJf7g9A+cZ8GU1xcM1vXeFn0NdiC+sQlToOAY28g53/z7KPt0QoJf0zdAGleVs
 6ITLUmyE4/hYmTlk146OaKrY4r1sngzdQn3jLx4SzCrKPEQ7uLsVH+cTvCnXhDUMA2NseLwzC6B
 CKHzazDMWRvpO3CdESSSX8J0xcFaDyRKEBiPWoiqIn9UtmaMqPjI/4H8X7aI8aN2ZUabnRuK8=
X-Google-Smtp-Source: AGHT+IGUaoIo8GmOrRw+0+JNNNYx6MGrFKAD/C+kQiDMbpeIjuCOzqvoM6Ulwwvxs8WR6NAEOUUl0g==
X-Received: by 2002:a05:6a20:6a07:b0:361:3bdc:916b with SMTP id
 adf61e73a8af0-376a75e78a3mr31725505637.7.1767119148344; 
 Tue, 30 Dec 2025 10:25:48 -0800 (PST)
Received: from ?IPV6:2601:1c0:5780:9200:d742:b62c:dcc9:47cd?
 ([2601:1c0:5780:9200:d742:b62c:dcc9:47cd])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a39018dc8bsm58720275ad.43.2025.12.30.10.25.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Dec 2025 10:25:48 -0800 (PST)
Message-ID: <aa2b08f8-e6c3-4768-bce9-e36ad9d1e74b@gmail.com>
Date: Tue, 30 Dec 2025 10:25:47 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] fbdev: sh_mobile_lcdc: Make FB_DEVICE dependency
 optional
To: Helge Deller <deller@kernel.org>
Cc: linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251230052827.4676-1-chintanlike@gmail.com>
 <20251230052827.4676-5-chintanlike@gmail.com> <aVOJovo-k6-0KnVg@carbonx1>
Content-Language: en-US
From: Chintan Patel <chintanlike@gmail.com>
In-Reply-To: <aVOJovo-k6-0KnVg@carbonx1>
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



On 12/30/25 00:13, Helge Deller wrote:
> * Chintan Patel <chintanlike@gmail.com>:
>> The sh_mobile_lcdc driver exposes overlay configuration via sysfs, but the
>> core driver does not require CONFIG_FB_DEVICE.
>>
>> Make sysfs support optional by defining overlay_sysfs_groups conditionally
>> using PTR_IF(). The driver always sets .dev_groups, and the kernel
>> naturally skips NULL attribute groups while the code remains buildable
>> and type-checked.
>>
>> Suggested-by: Helge Deller <deller@gmx.de>
>> Signed-off-by: Chintan Patel <chintanlike@gmail.com>
>> ---
>>   drivers/video/fbdev/sh_mobile_lcdcfb.c | 12 +++++++++++-
>>   1 file changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/video/fbdev/sh_mobile_lcdcfb.c b/drivers/video/fbdev/sh_mobile_lcdcfb.c
>> index dd950e4ab5ce..cb7ed1ff9165 100644
>> --- a/drivers/video/fbdev/sh_mobile_lcdcfb.c
>> +++ b/drivers/video/fbdev/sh_mobile_lcdcfb.c
>> @@ -1350,7 +1350,17 @@ static struct attribute *overlay_sysfs_attrs[] = {
>>   	&dev_attr_overlay_rop3.attr,
>>   	NULL,
>>   };
>> -ATTRIBUTE_GROUPS(overlay_sysfs);
> 
> Instead of replacing the ^ ATTRIBUTE_GROUPS() by the code below,
> isn't it possible to just mark the overlay_sysfs_attrs[] array
> _maybe_unused, and just do:
> + #ifdef CONFIG_FB_DEVICE
> + ATTRIBUTE_GROUPS(overlay_sysfs);
> + #endif
> 
> ?
Hi Helge,

Yes, the __maybe_unused + #ifdef ATTRIBUTE_GROUPS() approach would work.

I went with the PTR_IF(IS_ENABLED()) pattern because Andy suggested 
using PTR_IF() to conditionally include overlay_sysfs_group in 
overlay_sysfs_groups, and to keep .dev_groups always populated while 
letting the device core skip NULL groups. This avoids conditional wiring 
via #ifdef and keeps the code type-checked without CONFIG_FB_DEVICE.
If you still prefer the simpler #ifdef ATTRIBUTE_GROUPS() approach for 
this driver, I can switch to that, but I wanted to follow Andy’s 
guidance here.


Thanks!
