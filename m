Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 232DE8B9684
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 10:33:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58C4310F09F;
	Thu,  2 May 2024 08:33:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lXSlvT5k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D72C710F09F
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 08:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714638797; x=1746174797;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0Gpee/NqFKNgoGOPbM0o0bCoRxmPnYe9lCHdjc5Qrws=;
 b=lXSlvT5kP0+GJ3P2LpY/zTmP/ClVRjoPyBhIIkgDmtMVQxIYt/KH3J0M
 /G4cZYsnxaOD2fD9jzhIHk9YwxDf6cXElk82rkjvvS9wwcfzwpZFK0c5V
 7VMYCriUTN24emaYJATh1blRQbGeeSysooylrEyqxGjIMfxZgShVBcYMu
 DVRSNAkAOqFHlXdq2VBuduGJ5PMnQ6cD7OwscC+crl3zDv9GT3kI+2MQY
 T7HCAqiNecBB00mpyQuT1N0h6G/U7tUSEr/bsxW4WxA++hccUIL72hB3d
 mBSx2GQ+qAWM1AK4l0n4aDSm+BdaSXwd7EkLqTJkQGwzeTee+KZJJRQIJ w==;
X-CSE-ConnectionGUID: bP62aP1pQWOkREwnPe3VkA==
X-CSE-MsgGUID: AveoBLmmSlyPvOY/csq0HA==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="35784272"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="35784272"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 01:33:16 -0700
X-CSE-ConnectionGUID: 4GKmb5v5RWmKohTBcarF8w==
X-CSE-MsgGUID: qyXn1F0WTBW3Urdr3qJUjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="31532997"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 01:33:13 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1s2RsL-00000003FHO-466P; Thu, 02 May 2024 11:33:09 +0300
Date: Thu, 2 May 2024 11:33:09 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Maxime Ripard <mripard@kernel.org>, Sui Jingfeng <sui.jingfeng@linux.dev>,
 Randy Dunlap <rdunlap@infradead.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [v1,1/3] drm/panel: ili9341: Correct use of device property APIs
Message-ID: <ZjNPxU_JJX_3o6-0@smile.fi.intel.com>
References: <20240425142706.2440113-2-andriy.shevchenko@linux.intel.com>
 <c2d41916-0b6c-43b5-98eb-514eb0511f84@linux.dev>
 <ZiqqiAztCaiAgI8e@smile.fi.intel.com>
 <2599705c-0a64-4742-b1d7-330e9fde6e7a@linux.dev>
 <20240426-married-augmented-mantis-ff7edd@penduick>
 <509b3822-dcf6-45eb-9516-ba8ff2cc4382@linux.dev>
 <20240429-bouncy-attentive-vole-9964f1@houat>
 <795bec5d-c7ba-4fc2-9be9-78c4063743d9@linux.dev>
 <20240430-unnatural-steel-spaniel-dbacef@houat>
 <75a89efb-f653-4185-a451-ef496dffd804@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <75a89efb-f653-4185-a451-ef496dffd804@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Thu, May 02, 2024 at 09:34:17AM +0200, Neil Armstrong wrote:
> On 30/04/2024 11:34, Maxime Ripard wrote:

...

> Anyway since the rant is finished I'll land the patches.

Thank you all for the review and discussion!

-- 
With Best Regards,
Andy Shevchenko


