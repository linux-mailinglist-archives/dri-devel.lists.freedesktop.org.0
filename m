Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B8343CE2C
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 17:59:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD6FD6E5C3;
	Wed, 27 Oct 2021 15:59:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 660486E5C3;
 Wed, 27 Oct 2021 15:59:25 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 107-20020a9d0a74000000b00553bfb53348so4307908otg.0; 
 Wed, 27 Oct 2021 08:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JDGhLnAjGcemyGOmhvCllnpzPG1c1ebcma9GtpslLK8=;
 b=gXvpY2rj4x+6ro0u4u+WkiU6Owx0jrPe7Oj5sXe99VRLCxTCzzNdp2L0QtH6vGPE5T
 OxFrov2Ej359v/Wsbj7BYROPEeHN9vq80ZDU7uvB7KxzxokxJ8FYg4rQIimk9JBSnIE8
 ZZIuPo/+GV2UEWwdSvRujkzdeNsdKPCp57AFefkoDXkf+cLGgbuSeUbbpFDTrXQjwv+o
 Nv8KulaLUW0sI0fLmdhzrRgLsbWLfCRGv3L/3TNvjiU3mhW5Og77m+QVcVlKWcEXSP09
 u8jGF9OkVmmy4VUsIaG9Fv5qcxS07Xq/l+8kNxjQg4V7jWNUDtdQ90wIGNrJJaGpH2G0
 kcIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JDGhLnAjGcemyGOmhvCllnpzPG1c1ebcma9GtpslLK8=;
 b=p6Ah4bnxBYHP9MCBw01L7DhltvoskZzQYS/DGdjsoG5dTS82/ouK2SBdCEdbpogCmO
 4ADCkYzCRMh+U8HhhIc1hP4vmoBQlZa4LnjnPZ5VdEbcP54Ol+xocyZhIu86AlEtqmzV
 r6UajtdiGom0775T40b5MAH8PlNo+wp+HS6I1kRYey87q9lgf44n2LW6oewN6SKqjmeJ
 OZwt1SiK0PN0KiQVdx7pG49KSmOGn/i+csgsccLsBjK7kEMxHsEhy9nsdnx1gsqAdG5c
 QKjOR9NR/gb2StO9zTeJ2NmvO8JgLlSLxIVyxA37280rQHeAbdnYr++iTUOee85dXlDD
 1BOw==
X-Gm-Message-State: AOAM532Mk0iv7R4Nj9Ss+R5Hw0Iqg/8W4B/lghgX+lfKolGRLWFSOL5K
 tTZ4hPEnn1NmeN/NUdanJcw=
X-Google-Smtp-Source: ABdhPJxJ1qES9romQLNWwbkLhJuQ+1GVlbrTUSnpuhDk1WhYt+AqMhF7rH8bXBtdVDY2Nm56a0B8xQ==
X-Received: by 2002:a9d:6346:: with SMTP id y6mr26685096otk.154.1635350364648; 
 Wed, 27 Oct 2021 08:59:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 v9sm118175oth.62.2021.10.27.08.59.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 08:59:24 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: fix out of bounds write
To: Harry Wentland <harry.wentland@amd.com>,
 Thelford Williams <tdwilliamsiv@gmail.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Alex Deucher <alexander.deucher@amd.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
References: <20211027143945.GA1947580@roeck-us.net>
 <8205a660-6990-9007-48c9-453117d16f72@amd.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <fb5ee1a9-8cdb-3aab-c3ac-e4d03421fb85@roeck-us.net>
Date: Wed, 27 Oct 2021 08:59:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <8205a660-6990-9007-48c9-453117d16f72@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 10/27/21 8:22 AM, Harry Wentland wrote:
> On 2021-10-27 10:39, Guenter Roeck wrote:
>> On Wed, Oct 13, 2021 at 04:04:13PM -0400, Thelford Williams wrote:
>>> Size can be any value and is user controlled resulting in overwriting the
>>> 40 byte array wr_buf with an arbitrary length of data from buf.
>>>
>>> Signed-off-by: Thelford Williams <tdwilliamsiv@gmail.com>
>>> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>>
>> The fix works, but unless I am missing something it is incomplete.
>> parse_write_buffer_into_params() is called several times, and the
>> size parameter is always wrong. This patch only fixes one of several
>> instances of the problem.
>>
> 
> Patrik sent a patch that covers all cases:
> https://patchwork.freedesktop.org/patch/461554/?series=96341&rev=2
> 
> Harry
> 
Thanks!

Guenter

>> Guenter
>>
>>> ---
>>>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
>>> index 814f67d86a3c..9b3ad56607bb 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
>>> @@ -264,7 +264,7 @@ static ssize_t dp_link_settings_write(struct file *f, const char __user *buf,
>>>   	if (!wr_buf)
>>>   		return -ENOSPC;
>>>   
>>> -	if (parse_write_buffer_into_params(wr_buf, size,
>>> +	if (parse_write_buffer_into_params(wr_buf, wr_buf_size,
>>>   					   (long *)param, buf,
>>>   					   max_param_num,
>>>   					   &param_nums)) {
>>> -- 
>>> 2.33.0
> 

