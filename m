Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD74CA2480
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 04:44:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5096710E1A7;
	Thu,  4 Dec 2025 03:44:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cN0BRFSU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41BA610E1A7
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 03:44:51 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-2953ad5517dso4788025ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Dec 2025 19:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764819891; x=1765424691; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6NX83pUxb2cCDVonh18YfPdZCSI0sPevLl/YtGxuC28=;
 b=cN0BRFSU1d/HZYAJ4IRmXJlVhHIjvY92S1HNFe9uaYMZoBnHbFIFww0BoGrWdvQhcI
 qdSKhGNtmpmw14tA1LBA9/xcQiBvnuMLtjWqtnF86JLY08ffF4MGOvDB/UPxyocYWn5V
 B/C5tlWC1f5jP5vEFXmghzH48wZWrH83lwayrPLIBRmdbsNz3ZhJhM8yJGQ35LusK3gb
 py8ttgKcJQXzVkB09GfinhIRPHzBh16MC+wvu55XhXY8l5v4vbyM/uZdk4P+2BPDIQm7
 LK95XflXK3YxlEfy21ZG/kFHvYwGx48cwDoSTHf/1Hb1qiRoI98yE4HY98rT+Wt1lUVA
 LaEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764819891; x=1765424691;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6NX83pUxb2cCDVonh18YfPdZCSI0sPevLl/YtGxuC28=;
 b=gqDt+OCMucSOAmd6pLTT7HjNLaf7fJIPx2h+N6FDrlQ/ksgc0ymJrvpc8TvQV4J7Mz
 h86OoGX+wrb3Hihyhm93byakfaL7M0TzImcoh1SAjyRnAQEa2CEHhGBpB4kPpDJW14Ui
 rKjd/9W0/Zgdr6U9xIxeWAMETlMFrMaOF0O5AUCdRmH8/9Ik5KIBQzwskA82R7KLq00q
 AjDViPq4PtO3prxoI5n8Z88ttjK8QqGhBAgDYF9sTrmSmbhOvIDzh9xWX4aC02ULYi7v
 3w7EMoCsE0ysr0qTRl3MoG2IkbihDggps90w0km8yIo/InCLEdGF2C7BBmTsBSE4Xwdp
 7wpw==
X-Gm-Message-State: AOJu0YwUX3nUS1Vemua43Hn0++VFfdB5mV8qDPsEzCx2afd/Dg6kWBtE
 h0T7bye0XBBoBI1HM9REnelBQr0TTlgKQsLJgOJq7BLQ+hLyRlFGdibw
X-Gm-Gg: ASbGncuvBnBBbVaBa3Kq3YnCBVLQSLOMZjWtJ/2TWsnSkdzgHI+QOG5lu80EQSu1N3G
 YeyorT3FVxjN4BtbeyH/yiQm5UEuS5bGWsSUbeKKmvy80FYJddKRR37CHa7cGZcdeOV7b3BNvBr
 1Fy3qZ9dXdcaJUn5LuAxfeJ7u/t2IYTiRmA6/zw+si0Z9eCgKB4nf3S6F5dXY+lJ9pHjvVJdOqx
 Uv7+FxXhD4g/BMVse+kZZGFC3rtcSR3dY5HA0jjXtc1XM09o0ZatRIF4VfCEk1bCYnSZvFIdTwc
 Ha65H0c0TqRk9TpcVAcuM0zA7Ppnj2VWWD8klFEWNh2fvtfM1bDoGbTyN3FBRUHYaEeje+tx1X2
 XbflQVdNBjZhg0ePmEbKJkQU/95zpLlOwzsnXIwkP9hI417LabYSSdWAGQYtk68DfHbOMs+AY2V
 aR3gan0NTGXSCOAsIgt8F4vFvsGBpU+1xMUCV+gh3kmJvJ5r649TLPAPm0a+pl
X-Google-Smtp-Source: AGHT+IEuaZZOyIm5NAPMbSxAJs787v0hffhmCgce9pIduceysWh/BH0+C+5qTr5V2E2Q75rV8n4UZg==
X-Received: by 2002:a17:903:388d:b0:290:dd1f:3d60 with SMTP id
 d9443c01a7336-29da1ec75f8mr15931495ad.51.1764819890673; 
 Wed, 03 Dec 2025 19:44:50 -0800 (PST)
Received: from ?IPV6:2601:1c0:5780:9200:8c84:3987:751e:970b?
 ([2601:1c0:5780:9200:8c84:3987:751e:970b])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7e29f2ed000sm486536b3a.1.2025.12.03.19.44.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Dec 2025 19:44:50 -0800 (PST)
Message-ID: <67663eda-dce6-48e7-ad54-572bbce8b944@gmail.com>
Date: Wed, 3 Dec 2025 19:44:49 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/vblank: Increase timeout in drm_wait_one_vblank()
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, maxime.ripard@kernel.org,
 airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 syzbot+147ba789658184f0ce04@syzkaller.appspotmail.com
References: <20251028034337.6341-1-chintanlike@gmail.com>
 <2dae83e3-6fee-4e66-964e-c7baf46eecd8@suse.de>
Content-Language: en-US
From: Chintan Patel <chintanlike@gmail.com>
In-Reply-To: <2dae83e3-6fee-4e66-964e-c7baf46eecd8@suse.de>
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

Hi Thomas,

On 10/28/25 10:14, Thomas Zimmermann wrote:
> 
> 
> Am 28.10.25 um 04:43 schrieb Chintan Patel:
>> Currently, wait_event_timeout() in drm_wait_one_vblank() uses a 100ms
>> timeout. Under heavy scheduling pressure or rare delayed vblank
>> handling, this can trigger WARNs unnecessarily.
>>
>> Increase the timeout to 1000ms to reduce spurious WARNs, while still
>> catching genuine issues.
> 
> Thanks a lot.
> 
>>
>> Reported-by: syzbot+147ba789658184f0ce04@syzkaller.appspotmail.com
>> Closes: https://syzkaller.appspot.com/bug?extid=147ba789658184f0ce04
>> Tested-by: syzbot+147ba789658184f0ce04@syzkaller.appspotmail.com
>> Signed-off-by: Chintan Patel <chintanlike@gmail.com>
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Gentle ping on this patch. Please let me know if there are any issues 
with the patch, or if it requires any changes or further testing.

>>
>> v2:
>>   - Dropped unnecessary in-code comment (suggested by Thomas Zimmermann)
>>   - Removed else branch, only log timeout case
>>
>> v3:
>>   - Replaced drm_dbg_kms()/manual logging with drm_err() (suggested by 
>> Ville Syrjälä)
>>   - Removed unnecessary curr = drm_vblank_count() (suggested by Thomas 
>> Zimmermann)
>>   - Fixed commit message wording ("invalid userspace calls" → "delayed 
>> vblank handling")
>>
>> v4:
>>   - Keep the original drm_WARN() to catch genuine kernel issues
>>   - Increased timeout from 100ms → 1000ms to reduce spurious WARNs 
>> (suggested by Thomas Zimmermann)
>> ---
>>   drivers/gpu/drm/drm_vblank.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
>> index 46f59883183d..f779103b261b 100644
>> --- a/drivers/gpu/drm/drm_vblank.c
>> +++ b/drivers/gpu/drm/drm_vblank.c
>> @@ -1303,7 +1303,7 @@ void drm_wait_one_vblank(struct drm_device *dev, 
>> unsigned int pipe)
>>       ret = wait_event_timeout(vblank->queue,
>>                    last != drm_vblank_count(dev, pipe),
>> -                 msecs_to_jiffies(100));
>> +                 msecs_to_jiffies(1000));
>>       drm_WARN(dev, ret == 0, "vblank wait timed out on crtc %i\n", 
>> pipe);
> 

