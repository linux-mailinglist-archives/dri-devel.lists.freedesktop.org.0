Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFB484F739
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 15:25:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC66610EEDF;
	Fri,  9 Feb 2024 14:25:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZbUDVky5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 774A710EE76
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Feb 2024 14:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707488733; x=1739024733;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=SrZf75A1fwGhAa0JIttbmp/PWGFSXiErzRNHTtR/VCo=;
 b=ZbUDVky5mWCVaRpDRSIYtqfJaPQQFROs/SXvuA4+spUGngZqDs83I3Mg
 c2+FJqVgehyIbiTPDOcUI56Mf7asNcKvQzad9HERXuhX4kFQAozn7Cu2c
 G14VbeLvaKKLdUGKwocNQnJ6QnZm5aj+vPRWaNEeEkLYhzwrcFoRZd4/6
 MygnpqxYOQICr8DdewHyvyFxxa3KhUPklekl0SveYED0YRdZGewdsPRGt
 sOUSGDGJus96BdyoZhAh34rU/A7BgfGttgp9ZTcomIoGNotQtx+4SQQCa
 5ArdBewIaBUF0HCmSrKqrwWMqkAQxvNrn8UGj9igzTsauEkSd4aP0mAmk g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="1581329"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="1581329"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 06:25:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="1980765"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa010.jf.intel.com with ESMTP; 09 Feb 2024 06:25:25 -0800
Received: from [10.249.138.141] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.138.141])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id B791727BB4;
 Fri,  9 Feb 2024 14:25:23 +0000 (GMT)
Message-ID: <b00baf72-7ef5-4a10-97c0-a9b7eb5a86f3@intel.com>
Date: Fri, 9 Feb 2024 15:25:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/tests: mm: Convert to drm_dbg_printer
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@intel.com>, Luca Coelho <luciano.coelho@intel.com>
References: <20240209140818.106685-1-michal.winiarski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240209140818.106685-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 09.02.2024 15:08, Michał Winiarski wrote:
> Fix one of the tests in drm_mm that was not converted prior to
> drm_debug_printer removal, causing tests build failure.
> 
> Fixes: e154c4fc7bf2d ("drm: remove drm_debug_printer in favor of drm_dbg_printer")
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> ---
>  drivers/gpu/drm/tests/drm_mm_test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tests/drm_mm_test.c b/drivers/gpu/drm/tests/drm_mm_test.c
> index 1eb0c304f9607..3488d930e3a38 100644
> --- a/drivers/gpu/drm/tests/drm_mm_test.c
> +++ b/drivers/gpu/drm/tests/drm_mm_test.c
> @@ -188,7 +188,7 @@ static void drm_test_mm_init(struct kunit *test)
>  
>  static void drm_test_mm_debug(struct kunit *test)
>  {
> -	struct drm_printer p = drm_debug_printer(test->name);
> +	struct drm_printer p = drm_dbg_printer(NULL, DRM_UT_CORE, test->name);
>  	struct drm_mm mm;
>  	struct drm_mm_node nodes[2];
>  
