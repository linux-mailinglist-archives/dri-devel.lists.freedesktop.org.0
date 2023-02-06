Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4883C68BC97
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 13:16:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3935B10E392;
	Mon,  6 Feb 2023 12:16:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6C0110E392
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Feb 2023 12:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675685760; x=1707221760;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=/sfAfGJA6/XxqLEnP+hho0W1Nhw3gCWgj1LKpNZa/So=;
 b=XUJKzco//yWIItKBAOwJE0JHvb8VXqeGJlTk7MbDkKaXY8p2851y1hhq
 bax7NGIP0VWi3L5UOA2y4cfeUbesP/x8IwF/AitiMFd1CBg+ESSzQTo0/
 mrbFq75W9xDhevQBowc0zMYKduxez7rUcxR/sYSFAfrbVC42o3IQMQoVN
 Kq1g5b9GK8K7XS3wUjIJJKKgSxrkanyJxPVd5Vpoqo0/XFI99auAXwz8M
 9jqNSHapugPwDyRqz5QjCfHuCgN2/w0Kibu2Occyp40h9VKRCQRHK6des
 zM09r8wA926mbqR5/epRlNrgAh8poBUo0WD/HqmgNdGDRBbuXiuZQ5Rvb w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="329206650"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; d="scan'208";a="329206650"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2023 04:15:59 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="729990155"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; d="scan'208";a="729990155"
Received: from hayatibx-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.62.213])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2023 04:15:49 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Pin-yen Lin
 <treapking@chromium.org>
Subject: Re: [PATCH v11 3/9] drm/display: Add Type-C switch helpers
In-Reply-To: <Y+Dtwm39cGQO58xa@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230204133040.1236799-1-treapking@chromium.org>
 <20230204133040.1236799-4-treapking@chromium.org>
 <Y+Dtwm39cGQO58xa@smile.fi.intel.com>
Date: Mon, 06 Feb 2023 14:15:46 +0200
Message-ID: <87k00vyop9.fsf@intel.com>
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
 Guenter Roeck <groeck@chromium.org>, Kees Cook <keescook@chromium.org>,
 Marek Vasut <marex@denx.de>, chrome-platform@lists.linux.dev,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-acpi@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Andi Shyti <andi.shyti@linux.intel.com>, Thierry Reding <treding@nvidia.com>,
 devicetree@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 =?utf-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Pr?= =?utf-8?Q?ado?=
 <nfraprado@collabora.com>, Jonas Karlman <jonas@kwiboo.se>,
 Allen Chen <allen.chen@ite.com.tw>, Stephen Boyd <swboyd@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, Daniel Scally <djrscally@gmail.com>,
 Prashant Malani <pmalani@chromium.org>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 06 Feb 2023, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> On Sat, Feb 04, 2023 at 09:30:34PM +0800, Pin-yen Lin wrote:
>> Add helpers to register and unregister Type-C "switches" for bridges
>> capable of switching their output between two downstream devices.
>> 
>> The helper registers USB Type-C mode switches when the "mode-switch"
>> and the "reg" properties are available in Device Tree.
>
> ...
>
>> +	fwnode_for_each_child_node(port, sw) {
>> +		if (fwnode_property_present(sw, "mode-switch"))
>
> This idiom is being used at least twice (in this code, haven't checked the rest
> of the patches, though), perhaps
>
> #define fwnode_for_each_typec_mode_switch(port, sw)			\
> 	fwnode_for_each_child_node(port, sw)				\
> 		if (!fwnode_property_present(sw, "mode-switch")) {} else
>
> ?

See for_each_if() in drm_util.h.


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
