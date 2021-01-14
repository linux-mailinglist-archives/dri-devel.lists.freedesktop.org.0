Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D0F2F5DE5
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 10:42:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B6076E156;
	Thu, 14 Jan 2021 09:42:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DD536E156;
 Thu, 14 Jan 2021 09:42:40 +0000 (UTC)
IronPort-SDR: lpBmttdj9djf6jDvo9GbgiMc+PporoMrVJajJBkPv7q6cSg1x7EuYmYhLNMzZysaKvCa3XDjSt
 Gebf//CqBNUA==
X-IronPort-AV: E=McAfee;i="6000,8403,9863"; a="178489308"
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; d="scan'208";a="178489308"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2021 01:42:39 -0800
IronPort-SDR: 7RuN2PziES+xPYKfQmNQ7mBycANnqj+LxNRtE5BfOTGKefHp2Goz48KfttoDydmWpEHp6d3Pt9
 shhhUKwfYSgg==
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; d="scan'208";a="382210357"
Received: from dforourk-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.213.254.146])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2021 01:42:35 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Yang Li <abaci-bugfix@linux.alibaba.com>, airlied@linux.ie
Subject: Re: [PATCH] drm/amd/display: Simplify bool comparison
In-Reply-To: <1610530365-46152-1-git-send-email-abaci-bugfix@linux.alibaba.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <1610530365-46152-1-git-send-email-abaci-bugfix@linux.alibaba.com>
Date: Thu, 14 Jan 2021 11:42:32 +0200
Message-ID: <871renrh13.fsf@intel.com>
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
Cc: sunpeng.li@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yang Li <abaci-bugfix@linux.alibaba.com>,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 13 Jan 2021, Yang Li <abaci-bugfix@linux.alibaba.com> wrote:
> Fix the following coccicheck warning:
> ./drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_cm.c:580:23-31:
> WARNING: Comparison to bool
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <abaci-bugfix@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_cm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_cm.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_cm.c
> index 4d3f7d5..904c2d2 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_cm.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_cm.c
> @@ -577,7 +577,7 @@ void dpp1_power_on_degamma_lut(
>  	struct dcn10_dpp *dpp = TO_DCN10_DPP(dpp_base);
>  
>  	REG_SET(CM_MEM_PWR_CTRL, 0,
> -			SHARED_MEM_PWR_DIS, power_on == true ? 0:1);
> +			SHARED_MEM_PWR_DIS, power_on ? 0:1);

Not my driver, but this is as simple as it gets:

+			SHARED_MEM_PWR_DIS, !power_on);


>  
>  }

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
