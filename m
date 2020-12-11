Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FAC2D93E8
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 09:17:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 418816E079;
	Mon, 14 Dec 2020 08:17:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 076616E488
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 15:12:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 35BA931B;
 Fri, 11 Dec 2020 07:12:03 -0800 (PST)
Received: from [10.57.25.185] (unknown [10.57.25.185])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 81A923F66B;
 Fri, 11 Dec 2020 07:12:00 -0800 (PST)
Subject: Re: [PATCH v4 0/5] Thermal devfreq cooling improvements with Energy
 Model
To: daniel.lezcano@linaro.org
References: <20201210143014.24685-1-lukasz.luba@arm.com>
From: Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <04bdcc7a-c264-ffd2-89a2-5606e59ff786@arm.com>
Date: Fri, 11 Dec 2020 15:11:58 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20201210143014.24685-1-lukasz.luba@arm.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 14 Dec 2020 08:17:41 +0000
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
Cc: amit.kucheria@verdurent.com, linux-pm@vger.kernel.org, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 steven.price@arm.com, alyssa.rosenzweig@collabora.com, rui.zhang@intel.com,
 ionela.voinescu@arm.com, orjan.eide@arm.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

Do you think it has chance to go to as material for v5.11?

Regards,
Lukasz


On 12/10/20 2:30 PM, Lukasz Luba wrote:
> Hi all,
> 
> This patch set is a continuation of my previous work, which aimed
> to add Energy Model to all devices [1]. This series is a follow up
> for the patches which got merged to v5.9-rc1. It aims to change
> the thermal devfreq cooling and use the Energy Model instead of
> private power table and structures. The power model is now simplified,
> static power and dynamic power are removed. The new registration interface
> in the patch 3/5 helps to register devfreq cooling and the EM in one call.
> There is also small improvement, patch 2/5 is changing the way how
> thermal gets the device status (now uses a copy) and normalize the values.
> The last patch is here for consistency and will probably go through drm tree.
> 
> The patch set should apply on top of thermal/testing. It does not depend on
> new EM API change which is queued in the pm/linux-next tree as v5.11 material.
> Thus, could go in parallel. That was the main motiviation for this v4.
> 
> changes:
> v4:
> - patch 3/5 - removed dependency on the EM API change
> -- removed em_dev_register_perf_domain() and just use
>     dev_pm_opp_of_register_em() which API has not changed
> -- removed a helper registration function and renamed
>     devfreq_cooling_em_register_power() to devfreq_cooling_em_register()
>     (was actually suggested by Ionela during review)
> -- moved energy_model.h to include in devfreq_cooling.c not .h, since
>     there is no EM structure in there anymore
> - adjusted comments and commit messages
> v3 [4]:
> - dropped direct check of device status and used just a copy of 'status';
>    a separate patch set will be proposed to address this issue
> - modified _normalize_load() and used 1024 scale to handle ms, us, ns
> - removed 'em_registered' and called em_dev_unregister_perf_domain()
>    unconditionally, so the drivers will have to make sure the right order of
>    all unregister calls to frameworks which might use EM; this call must be last
>    one; a proper comment added
> - removed 'em' pointer from struct devfreq_cooling_device, 'dev->em_pd' is used
> - removed of_node_get/put(), since the code can handle it
> - removed dfc_em_get_requested_power() (as missed to do it in v2)
> - collected all Reviewed-by tags
> v2 [3]:
> - renamed freq_get_state() and related to perf_idx pattern as
>    suggested by Ionela
> v1 [2]
> 
> Regards,
> Lukasz Luba
> 
> Lukasz Luba (5):
>    thermal: devfreq_cooling: change tracing function and arguments
>    thermal: devfreq_cooling: use a copy of device status
>    thermal: devfreq_cooling: add new registration functions with Energy
>      Model
>    thermal: devfreq_cooling: remove old power model and use EM
>    drm/panfrost: Register devfreq cooling and attempt to add Energy Model
> 
>   drivers/gpu/drm/panfrost/panfrost_devfreq.c |   2 +-
>   drivers/thermal/devfreq_cooling.c           | 391 +++++++++-----------
>   include/linux/devfreq_cooling.h             |  27 +-
>   include/trace/events/thermal.h              |  19 +-
>   4 files changed, 198 insertions(+), 241 deletions(-)
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
