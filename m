Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC2B1DAAE8
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 08:46:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78AEE6E575;
	Wed, 20 May 2020 06:46:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B93726E119;
 Wed, 20 May 2020 06:46:07 +0000 (UTC)
IronPort-SDR: 30OS06+JXioAvNKnoKlE7e1VEHwvFlGR5FoxKcRb3ad54jbB2JGG1ahjX7Un2O+ZLCply7yiYY
 NfkH8Vtk/CWQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2020 23:46:07 -0700
IronPort-SDR: Aj5KZkBdL0g/mI4hNPJ861qXldplmDAVL/rJY4F8EgcZQTZmTFso/jd/dMA9YTSqqc82eDi72q
 EhjgiDeo4hAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,413,1583222400"; d="scan'208";a="253589451"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.99.66.154])
 by fmsmga007.fm.intel.com with ESMTP; 19 May 2020 23:46:04 -0700
Date: Wed, 20 May 2020 12:16:02 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH] drm/i915/hdcp: Add additional R0' wait
Message-ID: <20200520064602.GA20133@intel.com>
References: <20200519221621.19931-1-sean@poorly.run>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200519221621.19931-1-sean@poorly.run>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: intel-gfx@lists.freedesktop.org, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-05-19 at 18:16:21 -0400, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> We're seeing some R0' mismatches in the field, particularly with
I think you want to say Vprime verification? delay is added in between
the retry for vprime verfication.

-Ram
> repeaters. I'm guessing the (already lenient) 300ms wait time isn't
> enough for some setups. So add an additional wait when R0' is
> mismatched.
> 
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> ---
>  drivers/gpu/drm/i915/display/intel_hdcp.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
> index 2cbc4619b4ce..924a717a4fa4 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> @@ -592,6 +592,9 @@ int intel_hdcp_auth_downstream(struct intel_connector *connector)
>  						  bstatus);
>  		if (!ret)
>  			break;
> +
> +		/* Maybe the sink is lazy, give it some more time */
> +		usleep_range(10000, 50000);
>  	}
>  
>  	if (i == tries) {
> -- 
> Sean Paul, Software Engineer, Google / Chromium OS
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
