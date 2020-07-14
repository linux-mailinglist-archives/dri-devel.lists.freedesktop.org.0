Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 296FE2205AA
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jul 2020 09:00:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B92696E43B;
	Wed, 15 Jul 2020 06:59:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 490 seconds by postgrey-1.36 at gabe;
 Tue, 14 Jul 2020 13:48:44 UTC
Received: from unicorn.mansr.com (unicorn.mansr.com [81.2.72.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DF766E14F
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 13:48:44 +0000 (UTC)
Received: by unicorn.mansr.com (Postfix, from userid 65534)
 id DA23615363; Tue, 14 Jul 2020 14:40:32 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on unicorn.mansr.com
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=unavailable
 autolearn_force=no version=3.4.4
Received: from raven.mansr.com (raven.mansr.com [IPv6:2001:8b0:ca0d:8d8e::3])
 by unicorn.mansr.com (Postfix) with ESMTPS id 42A1F15360;
 Tue, 14 Jul 2020 14:40:32 +0100 (BST)
Received: by raven.mansr.com (Postfix, from userid 51770)
 id 392E321A6F3; Tue, 14 Jul 2020 14:40:32 +0100 (BST)
From: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
To: Chen-Yu Tsai <wens@kernel.org>
Subject: Re: [PATCH] drm: sun4i: hdmi: Fix inverted HPD result
References: <20200711011030.21997-1-wens@kernel.org>
Date: Tue, 14 Jul 2020 14:40:32 +0100
In-Reply-To: <20200711011030.21997-1-wens@kernel.org> (Chen-Yu Tsai's message
 of "Sat, 11 Jul 2020 09:10:30 +0800")
Message-ID: <yw1x5zaqnrjj.fsf@mansr.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 15 Jul 2020 06:59:56 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Chen-Yu Tsai <wens@kernel.org> writes:

> From: Chen-Yu Tsai <wens@csie.org>
>
> When the extra HPD polling in sun4i_hdmi was removed, the result of
> HPD was accidentally inverted.
>
> Fix this by inverting the check.
>
> Fixes: bda8eaa6dee7 ("drm: sun4i: hdmi: Remove extra HPD polling")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Tested-by: Mans Rullgard <mans@mansr.com>

> ---
>
> Sorry for the screw-up.
>
> ---
>  drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun=
4i/sun4i_hdmi_enc.c
> index 557cbe5ab35f..2f2c9f0a1071 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> @@ -260,7 +260,7 @@ sun4i_hdmi_connector_detect(struct drm_connector *con=
nector, bool force)
>  	unsigned long reg;
>
>  	reg =3D readl(hdmi->base + SUN4I_HDMI_HPD_REG);
> -	if (reg & SUN4I_HDMI_HPD_HIGH) {
> +	if (!(reg & SUN4I_HDMI_HPD_HIGH)) {
>  		cec_phys_addr_invalidate(hdmi->cec_adap);
>  		return connector_status_disconnected;
>  	}
> -- =

> 2.27.0
>

-- =

M=E5ns Rullg=E5rd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
