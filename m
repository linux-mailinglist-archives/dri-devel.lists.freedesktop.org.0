Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1646C68B7
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 13:45:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 015E410E11E;
	Thu, 23 Mar 2023 12:45:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D20A410E11E
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 12:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679575521; x=1711111521;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=z034CEWDZWzBHQVHZYtVHoLpxMyCoA3kXaDvrv1Q98w=;
 b=XR4GbRRxOLhhGzwBKbILpOX2956u5kEKM+CllvviJ4Jy3MIGM93tW+TZ
 mSkinGjVbUsmmlOF8Or0B+wAS0kdxXGh9OigJWr3C+UrE63ERJ79538Nt
 hJczlBfMoR2s4il6/2qlHSll8Y8SXvoUq0g//i6PjhuyKr2VZ9UMZ+HJ0
 LkQBmAOfb7uG5K1lsRJ9HFUO1SEz2mJZolQn8KdCyyuWVMXWoXHh8G3kg
 t2Z0Bc7kiFCbnNPz9/wyrA/YxWexLzaedr5iinOnLE//A7O3rkPxkMVuD
 TeO6DUipnZurcsVfb9HlHeEgjifMzkAXnClXpSYht2/X5cUHrrrNW3Ov7 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="338196414"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="338196414"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 05:45:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="632383474"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="632383474"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga003.jf.intel.com with ESMTP; 23 Mar 2023 05:45:07 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1pfKJU-007VlG-0v; Thu, 23 Mar 2023 14:45:04 +0200
Date: Thu, 23 Mar 2023 14:45:03 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v14 03/10] drm/display: Add Type-C switch helpers
Message-ID: <ZBxJz4ESBocICA/L@smile.fi.intel.com>
References: <20230322104639.221402-1-treapking@chromium.org>
 <20230322104639.221402-4-treapking@chromium.org>
 <ZBrgD61p/p17IOJL@smile.fi.intel.com> <87edpg7nub.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87edpg7nub.fsf@intel.com>
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
 Jonas Karlman <jonas@kwiboo.se>, Allen Chen <allen.chen@ite.com.tw>,
 Stephen Boyd <swboyd@chromium.org>, Pin-yen Lin <treapking@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Daniel Scally <djrscally@gmail.com>, Prashant Malani <pmalani@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 22, 2023 at 06:27:56PM +0200, Jani Nikula wrote:
> On Wed, 22 Mar 2023, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > On Wed, Mar 22, 2023 at 06:46:32PM +0800, Pin-yen Lin wrote:
> >> +#ifdef CONFIG_DRM_DISPLAY_DP_TYPEC_HELPER
> >
> > Ah, maybe this should use IS_REACHABLE() ?
> 
> Personally, I think IS_REACHABLE() is a build-time band-aid solution to
> a problem that should be solved in Kconfig. :p
> 
> I think it always means there's a configuration combo that shouldn't
> exist, and it's a surprise to the user when they've configured
> something, Kconfig has deemed it a valid configuration, but they don't
> get the feature they want.
> 
> As a user, how would they even debug that case? Double check configs,
> don't see anything wrong.

Usual pairing is 'imply FOO' in Kconfig & 'IS_REACHEABLE(CONFIG_FOO)' in the
code. And I believe it's not an abnormal.

-- 
With Best Regards,
Andy Shevchenko


