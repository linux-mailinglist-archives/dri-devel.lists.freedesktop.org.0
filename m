Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A79495F82
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 14:14:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C1A410EB05;
	Fri, 21 Jan 2022 13:14:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 234EA10EB2B
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 13:14:04 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 10DD980FDE;
 Fri, 21 Jan 2022 14:14:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1642770842;
 bh=5c3D2H9MSFuRU5Y3TIAMKcHEMUBroi271QnH6qHadhE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Uk4WlUkpXJPjqTp69ikKSMfqAAS35MccSkKKEglQgsXtAusHnJ99nc1DzeNc5QNhy
 hQUZd0IcmZYb5Zmw2NM3wqyDmHgexrh4hXGZVMIkR53bIPNvppGXYSZAeRRBMhsj7f
 6vp5vosnSV/rOUq00MDfmZrRlxmrxKZzZv9srbnx/wFabK1M1OrtM3AKuszKg67cpQ
 N3K6YsDrQUWUVqlhQOFctsnRmCdmsDYdwGohhUAvIl38oknVYj8sVeXnv4LbJIOv7X
 NFJYzv4qhV/V5TTqJjiIaW5othFbO4oCa7PLAFQWuYKbPGtBgDkta/II8Dp5CrwTpu
 1U3imSzbTURAA==
Message-ID: <4d3654b5-9a87-1c02-f2d9-d0974e628c20@denx.de>
Date: Fri, 21 Jan 2022 14:14:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/1] drm: mxsfb: Fix NULL pointer dereference
Content-Language: en-US
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Stefan Agner <stefan@agner.ch>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20220121131238.507567-1-alexander.stein@ew.tq-group.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220121131238.507567-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/21/22 14:12, Alexander Stein wrote:
> Do not deference the NULL pointer if the bridge does not return a
> bridge state. Assume a fixed format instead.
> 
> Fixes: commit b776b0f00f24 ("drm: mxsfb: Use bus_format from the nearest bridge if present")
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> This can happen if a "ti,sn75lvds83", "lvds-encoder" bridge is attached
> to it. atomic_get_input_bus_fmts is only implemented for the
> lvds-decoder case.
> 
>   drivers/gpu/drm/mxsfb/mxsfb_kms.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> index 0655582ae8ed..4cfb6c001679 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> @@ -361,7 +361,11 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
>   		bridge_state =
>   			drm_atomic_get_new_bridge_state(state,
>   							mxsfb->bridge);
> -		bus_format = bridge_state->input_bus_cfg.format;
> +		if (!bridge_state)
> +			bus_format = MEDIA_BUS_FMT_FIXED;
> +		else
> +			bus_format = bridge_state->input_bus_cfg.format;
> +
>   		if (bus_format == MEDIA_BUS_FMT_FIXED) {
>   			dev_warn_once(drm->dev,
>   				      "Bridge does not provide bus format, assuming MEDIA_BUS_FMT_RGB888_1X24.\n"


Shouldn't this be fixed on the bridge driver side instead ?

Which bridge driver do you use ?
