Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 482883B7D79
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 08:37:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D06016E940;
	Wed, 30 Jun 2021 06:37:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9E956E940;
 Wed, 30 Jun 2021 06:37:29 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id o18so632259pgu.10;
 Tue, 29 Jun 2021 23:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QIvNKpu6whR4KbUvMINCyHMH+hf3gIcrSC/Vwhdr3Lw=;
 b=YNGt9ANUzqBZpiARnaJOzXbbBqylmMuYP/nI/dR8iVc9BR8fyloomrSEDAc7BHhB1t
 3TGc7sm8bxGH/Kh9sl8FHkfQJSb9d3wZc8s8UirITisqGy/BMijpPFumavBt9BKtTU5t
 KzteOijczl9A4g7/s10zsj2dYedhe1Fapf+4S2kq7X8GW4dWZ0TB6l4xKWnCaHJBb3yv
 aCAHePk8renhA6LzrrWsTBRGjtv5j4O5a8Au8q3RkfIywGYHTOT0+daMkNfKzK0g8ow7
 H32WH1O2xZUCj3wKo23i3lBi3mlxMgE9oEMsxMx30Gk6CRC9uoOiSUHvfb+/212Ng/q9
 bXPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QIvNKpu6whR4KbUvMINCyHMH+hf3gIcrSC/Vwhdr3Lw=;
 b=fA7aEGoySXcGbIGoQHahVl3+7YD5myoup+yTPva7OqgUedZsjntAjb5bdVmbNSRWV7
 cySaXJ31zLtNtp6RYDWCF7P7oiVX9ZeMvgy0dg5JykU1oFXpeZdxrWtIo1ccSXedDUj0
 Em7Y4krYT0XiwokxgCZu24+9nrPAfD2wedG8YUCVNWbNUh668G4hQYJ5Z0wGtIkDl1D1
 JVZfELCbBmWNAV7Qsq03F4x6wqZ2JTuoxjFFR5OiicJ87/Y1jVA5Y13twl9gXD/N8qYS
 V7KLVrsqTDGk92jbLN8pTxh6tUW0tlfFKWRLwReDMIpgA23ce3gIXdETorRu8yU6DzDk
 yYGg==
X-Gm-Message-State: AOAM533TGoML1xmly3Sab8frT+KHUXE13YZAhYiP9uMw/N9PrK60wAYS
 wTR69svZh7A192Y2jEYVrls=
X-Google-Smtp-Source: ABdhPJxv35ffdyTf2HuDhIhk6MMvfhVyiCMQtPK0P585CwMD0Mvofwueer0wUTiw7OflmgcVoXCMCQ==
X-Received: by 2002:a63:2f05:: with SMTP id v5mr32113452pgv.449.1625035049301; 
 Tue, 29 Jun 2021 23:37:29 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id h24sm20304574pjv.27.2021.06.29.23.37.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jun 2021 23:37:28 -0700 (PDT)
Subject: Re: [PATCH v5 3/3] drm: protect drm_master pointers in drm_lease.c
To: Emil Velikov <emil.l.velikov@gmail.com>
References: <20210629033706.20537-1-desmondcheongzx@gmail.com>
 <20210629033706.20537-4-desmondcheongzx@gmail.com>
 <CACvgo514T=PZCWwhNsYqCC504SJ+2WivcRtmHhDoKsWMSLFU4A@mail.gmail.com>
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <e2ca777f-f185-688a-5813-0ff2e5025f77@gmail.com>
Date: Wed, 30 Jun 2021 14:37:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CACvgo514T=PZCWwhNsYqCC504SJ+2WivcRtmHhDoKsWMSLFU4A@mail.gmail.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, ML dri-devel <dri-devel@lists.freedesktop.org>,
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/6/21 8:16 am, Emil Velikov wrote:
> Hi Desmond,
> 
> Couple of small suggestions, with those the series is:
> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
> 
> On Tue, 29 Jun 2021 at 04:38, Desmond Cheong Zhi Xi
> <desmondcheongzx@gmail.com> wrote:
> 
>> @@ -128,13 +137,20 @@ bool drm_lease_held(struct drm_file *file_priv, int id)
>>          struct drm_master *master;
>>          bool ret;
>>
>> -       if (!file_priv || !file_priv->master || !file_priv->master->lessor)
>> +       if (!file_priv)
>>                  return true;
>>
>> -       master = file_priv->master;
>> +       master = drm_file_get_master(file_priv);
>> +       if (master == NULL)
>> +               return true;
>> +       if (!master->lessor) {
>> +               drm_master_put(&master);
>> +               return true;
> 
> Let's add a "ret = true; goto unlock;" here, so we can have a single
> drm_master_put() in the function.
> Nearly all code paths touched by this patch already follow this approach.
> 
>> @@ -154,10 +170,16 @@ uint32_t drm_lease_filter_crtcs(struct drm_file *file_priv, uint32_t crtcs_in)
>>          int count_in, count_out;
>>          uint32_t crtcs_out = 0;
>>
>> -       if (!file_priv || !file_priv->master || !file_priv->master->lessor)
>> +       if (!file_priv)
>>                  return crtcs_in;
>>
>> -       master = file_priv->master;
>> +       master = drm_file_get_master(file_priv);
>> +       if (master == NULL)
>> +               return crtcs_in;
>> +       if (!master->lessor) {
>> +               drm_master_put(&master);
>> +               return crtcs_in;
> 
> Ditto
> 
> Thanks
> Emil
> 

Sounds good to me, I'll revise these functions. Thanks for the review 
and suggestions, Emil.

Best wishes,
Desmond
