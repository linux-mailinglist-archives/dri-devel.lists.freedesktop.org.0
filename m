Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BEA61400F
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 22:43:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DD1A10E180;
	Mon, 31 Oct 2022 21:43:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC62510E180
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 21:43:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 022326126D;
 Mon, 31 Oct 2022 21:43:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C637C433D6;
 Mon, 31 Oct 2022 21:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667252625;
 bh=OV+Emfko/aFFz96PUD3FSyolO7/BrZKHPhq8GdChW9o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W0spE6FALWLJtsYHwaHO7/Yws6RX4KlSswjZatRmnm29lrHDh4/6AYgE4jGwnUeLW
 kBbKOaUFcy+XddKd7sPxBP9DxS/8bVPsD5aplkdPm+U6gDOgAxZDSs0KznjFoCauW8
 2z6gLOoyIolq6X0Tq95hHVl1L3P19FaDKVevToISvq0zA2E+e2IFUtCpFNqLUV/l5Q
 k11Jwzy4As3PhzHpep2HtaLhdqVytLKwPFtkEYaj/KWkRLn2rmWanLZugwZgz+VJFn
 UOCUGau53ESCwDqORoMiBKsxr+ZCSQK/9FKPutr/9HVQI5sxYQ3r7O+6sp2oQXN/MS
 PwPqd93L95xmQ==
Date: Mon, 31 Oct 2022 14:43:42 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nathan Huckleberry <nhuck@google.com>
Subject: Re: [PATCH] drm/imx: imx-tve: Fix return type of
 imx_tve_connector_mode_valid
Message-ID: <Y2BBjhdk2ZIe9RGp@dev-arch.thelio-3990X>
References: <20220913205544.155106-1-nhuck@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220913205544.155106-1-nhuck@google.com>
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
Cc: Dan Carpenter <error27@gmail.com>, David Airlie <airlied@linux.ie>,
 Sascha Hauer <s.hauer@pengutronix.de>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Tom Rix <trix@redhat.com>, Shawn Guo <shawnguo@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 13, 2022 at 01:55:44PM -0700, Nathan Huckleberry wrote:
> The mode_valid field in drm_connector_helper_funcs is expected to be of
> type:
> enum drm_mode_status (* mode_valid) (struct drm_connector *connector,
>                                      struct drm_display_mode *mode);
> 
> The mismatched return type breaks forward edge kCFI since the underlying
> function definition does not match the function hook definition.
> 
> The return type of imx_tve_connector_mode_valid should be changed from
> int to enum drm_mode_status.
> 
> Reported-by: Dan Carpenter <error27@gmail.com>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1703
> Cc: llvm@lists.linux.dev
> Signed-off-by: Nathan Huckleberry <nhuck@google.com>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Can someone pick this up? It resolves a new work-in-progress clang
warning that we would like to turn on for the kernel:

  drivers/gpu/drm/imx/imx-tve.c:320:16: error: incompatible function pointer types initializing 'enum drm_mode_status (*)(struct drm_connector *, struct drm_display_mode *)' with an expression of type 'int (struct drm_connector *, struct drm_display_mode *)' [-Werror,-Wincompatible-function-pointer-types-strict]
          .mode_valid = imx_tve_connector_mode_valid,
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
  1 error generated.

> ---
>  drivers/gpu/drm/imx/imx-tve.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/imx/imx-tve.c b/drivers/gpu/drm/imx/imx-tve.c
> index 6b34fac3f73a..ab4d1c878fda 100644
> --- a/drivers/gpu/drm/imx/imx-tve.c
> +++ b/drivers/gpu/drm/imx/imx-tve.c
> @@ -218,8 +218,9 @@ static int imx_tve_connector_get_modes(struct drm_connector *connector)
>  	return ret;
>  }
>  
> -static int imx_tve_connector_mode_valid(struct drm_connector *connector,
> -					struct drm_display_mode *mode)
> +static enum drm_mode_status
> +imx_tve_connector_mode_valid(struct drm_connector *connector,
> +			     struct drm_display_mode *mode)
>  {
>  	struct imx_tve *tve = con_to_tve(connector);
>  	unsigned long rate;
> -- 
> 2.37.2.789.g6183377224-goog
> 
> 
