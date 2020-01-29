Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C41B14CBF5
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2020 14:59:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E5DA6F56B;
	Wed, 29 Jan 2020 13:59:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E88316F569;
 Wed, 29 Jan 2020 13:59:31 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Jan 2020 05:59:31 -0800
X-IronPort-AV: E=Sophos;i="5.70,378,1574150400"; d="scan'208";a="401994886"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Jan 2020 05:59:27 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Wambui Karuga <wambui.karugax@gmail.com>, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/i915/gem: initial conversion to new
 logging macros using coccinelle
In-Reply-To: <87h80eaciw.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200122125750.9737-1-wambui.karugax@gmail.com>
 <20200122125750.9737-2-wambui.karugax@gmail.com>
 <b97de5b8-b87f-3b2d-e8bc-942fc21b266e@linux.intel.com>
 <87h80fd751.fsf@intel.com>
 <158023610727.2129.14756905957829283843@skylake-alporthouse-com>
 <87h80eaciw.fsf@intel.com>
Date: Wed, 29 Jan 2020 15:59:24 +0200
Message-ID: <87lfpqbbyb.fsf@intel.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 29 Jan 2020, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Tue, 28 Jan 2020, Chris Wilson <chris@chris-wilson.co.uk> wrote:
>> Quoting Jani Nikula (2020-01-28 13:48:10)
>>> On Tue, 28 Jan 2020, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
>>> >> -DRM_DEBUG(
>>> >> +drm_dbg(&T->drm,
>>> >
>>> > This changes DRM_UT_CORE to DRM_UT_DRIVER so our typical drm.debug=0xe 
>>> > becomes much more spammy.
>>> 
>>> This is what I've instructed Wambui to do in i915. It's my mistake that
>>> I haven't requested this to be pointed out in the commit message.
>>> 
>>> DRM_DEBUG() and DRM_DEBUG_DRIVER() have been conflated over the
>>> years. The former is supposed to be for drm core code only, but drivers
>>> are littered with it. I'm hoping drivers are less likely to use the new
>>> drm_dbg_core() which maps to DRM_DEBUG(). The shorter drm_dbg() is the
>>> new DRM_DEBUG_DRIVER().
>>> 
>>> If you think drm.debug=0xe is too spammy now, the fix is not to abuse
>>> DRM_UT_CORE as a spare category
>>
>> That mistake was made when that category was assigned to user debug like
>> ioctls.
>>
>> Shall I send a revert to remove the spam?
>
> Fine. Please suggest an alternative to DRM_UT_CORE to use here.

How about this for the time being, to continue the conversion:

1. Selectively revert the DRM_DEBUG() calls that were converted to
   drm_dbg() back to DRM_DEBUG() in gt/ and gem/. Let the others be. I
   think elsewhere the conversion is fine.

2. Continue the conversion otherwise, but leave current DRM_DEBUG()
   intact. Except in display/ where I think the conversion is fine.

3. Deal with the DRM_DEBUG() later once we figure out what we want.


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
