Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D66270204
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 18:22:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C937A6ECEF;
	Fri, 18 Sep 2020 16:22:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C046F6ECEF
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 16:22:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id DB0ADFB03;
 Fri, 18 Sep 2020 18:22:50 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WCYvx8P8Moua; Fri, 18 Sep 2020 18:22:49 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 3E70C457CC; Fri, 18 Sep 2020 18:22:49 +0200 (CEST)
Date: Fri, 18 Sep 2020 18:22:49 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <guido.gunther@puri.sm>
To: Colin King <colin.king@canonical.com>
Subject: Re: [PATCH][next] drm/panel: fix null pointer dereference on pointer
 mode
Message-ID: <20200918162249.GA292461@bogon.m.sigxcpu.org>
References: <20200918155136.28958-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200918155136.28958-1-colin.king@canonical.com>
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
Cc: Purism Kernel Team <kernel@puri.sm>, David Airlie <airlied@linux.ie>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
On Fri, Sep 18, 2020 at 04:51:36PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently a null pointer check on pointer mode is passing mode to
> function drm_mode_vrefresh and this causes a null pointer dereference
> on mode.  Fix this by not calling drm_mode_vrefresh since the call
> is only required for error reporting.
> 
> Addresses-Coverity: ("Dereference after null check")
> Fixes: 72967d5616d3 ("drm/panel: Add panel driver for the Mantix MLAF057WE51-X DSI panel")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
> index 3482e28e30fc..be4761a643f9 100644
> --- a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
> +++ b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
> @@ -202,9 +202,8 @@ static int mantix_get_modes(struct drm_panel *panel,
>  
>  	mode = drm_mode_duplicate(connector->dev, &default_mode);
>  	if (!mode) {
> -		dev_err(ctx->dev, "Failed to add mode %ux%u@%u\n",
> -			default_mode.hdisplay, default_mode.vdisplay,
> -			drm_mode_vrefresh(mode));
> +		dev_err(ctx->dev, "Failed to add mode %ux%u\n",
> +			default_mode.hdisplay, default_mode.vdisplay);
>  		return -ENOMEM;
>  	}

drm_mode_vrefresh(&default_mode) gives some more clue what's going on -
I have had a fix queued up in my tree already but if you send a v2
that's fine.

Thanks!
 -- Guido

>  
> -- 
> 2.27.0
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
