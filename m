Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E12F65E8DB
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 11:21:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C352810E6D4;
	Thu,  5 Jan 2023 10:21:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85AF810E6D4
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 10:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P3ngiMtUx5wqtSJZ2+qzQYJQd71u0qk+bL577vog38Q=; b=PBUal61TV4JVeba9fK7hs8AGXy
 jy4DtdKqlCSN5g2tsAXSYJK6WivzoXR2UpYeEg7Gz80uXeFFRPPaVjCXLn1JEH+T+hBREFH8H64Oe
 XhGOZb1/eequjhvxWH1MeVVLXqrM9+fh4aXlrhM9fycI7xN4hJF7/l0dO43EBJ0mRbvHzlvhRBD1D
 9f/ozkw8iru/DR0pqdBob8iUkY5F3mUmDmY4QitAznTIgDbbLCZNs89XmpCKRwvAcgVCoBfBaERjx
 LX6Kmdee4RWE+xgDuA6VH+bgxJo/dduTrV08mFPREnKZQ16MuEvPYxEPVRG53X/fc+PT3qt4yTbDp
 IcLp8iow==;
Received: from [187.36.234.139] (helo=[192.168.1.195])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pDNN5-0000CL-G1; Thu, 05 Jan 2023 11:21:15 +0100
Message-ID: <3b80619a-b2d9-14ac-764e-c28b90cf35e6@igalia.com>
Date: Thu, 5 Jan 2023 07:21:09 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] drm: document better that drivers shouldn't use drm_minor
 directly
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20230104211754.1967591-1-daniel.vetter@ffwll.ch>
Content-Language: en-US
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20230104211754.1967591-1-daniel.vetter@ffwll.ch>
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
Cc: Melissa Wen <mwen@igalia.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Wambui Karuga <wambui.karugax@gmail.com>, Maxime Ripard <maxime@cerno.tech>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/4/23 18:17, Daniel Vetter wrote:
> The documentation for struct drm_minor already states this, but that's
> not always that easy to find.
> 
> Also due to historical reasons we still have the minor-centric (like
> drm_debugfs_create_files), but since this is now getting fixed we can
> put a few more pointers in place as to how this should be done
> ideally.
> 
> Motvated by some discussion with Rodrigo on irc about how drm/xe
> should lay out its sysfs interfaces.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Wambui Karuga <wambui.karugax@gmail.com>
> Cc: Maíra Canal <mcanal@igalia.com>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Melissa Wen <mwen@igalia.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>   include/drm/drm_device.h | 17 +++++++++++++++--
>   1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index 9923c7a6885e..b40e07e004ee 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -87,10 +87,23 @@ struct drm_device {
>   	 */
>   	void *dev_private;
>   
> -	/** @primary: Primary node */
> +	/**
> +	 * @primary:
> +	 *
> +	 * Primary node. Drivers should not interact with this
> +	 * directly. debugfs interface can be registered with
> +	 * drm_debugfs_add_file(), and sysfs should be directly added on the
> +	 * hardwire struct device @dev.
> +	 */
>   	struct drm_minor *primary;
>   
> -	/** @render: Render node */
> +	/**
> +	 * @render:
> +	 *
> +	 * Render node. Drivers should not interact with this directly ever.
> +	 * Drivers should not expose any additional interfaces in debugfs or
> +	 * sysfs on thise node.

I believe you meant s/thise/this.

Apart from this small nit,

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra Canal

> +	 */
>   	struct drm_minor *render;
>   
>   	/**
