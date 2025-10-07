Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1134BC0CDB
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 11:00:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE9210E5BC;
	Tue,  7 Oct 2025 09:00:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DMYcT4yO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D76C310E5BC
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 09:00:43 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-3edaa784f6dso288711f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 02:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759827642; x=1760432442; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1Xa6ifE/xlQHISGLdoOjoC3GElKqUAHWHKf7zodIGK0=;
 b=DMYcT4yO7j3/ID3DRcmpHCuEQIz/ZNjWCXixHU7NyAHOdABfGhjTf14m4Fju7ogBam
 +5Ut74VrUqfpAD9Ak/UqWeYDgpbSJjxE5AtOnUNDK3L26BHPlSmjt68jMqrf6Vu1kTO9
 XqfyxnOR6LzB3F154eFxmm8kAzWZMp/MzBZhBfECx1rLoufi783twOwHt6bp9RuSUnYS
 7Po5XpdsOgVxqmm4CKFOIO0RjnKa35EjVUsleG0Y7oF5HWdFCr3r2RoNoZwYKBKVfJ/a
 lr/pXPfj/nshg24pifKf5boW8Ib03ira2Jd7Sk60oZsCNCslDGiawW5HbpDmKTZ9wLvj
 st3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759827642; x=1760432442;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1Xa6ifE/xlQHISGLdoOjoC3GElKqUAHWHKf7zodIGK0=;
 b=pAX/x7sXVjGvJXQPGkcNa7vRyFX2B04HTwciYPl9hP+2sgsMeeCxl9QtkqAUScj/Z9
 irwUiIek0hTOIIqesO051UnlufZNGVMHRZd3g3xaTD042g1h0Ykb06Ip7qA6DW73jGkv
 XmCAMdDCd5MGPc37o+7OrzH6k1PqEE+TteLZAGmK9+Lj1aN0PYlC6IKPMjH4uEAGzP17
 ZhQNNOlbg2+bdHspj0vmRhVmVtRwt423d3O2ajqHf7S/2h9oeDuJWOEsb4f/ug4w3L1O
 s1qVRMw3XXrH0YkbuKuzgN46hzA7JUJYT5DuQSxQBDVhWh24klBunNCP/RsoXeVO+zXW
 hdAw==
X-Gm-Message-State: AOJu0YxI5oSMLuC6kFsYidjz0YD6hUYKvyMrAOwgJqzCsWSMQTMuSALn
 6GS0wJEiCeXnpug40JtBfOS16dlyi/XGKE7tFpfr+3mJNrhmkBDcgLUb
X-Gm-Gg: ASbGnct4ev8Ptd6lH5fdvwPtg6rAYWsYCTY+JUWzM8nPFWFtplBdKvfWQIBCTVQNVr2
 RkRoPFe4RwRdNjgGtEMZ1CM7BpyM4g1xtUS8E+pv0Vx4a33QARF3WwPaLhiIH7pMV5Nj3LL3sLH
 O1oxRN6DYxgTHbJiC504u/UFtTX2IH3Y8+Wy9r5EWpUocFUWBzqsCvwB+jNGerdyzbtfpzw46vB
 9LuvzjyFbn7C5SQ1t+B6JdJlvktxpsIqYtQFGGJlAfCfHbnNQW0oH0Vh/Sn4hsrF2B0cGBg3Q45
 m+wRgeW4vQWG+FIsPdksIW2LpJwTxiZtvHSTQuywGn2zuhb0OrocaMWQj5Zutoyqkb4PKF0J9ID
 iRBHGFzkNk6uBIKVN95te39nmVhmC7B7wNVP3rJAfm7jZPabu+9HgdHSdWk1VjAChWXmY+A==
X-Google-Smtp-Source: AGHT+IHdxxupVPmhNAdLsdEEwrhmyDrL1qTVyuXmX4U9HVJoLYW50xyIBDHuslFTZC4TvnRMs+w1nw==
X-Received: by 2002:a5d:584b:0:b0:3ec:7ff4:23bf with SMTP id
 ffacd0b85a97d-425671c195amr4899519f8f.9.1759827642182; 
 Tue, 07 Oct 2025 02:00:42 -0700 (PDT)
Received: from [172.16.134.209] ([41.229.125.2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8abe9bsm24792358f8f.22.2025.10.07.02.00.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Oct 2025 02:00:41 -0700 (PDT)
Message-ID: <d087a2c8-05f6-4fc1-924a-c3a84eae119c@gmail.com>
Date: Tue, 7 Oct 2025 10:00:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/gud: Use kmalloc_array() instead of kmalloc()
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, mingo@kernel.org, tglx@linutronix.de, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com, khalid@kernel.org,
 rubenru09@aol.com, linux-kernel-mentees@lists.linuxfoundation.org
References: <20251007083320.29018-1-mehdi.benhadjkhelifa@gmail.com>
 <bef19ef2-b22d-4adb-9513-b267d0e53330@suse.de>
Content-Language: en-US
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
In-Reply-To: <bef19ef2-b22d-4adb-9513-b267d0e53330@suse.de>
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

On 10/7/25 9:58 AM, Thomas Zimmermann wrote:
> Hi
> 
> Am 07.10.25 um 10:32 schrieb Mehdi Ben Hadj Khelifa:
>> Replace kmalloc with kmalloc array in drm/gud/gud_pipe.c since the
>> calculation inside kmalloc is dynamic 'width * height'
>>
>> Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
> 
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> As Ruben already acked the previous patch, you should add such acks to 
> any later patches. But no need to resend a new iteration now. I'll add 
> Ruben's a-b when I merge the patch.

ack,I forgot about that. Thanks for the heads-up.We'll do next time!

> Best regards
> Thomas

Best Regards,
Mehdi Ben Hadj Khelifa

>> ---
>> Changelog:
>>
>> Changes since v2:
>> -Reversed width and height in parameter order.
>> Link:https://lore.kernel.org/all/20250923085144.22582-1- 
>> mehdi.benhadjkhelifa@gmail.com/
>> Changes since v1:
>> - Use of width as element count and height as size of element to
>> eliminate the mentionned calculation and overflow issues.
>> Link:https://lore.kernel.org/all/20250922174416.226203-1- 
>> mehdi.benhadjkhelifa@gmail.com/
>>   drivers/gpu/drm/gud/gud_pipe.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/ 
>> gud_pipe.c
>> index 8d548d08f127..c32a798ccadf 100644
>> --- a/drivers/gpu/drm/gud/gud_pipe.c
>> +++ b/drivers/gpu/drm/gud/gud_pipe.c
>> @@ -70,7 +70,7 @@ static size_t gud_xrgb8888_to_r124(u8 *dst, const 
>> struct drm_format_info *format
>>       height = drm_rect_height(rect);
>>       len = drm_format_info_min_pitch(format, 0, width) * height;
>> -    buf = kmalloc(width * height, GFP_KERNEL);
>> +    buf = kmalloc_array(height, width, GFP_KERNEL);
>>       if (!buf)
>>           return 0;
> 

