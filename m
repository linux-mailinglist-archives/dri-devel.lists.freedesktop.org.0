Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0951B2185
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 10:24:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16A886E8A4;
	Tue, 21 Apr 2020 08:24:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A27576E897;
 Tue, 21 Apr 2020 08:24:45 +0000 (UTC)
IronPort-SDR: BvG6Pi4BzYMp+OAKdrLLe62Zjzv7g8EzcuFFM/JYFP+vBwhEJyu8FyvLFME2koAUhOopifwzzK
 ebMbCM+/9zpA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2020 01:24:45 -0700
IronPort-SDR: H5mndwxhmC2bj+Hg8hCaz6DgGaCgB8vJcG2K97w7WIXG4F3KZ1q47xHNjTr8HQwGzzSreYcGj/
 qrQLqc+lBVbQ==
X-IronPort-AV: E=Sophos;i="5.72,409,1580803200"; d="scan'208";a="429450840"
Received: from parkernx-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.46.80])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2020 01:24:42 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>
Subject: Re: [PATCH 15/18] drm/i915/i915_drv: Prefer drm_WARN_ON over WARN_ON
In-Reply-To: <20200406112800.23762-16-pankaj.laxminarayan.bharadiya@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200406112800.23762-1-pankaj.laxminarayan.bharadiya@intel.com>
 <20200406112800.23762-16-pankaj.laxminarayan.bharadiya@intel.com>
Date: Tue, 21 Apr 2020 11:24:39 +0300
Message-ID: <87o8rlz1o8.fsf@intel.com>
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

On Mon, 06 Apr 2020, Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com> wrote:
> struct drm_device specific drm_WARN* macros include device information
> in the backtrace, so we know what device the warnings originate from.
>
> Prefer drm_WARN_ON over WARN_ON.
>
> Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_drv.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index e9ee4daa9320..be33cab6403d 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -1647,7 +1647,8 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>  #define HAS_DISPLAY(dev_priv) (INTEL_INFO(dev_priv)->pipe_mask != 0)
>  
>  /* Only valid when HAS_DISPLAY() is true */
> -#define INTEL_DISPLAY_ENABLED(dev_priv) (WARN_ON(!HAS_DISPLAY(dev_priv)), !i915_modparams.disable_display)
> +#define INTEL_DISPLAY_ENABLED(dev_priv) \
> +		(drm_WARN_ON(&dev_priv->drm, !HAS_DISPLAY(dev_priv)), !i915_modparams.disable_display)

Needs parens around the dev_priv macro argument.

BR,
Jani.

>  
>  static inline bool intel_vtd_active(void)
>  {

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
