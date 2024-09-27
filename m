Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0350898815D
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 11:30:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C4DE10ECA1;
	Fri, 27 Sep 2024 09:30:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bM4oVK78";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B923210ECA1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 09:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727429414; x=1758965414;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=00Pwsx+kVXzuc4/T3TQVyJMv0fEySCE14RsHuO886bY=;
 b=bM4oVK78HU9q/UymkIbcka+01a8zZtwlpWYNLp2PTii2gV4eSfwv8KTd
 /HN3Nd0OMLediw3D0HDpF1yHNIFRYaxhKDlDvMFyPE1Ul4ETlXzJ9duvu
 nnSrvhyYtGwMGgqbEDCWoh6vvenwfPN+8mWRzRh0EBo/sCmbTWt/4ZO3Z
 K1Qbdc55bkoM8r80syyqnkuGmnXwDOGgIKMjpVHi/mBQWHA3xOlCjn7FR
 hDu1K3h1XryCtJmD1+uz/AwP/lbmojTzqrLRMDILImglHGS/60JXQtL+K
 I2O1j4SXw4uMgNAMuJ1TkzPG3z2PeKqiB07Br9jwo3ThYgCf9GvQSq59r w==;
X-CSE-ConnectionGUID: Py9bhR9TRv6x48nhIDc3Gw==
X-CSE-MsgGUID: iktJe5ESQQm0FY+cK9UMHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="30358607"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="30358607"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 02:30:14 -0700
X-CSE-ConnectionGUID: KHqLTageSy+f4GLpwc7knQ==
X-CSE-MsgGUID: zQAyjABYRzGb5rtcaao0+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="77259761"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.211])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 02:30:10 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Andi Kleen <ak@linux.intel.com>, maarten.lankhorst@linux.intel.com
Cc: mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org, Andi Kleen
 <ak@linux.intel.com>
Subject: Re: [PATCH v3] drm: Print bad EDID notices less often
In-Reply-To: <20240926180150.2674763-1-ak@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240926180150.2674763-1-ak@linux.intel.com>
Date: Fri, 27 Sep 2024 12:30:04 +0300
Message-ID: <87frplzboj.fsf@intel.com>
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

Honestly I think merging this would be counter-productive to addressing
the issue properly.

Please just give me the chance to look into it.

Is your zero EDID block the base block or an extension block?

BR,
Jani.


>
> Signed-off-by: Andi Kleen <ak@linux.intel.com>
>
> ---
>
> v2: Use bad_edid_count instead of _once.
> v3: Move rate limit logic into dedicated wrapper.
> ---
>  drivers/gpu/drm/drm_edid.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 855beafb76ff..64d41dd605f1 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -1949,6 +1949,18 @@ static void edid_block_status_print(enum edid_block_status status,
>  	}
>  }
>  
> +static void edid_block_status_print_rl(struct drm_connector *connector,
> +				    enum edid_block_status status,
> +				    const struct edid *block,
> +				    int block_num)
> +{
> +	if (status != EDID_BLOCK_OK &&
> +		!connector->bad_edid_counter++ &&
> +		!drm_debug_enabled(DRM_UT_KMS))
> +		return;
> +	edid_block_status_print(status, block, block_num);
> +}
> +
>  static void edid_block_dump(const char *level, const void *block, int block_num)
>  {
>  	enum edid_block_status status;
> @@ -2375,7 +2387,7 @@ static struct edid *_drm_do_get_edid(struct drm_connector *connector,
>  
>  	status = edid_block_read(edid, 0, read_block, context);
>  
> -	edid_block_status_print(status, edid, 0);
> +	edid_block_status_print_rl(connector, status, edid, 0);
>  
>  	if (status == EDID_BLOCK_READ_FAIL)
>  		goto fail;
> @@ -2409,7 +2421,7 @@ static struct edid *_drm_do_get_edid(struct drm_connector *connector,
>  
>  		status = edid_block_read(block, i, read_block, context);
>  
> -		edid_block_status_print(status, block, i);
> +		edid_block_status_print_rl(connector, status, block, i);
>  
>  		if (!edid_block_status_valid(status, edid_block_tag(block))) {
>  			if (status == EDID_BLOCK_READ_FAIL)

-- 
Jani Nikula, Intel
