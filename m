Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64ED11392A8
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2020 14:57:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB6FD89ADC;
	Mon, 13 Jan 2020 13:57:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 191D989AB7;
 Mon, 13 Jan 2020 13:57:17 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jan 2020 05:57:16 -0800
X-IronPort-AV: E=Sophos;i="5.69,429,1571727600"; d="scan'208";a="217411967"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jan 2020 05:57:13 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Chen Zhou <chenzhou10@huawei.com>, airlied@linux.ie, daniel@ffwll.ch
Subject: Re: [PATCH next] drm/i915: fix build error without ACPI
In-Reply-To: <20200113132724.143687-1-chenzhou10@huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200113132724.143687-1-chenzhou10@huawei.com>
Date: Mon, 13 Jan 2020 15:57:10 +0200
Message-ID: <874kwzmpc9.fsf@intel.com>
MIME-Version: 1.0
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
Cc: chenzhou10@huawei.com, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 13 Jan 2020, Chen Zhou <chenzhou10@huawei.com> wrote:
> If CONFIG_ACPI=n and CONFIG_BACKLIGHT_CLASS_DEVICE=m, compilation complains
> with undefined references:
>
> drivers/gpu/drm/i915/display/intel_panel.o: In function `intel_backlight_device_register':
> intel_panel.c:(.text+0x4dd9): undefined reference to `backlight_device_register'
> drivers/gpu/drm/i915/display/intel_panel.o: In function `intel_backlight_device_unregister':
> intel_panel.c:(.text+0x4e96): undefined reference to `backlight_device_unregister'
>
> This patch select BACKLIGHT_CLASS_DEVICE directly.

i915 does not unconditionally require backlight.

See e.g. [1] for the details.

BR,
Jani.


[1] http://lore.kernel.org/r/87o8veotf9.fsf@intel.com

>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Chen Zhou <chenzhou10@huawei.com>
> ---
>  drivers/gpu/drm/i915/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
> index ba95959..6b69dab 100644
> --- a/drivers/gpu/drm/i915/Kconfig
> +++ b/drivers/gpu/drm/i915/Kconfig
> @@ -16,7 +16,7 @@ config DRM_I915
>  	select IRQ_WORK
>  	# i915 depends on ACPI_VIDEO when ACPI is enabled
>  	# but for select to work, need to select ACPI_VIDEO's dependencies, ick
> -	select BACKLIGHT_CLASS_DEVICE if ACPI
> +	select BACKLIGHT_CLASS_DEVICE
>  	select INPUT if ACPI
>  	select ACPI_VIDEO if ACPI
>  	select ACPI_BUTTON if ACPI

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
