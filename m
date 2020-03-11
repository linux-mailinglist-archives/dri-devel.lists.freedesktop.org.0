Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA4B181986
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 14:21:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 079846E434;
	Wed, 11 Mar 2020 13:21:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E3D76E434
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 13:21:55 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7624B21655;
 Wed, 11 Mar 2020 13:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583932914;
 bh=5y8xGr0LyTBUCWo725QctGIq4zafP/QOt9DMF+QjAfE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NkDcCuPyYEZGcrv86SLVQuguuW/E1m1gK0iIkKbNL9o8fOIKzhybZvUdFI0FoYYBg
 zqcCPzewilogs4PgMZZcioeyPfWsvxlozdCu7QSRVBVNsmwGK5JX46enBEMtyAw64m
 qwqPIu0Dm+p4YZF6UcbDKligOMnWJIrXvD7HUVAE=
Date: Wed, 11 Mar 2020 14:21:52 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Subject: Re: [PATCH] DRM: ARC: PGU: interlaced mode not supported
Message-ID: <20200311132152.GA3902788@kroah.com>
References: <20200311131310.20446-1-Eugeniy.Paltsev@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200311131310.20446-1-Eugeniy.Paltsev@synopsys.com>
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
Cc: David Airlie <airlied@linux.ie>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 linux-snps-arc@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 11, 2020 at 04:13:10PM +0300, Eugeniy Paltsev wrote:
> Filter out interlaced modes as they are not supported by ARC PGU
> hardware.
> 
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> ---
>  drivers/gpu/drm/arc/arcpgu_crtc.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/arc/arcpgu_crtc.c b/drivers/gpu/drm/arc/arcpgu_crtc.c
> index 8ae1e1f97a73..c854066d4c75 100644
> --- a/drivers/gpu/drm/arc/arcpgu_crtc.c
> +++ b/drivers/gpu/drm/arc/arcpgu_crtc.c
> @@ -67,6 +67,9 @@ static enum drm_mode_status arc_pgu_crtc_mode_valid(struct drm_crtc *crtc,
>  	long rate, clk_rate = mode->clock * 1000;
>  	long diff = clk_rate / 200; /* +-0.5% allowed by HDMI spec */
>  
> +	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
> +		return MODE_NO_INTERLACE;
> +
>  	rate = clk_round_rate(arcpgu->clk, clk_rate);
>  	if ((max(rate, clk_rate) - min(rate, clk_rate) < diff) && (rate > 0))
>  		return MODE_OK;
> -- 
> 2.21.1
> 

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
