Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E69956C50AB
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 17:28:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2701610E352;
	Wed, 22 Mar 2023 16:28:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1797510E3C3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 16:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679502490; x=1711038490;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=KfUvgiz4DVLzFaYO7oEOLPOOhMl2JyBbYso8oKRbz/4=;
 b=BmD8tCRaRZpZ/Kdpt6o8HriN434haTyWiJtpvtw3hoTNa3pS2V6r8eyp
 iWocqFWSGSK8IXOOk+qevIf4YHmkdHo55Ptn8/4MkvnJdL3r2xdpydXJ9
 1M7Vw8JLqctqoOswdEw9Z3VdUUTs4AL4dHptPND7TMJFxBdLUUrA/luQO
 GJB1Rv9RDIfYcBFdCl07937y65CceZtts4jh1yucL4kgnJ5FBn0sWZUVQ
 AxIVQfbyXa54sWMjgYfVyFqeHechfdEXupJNEhVPbod58YmTwPQV78Dt3
 fZxzEVYqQ2B5kxa4IzTYPT47vX7eQP4P/ybS7Jfbnbg88TGqBl4wAJfB7 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="339300034"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="339300034"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 09:28:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="771102926"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="771102926"
Received: from jprokopo-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.61.221])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 09:27:59 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Pin-yen Lin
 <treapking@chromium.org>
Subject: Re: [PATCH v14 03/10] drm/display: Add Type-C switch helpers
In-Reply-To: <ZBrgD61p/p17IOJL@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230322104639.221402-1-treapking@chromium.org>
 <20230322104639.221402-4-treapking@chromium.org>
 <ZBrgD61p/p17IOJL@smile.fi.intel.com>
Date: Wed, 22 Mar 2023 18:27:56 +0200
Message-ID: <87edpg7nub.fsf@intel.com>
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
 =?utf-8?Q?N=C3=ADco?= =?utf-8?Q?las_F_=2E_R_=2E_A_=2E_Prado?=
 <nfraprado@collabora.com>, Jonas Karlman <jonas@kwiboo.se>,
 Allen Chen <allen.chen@ite.com.tw>, Stephen Boyd <swboyd@chromium.org>,
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

On Wed, 22 Mar 2023, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> On Wed, Mar 22, 2023 at 06:46:32PM +0800, Pin-yen Lin wrote:
>> +#ifdef CONFIG_DRM_DISPLAY_DP_TYPEC_HELPER
>
> Ah, maybe this should use IS_REACHABLE() ?

Personally, I think IS_REACHABLE() is a build-time band-aid solution to
a problem that should be solved in Kconfig. :p

I think it always means there's a configuration combo that shouldn't
exist, and it's a surprise to the user when they've configured
something, Kconfig has deemed it a valid configuration, but they don't
get the feature they want.

As a user, how would they even debug that case? Double check configs,
don't see anything wrong.


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
