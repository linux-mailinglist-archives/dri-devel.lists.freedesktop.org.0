Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC774D151B
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 11:49:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5BDE10E87F;
	Tue,  8 Mar 2022 10:49:00 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1626A10E87F;
 Tue,  8 Mar 2022 10:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646736540; x=1678272540;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=p1Z+mwMNu6doyIZ+PY/F2NpcypktBPpZyrwE9rUTvVI=;
 b=jo9j/rq4/YnTiPg4hLrFRwFlDBr4ubmpGS9JVESucWti9HHOlAY0X6KV
 sHvMbXY99Et9SmHf74V4KYw4BnzgMpn4VYXl5OKrIaUkXTR0YYV68Iekb
 J/33p5z+OgX8dH0bAQU8z9UfaD6iEOY9TjV+eGbKIOW4oD25emOEnfCFe
 ciReh3ttXZ8pCZWjUj92wv6vW33vHcj2U/b4v6gFo3Yhd0BdFYoO8Ty9o
 M0lXVpxHmxfah8L4F5dDU66DAI7HHSCRDvzR/V8EaJpKiIzXIJ6QOjTKR
 F/D3fmfDtCWCxyRoe/UC7elhaAdf/COgbi55tWoWVjRRN78tYUHNJnUSW g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="341086295"
X-IronPort-AV: E=Sophos;i="5.90,164,1643702400"; d="scan'208";a="341086295"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 02:48:59 -0800
X-IronPort-AV: E=Sophos;i="5.90,164,1643702400"; d="scan'208";a="643615788"
Received: from acushion-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.29.47])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 02:48:49 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: John Harrison <john.c.harrison@intel.com>, Intel-GFX@Lists.FreeDesktop.Org
Subject: Re: [Intel-gfx] [PATCH v2 1/8] drm/i915/guc: Do not conflate
 lrc_desc with GuC id for registration
In-Reply-To: <c6aeece0-9b12-e135-c991-25793f7640bb@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220225000623.1934438-1-John.C.Harrison@Intel.com>
 <20220225000623.1934438-2-John.C.Harrison@Intel.com>
 <87ilsu2aj1.fsf@intel.com>
 <c6aeece0-9b12-e135-c991-25793f7640bb@intel.com>
Date: Tue, 08 Mar 2022 12:48:46 +0200
Message-ID: <87o82g1zzl.fsf@intel.com>
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 04 Mar 2022, John Harrison <john.c.harrison@intel.com> wrote:
> On 3/4/2022 03:59, Jani Nikula wrote:
>> On Thu, 24 Feb 2022, John.C.Harrison@Intel.com wrote:
>> There are a plethora of static inlines in the guc .c files, and this
>> adds more. How about just letting the compiler decide what's the best
>> course of action, inline or not? I think hand rolling the inline is a
>> micro optimization that you'd need to justify i.e. show that you're
>> doing a better job than the compiler.
>>
>> The main downsides to using inlines are that you'll miss compiler
>> warnings for unused functions, and it sets an example for people to
>> start using inline more, while they should be an exception.
>>
>> BR,
>> Jani.
>>
>>
>> PS. I also don't much like the likely/unlikely annotations, but that's
>> another can of worms.
> Technically, this patch isn't adding any new ones. It is just reworking 
> existing functions in their existing style. So it basically comes under 
> your last point of people just following the prevailing style because 
> it's already there.
>
> I can add a task to the clean-up backlog to remove all mention of 
> inline. Not sure why you think the (un)likely tags are bad? Again, I 
> have no particular view either way.

The (un)likely annotations are similar to static inlines in that they're
often unjustified micro optimizations. Having plenty of them gives
people the false impression using them should be the rule rather than
the exception. And getting them wrong could have a high performance
penalty. They're certainly not meant for regular error handling.

Similar to static inlines, (un)likely have their uses, but they need to
be used sparingly and the use needs to be justified. For static inlines,
especially within .c files, just let the compiler do its job. For
(un)likely, just let the CPU branch predictor do its job.

The link's pretty old, but see also: https://lwn.net/Articles/420019/


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
