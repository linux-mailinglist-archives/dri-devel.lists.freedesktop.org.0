Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD5A3A3A22
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 05:11:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 238016EE27;
	Fri, 11 Jun 2021 03:11:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C88C6EE27
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 03:11:01 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 mp5-20020a17090b1905b029016dd057935fso4982786pjb.5
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 20:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=y4prOr8o9Yrbtks61jFL7WPXITvzhL37T1tTULKWr64=;
 b=bDIft2UOAn67MfE/MQtn5OMB6NfhrtTY4RgKtZ0gOuujkq0k8b4L2p/BkWp5hg7Yvr
 qzFeB3Vna1mNiKZ08+MeeIYirYkiaGglDnbivvgkjhh9r5dvCJ0ZlV2qC+DbC8WGmJTh
 sZPAob+YrFYiZuxrzMODEpSgdHndj3F/k8b6UwomISh2s80Won5w1jjr6wTdaoex6JJ7
 bC0TRRCeyOz5glCtNye84k1bSDFNCAPoPPys+B0DVQogDzaMoXGC4dZ9zhD9Fnn3TAEc
 dZOVUXFU7xqW3SqOLPYnMduHsmIAIeqBf9yX/rT9ahHFk6xrmbl2UUM6VQtxQdV104X3
 h0mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=y4prOr8o9Yrbtks61jFL7WPXITvzhL37T1tTULKWr64=;
 b=ORj61z7I9i7pvdD1E6nCuI4yXBsrgqnZsm4oW88ZQUIqEJ1rsRqueTpnfSyhTwAZ14
 zWGgrHibOz4XNDuSmeMQlzhYu+S927M6tVvZTf/2DS5sXLTlUG16yv/GdoOG6HOz2DE4
 dAKWiaz+CDN05cnP1pSZM3m1MTRNCgkAZF9taS8tj22V5vJYIKfoVi53EGhKfTRi797A
 XZ4dWviJXvTaMpj9Re9H/WRxvX12MtE+F3bP4fdL3DIqK+pn2RDT6xx0ii0DyNhsK6eY
 tQvxFPWGH/Piuyi206rLPj2HzQRgQ/cuGJeqyxQsenMcZDWYcd91+7E74fqKxl+v6Ob+
 IgWg==
X-Gm-Message-State: AOAM532HDm+UX6BllxFLG0Ek5PTzdjeHaO1OUKdDnogYYwRaKgLUzLNO
 Hfvomn80C+X+7H9DmvmVFqo=
X-Google-Smtp-Source: ABdhPJytmw3t0plsGu1s3pJHOmMhH+nO+rWH4XVq3grkpfzTHXrf0/lejne5dFN8LlPjFKguJgkypg==
X-Received: by 2002:a17:90a:66c9:: with SMTP id
 z9mr2239212pjl.122.1623381060940; 
 Thu, 10 Jun 2021 20:11:00 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id v6sm4195582pgk.33.2021.06.10.20.10.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 20:11:00 -0700 (PDT)
Subject: Re: [PATCH] drm: Lock pointer access in drm_master_release()
To: Emil Velikov <emil.l.velikov@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Airlie <airlied@linux.ie>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 skhan@linuxfoundation.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Dan Carpenter <dan.carpenter@oracle.com>
References: <20210609092119.173590-1-desmondcheongzx@gmail.com>
 <YMHlLQHRLWgWlXTs@phenom.ffwll.local>
 <CACvgo53xvUD-YgU_rhG3GDg18jygwAP78aj8OJd457SEFpAf7g@mail.gmail.com>
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <ddc6353a-4d75-6826-dda7-be9f9dd35d1c@gmail.com>
Date: Fri, 11 Jun 2021 11:10:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CACvgo53xvUD-YgU_rhG3GDg18jygwAP78aj8OJd457SEFpAf7g@mail.gmail.com>
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

On 11/6/21 1:49 am, Emil Velikov wrote:
> On Thu, 10 Jun 2021 at 11:10, Daniel Vetter <daniel@ffwll.ch> wrote:
>>
>> On Wed, Jun 09, 2021 at 05:21:19PM +0800, Desmond Cheong Zhi Xi wrote:
>>> This patch eliminates the following smatch warning:
>>> drivers/gpu/drm/drm_auth.c:320 drm_master_release() warn: unlocked access 'master' (line 318) expected lock '&dev->master_mutex'
>>>
>>> The 'file_priv->master' field should be protected by the mutex lock to
>>> '&dev->master_mutex'. This is because other processes can concurrently
>>> modify this field and free the current 'file_priv->master'
>>> pointer. This could result in a use-after-free error when 'master' is
>>> dereferenced in subsequent function calls to
>>> 'drm_legacy_lock_master_cleanup()' or to 'drm_lease_revoke()'.
>>>
>>> An example of a scenario that would produce this error can be seen
>>> from a similar bug in 'drm_getunique()' that was reported by Syzbot:
>>> https://syzkaller.appspot.com/bug?id=148d2f1dfac64af52ffd27b661981a540724f803
>>>
>>> In the Syzbot report, another process concurrently acquired the
>>> device's master mutex in 'drm_setmaster_ioctl()', then overwrote
>>> 'fpriv->master' in 'drm_new_set_master()'. The old value of
>>> 'fpriv->master' was subsequently freed before the mutex was unlocked.
>>>
>>> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>>> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
>>
>> Thanks a lot. I've done an audit of this code, and I found another
>> potential problem in drm_is_current_master. The callers from drm_auth.c
>> hold the dev->master_mutex, but all the external ones dont. I think we
>> need to split this into a _locked function for use within drm_auth.c, and
>> the exported one needs to grab the dev->master_mutex while it's checking
>> master status. Ofc there will still be races, those are ok, but right now
>> we run the risk of use-after free problems in drm_lease_owner.
>>
> Note that some code does acquire the mutex via
> drm_master_internal_acquire - so we should be careful.
> As mentioned elsewhere - having a _locked version of
> drm_is_current_master sounds good.
> 
> Might as well throw a lockdep_assert_held_once in there just in case :-P
> 
> Happy to help review the follow-up patches.
> -Emil
> 

Thanks for the advice, Emil!

I did a preliminary check on the code that calls 
drm_master_internal_acquire in drm_client_modeset.c and drm_fb_helper.c, 
and it doesn't seem like they eventually call drm_is_current_master. So 
we should be good on that front.

lockdep_assert_held_once sounds good :)

Best wishes,
Desmond

