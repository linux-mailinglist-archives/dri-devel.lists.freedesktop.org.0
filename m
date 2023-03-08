Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3606B07EE
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 14:07:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC7BE10E5C9;
	Wed,  8 Mar 2023 13:07:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E72D910E13C;
 Wed,  8 Mar 2023 13:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678280825; x=1709816825;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=fHnLTWZHVD6D6gnDWAtOXcch5xnll2eXU1BIF6pkTu4=;
 b=NzrpcWl3ERIYuZlRSLKcgdBaDCw3aF09Mt/kQrits3W0pUcJvjNO+TWe
 YiIRGYRl81chSVQ0T32kG4Zvrtpbher328AZay0O9wOHSM2ReE2AQX/+4
 ecFX0+O/e5lHJhncGLQoloInpIKELy4ky2jtwdz2UH69+MaVOKo8Wo6qb
 qk5p73bu3JNmLswwaSuLX8j+YWf+1kkXwVkCkvAw+fP97OtaddfTruMM2
 kGqm21GLk8iz+NCez2wFOJ0MU1D2jbdUJ5U/adAbe9gAoTSr4Pfgx7Yy6
 +eTkQ9uD9TnveR5LZXLqz4ZnZth9mK8i9LkHckRDoeZMUUc/ZuDaF/z11 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="324460071"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="324460071"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 05:07:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="654335463"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="654335463"
Received: from eharan-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.58.177])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 05:07:01 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Guchun Chen <guchun.chen@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 hawking.zhang@amd.com, dmitry.baryshkov@linaro.org, spasswolf@web.de
Subject: Re: [PATCH 2/2] drm/probe_helper: warning on poll_enabled for issue
 catching
In-Reply-To: <20230308121718.2586933-1-guchun.chen@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230308121718.2586933-1-guchun.chen@amd.com>
Date: Wed, 08 Mar 2023 15:06:57 +0200
Message-ID: <87o7p3bde6.fsf@intel.com>
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
Cc: Guchun Chen <guchun.chen@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 08 Mar 2023, Guchun Chen <guchun.chen@amd.com> wrote:
> In order to catch issues in other drivers to ensure proper call
> sequence of polling function.
>
> Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/2411
> Fixes: a4e771729a51("drm/probe_helper: sort out poll_running vs poll_enabled")

How does an additional warning "fix" anything?

> Reported-by: Bert Karwatzki <spasswolf@web.de>
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Guchun Chen <guchun.chen@amd.com>
> ---
>  drivers/gpu/drm/drm_probe_helper.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
> index 8127be134c39..85e0e80d4a52 100644
> --- a/drivers/gpu/drm/drm_probe_helper.c
> +++ b/drivers/gpu/drm/drm_probe_helper.c
> @@ -852,6 +852,8 @@ EXPORT_SYMBOL(drm_kms_helper_is_poll_worker);
>   */
>  void drm_kms_helper_poll_disable(struct drm_device *dev)
>  {
> +	WARN_ON(!dev->mode_config.poll_enabled);

drm_WARN_ON()  please.

> +
>  	if (dev->mode_config.poll_running)
>  		drm_kms_helper_disable_hpd(dev);

-- 
Jani Nikula, Intel Open Source Graphics Center
