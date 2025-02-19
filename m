Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C57A3C365
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 16:18:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6782B10E841;
	Wed, 19 Feb 2025 15:18:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QDdGOISe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2A3610E858
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 15:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739978295; x=1771514295;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=+ujEqHIOWz9Mb9bXmB1Kcu9x9LVXuo/LUQYjQcr79uI=;
 b=QDdGOISe7kabrDmYOt1xxLaSS37RXjwUEImGarZK8aiCF4dsPLFPreAD
 fbNyqBrxu6+JAJc2iMPZrmx4uBhjNahOtYl1GLCGrQ6M6VfL/PX0zCDiQ
 WawWCw8nxrbxyb2PdDvQL0o2l7SYRj6VafMaAYyfMjE2WSk2W7WQ2Pw7I
 dHlO+BbQ3cqHqRDDDBnIJxIjo2ZDtQLtV0i3RmsGFwe6GSLvr5t0UOr/x
 1KuDJO6zMeMVXcGm5IFQ6pe16PnVThFqD8Nqw6qj176YYk+2AJnFkafjC
 8Xa50z9C/198qQ64/Chssz/Z/ZD7OdDNrVFoAIXfDX72xxSE6DWeMJqYP w==;
X-CSE-ConnectionGUID: CmoiavjYSa2OMBWbr0Dieg==
X-CSE-MsgGUID: yhKpGTMCRn+DHo/7OfW8ZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="58129678"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="58129678"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 07:18:10 -0800
X-CSE-ConnectionGUID: C7UDGHwnROCJnLguSLob3A==
X-CSE-MsgGUID: Sz83G2noTcK9huBU59g88Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="115395868"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.160])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 07:18:03 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, Jim Qu <Jim.Qu@amd.com>
Cc: Lukas Wunner <lukas@wunner.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Takashi Iwai <tiwai@suse.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Su Hui <suhui@nfschina.com>
Subject: Re: [PATCH] vgaswitcheroo: Fix error checking in
 vga_switcheroo_register_audio_client()
In-Reply-To: <ae24cd32-1e78-4656-b983-051ed22d86b9@stanley.mountain>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <ae24cd32-1e78-4656-b983-051ed22d86b9@stanley.mountain>
Date: Wed, 19 Feb 2025 17:17:56 +0200
Message-ID: <87zfiim09n.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 19 Feb 2025, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> The "id" variable is an enum and in this context it's treated as an
> unsigned int so the error handling can never trigger.

When would that be true with GCC?

BR,
Jani.

> The
> ->get_client_id() functions do not currently return any errors but
> I imagine that if they did, then the intention was to return
> VGA_SWITCHEROO_UNKNOWN_ID on error.  Let's check for both negatives
> and UNKNOWN_ID so we'll catch it either way.
>
> Reported-by: Su Hui <suhui@nfschina.com>
> Closes: https://lore.kernel.org/all/20231026021056.850680-1-suhui@nfschina.com/
> Fixes: 4aaf448fa975 ("vga_switcheroo: set audio client id according to bound GPU id")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/vga/vga_switcheroo.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/vga/vga_switcheroo.c b/drivers/gpu/vga/vga_switcheroo.c
> index 18f2c92beff8..216fb208eb31 100644
> --- a/drivers/gpu/vga/vga_switcheroo.c
> +++ b/drivers/gpu/vga/vga_switcheroo.c
> @@ -375,7 +375,7 @@ int vga_switcheroo_register_audio_client(struct pci_dev *pdev,
>  	mutex_lock(&vgasr_mutex);
>  	if (vgasr_priv.active) {
>  		id = vgasr_priv.handler->get_client_id(vga_dev);
> -		if (id < 0) {
> +		if ((int)id < 0 || id == VGA_SWITCHEROO_UNKNOWN_ID) {
>  			mutex_unlock(&vgasr_mutex);
>  			return -EINVAL;
>  		}

-- 
Jani Nikula, Intel
