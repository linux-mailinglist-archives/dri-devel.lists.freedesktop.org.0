Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B19C769E494
	for <lists+dri-devel@lfdr.de>; Tue, 21 Feb 2023 17:27:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF4FB10E875;
	Tue, 21 Feb 2023 16:27:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B40DA10E87E;
 Tue, 21 Feb 2023 16:27:21 +0000 (UTC)
Received: from [192.168.2.6] (unknown [109.252.117.89])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 17E8E66021C8;
 Tue, 21 Feb 2023 16:27:20 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1676996840;
 bh=LVIw1LYezXz96c9y+DFNKmoNd0kxJRru/T50MeDlz4A=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=V0SJjFQcxT/xsA/vwMCs8AdgiUT33TzK2ahwWh+RAxxWyzUf7DeChQVFydjUexFYV
 mw2FQpDvahVO/2Cu7glABHjyR2LlLfVQhp25dzrkaEjVRDu22XF+j6yr8zlqOkUadg
 M9Bu8i00T109C6DK7fN2Lb8N2YdtE2af8cic/nJc/l9dNfpOMNZ9Eq/qlBwWpJd/YS
 qCWtAt95VFo603MtQ92gogVT68R5ztWW3XJ4VcUqWoDiDoiY23FJFjuJA/Dfz/m1tm
 5Zc63zIT38BC/04+pYhJYSo1EL6g4mXyOzFTIPhhJOlEBMLKY8iyPRcqbXpKBXRomn
 Vh2zdBSLPmP+A==
Message-ID: <c3d1f4ef-fe3c-b506-18cc-c33cdb8f5026@collabora.com>
Date: Tue, 21 Feb 2023 19:27:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/4] drm/displayid: add displayid_get_header() and check
 bounds better
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
References: <cover.1676580180.git.jani.nikula@intel.com>
 <4a03b3a5132642d3cdb6d4c2641422955a917292.1676580180.git.jani.nikula@intel.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <4a03b3a5132642d3cdb6d4c2641422955a917292.1676580180.git.jani.nikula@intel.com>
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
> Add a helper to get a pointer to struct displayid_header. To be
> pedantic, add buffer overflow checks to not touch the base if that
> itself would overflow.
> 
> Cc: Iaroslav Boliukin <iam@lach.pw>
> Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_displayid.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_displayid.c b/drivers/gpu/drm/drm_displayid.c
> index 38ea8203df45..7d03159dc146 100644
> --- a/drivers/gpu/drm/drm_displayid.c
> +++ b/drivers/gpu/drm/drm_displayid.c
> @@ -7,13 +7,28 @@
>  #include <drm/drm_edid.h>
>  #include <drm/drm_print.h>
>  
> +static const struct displayid_header *
> +displayid_get_header(const u8 *displayid, int length, int index)
> +{
> +	const struct displayid_header *base;
> +
> +	if (sizeof(*base) > length - index)
> +		return ERR_PTR(-EINVAL);
> +
> +	base = (const struct displayid_header *)&displayid[index];
> +
> +	return base;
> +}
> +
>  static int validate_displayid(const u8 *displayid, int length, int idx)
>  {
>  	int i, dispid_length;
>  	u8 csum = 0;
>  	const struct displayid_header *base;
>  
> -	base = (const struct displayid_header *)&displayid[idx];
> +	base = displayid_get_header(displayid, length, idx);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
>  
>  	DRM_DEBUG_KMS("base revision 0x%x, length %d, %d %d\n",
>  		      base->rev, base->bytes, base->prod_id, base->ext_count);

Tested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry

