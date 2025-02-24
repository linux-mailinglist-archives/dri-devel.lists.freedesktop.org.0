Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFA8A42020
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 14:14:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02A91891B8;
	Mon, 24 Feb 2025 13:14:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TvsWIEfz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AB17891B8
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 13:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740402881; x=1771938881;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=XiVTLCpQjoG7i4GIZhQDVM3cLNtiY+nfowdB5nwr+lI=;
 b=TvsWIEfzYpfdphU3ZX+IUoEY+uNgrRh2GOrWEXZKbk0yPCSr3nmW5Fb7
 GbhfBYSFumIH2iZLlsjmbRcKQHqFQx2bY/Dey0TXuQEkhweXzSV8LyMVE
 HH46GNqutT1pjdRZ5EkYFw6ziEWaXNdtUrZEKoMqCeTZqAnn02K3wmMTS
 qTch6t2f2q4N1PtffAkkz2khX2AfNwenRdZOeNmpTI43MsM56vZDIS/ma
 WcCdESrXVNEmuYvnWfafr6Mja5Es5UcMLdX1r/2biQYb+07bgO9sBP/rD
 b7or/AEnnrGBNCoFadvupWqVVfjkUozpaKXQUi8qRAPaQ1fgtMxljMTcI Q==;
X-CSE-ConnectionGUID: E/NqlgFKS36fu7t0l29APg==
X-CSE-MsgGUID: onspbH9sTjW6zIEMjiYDlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="40344072"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="40344072"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 05:14:41 -0800
X-CSE-ConnectionGUID: vOJLew+fQQiJ7KeLZRkCvQ==
X-CSE-MsgGUID: FZp77It4RS+Qoz+lHAOAbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="115895179"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.133])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 05:14:36 -0800
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
Date: Mon, 24 Feb 2025 15:14:33 +0200
Message-ID: <87eczn7adi.fsf@intel.com>
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
> unsigned int so the error handling can never trigger.  The
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

Maybe we want to do something else here... see [1].

BR,
Jani.


[1] https://lore.kernel.org/r/CAHk-=wgg2A_iHNwf_JDjYJF=XHnKVGOjGp50FzVWniA2Z010bw@mail.gmail.com


>  			mutex_unlock(&vgasr_mutex);
>  			return -EINVAL;
>  		}

-- 
Jani Nikula, Intel
