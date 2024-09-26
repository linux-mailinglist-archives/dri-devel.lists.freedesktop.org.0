Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D89598782B
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 19:10:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0732710E037;
	Thu, 26 Sep 2024 17:10:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MyNqT9y7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3943C10E037
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 17:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727370633; x=1758906633;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=XBzcq+RIIiDNjt32o8hmviiKNRy2MGJmRZ7su2d1pmw=;
 b=MyNqT9y7/fj5vUfXwtppPUjAKg8W+Bj5jG7GDzJdK1YD0aOhtJp8ZGf/
 5XXmdaU/rLGnbYoUX7yWJWkJbW/wMRjZEs9Lv/4OncfS+YguxmORmdeDT
 mXbGisapyuUemVFzy4ws8D5+wT5lbzRUHYU6Gzt9j64b6V4Qnh1U4hK5s
 OwAgNnTAdvJyTE4SiRB4sa7DJa0JBZwciiyMDQxU1frMAUXWbw4HuqiPe
 /AYtcmXIXY77x2qYVLyL7yWxajrH9ITyktKXjAStYk+kaK8aqY7O0DWyQ
 i+7jpTebPhxjeDf9S84i6Mtbm1hZVLEvpriFW6bXIKkQPdulmj5EL1LSQ A==;
X-CSE-ConnectionGUID: 77t92QVIQIGsFsfRuyOOFg==
X-CSE-MsgGUID: UwttL74UR8KjxeJfe/SsPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="44003228"
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; d="scan'208";a="44003228"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 10:10:33 -0700
X-CSE-ConnectionGUID: WMpbLxBpTp6j1C/coz+bjw==
X-CSE-MsgGUID: thkxDqxUR2uRNE0YPctDng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; d="scan'208";a="103019646"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.160])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 10:10:30 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Andi Kleen <ak@linux.intel.com>, maarten.lankhorst@linux.intel.com
Cc: mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org, Andi Kleen
 <ak@linux.intel.com>
Subject: Re: [PATCH v2] drm: Print bad EDID notices less often
In-Reply-To: <20240926164202.2668922-1-ak@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240926164202.2668922-1-ak@linux.intel.com>
Date: Thu, 26 Sep 2024 20:10:26 +0300
Message-ID: <871q161gu5.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 26 Sep 2024, Andi Kleen <ak@linux.intel.com> wrote:
> I have an old monitor that reports a zero EDID block, which results in a
> warning message. This happens on every screen save cycle, and maybe in
> some other situations, and over time the whole kernel log gets filled
> with these redundant messages.
>
> Make most of these prints conditional on bad_edid_count like other verbose EDID
> messages.
>
> Signed-off-by: Andi Kleen <ak@linux.intel.com>
>
> ---
>
> v2: Use bad_edid_count instead of _once.
> ---
>  drivers/gpu/drm/drm_edid.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 855beafb76ff..52c8f08152fd 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -1902,10 +1902,17 @@ static bool edid_block_valid(const void *block, bool base)
>  				       edid_block_tag(block));
>  }
>  
> -static void edid_block_status_print(enum edid_block_status status,
> +static void edid_block_status_print(struct drm_connector *connector,
> +				    enum edid_block_status status,
>  				    const struct edid *block,
>  				    int block_num)
>  {
> +	if (status != EDID_BLOCK_OK &&
> +		connector &&
> +		!connector->bad_edid_counter++ &&

The status print has no business changing anything. Besides, this
function gets called per EDID block, not per EDID.

> +		!drm_debug_enabled(DRM_UT_KMS))

If we did that, we might just as well change the pr_* prints to
drm_dbg_kms() and be done with it.

BR,
Jani.

> +		return;
> +
>  	switch (status) {
>  	case EDID_BLOCK_OK:
>  		break;
> @@ -2004,7 +2011,7 @@ static bool drm_edid_block_valid(void *_block, int block_num, bool print_bad_edi
>  			*edid_corrupt = true;
>  	}
>  
> -	edid_block_status_print(status, block, block_num);
> +	edid_block_status_print(NULL, status, block, block_num);
>  
>  	/* Determine whether we can use this block with this status. */
>  	valid = edid_block_status_valid(status, edid_block_tag(block));
> @@ -2375,7 +2382,7 @@ static struct edid *_drm_do_get_edid(struct drm_connector *connector,
>  
>  	status = edid_block_read(edid, 0, read_block, context);
>  
> -	edid_block_status_print(status, edid, 0);
> +	edid_block_status_print(connector, status, edid, 0);
>  
>  	if (status == EDID_BLOCK_READ_FAIL)
>  		goto fail;
> @@ -2409,7 +2416,7 @@ static struct edid *_drm_do_get_edid(struct drm_connector *connector,
>  
>  		status = edid_block_read(block, i, read_block, context);
>  
> -		edid_block_status_print(status, block, i);
> +		edid_block_status_print(connector, status, block, i);
>  
>  		if (!edid_block_status_valid(status, edid_block_tag(block))) {
>  			if (status == EDID_BLOCK_READ_FAIL)
> @@ -2842,7 +2849,7 @@ const struct drm_edid *drm_edid_read_base_block(struct i2c_adapter *adapter)
>  
>  	status = edid_block_read(base_block, 0, drm_do_probe_ddc_edid, adapter);
>  
> -	edid_block_status_print(status, base_block, 0);
> +	edid_block_status_print(NULL, status, base_block, 0);
>  
>  	if (!edid_block_status_valid(status, edid_block_tag(base_block))) {
>  		edid_block_dump(KERN_NOTICE, base_block, 0);

-- 
Jani Nikula, Intel
