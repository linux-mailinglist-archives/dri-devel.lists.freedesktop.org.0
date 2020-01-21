Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0369A14386E
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2020 09:39:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 778AC6EBE7;
	Tue, 21 Jan 2020 08:39:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA3FA6EBE7;
 Tue, 21 Jan 2020 08:39:41 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Jan 2020 00:39:41 -0800
X-IronPort-AV: E=Sophos;i="5.70,345,1574150400"; d="scan'208";a="219880620"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Jan 2020 00:39:37 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>, daniel@ffwll.ch,
 sam@ravnborg.org, sudeep.dutt@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>
Subject: Re: [[Intel-gfx] [PATCH v2 01/10] drm/print: introduce new struct
 drm_device based WARN* macros
In-Reply-To: <87y2u9jav8.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200115034455.17658-1-pankaj.laxminarayan.bharadiya@intel.com>
 <20200115034455.17658-2-pankaj.laxminarayan.bharadiya@intel.com>
 <87y2u9jav8.fsf@intel.com>
Date: Tue, 21 Jan 2020 10:39:34 +0200
Message-ID: <87muahfbjt.fsf@intel.com>
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
Cc: pankaj.laxminarayan.bharadiya@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 15 Jan 2020, Jani Nikula <jani.nikula@intel.com> wrote:
> On Wed, 15 Jan 2020, Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com> wrote:
>> Add new struct drm_device based WARN* macros. These are modeled after
>> the core kernel device based WARN* macros. These would be preferred
>> over the regular WARN* macros, where possible.
>>
>> These macros include device information in the backtrace, so we know
>> what device the warnings originate from.
>>
>> Knowing the device specific information in the backtrace would be
>> helpful in development all around.
>>
>> Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
>
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>

All, I'd really appreciate acks or reviews on this one to unblock the
rest. I think the patch is fine, but I'd like wider approval before
merging.

I'm thinking of putting this in a topic branch and merging to both
drm-intel-next-queued and drm-misc-next, so we can start converting i915
to use this.

BR,
Jani.


>
>> ---
>>  include/drm/drm_print.h | 29 +++++++++++++++++++++++++++++
>>  1 file changed, 29 insertions(+)
>>
>> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
>> index 8f99d389792d..894a0b9437e2 100644
>> --- a/include/drm/drm_print.h
>> +++ b/include/drm/drm_print.h
>> @@ -553,4 +553,33 @@ void __drm_err(const char *format, ...);
>>  #define DRM_DEBUG_PRIME_RATELIMITED(fmt, ...)				\
>>  	DRM_DEV_DEBUG_PRIME_RATELIMITED(NULL, fmt, ##__VA_ARGS__)
>>  
>> +/*
>> + * struct drm_device based WARNs
>> + *
>> + * drm_WARN*() acts like WARN*(), but with the key difference of
>> + * using device specific information so that we know from which device
>> + * warning is originating from.
>> + *
>> + * Prefer drm_device based drm_WARN* over regular WARN*
>> + */
>> +
>> +/* Helper for struct drm_device based WARNs */
>> +#define drm_WARN(drm, condition, format, arg...)			\
>> +	WARN(condition, "%s %s: " format,				\
>> +			dev_driver_string((drm)->dev),			\
>> +			dev_name((drm)->dev), ## arg)
>> +
>> +#define drm_WARN_ONCE(drm, condition, format, arg...)			\
>> +	WARN_ONCE(condition, "%s %s: " format,				\
>> +			dev_driver_string((drm)->dev),			\
>> +			dev_name((drm)->dev), ## arg)
>> +
>> +#define drm_WARN_ON(drm, x)						\
>> +	drm_WARN((drm), (x), "%s",					\
>> +		 "drm_WARN_ON(" __stringify(x) ")")
>> +
>> +#define drm_WARN_ON_ONCE(drm, x)					\
>> +	drm_WARN_ONCE((drm), (x), "%s",					\
>> +		      "drm_WARN_ON_ONCE(" __stringify(x) ")")
>> +
>>  #endif /* DRM_PRINT_H_ */

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
