Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5675A8CC484
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 17:53:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECB5610E240;
	Wed, 22 May 2024 15:53:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IelD6NNy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAD9B10E240
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 15:53:36 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BBF1BC67;
 Wed, 22 May 2024 17:53:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1716393202;
 bh=A/ZS2NtINBxthxwqs5PcU2EkST+CNjfZ5b8/iFOfEhU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IelD6NNycUfvoHK84yZHpxTn7nh6WN1bSc/gKsWdz6CnuXUTf38HWwaPvr6+f46Ev
 fjdBnlhyT0LQC+YAMTDIFZiq82rAMQu7V+IdNFjhjB2SHACSsutM/PVjn7kdz7liPg
 7gHxp3CUdzihFfVj4PCTsnbiMKo42t2Ig5Ag5XDQ=
Date: Wed, 22 May 2024 18:53:26 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Michal Simek <michal.simek@amd.com>,
 Sean Anderson <sean.anderson@linux.dev>,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Subject: Re: [PATCH] drm: zynqmp_dpsub: Fix an error handling path in
 zynqmp_dpsub_probe()
Message-ID: <20240522155326.GC9789@pendragon.ideasonboard.com>
References: <974d1b062d7c61ee6db00d16fa7c69aa1218ee02.1716198025.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <974d1b062d7c61ee6db00d16fa7c69aa1218ee02.1716198025.git.christophe.jaillet@wanadoo.fr>
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

Hi Christophe,

Thank you for the patch.

On Mon, May 20, 2024 at 11:40:37AM +0200, Christophe JAILLET wrote:
> If zynqmp_dpsub_drm_init() fails, we must undo the previous
> drm_bridge_add() call.
> 
> Fixes: be3f3042391d ("drm: zynqmp_dpsub: Always register bridge")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Compile tested only
> ---
>  drivers/gpu/drm/xlnx/zynqmp_dpsub.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> index face8d6b2a6f..f5781939de9c 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> @@ -269,6 +269,7 @@ static int zynqmp_dpsub_probe(struct platform_device *pdev)
>  	return 0;
>  
>  err_disp:
> +	drm_bridge_remove(dpsub->bridge);
>  	zynqmp_disp_remove(dpsub);
>  err_dp:
>  	zynqmp_dp_remove(dpsub);

-- 
Regards,

Laurent Pinchart
