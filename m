Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F09CA25AB7
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 14:21:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3574F10E428;
	Mon,  3 Feb 2025 13:21:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I5wtFJe8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CCFC10E428
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 13:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738588891; x=1770124891;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=qNUiPO2yHgXnsW5NYL968qRQlYZ+KbplWMOxfDHT4Pg=;
 b=I5wtFJe8qlk3/6b46f5FAvFb2kCCnPKz4Aw7vuJZJsjlYbO1q4qe64R5
 YPVGcRIM/7NfQi6suxh0WsQeN2T19Hk2L7q+IeBYxwk8YjUaHJWFsqOVA
 0olESev/VkOuhWWgChgqNcWDG6IucN8loxzIVMs+UEkrOP400H9EDefgM
 nVEsnvfd7pPD5praskPLUr9QVPXSjljoeJGycjY0FCFbvHQ5YdJxF7ofw
 LQGYAR6fnG8A4DT3aIBFDJ7y8HKb09EomxT1XkarSfAerdzwI05eFwxiI
 G787v80EyalZEBT+pQI8A2PH/TFuH1YyGH0mMC06jDGDhTvrblkk+0Iik w==;
X-CSE-ConnectionGUID: h8iEtveIRPKMnXSazaR3VQ==
X-CSE-MsgGUID: nJ1CQnTcRB2NWyNGbk8lHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="56616567"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="56616567"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 05:21:31 -0800
X-CSE-ConnectionGUID: nlVN1aI0QFSUS/IyFmEeRg==
X-CSE-MsgGUID: 4btVPqeHRnaIw1rKsBA+MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="110855444"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.71])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 05:21:26 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Haoyu Li <lihaoyu499@gmail.com>, Lee Jones <lee@kernel.org>, Daniel
 Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>
Cc: Helge Deller <deller@gmx.de>, Rob Herring <robh@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, chenyuan0y@gmail.com,
 zichenxie0106@gmail.com, Haoyu Li <lihaoyu499@gmail.com>,
 stable@vger.kernel.org
Subject: Re: [PATCH] drivers: video: backlight: Fix NULL Pointer Dereference
 in backlight_device_register()
In-Reply-To: <20250130145228.96679-1-lihaoyu499@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250130145228.96679-1-lihaoyu499@gmail.com>
Date: Mon, 03 Feb 2025 15:21:23 +0200
Message-ID: <87ldun6u5o.fsf@intel.com>
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

On Thu, 30 Jan 2025, Haoyu Li <lihaoyu499@gmail.com> wrote:
> In the function "wled_probe", the "wled->name" is dynamically allocated
> (wled_probe -> wled_configure -> devm_kasprintf), which is possible
> to be null.
>
> In the call trace: wled_probe -> devm_backlight_device_register
> -> backlight_device_register, this "name" variable is directly
> dereferenced without checking. We add a null-check statement.
>
> Fixes: f86b77583d88 ("backlight: pm8941: Convert to using %pOFn instead of device_node.name")
> Signed-off-by: Haoyu Li <lihaoyu499@gmail.com>
> Cc: stable@vger.kernel.org

IMO whoever allocates should be responsible for checking NULL instead of
passing NULL around and expecting everyone check their input for NULL.

BR,
Jani.


> ---
>  drivers/video/backlight/backlight.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
> index f699e5827ccb..b21670bd86de 100644
> --- a/drivers/video/backlight/backlight.c
> +++ b/drivers/video/backlight/backlight.c
> @@ -414,6 +414,8 @@ struct backlight_device *backlight_device_register(const char *name,
>  	struct backlight_device *new_bd;
>  	int rc;
>  
> +	if (!name)
> +		return ERR_PTR(-EINVAL);
>  	pr_debug("backlight_device_register: name=%s\n", name);
>  
>  	new_bd = kzalloc(sizeof(struct backlight_device), GFP_KERNEL);

-- 
Jani Nikula, Intel
