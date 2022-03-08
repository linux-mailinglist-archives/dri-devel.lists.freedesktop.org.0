Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A25374D123A
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 09:28:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEEF910ED68;
	Tue,  8 Mar 2022 08:28:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D46E810ED68
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 08:28:45 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7F8EA6115A;
 Tue,  8 Mar 2022 08:28:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF1B3C340EB;
 Tue,  8 Mar 2022 08:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646728122;
 bh=LmTt6qQQP0XkYMoZQar+hciBceY5wUpzOfDL2qp0/aM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Ym3sMQo1fM9JBon0wFT7Wa73ahE9ARjcD6RcFSbFx3hvgRMcXBozrZ3thvNugBiW+
 4S959oBIjdUUQL2bTr+1EsVDvnF8BowDy7GX1InlAYCgUn0+MVqgeD5Q8xz2/RHhiF
 JisOY97woHkFCvsErLBE+NhYY4jlNN2CEJ9CgFtYi6FQADYVogFMezVyD8zrnpNvmo
 gONNPoQ3Wgii6+RraFfNKaBMKvMqRDktFbKUCcp9ZyVrDO06Sgm/eKEgaZytyyMayN
 3TQQAyoyuk25YCgCegLtMsQQ7CYyWTUfGGNQSftpdrpi5uTwRdoG7EEXvrjXRu0FaP
 m3NFlZclSdopQ==
Message-ID: <ef9575ab-d566-908f-9a45-291207316266@kernel.org>
Date: Tue, 8 Mar 2022 10:28:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/omap: fix NULL but dereferenced coccicheck error
Content-Language: en-US
To: Wan Jiabing <wanjiabing@vivo.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20220307095612.409090-1-wanjiabing@vivo.com>
From: Tomi Valkeinen <tomba@kernel.org>
In-Reply-To: <20220307095612.409090-1-wanjiabing@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: kael_w@qq.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 07/03/2022 11:56, Wan Jiabing wrote:
> Fix the following coccicheck warning:
> ./drivers/gpu/drm/omapdrm/omap_overlay.c:89:22-25: ERROR: r_ovl is NULL
> but dereferenced.
> 
> Here should be ovl->idx rather than r_ovl->idx.
> 
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
> ---
>   drivers/gpu/drm/omapdrm/omap_overlay.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/omap_overlay.c b/drivers/gpu/drm/omapdrm/omap_overlay.c
> index 10730c9b2752..b0bc9ad2ef73 100644
> --- a/drivers/gpu/drm/omapdrm/omap_overlay.c
> +++ b/drivers/gpu/drm/omapdrm/omap_overlay.c
> @@ -86,7 +86,7 @@ int omap_overlay_assign(struct drm_atomic_state *s, struct drm_plane *plane,
>   		r_ovl = omap_plane_find_free_overlay(s->dev, overlay_map,
>   						     caps, fourcc);
>   		if (!r_ovl) {
> -			overlay_map[r_ovl->idx] = NULL;
> +			overlay_map[ovl->idx] = NULL;
>   			*overlay = NULL;
>   			return -ENOMEM;
>   		}

Thanks, I'll pick this up.

  Tomi
