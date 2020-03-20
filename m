Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A92BF18CDE0
	for <lists+dri-devel@lfdr.de>; Fri, 20 Mar 2020 13:28:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08CC76EB1C;
	Fri, 20 Mar 2020 12:28:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDE726EB1C
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Mar 2020 12:28:37 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 125CA80539;
 Fri, 20 Mar 2020 13:28:32 +0100 (CET)
Date: Fri, 20 Mar 2020 13:28:31 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH] drm/mipi-dbi: Make mipi_dbi_command_stackbuf() data
 parameter const
Message-ID: <20200320122831.GA20506@ravnborg.org>
References: <20200316164249.6234-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200316164249.6234-1-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=e5mUnYsNAAAA:8
 a=4c20t3np8WmgWqa05fwA:9 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
 a=pHzHmUro8NiASowvMSCR:22 a=Ew2E2A-JSTLzCXPT_086:22
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Noralf.

On Mon, Mar 16, 2020 at 05:42:49PM +0100, Geert Uytterhoeven wrote:
> mipi_dbi_command_stackbuf() copies the passed buffer data, so it can be
> const.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

OK to merge?
Looks good to me and build did not break.

	Sam

> ---
>  drivers/gpu/drm/drm_mipi_dbi.c | 3 ++-
>  include/drm/drm_mipi_dbi.h     | 5 +++--
>  2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
> index 558baf989f5a8432..89e911ccea06cf99 100644
> --- a/drivers/gpu/drm/drm_mipi_dbi.c
> +++ b/drivers/gpu/drm/drm_mipi_dbi.c
> @@ -169,7 +169,8 @@ int mipi_dbi_command_buf(struct mipi_dbi *dbi, u8 cmd, u8 *data, size_t len)
>  EXPORT_SYMBOL(mipi_dbi_command_buf);
>  
>  /* This should only be used by mipi_dbi_command() */
> -int mipi_dbi_command_stackbuf(struct mipi_dbi *dbi, u8 cmd, u8 *data, size_t len)
> +int mipi_dbi_command_stackbuf(struct mipi_dbi *dbi, u8 cmd, const u8 *data,
> +			      size_t len)
>  {
>  	u8 *buf;
>  	int ret;
> diff --git a/include/drm/drm_mipi_dbi.h b/include/drm/drm_mipi_dbi.h
> index 33f325f5af2b921f..9333b9086c30bd3c 100644
> --- a/include/drm/drm_mipi_dbi.h
> +++ b/include/drm/drm_mipi_dbi.h
> @@ -170,7 +170,8 @@ int mipi_dbi_spi_transfer(struct spi_device *spi, u32 speed_hz,
>  
>  int mipi_dbi_command_read(struct mipi_dbi *dbi, u8 cmd, u8 *val);
>  int mipi_dbi_command_buf(struct mipi_dbi *dbi, u8 cmd, u8 *data, size_t len);
> -int mipi_dbi_command_stackbuf(struct mipi_dbi *dbi, u8 cmd, u8 *data, size_t len);
> +int mipi_dbi_command_stackbuf(struct mipi_dbi *dbi, u8 cmd, const u8 *data,
> +			      size_t len);
>  int mipi_dbi_buf_copy(void *dst, struct drm_framebuffer *fb,
>  		      struct drm_rect *clip, bool swap);
>  /**
> @@ -187,7 +188,7 @@ int mipi_dbi_buf_copy(void *dst, struct drm_framebuffer *fb,
>   */
>  #define mipi_dbi_command(dbi, cmd, seq...) \
>  ({ \
> -	u8 d[] = { seq }; \
> +	const u8 d[] = { seq }; \
>  	mipi_dbi_command_stackbuf(dbi, cmd, d, ARRAY_SIZE(d)); \
>  })
>  
> -- 
> 2.17.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
