Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5168714B559
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2020 14:48:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79C8A6EE3E;
	Tue, 28 Jan 2020 13:48:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA6D16EE3E;
 Tue, 28 Jan 2020 13:48:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Jan 2020 05:48:16 -0800
X-IronPort-AV: E=Sophos;i="5.70,374,1574150400"; d="scan'208";a="222110629"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Jan 2020 05:48:13 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Wambui Karuga <wambui.karugax@gmail.com>, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/i915/gem: initial conversion to new
 logging macros using coccinelle
In-Reply-To: <b97de5b8-b87f-3b2d-e8bc-942fc21b266e@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200122125750.9737-1-wambui.karugax@gmail.com>
 <20200122125750.9737-2-wambui.karugax@gmail.com>
 <b97de5b8-b87f-3b2d-e8bc-942fc21b266e@linux.intel.com>
Date: Tue, 28 Jan 2020 15:48:10 +0200
Message-ID: <87h80fd751.fsf@intel.com>
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

On Tue, 28 Jan 2020, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
>> -DRM_DEBUG(
>> +drm_dbg(&T->drm,
>
> This changes DRM_UT_CORE to DRM_UT_DRIVER so our typical drm.debug=0xe 
> becomes much more spammy.

This is what I've instructed Wambui to do in i915. It's my mistake that
I haven't requested this to be pointed out in the commit message.

DRM_DEBUG() and DRM_DEBUG_DRIVER() have been conflated over the
years. The former is supposed to be for drm core code only, but drivers
are littered with it. I'm hoping drivers are less likely to use the new
drm_dbg_core() which maps to DRM_DEBUG(). The shorter drm_dbg() is the
new DRM_DEBUG_DRIVER().

If you think drm.debug=0xe is too spammy now, the fix is not to abuse
DRM_UT_CORE as a spare category.


BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
