Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF2EAF8E23
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 11:18:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3352F10E9BF;
	Fri,  4 Jul 2025 09:18:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0CC6B10E9BC;
 Fri,  4 Jul 2025 09:18:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 98210152B;
 Fri,  4 Jul 2025 02:18:17 -0700 (PDT)
Received: from [10.1.39.21] (e122027.cambridge.arm.com [10.1.39.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DEB0C3F6A8;
 Fri,  4 Jul 2025 02:18:23 -0700 (PDT)
Message-ID: <bf64da66-5475-4289-b3ee-a6247b168ff1@arm.com>
Date: Fri, 4 Jul 2025 10:18:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/80] drivers: drm: Remove redundant
 pm_runtime_mark_last_busy() calls
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Douglas Anderson <dianders@chromium.org>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Qiang Yu <yuq825@gmail.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Thierry Reding
 <thierry.reding@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Damon Ding <damon.ding@rock-chips.com>,
 Ayushi Makhija <quic_amakhija@quicinc.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Chen-Yu Tsai <wenst@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 etnaviv@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 imx@lists.linux.dev, lima@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
 <20250704075413.3218307-1-sakari.ailus@linux.intel.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250704075413.3218307-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 04/07/2025 08:54, Sakari Ailus wrote:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> The cover letter of the set can be found here
> <URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@linux.intel.com>.
> 
> In brief, this patch depends on PM runtime patches adding marking the last
> busy timestamp in autosuspend related functions. The patches are here, on
> rc2:
> 
>         git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
>                 pm-runtime-6.17-rc1
> 
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 2 --
>  drivers/gpu/drm/bridge/analogix/anx7625.c          | 2 --
>  drivers/gpu/drm/bridge/parade-ps8640.c             | 2 --
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c              | 1 -
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c              | 4 ----
>  drivers/gpu/drm/exynos/exynos_drm_fimc.c           | 2 --
>  drivers/gpu/drm/exynos/exynos_drm_g2d.c            | 2 --
>  drivers/gpu/drm/exynos/exynos_drm_gsc.c            | 2 --
>  drivers/gpu/drm/exynos/exynos_drm_rotator.c        | 1 -
>  drivers/gpu/drm/exynos/exynos_drm_scaler.c         | 1 -
>  drivers/gpu/drm/i915/intel_runtime_pm.c            | 2 --
>  drivers/gpu/drm/imx/dcss/dcss-crtc.c               | 1 -
>  drivers/gpu/drm/lima/lima_sched.c                  | 1 -
>  drivers/gpu/drm/panel/panel-edp.c                  | 3 ---
>  drivers/gpu/drm/panel/panel-samsung-atna33xc20.c   | 2 --
>  drivers/gpu/drm/panel/panel-simple.c               | 2 --
>  drivers/gpu/drm/panthor/panthor_sched.c            | 2 --

Panthor changes are:

Reviewed-by: Steven Price <steven.price@arm.com>

Thanks,
Steve

>  drivers/gpu/drm/tegra/submit.c                     | 1 -
>  drivers/gpu/drm/tidss/tidss_drv.c                  | 2 --
>  drivers/gpu/drm/vc4/vc4_v3d.c                      | 1 -
>  20 files changed, 36 deletions(-)
> 
[...]

> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index a2248f692a03..f635f26a23f4 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -2446,7 +2446,6 @@ static void tick_work(struct work_struct *work)
>  
>  out_unlock:
>  	mutex_unlock(&sched->lock);
> -	pm_runtime_mark_last_busy(ptdev->base.dev);
>  	pm_runtime_put_autosuspend(ptdev->base.dev);
>  
>  out_dev_exit:
> @@ -3203,7 +3202,6 @@ queue_run_job(struct drm_sched_job *sched_job)
>  
>  out_unlock:
>  	mutex_unlock(&sched->lock);
> -	pm_runtime_mark_last_busy(ptdev->base.dev);
>  	pm_runtime_put_autosuspend(ptdev->base.dev);
>  
>  	return done_fence;
