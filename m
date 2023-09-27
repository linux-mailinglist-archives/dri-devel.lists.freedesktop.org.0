Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 200CA7B034A
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 13:45:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B54910E4E6;
	Wed, 27 Sep 2023 11:45:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE4FC10E4E6
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 11:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695815144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nvsPqdWL7XgWKeKWvC9F1HtbY+HpBNK3bs0TVz67ajA=;
 b=YVwTbuKpUN+EpKH0kdTstmrsNnIO8u2qn1grJ2uP2m0ZYXVNGfTNcePKcRDYVd4CnUH2gT
 jWaCEk5T2HsctyyM4+aih+uiZ2T/qxWTuyPqrabpBpecY5j4vhDTp+CtzQLT72FoP/yEzV
 4G1TqjrifVaMAPxIEEWWU30U5Wp3brc=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-256-r5PyGPszOIq1_RpL2Zgf5w-1; Wed, 27 Sep 2023 07:45:40 -0400
X-MC-Unique: r5PyGPszOIq1_RpL2Zgf5w-1
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-503555a717fso17320478e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 04:45:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695815139; x=1696419939;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nvsPqdWL7XgWKeKWvC9F1HtbY+HpBNK3bs0TVz67ajA=;
 b=s1+VI5Df1lXrJjRcKux+NYkk7N4G/FLA3sRx1dXwbcHnQqPH6Kd3qJcCSvOHpxKD+m
 l8XafmkmvufSYd4mIt409XK0wX5XYNQ+zvccum5lVFluWG9fJX2ExOx2P3dvLLJF60ZV
 vuDiKgD6ghYcyqRPQu1q8AJpf3j68ZO1+jL99NB1iUEJmdTgbbqBZD2/NxZ1DhphbP4O
 AcrxlTPkY7Pr0h0UruJx7f3r7axolwJcyrPYqbauXUSUUiKwnE092deGWV8m9NkAAU3q
 Hli6HRxoPNqLVb/sKwDc0wmNNQFsxS4puIq0K9aX7VxP/HQOIaUKFByFG4hHHCrsbxQZ
 0vJA==
X-Gm-Message-State: AOJu0YzkU+lwAQBe+FijT9tceBnTn2NwsqpYGLLaoIVqzpZjSPfv5q4x
 ZkGjJuLZtOCHnY7a3wapLxBN58H4wRiIcJM286DetJLv3JN7Sj4VUOgfUw8tCPZIqsdHu8Ahk40
 llcjtPkz/CXZZlU404GlP6Htc9tTg
X-Received: by 2002:a05:6512:1287:b0:503:183c:1223 with SMTP id
 u7-20020a056512128700b00503183c1223mr2243229lfs.7.1695815139375; 
 Wed, 27 Sep 2023 04:45:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMxjIWznnDjMe6Hk6VxuIsyF02/jJ80hi8lUi5oaXw4lt20x5rKCPRe8RS/GUfXlNVDxbElQ==
X-Received: by 2002:a05:6512:1287:b0:503:183c:1223 with SMTP id
 u7-20020a056512128700b00503183c1223mr2243209lfs.7.1695815139037; 
 Wed, 27 Sep 2023 04:45:39 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 i13-20020a056402054d00b0052a063e52b8sm7930477edx.83.2023.09.27.04.45.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Sep 2023 04:45:38 -0700 (PDT)
Message-ID: <a050bc34-d98e-3d75-8c79-447dc7c913a1@redhat.com>
Date: Wed, 27 Sep 2023 13:45:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH drm-misc-next 1/3] drm/sched: implement dynamic job flow
 control
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20230924224555.15595-1-dakr@redhat.com>
 <312983ee-ba4c-477e-8846-072c815df862@amd.com>
 <12f19494-7fd0-055f-4135-e17581398eb5@redhat.com>
 <20230927092514.04776822@collabora.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20230927092514.04776822@collabora.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: matthew.brost@intel.com, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Luben Tuikov <luben.tuikov@amd.com>, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/27/23 09:25, Boris Brezillon wrote:
> On Wed, 27 Sep 2023 02:13:59 +0200
> Danilo Krummrich <dakr@redhat.com> wrote:
> 
>> On 9/26/23 22:43, Luben Tuikov wrote:
>>> Hi,
>>>
>>> On 2023-09-24 18:43, Danilo Krummrich wrote:
>>>> Currently, job flow control is implemented simply by limiting the amount
>>>> of jobs in flight. Therefore, a scheduler is initialized with a
>>>> submission limit that corresponds to a certain amount of jobs.
>>>
>>> "certain"? How about this instead:
>>> " ... that corresponds to the number of jobs which can be sent
>>>     to the hardware."?
>>>    
>>>>
>>>> This implies that for each job drivers need to account for the maximum
>>>                                   ^,
>>> Please add a comma after "job".
>>>    
>>>> job size possible in order to not overflow the ring buffer.
>>>
>>> Well, different hardware designs would implement this differently.
>>> Ideally, you only want pointers into the ring buffer, and then
>>> the hardware consumes as much as it can. But this is a moot point
>>> and it's always a good idea to have a "job size" hint from the client.
>>> So this is a good patch.
>>>
>>> Ideally, you want to say that the hardware needs to be able to
>>> accommodate the number of jobs which can fit in the hardware
>>> queue times the largest job. This is a waste of resources
>>> however, and it is better to give a hint as to the size of a job,
>>> by the client. If the hardware can peek and understand dependencies,
>>> on top of knowing the "size of the job", it can be an extremely
>>> efficient scheduler.
>>>    
>>>>
>>>> However, there are drivers, such as Nouveau, where the job size has a
>>>> rather large range. For such drivers it can easily happen that job
>>>> submissions not even filling the ring by 1% can block subsequent
>>>> submissions, which, in the worst case, can lead to the ring run dry.
>>>>
>>>> In order to overcome this issue, allow for tracking the actual job size
>>>> instead of the amount job jobs. Therefore, add a field to track a job's
>>>
>>> "the amount job jobs." --> "the number of jobs."
>>
>> Yeah, I somehow manage to always get this wrong, which I guess you noticed
>> below already.
>>
>> That's all good points below - gonna address them.
>>
>> Did you see Boris' response regarding a separate callback in order to fetch
>> the job's submission units dynamically? Since this is needed by PowerVR, I'd
>> like to include this in V2. What's your take on that?
>>
>> My only concern with that would be that if I got what Boris was saying
>> correctly calling
>>
>> WARN_ON(s_job->submission_units > sched->submission_limit);
>>
>> from drm_sched_can_queue() wouldn't work anymore, since this could indeed happen
>> temporarily. I think this was also Christian's concern.
> 
> Actually, I think that's fine to account for the max job size in the
> first check, we're unlikely to have so many native fence waits that our
> job can't fit in an empty ring buffer.
> 

But it can happen, right? Hence, we can't have this check, do we?

