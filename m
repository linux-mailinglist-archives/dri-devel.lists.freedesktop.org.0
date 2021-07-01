Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2AD3B9622
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 20:27:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CF836EB88;
	Thu,  1 Jul 2021 18:27:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F09C06EB86;
 Thu,  1 Jul 2021 18:27:15 +0000 (UTC)
Received: from [192.168.1.190] (unknown [91.155.165.229])
 (Authenticated sender: martin.peres@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 5189D5FFAE;
 Thu,  1 Jul 2021 20:27:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1625164034;
 bh=YGtGS4B9Y6gQBti1Fw+y+26r4dZ92psofhW4HWZuCOA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=pPZPjCsw1QpbBr4gCJrctM6uuG4+1sgokRWFPqbMLTDmeLdAONJbrfyIqBQiUPghg
 T+sibhElMoi0tTaTZ1SUzuBamdT95J+fmLfwBWam9xo7ALmcuHHK1ZywC54CaqWaW0
 JRfs5jgI9qggWAeBGAxk+wR0vM8yx6fTnqC14J7rHrikOr8Autt+YV/GDhY+OWR/VE
 5NxoB8uIxQcARBDgSZaPYl7kq3mEbYSLVMYS/di9yV9jcFvqpB3DUtZi7Cr7CPinkR
 sG9u/IlOkwiWtjgOs+5UKr7xzUESDhWwl6Y1uX/mVY+Ot2un1ntNExPNQGNtsKAfTF
 7RnihEW/ESt/A==
Subject: Re: [PATCH 47/47] drm/i915/guc: Unblock GuC submission on Gen11+
To: Pekka Paalanen <ppaalanen@gmail.com>,
 John Harrison <john.c.harrison@intel.com>
References: <20210624070516.21893-1-matthew.brost@intel.com>
 <20210624070516.21893-48-matthew.brost@intel.com>
 <88cbe963-7188-f4ae-5acf-01a80bd2fe25@free.fr>
 <05e1d462-57ae-888a-888c-3ad486150821@intel.com>
 <20210701111410.3fc6551e@eldfell>
From: Martin Peres <martin.peres@free.fr>
Message-ID: <050296b9-8958-353a-9f76-699bfbafa1c1@free.fr>
Date: Thu, 1 Jul 2021 21:27:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210701111410.3fc6551e@eldfell>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org,
 daniele.ceraolospurio@intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/07/2021 11:14, Pekka Paalanen wrote:
> On Wed, 30 Jun 2021 11:58:25 -0700
> John Harrison <john.c.harrison@intel.com> wrote:
> 
>> On 6/30/2021 01:22, Martin Peres wrote:
>>> On 24/06/2021 10:05, Matthew Brost wrote:
>>>> From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>>>
>>>> Unblock GuC submission on Gen11+ platforms.
>>>>
>>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/i915/gt/uc/intel_guc.h            |  1 +
>>>>    drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c |  8 ++++++++
>>>>    drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h |  3 +--
>>>>    drivers/gpu/drm/i915/gt/uc/intel_uc.c             | 14 +++++++++-----
>>>>    4 files changed, 19 insertions(+), 7 deletions(-)
>>>>
> 
> ...
> 
>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>>>> b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>>>> index 7a69c3c027e9..61be0aa81492 100644
>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>>>> @@ -34,8 +34,15 @@ static void uc_expand_default_options(struct
>>>> intel_uc *uc)
>>>>            return;
>>>>        }
>>>>    -    /* Default: enable HuC authentication only */
>>>> -    i915->params.enable_guc = ENABLE_GUC_LOAD_HUC;
>>>> +    /* Intermediate platforms are HuC authentication only */
>>>> +    if (IS_DG1(i915) || IS_ALDERLAKE_S(i915)) {
>>>> +        drm_dbg(&i915->drm, "Disabling GuC only due to old
>>>> platform\n");
>>>
>>> This comment does not seem accurate, given that DG1 is barely out, and
>>> ADL is not out yet. How about:
>>>
>>> "Disabling GuC on untested platforms"?
>>>   
>> Just because something is not in the shops yet does not mean it is new.
>> Technology is always obsolete by the time it goes on sale.
> 
> That is a very good reason to not use terminology like "new", "old",
> "current", "modern" etc. at all.
> 
> End users like me definitely do not share your interpretation of "old".

Yep, old and new is relative. In the end, what matters is the validation 
effort, which is why I was proposing "untested platforms".

Also, remember that you are not writing these messages for Intel 
engineers, but instead are writing for Linux *users*.

Cheers,
Martin

> 
> 
> Thanks,
> pq
> 
> 
>> And the issue is not a lack of testing, it is a question of whether we
>> are allowed to change the default on something that has already started
>> being used by customers or not (including pre-release beta customers).
>> I.e. it is basically a political decision not an engineering decision.
> 
