Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7794BC96EE
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 16:08:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A80310EA65;
	Thu,  9 Oct 2025 14:08:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ED8590oe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8C5A10EA62
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 14:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760018905;
 bh=98imV8lVIGk8WyTK8tvGhNb5OZS/YSt24Kf6BNRUYh8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ED8590oeT4HT+FpBMjy+Ea9QNtoh2UjrenScteN4Tn0y1DNiJ5BGtlY5Xc9QZykwF
 Qt9u3HvVig+fCJzwXKemxkiEzZbechh5k5xoh8BP0su+qf+6jnfdQO1auZOCfWw6EJ
 vqAKkpamcQrIBE+WsipIvUIbBZJN5moiqX8Xg1U5iRoL3rApzvYtehxi5uP8Udsfe8
 2D/FEm+qYDXrvlPVfI2bj3Be0n3Piq4Cb9b6BEOrK9UWbaLwIOkxoHT0kn0gPLEEPX
 HPEVCvpQthkSOvshCH8xVm4s1U6N8cZv6n/hxrgaMFk0gXFgzgLgY3keaERQshm+8X
 83UiQ+mGXeBRA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id E9E4D17E0CF8;
 Thu,  9 Oct 2025 16:08:24 +0200 (CEST)
Date: Thu, 9 Oct 2025 16:08:20 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rain Yang <jiyu.yang@oss.nxp.com>
Cc: imx@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, steven.price@arm.com, liviu.dudau@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, Rain Yang <jiyu.yang@nxp.com>, Prabhu
 Sundararaj <prabhu.sundararaj@nxp.com>
Subject: Re: [PATCH] drm/panthor: attach the driver's multiple power domains
Message-ID: <20251009160820.74f04ead@fedora>
In-Reply-To: <20251009140039.101189-1-jiyu.yang@oss.nxp.com>
References: <20251009140039.101189-1-jiyu.yang@oss.nxp.com>
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

On Thu,  9 Oct 2025 22:00:39 +0800
Rain Yang <jiyu.yang@oss.nxp.com> wrote:

> From: Rain Yang <jiyu.yang@nxp.com>
> 
> Some platforms, such as i.MX95, utilize multiple power domains that need
> to be attached explicitly. This patch ensures that the driver properly
> attaches all available power domains using devm_pm_domain_attach_list().
> 
> Signed-off-by: Prabhu Sundararaj <prabhu.sundararaj@nxp.com>
> Signed-off-by: Rain Yang <jiyu.yang@nxp.com>
> ---
>  drivers/gpu/drm/panthor/panthor_device.c | 6 ++++++
>  drivers/gpu/drm/panthor/panthor_device.h | 2 ++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> index f0b2da5b2b96..6f40d053b16c 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -218,6 +218,12 @@ int panthor_device_init(struct panthor_device *ptdev)
>  	if (ret)
>  		return ret;
>  
> +	ret = devm_pm_domain_attach_list(ptdev->base.dev, NULL, &ptdev->pd_list);
> +	if (ret < 0) {
> +		drm_err(&ptdev->base, "attach power domains failed, ret=%d", ret);
> +		return ret;
> +	}
> +
>  	ret = panthor_devfreq_init(ptdev);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> index 4fc7cf2aeed5..5ecb541ec67b 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -196,6 +196,8 @@ struct panthor_device {
>  		/** @recovery_needed: True when a resume attempt failed. */
>  		atomic_t recovery_needed;
>  	} pm;

Add a blank line here.

> +	/** @pm: Power management related data. */
> +	struct dev_pm_domain_list  *pd_list;
>  

Do we even need to keep the pd_list in panthor_device if we don't do
anything with it?

>  	/** @profile_mask: User-set profiling flags for job accounting. */
>  	u32 profile_mask;

