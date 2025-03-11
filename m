Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D192A5CF7A
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 20:33:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAF8A10E0B5;
	Tue, 11 Mar 2025 19:33:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="G6ZF0rBC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B68510E0B5
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 19:33:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1A6E65C5E9D;
 Tue, 11 Mar 2025 19:31:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2586C4CEE9;
 Tue, 11 Mar 2025 19:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741721608;
 bh=0eBZ3mKbc6FbHFU4M90DMSCxTvs8xVQcHIMudr/3iH8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G6ZF0rBC0uON6Bxk4pzSubjG+D7fEz5iFql20/A9fDOLyhhOz/epbP69jyqm0PVuW
 9Phr2qNIQDIwAmJHFJkhT7JGi54PqDXmdnQ5ync4Lg2z4I+zfI8e3lGS/YLWLk0waS
 uTzXwxKIOIVWlo0LR71FIrXaD7jKjlPzyc3vTXk4NfGdD2bNLjK9Jnbf5vmVEEO+D2
 mGqSjzh/KGehZeuwgXZ8xZE260ymuTUymhRAQyCKXLiLuZ/QhdKh044ZevNnv+BUJi
 3r63Go0jxaCgpNouGrpEz3JbB6QmMnZppk5h0cjGokhzSJveP6xEQtpR0b7EmxIjBE
 aiTXxBDpHb6MQ==
Date: Tue, 11 Mar 2025 21:33:23 +0200
From: Dmitry Baryshkov <lumag@kernel.org>
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 lujianhua000@gmail.com, quic_jesszhan@quicinc.com, dianders@chromium.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 asrivats@redhat.com
Subject: Re: [PATCH v3] drm/panel: novatek-nt36523: transition to mipi_dsi
 wrapped functions
Message-ID: <7q7qdqh3my37uvvgl6ygo6amrw4nf57mbnscmxx6wwu5fsntny@a2uedhwg2a6p>
References: <20250309040355.381386-1-tejasvipin76@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309040355.381386-1-tejasvipin76@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Mar 09, 2025 at 09:33:55AM +0530, Tejas Vipin wrote:
> Changes the novatek-nt36523 panel to use multi style functions for
> improved error handling.
> 
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
> Changes in v3:
>     - Remove mipi_dsi_dual_msleep
>     - Change mipi_dsi_dual_dcs_write_seq_multi to use the same dsi_ctx
>       by swapping the dsi accordingly.
> 
> Link to v2: https://lore.kernel.org/all/20250307091519.245889-1-tejasvipin76@gmail.com/
> 
> Changes in v2:
>     - Uses mipi_dsi_dual_msleep
>     - Changed mipi_dsi_dual_dcs_write_seq_multi to not equate accum_err
>       of either dsi_ctx.
> 
> Link to v1: https://lore.kernel.org/all/20250306134350.139792-1-tejasvipin76@gmail.com/
> ---
>  drivers/gpu/drm/panel/panel-novatek-nt36523.c | 1681 ++++++++---------
>  1 file changed, 821 insertions(+), 860 deletions(-)


[..]

> 
> @@ -1063,18 +1026,16 @@ static int nt36523_prepare(struct drm_panel *panel)
>  static int nt36523_disable(struct drm_panel *panel)
>  {
>  	struct panel_info *pinfo = to_panel_info(panel);
> -	int i, ret;
> +	int i;
>  
>  	for (i = 0; i < DSI_NUM_MIN + pinfo->desc->is_dual_dsi; i++) {
> -		ret = mipi_dsi_dcs_set_display_off(pinfo->dsi[i]);
> -		if (ret < 0)
> -			dev_err(&pinfo->dsi[i]->dev, "failed to set display off: %d\n", ret);
> +		mipi_dsi_dcs_set_display_off_multi(

-:1726: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#1726: FILE: drivers/gpu/drm/panel/panel-novatek-nt36523.c:1032:
+		mipi_dsi_dcs_set_display_off_multi(

> +			&(struct mipi_dsi_multi_context){.dsi = pinfo->dsi[i]});
>  	}
>  
>  	for (i = 0; i < DSI_NUM_MIN + pinfo->desc->is_dual_dsi; i++) {
> -		ret = mipi_dsi_dcs_enter_sleep_mode(pinfo->dsi[i]);
> -		if (ret < 0)
> -			dev_err(&pinfo->dsi[i]->dev, "failed to enter sleep mode: %d\n", ret);
> +		mipi_dsi_dcs_enter_sleep_mode_multi(

Same here. I think it might be cleaner to define a variable of struct
mipi_dsi_multi_context type and pass it here.

> +			&(struct mipi_dsi_multi_context){.dsi = pinfo->dsi[i]});
>  	}
>  
>  	msleep(70);
> -- 
> 2.48.1
> 

-- 
With best wishes
Dmitry
