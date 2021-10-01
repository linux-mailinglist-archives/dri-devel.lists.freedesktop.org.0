Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA7741F21D
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 18:26:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 147F86EE5D;
	Fri,  1 Oct 2021 16:26:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C07ED6EE5D;
 Fri,  1 Oct 2021 16:26:34 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10124"; a="223581807"
X-IronPort-AV: E=Sophos;i="5.85,339,1624345200"; d="scan'208";a="223581807"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2021 09:17:27 -0700
X-IronPort-AV: E=Sophos;i="5.85,339,1624345200"; d="scan'208";a="480532857"
Received: from tmueller-mobl1.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.54.109])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2021 09:17:23 -0700
Date: Fri, 1 Oct 2021 09:17:21 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>, dri-devel@lists.freedesktop.org,
 Masahiro Yamada <masahiroy@kernel.org>,
 Steven Price <steven.price@arm.com>, Andrzej Hajda <a.hajda@samsung.com>,
 intel-gfx@lists.freedesktop.org,
 "Sarvela, Tomi P" <tomi.p.sarvela@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: remove IS_ACTIVE
Message-ID: <20211001161721.72zp4ncnclcbanzo@ldmartin-desk2>
References: <20211001074041.2076538-1-lucas.demarchi@intel.com>
 <163308055415.8412.14215483004176995847@build.alporthouse.com>
 <87bl49t6di.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <87bl49t6di.fsf@intel.com>
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

On Fri, Oct 01, 2021 at 12:57:13PM +0300, Jani Nikula wrote:
>On Fri, 01 Oct 2021, Chris Wilson <chris@chris-wilson.co.uk> wrote:
>> Quoting Lucas De Marchi (2021-10-01 08:40:41)
>>> When trying to bring IS_ACTIVE to linux/kconfig.h I thought it wouldn't
>>> provide much value just encapsulating it in a boolean context. So I also
>>> added the support for handling undefined macros as the IS_ENABLED()
>>> counterpart. However the feedback received from Masahiro Yamada was that
>>> it is too ugly, not providing much value. And just wrapping in a boolean
>>> context is too dumb - we could simply open code it.
>>>
>>> As detailed in commit babaab2f4738 ("drm/i915: Encapsulate kconfig
>>> constant values inside boolean predicates"), the IS_ACTIVE macro was
>>> added to workaround a compilation warning. However after checking again
>>> our current uses of IS_ACTIVE it turned out there is only
>>> 1 case in which it would potentially trigger a warning. All the others
>>>   can simply use the shorter version, without wrapping it in any macro.
>>> And even that single one didn't trigger any warning in gcc 10.3.
>>>
>>> So here I'm dialing all the way back to simply removing the macro. If it
>>> triggers warnings in future we may change the few cases to check for > 0
>>> or != 0. Another possibility would be to use the great "not not
>>> operator" for all positive checks, which would allow us to maintain
>>> consistency.  However let's try first the simplest form though, hopefully
>>> we don't hit broken compilers spitting a warning:
>>
>> You didn't prevent the compilation warning this re-introduces.
>>
>> drivers/gpu/drm/i915/i915_config.c:11 i915_fence_context_timeout() warn: should this be a bitwise op?
>> drivers/gpu/drm/i915/i915_request.c:1679 i915_request_wait() warn: should this be a bitwise op?
>
>Looks like that's a Smatch warning. The immediate fix would be to just
>add the != 0 in the relevant places. But this is stuff that's just going
>to get broken again unless we add Smatch to CI. Most people aren't
>running it on a regular basis.

it looks like the warning is also triggered with clang an as per
0day test.  What if we change all the positive caes to use !!?  That
would make it  consistent and IMO not as ugly as the != 0.

what about this?

-----8<----
diff --git a/drivers/gpu/drm/i915/i915_config.c b/drivers/gpu/drm/i915/i915_config.c
index ad228dd96a0b..0df3efa2e72d 100644
--- a/drivers/gpu/drm/i915/i915_config.c
+++ b/drivers/gpu/drm/i915/i915_config.c
@@ -8,7 +8,7 @@
  unsigned long
  i915_fence_context_timeout(const struct drm_i915_private *i915, u64 context)
  {
-	if (context && CONFIG_DRM_I915_FENCE_TIMEOUT)
+	if (context && !!CONFIG_DRM_I915_FENCE_TIMEOUT)
  		return msecs_to_jiffies_timeout(CONFIG_DRM_I915_FENCE_TIMEOUT);
  
  	return 0;
-----8<----

Lucas De Marchi
