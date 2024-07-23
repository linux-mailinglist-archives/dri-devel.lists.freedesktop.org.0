Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1C8939C19
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 09:58:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B296110E478;
	Tue, 23 Jul 2024 07:58:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="A8Qm+vgk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04A4710E478
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 07:58:46 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4272738eb9eso38804985e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 00:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1721721525; x=1722326325;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=umNAcUqJdRtZr0xF+y+QGLOd2nx2R4lw7z6ws/NwhSI=;
 b=A8Qm+vgk9jgteboHEzhFnzjek5PEOwXaxDhChTdjCvMn1n5S05XwdEbx6OFSW3YHDw
 TIwV1Mj49lHgcVAM67oP3TkXOZtONWnrg+2EOnnZAcz2Of8xokN9aAFDagCSOx0vMQch
 yXyAImtpeq7TsXCXHniNy4X/4VAsOukpE1TvImLIPhhSgCEsKaC+6HVBZNcCXubHU2ed
 98+eQ78+K0cVMZ7c0v8unHgy9L6JvLXQIAQD/pjrK2VTW0ljZAlc6vf10fbUtCDC1kgK
 ww9F8kWjlC/W5yZJKPZ8BYomWny5DrB3sdLUweJnWWWEaRL0ZkE8NzRvEbXMtJ48457E
 QZ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721721525; x=1722326325;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=umNAcUqJdRtZr0xF+y+QGLOd2nx2R4lw7z6ws/NwhSI=;
 b=E7fvVmCZd/VxM8oo1B89gMRRVfm1VA3ycCJQslv+gUEEzVk8v8vrqIO0gv/rH079E4
 qHOVC/a0p0qeU8qK7GWCzf/f6hhDAyN+zJu0Tjf+/sfCCZiF/kLBw2ZNCIKScJg8zFY3
 NlQsI1E7UboPFxeKTyej52I78NrTK8xwQMZKv5oPhIu5+w5noP4fUOGNkTfCamyEpd6n
 6MjPwiyWVzn5vda9aLE3FMSgqGs/Bnp3WwwflOq0SDwhFDLAZ8d3r6agk+3jDaaudgpE
 EDfsuNDLm4D8VB5JqDeGaRSL3K6McNquwMac4plikvRqK9367wR0Jp9gk2p8MArTkjuE
 YCHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBfjAN6Bn8oPyZqbsbOqq5EbD7TO5zzrMy/A1cp7k+0gKnn8Okf94MBQgUR2lDR6luzNwTuhUbebcjwv/MQfu2HSa9i8ZpbeT/mcdX+Iut
X-Gm-Message-State: AOJu0Yxor0IAskhWgXuyFd/tiCCBgUPfBah8HatiyK4fU0YG8ovwrixg
 40cqtiJPyH04iHLhWVpEAZf1OqApSXizRoEYc6PrmgODBXc/Yk1QyEBeLwwvWW0=
X-Google-Smtp-Source: AGHT+IGh5SVVErDKpfRMcH320xfK+fubRln8dcW8PmujwZANOvUs4TjqYpr90bWsiVfeAm0f4OBdVA==
X-Received: by 2002:a05:600c:1e02:b0:427:9dad:181d with SMTP id
 5b1f17b1804b1-427efe253afmr5775285e9.11.1721721524176; 
 Tue, 23 Jul 2024 00:58:44 -0700 (PDT)
Received: from [192.168.0.101] ([84.69.19.168])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d2a947fasm186525585e9.43.2024.07.23.00.58.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jul 2024 00:58:43 -0700 (PDT)
Message-ID: <1fa79ff6-9ab0-4b2f-a776-c90f7ce23a80@ursulin.net>
Date: Tue, 23 Jul 2024 08:58:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] drm/i915/pmu: Let resource survive unbind
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 intel-gfx@lists.freedesktop.org, linux-perf-users@vger.kernel.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 linux-kernel@vger.kernel.org
References: <20240722210648.80892-1-lucas.demarchi@intel.com>
 <20240722210648.80892-6-lucas.demarchi@intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20240722210648.80892-6-lucas.demarchi@intel.com>
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


On 22/07/2024 22:06, Lucas De Marchi wrote:
> There's no need to free the resources during unbind. Since perf events
> may still access them due to open events, it's safer to free them when
> dropping the last i915 reference.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   drivers/gpu/drm/i915/i915_pmu.c | 21 ++++++++++++++++-----
>   1 file changed, 16 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
> index b5d14dd318e4..8708f905f4f4 100644
> --- a/drivers/gpu/drm/i915/i915_pmu.c
> +++ b/drivers/gpu/drm/i915/i915_pmu.c
> @@ -5,6 +5,7 @@
>    */
>   
>   #include <linux/pm_runtime.h>
> +#include <drm/drm_managed.h>
>   
>   #include "gt/intel_engine.h"
>   #include "gt/intel_engine_pm.h"
> @@ -1152,6 +1153,17 @@ static void free_event_attributes(struct i915_pmu *pmu)
>   	pmu->pmu_attr = NULL;
>   }
>   
> +static void free_pmu(struct drm_device *dev, void *res)
> +{
> +	struct i915_pmu *pmu = res;
> +	struct drm_i915_private *i915 = pmu_to_i915(pmu);
> +
> +	free_event_attributes(pmu);
> +	kfree(pmu->base.attr_groups);
> +	if (IS_DGFX(i915))
> +		kfree(pmu->name);
> +}
> +
>   static int i915_pmu_cpu_online(unsigned int cpu, struct hlist_node *node)
>   {
>   	struct i915_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), cpuhp.node);
> @@ -1302,6 +1314,9 @@ void i915_pmu_register(struct drm_i915_private *i915)
>   	if (ret)
>   		goto err_unreg;
>   
> +	if (drmm_add_action_or_reset(&i915->drm, free_pmu, pmu))
> +		goto err_unreg;

Is i915_pmu_unregister_cpuhp_state missing on this error path?

Regards,

Tvrtko

> +
>   	return;
>   
>   err_unreg:
> @@ -1336,11 +1351,7 @@ void i915_pmu_unregister(struct drm_i915_private *i915)
>   	hrtimer_cancel(&pmu->timer);
>   
>   	i915_pmu_unregister_cpuhp_state(pmu);
> -
>   	perf_pmu_unregister(&pmu->base);
> +
>   	pmu->base.event_init = NULL;
> -	kfree(pmu->base.attr_groups);
> -	if (IS_DGFX(i915))
> -		kfree(pmu->name);
> -	free_event_attributes(pmu);
>   }
