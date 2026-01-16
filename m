Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EBCD2A733
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 03:59:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8718F10E013;
	Fri, 16 Jan 2026 02:59:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="g5raMIjh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15A3710E013
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 02:59:19 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-2a0bae9aca3so10707805ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 18:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768532358; x=1769137158; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jBXP1VuxQoMfLKXTRMl7z4tgIk8pmLomI71jMyiZNEM=;
 b=g5raMIjh4TOa4+cKaOEgmUrYecM74JZJdlIZ2cXqkfvu4rS17oSSbKZ1+wjySzikDI
 2d5bPOfFRpmjXysE+BwZ1JUqrtK1SDOVyi6lJEA1IIVwXdCqYs/uf+i9Hk7l13NDTIJn
 u4H8YahA7TcArRzWjmr7Lrt5euZYUlLB/76V6neD9r9LNmH1OlG/VXqdJiS5PubeNMVb
 4MxUyuIoaqDSEsG46B4BWS9lCwY+VVtW0UG0P+f3TxJ5RGoJyi1Zuyq3nyfxDp/I6ORZ
 9d+O6jbXvPRMc2YcaW6BU8i7zIQkxGZO8uqsPeKQKWeoNEAt6GETYV6nQYT7pAVajXd1
 sPEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768532358; x=1769137158;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jBXP1VuxQoMfLKXTRMl7z4tgIk8pmLomI71jMyiZNEM=;
 b=p9Q9/wutpedxWVlmCzZCc0mvijezKVNO98qgkv4vNde7SX+tIpAvcrsWjH0lIT2SR3
 r8drjnmZaHEoSTyNXPgIo1kREKLQbzg05xW1QJrS8TWYOHlVwUV7CBjqyuCpYV2fcF8i
 Z3i1F1G3u2juamaHQ2s/eybALjeGUGbbU8D681ilhfjPtJbK5XYJqM+991RZ2eTBCnRs
 oUKd7BIA1kbsK7qsDHO1ALTWgBWjNv/INRCsECIYBIJkkxKNMKKICeMcM7AlqQ/Zj68q
 9+yTHyb/NswcThCyaeQv2SEESXAymim3iTXZSJUOoi0OXaNogmffr7EUpE5KNk/TZ/14
 CxPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWO7brXnjcy01bXEIgcDooKO+AOlvtOv8A3eJmW+VEiuMH9fEQ0rz2OOLCkCRHGmrUN5OoyoICF+WA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyVjCSs/f8SKvTNSgkOA/kNRS01glf9mRZw3HjhgwSlxcvPkFyo
 4eZZjQsUeD6tfRXYBEvskm76v/m+ZkcxmsadgRsP9FnSJXufljunWoL7
X-Gm-Gg: AY/fxX4OMBXxIFAbIK8pRy2mgettOjDONcbXId8P+YC/cNETKryq3MmBBqa7d3BtbWr
 cE74T5NB1IyD/BdD0EVwGMEeUZ6qpGxHX9hP+HW33ARIMP2zjE8bjOGld21tYbe0VzZMD43Q8B2
 rf0o9qbTf3OZNDvYU90xnwtl6NIsTVxn/A+BC4COykxxSAEbR+RRf30FlfcFTKv1bsyAw9eAKAQ
 XTvBuVqTsR4mmSLkGMQdQDikuxQ24Rl18sZWtDO/YuBZARgr09V7QWIRuFRDSumh71vk5gAXDb1
 ZF8lshvKGnXiRk9khMjXFmCRir47SnBfOv3KYpTGzh6k9Kqy3anI69h1EGFvIkQhoZph+pk5ntO
 a01/Ft2zYzr3r2TDzPfP39f9/VjEsyybYsjm/ADr2OIUIROgN/n1e+Bc3locW0Cl44+nSBFQGIM
 ccD0VU/EGNMMog2glEXl+IAvcax+s49Bns6lB96Et9uH9pa9ID15OBpFM3Bujg
X-Received: by 2002:a17:902:d503:b0:267:a5df:9b07 with SMTP id
 d9443c01a7336-2a7175189a1mr15351925ad.12.1768532358494; 
 Thu, 15 Jan 2026 18:59:18 -0800 (PST)
Received: from ?IPV6:2601:1c0:5780:9200:2698:b2e5:53ba:f374?
 ([2601:1c0:5780:9200:2698:b2e5:53ba:f374])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a7193fc8d9sm5947415ad.79.2026.01.15.18.59.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jan 2026 18:59:18 -0800 (PST)
Message-ID: <c7e6fe1c-ff46-4541-ab6c-6dd776924f95@gmail.com>
Date: Thu, 15 Jan 2026 18:59:16 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] staging: fbtft: Use fbdev logging helpers when
 FB_DEVICE is disabled
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 andy@kernel.org, deller@gmx.de, gregkh@linuxfoundation.org,
 kernel test robot <lkp@intel.com>
References: <20260113045909.336931-1-chintanlike@gmail.com>
 <1b83803a-b51f-4cc0-a836-b4417bfd6537@suse.de>
Content-Language: en-US
From: Chintan Patel <chintanlike@gmail.com>
In-Reply-To: <1b83803a-b51f-4cc0-a836-b4417bfd6537@suse.de>
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



On 1/14/26 23:55, Thomas Zimmermann wrote:
> Hi
> 
> Am 13.01.26 um 05:59 schrieb Chintan Patel:
>> Replace direct accesses to info->dev with fb_dbg() and fb_info()
>> helpers to avoid build failures when CONFIG_FB_DEVICE=n.
>>
>> Fixes: a06d03f9f238 ("staging: fbtft: Make FB_DEVICE dependency 
>> optional")
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202601110740.Y9XK5HtN- 
>> lkp@intel.com
>> Signed-off-by: Chintan Patel <chintanlike@gmail.com>
>>
>> Changes in v6:
>> - Switch debug/info logging to fb_dbg() and fb_info()(suggested by 
>> Thomas Zimmermann)
>> - Drop dev_of_fbinfo() usage in favor of framebuffer helpers that 
>> implicitly
>>    handle the debug/info context.
>> - Drop __func__ usage per review feedback(suggested by greg k-h)
>> - Add Fixes tag for a06d03f9f238 ("staging: fbtft: Make FB_DEVICE 
>> dependency optional")
>>    (suggested by Andy Shevchenko)
>>
>> Changes in v5:
>> - Initial attempt to replace info->dev accesses using
>>    dev_of_fbinfo() helper
>> ---
>>   drivers/staging/fbtft/fbtft-core.c | 19 +++++++++----------
>>   1 file changed, 9 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/ 
>> fbtft/fbtft-core.c
>> index 8a5ccc8ae0a1..1b3b62950205 100644
>> --- a/drivers/staging/fbtft/fbtft-core.c
>> +++ b/drivers/staging/fbtft/fbtft-core.c
>> @@ -365,9 +365,9 @@ static int fbtft_fb_setcolreg(unsigned int regno, 
>> unsigned int red,
>>       unsigned int val;
>>       int ret = 1;
>> -    dev_dbg(info->dev,
>> -        "%s(regno=%u, red=0x%X, green=0x%X, blue=0x%X, trans=0x%X)\n",
>> -        __func__, regno, red, green, blue, transp);
>> +    fb_dbg(info,
>> +           "regno=%u, red=0x%X, green=0x%X, blue=0x%X, trans=0x%X\n",
>> +           regno, red, green, blue, transp);
>>       switch (info->fix.visual) {
>>       case FB_VISUAL_TRUECOLOR:
>> @@ -391,8 +391,7 @@ static int fbtft_fb_blank(int blank, struct 
>> fb_info *info)
>>       struct fbtft_par *par = info->par;
>>       int ret = -EINVAL;
>> -    dev_dbg(info->dev, "%s(blank=%d)\n",
>> -        __func__, blank);
>> +    fb_dbg(info, "blank=%d\n", blank);
>>       if (!par->fbtftops.blank)
>>           return ret;
>> @@ -793,11 +792,11 @@ int fbtft_register_framebuffer(struct fb_info 
>> *fb_info)
>>       if (spi)
>>           sprintf(text2, ", spi%d.%d at %d MHz", spi->controller- 
>> >bus_num,
>>               spi_get_chipselect(spi, 0), spi->max_speed_hz / 1000000);
>> -    dev_info(fb_info->dev,
>> -         "%s frame buffer, %dx%d, %d KiB video memory%s, fps=%lu%s\n",
>> -         fb_info->fix.id, fb_info->var.xres, fb_info->var.yres,
>> -         fb_info->fix.smem_len >> 10, text1,
>> -         HZ / fb_info->fbdefio->delay, text2);
>> +    fb_info(fb_info,
>> +        "%s frame buffer, %dx%d, %d KiB video memory%s, fps=%lu%s\n",
>> +        fb_info->fix.id, fb_info->var.xres, fb_info->var.yres,
>> +        fb_info->fix.smem_len >> 10, text1,
>> +        HZ / fb_info->fbdefio->delay, text2);
> 
> As discussed before, this should become fb_dbg().  Drivers should not 
> print status reports unless they do not work as expected.

Agree - I will send 2 patches(series) as per feedback 1) a patch focused 
purely on fixing the compilation issue by avoiding info->dev 
dereferences (using fb_dbg() where logging remains), and
2) a follow-up cleanup that downgrades the framebuffer
     registration message to debug level.

> Best regards
> Thomas
> 
>>       /* Turn on backlight if available */
>>       if (fb_info->bl_dev) {
> 

