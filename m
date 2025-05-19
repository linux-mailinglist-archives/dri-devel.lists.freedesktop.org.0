Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C43B6ABBA51
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 11:55:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 433CA10E012;
	Mon, 19 May 2025 09:55:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RsVkv8QR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20A7610E012
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 09:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747648518; x=1779184518;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=x962P5jjhfK06VJoGYfXsOxsJ0DuLlZs6GC+F00vyj4=;
 b=RsVkv8QRW5aplchtk2FdsFMEIJwnD2ZOQ1hHRn6L1OzgFYLrJWSU2PDD
 UBf3XmvQCXl9YFGyD4hr0YUw2EUfepPKlTnFPmwTyCyi9Q2wtrMYLzwEy
 LJoUd+Jij9CFH0c2LbapBzgJHtrMRW65nRMcK7MyQ12V5mOQyjnswZB8I
 LrIp43lDKwALaRo/H44qI8XoEq5JO3K6wC8er0wjfWv0FpGSNCuTxMTHO
 4mhw+ssxm/SX34pkee9RHkapgm4fST+0BMt/GkEi3RiCqfC//zu5QU8+l
 etU3jL76e3glMpSorUXH+6QhoQ+0j7oUKMo3GEwU1MlDM7VIsK9mesIuU A==;
X-CSE-ConnectionGUID: ft7l6lxeT3mLnsEz9nsOHg==
X-CSE-MsgGUID: +9egL/S+TlKQPsIct0iOoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="49240587"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="49240587"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 02:55:18 -0700
X-CSE-ConnectionGUID: vb+tJycCR4iZf8sl7kTbtg==
X-CSE-MsgGUID: jeWBbJfySr2WrSbuB9lHMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="144089755"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.201])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 02:55:14 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "feijuan.li" <feijuan.li@samsung.com>, jingoohan1@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: feijuan.li@samsung.com, hongfei.tang@samsung.com,
 minggui.yan@samsung.com, qilin.wang@samsung.com
Subject: Re: [PATCH v3] drm/edid: fixed the bug that hdr metadata was not reset
In-Reply-To: <878qmzio16.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CGME20250514063420epcas5p2bdd64000965a5ceffa196f123db8fb2e@epcas5p2.samsung.com>
 <20250514063511.4151780-1-feijuan.li@samsung.com>
 <878qmzio16.fsf@intel.com>
Date: Mon, 19 May 2025 12:55:12 +0300
Message-ID: <87r00kvsan.fsf@intel.com>
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

On Wed, 14 May 2025, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Wed, 14 May 2025, "feijuan.li" <feijuan.li@samsung.com> wrote:
>> When DP connected to a device with HDR capability,
>> the hdr structure was filled.Then connected to another
>> sink device without hdr capability, but the hdr info
>> still exist.
>>
>> Signed-off-by: feijuan.li <feijuan.li@samsung.com>
>
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>

And pushed to drm-misc-fixes, with

Fixes: e85959d6cbe0 ("drm: Parse HDR metadata info from EDID")
Cc: <stable@vger.kernel.org> # v5.3+

Thanks for the patch.

BR,
Jani.


>
>
>> ---
>>  drivers/gpu/drm/drm_edid.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>> index 13bc4c290b17..9edb3247c767 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -6596,6 +6596,7 @@ static void drm_reset_display_info(struct drm_connector *connector)
>>  	info->has_hdmi_infoframe = false;
>>  	info->rgb_quant_range_selectable = false;
>>  	memset(&info->hdmi, 0, sizeof(info->hdmi));
>> +	memset(&connector->hdr_sink_metadata, 0, sizeof(connector->hdr_sink_metadata));
>>  
>>  	info->edid_hdmi_rgb444_dc_modes = 0;
>>  	info->edid_hdmi_ycbcr444_dc_modes = 0;

-- 
Jani Nikula, Intel
