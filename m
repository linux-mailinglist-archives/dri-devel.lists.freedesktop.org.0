Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 806202A8E83
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 05:57:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA9226EE04;
	Fri,  6 Nov 2020 04:57:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DF6E6EE04
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 04:57:23 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 287BBB16;
 Fri,  6 Nov 2020 05:57:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1604638642;
 bh=cuDvMRu2tLgLJvPp04gS5eeeGDAihv+h/QN1Wkb6n1E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bY5Akb38B3rrmsFmC4WU7uRw8H5k6BKNRKSykv0fjHVSG2ip1urIvgckmGntidWUW
 Rz7W6XlkryUiFBtJUN7cdx7y+wD9W3f+TycfOA1LewXsTjF7nzhkdUnhP8qeJNxHac
 gaSOeOUJbt2PPhv9qUifcRRp1NNvR1iqvaC5DPqk=
Date: Fri, 6 Nov 2020 06:57:20 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v3 05/56] drm/omap: constify write buffers
Message-ID: <20201106045720.GF16469@pendragon.ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-6-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201105120333.947408-6-tomi.valkeinen@ti.com>
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
Cc: Tony Lindgren <tony@atomide.com>,
 "H . Nikolaus Schaller" <hns@goldelico.com>, Sekhar Nori <nsekhar@ti.com>,
 Sebastian Reichel <sre@kernel.org>, dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 linux-omap@vger.kernel.org, Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi and Sebastian,

Thank you for the patch.

On Thu, Nov 05, 2020 at 02:02:42PM +0200, Tomi Valkeinen wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> The write buffers are not modified, so they can be constant.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/omapdrm/dss/dsi.c     | 24 ++++++++++++------------
>  drivers/gpu/drm/omapdrm/dss/omapdss.h | 10 +++++-----
>  2 files changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index 86b9d435fb94..22d74d762a10 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -2601,11 +2601,11 @@ static inline void dsi_vc_write_long_payload(struct dsi_data *dsi, int channel,
>  }
>  
>  static int dsi_vc_send_long(struct dsi_data *dsi, int channel, u8 data_type,
> -			    u8 *data, u16 len, u8 ecc)
> +			    const u8 *data, u16 len, u8 ecc)
>  {
>  	/*u32 val; */
>  	int i;
> -	u8 *p;
> +	const u8 *p;
>  	int r = 0;
>  	u8 b1, b2, b3, b4;
>  
> @@ -2698,7 +2698,7 @@ static int dsi_vc_send_null(struct dsi_data *dsi, int channel)
>  }
>  
>  static int dsi_vc_write_nosync_common(struct dsi_data *dsi, int channel,
> -				      u8 *data, int len,
> +				      const u8 *data, int len,
>  				      enum dss_dsi_content_type type)
>  {
>  	int r;
> @@ -2729,7 +2729,7 @@ static int dsi_vc_write_nosync_common(struct dsi_data *dsi, int channel,
>  }
>  
>  static int dsi_vc_dcs_write_nosync(struct omap_dss_device *dssdev, int channel,
> -		u8 *data, int len)
> +		const u8 *data, int len)
>  {
>  	struct dsi_data *dsi = to_dsi_data(dssdev);
>  
> @@ -2738,7 +2738,7 @@ static int dsi_vc_dcs_write_nosync(struct omap_dss_device *dssdev, int channel,
>  }
>  
>  static int dsi_vc_generic_write_nosync(struct omap_dss_device *dssdev, int channel,
> -		u8 *data, int len)
> +		const u8 *data, int len)
>  {
>  	struct dsi_data *dsi = to_dsi_data(dssdev);
>  
> @@ -2747,7 +2747,7 @@ static int dsi_vc_generic_write_nosync(struct omap_dss_device *dssdev, int chann
>  }
>  
>  static int dsi_vc_write_common(struct omap_dss_device *dssdev,
> -			       int channel, u8 *data, int len,
> +			       int channel, const u8 *data, int len,
>  			       enum dss_dsi_content_type type)
>  {
>  	struct dsi_data *dsi = to_dsi_data(dssdev);
> @@ -2776,15 +2776,15 @@ static int dsi_vc_write_common(struct omap_dss_device *dssdev,
>  	return r;
>  }
>  
> -static int dsi_vc_dcs_write(struct omap_dss_device *dssdev, int channel, u8 *data,
> -		int len)
> +static int dsi_vc_dcs_write(struct omap_dss_device *dssdev, int channel,
> +		const u8 *data, int len)
>  {
>  	return dsi_vc_write_common(dssdev, channel, data, len,
>  			DSS_DSI_CONTENT_DCS);
>  }
>  
> -static int dsi_vc_generic_write(struct omap_dss_device *dssdev, int channel, u8 *data,
> -		int len)
> +static int dsi_vc_generic_write(struct omap_dss_device *dssdev, int channel,
> +		const u8 *data, int len)
>  {
>  	return dsi_vc_write_common(dssdev, channel, data, len,
>  			DSS_DSI_CONTENT_GENERIC);
> @@ -2810,7 +2810,7 @@ static int dsi_vc_dcs_send_read_request(struct dsi_data *dsi, int channel,
>  }
>  
>  static int dsi_vc_generic_send_read_request(struct dsi_data *dsi, int channel,
> -					    u8 *reqdata, int reqlen)
> +					    const u8 *reqdata, int reqlen)
>  {
>  	u16 data;
>  	u8 data_type;
> @@ -2983,7 +2983,7 @@ static int dsi_vc_dcs_read(struct omap_dss_device *dssdev, int channel, u8 dcs_c
>  }
>  
>  static int dsi_vc_generic_read(struct omap_dss_device *dssdev, int channel,
> -		u8 *reqdata, int reqlen, u8 *buf, int buflen)
> +		const u8 *reqdata, int reqlen, u8 *buf, int buflen)
>  {
>  	struct dsi_data *dsi = to_dsi_data(dssdev);
>  	int r;
> diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> index c4bc1f919ab4..8e96ab2f20b6 100644
> --- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
> +++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> @@ -309,18 +309,18 @@ struct omapdss_dsi_ops {
>  
>  	/* data transfer */
>  	int (*dcs_write)(struct omap_dss_device *dssdev, int channel,
> -			u8 *data, int len);
> +			const u8 *data, int len);
>  	int (*dcs_write_nosync)(struct omap_dss_device *dssdev, int channel,
> -			u8 *data, int len);
> +			const u8 *data, int len);
>  	int (*dcs_read)(struct omap_dss_device *dssdev, int channel, u8 dcs_cmd,
>  			u8 *data, int len);
>  
>  	int (*gen_write)(struct omap_dss_device *dssdev, int channel,
> -			u8 *data, int len);
> +			const u8 *data, int len);
>  	int (*gen_write_nosync)(struct omap_dss_device *dssdev, int channel,
> -			u8 *data, int len);
> +			const u8 *data, int len);
>  	int (*gen_read)(struct omap_dss_device *dssdev, int channel,
> -			u8 *reqdata, int reqlen,
> +			const u8 *reqdata, int reqlen,
>  			u8 *data, int len);
>  
>  	int (*bta_sync)(struct omap_dss_device *dssdev, int channel);

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
