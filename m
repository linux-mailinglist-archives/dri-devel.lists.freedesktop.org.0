Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDC7458A9C
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 09:41:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEA7C89FD7;
	Mon, 22 Nov 2021 08:41:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD21489FD7;
 Mon, 22 Nov 2021 08:41:25 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10175"; a="214776318"
X-IronPort-AV: E=Sophos;i="5.87,254,1631602800"; d="scan'208";a="214776318"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 00:41:25 -0800
X-IronPort-AV: E=Sophos;i="5.87,254,1631602800"; d="scan'208";a="496779330"
Received: from rmcdonax-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.19.217])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 00:41:22 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/i915: Remove unused intel_gmbus_set_speed() function
In-Reply-To: <20211121191001.252076-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211121191001.252076-1-hdegoede@redhat.com>
Date: Mon, 22 Nov 2021 10:41:19 +0200
Message-ID: <87wnl0oa4w.fsf@intel.com>
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 21 Nov 2021, Hans de Goede <hdegoede@redhat.com> wrote:
> The intel_gmbus_set_speed() function is not used anywhere, remove it.
>
> Note drivers/gpu/drm/gma500 has its own copy called
> gma_intel_gmbus_set_speed() which is used, the intel_gmbus_set_speed()
> version in the i915 code is not used at all

Wow, the last user might have been removed by me. In 2012.

commit 6cb1612a7dc4c3d5ed86dba5dd21bb48a5c395af
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Mon Oct 22 16:12:17 2012 +0300

    drm/i915/sdvo: force GPIO bit-banging also on default pin

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/i915/display/intel_gmbus.c | 7 -------
>  drivers/gpu/drm/i915/display/intel_gmbus.h | 1 -
>  2 files changed, 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
> index ceb1bf8a8c3c..343f85543446 100644
> --- a/drivers/gpu/drm/i915/display/intel_gmbus.c
> +++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
> @@ -922,13 +922,6 @@ struct i2c_adapter *intel_gmbus_get_adapter(struct drm_i915_private *dev_priv,
>  	return &dev_priv->gmbus[pin].adapter;
>  }
>  
> -void intel_gmbus_set_speed(struct i2c_adapter *adapter, int speed)
> -{
> -	struct intel_gmbus *bus = to_intel_gmbus(adapter);
> -
> -	bus->reg0 = (bus->reg0 & ~(0x3 << 8)) | speed;
> -}
> -
>  void intel_gmbus_force_bit(struct i2c_adapter *adapter, bool force_bit)
>  {
>  	struct intel_gmbus *bus = to_intel_gmbus(adapter);
> diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.h b/drivers/gpu/drm/i915/display/intel_gmbus.h
> index b96212b85425..8edc2e99cf53 100644
> --- a/drivers/gpu/drm/i915/display/intel_gmbus.h
> +++ b/drivers/gpu/drm/i915/display/intel_gmbus.h
> @@ -41,7 +41,6 @@ int intel_gmbus_output_aksv(struct i2c_adapter *adapter);
>  
>  struct i2c_adapter *
>  intel_gmbus_get_adapter(struct drm_i915_private *dev_priv, unsigned int pin);
> -void intel_gmbus_set_speed(struct i2c_adapter *adapter, int speed);
>  void intel_gmbus_force_bit(struct i2c_adapter *adapter, bool force_bit);
>  bool intel_gmbus_is_forced_bit(struct i2c_adapter *adapter);
>  void intel_gmbus_reset(struct drm_i915_private *dev_priv);

-- 
Jani Nikula, Intel Open Source Graphics Center
