Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 175B88FF807
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2024 01:19:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 258C310EB29;
	Thu,  6 Jun 2024 23:19:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="Qf5j6Ha0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DE6E10EB3B
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 23:19:04 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-1f63642ab8aso14253005ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2024 16:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1717715943; x=1718320743;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=B5W2Nv+UImujN12YJ4otFyCpCSzcEj5c4HLiL4+sD5Y=;
 b=Qf5j6Ha0EADdlApeAtQKDhsSwGeDC38Khar9LaXGijYkDtMqRcj1wTYW76VF+7Xhyb
 fOw7gZiO54oFAivM41d8r1OMt3CjBoMPuaZKUBpRsirkwsh9t3UDmmRn35QrknNhL7mI
 TefmWFR27VKrXffimp/taDxtrfkTdCfgB/Lrk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717715943; x=1718320743;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B5W2Nv+UImujN12YJ4otFyCpCSzcEj5c4HLiL4+sD5Y=;
 b=r2z5aOZfr9EeLas7Q0d/xede+7OoCutVG1IOqdT18cgdiMNVsNyz/7REEWpGapVnyE
 UsuA3XOFSnXVxJ3gIoPj3JCITy7y6z0Cve4Uc596y8WpGOtYYdNvle1jdxgMnC+854JN
 Cvkr3rD2ZLwo7wGZVaXA3c2w5C7qrivUpCusfDImslw9dzRF1p3HrGTgZN6+WVxz+7GF
 JFLk76LIYNqy17Dze9bLr9REsnKfyoOklEU+pkuQdex8Iv368KiJ+1qZZ6m0f6/kEiMJ
 zzm96igvz+yB5+rzedNv89TwedCR2fKkyGvjKfoMYniiCwJ35US2Q2azefbZQnrsmlsl
 HgRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdEco6bgzuqXisumR9RP9yYEVv7Jh2XaaKuyNHJ3SPH1QiacNUZ0OnlhnmUh76e7S4KyWDOC70BCHdeDZCYOgUuDzB3NeyqgmA+Z8VWyBL
X-Gm-Message-State: AOJu0Ywo3K6juOwLvT+C/4+FU5l9WeqjBb632GqnNgs5J5eIWD65Y8IN
 tTf8PwGv5B476NbOn504X3RUzlCSlgmKe9H1YZ3pUcOCgkKL+h7xsjStCq0GlA==
X-Google-Smtp-Source: AGHT+IHIzTCrpwOBuPoFHxi87A/kHEekLhj24/3k60Aq8kd9drw2D8EtGjRvHFgvTvQIHd91BX7SXg==
X-Received: by 2002:a17:903:2407:b0:1f6:6c74:e5c1 with SMTP id
 d9443c01a7336-1f6d02c0e82mr14328785ad.4.1717715943397; 
 Thu, 06 Jun 2024 16:19:03 -0700 (PDT)
Received: from [10.66.192.68] ([192.19.161.250])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f6bd76d20asm20950295ad.93.2024.06.06.16.18.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jun 2024 16:19:03 -0700 (PDT)
Message-ID: <3d6ec46c-53c2-4a13-90ff-eb419863c1d5@broadcom.com>
Date: Thu, 6 Jun 2024 16:18:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/8] x86/vmware: Introduce VMware hypercall API
To: Borislav Petkov <bp@alien8.de>
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
 hpa@zytor.com, dave.hansen@linux.intel.com, mingo@redhat.com,
 tglx@linutronix.de, x86@kernel.org, netdev@vger.kernel.org,
 richardcochran@gmail.com, linux-input@vger.kernel.org,
 dmitry.torokhov@gmail.com, zackr@vmware.com,
 linux-graphics-maintainer@vmware.com, pv-drivers@vmware.com,
 timothym@vmware.com, akaher@vmware.com, dri-devel@lists.freedesktop.org,
 daniel@ffwll.ch, airlied@gmail.com, tzimmermann@suse.de, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, horms@kernel.org,
 kirill.shutemov@linux.intel.com
References: <20240523191446.54695-1-alexey.makhalov@broadcom.com>
 <20240523191446.54695-2-alexey.makhalov@broadcom.com>
 <20240527170734.GCZlS91uXD68HRN1na@fat_crate.local>
 <9ca6230c-740c-4f1a-8fdf-73f74cf025a1@broadcom.com>
 <20240603175844.GKZl4EVGUxp2aQZnYJ@fat_crate.local>
Content-Language: en-US
From: Alexey Makhalov <alexey.makhalov@broadcom.com>
Autocrypt: addr=alexey.makhalov@broadcom.com; keydata=
 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 EuY0
In-Reply-To: <20240603175844.GKZl4EVGUxp2aQZnYJ@fat_crate.local>
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



On 6/3/24 10:58 AM, Borislav Petkov wrote:
> On Wed, May 29, 2024 at 05:44:32PM -0700, Alexey Makhalov wrote:
>> While most of the vmware_hypercall callers are executed after alternative
>> patching applied, there are small amount of hypercalls running before that.
>> Only for them we have the logic of analyzing vmware_hypercall_mode as a
>> default alternative code. And there are 2 constraints:
>> 1. vmcall/vmmcall are not supported by old ESXi/Workstation/Fusion. We have
>> to use in/out instructions. After the end of support of old hypervisors the
>> alternative can be simplified as follow:
>> ALTERNATIVE("vmcall", "vmmcall", X86_FEATURE_VMW_VMMCALL);
>> 2. SEV-ES enabled VMs should use _only_ vmcall/vmmcall as in/out
>> instructions cause faults.
>>
>> Another approach that we discussed internally was to use
>> ALTERNATIVE_2("movw %[port], %%dx; "inl (%%dx), %%eax", "vmcall",
>> X86_FEATURE_VMW_VMCALL, "vmmcall", X86_FEATURE_VMW_VMMCALL) for
>> vmware_hypercallX family of functions, _and_ to have a separate API
>> vmware_sev_hypercallX, with the silly dance without an alternative inside,
>> to be used only by early boot code, before alternative application. But,
>> it's error prone when things come to boot time related code movements or
>> rearrangements as it puts additional requirement for SEV-ES
>> understanding/testing for VMware guests.
> 
> Right, so since we're exporting that alternatives_patched thing already,
> you might also try to do:
> 
> 	if (unlikely(!alternatives_patched))
> 		return slow_hypercall_X_in_c();
> 
> 	asm_inline volatile(VMWARE_HYPERCALL...
> 
> where that slow_hypercall_X_in_c()* set of APIs does the checks in C.
> 
> And the VMWARE_HYPERCALL thing is a lot simpler then.
> 
> All in all, you'll have a lot less unreadable asm to pay attention to
> and those APIs should be all easy and readable.
> 

Thanks for the idea.

I improved the condition to eliminate slow path for modules such as 
vmmouse, vmwgfx.
        if (unlikely(!alternatives_patched) && !__is_defined(MODULE))
                return vmware_hypercall_slow(...);
It also drops the need for exporting vmware_hypercall_mode or 
vmware_hypercall_slow symbols.

Will post just Patch0001 for review here before sending v11 out.

