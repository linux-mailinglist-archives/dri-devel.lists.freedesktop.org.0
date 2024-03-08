Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA5C875F13
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 09:07:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C1A6113383;
	Fri,  8 Mar 2024 08:07:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A+FqdOrx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDBC7113351
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Mar 2024 08:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709885240; x=1741421240;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=jDdOt/2/1csh8uzSIdh6Wlj1K1r1Sr6v5MZdPU3LtjA=;
 b=A+FqdOrxY5HZwlrQ00xB4Y5qSoZQYgGRpnyn5Vv9Ia0c7oZM77iWp1ZB
 vPdqrraL8RCYgG+6HIhlO1R6G4vK+UqmMAa/DcBEO+aqSiXWn/T4tZQde
 LJjxVpILZoe/UHLz8OOBp77wJpJjYOS8KwzgforkTZtMcQckBJFeQURRy
 55am00vEzxmHw8KwWMilErjIGFOtrnqLj4qSOQcvqlkvwMc3RG6KlKts7
 QiAqLX3cJHlHocHlzgAnNftwcy5s4Ylp5b8PS3E05gu4zgYWKTzkiJO/3
 QYIazrrFmp0k4STbstrCyPzZdloATyo22X/6ABy70Zjqc2CWmLnM6magC w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="7541021"
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="7541021"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 00:07:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; d="scan'208";a="33538663"
Received: from tofferse-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.33.212])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 00:07:15 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Douglas Anderson <dianders@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/5] drm/edid: Add a function to match EDID with
 identity
In-Reply-To: <20240307230653.1807557-3-hsinyi@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240307230653.1807557-1-hsinyi@chromium.org>
 <20240307230653.1807557-3-hsinyi@chromium.org>
Date: Fri, 08 Mar 2024 10:07:11 +0200
Message-ID: <87jzmduoy8.fsf@intel.com>
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

On Thu, 07 Mar 2024, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> Create a type drm_edid_ident as the identity of an EDID. Currently it
> contains panel id and monitor name.
>
> Create a function that can match a given EDID and an identity:
> 1. Reject if the panel id doesn't match.
> 2. If name is not null in identity, try to match it in the detailed timing
>    blocks. Note that some panel vendors put the monitor name after
>    EDID_DETAIL_MONITOR_STRING.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

The series seems good to go. Thanks Hsin-Yi and Douglas for the
constructive collaboration! I believe the end result is better now.

Thanks,
Jani.

-- 
Jani Nikula, Intel
