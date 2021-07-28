Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B50D3D88C3
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 09:22:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE8116E328;
	Wed, 28 Jul 2021 07:22:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 298F06E328
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 07:22:30 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 9a9e1b3e-ef74-11eb-8d1a-0050568cd888;
 Wed, 28 Jul 2021 07:22:45 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 307D9194BA0;
 Wed, 28 Jul 2021 09:22:49 +0200 (CEST)
Date: Wed, 28 Jul 2021 09:22:26 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Subject: Re: [PATCH 10/14] drm/kmb: Enable ADV bridge after modeset
Message-ID: <YQEFsuhKt/bduf5Q@ravnborg.org>
References: <20210728003126.1425028-1-anitha.chrisanthus@intel.com>
 <20210728003126.1425028-10-anitha.chrisanthus@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210728003126.1425028-10-anitha.chrisanthus@intel.com>
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
Cc: edmund.j.dea@intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 27, 2021 at 05:31:22PM -0700, Anitha Chrisanthus wrote:
> On KMB, ADV bridge must be programmed and powered on prior to
> MIPI DSI HW initialization.
> 
> Fixes: 98521f4d4b4c ("drm/kmb: Mipi DSI part of the display driver")
> Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
> ---
>  drivers/gpu/drm/kmb/kmb_dsi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c b/drivers/gpu/drm/kmb/kmb_dsi.c
> index 5bc6c84073a3..1cca0fe6f35f 100644
> --- a/drivers/gpu/drm/kmb/kmb_dsi.c
> +++ b/drivers/gpu/drm/kmb/kmb_dsi.c
> @@ -1341,6 +1341,7 @@ static void connect_lcd_to_mipi(struct kmb_dsi *kmb_dsi)
>  		return;
>  	}
>  
> +	drm_bridge_chain_enable(adv_bridge);
This function is about to be deleted.

Please use the atomic variant drm_atomic_bridge_chain_enable()

Also, I cannot see why this display driver has to call this.
Something else seems missing here...

	Sam
