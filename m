Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6BEA68AF7
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 12:14:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1397910E2CC;
	Wed, 19 Mar 2025 11:14:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UjvFSQfH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72DEE10E2CC;
 Wed, 19 Mar 2025 11:14:34 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-43ce71582e9so30008865e9.1; 
 Wed, 19 Mar 2025 04:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742382873; x=1742987673; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wFCN5PXntQYjGappLTD03Z+OTDDIQrakXEXEfFrYiao=;
 b=UjvFSQfH0cdJEr3Hqil2uMRfx7KtfxVIZSTB51GUMa4oMO0zWO4/FTTgYox4+GzuhS
 cvhTGj4cwGItSg4ft+pQX9d6KS3F6PRaN0o2qc9zsaF6W8kU99wC66QGIg1Ow4s1VMCu
 xYTbd1OZirzrzcU4k+sh5CUBT0ujD0IsTRrB9PyaLO30P5ZIL9t/7kPdeYWKwQYcf+AM
 VWRjCbe+ouh0NfcnU0qr0o/OnZrqu0DuCjcs2b+JHYVCBNjB2l5P9pxZ096voUMhRaVA
 is0AQVZ7rFdUvWrXpOUO6qMFA4xCOiMPSBlyp+Ykp5ZEgnpI6+NbYTyA8646S+WU+9j0
 I4zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742382873; x=1742987673;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wFCN5PXntQYjGappLTD03Z+OTDDIQrakXEXEfFrYiao=;
 b=ORfG/9hWXNpdU+/rXqNP+CK1Vpv7DFyI3U9nVGty+6FQ9kScrlqfqtcn0ndypepbH2
 sXVDhsgcUpWd+VEshCKk5ew+B78KLfhphY083F33eRN2QLzujE3UNB16cgGRRqVPw1L3
 Ncn5vV76/qn0XuzJtaQogTYSkJDqxipTqz88/Jz0waNHrvROVjyuB6Mk3D6peN/M/lNV
 N4o7F5TH/f1EcbDKw50Tal3Qp96ajl86E0SjRI2ENyxC1bWvpPRjs4/3LsEl6rkXi66P
 X9W9R0Jmr1WCQawN6m3Ytdq4yqkiOAM0zX/AMPIxNx3RdBKVGjSq/PJYpJTwXBeEegPI
 IPdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEBiFBHDvpKCVHNpnuf5oxzKRzri0bXlCHTIkPHby815sXee+DTYOhO6y1rPMuwlEpBnVvtpZo@lists.freedesktop.org,
 AJvYcCXVf3wr4p3x7VcrwLJZkRfHgLFDCWrIOLzzUSDwjpH5GcsPr37+w3xuXot4NyU7RzVT/Th4GpiLHFdf@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwwdJ6HLR6G+n6yO56HSjZeNfAB94q3BUQbeLdbwkzc8q1fMK07
 wdGmMKeuoCblYSly8/eBuMM06BCMc07gbIBZldL6jaushGSCdPCE
X-Gm-Gg: ASbGncuGolZWwpHpnzT4c5Hl75wAOMqkrb1Xw9IlfWJ/sjZQ2V4RcqydJKjjUqz9NmJ
 iwZ3vcjqwCHP33esRJMNMUF8FhZAgHhlRJgrajC69Vz8ek+UAwPYPBwQcuxR22L66Lx4xUzXR3c
 PYV1Q3C+eRrD9dIp1YqPaszuKC40uDKgXopW0v/rsCgB1PgRWpAVB91/waHHBnISrt0DGqiC6HI
 +Idsqb5+zJVEp6waQkgSU53ZkNtbyXONimZWvaKAFBG4JvsEip0nAZ8tnygJdv9IipkSvIPbfZE
 TA9BBZr01bpQ+yNKEAdQ/W7bLiF5JONwpIKA6g/HLkbDCQLJWtbH0VzNlZAERg3tHDi2lnwGkA=
 =
X-Google-Smtp-Source: AGHT+IFLs3sQ0GabpKeyWE1AMOX6iIh6HbY5ZommtiWkT5RRXuEP+ePKWR+Gwdh0E2hzUef3STraaQ==
X-Received: by 2002:a05:600c:3482:b0:43c:f8fc:f697 with SMTP id
 5b1f17b1804b1-43d4378d04bmr21540625e9.9.1742382872492; 
 Wed, 19 Mar 2025 04:14:32 -0700 (PDT)
Received: from [10.254.108.83] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43f4542dsm15731075e9.15.2025.03.19.04.14.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Mar 2025 04:14:32 -0700 (PDT)
Message-ID: <b405637a-2f21-4561-97f3-3b0a3c0deabf@gmail.com>
Date: Wed, 19 Mar 2025 12:14:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/sched: add drm_sched_prealloc_dependency_slots
To: Danilo Krummrich <dakr@kernel.org>
Cc: phasta@mailbox.org, tvrtko.ursulin@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20250318120313.19099-1-christian.koenig@amd.com>
 <20250318120313.19099-2-christian.koenig@amd.com> <Z9lpZiRaq0B80XoL@pollux>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <Z9lpZiRaq0B80XoL@pollux>
Content-Type: text/plain; charset=UTF-8
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

Am 18.03.25 um 13:39 schrieb Danilo Krummrich:
> On Tue, Mar 18, 2025 at 01:03:12PM +0100, Christian König wrote:
>>  /**
>>   * drm_sched_job_add_dependency - adds the fence as a job dependency
>>   * @job: scheduler job to add the dependencies to
>> @@ -878,10 +910,12 @@ int drm_sched_job_add_dependency(struct drm_sched_job *job,
>>  	 * engines involved, rather than the number of BOs.
>>  	 */
>>  	xa_for_each(&job->dependencies, index, entry) {
>> -		if (entry->context != fence->context)
>> +		bool signaled = dma_fence_is_signaled(entry);
>> +
>> +		if (!signaled && entry->context != fence->context)
>>  			continue;
>>  
>> -		if (dma_fence_is_later(fence, entry)) {
>> +		if (signaled || dma_fence_is_later(fence, entry)) {
>>  			dma_fence_put(entry);
>>  			xa_store(&job->dependencies, index, fence, GFP_KERNEL);
>>  		} else {
>> @@ -890,7 +924,8 @@ int drm_sched_job_add_dependency(struct drm_sched_job *job,
>>  		return 0;
>>  	}
>>  
>> -	ret = xa_alloc(&job->dependencies, &id, fence, xa_limit_32b, GFP_KERNEL);
>> +	ret = xa_alloc(&job->dependencies, &id, fence, xa_limit_32b,
>> +		       GFP_KERNEL);
>>  	if (ret != 0)
>>  		dma_fence_put(fence);
> Those changes seem unrelated, aren't they?

Ah, yes that was just a leftover from a previous try to fix this.

Thanks,
Christian.
