Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F7E1CA3E6
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 08:33:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D4AD6E17F;
	Fri,  8 May 2020 06:33:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DAF46E17F
 for <dri-devel@lists.freedesktop.org>; Fri,  8 May 2020 06:33:11 +0000 (UTC)
IronPort-SDR: 3ihapQCtMocOVV2NC1aBLdqC699DnjQJaEcPZJySsQ9k5VRTnz+bACBDbZciD3/4thDkvLxej3
 RGDiHrMjGIzg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2020 23:33:10 -0700
IronPort-SDR: APgQoGf9EITaDSoBwW2hvoUqezzCtqChdCZbjZkKOQPPpobbHlP9WP6wgc0rd5tJnCQ8xfXkgs
 TZDJR31gKpPw==
X-IronPort-AV: E=Sophos;i="5.73,366,1583222400"; d="scan'208";a="435575236"
Received: from keolinsk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.33.209])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2020 23:33:08 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 11/36] drm/gem: add drm_object_put helper
In-Reply-To: <20200507150822.114464-12-emil.l.velikov@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200507150822.114464-1-emil.l.velikov@gmail.com>
 <20200507150822.114464-12-emil.l.velikov@gmail.com>
Date: Fri, 08 May 2020 09:33:06 +0300
Message-ID: <87wo5n542l.fsf@intel.com>
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
Cc: emil.l.velikov@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 07 May 2020, Emil Velikov <emil.l.velikov@gmail.com> wrote:
> From: Emil Velikov <emil.velikov@collabora.com>
>
> Spelling out _unlocked for each and every driver is a annoying.
> Especially if we consider how many drivers, do not know (or need to)
> about the horror stories involving struct_mutex.
>
> Add helper, which will allow us to transition the drivers one by one,
> dropping the suffix.
>
> Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> ---
>  include/drm/drm_gem.h | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index 0f22f3320dcb..70c0059ee72b 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -364,18 +364,20 @@ static inline void drm_gem_object_get(struct drm_gem_object *obj)
>  }
>  
>  /**
> - * drm_gem_object_put_unlocked - drop a GEM buffer object reference
> + * drm_gem_object_put- drop a GEM buffer object reference
                        ^

Missing space.

>   * @obj: GEM buffer object
>   *
>   * This releases a reference to @obj. Callers must not hold the
>   * &drm_device.struct_mutex lock when calling this function.
>   */
>  static inline void
> -drm_gem_object_put_unlocked(struct drm_gem_object *obj)
> +drm_gem_object_put(struct drm_gem_object *obj)
>  {
>  	kref_put(&obj->refcount, drm_gem_object_free);
>  }
>  
> +#define drm_gem_object_put_unlocked drm_gem_object_put
> +
>  void drm_gem_object_put_locked(struct drm_gem_object *obj);
>  
>  int drm_gem_handle_create(struct drm_file *file_priv,

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
