Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB53473441
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 19:44:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF60110E894;
	Mon, 13 Dec 2021 18:44:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E74610E893;
 Mon, 13 Dec 2021 18:44:23 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="238615470"
X-IronPort-AV: E=Sophos;i="5.88,203,1635231600"; d="scan'208";a="238615470"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 10:44:22 -0800
X-IronPort-AV: E=Sophos;i="5.88,203,1635231600"; d="scan'208";a="505017490"
Received: from ppolasze-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.20.7])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 10:44:18 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: broonie@kernel.org, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/i915: Fix implicit use of struct pci_dev
In-Reply-To: <20211213170753.3680209-1-broonie@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211213170753.3680209-1-broonie@kernel.org>
Date: Mon, 13 Dec 2021 20:44:14 +0200
Message-ID: <87fsqw73b5.fsf@intel.com>
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
Cc: Hans de Goede <hdegoede@redhat.com>, intel-gfx@lists.freedesktop.org,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 13 Dec 2021, broonie@kernel.org wrote:
> From: Mark Brown <broonie@kernel.org>
>
> intel_device_info.h references struct pci_dev but does not ensure that
> the struct has been declared, causing build failures if something in
> other headers changes so that the implicit dependency it is relying on
> is no longer satisfied:
>
> In file included from /tmp/next/build/drivers/gpu/drm/i915/intel_device_info.h:32,
>                  from /tmp/next/build/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h:11,
>                  from /tmp/next/build/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:11:
> /tmp/next/build/drivers/gpu/drm/i915/display/intel_display.h:643:39: error: 'struct pci_dev' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
>   643 | bool intel_modeset_probe_defer(struct pci_dev *pdev);
>       |                                       ^~~~~~~
> cc1: all warnings being treated as errors
>
> Add a declaration of the struct to fix this.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>

Thanks,

Fixes: 94b541f53db1 ("drm/i915: Add intel_modeset_probe_defer() helper")
Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_display.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display.h b/drivers/gpu/drm/i915/display/intel_display.h
> index 4b688a9727b39..377790393a855 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.h
> +++ b/drivers/gpu/drm/i915/display/intel_display.h
> @@ -57,6 +57,7 @@ struct intel_plane;
>  struct intel_plane_state;
>  struct intel_remapped_info;
>  struct intel_rotation_info;
> +struct pci_dev;
>  
>  enum i915_gpio {
>  	GPIOA,

-- 
Jani Nikula, Intel Open Source Graphics Center
