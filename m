Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 269C46C68C5
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 13:47:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A24710E1E4;
	Thu, 23 Mar 2023 12:47:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FE0310E1E4
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 12:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679575629; x=1711111629;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=30e+iacdeNDPi27w7ie3RbTMuGmuD+8WwfFs1tSEjl4=;
 b=jWjfCOBYmRWAdjKDtv5tnZ/SCAx3qehKa4plFgvMoXH55Pv2+Zh9YNDQ
 MH1P6Uv6GI54R31qVl9xTf7U+iUbJZAHikt8FUlrRtk+N8No5WOes9Ejz
 i9H+lXF3VkRc6p96TRP+inqXQa277jI2ipJt9NXqR2UE6pKjluorFMb2B
 yG8gHyFWRFQOwVRHZEznc0DJ8+gLkaMSTkekqoJOf47qNr+TcHrtR+AFE
 v2sahliIz3lBu4ycOa4bql9pLv3/mbx5bhGj+BNeMXv3z+oqAwxmeCix9
 543TthXeV9c8BDFAaG8iFph3zu5zOnA9nQH0Kvb1hY1PjF1iZfzaJjaZ7 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="341013534"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="341013534"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 05:47:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="682292594"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="682292594"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga002.jf.intel.com with ESMTP; 23 Mar 2023 05:46:58 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1pfKLG-007VoD-1R; Thu, 23 Mar 2023 14:46:54 +0200
Date: Thu, 23 Mar 2023 14:46:54 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v14 03/10] drm/display: Add Type-C switch helpers
Message-ID: <ZBxKPiduTQ2A49Dy@smile.fi.intel.com>
References: <20230322104639.221402-1-treapking@chromium.org>
 <20230322104639.221402-4-treapking@chromium.org>
 <CAA8EJpqFuhAtTaTJNMmfaQoYaKF_t6N2QMgbOS1c9XVey8Jf3w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpqFuhAtTaTJNMmfaQoYaKF_t6N2QMgbOS1c9XVey8Jf3w@mail.gmail.com>
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Guenter Roeck <groeck@chromium.org>, Marek Vasut <marex@denx.de>,
 chrome-platform@lists.linux.dev, Robert Foss <rfoss@kernel.org>,
 YueHaibing <yuehaibing@huawei.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-acpi@vger.kernel.org,
 Andi Shyti <andi.shyti@linux.intel.com>, devicetree@vger.kernel.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 =?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jani Nikula <jani.nikula@intel.com>,
 Allen Chen <allen.chen@ite.com.tw>, Stephen Boyd <swboyd@chromium.org>,
 Pin-yen Lin <treapking@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Daniel Scally <djrscally@gmail.com>, Prashant Malani <pmalani@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 23, 2023 at 12:38:49AM +0200, Dmitry Baryshkov wrote:
> On Wed, 22 Mar 2023 at 12:47, Pin-yen Lin <treapking@chromium.org> wrote:

...

> > +config DRM_DISPLAY_DP_TYPEC_HELPER
> > +       bool
> > +       default y
> > +       depends on DRM_DISPLAY_HELPER
> > +       depends on DRM_DISPLAY_HELPER=TYPEC || TYPEC=y
> 
> If it is a select'able option, it doesn't make sense to use "depends"
> here. Select will override depends.

He-he, not so easy. This will help to find configurations that miss these
dependencies. Arnd taught me that. IIRC the ASoC subsystem has a lot of
such cases.

> > +       help
> > +         DRM display helpers for USB Type-C Displayport Alternate mode.

-- 
With Best Regards,
Andy Shevchenko


