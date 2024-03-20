Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCAE8814BA
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 16:40:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBB3610FD89;
	Wed, 20 Mar 2024 15:40:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="WxOHk72S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCC0810E316
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 15:40:21 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2d23114b19dso85035121fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 08:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1710949220; x=1711554020;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PkMYzc9ktSXD4/lGPR3gzLrhYRVUW8d9S/Mr9bDPnog=;
 b=WxOHk72S5yVPhUyver9E1soezFILj/cPZDZtJMUttZ4VjpRzJ193qSBLVzDsl9lWzR
 cCBp7UcnxGvkjMvI4fUJ6/4lX+WmeFWqCM2tLh4Rj/Lpn9vNol6sEv87gklMvwXjfiS1
 0+2A2zq9QENmdA0/1KKtsf6JzDWv/DTEwsWh7z1c72uyeILetPmaVbEzuNUF1H66TCpf
 dCpdlOq41e311L6nV/NIrLK4kiOms6m7k0xla7IePk07b1jUBxSUHMiaH62GMLD2VbnB
 5beJUZMAkii9KtXNrHDGgvpNfIfprrlcmC+6LBHbFICz9RgJf0PanUwOiWtPGAK3Tj6m
 KihA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710949220; x=1711554020;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PkMYzc9ktSXD4/lGPR3gzLrhYRVUW8d9S/Mr9bDPnog=;
 b=RE1pb0jggNM2YNsBvZZBM49X8rzca+BtbVV9X/FJ7BPxg2ut80xTBI7kJZoOqAX5nc
 5p/wHQI3nRTE8iEd73Jw4qbf+XW0NgruFvTg8HjJS+dgx5GmxywT4KYE4v/nEgUa+I/0
 RCte4ZqnAQCAk85uYuqy6aD9KiErdv9O+G/zisCf4BEO0Y0ZnptreyehapTLDl8FMjTV
 gCf2NpKo3OfQSiTVJ0RugdK8RXRGBq2B25mxsB2bJVP3Es2rWzrdSkM0J1CIhGiVHPyS
 2LkpTrHTe7Legq8Cy9o1idSMZpuZu5vFRVvm0zmwS8XhqnWDmkoldHwGeAd61HIGGSiw
 7u0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/kfyuswUhVfhokChETs1LQUL1vjJnUHm2XnhLs0cfkPHR/Jd/AcYitDzYqk4Osp/1lQaesTCHnO591JNJsj0sPMJLA8WOyTcxyHKB7Qrj
X-Gm-Message-State: AOJu0Yytqpca2FZ/SWj22H/eZKQDcAfszg9R613BMp0t1a1U3J+fts5D
 q+xaxLMOrTvEmrGDsDAK/BLY6YPIuUZNLbD2nsJ+atEyVyRjjLs+yBKOB6DOkNY=
X-Google-Smtp-Source: AGHT+IF4xIDSrxcYjuUFrmCEBCyUD5ebFdIMCnD/C2zFineBSItC1RmylLLh6Wew7uMyxUtIRyXTZA==
X-Received: by 2002:a2e:9608:0:b0:2d5:122a:4b1f with SMTP id
 v8-20020a2e9608000000b002d5122a4b1fmr5171414ljh.43.1710949219645; 
 Wed, 20 Mar 2024 08:40:19 -0700 (PDT)
Received: from [192.168.0.101] ([84.65.0.132])
 by smtp.gmail.com with ESMTPSA id
 dw11-20020a0560000dcb00b0033b66c2d61esm14902596wrb.48.2024.03.20.08.40.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Mar 2024 08:40:19 -0700 (PDT)
Message-ID: <3fe26c42-cc34-42b2-a5cc-21a6a9468b4e@ursulin.net>
Date: Wed, 20 Mar 2024 15:40:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/3] Disable automatic load CCS load balancing
Content-Language: en-GB
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 John Harrison <John.C.Harrison@intel.com>, stable@vger.kernel.org,
 Andi Shyti <andi.shyti@kernel.org>
References: <20240313201955.95716-1-andi.shyti@linux.intel.com>
 <Zfr7hPs_VAUkTNTX@ashyti-mobl2.lan>
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <Zfr7hPs_VAUkTNTX@ashyti-mobl2.lan>
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


On 20/03/2024 15:06, Andi Shyti wrote:
> Ping! Any thoughts here?

I only casually observed the discussion after I saw Matt suggested 
further simplifications. As I understood it, you will bring back the 
uabi engine games when adding the dynamic behaviour and that is fine by me.

Regards,

Tvrtko

> On Wed, Mar 13, 2024 at 09:19:48PM +0100, Andi Shyti wrote:
>> Hi,
>>
>> this series does basically two things:
>>
>> 1. Disables automatic load balancing as adviced by the hardware
>>     workaround.
>>
>> 2. Assigns all the CCS slices to one single user engine. The user
>>     will then be able to query only one CCS engine
>>
>> >From v5 I have created a new file, gt/intel_gt_ccs_mode.c where
>> I added the intel_gt_apply_ccs_mode(). In the upcoming patches,
>> this file will contain the implementation for dynamic CCS mode
>> setting.
>>
>> Thanks Tvrtko, Matt, John and Joonas for your reviews!
>>
>> Andi
>>
>> Changelog
>> =========
>> v5 -> v6 (thanks Matt for the suggestions in v6)
>>   - Remove the refactoring and the for_each_available_engine()
>>     macro and instead do not create the intel_engine_cs structure
>>     at all.
>>   - In patch 1 just a trivial reordering of the bit definitions.
>>
>> v4 -> v5
>>   - Use the workaround framework to do all the CCS balancing
>>     settings in order to always apply the modes also when the
>>     engine resets. Put everything in its own specific function to
>>     be executed for the first CCS engine encountered. (Thanks
>>     Matt)
>>   - Calculate the CCS ID for the CCS mode as the first available
>>     CCS among all the engines (Thanks Matt)
>>   - create the intel_gt_ccs_mode.c function to host the CCS
>>     configuration. We will have it ready for the next series.
>>   - Fix a selftest that was failing because could not set CCS2.
>>   - Add the for_each_available_engine() macro to exclude CCS1+ and
>>     start using it in the hangcheck selftest.
>>
>> v3 -> v4
>>   - Reword correctly the comment in the workaround
>>   - Fix a buffer overflow (Thanks Joonas)
>>   - Handle properly the fused engines when setting the CCS mode.
>>
>> v2 -> v3
>>   - Simplified the algorithm for creating the list of the exported
>>     uabi engines. (Patch 1) (Thanks, Tvrtko)
>>   - Consider the fused engines when creating the uabi engine list
>>     (Patch 2) (Thanks, Matt)
>>   - Patch 4 now uses a the refactoring from patch 1, in a cleaner
>>     outcome.
>>
>> v1 -> v2
>>   - In Patch 1 use the correct workaround number (thanks Matt).
>>   - In Patch 2 do not add the extra CCS engines to the exposed
>>     UABI engine list and adapt the engine counting accordingly
>>     (thanks Tvrtko).
>>   - Reword the commit of Patch 2 (thanks John).
>>
>> Andi Shyti (3):
>>    drm/i915/gt: Disable HW load balancing for CCS
>>    drm/i915/gt: Do not generate the command streamer for all the CCS
>>    drm/i915/gt: Enable only one CCS for compute workload
>>
>>   drivers/gpu/drm/i915/Makefile               |  1 +
>>   drivers/gpu/drm/i915/gt/intel_engine_cs.c   | 20 ++++++++---
>>   drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c | 39 +++++++++++++++++++++
>>   drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h | 13 +++++++
>>   drivers/gpu/drm/i915/gt/intel_gt_regs.h     |  6 ++++
>>   drivers/gpu/drm/i915/gt/intel_workarounds.c | 30 ++++++++++++++--
>>   6 files changed, 103 insertions(+), 6 deletions(-)
>>   create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
>>   create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h
>>
>> -- 
>> 2.43.0
