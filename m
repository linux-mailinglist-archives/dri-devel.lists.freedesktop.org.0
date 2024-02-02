Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88859847186
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 14:58:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70B4110E2FA;
	Fri,  2 Feb 2024 13:58:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cRqdA5E5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 851C110E2FA
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 13:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706882331; x=1738418331;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=tgr1j4EzwrF68qG4xANL4ri8EhdYwVBBDxE0H3P5pG4=;
 b=cRqdA5E5VvMEvq1BnxJvqo/0+XuTeypYw/6SkWC7hI7l2UTAaBbEqHb/
 IDXLKDKRLwMWnpXWVWnFegXha6L6joMtRw0lipMT5HxBYGKLMh6vOIilT
 C8/Cx80WE/sZWP+nOt/UaDmUP26O7IVvgIZ1MKoYQBEo3VYvAXorKjdxT
 95iN4sTo+y7Q+U1L4z1Ca1K8ZIHCETy0FzjYABQhEtbIfrB2CR7imm1q5
 gceqk+txJYEXFZQ9iIcO3lQKg/DSJBi/fhlrpA55AusyVt/l6U9CYjwQH
 JaDkNylCFcgmFAfCfPXZQ0zNQUJLOiudZ0NeBpeDwQGVMDY6vTLHuXB0L w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="22645139"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; d="scan'208";a="22645139"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 05:58:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; d="scan'208";a="31182993"
Received: from mmermeza-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.59.198])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 05:58:43 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>, Jonathan Corbet
 <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>, Heiko =?utf-8?Q?St?=
 =?utf-8?Q?=C3=BCbner?=
 <heiko@sntech.de>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: Re: Re: [PATCH v5 15/44] drm/connector: hdmi: Compute bpc and
 format automatically
In-Reply-To: <vydlftxen23kd2odwegxbtpaz73sy2lgpv7nlynfjr3p2xvc2b@7lkdkaw3gp5q>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231207-kms-hdmi-connector-state-v5-0-6538e19d634d@kernel.org>
 <20231207-kms-hdmi-connector-state-v5-15-6538e19d634d@kernel.org>
 <CAPY8ntBQ+qY9441-rMzq_JAoYAaY_r+E-ADv7Wry0tJNTzKpwg@mail.gmail.com>
 <jlkoofv7nszj2uqmo2672yo4wjd3yjqarge2l2hxofixcchu6a@j72pa4iybitd>
 <CAPY8ntAmXyKtebMeM7rLtgRR+QwL1H+UCwSO=bLBQN4TsgwsDg@mail.gmail.com>
 <vydlftxen23kd2odwegxbtpaz73sy2lgpv7nlynfjr3p2xvc2b@7lkdkaw3gp5q>
Date: Fri, 02 Feb 2024 15:58:39 +0200
Message-ID: <87y1c3dl2o.fsf@intel.com>
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

On Thu, 01 Feb 2024, Maxime Ripard <mripard@kernel.org> wrote:
> We've discussed that on IRC today. I'm not sure there was a conclusion
> other than "well this doesn't seem right". I think we should at least
> provide different EDIDs depending on the connector type indeed, but
> there was also a few discussions that arose:
>
>   - Is it useful to have embedded EDIDs in the kernel at all, and could
>     we just get rid of it?
>
>   - Should we expose those EDIDs to userspace, and what happens to the
>     compositor when we do?
>
>   - The current way to generate those EDIDs isn't... optimal? Should we
>     get rid of that as well?
>
> Anyway, all of those issues have been here for a while so I don't really
> expect this series to fix that.

IMO the direction should be towards deprecating and removing the builtin
firmware EDIDs from the kernel instead of adding more or expanding on
them. They were only ever meant to be the immediate aid to get something
on screen so the user could provide a proper EDID via userspace.

BR,
Jani.


-- 
Jani Nikula, Intel
