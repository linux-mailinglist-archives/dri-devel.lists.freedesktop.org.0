Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB097B4676
	for <lists+dri-devel@lfdr.de>; Sun,  1 Oct 2023 11:10:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1A8510E0C2;
	Sun,  1 Oct 2023 09:09:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C26B910E0BD;
 Sun,  1 Oct 2023 09:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6lP8oi03r8hCRsN75vpTWTiosuEyWIV9dj6tRa1Y30Y=; b=rMU7VCJMMLlu/9CyRmpkVUCfPs
 zQSef376Dvx7qQr9RLIDOyIHkT6zmRE4oin9Ev+osGUSNiSeF0g3Pwf5tfZDhrMkfhhP3f3uQXFdK
 6aXxqg2TNQuXYbvdbvvbEq1E6KcM6ehLkEubu+Er+ubzwLzaEAF0Gvl8t2Fx+fVOR7rY3mQvdWDrE
 a4g3YBFTuOnAu8EfdsPPlhOuPR8eYJmG4PlA86qy9yvi5m6tfaUYUGaaVRv7q+F9aYCX+ZcIX7x4n
 imn4jEOgwBMXtqI+NdJ+iw0t42iw3ElmqDSdxOnUdpmCXeKtiHedrGqMZfI0wu0CsOnHoQobUI8PP
 VaYdNPNQ==;
Received: from [206.0.75.64] (helo=[192.168.205.76])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1qmsS3-00AK31-GM; Sun, 01 Oct 2023 11:09:24 +0200
Message-ID: <992fadb0-7c1f-4116-9a65-5fa9449ba629@igalia.com>
Date: Sun, 1 Oct 2023 11:09:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm: Remove plane hsub/vsub alignment requirement
 for core helpers
To: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
References: <20230926141519.9315-1-gcarlos@disroot.org>
 <20230926141519.9315-2-gcarlos@disroot.org>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20230926141519.9315-2-gcarlos@disroot.org>
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Tales Aparecida <tales.aparecida@gmail.com>, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Maira Canal <mairacanal@riseup.net>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Carlos,

On 9/26/23 16:15, Carlos Eduardo Gallo Filho wrote:
> The drm_format_info_plane_{height,width} functions was implemented using
> regular division for the plane size calculation, which cause issues [1][2]
> when used on contexts where the dimensions are misaligned with relation
> to the subsampling factors. So, replace the regular division by the
> DIV_ROUND_UP macro.
>
> This allows these functions to be used in more drivers, making further
> work to bring more core presence on them possible.
>
> [1] http://patchwork.freedesktop.org/patch/msgid/20170321181218.10042-3-ville.syrjala@linux.intel.com
> [2] https://patchwork.freedesktop.org/patch/msgid/20211026225105.2783797-2-imre.deak@intel.com

Prefer to use lore:

https://lore.kernel.org/dri-devel/20170321181218.10042-3-ville.syrjala@linux.intel.com/

https://lore.kernel.org/intel-gfx/20211026225105.2783797-2-imre.deak@intel.com/


Other than that,

Reviewed-by: André Almeida <andrealmeid@igalia.com>

>
> Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
> ---
>   include/drm/drm_fourcc.h | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/include/drm/drm_fourcc.h b/include/drm/drm_fourcc.h
> index 532ae78ca747..ccf91daa4307 100644
> --- a/include/drm/drm_fourcc.h
> +++ b/include/drm/drm_fourcc.h
> @@ -22,6 +22,7 @@
>   #ifndef __DRM_FOURCC_H__
>   #define __DRM_FOURCC_H__
>   
> +#include <linux/math.h>
>   #include <linux/types.h>
>   #include <uapi/drm/drm_fourcc.h>
>   
> @@ -279,7 +280,7 @@ int drm_format_info_plane_width(const struct drm_format_info *info, int width,
>   	if (plane == 0)
>   		return width;
>   
> -	return width / info->hsub;
> +	return DIV_ROUND_UP(width, info->hsub);
>   }
>   
>   /**
> @@ -301,7 +302,7 @@ int drm_format_info_plane_height(const struct drm_format_info *info, int height,
>   	if (plane == 0)
>   		return height;
>   
> -	return height / info->vsub;
> +	return DIV_ROUND_UP(height, info->vsub);
>   }
>   
>   const struct drm_format_info *__drm_format_info(u32 format);
