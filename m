Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 816639B5010
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 18:05:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1AE210E6AE;
	Tue, 29 Oct 2024 17:05:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CX1mQXLO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3004910E6AB;
 Tue, 29 Oct 2024 17:05:35 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-20c8719fb63so3657505ad.1; 
 Tue, 29 Oct 2024 10:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730221535; x=1730826335; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ri7MEvCu1YimVlmWq4RcIi4fsfAsB9YQsSyk/h/+zFk=;
 b=CX1mQXLOAlBgIj/RQkFyyD44+DcpXeAQ5kOmWQqIWvt4LvaN9JopM4CFsOOuX664qJ
 uZ3FJLTk0+gEcsLOUvRdlvJ4pvHB28JOdKPYdXn8HKOvrvDsEPfzvsFkTYeLD10vCLto
 sUmOGnyfzSD2/wy68XZq4/ggnIk96gNEILC1d6y8NF5aNBBIJ5jwaX8IErGR2YqZYcJY
 LOyCvmIIucXySROcTuI1XKvT+IvAyQIQGwc+hsBp4zRHZY331uWhrBirih7kenmly9Mq
 6fF4AXDS5PJuYDiOcXVRQrs7i0N44OtuyG5HxYgSxs3A5rk7FTABRFjLXoQ1RqkL/2yD
 gKzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730221535; x=1730826335;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ri7MEvCu1YimVlmWq4RcIi4fsfAsB9YQsSyk/h/+zFk=;
 b=Kh7G6Ev6N6p5v3BCHkvScMtcncBN3AvVMoU2/e8q6BPAwKBTRDPPrkeyda6Inrm0U/
 MPmaYRAkznBTNjGBlRGaDJgPAEBSOs35lfTdeqm+elJk4T0MMvkXwSf9JH4LA6QiRngm
 vxycGFwSxa9uB0TJAFg1BB/Z4Cx6gP1wre1dn4XvrrYcPcD1Jh8nXFbsEGzeSEnuKRUg
 UtryUDfUZhKCM3J6pyrQM8locYTMj343Pkgzpp0kGHxkG6ampC8Q8fS+TvzpNDiTBKZg
 QU1JMITIRZ1WpGfqLQvmeygSJwO++x6JlpoQilVOyL/+bPifoTXjHYMMJXwWq00TGE4L
 yq/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWC+ZDmvMfkEoWgGCbrzTZSkfdiLQcQbZYMVdGtH1g0sR1uvIddvAyUgaoalu4SZ0oH0ROCLjTq@lists.freedesktop.org,
 AJvYcCXt6yNlf3g1+O0FfrpqKKzVmbHE0zNbp3gYEAb4zZzAmkr6CbS1EkuY/evYvQEaqWxW4bLsT9Pkk0UB@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHKEYb9uju/2pFiHHsWV3N4stT8RiT1ZOSWuH4da3gh86qYI9F
 37EEupCmH7U5+klocSfRztePHMLAOhvXnB0oK5pWNsCxKe8NeSNc
X-Google-Smtp-Source: AGHT+IHT5/roU/4mSk/m+oKx+/csSBDyCP+jJiFd98PSY13Rg95wM5KFEENyo902h9hqdsGmjTpOqQ==
X-Received: by 2002:a17:902:e5ce:b0:20c:da9a:d59e with SMTP id
 d9443c01a7336-210c6c6f398mr70539565ad.9.1730221534582; 
 Tue, 29 Oct 2024 10:05:34 -0700 (PDT)
Received: from ?IPV6:2402:e280:214c:86:e12b:a9a3:6d06:6d0a?
 ([2402:e280:214c:86:e12b:a9a3:6d06:6d0a])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-210f6a461b2sm1908925ad.169.2024.10.29.10.05.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Oct 2024 10:05:34 -0700 (PDT)
Message-ID: <3d38112f-9235-4643-ae2c-ffb9fae7a5d2@gmail.com>
Date: Tue, 29 Oct 2024 22:35:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH linux-next] drm/amdgpu: use string choice helpers
To: Alex Deucher <alexdeucher@gmail.com>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, simona@ffwll.ch, tao.zhou1@amd.com,
 kevinyang.wang@amd.com, Hawking.Zhang@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, luben.tuikov@amd.com,
 kernel test robot <lkp@intel.com>, Julia Lawall <julia.lawall@inria.fr>
References: <20241027140537.503264-1-prosunofficial@gmail.com>
 <CADnq5_M4QwRfROybHrQfNuiXNhHH7VFAUVZMWkriwZs7K4KLUQ@mail.gmail.com>
Content-Language: en-US
From: R Sundar <prosunofficial@gmail.com>
In-Reply-To: <CADnq5_M4QwRfROybHrQfNuiXNhHH7VFAUVZMWkriwZs7K4KLUQ@mail.gmail.com>
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

On 29/10/24 19:11, Alex Deucher wrote:
> On Sun, Oct 27, 2024 at 10:18 AM R Sundar <prosunofficial@gmail.com> wrote:
>>
>> Use string choice helpers for better readability.
> 
> I personally find this less readable, but if this is the preferred
> method going forward, I'm fine to take the patch.
> 
> Alex
> 

Hi,

Thanks for the comments.

I came across this comments in string_choices.h files, where 
str_read_write() helpers are present.

Using these helpers offers the following benefits: 

  1) Reducing the hardcoding of strings, which makes the code more 
elegant through these simple literal-meaning helpers. 

  2) Unifying the output, which prevents the same string from being 
printed in various forms, such as enable/disable, enabled/disabled, 
en/dis.
  3) Deduping by the linker, which results in a smaller binary file.

Kindly, I'm leaving the decision to maintainers.

Thanks,
Sundar

>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Reported-by: Julia Lawall <julia.lawall@inria.fr>
>> Closes: https://lore.kernel.org/r/202410161814.I6p2Nnux-lkp@intel.com/
>> Signed-off-by: R Sundar <prosunofficial@gmail.com>
>> ---
>>
>> reported in linux repository.
>>
>> tree:  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>>
>> cocci warnings: (new ones prefixed by >>)
>>>> drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.c:145:8-12: opportunity for str_read_write(read)
>>
>> vim +145 drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.c
>>
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.c
>> index 35fee3e8cde2..8cd69836dd99 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.c
>> @@ -200,7 +200,7 @@ static int amdgpu_eeprom_xfer(struct i2c_adapter *i2c_adap, u32 eeprom_addr,
>>                  dev_err_ratelimited(&i2c_adap->dev,
>>                                      "maddr:0x%04X size:0x%02X:quirk max_%s_len must be > %d",
>>                                      eeprom_addr, buf_size,
>> -                                   read ? "read" : "write", EEPROM_OFFSET_SIZE);
>> +                                   str_read_write(read), EEPROM_OFFSET_SIZE);
>>                  return -EINVAL;
>>          }
>>
>> --
>> 2.34.1
>>

