Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E802F939BF9
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 09:53:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A68B410E470;
	Tue, 23 Jul 2024 07:53:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="fXSCJFB2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 119D510E470
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 07:53:01 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-42797bcfc77so38670995e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 00:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1721721179; x=1722325979;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NSxFHfDFN+MiVLSyULOWbYjXLDYVoJ0fH1mNtWGCU7I=;
 b=fXSCJFB2jYvrkFfNQKM9VbNNKKB2eEjJFqNiH7/STDzEoQyQ+QyvsZ6UvoUt+QZwK9
 Ugep2RtkVdOETy89Zmi4YP4KQjpazDE3sBCxYp6zu4bS6PMfmW5GeNjejN40K3w/56fd
 iFFbHDr4vQKT8u7GEwyJQILzTwVb9UJnW80EreOnld8/Zp5zXXNenTekgP088LZpeloN
 CpdjozIQlS1JIJoWFV2I/LI90KOz/tziyOhylyWYqe2xX3NmU5MEHrS0Kq5bBgjz3jj+
 I6bOzfJF4xNQZ18bwImvQhpK6zTrQr88AfKI6CPpnMWzXh1E4SyxqWj3ieEqeUp5SAFT
 Afhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721721179; x=1722325979;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NSxFHfDFN+MiVLSyULOWbYjXLDYVoJ0fH1mNtWGCU7I=;
 b=Zn/SyBCXiYNcILSh3U1JV6LNyuC7H/EJkO5EtZlmxJNAJuiyo/vGuKhHNt6ihmTRoW
 g8D4gfRDx3J5u/yz9ot3z+Nc/v4xyIbFad7E4INM8zlHl4Cb7lY9k/WkC7jl2sG1qxJR
 869fM74hn0ZAntP7rPLK+rt8pR/PHDFUkrU1KjiuOBFB7UMaC9cd/1XHRiZodozlq9z6
 KPrqs5t07e6SdwMkaKqoQS6bzSPY0DQr12PNfavKVbhoYxei+isSeh6BGscCL2KvWSYz
 u1/9/w771W/o1ii2zvovJ3LGV96G1V79PQUEk/JrxfZcrxt5AfyHA+Y1OW2nXd9cY3EN
 DIXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXK6Mkvv9sGhJUIm+Xh8LMIaByqCYEjjPn98xu84JtYovuzcQYEWRZrPPvZSTilVBD7zQkPMxN4ui96dba1AU7CtexQ3lz9W0clg72pzlmc
X-Gm-Message-State: AOJu0YzMxEzGmL3nSn40Ug5CMHLUccOc9t75l7ykrKAYhZZ3BJB8DWpw
 QQmc7TtrD4Dt4r+ds3xM7DSp9lcYeBC797tC5nvldMGdfKfH9zdiDM1ggZ30rHs=
X-Google-Smtp-Source: AGHT+IE9Cvh25hfaQz/Gp/ZdOfzixVQt2BVNg/bV++7oWQiR7JI21E3NokuVP3ZF00d3/6mUezvKcQ==
X-Received: by 2002:a05:600c:3c94:b0:426:629f:1556 with SMTP id
 5b1f17b1804b1-427dc56476amr60061065e9.31.1721721179228; 
 Tue, 23 Jul 2024 00:52:59 -0700 (PDT)
Received: from [192.168.0.101] ([84.69.19.168])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d2a7218esm181620735e9.25.2024.07.23.00.52.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jul 2024 00:52:58 -0700 (PDT)
Message-ID: <4cd8c6c7-bd15-4663-bb0b-815904560c90@ursulin.net>
Date: Tue, 23 Jul 2024 08:52:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] drm/i915/pmu: Drop is_igp()
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 intel-gfx@lists.freedesktop.org, linux-perf-users@vger.kernel.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 linux-kernel@vger.kernel.org
References: <20240722210648.80892-1-lucas.demarchi@intel.com>
 <20240722210648.80892-5-lucas.demarchi@intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20240722210648.80892-5-lucas.demarchi@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 22/07/2024 22:06, Lucas De Marchi wrote:
> There's no reason to hardcode checking for integrated graphics on a
> specific pci slot. That information is already available per platform an
> can be checked with IS_DGFX().

Hmm probably reason was this, added is_igp:

commit 05488673a4d41383f9dd537f298e525e6b00fb93
Author:     Tvrtko Ursulin <tursulin@ursulin.net>
AuthorDate: Wed Oct 16 10:38:02 2019 +0100
Commit:     Tvrtko Ursulin <tursulin@ursulin.net>
CommitDate: Thu Oct 17 10:50:47 2019 +0100

     drm/i915/pmu: Support multiple GPUs

Added IS_DGFX:

commit dc90fe3fd219c7693617ba09a9467e4aadc2e039
Author:     José Roberto de Souza <jose.souza@intel.com>
AuthorDate: Thu Oct 24 12:51:19 2019 -0700
Commit:     Lucas De Marchi <lucas.demarchi@intel.com>
CommitDate: Fri Oct 25 13:53:51 2019 -0700

     drm/i915: Add is_dgfx to device info

So innocently arrived just a bit before.

Regards,

Tvrtko

> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   drivers/gpu/drm/i915/i915_pmu.c | 17 +++--------------
>   1 file changed, 3 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
> index 3a8bd11b87e7..b5d14dd318e4 100644
> --- a/drivers/gpu/drm/i915/i915_pmu.c
> +++ b/drivers/gpu/drm/i915/i915_pmu.c
> @@ -1235,17 +1235,6 @@ static void i915_pmu_unregister_cpuhp_state(struct i915_pmu *pmu)
>   	cpuhp_state_remove_instance(cpuhp_slot, &pmu->cpuhp.node);
>   }
>   
> -static bool is_igp(struct drm_i915_private *i915)
> -{
> -	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
> -
> -	/* IGP is 0000:00:02.0 */
> -	return pci_domain_nr(pdev->bus) == 0 &&
> -	       pdev->bus->number == 0 &&
> -	       PCI_SLOT(pdev->devfn) == 2 &&
> -	       PCI_FUNC(pdev->devfn) == 0;
> -}
> -
>   void i915_pmu_register(struct drm_i915_private *i915)
>   {
>   	struct i915_pmu *pmu = &i915->pmu;
> @@ -1269,7 +1258,7 @@ void i915_pmu_register(struct drm_i915_private *i915)
>   	pmu->cpuhp.cpu = -1;
>   	init_rc6(pmu);
>   
> -	if (!is_igp(i915)) {
> +	if (IS_DGFX(i915)) {
>   		pmu->name = kasprintf(GFP_KERNEL,
>   				      "i915_%s",
>   				      dev_name(i915->drm.dev));
> @@ -1323,7 +1312,7 @@ void i915_pmu_register(struct drm_i915_private *i915)
>   	pmu->base.event_init = NULL;
>   	free_event_attributes(pmu);
>   err_name:
> -	if (!is_igp(i915))
> +	if (IS_DGFX(i915))
>   		kfree(pmu->name);
>   err:
>   	drm_notice(&i915->drm, "Failed to register PMU!\n");
> @@ -1351,7 +1340,7 @@ void i915_pmu_unregister(struct drm_i915_private *i915)
>   	perf_pmu_unregister(&pmu->base);
>   	pmu->base.event_init = NULL;
>   	kfree(pmu->base.attr_groups);
> -	if (!is_igp(i915))
> +	if (IS_DGFX(i915))
>   		kfree(pmu->name);
>   	free_event_attributes(pmu);
>   }
