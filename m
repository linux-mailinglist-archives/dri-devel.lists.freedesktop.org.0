Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6241390CA
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2020 13:08:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69C586E082;
	Mon, 13 Jan 2020 12:08:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70A216E082;
 Mon, 13 Jan 2020 12:08:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jan 2020 04:08:27 -0800
X-IronPort-AV: E=Sophos;i="5.69,428,1571727600"; d="scan'208";a="217387846"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jan 2020 04:08:25 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>,
 Wambui Karuga <wambui.karugax@gmail.com>, airlied@linux.ie, daniel@ffwll.ch,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com
Subject: Re: [PATCH] drm/i915: convert to new logging macros based on struct
 intel_engine_cs.
In-Reply-To: <157891427231.27314.12398974277241668021@skylake-alporthouse-com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200113111025.2048-1-wambui.karugax@gmail.com>
 <157891427231.27314.12398974277241668021@skylake-alporthouse-com>
Date: Mon, 13 Jan 2020 14:08:22 +0200
Message-ID: <87lfqbmudl.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, sean@poorly.run,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 13 Jan 2020, Chris Wilson <chris@chris-wilson.co.uk> wrote:
> Quoting Wambui Karuga (2020-01-13 11:10:25)
>> fn(...) {
>> ...
>> struct intel_engine_cs *E = ...;
>> +struct drm_i915_private *dev_priv = E->i915;
>
> No new dev_priv.

Wambui, we're gradually converting all dev_priv variable and parameter
names to i915.

> There should be no reason for drm_dbg here, as the rest of the debug is
> behind ENGINE_TRACE and so the vestigial debug should be moved over, or
> deleted as not being useful.
>
> The error messages look unhelpful.

I don't think you can expect any meaninful improvements on the debug
message contents from Wambui without detailed help at this point.

>
>>                 if ((batch_end - cmd) < length) {
>> -                       DRM_DEBUG("CMD: Command length exceeds batch length: 0x%08X length=%u batchlen=%td\n",
>> -                                 *cmd,
>> -                                 length,
>> -                                 batch_end - cmd);
>> +                       drm_dbg(&dev_priv->drm,
>> +                               "CMD: Command length exceeds batch length: 0x%08X length=%u batchlen=%td\n",
>
> No. This is not driver debug. If anything this should be pr_debug, or
> some over user centric channel.

I'm sorry, I still don't understand your reasoning here.

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
