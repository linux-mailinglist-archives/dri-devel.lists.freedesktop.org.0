Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8019F9640A4
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 11:55:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0314010E2E4;
	Thu, 29 Aug 2024 09:55:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PSa0FUez";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46D7E10E336
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 09:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724925307; x=1756461307;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Iu4dUJeHDh1emR+lvakyn8JXYAMyxOrp4dQKOj4vxaA=;
 b=PSa0FUezj9FwSUtri2oQOUStBrSCcgOCTMFeLIIIHtazJSF7KDvnklGV
 MH1QhTNR93w3iqv3u8H8TnJj6lqK4gvFmRf3cEVKC4WS3ay0sa24KB2I1
 zPkzduF6Bkh+E4Gasj/QE0pKYft+btyFe6m1gWWz3XURFnGRM4N/j9qcN
 +mu7sucuLMJoHlQaglCkdE0VuosES5GS/fc1rjNLXv2Y8Kd7TMU3Xrv9p
 /+3o1BjvaWXtkCwJJ6jnWmw4KNCC4+29mrw1aJHyGdQUFIXCdLGSdwDAJ
 OVw9In3Q+stM40+87Gvi9Gzk0ebHUfpsd1dxU50tCAtY8jCClSc0ABXev g==;
X-CSE-ConnectionGUID: uB2HMqxdTSaAl2xqkwtGGA==
X-CSE-MsgGUID: tL631cNDSEaGuwPgliFTfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="41008187"
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; d="scan'208";a="41008187"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 02:55:06 -0700
X-CSE-ConnectionGUID: NaCS/iGlSpiaAQa4eekL0A==
X-CSE-MsgGUID: z6108Q9rRcqo+PqpXvoQVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; d="scan'208";a="94323676"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.242])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 02:55:02 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm: panel-orientation-quirks: Make Lenovo Yoga Tab 3
 X90F DMI match less strict
In-Reply-To: <20240825132131.6643-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240825132131.6643-1-hdegoede@redhat.com>
Date: Thu, 29 Aug 2024 12:54:59 +0300
Message-ID: <87zfovwt58.fsf@intel.com>
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

On Sun, 25 Aug 2024, Hans de Goede <hdegoede@redhat.com> wrote:
> There are 2G and 4G RAM versions of the Lenovo Yoga Tab 3 X90F and it
> turns out that the 2G version has a DMI product name of
> "CHERRYVIEW D1 PLATFORM" where as the 4G version has
> "CHERRYVIEW C0 PLATFORM". The sys-vendor + product-version check are
> unique enough that the product-name check is not necessary.
>
> Drop the product-name check so that the existing DMI match for the 4G
> RAM version also matches the 2G RAM version.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/drm_panel_orientation_quirks.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> index c16c7678237e..c48471c09e2f 100644
> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> @@ -391,7 +391,6 @@ static const struct dmi_system_id orientation_data[] = {
>  	}, {	/* Lenovo Yoga Tab 3 X90F */
>  		.matches = {
>  		 DMI_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
> -		 DMI_MATCH(DMI_PRODUCT_NAME, "CHERRYVIEW D1 PLATFORM"),

DMI_MATCH uses strstr() internally (as opposed to DMI_EXACT_MATCH which
is a full strcmp()) so you could still have 

		DMI_MATCH(DMI_PRODUCT_NAME, "CHERRYVIEW"),

Up to you, and either way,

Acked-by: Jani Nikula <jani.nikula@intel.com>


>  		 DMI_MATCH(DMI_PRODUCT_VERSION, "Blade3-10A-001"),
>  		},
>  		.driver_data = (void *)&lcd1600x2560_rightside_up,

-- 
Jani Nikula, Intel
