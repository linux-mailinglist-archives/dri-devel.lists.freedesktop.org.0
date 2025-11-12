Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44034C5270A
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 14:23:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C886F10E720;
	Wed, 12 Nov 2025 13:23:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="bOMxRykV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1535D10E719
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 13:23:06 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4774f41628bso4123755e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 05:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1762953784; x=1763558584; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:cc:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QLtvyDTFdgsUO3VAZXPbtY9ufhsUembm5e2GuwMzaAo=;
 b=bOMxRykVrZ1U3kXBvzAJFVnqDEaDS8dL2kPmcbJKicnZs8xkQD4KdzQ4qYOtR50iIx
 +XQtwBUBR45QRhSXcJ1ZLDc6Qr6YuUAkIChWLXcBlTYTJezjXzyOwjAoG019s5xgNon7
 LGWV/9Sw/RCpgQ3o/jO4EETfLFlPvDJRVqcnttfM41KQZgjkm/sEB/qAa0Bigalc8E1T
 Gh15vsMEmSEPdrjiNkZiPT+ooJ3BIIn8/KiJuSZUwFl2ilgrgGrMM+hLY5jqnj91WgSs
 pCnb7EQ5W8TuKlBMCkXab4xFLiHBAYqi35PpDHxgs2StsPAniCqMmZ190BeelGcVwKhF
 FocQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762953784; x=1763558584;
 h=content-transfer-encoding:in-reply-to:from:cc:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QLtvyDTFdgsUO3VAZXPbtY9ufhsUembm5e2GuwMzaAo=;
 b=husTteCed2uCpEw4z7kStBZQ/rE0IW4ci6z11O+WoRkWe52JgTAZ7mdkY5OTBngcje
 f5nPjwiL4/7nG6iJy/yQf063205Axt02IYjiYGE/jcaZjHqB8sFfJmrCJQsJykiCyjc/
 5RZfObkdR63ydeLUvg/pJc7OAaNSh/GJ24U0pZdRxDwswuAVoeM9xkZF1u9a53OeLi82
 dTkfZ8bokejVf6oA3Ryhma+/1lcKPKlidqRH0MmKAfkZyrt0EnVKYIAwLzA84W68Wxm+
 6RElutordC8jOz4TxM5WSK5/dpTozYTgy7vZRRZp9Mv4WnCToVFnU2BnO0Deog0lZMbg
 PB5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8rA5VeSaa7xBWrHQkw7cqljKB6a07mN1u2dOd6uP2CgRCZdeMMacLOPF4aZNSEb2xp1Eh8DRLapY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw05YEg9hefUuCIOcRI+0RwdL6vzZplxJNPUOJrCmJ4/Ic3IobB
 Xfqtmp8Psff/CwZQ8J1RElYXWq657z1tJRA3qTh4YrELCJ9B4EO1mLkURDWPuItbg2I=
X-Gm-Gg: ASbGncu+GvhKqdvdx7c1tOqy6cQi9VBDGc+rWUhFKGY2Q62GuLLSZnbmpMuC/xSXIe9
 jMkAW2v3j/nPY6/j+BtFS6XH0fY7/GeIvii7kczLxR/Mkw25lOCSKYwHnYpe8Ls/WnGXsPrfZsQ
 FkFYv3Gs2P+EhP3lxNP/Xcvv2fkb7pQqSDtXDJHtBbm2sezgrezZgDs6siSPRu2ExinZjupzu4u
 LaV1c2fV/Cjx32unvhfAx3TpSgIj6dGWXlAwAZRHK01Bs4ISMJQmsFSDr3zozPrfbGq8/cAuH71
 SnXzFhBc4A5/dBD4CcAomXi1SW7mPCy7BWGUihyj5eKpjE3ruGEBNXaLB2qZN6JVxTzx729841U
 9ljI4NR6ShNrj8snkB9B4D4/cx4eCCJ8o5SZO59pTtV3I+QTWKeeysZ/pXPPp+27VJ+S+I7QisR
 qLMJuDK2SZMvW6Hu1d5nMGMA==
X-Google-Smtp-Source: AGHT+IHax6E2O5nXsW/Xebt3erlCra0MzgdE8BJg7i95ZVidnBePvrhrNg2oIcT+5u0UALBK/BzSQg==
X-Received: by 2002:a05:600c:5247:b0:477:7f4a:44bd with SMTP id
 5b1f17b1804b1-47787224955mr24864755e9.0.1762953784508; 
 Wed, 12 Nov 2025 05:23:04 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47787e8e6a1sm35018625e9.11.2025.11.12.05.23.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Nov 2025 05:23:04 -0800 (PST)
Message-ID: <d1b97ed3-6beb-4564-9c53-616503b8c493@ursulin.net>
Date: Wed, 12 Nov 2025 13:23:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Questions regarding DRM Scheduler Priority Levels
To: "Chenna Kesava Raju (QUIC)" <quic_chennak@quicinc.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <4ac498dfbfeb4d4d837646f9e9492f28@quicinc.com>
Content-Language: en-GB
Cc: Philipp Stanner <phasta@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <4ac498dfbfeb4d4d837646f9e9492f28@quicinc.com>
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


Hi,

On 12/11/2025 12:31, Chenna Kesava Raju (QUIC) wrote:
> Hi All,
> 
> We are currently developing a driver using the Accel framework to enable 
> applications to offload their tasks to the NPU.
> 
> As part of this effort, we are considering the use of the DRM scheduler 
> for job management. These applications may have their own priority 
> levels to manage task execution efficiently on the NPU. However, since 
> the DRM scheduler currently supports only a limited set of job priority 
> levels (DRM_SCHED_PRIORITY_KERNEL, DRM_SCHED_PRIORITY_HIGH, 
> DRM_SCHED_PRIORITY_NORMAL, and DRM_SCHED_PRIORITY_LOW), we have a couple 
> of questions:
> 
>   * Are there any plans to increase the number of supported priority levels?

Not that I am aware of. Adding maintainers as well.

>   * Is there any flexibility or scope for customizing priority levels
>     when using the DRM scheduler?

Maybe. What I am proposing is to rewrite the scheduling algorithm away 
from strict priority ordering and per-priority run-queues, replacing it 
with a single run queue and virtual runtime based approach.

See:
https://lore.kernel.org/dri-devel/20251024160800.79836-1-tvrtko.ursulin@igalia.com/

If that goes in then it will be really easy to extend the range, or 
otherwise tweak it. Whether or not that is something that would be 
interesting for your use cases is the question. Perhaps you could share 
some more details on what kind of granularity and behaviour you are 
looking for?

Regards,

Tvrtko

