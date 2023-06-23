Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F6F73BBFE
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 17:49:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CE2510E669;
	Fri, 23 Jun 2023 15:49:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5362410E669
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 15:49:24 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 395C0838;
 Fri, 23 Jun 2023 17:48:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1687535326;
 bh=B+HCtCbVdeoR7xbVap5Pedr+jgl7SnRDJw5vJm/gcUw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r3Wvgacw724k8Jza1TnDQMXRqCyux9eWvs5V8hkgNbje5Ow++FkWZ6HAndV8mTVri
 W65rqawOWnMbYcv1aF6ApRfQdm30yorzhR2DICmqz6sRjpKXvsQVr3kAyCUfBGh8tH
 om3DZa9UFl7RMxGdKCtSLbc50wYH8JJLx7GgVjWk=
Date: Fri, 23 Jun 2023 18:49:21 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 19/39] drm: renesas: shmobile: Convert container helpers
 to static inline functions
Message-ID: <20230623154921.GW2112@pendragon.ideasonboard.com>
References: <cover.1687423204.git.geert+renesas@glider.be>
 <63f1bef1f316175615a54490f752d64b7ddd29ab.1687423204.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <63f1bef1f316175615a54490f752d64b7ddd29ab.1687423204.git.geert+renesas@glider.be>
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
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

Thank you for the patch.

On Thu, Jun 22, 2023 at 11:21:31AM +0200, Geert Uytterhoeven wrote:
> Replace to conversion helper macros using container_of() by static
> inline functions, to improve type-safety.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c  | 11 ++++++++---
>  drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c |  5 ++++-
>  2 files changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> index 26611440f7a12715..40948b56017ff2df 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> @@ -291,7 +291,10 @@ static void shmob_drm_crtc_update_base(struct shmob_drm_crtc *scrtc)
>  	lcdc_write(sdev, LDRCNTR, lcdc_read(sdev, LDRCNTR) ^ LDRCNTR_MRS);
>  }
>  
> -#define to_shmob_crtc(c)	container_of(c, struct shmob_drm_crtc, crtc)
> +static inline struct shmob_drm_crtc *to_shmob_crtc(struct drm_crtc *crtc)
> +{
> +	return container_of(crtc, struct shmob_drm_crtc, crtc);
> +}
>  
>  static void shmob_drm_crtc_dpms(struct drm_crtc *crtc, int mode)
>  {
> @@ -571,8 +574,10 @@ int shmob_drm_encoder_create(struct shmob_drm_device *sdev)
>   * Connector
>   */
>  
> -#define to_shmob_connector(c) \
> -	container_of(c, struct shmob_drm_connector, connector)
> +static inline struct shmob_drm_connector *to_shmob_connector(struct drm_connector *connector)
> +{
> +	return container_of(connector, struct shmob_drm_connector, connector);
> +}
>  
>  static int shmob_drm_connector_get_modes(struct drm_connector *connector)
>  {
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> index 17e66a018689f648..258288c80756bf16 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> @@ -34,7 +34,10 @@ struct shmob_drm_plane {
>  	unsigned int crtc_h;
>  };
>  
> -#define to_shmob_plane(p)	container_of(p, struct shmob_drm_plane, plane)
> +static inline struct shmob_drm_plane *to_shmob_plane(struct drm_plane *plane)
> +{
> +	return container_of(plane, struct shmob_drm_plane, plane);
> +}
>  
>  static void shmob_drm_plane_compute_base(struct shmob_drm_plane *splane,
>  					 struct drm_framebuffer *fb,

-- 
Regards,

Laurent Pinchart
