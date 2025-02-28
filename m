Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29313A49982
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 13:38:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A7F510EC84;
	Fri, 28 Feb 2025 12:38:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="qIH0mDlE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C92010EC94
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 12:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1740746298;
 bh=YiXSMEs1WmqmVHd09AJ85IwIatOEb4iEeGZ8qUBwlQY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=qIH0mDlEzvSZ+tfY8AXSKv4grR/j0uFU5EEsHKijdSUeXskyfoe8l6fp2CpdpVjjY
 uGc2GZdgSFhCqH/m5AeiAqZqCmJOlY5S1V2PaPpI6nTWJYwXIy7CLQDaWHhJOH8zRh
 1vxsQUqI/wzpARKmP4kN25MB1KVZHlvIUEOhwcPNqAd4Z6Oqx6Rjwd85yPsRZCuNV9
 G2IEJeB2l48p25WbrVkK/RXn0rFHW5Hrnw1wy26Xdfartkv1ucYmNqVU37C1gtVomm
 jomU1xvEYqYv22KPFKsuot7EeJQ/dq7KqM0NsCBot/qAgCHNjmmBRWLpRFBZ3adSqS
 CtYV8nLfjc7ng==
Received: from [192.168.50.250] (unknown [171.76.85.20])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id E30CF17E017D;
 Fri, 28 Feb 2025 13:38:15 +0100 (CET)
Message-ID: <e8e7de99-ade8-48ca-804c-58ce3fedad4b@collabora.com>
Date: Fri, 28 Feb 2025 18:08:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/ci: fix merge request rules
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
 helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch,
 robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, valentine.burley@collabora.com,
 linux-kernel@vger.kernel.org
References: <20250227042058.409003-1-vignesh.raman@collabora.com>
 <ondpwjsgujhk7wo3gaajoeamcf4gkp424cxmyslwsybrlkzo5f@xh3yx2r2mp6k>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <ondpwjsgujhk7wo3gaajoeamcf4gkp424cxmyslwsybrlkzo5f@xh3yx2r2mp6k>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

On 28/02/25 12:28, Dmitry Baryshkov wrote:
> On Thu, Feb 27, 2025 at 09:50:50AM +0530, Vignesh Raman wrote:
>> Merge request pipelines were only created when changes
>> were made to drivers/gpu/drm/ci/, causing MRs that
>> didn't touch this path to break. Fix MR pipeline rules
>> to trigger jobs for all changes.
>>
>> Run jobs automatically for marge-bot and scheduled
>> pipelines, but in all other cases run manually. Also
>> remove CI_PROJECT_NAMESPACE checks specific to mesa.
>>
>> Fixes: df54f04f2020 ("drm/ci: update gitlab rules")
>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
>> ---
>>
>> v2:
>>    - Run jobs automatically for marge-bot and scheduled
>>      pipelines, but in all other cases run manually. Also
>>      remove CI_PROJECT_NAMESPACE checks specific to mesa.
>>
>> ---
>>   drivers/gpu/drm/ci/gitlab-ci.yml | 21 +++++----------------
>>   1 file changed, 5 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
>> index f04aabe8327c..f4e324e156db 100644
>> --- a/drivers/gpu/drm/ci/gitlab-ci.yml
>> +++ b/drivers/gpu/drm/ci/gitlab-ci.yml
>> @@ -143,11 +143,11 @@ stages:
>>       # Pre-merge pipeline
>>       - if: &is-pre-merge $CI_PIPELINE_SOURCE == "merge_request_event"
>>       # Push to a branch on a fork
>> -    - if: &is-fork-push $CI_PROJECT_NAMESPACE != "mesa" && $CI_PIPELINE_SOURCE == "push"
>> +    - if: &is-fork-push $CI_PIPELINE_SOURCE == "push"
>>       # nightly pipeline
>>       - if: &is-scheduled-pipeline $CI_PIPELINE_SOURCE == "schedule"
>>       # pipeline for direct pushes that bypassed the CI
>> -    - if: &is-direct-push $CI_PROJECT_NAMESPACE == "mesa" && $CI_PIPELINE_SOURCE == "push" && $GITLAB_USER_LOGIN != "marge-bot"
>> +    - if: &is-direct-push $CI_PIPELINE_SOURCE == "push" && $GITLAB_USER_LOGIN != "marge-bot"
>>   
>>   
>>   # Rules applied to every job in the pipeline
>> @@ -170,26 +170,15 @@ stages:
>>       - !reference [.disable-farm-mr-rules, rules]
>>       # Never run immediately after merging, as we just ran everything
>>       - !reference [.never-post-merge-rules, rules]
>> -    # Build everything in merge pipelines, if any files affecting the pipeline
>> -    # were changed
>> +    # Build everything in merge pipelines
>>       - if: *is-merge-attempt
>> -      changes: &all_paths
>> -      - drivers/gpu/drm/ci/**/*
>>         when: on_success
>>       # Same as above, but for pre-merge pipelines
>>       - if: *is-pre-merge
>> -      changes:
>> -        *all_paths
>> -      when: manual
>> -    # Skip everything for pre-merge and merge pipelines which don't change
>> -    # anything in the build
>> -    - if: *is-merge-attempt
>> -      when: never
>> -    - if: *is-pre-merge
>> -      when: never
>> +    - when: manual
> 
> I believe there should be no dash on this line
> 
>>       # Build everything after someone bypassed the CI
>>       - if: *is-direct-push
>> -      when: on_success
>> +    - when: manual
> 
> And on this line too.

Thanks for spotting this. Will fix and send v3.

Regards,
Vignesh

> 
>>       # Build everything in scheduled pipelines
>>       - if: *is-scheduled-pipeline
>>         when: on_success
>> -- 
>> 2.47.2
>>
> 

