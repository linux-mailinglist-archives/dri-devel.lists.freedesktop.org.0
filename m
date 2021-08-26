Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE623F86C2
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 13:54:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40B2F6E7FE;
	Thu, 26 Aug 2021 11:54:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06EB46E7FE;
 Thu, 26 Aug 2021 11:54:07 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id y23so2841671pgi.7;
 Thu, 26 Aug 2021 04:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=nwwI2GDMMB3CQFNBO8bxf/2QLHbDBkcGH58C4VeBtg0=;
 b=gKN3huvl5kcDKczpggCXGMxnuqiXWW8fyduDS4rxvGSeR1yjnVHPFptFhU99pKy7+d
 DA7ULgOGgFPZKBA5V1glB2nsPzPXZYBf/4hKN9755PGEiwOFZfejF9SR2MVW7b260k1d
 rwujXHowYFjJyLvFblkhll1G9Fdokh67JY/0yikyJ6L54Wy3TgDep2R1X88VDQdaZiG3
 ftC5B17Zv3HOfaQrMwDtPt2cQizb5plbYAv3ftLxOQo5s26D31knRzhM9o4TieTPziPD
 FHF859y+zrs4UmWZ8ieuQaYbf3hIGN6Ystn+74XikjSnJVvh6RsZ7QrDtzxnsqTSMneW
 SORA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nwwI2GDMMB3CQFNBO8bxf/2QLHbDBkcGH58C4VeBtg0=;
 b=A6wnzIFvsjQY+9qEdQD0CqsSKsOvhHZDruW5PrFV2UoWtYBICLurPepWqrfgMbpady
 KSYkn9XT+SUhi/Hzw9ySHYa+gWGeljsX6kw/MfUDbsEmo7+EF6O0fe0Xcd/m6ic28DQS
 3ceji0fXEUuJ9602RyGFqVbwoTd8e0wezfwXtGtv4NzErr/36ajTGAH55DjD4RB+Pzm6
 qHREvkx7GhZ5baiTZTRve3rdEs5jV79dUGUzqv1KrpBBDO3qFNA0zlPmmxWGCA0ZUyDK
 v4wi+tlUJGw/I3qrO82fLdBUOqmqNQg7x8PZZX0OBLuBMwzY/PkomT4syyjb+kfglNLG
 FECA==
X-Gm-Message-State: AOAM531pZsLJ8n+l6tAFKWvtjGKByEUuSvuEthJ6xCjwFSBzN+arFUbv
 Re3OK/uqLdESqM66kk4SDQw=
X-Google-Smtp-Source: ABdhPJxCZDv240Y19YvqSvce73TS6qqVMaFxktjjoGbA3ZdS52AfCRasNvWnh6gtjIwm6jmT3znelQ==
X-Received: by 2002:a05:6a00:24c2:b0:3e2:878d:7e44 with SMTP id
 d2-20020a056a0024c200b003e2878d7e44mr3420288pfv.22.1629978847425; 
 Thu, 26 Aug 2021 04:54:07 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id a15sm2789435pfn.219.2021.08.26.04.53.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Aug 2021 04:54:06 -0700 (PDT)
Subject: Re: [PATCH v8 1/7] drm: fix null ptr dereference in drm_master_release
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, sumit.semwal@linaro.org,
 christian.koenig@amd.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 chris@chris-wilson.co.uk, ville.syrjala@linux.intel.com,
 matthew.auld@intel.com, dan.carpenter@oracle.com, tvrtko.ursulin@intel.com,
 matthew.d.roper@intel.com, lucas.demarchi@intel.com, karthik.b.s@intel.com,
 jose.souza@intel.com, manasi.d.navare@intel.com, airlied@redhat.com,
 aditya.swarup@intel.com, andrescj@chromium.org,
 linux-graphics-maintainer@vmware.com, zackr@vmware.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org
References: <20210826020122.1488002-1-desmondcheongzx@gmail.com>
 <20210826020122.1488002-2-desmondcheongzx@gmail.com>
 <YSdkjvWN9RAijZJy@phenom.ffwll.local>
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <05f4d472-7a76-598a-e792-a847a3e8516a@gmail.com>
Date: Thu, 26 Aug 2021 19:53:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YSdkjvWN9RAijZJy@phenom.ffwll.local>
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

On 26/8/21 5:53 pm, Daniel Vetter wrote:
> On Thu, Aug 26, 2021 at 10:01:16AM +0800, Desmond Cheong Zhi Xi wrote:
>> drm_master_release can be called on a drm_file without a master, which
>> results in a null ptr dereference of file_priv->master->magic_map. The
>> three cases are:
>>
>> 1. Error path in drm_open_helper
>>    drm_open():
>>      drm_open_helper():
>>        drm_master_open():
>>          drm_new_set_master(); <--- returns -ENOMEM,
>>                                     drm_file.master not set
>>        drm_file_free():
>>          drm_master_release(); <--- NULL ptr dereference
>>                                     (file_priv->master->magic_map)
>>
>> 2. Error path in mock_drm_getfile
>>    mock_drm_getfile():
>>      anon_inode_getfile(); <--- returns error, drm_file.master not set
>>      drm_file_free():
>>        drm_master_release(); <--- NULL ptr dereference
>>                                   (file_priv->master->magic_map)
>>
>> 3. In drm_client_close, as drm_client_open doesn't set up a master
>>
>> drm_file.master is set up in drm_open_helper through the call to
>> drm_master_open, so we mirror it with a call to drm_master_release in
>> drm_close_helper, and remove drm_master_release from drm_file_free to
>> avoid the null ptr dereference.
>>
>> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> 
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> I guess we should also have a cc: stable on this one? I think this bug
> existed since pretty much forever, but maybe more prominent with the
> drm_client stuff added a while ago.
> -Daniel
> 

Thanks for the reviews, Daniel.

Took a closer look. I think if we cc: stable, this fix should accompany 
commit 7eeaeb90a6a5 ("drm/file: Don't set master on in-kernel clients") 
which moves the drm_master_open out from drm_file_alloc into 
drm_open_helper.

>> ---
>>   drivers/gpu/drm/drm_file.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
>> index ed25168619fc..90b62f360da1 100644
>> --- a/drivers/gpu/drm/drm_file.c
>> +++ b/drivers/gpu/drm/drm_file.c
>> @@ -282,9 +282,6 @@ void drm_file_free(struct drm_file *file)
>>   
>>   	drm_legacy_ctxbitmap_flush(dev, file);
>>   
>> -	if (drm_is_primary_client(file))
>> -		drm_master_release(file);
>> -
>>   	if (dev->driver->postclose)
>>   		dev->driver->postclose(dev, file);
>>   
>> @@ -305,6 +302,9 @@ static void drm_close_helper(struct file *filp)
>>   	list_del(&file_priv->lhead);
>>   	mutex_unlock(&dev->filelist_mutex);
>>   
>> +	if (drm_is_primary_client(file_priv))
>> +		drm_master_release(file_priv);
>> +
>>   	drm_file_free(file_priv);
>>   }
>>   
>> -- 
>> 2.25.1
>>
> 

