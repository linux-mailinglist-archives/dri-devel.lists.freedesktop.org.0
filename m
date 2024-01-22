Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99323836F52
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 19:13:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2DF810EF63;
	Mon, 22 Jan 2024 18:12:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4545310EF6E;
 Mon, 22 Jan 2024 18:12:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 336B7CE2C0C;
 Mon, 22 Jan 2024 18:12:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24E09C433C7;
 Mon, 22 Jan 2024 18:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705947127;
 bh=X7GfhZVrnsTjbrFniNSElkwaarUNiRIasEFIuqkBbsc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=RD8iuvLT4Sv4aBKpW/AH0z/cICipgVW1lAjoC1YM1SyiKLBhrgz3HpvzH1fu0nXxq
 vQj2C7z9nKhUhA7/137/0FAZ1UBUIJEqX2EfctHJRDcwwbF0B3eM2QUwSTO0EFM+S8
 Yg16Li20dF9C76zTt/31v+fnBYVns0Nfn05p0rt7gygIitxU3Bb83OBnj1axDQ0+VJ
 EZwq7+GP7yVeDXZO1XkZwJDVdbVocBqnaLtJc502siNpXTksX+/aFBCBazIDD38kBZ
 t4xqOKiSwtjFP4ljsbSdg9zoGDHylXjw2ljwv+rHUHDX1WLpXQ1t5goVu8GYMzXfC7
 VPLhQabcjhzIA==
Date: Mon, 22 Jan 2024 12:12:05 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v3 1/2] pm: runtime: Simplify pm_runtime_get_if_active()
 usage
Message-ID: <20240122181205.GA275751@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240122114121.56752-2-sakari.ailus@linux.intel.com>
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-pci@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 laurent.pinchart@ideasonboard.com, David Airlie <airlied@gmail.com>,
 Paul Elder <paul.elder@ideasonboard.com>, linux-media@vger.kernel.org,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 linux-pm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-sound@vger.kernel.org,
 Mark Brown <broonie@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 intel-xe@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 Daniel Vetter <daniel@ffwll.ch>, netdev@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 22, 2024 at 01:41:21PM +0200, Sakari Ailus wrote:
> There are two ways to opportunistically increment a device's runtime PM
> usage count, calling either pm_runtime_get_if_active() or
> pm_runtime_get_if_in_use(). The former has an argument to tell whether to
> ignore the usage count or not, and the latter simply calls the former with
> ign_usage_count set to false. The other users that want to ignore the
> usage_count will have to explitly set that argument to true which is a bit
> cumbersome.

s/explitly/explicitly/

> To make this function more practical to use, remove the ign_usage_count
> argument from the function. The main implementation is renamed as
> pm_runtime_get_conditional().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Alex Elder <elder@linaro.org> # drivers/net/ipa/ipa_smp2p.c
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Acked-by: Takashi Iwai <tiwai@suse.de> # sound/
> Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com> # drivers/accel/ivpu/
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com> # drivers/gpu/drm/i915/
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Acked-by: Bjorn Helgaas <bhelgaas@google.com> # drivers/pci/

> -EXPORT_SYMBOL_GPL(pm_runtime_get_if_active);
> +EXPORT_SYMBOL_GPL(pm_runtime_get_conditional);

If pm_runtime_get_conditional() is exported, shouldn't it also be
documented in Documentation/power/runtime_pm.rst?

But I'm dubious about exporting it because
__intel_runtime_pm_get_if_active() is the only caller, and you end up
with the same pattern there that we have before this series in the PM
core.  Why can't intel_runtime_pm.c be updated to use
pm_runtime_get_if_active() or pm_runtime_get_if_in_use() directly, and
make pm_runtime_get_conditional() static?

> +++ b/drivers/gpu/drm/i915/intel_runtime_pm.c
> @@ -246,7 +246,7 @@ static intel_wakeref_t __intel_runtime_pm_get_if_active(struct intel_runtime_pm
>  		 * function, since the power state is undefined. This applies
>  		 * atm to the late/early system suspend/resume handlers.
>  		 */
> -		if (pm_runtime_get_if_active(rpm->kdev, ignore_usecount) <= 0)
> +		if (pm_runtime_get_conditional(rpm->kdev, ignore_usecount) <= 0)
>  			return 0;
>  	}

Bjorn
