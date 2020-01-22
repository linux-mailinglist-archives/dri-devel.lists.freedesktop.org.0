Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D2A1458E7
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 16:39:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 566AE6F592;
	Wed, 22 Jan 2020 15:39:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00EFA6F590;
 Wed, 22 Jan 2020 15:39:04 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jan 2020 07:32:56 -0800
X-IronPort-AV: E=Sophos;i="5.70,350,1574150400"; d="scan'208";a="400039753"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jan 2020 07:32:52 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Sean Paul <sean@poorly.run>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
Subject: Re: [Intel-gfx] [ [PATCH v2 01/10] drm/print: introduce new struct
 drm_device based WARN* macros
In-Reply-To: <CAMavQK+aXO5VMAwCu4jBbah6MkubnO+sUxd+av0A_=Ld_A9kzQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200115034455.17658-1-pankaj.laxminarayan.bharadiya@intel.com>
 <20200115034455.17658-2-pankaj.laxminarayan.bharadiya@intel.com>
 <CAMavQK+aXO5VMAwCu4jBbah6MkubnO+sUxd+av0A_=Ld_A9kzQ@mail.gmail.com>
Date: Wed, 22 Jan 2020 17:32:49 +0200
Message-ID: <87blqvecbi.fsf@intel.com>
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
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 sudeep.dutt@intel.com, dri-devel <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 22 Jan 2020, Sean Paul <sean@poorly.run> wrote:
> On Tue, Jan 14, 2020 at 10:49 PM Pankaj Bharadiya
> <pankaj.laxminarayan.bharadiya@intel.com> wrote:
>>
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
> Acked-by: Sean Paul <sean@poorly.run>

Maarten and Maxime also provided their acks on IRC. Thanks for the
review and acks, I've pushed this to a topic branch, sent the pull
request for drm-misc-next [1], and pulled the same to
drm-intel-next-queued [2] to unblock further work there.

BR,
Jani.


[1] http://lore.kernel.org/r/87eevrecnf.fsf@intel.com
[2] 7c7d5b1ce739 ("Merge tag 'topic/drm-warn-2020-01-22' of git://anongit.freedesktop.org/drm/drm-intel into drm-intel-next-queued")



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
>>  #define DRM_DEBUG_PRIME_RATELIMITED(fmt, ...)                          \
>>         DRM_DEV_DEBUG_PRIME_RATELIMITED(NULL, fmt, ##__VA_ARGS__)
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
>> +#define drm_WARN(drm, condition, format, arg...)                       \
>> +       WARN(condition, "%s %s: " format,                               \
>> +                       dev_driver_string((drm)->dev),                  \
>> +                       dev_name((drm)->dev), ## arg)
>> +
>> +#define drm_WARN_ONCE(drm, condition, format, arg...)                  \
>> +       WARN_ONCE(condition, "%s %s: " format,                          \
>> +                       dev_driver_string((drm)->dev),                  \
>> +                       dev_name((drm)->dev), ## arg)
>> +
>> +#define drm_WARN_ON(drm, x)                                            \
>> +       drm_WARN((drm), (x), "%s",                                      \
>> +                "drm_WARN_ON(" __stringify(x) ")")
>> +
>> +#define drm_WARN_ON_ONCE(drm, x)                                       \
>> +       drm_WARN_ONCE((drm), (x), "%s",                                 \
>> +                     "drm_WARN_ON_ONCE(" __stringify(x) ")")
>> +
>>  #endif /* DRM_PRINT_H_ */
>> --
>> 2.23.0
>>
>> _______________________________________________
>> Intel-gfx mailing list
>> Intel-gfx@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
