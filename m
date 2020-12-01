Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3752C93B7
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 01:14:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70394896AF;
	Tue,  1 Dec 2020 00:14:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12A54896AF
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 00:14:34 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id F2E4B45D;
 Tue,  1 Dec 2020 01:14:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1606781673;
 bh=bp/jKcjuawrEpNsQkKheCqxJ3yqTyJ/4xaFlHTjRFjA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aBjwG075lKbbeZs48mr7i6UnPvhS+eOlztgbzYvMPjq7eQhuEsTnjIYudWnb/vrV/
 Ne5SuRoe+VBsrxSZ5erT8WQI1Tl+pd3+r8n/AQvGG/G4g3jo6I5SzOBHZAdgb78OjM
 EJxzFjt2yFxc79mkoroVLvRrLK0FI3xcYdt06X88=
Date: Tue, 1 Dec 2020 02:14:24 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v4 63/80] drm/omap: dsi: drop useless channel checks
Message-ID: <20201201001424.GH25713@pendragon.ideasonboard.com>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-64-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201124124538.660710-64-tomi.valkeinen@ti.com>
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
Cc: Tony Lindgren <tony@atomide.com>, hns@goldelico.com,
 Sekhar Nori <nsekhar@ti.com>, Sebastian Reichel <sre@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
 Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Thank you for the patch.

On Tue, Nov 24, 2020 at 02:45:21PM +0200, Tomi Valkeinen wrote:
> A DSI peripheral can have virtual channel ID of 0-3. This should be
> always the case, and there's no need in the driver to validate the
> channel.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/omapdrm/dss/dsi.c | 11 -----------
>  1 file changed, 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index 63338324c564..fbf05097612f 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -3902,9 +3902,6 @@ static int dsi_update_channel(struct omap_dss_device *dssdev, int channel)
>  	struct dsi_data *dsi = to_dsi_data(dssdev);
>  	int r;
>  
> -	if (channel > 3)
> -		return -EINVAL;
> -
>  	dsi_bus_lock(dsi);
>  
>  	if (!dsi->video_enabled) {
> @@ -5063,12 +5060,8 @@ static int omap_dsi_host_attach(struct mipi_dsi_host *host,
>  				struct mipi_dsi_device *client)
>  {
>  	struct dsi_data *dsi = host_to_omap(host);
> -	unsigned int channel = client->channel;
>  	int r;
>  
> -	if (channel > 3)
> -		return -EINVAL;
> -
>  	if (dsi->dsidev) {
>  		DSSERR("dsi client already attached\n");
>  		return -EBUSY;
> @@ -5118,10 +5111,6 @@ static int omap_dsi_host_detach(struct mipi_dsi_host *host,
>  				struct mipi_dsi_device *client)
>  {
>  	struct dsi_data *dsi = host_to_omap(host);
> -	unsigned int channel = client->channel;
> -
> -	if (channel > 3)
> -		return -EINVAL;
>  
>  	if (WARN_ON(dsi->dsidev != client))
>  		return -EINVAL;

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
