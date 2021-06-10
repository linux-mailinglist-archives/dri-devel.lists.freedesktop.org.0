Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 309B93A2F31
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 17:21:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C8256ED72;
	Thu, 10 Jun 2021 15:21:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 787E76ED64
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 15:21:44 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 m13-20020a17090b068db02901656cc93a75so3936219pjz.3
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 08:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=FuMYH+W4A5O7+Tews5dUBZThHa9L7Mfi17lH81DY2zM=;
 b=geW08CQPQBOVBMMTrnm4QUFNszNlWY3MoOiwGTuxU4NxJ7MI2P5D3oCLIMfMw0dMy+
 x+MAOJ9JGVdJiaP1cAH7u2dY8eX8FzNnaEPEresoL8Y0KlYO/JAWlw9i0Pap8ssR4A8h
 pXah6TYAeLM6CpQIP4weQ4x92R5zT/1f8OHYjrFFyL2CAJ6jpBTnuxhLsHs2o/UQCBvr
 LscT4VJWLKBGredrdp958uDKi4IuaIIuZrliAXNigqpz7BebZtMAOc2k1Uz8XzPE5JcG
 wrlGJe8bndU79Igoq2Yb2IcvMCqi1Nag+DNg47+6VQVynXTqVvEdK5F1KDX6wljdI0Td
 AnJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FuMYH+W4A5O7+Tews5dUBZThHa9L7Mfi17lH81DY2zM=;
 b=GC6ErpgNd2F8HvKZ1MEr6CtRX0T1z7s9tnGIWpXIXqEGB3K2OSbTjXuAE0h1wWX7ei
 6tmfeXIViXS3llXEOc7AIT1/CENZIspWadezbu83Z51/XPhdPor2WDJ1BYPvRFB0zccv
 myQqyWdarY7gEI5LfRqTGqkngi1GIDQo4wzJ4xh3V1Kn8WbQrNIyJEFKay5PshkbSPVy
 vScmV/iYjPGOhiet8XMLMQQR+aj1KO5CCANbwHOkcl0qW3aylk6yHNwFE2vtnfvLp0Y2
 +IjXa9AWtK09gOOr538yiqpmXzILg8axsm4LZPWRpEfzofS3mvzoYGbUrLoxOvJn4XCr
 4Zew==
X-Gm-Message-State: AOAM533pUTSR5ZLBsmr0reNjUEh7bcT7ZMSfF1hx1JTl3Ugc2+Wm3BUv
 z8izyW8THp6zEm8MZLnNrF8=
X-Google-Smtp-Source: ABdhPJwY3Ac4NGkGa69ARb226Snl9c/IgAMvA5T4R/MfkCVsafMp2WO5EMJAHpECCzDhwmOKZgu58w==
X-Received: by 2002:a17:90a:1b8f:: with SMTP id
 w15mr3847687pjc.101.1623338504011; 
 Thu, 10 Jun 2021 08:21:44 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id d92sm2920355pjk.38.2021.06.10.08.21.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 08:21:43 -0700 (PDT)
Subject: Re: [PATCH] drm: Lock pointer access in drm_master_release()
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org,
 Dan Carpenter <dan.carpenter@oracle.com>
References: <20210609092119.173590-1-desmondcheongzx@gmail.com>
 <YMHlLQHRLWgWlXTs@phenom.ffwll.local>
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <f16f4123-bd0b-f09c-ddf1-7197c841b588@gmail.com>
Date: Thu, 10 Jun 2021 23:21:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YMHlLQHRLWgWlXTs@phenom.ffwll.local>
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

On 10/6/21 6:10 pm, Daniel Vetter wrote:
> On Wed, Jun 09, 2021 at 05:21:19PM +0800, Desmond Cheong Zhi Xi wrote:
>> This patch eliminates the following smatch warning:
>> drivers/gpu/drm/drm_auth.c:320 drm_master_release() warn: unlocked access 'master' (line 318) expected lock '&dev->master_mutex'
>>
>> The 'file_priv->master' field should be protected by the mutex lock to
>> '&dev->master_mutex'. This is because other processes can concurrently
>> modify this field and free the current 'file_priv->master'
>> pointer. This could result in a use-after-free error when 'master' is
>> dereferenced in subsequent function calls to
>> 'drm_legacy_lock_master_cleanup()' or to 'drm_lease_revoke()'.
>>
>> An example of a scenario that would produce this error can be seen
>> from a similar bug in 'drm_getunique()' that was reported by Syzbot:
>> https://syzkaller.appspot.com/bug?id=148d2f1dfac64af52ffd27b661981a540724f803
>>
>> In the Syzbot report, another process concurrently acquired the
>> device's master mutex in 'drm_setmaster_ioctl()', then overwrote
>> 'fpriv->master' in 'drm_new_set_master()'. The old value of
>> 'fpriv->master' was subsequently freed before the mutex was unlocked.
>>
>> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> 
> Thanks a lot. I've done an audit of this code, and I found another
> potential problem in drm_is_current_master. The callers from drm_auth.c
> hold the dev->master_mutex, but all the external ones dont. I think we
> need to split this into a _locked function for use within drm_auth.c, and
> the exported one needs to grab the dev->master_mutex while it's checking
> master status. Ofc there will still be races, those are ok, but right now
> we run the risk of use-after free problems in drm_lease_owner.
> 
> Are you up to do that fix too?
> 

Hi Daniel,

Thanks for the pointer, I'm definitely up for it!

> I think the drm_lease.c code also needs an audit, there we'd need to make
> sure that we hold hold either the lock or a full master reference to avoid
> the use-after-free issues here.
>

I'd be happy to look into drm_lease.c as well.

> Patch merged to drm-misc-fixes with cc: stable.
> -Daniel
> 
>> ---
>>   drivers/gpu/drm/drm_auth.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
>> index f00e5abdbbf4..b59b26a71ad5 100644
>> --- a/drivers/gpu/drm/drm_auth.c
>> +++ b/drivers/gpu/drm/drm_auth.c
>> @@ -315,9 +315,10 @@ int drm_master_open(struct drm_file *file_priv)
>>   void drm_master_release(struct drm_file *file_priv)
>>   {
>>   	struct drm_device *dev = file_priv->minor->dev;
>> -	struct drm_master *master = file_priv->master;
>> +	struct drm_master *master;
>>
>>   	mutex_lock(&dev->master_mutex);
>> +	master = file_priv->master;
>>   	if (file_priv->magic)
>>   		idr_remove(&file_priv->master->magic_map, file_priv->magic);
>>   
>> -- 
>> 2.25.1
>>
> 

 From what I can see, there are other places in the kernel that could 
use the _locked version of drm_is_current_master as well, such as 
drm_mode_getfb in drm_framebuffer.c. I'll take a closer look, and if the 
changes make sense I'll prepare a patch series for them.

Best wishes,
Desmond

