Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD1F41CF89
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 00:54:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 319216EB0A;
	Wed, 29 Sep 2021 22:54:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BF7E6EB08;
 Wed, 29 Sep 2021 22:54:35 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10122"; a="225129399"
X-IronPort-AV: E=Sophos;i="5.85,334,1624345200"; d="scan'208";a="225129399"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2021 15:54:34 -0700
X-IronPort-AV: E=Sophos;i="5.85,334,1624345200"; d="scan'208";a="707502845"
Received: from ojefferi-mobl.ger.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.173.172])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2021 15:54:34 -0700
Date: Wed, 29 Sep 2021 15:54:33 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: intel-gfx@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel@lists.freedesktop.org, Masahiro Yamada <masahiroy@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] drm/i915/utils: do not depend on config being
 defined
Message-ID: <20210929225433.7z76swcouyas7upd@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20210929183357.1490204-1-lucas.demarchi@intel.com>
 <CGME20210929183439eucas1p1de30c3fb5681a8c8d250f482954f92ed@eucas1p1.samsung.com>
 <20210929183357.1490204-3-lucas.demarchi@intel.com>
 <e1c58c0e-b0d5-48a4-f423-3c7e0ff9b765@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e1c58c0e-b0d5-48a4-f423-3c7e0ff9b765@samsung.com>
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

On Wed, Sep 29, 2021 at 11:08:18PM +0200, Andrzej Hajda wrote:
>
>W dniu 29.09.2021 o 20:33, Lucas De Marchi pisze:
>> Like the IS_ENABLED() counterpart, we can make IS_CONFIG_NONZERO() to
>> return the right thing when the config is not defined rather than a
>> build error, with the limitation that it can't be used on preprocessor
>> context.
>>
>> The trick here is that macro names can't start with a number or dash, so
>> we stringify the argument and check that the first char is a number != 0
>> (or starting with a dash to cover negative numbers). Except for -O0
>> builds the strings are all eliminated.
>>
>> Taking CONFIG_DRM_I915_REQUEST_TIMEOUT in
>> drivers/gpu/drm/i915/gem/i915_gem_context.c as example, we have the
>> following output of the preprocessor:
>>
>> old:
>>   if (((20000) != 0) &&
>> new:
>>   if (( ("20000"[0] > '0' && "20000"[0] < '9') || "20000"[0] == '-' ) &&
>>
>> New one looks worse, but is also eliminated from the object:
>>
>> $ size drivers/gpu/drm/i915/gem/i915_gem_context.o.*
>>     text    data     bss     dec     hex filename
>>    52021    1070     232   53323    d04b drivers/gpu/drm/i915/gem/i915_gem_context.o.new
>>    52021    1070     232   53323    d04b drivers/gpu/drm/i915/gem/i915_gem_context.o.old
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>   drivers/gpu/drm/i915/i915_utils.h | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/i915_utils.h
>> index 02bbfa4d68d3..436ce612c46a 100644
>> --- a/drivers/gpu/drm/i915/i915_utils.h
>> +++ b/drivers/gpu/drm/i915/i915_utils.h
>> @@ -28,6 +28,7 @@
>>   #include <linux/list.h>
>>   #include <linux/overflow.h>
>>   #include <linux/sched.h>
>> +#include <linux/stringify.h>
>>   #include <linux/types.h>
>>   #include <linux/workqueue.h>
>>
>> @@ -469,6 +470,9 @@ static inline bool timer_expired(const struct timer_list *t)
>>    *
>>    * Returns 0 if @config is 0, 1 if set to any value.
>>    */
>> -#define IS_CONFIG_NONZERO(config) ((config) != 0)
>> +#define IS_CONFIG_NONZERO(config) (						\
>> +	(__stringify_1(config)[0] > '0' && __stringify_1(config)[0] < '9') ||	\
>> +	__stringify_1(config)[0] == '-'						\
>> +)
>
>
>Quite clever trick, but I see two issues:
>
>- gcc < 8.1 treats expressions with string indices (ex. "abc"[0]) as
>non-constant expressions, so they cannot be used everywhere, for example
>in global variable initializations,

ugh, that would kill the idea - having the strings and additional
runtime checks would not be good. Maybe if we check with
__builtin_constant_p() and do the simpler expansion if it's not
constant?

>
>- it does not work with hex (0x1) or octal values (01)

indeed, but I guess that would be fixable by checking (s[0] == '0' && s[1] == '\0')?
However, it seems kconfig doesn't support setting int options to hex or
octal.

If I try an hex value in menuconfig it says "You have made an invalid entry."
If I try editing .config or setting via scripts/config --set-val, it
just gets reset when trying to generate include/generated/autoconf.h

Lucas De Marchi

>
>It is probably OK for private macro, but it can hurt in kconfig.h,
>especially the 2nd issue
>
>
>Regards
>
>Andrzej
>
>>
>>   #endif /* !__I915_UTILS_H */
