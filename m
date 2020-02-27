Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F08517183D
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 14:09:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E027D8914C;
	Thu, 27 Feb 2020 13:09:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE6BA8914C;
 Thu, 27 Feb 2020 13:09:05 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Feb 2020 05:09:05 -0800
X-IronPort-AV: E=Sophos;i="5.70,492,1574150400"; d="scan'208";a="227136570"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Feb 2020 05:09:01 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Wambui Karuga <wambui.karugax@gmail.com>, daniel@ffwll.ch, airlied@linux.ie,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 16/21] drm/i915: make *_debugfs_register() functions
 return void.
In-Reply-To: <20200227120232.19413-17-wambui.karugax@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200227120232.19413-1-wambui.karugax@gmail.com>
 <20200227120232.19413-17-wambui.karugax@gmail.com>
Date: Thu, 27 Feb 2020 15:08:58 +0200
Message-ID: <87zhd4qis5.fsf@intel.com>
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
Cc: gregkh@linuxfoundation.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 27 Feb 2020, Wambui Karuga <wambui.karugax@gmail.com> wrote:
> Since 987d65d01356 (drm: debugfs: make
> drm_debugfs_create_files() never fail), drm_debugfs_create_files() never
> fails and should return void. Therefore, remove its use as the
> return value of i915_debugfs_register() and
> intel_display_debugfs_register() and have both functions return void.
>
> Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display_debugfs.c | 8 ++++----
>  drivers/gpu/drm/i915/display/intel_display_debugfs.h | 4 ++--
>  drivers/gpu/drm/i915/i915_debugfs.c                  | 8 ++++----
>  drivers/gpu/drm/i915/i915_debugfs.h                  | 4 ++--
>  4 files changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> index 46954cc7b6c0..3b877c34c420 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> @@ -1922,7 +1922,7 @@ static const struct {
>  	{"i915_edp_psr_debug", &i915_edp_psr_debug_fops},
>  };
>  
> -int intel_display_debugfs_register(struct drm_i915_private *i915)
> +void intel_display_debugfs_register(struct drm_i915_private *i915)
>  {
>  	struct drm_minor *minor = i915->drm.primary;
>  	int i;
> @@ -1935,9 +1935,9 @@ int intel_display_debugfs_register(struct drm_i915_private *i915)
>  				    intel_display_debugfs_files[i].fops);
>  	}
>  
> -	return drm_debugfs_create_files(intel_display_debugfs_list,
> -					ARRAY_SIZE(intel_display_debugfs_list),
> -					minor->debugfs_root, minor);
> +	drm_debugfs_create_files(intel_display_debugfs_list,
> +				 ARRAY_SIZE(intel_display_debugfs_list),
> +				 minor->debugfs_root, minor);
>  }
>  
>  static int i915_panel_show(struct seq_file *m, void *data)
> diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.h b/drivers/gpu/drm/i915/display/intel_display_debugfs.h
> index a3bea1ce04c2..a5cf7a6d3d34 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_debugfs.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.h
> @@ -10,10 +10,10 @@ struct drm_connector;
>  struct drm_i915_private;
>  
>  #ifdef CONFIG_DEBUG_FS
> -int intel_display_debugfs_register(struct drm_i915_private *i915);
> +void intel_display_debugfs_register(struct drm_i915_private *i915);
>  int intel_connector_debugfs_add(struct drm_connector *connector);
>  #else
> -static inline int intel_display_debugfs_register(struct drm_i915_private *i915) { return 0; }
> +static inline int intel_display_debugfs_register(struct drm_i915_private *i915) {}

You don't actually change the return type.

Otherwise, LGTM.

BR,
Jani.

>  static inline int intel_connector_debugfs_add(struct drm_connector *connector) { return 0; }
>  #endif
>  
> diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
> index 8f2525e4ce0f..de313199c714 100644
> --- a/drivers/gpu/drm/i915/i915_debugfs.c
> +++ b/drivers/gpu/drm/i915/i915_debugfs.c
> @@ -2392,7 +2392,7 @@ static const struct i915_debugfs_files {
>  	{"i915_guc_log_relay", &i915_guc_log_relay_fops},
>  };
>  
> -int i915_debugfs_register(struct drm_i915_private *dev_priv)
> +void i915_debugfs_register(struct drm_i915_private *dev_priv)
>  {
>  	struct drm_minor *minor = dev_priv->drm.primary;
>  	int i;
> @@ -2409,7 +2409,7 @@ int i915_debugfs_register(struct drm_i915_private *dev_priv)
>  				    i915_debugfs_files[i].fops);
>  	}
>  
> -	return drm_debugfs_create_files(i915_debugfs_list,
> -					I915_DEBUGFS_ENTRIES,
> -					minor->debugfs_root, minor);
> +	drm_debugfs_create_files(i915_debugfs_list,
> +				 I915_DEBUGFS_ENTRIES,
> +				 minor->debugfs_root, minor);
>  }
> diff --git a/drivers/gpu/drm/i915/i915_debugfs.h b/drivers/gpu/drm/i915/i915_debugfs.h
> index 6da39c76ab5e..1de2736f1248 100644
> --- a/drivers/gpu/drm/i915/i915_debugfs.h
> +++ b/drivers/gpu/drm/i915/i915_debugfs.h
> @@ -12,10 +12,10 @@ struct drm_i915_private;
>  struct seq_file;
>  
>  #ifdef CONFIG_DEBUG_FS
> -int i915_debugfs_register(struct drm_i915_private *dev_priv);
> +void i915_debugfs_register(struct drm_i915_private *dev_priv);
>  void i915_debugfs_describe_obj(struct seq_file *m, struct drm_i915_gem_object *obj);
>  #else
> -static inline int i915_debugfs_register(struct drm_i915_private *dev_priv) { return 0; }
> +static inline void i915_debugfs_register(struct drm_i915_private *dev_priv) {}
>  static inline void i915_debugfs_describe_obj(struct seq_file *m, struct drm_i915_gem_object *obj) {}
>  #endif

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
