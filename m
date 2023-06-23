Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7B573BD89
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 19:12:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADEAC10E687;
	Fri, 23 Jun 2023 17:12:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0FEE10E687
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 17:12:45 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B136E838;
 Fri, 23 Jun 2023 19:12:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1687540327;
 bh=Q2Cw1ygD0gWexI2pL2Jb6NsRmnG74wmibJoVnNEtGqA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RcwFBWaG+x5aska6fzT3PEjfRqJK8px1iFW4jcdr3q/9DrRZ6G5DdXBMmYrCGdjd6
 r3aavajnfTodKNNqpqQix2RkKMx5kLp1nO2VCWr1LqKjmuUkha3Dps11i8Caykieff
 Wb5FVvEamAlYwsqVLvsOdXqlyUhuQToJxJqkxnmY=
Date: Fri, 23 Jun 2023 20:12:43 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 33/39] drm: renesas: shmobile: Cleanup encoder
Message-ID: <20230623171243.GK2112@pendragon.ideasonboard.com>
References: <cover.1687423204.git.geert+renesas@glider.be>
 <736a0b26a9393f82769b185e2daa30eb128ff240.1687423204.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <736a0b26a9393f82769b185e2daa30eb128ff240.1687423204.git.geert+renesas@glider.be>
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

On Thu, Jun 22, 2023 at 11:21:45AM +0200, Geert Uytterhoeven wrote:
> Most unused callbacks can be NULL pointers these days.
> Drop a bunch of empty encoder callbacks.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  .../gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 26 -------------------
>  1 file changed, 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> index b184019d8b1ed89c..ef327da39bca415a 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> @@ -586,11 +586,6 @@ int shmob_drm_crtc_create(struct shmob_drm_device *sdev)
>   * Encoder
>   */
>  
> -static void shmob_drm_encoder_dpms(struct drm_encoder *encoder, int mode)
> -{
> -	/* No-op, everything is handled in the CRTC code. */
> -}
> -
>  static bool shmob_drm_encoder_mode_fixup(struct drm_encoder *encoder,
>  					 const struct drm_display_mode *mode,
>  					 struct drm_display_mode *adjusted_mode)
> @@ -613,29 +608,8 @@ static bool shmob_drm_encoder_mode_fixup(struct drm_encoder *encoder,
>  	return true;
>  }
>  
> -static void shmob_drm_encoder_mode_prepare(struct drm_encoder *encoder)
> -{
> -	/* No-op, everything is handled in the CRTC code. */
> -}
> -
> -static void shmob_drm_encoder_mode_set(struct drm_encoder *encoder,
> -				       struct drm_display_mode *mode,
> -				       struct drm_display_mode *adjusted_mode)
> -{
> -	/* No-op, everything is handled in the CRTC code. */
> -}
> -
> -static void shmob_drm_encoder_mode_commit(struct drm_encoder *encoder)
> -{
> -	/* No-op, everything is handled in the CRTC code. */
> -}
> -
>  static const struct drm_encoder_helper_funcs encoder_helper_funcs = {
> -	.dpms = shmob_drm_encoder_dpms,
>  	.mode_fixup = shmob_drm_encoder_mode_fixup,
> -	.prepare = shmob_drm_encoder_mode_prepare,
> -	.commit = shmob_drm_encoder_mode_commit,
> -	.mode_set = shmob_drm_encoder_mode_set,
>  };
>  
>  int shmob_drm_encoder_create(struct shmob_drm_device *sdev)

-- 
Regards,

Laurent Pinchart
