Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A26E93AC121
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 04:55:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4740E6E95A;
	Fri, 18 Jun 2021 02:55:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D4486E95A
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 02:55:03 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 x21-20020a17090aa395b029016e25313bfcso5022190pjp.2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 19:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=oD/lPmbYpR+flY3ngmMvMRUJurU8Z44y+AyucteNA/8=;
 b=G6ta/BMQj9o34vXd7ou/YOIaNZRkgj9MLKZNrM8CDmrPZUN+UhQCb3L0RdA+IjJn5G
 jrk22sYfXarrySBr3qlZ/W2KPEpEKnOa5GU4cxU1iGkSsFuHKHXHEk4T74IGyNxTOt3g
 xMdMluZ1hvTiuYHeyMFaQJnrv7+xBxf6qORGE5iaRmZh0T4mTSw+juXRG2PojvtqzToW
 3NevaUqrq6uqbPZSPoIBKor+pKomn6CCnyyBud9JuFtHWwoZxTxLZOs4OYOUKFXUDbNs
 RiebIW9QEoM/qvkLx6FnkhSlDxwP+hR5oYliUMdHCFb3FQoxQkP6k9Oij9cdmxWe1+7T
 Nrng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oD/lPmbYpR+flY3ngmMvMRUJurU8Z44y+AyucteNA/8=;
 b=GIeT4Jzay/K+hy5uLziCutdojnpyNeKDsRvEn8LvvBkYi1MiFOQ67iE9eobwIAz5uf
 g9d+q8xR62wu+sXtBDoGLKAH5sQrGQ3Im1BEh2N3FNwamFmaPx3Ed3RL0wWfj7hTRglP
 mL4zISA91b/aIM5WQ5UB8OCmpkGu8gsYg4zER/P7Hd++Z4NjjR3wnbCfBlUa9VcXF+Gq
 tJWcChq5rxXRbiE5clJihMTIGWrSH2/FWY2dEcJ4JE/xbIiQCOdBpQBi1dMcVoKiHVvG
 6GKYG6kooom5M66mB8O8W58Yy4s8yIE17bGDRluu9SnltiOJIlnT8JcBlVY+HafvZPsm
 N94Q==
X-Gm-Message-State: AOAM530UIiITDo6MTWPGwYYCeJM2GhGHitTDf6h0SbAzijRWxKXrPmk1
 kIOZVPoxP15HxnKKPifb1QY=
X-Google-Smtp-Source: ABdhPJxQtIJ7wA1HP94MBKX8MQ9KWjHMW8rcONoLQSAmQmXf52cl+s1tuhb+aHwu/PmfkqWor3hVow==
X-Received: by 2002:a17:902:ecd1:b029:119:50c6:e449 with SMTP id
 a17-20020a170902ecd1b029011950c6e449mr2764132plh.30.1623984903283; 
 Thu, 17 Jun 2021 19:55:03 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id m1sm6825685pgd.78.2021.06.17.19.55.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jun 2021 19:55:02 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] drm: Add a locked version of drm_is_current_master
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org,
 emil.l.velikov@gmail.com
References: <20210615023645.6535-1-desmondcheongzx@gmail.com>
 <20210615023645.6535-2-desmondcheongzx@gmail.com>
 <YMuAYaZF+qW7GUFT@phenom.ffwll.local>
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <793cf08c-a766-637e-b473-91f6c8de12ec@gmail.com>
Date: Fri, 18 Jun 2021 10:54:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YMuAYaZF+qW7GUFT@phenom.ffwll.local>
Content-Type: text/plain; charset=windows-1252; format=flowed
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

On 18/6/21 1:03 am, Daniel Vetter wrote:
> On Tue, Jun 15, 2021 at 10:36:44AM +0800, Desmond Cheong Zhi Xi wrote:
>> While checking the master status of the DRM file in
>> drm_is_current_master(), the device's master mutex should be
>> held. Without the mutex, the pointer fpriv->master may be freed
>> concurrently by another process calling drm_setmaster_ioctl(). This
>> could lead to use-after-free errors when the pointer is subsequently
>> dereferenced in drm_lease_owner().
>>
>> The callers of drm_is_current_master() from drm_auth.c hold the
>> device's master mutex, but external callers do not. Hence, we implement
>> drm_is_current_master_locked() to be used within drm_auth.c, and
>> modify drm_is_current_master() to grab the device's master mutex
>> before checking the master status.
>>
>> Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
>> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
>> ---
>>   drivers/gpu/drm/drm_auth.c | 23 +++++++++++++++++++----
>>   1 file changed, 19 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
>> index 232abbba3686..c6bf52c310a9 100644
>> --- a/drivers/gpu/drm/drm_auth.c
>> +++ b/drivers/gpu/drm/drm_auth.c
>> @@ -61,6 +61,8 @@
>>    * trusted clients.
>>    */
>>   
>> +static bool drm_is_current_master_locked(struct drm_file *fpriv);
> 
> A bit a bikeshed, but we try to avoid forward declarations when they're
> not needed. If you don't want to tear apart drm_is_current_master and the
> _locked version then just move them together.
> 
> Can you pls do that and respin?
> 
> Otherwise looks all great.
> -Daniel
> 
> 

Yeah, I was trying to keep the logic in _locked close to 
drm_is_current_master. But got it, will do.

