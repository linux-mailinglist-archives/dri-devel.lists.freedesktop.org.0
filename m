Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A212019BD56
	for <lists+dri-devel@lfdr.de>; Thu,  2 Apr 2020 10:09:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DC126EA04;
	Thu,  2 Apr 2020 08:09:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BD456EA03;
 Thu,  2 Apr 2020 08:09:33 +0000 (UTC)
IronPort-SDR: +0Ha5aaF19/byCryJ3a7S9riAfFjsWrqkHhmXTXOZ2ZpU3CzkJnuMx19Vfw9aA1kBE3tBk6TRV
 1xdWqEh+YcWA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2020 01:09:32 -0700
IronPort-SDR: fh7hecj7eaCvpSDSTpxIMCBTIypAyA3hdlH3fwGnzb2YLLhzKVpxdSjZeOldLXjT1XMCKT3icN
 /iwQIGVN/7vA==
X-IronPort-AV: E=Sophos;i="5.72,335,1580803200"; d="scan'208";a="423040430"
Received: from assenmac-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.35.117])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2020 01:09:26 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/i915: Remove WARN_ON and WARN_ON_ONCE overrides.
In-Reply-To: <CAKMK7uHNEXffFOdoD5W=KVCCP-1Gi-epp77FoPswPWUvPSNDXA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200402055241.24789-1-pankaj.laxminarayan.bharadiya@intel.com>
 <87lfnemmo8.fsf@intel.com>
 <CAKMK7uHNEXffFOdoD5W=KVCCP-1Gi-epp77FoPswPWUvPSNDXA@mail.gmail.com>
Date: Thu, 02 Apr 2020 11:09:21 +0300
Message-ID: <87h7y2mhqm.fsf@intel.com>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 02 Apr 2020, Daniel Vetter <daniel@ffwll.ch> wrote:
> On Thu, Apr 2, 2020 at 8:23 AM Jani Nikula <jani.nikula@linux.intel.com> wrote:
>>
>> On Thu, 02 Apr 2020, Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com> wrote:
>> > Now we have new struct drm_device based drm_WARN* macros. These are
>> > preferred over the regular WARN* macros.
>> >
>> > Remove WARN_ON and WARN_ON_ONCE overriedes to avoid any temptations to
>> > use them in the future.
>>
>> Well, since they are overrides of macros in bug.h, the users are still
>> there. There are still 100+ users in i915. You just don't get as much
>> information with them after this patch.
>>
>> I'm not opposed to this patch, but at the same time I'd like to see more
>> converted to the drm_WARN* alternatives.
>
> Yeah our overrides are super useful, I think better to try to move
> them to the core version. So many times when I didn't know which
> warning was hit in a bug report (warnings in drm core already have
> this problem), and the additional output here would have helped. I'd
> at least keep this for now.

The drm_WARN_ON, drm_WARN_ON_ONCE macros in drm_print.h are comparable
replacements, with the device info as well as the condition.

BR,
Jani.



> -Daniel
>
>> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
>>
>>
>> BR,
>> Jani.
>>
>> >
>> > Suggested-by: Jani Nikula <jani.nikula@intel.com>
>> > Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
>> > ---
>> >  drivers/gpu/drm/i915/i915_utils.h | 15 ---------------
>> >  1 file changed, 15 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/i915_utils.h
>> > index 03a73d2bd50d..c666a64375d9 100644
>> > --- a/drivers/gpu/drm/i915/i915_utils.h
>> > +++ b/drivers/gpu/drm/i915/i915_utils.h
>> > @@ -36,21 +36,6 @@ struct timer_list;
>> >
>> >  #define FDO_BUG_URL "https://gitlab.freedesktop.org/drm/intel/-/wikis/How-to-file-i915-bugs"
>> >
>> > -#undef WARN_ON
>> > -/* Many gcc seem to no see through this and fall over :( */
>> > -#if 0
>> > -#define WARN_ON(x) ({ \
>> > -     bool __i915_warn_cond = (x); \
>> > -     if (__builtin_constant_p(__i915_warn_cond)) \
>> > -             BUILD_BUG_ON(__i915_warn_cond); \
>> > -     WARN(__i915_warn_cond, "WARN_ON(" #x ")"); })
>> > -#else
>> > -#define WARN_ON(x) WARN((x), "%s", "WARN_ON(" __stringify(x) ")")
>> > -#endif
>> > -
>> > -#undef WARN_ON_ONCE
>> > -#define WARN_ON_ONCE(x) WARN_ONCE((x), "%s", "WARN_ON_ONCE(" __stringify(x) ")")
>> > -
>> >  #define MISSING_CASE(x) WARN(1, "Missing case (%s == %ld)\n", \
>> >                            __stringify(x), (long)(x))
>>
>> --
>> Jani Nikula, Intel Open Source Graphics Center

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
