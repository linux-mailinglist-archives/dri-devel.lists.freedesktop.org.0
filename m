Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A812B3AC12D
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 05:05:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C0A36E0E1;
	Fri, 18 Jun 2021 03:05:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 596596E0E1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 03:05:10 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id e22so422861pgv.10
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 20:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=5Hkc1Bod9XeIHJJRLDjduZE/jHZcAso4vB+S4dzyd3A=;
 b=Kjcy42HJCHBpM0LWBplRFsAQd1+Iv2qTJwbxsL8oRWoeFc8dRWnP4bqO/lpX1qny5F
 sAhnvJfXBj6HJZW4FfXRvjgLnbF5zVp5xZhsr2PBm7LkEjC3KRKBfXeBRPARTIbNxPQK
 631lLr0VPBj93bHbIJAxQXohxwtVcmRNkCm6KZXJYi0DI4A+xCpVasF/MZwj9GlqynW4
 drbP9t1nRR2qR7C8b6lf9ltMdU2g4SeMzj+0DHhk7oe87BsTWRoHVCHrfUITNulDHbME
 g0GrxFjSgWjNW5eDdoMJo0o5tWg/gwxRG+GFJajXe97oqrWMAHognSTMKJJRAFv/Mvv4
 OHwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5Hkc1Bod9XeIHJJRLDjduZE/jHZcAso4vB+S4dzyd3A=;
 b=rN/4FdQ9CwwVzNberGpKKCplf+cIMpf1k1CdX0hOhaWGJ38+qQRy1CpfIcxYZEe/2S
 QdgCAqC/QxLfFY9K3plKdPOKesOdrsJ7VC9z4OTJ39fuxiNKbg0QGiFstAUnYF5BS50h
 JrgixXOlGGLMVdd8ESHgljrAOwxJSSB3CdMDrMvq83v9pRjrGYO5WwJ7X/VbmwkF+suK
 JarpZ1zov7PxvCBXQUlkwxwDxRkLQNFpsACq9xMDh0bdrUGaLVfZu/YNBKttuWestR2w
 0JnE9W+kf9YEv36+CAj1RiIyW4GbjsmUl5Mf+/PhTto8Dtg+ARbODF9mwkn/8z0evK4R
 fmhg==
X-Gm-Message-State: AOAM532WqS2C4Xau9pTwoF9lVlDREGD0fUuzHtAiLnJsvsiVA7w78PWQ
 TfaAD//quqIj7+1ikVckgtct/2e339l/SP8EMTk=
X-Google-Smtp-Source: ABdhPJz26NHLGsvOBOgNmuPd/Y3RYtrJrpgvkQ3rEBaVG3zDw9JBCXksBI2LY66YF6ehmRCXpKL2ew==
X-Received: by 2002:a62:7b4c:0:b029:2e9:cec2:e252 with SMTP id
 w73-20020a627b4c0000b02902e9cec2e252mr2802617pfc.56.1623985509826; 
 Thu, 17 Jun 2021 20:05:09 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id w18sm6798863pjg.50.2021.06.17.20.05.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jun 2021 20:05:09 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] drm: Protect drm_master pointers in drm_lease.c
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org,
 emil.l.velikov@gmail.com
References: <20210615023645.6535-1-desmondcheongzx@gmail.com>
 <20210615023645.6535-3-desmondcheongzx@gmail.com>
 <YMuCYqLafn5sGcFo@phenom.ffwll.local>
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <c384d835-d910-5b04-e88c-a7878ce6d37d@gmail.com>
Date: Fri, 18 Jun 2021 11:05:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YMuCYqLafn5sGcFo@phenom.ffwll.local>
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

On 18/6/21 1:12 am, Daniel Vetter wrote:
> On Tue, Jun 15, 2021 at 10:36:45AM +0800, Desmond Cheong Zhi Xi wrote:
>> This patch ensures that the device's master mutex is acquired before
>> accessing pointers to struct drm_master that are subsequently
>> dereferenced. Without the mutex, the struct drm_master may be freed
>> concurrently by another process calling drm_setmaster_ioctl(). This
>> could then lead to use-after-free errors.
>>
>> Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
>> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
>> ---
>>   drivers/gpu/drm/drm_lease.c | 58 +++++++++++++++++++++++++++----------
>>   1 file changed, 43 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
>> index da4f085fc09e..3e6f689236e5 100644
>> --- a/drivers/gpu/drm/drm_lease.c
>> +++ b/drivers/gpu/drm/drm_lease.c
>> @@ -107,10 +107,16 @@ static bool _drm_has_leased(struct drm_master *master, int id)
>>    */
>>   bool _drm_lease_held(struct drm_file *file_priv, int id)
>>   {
>> +	bool ret;
>> +
>>   	if (!file_priv || !file_priv->master)
>>   		return true;
>>   
>> -	return _drm_lease_held_master(file_priv->master, id);
>> +	mutex_lock(&file_priv->master->dev->master_mutex);
> 
> So maybe we have a bug somewhere, and the kerneldoc isn't 100% clear, but
> I thought file_priv->master is invariant over the lifetime of file_priv.
> So we don't need a lock to check anything here.
> 
> It's the drm_device->master derefence that gets us into trouble. Well also
> file_priv->is_owner is protected by dev->master_mutex.
> 
> So I think with your previous patch all the access here in drm_lease.c is
> ok and already protected? Or am I missing something?
> 
> Thanks, Daniel
> 

My thinking was that file_priv->master is invariant only if it is the 
creator of master. If file_priv->is_master is false, then a call to 
drm_setmaster_ioctl will invoke drm_new_set_master, which then allocates 
a new master for file_priv, and puts the old master.

This could be an issue in _drm_lease_held_master, because we dereference 
master to get master->dev, master->lessor, and master->leases.

With the same reasoning, in other parts of drm_lease.c, if there's an 
access to drm_file->master that's subsequently dereferenced, I added a 
lock around them.

I could definitely be mistaken on this, so apologies if this scenario 
doesn't arise.

Best wishes,
Desmond



