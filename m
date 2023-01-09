Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 202B46621BF
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 10:39:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAA7010E39C;
	Mon,  9 Jan 2023 09:38:56 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5115E10E391;
 Mon,  9 Jan 2023 09:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673257133; x=1704793133;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=vJP45bdOB9bU0CCohs+xOcw14aox3zevCDRIlMk6tGQ=;
 b=PdnDjkr6BpmcgctoRc7ZR6NE0M4t1JAMNlXAl1Jd6QaankX7cy8XC38D
 D4ImC+sDd8TLDJz/ehQzWJxtdQ0unmii2QuU43WVWjfDhZ13jHv0tup8W
 YXXvSNLOkcIcTszo2bZu/4D5H751ASIvGCSh7YhttuES1urqinYZqLoAD
 YJljk6Z9GFRZBJHYBoxLLchelEDWtQTnEtZyeFnGaN4KvSoGF30z2x83e
 MjcSwBQVtwpF/viP30N3JtAgTYEoW30Mv6SZyZceviNk47snaAtbgMtkl
 SgUYuKUHJ0Cb7WT+DJXVyoHao5eLE1LRhB9wyhWR6Lb7XPz5Y2rubacZL A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10584"; a="321537313"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; d="scan'208";a="321537313"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2023 01:38:52 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10584"; a="830537982"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; d="scan'208";a="830537982"
Received: from gtmcgeac-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.11.217])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2023 01:38:49 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: John Harrison <john.c.harrison@intel.com>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Intel-GFX@Lists.FreeDesktop.Org
Subject: Re: [Intel-gfx] [PATCH v2 4/5] drm/i915/guc: Add GuC CT specific
 debug print wrappers
In-Reply-To: <127d50a6-b0c4-b87b-ddf5-6bd121d53f3c@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20221118015858.2548106-1-John.C.Harrison@Intel.com>
 <20221118015858.2548106-5-John.C.Harrison@Intel.com>
 <48f594de-9682-4b60-f934-9420d02b405e@intel.com>
 <dd9559e8-7d65-d7bb-ea1a-d169a1c7eec3@intel.com>
 <4579b7e8-eae7-b760-66aa-b01273d18aab@intel.com>
 <d658f8fa-a063-aa0c-48ff-14f32cb6b339@intel.com>
 <9a5a84be-a5ae-7be2-f522-5e976511e4e1@intel.com>
 <143a660d-de2d-a77a-b490-8ad2add80420@linux.intel.com>
 <dd787d9d-8559-1da4-7e99-2635ef1341a8@intel.com>
 <c5622088-e381-1df4-417d-9b033b0a6afe@linux.intel.com>
 <467f47f4-c30f-16ba-3330-a3d4752366a8@intel.com>
 <f0ebffa1-45b7-d6f9-4341-3fa8aabae3f5@linux.intel.com>
 <127d50a6-b0c4-b87b-ddf5-6bd121d53f3c@intel.com>
Date: Mon, 09 Jan 2023 11:38:47 +0200
Message-ID: <874jt02gk8.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: "Ewins, Jon" <jon.ewins@intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 06 Jan 2023, John Harrison <john.c.harrison@intel.com> wrote:
> On 12/6/2022 03:06, Tvrtko Ursulin wrote:
>> On 05/12/2022 18:44, Michal Wajdeczko wrote:
>>> On 05.12.2022 14:16, Tvrtko Ursulin wrote:
>>>> On 02/12/2022 20:14, John Harrison wrote:
>>>> [snip]
>>>>
>>>>> Random meaningless (to me) message that is apparently a display thing:
>>>>> drm_dbg_kms(&dev_priv->drm, "disabling %s\n", pll->info->name);
>>>>> i915 0000:00:02.0: [drm:intel_disable_shared_dpll [i915]] disabling
>>>>> PORT PLL B
>>>>
>>>> Plan is to not touch outside gt/.
> For some unexplicable reason that means it is almost impossible to see 
> the actual problems in most CI dmesg logs because they are swamped with 
> irrelevant display messages that cannot be filtered out. For example, I 
> recently manually grep'd out all the display spam from a bug report log. 
> The dmesg file went from 12MB to 700KB. That is a significant problem 
> that makes bug triage way harder than it needs to be.

You can adjust drm.debug module parameter to get rid of almost all
display debugs. They're logged using the appropriate debug categories.


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
