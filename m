Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A71B992763
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 10:45:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C73110E057;
	Mon,  7 Oct 2024 08:45:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="b5CwIsFW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07EB610E057
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 08:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=a0tsOAj+kyeCqImUXkb/Q+zUAC3TvPLsRVfobys8ViY=; b=b5CwIsFWmzorgcp4mC/EaBZqtX
 QKoAYewiMezqoqUKYGnDwsItu/x2+BbRaXoyAvsIOMj9KvBINxkN5SOh810xFQJ/OelrJUZ1R7eoc
 FnKWzJwJfVGJSvdwo/rzrsfzpDUw6A7Qos0Q8YLHAlMyfQcezlRUqB0Hkgf+BFOGZsFfa74woglj1
 IrsiYz7+K+Wr3XONgfeghfy434LtZ4DTFcSKTBiF9f7+lHoGMLpIOAff2x0k4U2it4c/IwgW2mogC
 mkPnw4dW73h2tzSiP3isePPmKsDZ1/kmnW5P+aYiqEc2rz9aT5YFwLhfA+IImkXbVNozDZTSGKm3E
 x17RRcNQ==;
Received: from 62-178-82-42.cable.dynamic.surfer.at ([62.178.82.42]
 helo=[192.168.1.12]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1sxjMX-0064Ae-0u; Mon, 07 Oct 2024 10:45:05 +0200
Message-ID: <1e59730e-d5ce-4535-847b-f0831dc9f267@igalia.com>
Date: Mon, 7 Oct 2024 10:45:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/vc4: Use `vc4_perfmon_find()`
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 "Juan A . Suarez Romero" <jasuarez@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20241004123817.890016-1-mcanal@igalia.com>
Content-Language: en-US
From: Christian Gmeiner <cgmeiner@igalia.com>
In-Reply-To: <20241004123817.890016-1-mcanal@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


> Similar to commit f2a4bcb25328 ("drm/v3d: Use v3d_perfmon_find()"),
> replace the open-coded `vc4_perfmon_find()` with the real thing.
> 
> Cc: Christian Gmeiner <cgmeiner@igalia.com>
> Signed-off-by: Maíra Canal <mcanal@igalia.com>

Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>

> ---
>   drivers/gpu/drm/vc4/vc4_perfmon.c | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_perfmon.c b/drivers/gpu/drm/vc4/vc4_perfmon.c
> index 4cd3643c3ba7..f2e56d0f6298 100644
> --- a/drivers/gpu/drm/vc4/vc4_perfmon.c
> +++ b/drivers/gpu/drm/vc4/vc4_perfmon.c
> @@ -236,11 +236,7 @@ int vc4_perfmon_get_values_ioctl(struct drm_device *dev, void *data,
>   		return -ENODEV;
>   	}
>   
> -	mutex_lock(&vc4file->perfmon.lock);
> -	perfmon = idr_find(&vc4file->perfmon.idr, req->id);
> -	vc4_perfmon_get(perfmon);
> -	mutex_unlock(&vc4file->perfmon.lock);
> -
> +	perfmon = vc4_perfmon_find(vc4file, req->id);
>   	if (!perfmon)
>   		return -EINVAL;
>   

-- 
Thanks & Regards,
Christian

