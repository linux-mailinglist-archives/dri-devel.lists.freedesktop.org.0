Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84622BA3461
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 12:03:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B05110E2ED;
	Fri, 26 Sep 2025 10:03:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="lwll2ny2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8849010E2ED
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 10:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1758881005;
 bh=kF/ob4umFP9kKPgy5tMXsyqO93WOIy3ot+pLXGSH27U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lwll2ny24Ng1P/EnBLpX5SjIpwOve83e3swU8JB6qOmb6wd1hxotwptrhelEAPBDh
 XCiVQHFHmhIGe+8I/si8LRQTk5RgjLAGaAcQEdLNnpLISiCUSSBkUT4Vnz3apV5l8n
 c/rogoZlpxgrifva5FXMfIQwGWu+WwyJm43W2+4dpqXC1O6teeSyjY8SkLfsogwTlj
 VbhuIIWuHPe5SQZVAFAI1Nqv1RTXA3WU1PtMRNdyXHKGUgFSRwCGCDO7Plt4dQpHBm
 Wp/oeMEMT1B5s09EioVTT2Zfv0zBaLGEB1mdoVFAqL3HcXwpH5bDdUNjz0fRRaSQpC
 /v0rKcurvYq3w==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9D8EF17E12C9;
 Fri, 26 Sep 2025 12:03:24 +0200 (CEST)
Date: Fri, 26 Sep 2025 12:03:11 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rain Yang <jiyu.yang@oss.nxp.com>
Cc: steven.price@arm.com, liviu.dudau@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.co, simona@ffwll.ch, marek.vasut@mailbox.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, Rain Yang <jiyu.yang@nxp.com>
Subject: Re: [PATCH v1] drm/panthor: skip regulator setup if no such prop
Message-ID: <20250926120311.33dc9fb1@fedora>
In-Reply-To: <20250926090722.23097-1-jiyu.yang@oss.nxp.com>
References: <20250926090722.23097-1-jiyu.yang@oss.nxp.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 26 Sep 2025 17:07:22 +0800
Rain Yang <jiyu.yang@oss.nxp.com> wrote:

> From: Rain Yang <jiyu.yang@nxp.com>
> 
> The regulator is optional, skip the setup instead of returning an
> error if it is not present

AFAICT, it's not flagged optional in the DT bindings yet, so I'd prefer
to have this change and the DT bindings update in the same patch series
(both will go through the drm-misc tree anway).

> 
> Signed-off-by: Rain Yang <jiyu.yang@nxp.com>
> ---
>  drivers/gpu/drm/panthor/panthor_devfreq.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/panthor/panthor_devfreq.c
> index 3686515d368d..2df1d76d84a0 100644
> --- a/drivers/gpu/drm/panthor/panthor_devfreq.c
> +++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
> @@ -146,10 +146,9 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
>  	ptdev->devfreq = pdevfreq;
>  
>  	ret = devm_pm_opp_set_regulators(dev, reg_names);
> -	if (ret) {
> +	if (ret && ret != -ENODEV) {
>  		if (ret != -EPROBE_DEFER)
>  			DRM_DEV_ERROR(dev, "Couldn't set OPP regulators\n");
> -
>  		return ret;
>  	}
>  

