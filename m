Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6BCCB5626
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 10:42:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 905FA10E7AB;
	Thu, 11 Dec 2025 09:42:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="HvulFSoM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BEEC10E2A6;
 Thu, 11 Dec 2025 09:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1765446124;
 bh=dMpqiFCJMHAu/S8QPIMqKAclh6zs9Butm4v+vxWTzu0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=HvulFSoM3N2nKQW39FmjmTaowyywmfU5JBjzT47ZA1TdF9xJa/sYNTd8/k4wEBW+s
 Y5k9JFF+AkTArJmWMsIGlAZYLPyxLhtFv3HkauF5ILghphcSZXbqQGnIl9nwmZmApe
 TtfZgPkviZyqSIIfc3rWzf00YlV7P00YE19SvE2B6xgoxa8JLbDk5OR0g1oX07U2TP
 KnpW4WBIswLLCI4IyJ+o9kpDk7FND8jjEWdmCQ0nbZ2dJacHnp30oXx7bIfI8FbT14
 mVT1IRa+jLbfGqLJ1lz1LYu6ZoziprrDv4E0sRca4oE2xU4coh2XspEFDwZKMRseEq
 Vbr0zd3GwNvsw==
Message-ID: <d6c4af43-0b79-4d4e-980b-0135b05da74a@lankhorst.se>
Date: Thu, 11 Dec 2025 10:42:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/me/gsc: mei interrupt top half should be in irq
 disabled context
To: Junxiao Chang <junxiao.chang@intel.com>, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com, airlied@gmail.com,
 simona@ffwll.ch, bigeasy@linutronix.de, clrkwllms@kernel.org,
 rostedt@goodmis.org, daniele.ceraolospurio@intel.com,
 alexander.usyskin@intel.com, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rt-devel@lists.linux.dev, Matthew Brost <matthew.brost@intel.com>
Cc: baoli.zhang@intel.com
References: <20251107033152.834960-1-junxiao.chang@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <20251107033152.834960-1-junxiao.chang@intel.com>
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

Thanks for the patch, I pushed it.

I also added Matthew Brost's r-b, as I submitted this patch separately, and b4-am recognised it as the same patch.

Kind regards,
~Maarten Lankhorst

Den 2025-11-07 kl. 04:31, skrev Junxiao Chang:
> MEI GSC interrupt comes from i915 or xe driver. It has top half and
> bottom half. Top half is called from i915/xe interrupt handler. It
> should be in irq disabled context.
> 
> With RT kernel(PREEMPT_RT enabled), by default IRQ handler is in
> threaded IRQ. MEI GSC top half might be in threaded IRQ context.
> generic_handle_irq_safe API could be called from either IRQ or
> process context, it disables local IRQ then calls MEI GSC interrupt
> top half.
> 
> This change fixes B580 GPU boot issue with RT enabled.
> 
> Fixes: e02cea83d32d ("drm/xe/gsc: add Battlemage support")
> Tested-by: Baoli Zhang <baoli.zhang@intel.com>
> Signed-off-by: Junxiao Chang <junxiao.chang@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_heci_gsc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_heci_gsc.c b/drivers/gpu/drm/xe/xe_heci_gsc.c
> index a415ca4887914..32d509b113915 100644
> --- a/drivers/gpu/drm/xe/xe_heci_gsc.c
> +++ b/drivers/gpu/drm/xe/xe_heci_gsc.c
> @@ -221,7 +221,7 @@ void xe_heci_gsc_irq_handler(struct xe_device *xe, u32 iir)
>  	if (xe->heci_gsc.irq < 0)
>  		return;
>  
> -	ret = generic_handle_irq(xe->heci_gsc.irq);
> +	ret = generic_handle_irq_safe(xe->heci_gsc.irq);
>  	if (ret)
>  		drm_err_ratelimited(&xe->drm, "error handling GSC irq: %d\n", ret);
>  }
> @@ -241,7 +241,7 @@ void xe_heci_csc_irq_handler(struct xe_device *xe, u32 iir)
>  	if (xe->heci_gsc.irq < 0)
>  		return;
>  
> -	ret = generic_handle_irq(xe->heci_gsc.irq);
> +	ret = generic_handle_irq_safe(xe->heci_gsc.irq);
>  	if (ret)
>  		drm_err_ratelimited(&xe->drm, "error handling GSC irq: %d\n", ret);
>  }

