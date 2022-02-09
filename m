Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF784AEEEE
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 11:07:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95F8E10E6E9;
	Wed,  9 Feb 2022 10:07:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44D6510E6E9
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 10:07:41 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nHjsx-00068n-7I; Wed, 09 Feb 2022 11:07:39 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nHjsu-0001wJ-AP; Wed, 09 Feb 2022 11:07:36 +0100
Date: Wed, 9 Feb 2022 11:07:36 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: David Airlie <airlied@linux.ie>
Subject: Re: [PATCH v5 01/23] drm/encoder: Add of_graph port to struct
 drm_encoder
Message-ID: <20220209100736.GV18637@pengutronix.de>
References: <20220209095350.2104049-1-s.hauer@pengutronix.de>
 <20220209095350.2104049-2-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220209095350.2104049-2-s.hauer@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 10:57:24 up 60 days, 18:42, 83 users,  load average: 0.77, 0.40, 0.27
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Peter Geis <pgwipeout@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

David, Daniel,

I'll need a word from you regarding this patch. It's needed in patch
22/23 in this series.
vop2_crtc_atomic_enable() needs to control the mux which routes the
display output to the different encoders. Which encoder is used is
described in the of_graph port, so I need a way to identify the encoder
in the device tree.

Sascha

On Wed, Feb 09, 2022 at 10:53:28AM +0100, Sascha Hauer wrote:
> Add a device node to drm_encoder which corresponds with the port node
> in the DT description of the encoder. This allows drivers to find the
> of_graph link between a crtc and an encoder.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  include/drm/drm_encoder.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/drm/drm_encoder.h b/include/drm/drm_encoder.h
> index 6e91a0280f31..3acd054b1eb3 100644
> --- a/include/drm/drm_encoder.h
> +++ b/include/drm/drm_encoder.h
> @@ -99,6 +99,8 @@ struct drm_encoder {
>  	struct drm_device *dev;
>  	struct list_head head;
>  
> +	struct device_node *port;
> +
>  	struct drm_mode_object base;
>  	char *name;
>  	/**
> -- 
> 2.30.2
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
