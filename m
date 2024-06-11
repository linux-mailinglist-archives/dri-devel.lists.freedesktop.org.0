Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC5A903E28
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 15:58:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A621310E66C;
	Tue, 11 Jun 2024 13:58:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="Vb1ptMjH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD91E10E166
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 13:58:06 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-42138eadf64so9612115e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 06:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1718114285; x=1718719085;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OCbu1H3n5MHTe61K5ap400pux/SApVi5XtmKitLKrUs=;
 b=Vb1ptMjHljacp3jnH7tQAr/7gcWdzhJoQfYx7Xc5nuLwDLdPoM25ahPTnCN3ViecOb
 S2OIb+436PlnBcIF8bkmVibFn1bT5B0rnsDVfG6xHD4QnF1zPGcXFTOeZbRMmfeQk1TJ
 7yE36p2MjuKT/Y4csL2e8pZze9H6PzwOGAIiBsS/qdGnHyoHHPWe2b64LrW3uKQDm+uM
 EpWLrKlB+cnfMCHsy54eh0TSDX5fxyhDoxz/aQcHF4dk1EmHQ1Sc9kKBCXCmMDtSz7UT
 /Pejeah8DD7JHacCAIcBQTcynZC5v1LUdsIXLb9jean3SUBf0AdFgkc58HWG0mf0HwQv
 fVEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718114285; x=1718719085;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OCbu1H3n5MHTe61K5ap400pux/SApVi5XtmKitLKrUs=;
 b=GzpyTldGJHDOxMlluKS4PUqW6KMKdbYRopvadIySZ62gpDt4naAIDpwV31fFg0UyX1
 PyvuqFrbmlJH4decmFvMilvVgxy9AvaQq6ZdCYFEf4mnH1FANc8c1ux5EDhZWExfBJOW
 JZ660gaCHaEzgQ0Le5+N3vKXPHolu/Q/0qGXupufunmL3IvTIy81036/MHZsyNYyTq4H
 SqpxOIiHxqinlvcgUDzguJLjyHzdf9cFzNRPHqKkdMn9qcrYkyQk+4ccNz8gKhpMuXax
 bcbJ0ugREA3nxpnrkAMyfSKYU8x5YMrBIUUo2r2f0A1iVk1YCz5P7W1uh/SkX7fm4fVZ
 iGMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVd+5q3ElFxm88G9jyOQdBXAoJkTU+9v6dwLsoQLOhkIo6cuOWrPNG3DExAXpMPFQXngC1QL97qToTpUC0SSj4R68qhUksOp0wond3Jh+eA
X-Gm-Message-State: AOJu0YwSl3uUQhtdgPwGWV89levLdc99hA1N2VOIagfXZhBOH7AnSopI
 qwkdx76Lb5VlCn3twBcm2Z7uIZ5sFucuJpoKs7XXZVtjZOSulMDKJlqiMCPzyOc=
X-Google-Smtp-Source: AGHT+IHTtJWpZeLrGy8DozD2HLw4472tTTmF71Bd6yVynmD2Fn5rz88FpkURGcO/pAy1AqMSJGDkCg==
X-Received: by 2002:a05:600c:1c29:b0:421:7da5:c1e7 with SMTP id
 5b1f17b1804b1-4217da5c7eamr70816615e9.2.1718114284815; 
 Tue, 11 Jun 2024 06:58:04 -0700 (PDT)
Received: from [192.168.0.101] ([84.69.19.168])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-421580fe3cfsm210776225e9.9.2024.06.11.06.58.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jun 2024 06:58:04 -0700 (PDT)
Message-ID: <22fc70cd-b836-4694-b69a-c273e5000b2e@ursulin.net>
Date: Tue, 11 Jun 2024 14:58:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/gt: debugfs: Evaluate forcewake usage within
 locks
Content-Language: en-GB
To: Nirmoy Das <nirmoy.das@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@kernel.org>
References: <20240607145131.217251-1-andi.shyti@linux.intel.com>
 <4cc62e14-2775-44f3-9857-eaf9598074a5@linux.intel.com>
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <4cc62e14-2775-44f3-9857-eaf9598074a5@linux.intel.com>
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


On 10/06/2024 10:24, Nirmoy Das wrote:
> Hi Andi,
> 
> On 6/7/2024 4:51 PM, Andi Shyti wrote:
>> The forcewake count and domains listing is multi process critical
>> and the uncore provides a spinlock for such cases.
>>
>> Lock the forcewake evaluation section in the fw_domains_show()
>> debugfs interface.
>>
>> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> 
> Needs a Fixes tag, below seems to be correct one.
> 
> 
> Fixes: 9dd4b065446a ("drm/i915/gt: Move pm debug files into a gt aware 
> debugfs")
> 
> Cc: <stable@vger.kernel.org> # v5.6+
> 
> Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

What is the back story here and why would it need backporting? IGT cares 
about the atomic view of user_forcewake_count and individual domains or 
what?

Regards,

Tvrtko


> 
> Regards,
> 
> Nirmoy
> 
> 
>> ---
>>   drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c 
>> b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
>> index 4fcba42cfe34..0437fd8217e0 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
>> @@ -71,6 +71,8 @@ static int fw_domains_show(struct seq_file *m, void 
>> *data)
>>       struct intel_uncore_forcewake_domain *fw_domain;
>>       unsigned int tmp;
>> +    spin_lock_irq(&uncore->lock);
>> +
>>       seq_printf(m, "user.bypass_count = %u\n",
>>              uncore->user_forcewake_count);
>> @@ -79,6 +81,8 @@ static int fw_domains_show(struct seq_file *m, void 
>> *data)
>>                  intel_uncore_forcewake_domain_to_str(fw_domain->id),
>>                  READ_ONCE(fw_domain->wake_count));
>> +    spin_unlock_irq(&uncore->lock);
>> +
>>       return 0;
>>   }
>>   DEFINE_INTEL_GT_DEBUGFS_ATTRIBUTE(fw_domains);
