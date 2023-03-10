Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B845B6B4F5C
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 18:48:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA82E10E30F;
	Fri, 10 Mar 2023 17:48:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0D0710E30D;
 Fri, 10 Mar 2023 17:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678470490; x=1710006490;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=bee2h7Uihe+QYwTZwZ+fnOq+GIrmw0Sej7yiPuEmRfI=;
 b=DEQdOWDT5t9xqT/oB8lzYNTu9PGIDrFNRP2NnBtDjpgKx/kl3wxbq8vt
 RoRfguR/+GHquA3WIkrybjNzk9E/c+CZjLESrWl2WL9kEaAxsGkYKJ0bd
 7iMI3e+MgZwpFasD9xL9r1ALS4AN+0G44cNj5EZL8A8YwYuBKowhQcX7l
 C59NDdN3tlzyzuThOsuYffqZNGRWipxeiSeLAdvErcNooTdQMuuEh3Hsn
 ygui05fGZ/So5y65K+LCBoN1aBKr48pFJ0ab4UE31s1PZ6pPI6pS00Q6c
 h4B2nmEbtBapzNRRO3FsSYu048vyi2eY6hIOsYJDRv0WVaCiuMeC3GhuC A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="401648389"
X-IronPort-AV: E=Sophos;i="5.98,250,1673942400"; d="scan'208";a="401648389"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 09:48:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="766910021"
X-IronPort-AV: E=Sophos;i="5.98,250,1673942400"; d="scan'208";a="766910021"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by FMSMGA003.fm.intel.com with SMTP; 10 Mar 2023 09:48:05 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 10 Mar 2023 19:48:04 +0200
Date: Fri, 10 Mar 2023 19:48:04 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Hamza Mahfooz <hamza.mahfooz@amd.com>
Subject: Re: [PATCH] drm/amd/display: use a more accurate check in
 dm_helpers_dp_read_dpcd()
Message-ID: <ZAttVGN/VdrfkH3y@intel.com>
References: <20230309213027.256243-1-hamza.mahfooz@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230309213027.256243-1-hamza.mahfooz@amd.com>
X-Patchwork-Hint: comment
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
Cc: Ian Chen <ian.chen@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Wayne Lin <Wayne.Lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Sung Joon Kim <sungjoon.kim@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 09, 2023 at 04:30:27PM -0500, Hamza Mahfooz wrote:
> We should be checking if drm_dp_dpcd_read() returns the size that we are
> asking it to read instead of just checking if it is greater than zero.
> Also, we should WARN_ON() here since this condition is only ever met, if
> there is an issue worth investigating. So, compare the return value of
> drm_dp_dpcd_read() to size and WARN_ON() if they aren't equal.
> 
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index 8d598b322e5b..ed2ed7b1d869 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -511,8 +511,8 @@ bool dm_helpers_dp_read_dpcd(
>  		return false;
>  	}
>  
> -	return drm_dp_dpcd_read(&aconnector->dm_dp_aux.aux, address,
> -			data, size) > 0;
> +	return !WARN_ON(drm_dp_dpcd_read(&aconnector->dm_dp_aux.aux, address,
> +					 data, size) != size);

Just FYI there are devices out there that violate the DP spec and reads
from specific DPCD registers simply fail instead of returning the
expected 0.

>  }
>  
>  bool dm_helpers_dp_write_dpcd(
> -- 
> 2.39.2

-- 
Ville Syrjälä
Intel
