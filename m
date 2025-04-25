Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E06A9C0F0
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 10:27:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 297C610E2A8;
	Fri, 25 Apr 2025 08:27:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="KZBKIpvw";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="PVOi/gi6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (unknown [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEDC110E2A8;
 Fri, 25 Apr 2025 08:27:40 +0000 (UTC)
Date: Fri, 25 Apr 2025 10:27:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1745569648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bwKc8vWDzsGShvSx8/ujEE3vSUGRy3MUCHV+p+G4yOM=;
 b=KZBKIpvwvkXoKwK4SyKQlVDvDURRV3Awgp4XWdhfCQ/kvw4/+prjS74f+0cfZTiCNThQHP
 SUZTrzh1MqpfaTFgfxOL/Afi+rwNmZBqAPsv2g7rI6q/eRAAMqF2FarnHsoyOcQuHdCyoh
 JCVgXkCcXxVT8EVeE7hjmKgkDN1X2oDZheVA/sMvcomZJO05Kb3ph6BW+cf1N/4lTVqsG1
 D0l1Pu/1LwDemaCW6wg55nnXsE+qCHjQaaWHitNqZ5dUh6k9Lx+iazIsojLEVu8xtKAUQS
 6A4nYAkyLYUS9okHgSGVkrl/mJlkNdjsLYFG7qzUqU/95ezUtQ4pJzWp43THjA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1745569648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bwKc8vWDzsGShvSx8/ujEE3vSUGRy3MUCHV+p+G4yOM=;
 b=PVOi/gi69ZVtKyEIcPPxTfvtIYIfLesnLQgo3tRdrBwYTCpNcLJHYy2PtD0qW+oqfHAwhV
 QaQ37ecJPxP0TNAw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Junxiao Chang <junxiao.chang@intel.com>
Cc: tomas.winkler@intel.com, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Clark Williams <clrkwllms@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Vitaly Lubart <vitaly.lubart@intel.com>,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev,
 furong.zhou@intel.com
Subject: Re: [PATCH] drm/i915/gsc: mei interrupt top half should be in irq
 disabled context
Message-ID: <20250425082726.Z3fE3m9I@linutronix.de>
References: <20250424065609.624457-1-junxiao.chang@intel.com>
 <20250425060455.641008-1-junxiao.chang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250425060455.641008-1-junxiao.chang@intel.com>
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

On 2025-04-25 14:04:54 [+0800], Junxiao Chang wrote:
> MEI GSC interrupt comes from i915. It has top half and bottom half.
> Top half is called from i915 interrupt handler. It should be in
> irq disabled context.
> 
> With RT kernel, by default i915 IRQ handler is in threaded IRQ. MEI GSC
> top half might be in threaded IRQ context. generic_handle_irq_safe API
> could be called from either IRQ or process context, it disables local
> IRQ then calls MEI GSC interrupt top half.
> 
> This change fixes A380/A770 GPU boot hang issue with RT kernel.
> 
> Fixes: 1e3dc1d8622b ("drm/i915/gsc: add gsc as a mei auxiliary device")
> Tested-by: Furong Zhou <furong.zhou@intel.com>
> Suggested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Signed-off-by: Junxiao Chang <junxiao.chang@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gsc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gsc.c b/drivers/gpu/drm/i915/gt/intel_gsc.c
> index 1e925c75fb080..a099d885508ac 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gsc.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gsc.c
> @@ -284,7 +284,9 @@ static void gsc_irq_handler(struct intel_gt *gt, unsigned int intf_id)
>  	if (gt->gsc.intf[intf_id].irq < 0)
>  		return;
>  
> -	ret = generic_handle_irq(gt->gsc.intf[intf_id].irq);
> +	/* It can be called in both irq context and in thread context */

I don't know why this deserves a comment. However, generic_handle_irq()
is used from the IRQ chip, everything that signals the interrupt. This,
if it comes from an interrupt handler itself, should use the _safe()
variant. It used to be a issue also with threaded interrupts on !RT but
for other reasons this is no longer the case.

> +	ret = generic_handle_irq_safe(gt->gsc.intf[intf_id].irq);
> +
>  	if (ret)
>  		gt_err_ratelimited(gt, "error handling GSC irq: %d\n", ret);
>  }

Sebastian
