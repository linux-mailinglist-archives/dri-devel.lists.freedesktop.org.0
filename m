Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2BC69092A
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 13:45:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F34E710E9CE;
	Thu,  9 Feb 2023 12:45:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C7B710E9CE
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 12:45:37 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id j25so1644511wrc.4
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Feb 2023 04:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xyyxzwJERH57E62AiQ6YcyYsyCAb33uzA+MhL2QfTb0=;
 b=VmwoSc0VK1iqrfsNVSAWD5RcWl/d1/3piAZ+2yYTrTw69b/7fOXrjNHVt3+Ddbbbwk
 hAxoUPAAARKLdZjU3gmUTmnYZF4hL8061vyX/3226nbsEOXLPLAbytf1jxgRu96yKPkB
 m+3glQHdpDmLAUtqLCOYImQBeARasMh4k7MVrr9Z8fuVKgziVVdmPwIcN4cODXQz1K+X
 KIEpzo6i138GTuq78EAPzTDKHTu6ao4b/r57f1op7/PyKtO84jYoZhmfXYR8BnnloD2z
 muxggLDPqjWx1Ct+To+cBPHTeyOI8isdbAB53lcM3hzK2mqtykPI87G0V0cSV9+FoQKq
 KmVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xyyxzwJERH57E62AiQ6YcyYsyCAb33uzA+MhL2QfTb0=;
 b=aFQgXfPY0e+07WGyGMyVkTFVb48BjKOyDMblWek3M7lLvSk05NBLDP0/BJkBn+uq54
 cJHBKoFW9Heapp+YK52uZdFONMSjTmoSIG+lJJoEdkCbLgcdaClUwrwXbqIUOeTp3ku0
 edxDu73kAOG7x/t1TA55FkvFFViL9RsY+ASM1dru55ihZOq3O3E8O6yqrzjB/BU4ctvG
 xPZJVZzCCL7mEtVDuTJ6E6BfL0xuTe6HPGR0Lu2SV/Z+pn9UPr0RJyJf/OWw0RvLWx+5
 ML8fjqGA1fMfvDO+7BOWrMPwurl9ztp16NpRoQZ1SILBeEB5ic+2supvjBM980yh6g65
 /emQ==
X-Gm-Message-State: AO0yUKW8VDsnfumdasadMm8oAihDaQv/D1e3ux4Ub4I26TuES3f7Te8R
 A7hor5Xr2Uv1dahlzcZ8P8E=
X-Google-Smtp-Source: AK7set/S2I6/7P4Zdz6ANp0tSBYfOKrKTDk6dZecVf3rYZlXsNJ+Im8EKaD9que3VGlUoSKvNxVCCw==
X-Received: by 2002:a5d:5306:0:b0:2c3:ded0:35ed with SMTP id
 e6-20020a5d5306000000b002c3ded035edmr10070920wrv.67.1675946735572; 
 Thu, 09 Feb 2023 04:45:35 -0800 (PST)
Received: from [192.168.178.21] (p5b0ea2e7.dip0.t-ipconnect.de.
 [91.14.162.231]) by smtp.gmail.com with ESMTPSA id
 v2-20020a5d6102000000b002be5bdbe40csm1174919wrt.27.2023.02.09.04.45.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 04:45:35 -0800 (PST)
Message-ID: <c336a772-0f16-a696-c6b5-21d956f16935@gmail.com>
Date: Thu, 9 Feb 2023 13:45:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 5/5] drm/v3d: Use drm_sched_job_add_syncobj_dependency()
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>
References: <20230208194817.199932-1-mcanal@igalia.com>
 <20230208194817.199932-6-mcanal@igalia.com>
 <20230209112731.bzwlhwmimg5vvmhd@mail.igalia.com>
 <df67ca19-5bfa-ba1f-3601-1218db2a0aa5@amd.com>
 <20230209123605.ctr7g75ekslmmboh@mail.igalia.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20230209123605.ctr7g75ekslmmboh@mail.igalia.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Sumit Semwal <sumit.semwal@linaro.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 09.02.23 um 13:36 schrieb Melissa Wen:
> On 02/09, Christian König wrote:
>> Am 09.02.23 um 12:27 schrieb Melissa Wen:
>>> On 02/08, Maíra Canal wrote:
>>>> As v3d_job_add_deps() performs the same steps as
>>>> drm_sched_job_add_syncobj_dependency(), replace the open-coded
>>>> implementation in v3d in order to simply, using the DRM function.
>>>>
>>>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>>>> ---
>>>>    drivers/gpu/drm/v3d/v3d_gem.c | 9 +--------
>>>>    1 file changed, 1 insertion(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
>>>> index 5da1806f3969..f149526ec971 100644
>>>> --- a/drivers/gpu/drm/v3d/v3d_gem.c
>>>> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
>>>> @@ -400,14 +400,7 @@ static int
>>>>    v3d_job_add_deps(struct drm_file *file_priv, struct v3d_job *job,
>>>>    		 u32 in_sync, u32 point)
>>>>    {
>>>> -	struct dma_fence *in_fence = NULL;
>>>> -	int ret;
>>>> -
>>>> -	ret = drm_syncobj_find_fence(file_priv, in_sync, point, 0, &in_fence);
>>>> -	if (ret == -EINVAL)
>>>> -		return ret;
>>>> -
>>>> -	return drm_sched_job_add_dependency(&job->base, in_fence);
>>>> +	return drm_sched_job_add_syncobj_dependency(&job->base, file_priv, in_sync, point);
>>> Hi Maíra,
>>>
>>> First, thanks for making this function a common-code.
>>>
>>> There are two issues to address before moving v3d to the new
>>> drm_sche_job_add_syncobj_dependency():
>>>
>>> 1. We don't need the v3d_job_add_deps one line function just wrapping
>>> the new drm_sched_job_add_syncobj_dependency() with the same parameters.
>>> We can just replace all occurrences of v3d function with drm_sched
>>> function. Except if we use v3d_job_add_deps to address the second issue:
>>>
>>> 2. Currently, v3d_job_add_deps returns 0 (success) if
>>> drm_syncobj_find_fence() doesn't find the syncobj from handle (-ENOENT),
>>> but drm_sched_job_add_syncobj_dependency() returns a negative value on
>>> this case. If it happens, job submissions will fail (and may cause a
>>> regression). One way to solve it is checking the return value of
>>> drm_sched_job_add_syncobj_dependency in v3d_job_add_deps.  The second
>>> way is to replace v3d_job_add_deps by
>>> drm_sched_job_add_syncobj_dependency and check expected return values
>>> there.
>> Oh, wait a second. This behavior is most likely a bug in V3D.
>>
>> When a syncobj can't find a timeline point aborting the IOCTL with -ENOENT
>> is mandatory or otherwise you run into trouble with wait before signal
>> handling for Vulkan.
>>
>> This should be common behavior for all drivers which at some point want to
>> support Vulkan.
> So, v3d doesn't support timeline syncobj yet, and I took a look at
> returning errors on drm_syncobj_find_fence, for timeline syncobj they
> can be `-ETIME` and `-ERESTARTSYS`.

In this case forget what I've said. This just doesn't apply to V3D for now.

> TBH, I don't exactly know the design reason for accepting a ENOENT from
> drm_syncobj_find_fence. I suspect it's only trying to deal with the
> `in_sync == 0` case (that would be better replaced by a `if then;
> continue;`).
>
> In any case, I think it isn't good to change this behavior in the same
> time we are moving to another function. I'd prefer to preserve the
> current behavior here and better investigate/address this issue in
> another patch.

I would just keep the current behavior with an if and add something like 
"TODO: Investigate why this was filtered out for the IOCTL".

Christian.

>
> Melissa
>
>> Regards,
>> Christian.
>>
>>> Melissa
>>>
>>>>    }
>>>>    static int
>>>> -- 
>>>> 2.39.1
>>>>

