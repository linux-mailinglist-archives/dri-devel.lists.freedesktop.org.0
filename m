Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 610BF69E49A
	for <lists+dri-devel@lfdr.de>; Tue, 21 Feb 2023 17:27:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F99710E87F;
	Tue, 21 Feb 2023 16:27:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B2B810E87E;
 Tue, 21 Feb 2023 16:27:27 +0000 (UTC)
Received: from [192.168.2.6] (unknown [109.252.117.89])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 9DB4C66021C8;
 Tue, 21 Feb 2023 16:27:25 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1676996846;
 bh=JbAPfo+QmyJmOeeEmHkXehRFtmX7a6mbaEJjHAFJrVc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=RtF77EAWHosVUr8uSsh7lpRWSn/e87W6mCEqOoEdja+AClUpmSdruDOEcZUp4rgRO
 jLhm2vLFw2lgwFCGaAjH9XsSHqqkhiB3WYoV6iB8L41KFV++3mDBZAw6Gk+AGFZepw
 942tPC/huV9IisodHjs4O824u4R+IYb/olqNpY3F4jWf9Ur+tO1W1JouUcF6KGuc61
 C3QyUdQqwkQhl0Xgfy2uCu7qqTDKIA11vQ96ioCtr0Ms18JrSsjJIK+68mhoA3hRKt
 L5o6uYo689GouyMVN0+8Y2iWFt9cOMlh9YYq5sE3WjVfb75USgZMNRXHAyeQwLQGwU
 tjUGCQRHuMaGw==
Message-ID: <072079be-39e1-ee27-d985-20e84f8d7a81@collabora.com>
Date: Tue, 21 Feb 2023 19:27:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/4] drm/displayid: return struct displayid_header from
 validate_displayid()
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
References: <cover.1676580180.git.jani.nikula@intel.com>
 <e840c744d165608a41db5a5e2bd4b0205783c697.1676580180.git.jani.nikula@intel.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <e840c744d165608a41db5a5e2bd4b0205783c697.1676580180.git.jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: intel-gfx@lists.freedesktop.org, Iaroslav Boliukin <iam@lach.pw>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/16/23 23:44, Jani Nikula wrote:
> Avoid figuring out the header pointer multiple times.
> 
> Cc: Iaroslav Boliukin <iam@lach.pw>
> Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_displayid.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_displayid.c b/drivers/gpu/drm/drm_displayid.c
> index 7d03159dc146..0de9b5530393 100644
> --- a/drivers/gpu/drm/drm_displayid.c
> +++ b/drivers/gpu/drm/drm_displayid.c
> @@ -20,7 +20,8 @@ displayid_get_header(const u8 *displayid, int length, int index)
>  	return base;
>  }
>  
> -static int validate_displayid(const u8 *displayid, int length, int idx)
> +static const struct displayid_header *
> +validate_displayid(const u8 *displayid, int length, int idx)
>  {
>  	int i, dispid_length;
>  	u8 csum = 0;
> @@ -28,7 +29,7 @@ static int validate_displayid(const u8 *displayid, int length, int idx)
>  
>  	base = displayid_get_header(displayid, length, idx);
>  	if (IS_ERR(base))
> -		return PTR_ERR(base);
> +		return base;
>  
>  	DRM_DEBUG_KMS("base revision 0x%x, length %d, %d %d\n",
>  		      base->rev, base->bytes, base->prod_id, base->ext_count);
> @@ -36,16 +37,16 @@ static int validate_displayid(const u8 *displayid, int length, int idx)
>  	/* +1 for DispID checksum */
>  	dispid_length = sizeof(*base) + base->bytes + 1;
>  	if (dispid_length > length - idx)
> -		return -EINVAL;
> +		return ERR_PTR(-EINVAL);
>  
>  	for (i = 0; i < dispid_length; i++)
>  		csum += displayid[idx + i];
>  	if (csum) {
>  		DRM_NOTE("DisplayID checksum invalid, remainder is %d\n", csum);
> -		return -EINVAL;
> +		return ERR_PTR(-EINVAL);
>  	}
>  
> -	return 0;
> +	return base;
>  }
>  
>  static const u8 *drm_find_displayid_extension(const struct drm_edid *drm_edid,
> @@ -54,7 +55,6 @@ static const u8 *drm_find_displayid_extension(const struct drm_edid *drm_edid,
>  {
>  	const u8 *displayid = drm_find_edid_extension(drm_edid, DISPLAYID_EXT, ext_index);
>  	const struct displayid_header *base;
> -	int ret;
>  
>  	if (!displayid)
>  		return NULL;
> @@ -63,11 +63,10 @@ static const u8 *drm_find_displayid_extension(const struct drm_edid *drm_edid,
>  	*length = EDID_LENGTH - 1;
>  	*idx = 1;
>  
> -	ret = validate_displayid(displayid, *length, *idx);
> -	if (ret)
> +	base = validate_displayid(displayid, *length, *idx);
> +	if (IS_ERR(base))
>  		return NULL;
>  
> -	base = (const struct displayid_header *)&displayid[*idx];
>  	*length = *idx + sizeof(*base) + base->bytes;
>  
>  	return displayid;

Tested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry

