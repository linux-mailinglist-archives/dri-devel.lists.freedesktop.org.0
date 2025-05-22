Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1796AC11CA
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 19:04:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A1D210E8A6;
	Thu, 22 May 2025 17:04:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fnuKmlBN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 787BD10E8A6
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 17:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747933466; x=1779469466;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=e3ftInGyVIWnRu4gytvqQe06MnQuaqne1cL6BjQ6W4M=;
 b=fnuKmlBNbbEDw2A1IC92jfQTzDh6H91gDbGw8g9KWrRcLjueveVGqanw
 jRFtQIsERaHPCBfAwLj53ey/tXeB/FCLokbwxcae7unne4GY1JuZ+NRtI
 eRpr6QKuscSmUPEOQvLDJ1TOIGclhylaom86RLidgNw9sUn16H1399szj
 cByC+JQ6hWY5amKsy+2jcUydYsZ3Wbp3OBfax+zjE4wkDqmSX+lynFY35
 k6xrgsSmCMnboPYRpVNCj8Wp8gy0GRYHkgqJrx2RPx/cxQkJAKZ5rd1DC
 7YqRT0zdQxIQSO+kKpG6D4IHa0w1VXBibRiz+ldjaIjkFHatAxDZ+HnhQ g==;
X-CSE-ConnectionGUID: HrNzrY86RzGDfqbceXxrgQ==
X-CSE-MsgGUID: ttFcIcquTeuut5T3UWm8hQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="67389336"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="67389336"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 10:04:26 -0700
X-CSE-ConnectionGUID: wVk/EfTuSqK1y+vGZ1fvyA==
X-CSE-MsgGUID: 0D4ufLtSQj+oBr1xcz23Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="177829396"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.1])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 10:04:25 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH] drm/panel: abstract of_panel_find()
In-Reply-To: <bomzckpaxqthpwx4wqrxiywkz5qnoqoob4jfiguqag2gwwakfb@c3ek6rvkwkdm>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250522100036.2529624-1-jani.nikula@intel.com>
 <bomzckpaxqthpwx4wqrxiywkz5qnoqoob4jfiguqag2gwwakfb@c3ek6rvkwkdm>
Date: Thu, 22 May 2025 20:04:22 +0300
Message-ID: <87wma8shk9.fsf@intel.com>
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

On Thu, 22 May 2025, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> On Thu, May 22, 2025 at 01:00:36PM +0300, Jani Nikula wrote:
>> Add a helper to wrap OF-specific calls in drm_panel_add_follower() in
>> preparation for adding an ACPI equivalent in the future. No functional
>> changes.
>> 
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/drm_panel.c | 23 ++++++++++++++++-------
>>  1 file changed, 16 insertions(+), 7 deletions(-)
>> 
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Thanks, pushed to drm-misc-next.

BR,
Jani.

-- 
Jani Nikula, Intel
