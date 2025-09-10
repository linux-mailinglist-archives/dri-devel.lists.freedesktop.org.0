Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF440B51385
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 12:09:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE5F610E382;
	Wed, 10 Sep 2025 10:09:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="xy6FWYvO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A694210E382
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 10:09:24 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-45df09c7128so4387975e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 03:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1757498963; x=1758103763;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uOTuzZysV5kQ+YDTuaTugOko0DCUNkdlz/KqCUlCKRw=;
 b=xy6FWYvO/+vF1forqjCuQyLeOWKI4HgAmkfpC1V7dS7GhubeTVM74KnYHwoVegVkwT
 ThgGIJv0jMYEag1y3sRuC+E5GSFPaRaFUxotmKhPDLNMQrYrLYJ8mgya1r6SFAsjybKR
 k20o6RqPQzc7HektrMlNwLvhr4aekZjjakps9vnSQvGD1emczLqIL7PU3OQ1Gx9e1oXD
 MYV65JOTpkYMjQE326pbAq/fNKzWoxCbVp8PUldfoaANMEbg6MjUakocUmWcWzUkLbX0
 FlKFFE66LKgdgfYmkvNcQ5T/hLBs0U08mmFGBk6B+DF0LkzTc6oz9pGLoQoCOE7+XIea
 vuBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757498963; x=1758103763;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uOTuzZysV5kQ+YDTuaTugOko0DCUNkdlz/KqCUlCKRw=;
 b=HJeEFBkREYz83LerkLfJKckx0zOyBQ1zmRsn1CTj54d2RGsLgeeSEFP0yCapQKYpRN
 +ZT+i9Yt+hBhp9woSt+G/vEQw/94RRAw3Hd1JJcwQ2lYm4D9VZ2Cl32SJ0oyPyW6ZEcp
 A5vehzml5pKF9JvQqn6RFNUTvgNOP+yp+BJGveJhqATZs2avt4lRz7dlAaNOpsHkCTOj
 wZQr1TKzsj0tENMn0c/mduSW20yRsowJObAFg82gRR/9k5h4qvM/RKIRjj3wwkpQDSvz
 hm+JSACWZPPF2sUB2sJZXEnVjdit3JbKO6zeIIm0QLQt8JifuAO4iN9iotFqhYOHELvm
 tgag==
X-Forwarded-Encrypted: i=1;
 AJvYcCUInkPK4piEHz22IXVqGJ99qRrDGfRG9kJPYXhK593DUgICNwdTuL/rJKQsu3oMUdrQBadGEknQyUg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxv4bMyb5m91CDeapeTXiBrA2n8pKekCrQnc7S5nheDqrCAZhWI
 k48U4bTazeonxKs9H2Y4ck8NYg46RMGSdTXV8nsy4pQz3d5B2V2zXfAyutOmOOhxT5Y=
X-Gm-Gg: ASbGncsRebX9hKALpcJA2KkMkxaPN0bWlwFra64+20hA6aJfFTU4WefZENZQeh1uph+
 JwIv/pF3ExmUli7I2JhcgRBDAUx4Mk+f8OiSCCR71L3I7eX5nMN6rdpX65NEmeuzH8xZJnnnsCf
 P8xB77PNnzizUuQfok48q/YzU4IbSzs8+tdoLtx/DruVkupMgwS+kFndmvYs90weL0XhgOfX0zA
 qLekTnWDVfD4J9+Jsi8H8n5jBqMDLNB0biUp7KXq+BUK+/8VNciXoU/o+5JqJ5DgBGS1xGidhg8
 +hkwGpm6vyLqjXpYlWOUqL+ilbel1CIywD3O28fc/B0iaXwZvR1tHUdhIXT3313O+GhM7l4gftq
 DvAGbmUILLLLgE1U7omKfX0XikR5Wbz7EU0U=
X-Google-Smtp-Source: AGHT+IEPG+lyxFIlIpxH80LQ7aYbGd+s/txpQcAp+CxqWZwvUkzOGr9U4ZUXp3PY2MRxFE9ROgpc0w==
X-Received: by 2002:a05:600c:c0c5:b0:45d:e531:99df with SMTP id
 5b1f17b1804b1-45de64869d9mr77361225e9.3.1757498962954; 
 Wed, 10 Sep 2025 03:09:22 -0700 (PDT)
Received: from [192.168.0.101] ([84.66.36.92])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45df82037c1sm22413075e9.9.2025.09.10.03.09.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Sep 2025 03:09:22 -0700 (PDT)
Message-ID: <d51e11fa-54b0-41f4-9b06-95b46094de39@ursulin.net>
Date: Wed, 10 Sep 2025 11:09:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: Replace kzalloc + copy_from_user with
 memdup_user
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250908211559.519892-1-thorsten.blum@linux.dev>
 <4005498b-d866-4e41-a8a4-d8228b2062e7@ursulin.net>
 <CADnq5_NDrq_S7rcpr6_MY-USfVGr8-QcJ2hqnai7VEm5D_OyxQ@mail.gmail.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <CADnq5_NDrq_S7rcpr6_MY-USfVGr8-QcJ2hqnai7VEm5D_OyxQ@mail.gmail.com>
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


On 09/09/2025 14:36, Alex Deucher wrote:
> On Tue, Sep 9, 2025 at 4:17 AM Tvrtko Ursulin <tursulin@ursulin.net> wrote:
>>
>>
>> On 08/09/2025 22:15, Thorsten Blum wrote:
>>> Replace kzalloc() followed by copy_from_user() with memdup_user() to
>>> improve and simplify ta_if_load_debugfs_write() and
>>> ta_if_invoke_debugfs_write().
>>>
>>> No functional changes intended.
>>>
>>> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
>>> ---
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c | 20 ++++++--------------
>>>    1 file changed, 6 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c
>>> index 38face981c3e..6e8aad91bcd3 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c
>>> @@ -171,13 +171,9 @@ static ssize_t ta_if_load_debugfs_write(struct file *fp, const char *buf, size_t
>>>
>>>        copy_pos += sizeof(uint32_t);
>>>
>>> -     ta_bin = kzalloc(ta_bin_len, GFP_KERNEL);
>>> -     if (!ta_bin)
>>> -             return -ENOMEM;
>>> -     if (copy_from_user((void *)ta_bin, &buf[copy_pos], ta_bin_len)) {
>>> -             ret = -EFAULT;
>>> -             goto err_free_bin;
>>> -     }
>>> +     ta_bin = memdup_user(&buf[copy_pos], ta_bin_len);
>>> +     if (IS_ERR(ta_bin))
>>> +             return PTR_ERR(ta_bin);
>>>
>>>        /* Set TA context and functions */
>>>        set_ta_context_funcs(psp, ta_type, &context);
>>> @@ -327,13 +323,9 @@ static ssize_t ta_if_invoke_debugfs_write(struct file *fp, const char *buf, size
>>>                return -EFAULT;
>>>        copy_pos += sizeof(uint32_t);
>>>
>>> -     shared_buf = kzalloc(shared_buf_len, GFP_KERNEL);
>>> -     if (!shared_buf)
>>> -             return -ENOMEM;
>>> -     if (copy_from_user((void *)shared_buf, &buf[copy_pos], shared_buf_len)) {
>>> -             ret = -EFAULT;
>>> -             goto err_free_shared_buf;
>>> -     }
>>> +     shared_buf = memdup_user(&buf[copy_pos], shared_buf_len);
>>> +     if (IS_ERR(shared_buf))
>>> +             return PTR_ERR(shared_buf);
>>>
>>>        set_ta_context_funcs(psp, ta_type, &context);
>>>
>>
>> More complete than the one I sent in June^1.
> 
> I never received this series.  I didn't see it in patchwork either.
> Seems it never made it to amd-gfx.  Sorry I missed it. I've applied
> the applicable patches now.

Thank you and no worries, it wasn't anything urgent.

Regards,

Tvrtko
