Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF6D6B3EA2
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 13:04:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10E8310E05F;
	Fri, 10 Mar 2023 12:04:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AB7210E002;
 Fri, 10 Mar 2023 12:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678449884; x=1709985884;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=3PdppEc6oq0RQ3vaPpjd+qrYqHZTvxoL5rKOBXVnBzA=;
 b=BF8wDBh0dgl2ly6k8KNXhwfsjofZS1EBlUf08pwkXxPIx3QwXMYRGlg9
 dMRCQ7CLwT0MGOCHc4oaGtsmXUFbQD2Akoi05DCHoctRwSmNgFxv8u7RF
 gVtL06ZGva2BAGM5FpwIn6PL1SqUjQAJvwF4NbsX4kKrMTj3g++OHY8fW
 dGPymVIkci0NuwxXoorsXR5V/LPZ++gBrhreXPF51SfbnaVTgbEN+5nHH
 X4q0ALxOF1QIktisewUL5pdMkrIthvgndpVB3qV8mO24GQsln2NQKqM2d
 mTZeHGh6pPC/jiHGdwMrieTczD/o4ycruyCNwrX5fnaArVXavVP9nnnt+ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="335409793"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; d="scan'208";a="335409793"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 04:04:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="677787670"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; d="scan'208";a="677787670"
Received: from klausuhl-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.33.190])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 04:04:39 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Guchun Chen <guchun.chen@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 hawking.zhang@amd.com, dmitry.baryshkov@linaro.org, spasswolf@web.de,
 mike@fireburn.co.uk
Subject: Re: [PATCH v3 2/2] drm/probe_helper: warning on poll_enabled for
 issue catching
In-Reply-To: <20230310010136.2810776-1-guchun.chen@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230310010136.2810776-1-guchun.chen@amd.com>
Date: Fri, 10 Mar 2023 14:04:36 +0200
Message-ID: <87jzzo95ij.fsf@intel.com>
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

On Fri, 10 Mar 2023, Guchun Chen <guchun.chen@amd.com> wrote:
> In order to catch issues in other drivers to ensure proper call
> sequence of polling function.
>
> v2: drop Fixes tag in commit message
>
> Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/2411
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

Please address all previous review comments [1].

BR,
Jani.


[1] https://lore.kernel.org/r/87o7p3bde6.fsf@intel.com


> +
>  	if (dev->mode_config.poll_running)
>  		drm_kms_helper_disable_hpd(dev);

-- 
Jani Nikula, Intel Open Source Graphics Center
