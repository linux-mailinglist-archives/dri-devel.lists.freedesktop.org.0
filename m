Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C997EAFBB
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 13:21:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4485910E43F;
	Tue, 14 Nov 2023 12:20:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6640510E43F
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 12:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699964455; x=1731500455;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Yi3tbFBYQp9CsE0xPb2ZCdiwwdNAe9Vbrdm9n/au/eI=;
 b=JMk6Vi8YtVG+S3q2GSh58ijp3qs2u7ipPVkp2SEdahtrVG6AaPfAsyLq
 TftVBKEb3CN5HboTGOGazajs0AKV1JbYOvyDrHcAJPl+yDVIKmM1wJxyq
 cP97SgmaXKOSKiPEAadaK/T89swuDxoLvYyK9aX/x+iuGJsynC+0j4yvB
 T9wvcjvVnNPfKk6X/pCWqP4L/zCUPXLKddY5JfQ2djb2EwXbyFfQgvU2p
 oqhjbjxweouSEsNitHIxUVDxc6jfPTXHtUqZffvmYrpGFbWXBTS+YPeEF
 OKX2S+IVGSFQQsyaDrFqxh0PWrpvxaL2QhE22+xSgEI8KFyTdKnMIghOR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="421741969"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="421741969"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 04:20:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="758155590"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="758155590"
Received: from hatran1-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.252.56.145])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 04:20:09 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Luben Tuikov <ltuikov89@gmail.com>, Direct Rendering Infrastructure -
 Development <dri-devel@lists.freedesktop.org>, Danilo Krummrich
 <dakr@redhat.com>
Subject: Re: [PATCH] drm/sched: Define pr_fmt() for DRM using pr_*()
In-Reply-To: <35c03405-4163-45de-b67e-77de08ed2d2a@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231110002659.113208-2-ltuikov89@gmail.com>
 <878r75wzm9.fsf@intel.com>
 <35c03405-4163-45de-b67e-77de08ed2d2a@gmail.com>
Date: Tue, 14 Nov 2023 14:20:06 +0200
Message-ID: <87h6losf0p.fsf@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 13 Nov 2023, Luben Tuikov <ltuikov89@gmail.com> wrote:
> Hi Jani,
>
> On 2023-11-10 07:40, Jani Nikula wrote:
>> On Thu, 09 Nov 2023, Luben Tuikov <ltuikov89@gmail.com> wrote:
>>> Define pr_fmt() as "[drm] " for DRM code using pr_*() facilities, especially
>>> when no devices are available. This makes it easier to browse kernel logs.
>> 
>> Please do not merge patches before people have actually had a chance to
>> look at them. This was merged *way* too quickly.
>> 
>> This does not do what you think it does, and it's not robust enough.
>> 
>> The drm_print.[ch] facilities use very few pr_*() calls directly. The
>> users of pr_*() calls do not necessarily include <drm/drm_print.h> at
>> all, and really don't have to.
>> 
>> Even the ones that do include it, usually have <linux/...> includes
>> first, and <drm/...> includes next. Notably, <linux/kernel.h> includes
>> <linux/printk.h>.
>> 
>> And, of course, <linux/printk.h> defines pr_fmt() itself if not already
>> defined.
>> 
>>> Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
>>> ---
>>>  include/drm/drm_print.h | 14 ++++++++++++++
>>>  1 file changed, 14 insertions(+)
>>>
>>> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
>>> index a93a387f8a1a15..e8fe60d0eb8783 100644
>>> --- a/include/drm/drm_print.h
>>> +++ b/include/drm/drm_print.h
>>> @@ -26,6 +26,20 @@
>>>  #ifndef DRM_PRINT_H_
>>>  #define DRM_PRINT_H_
>>>  
>>> +/* Define this before including linux/printk.h, so that the format
>>> + * string in pr_*() macros is correctly set for DRM. If a file wants
>>> + * to define this to something else, it should do so before including
>>> + * this header file.
>> 
>> The only way this would work is by including <drm/drm_print.h> as the
>> very first header, and that's fragile at best.
>> 
>>> + *
>>> + * It is encouraged code using pr_err() to prefix their format with
>>> + * the string "*ERROR* ", to make it easier to scan kernel logs. For
>>> + * instance,
>>> + *   pr_err("*ERROR* <the rest of your format string here>", args).
>> 
>> No, it's encouraged not to use pr_*() at all, and prefer drm device
>> based logging, or device based logging.
>> 
>> I'd rather this whole thing was just reverted.
>
> The revert has been pushed--thanks for R-B-ing it.
>
> FWIW, I wanted a device-less DRM print, with a prefix "[drm] *ERROR* ",
> because this is what we scan for, especially when we get a blank screen at boot/modprobe.
> There's a few cases in DRM where when we return -E... it's most likely a blank screen result,
> as was the case with a recent debug I had with amdgpu when pushing the variable sched->rq.
>
> So then I went by this, in linux/printk.h:
>
> /**
>  * pr_fmt - used by the pr_*() macros to generate the printk format string
>  * @fmt: format string passed from a pr_*() macro
>  *
>  * This macro can be used to generate a unified format string for pr_*()
>  * macros. A common use is to prefix all pr_*() messages in a file with a common
>  * string. For example, defining this at the top of a source file:
>  *
>  *        #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  *
>  * would prefix all pr_info, pr_emerg... messages in the file with the module
>  * name.
>  */
> #ifndef pr_fmt
> #define pr_fmt(fmt) fmt
> #endif
>
> Any suggestions as to a device-less DRM print with prefix "[drm] *ERROR* "?

I don't think there's a way to do that using pr_fmt for an entire driver
or subsystem. That really only works for individual compilation units.

We have DRM_ERROR() which does the trick, but the documentation says
it's been deprecated in favor pr_err()... though I think drm_err()
should be preferred over pr_err() where possible.

Maybe we should extend 7911902129a8 ("drm/print: Handle potentially NULL
drm_devices in drm_dbg_*") to __drm_printk() and handle NULL drm device
gracefully.

With just "(drm) ? (drm)->dev : NULL" the output will have "(NULL device
*)" which works but is a bit meh, but maybe something like this is
possible (untested):


diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index a93a387f8a1a..d16affece5b7 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -452,9 +452,13 @@ void __drm_dev_dbg(struct _ddebug *desc, const struct device *dev,
  */
 
 /* Helper for struct drm_device based logging. */
-#define __drm_printk(drm, level, type, fmt, ...)			\
-	dev_##level##type((drm)->dev, "[drm] " fmt, ##__VA_ARGS__)
-
+#define __drm_printk(drm, level, type, fmt, ...) \
+	do {								\
+		if (drm)						\
+			dev_##level##type((drm)->dev, "[drm] " fmt, ##__VA_ARGS__); \
+		else							\
+			pr_##level##type("[drm] " fmt, ##__VA_ARGS__);	\
+	} while (0)
 
 #define drm_info(drm, fmt, ...)					\
 	__drm_printk((drm), info,, fmt, ##__VA_ARGS__)


Then again that adds quite a bit of overhead all over the place unless
the compiler can be 100% it's one or the other.

BR,
Jani.


-- 
Jani Nikula, Intel
