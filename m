Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB2A69E49F
	for <lists+dri-devel@lfdr.de>; Tue, 21 Feb 2023 17:27:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B23010E883;
	Tue, 21 Feb 2023 16:27:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49D3810E881;
 Tue, 21 Feb 2023 16:27:41 +0000 (UTC)
Received: from [192.168.2.6] (unknown [109.252.117.89])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 7E14766021C8;
 Tue, 21 Feb 2023 16:27:39 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1676996859;
 bh=LO2uUO2NU6BvKMtLrEYoa9Uowfn2rbPFzkSgvgS1y+Q=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jb57d79URBE9LRnb+gIdw0yxMdBtuXwRlgJXY240PCzLHVfIjbifG1DPFjjB87zO8
 +kctgFe/bfbx+KMnGi1xIVxsqf+SK7xQVJU98cH2cEwaZB0ZIlHyj4RrnZQb+iq1lK
 0Moc+3GzW0tuqbEYCeKB8KWbiz8PbhxzSQ26uRSNS4SRjR05qI5bnens1OknBNvbi9
 ZFIyx3YTASDQaEEyEiJ1biZmR6mCkxhL1Ocn8v7YYvAAho05jJ6x/RDbhiicp/y17c
 LTUBcByhV8wkicQGamlTuQssu+hA/iWW9Hej/PX1XaZMkTJoux+V6I56up+2vkFzRI
 wIQC3/B9BTaew==
Message-ID: <3b090fb3-266e-74c1-c2dd-4ae3d4701e30@collabora.com>
Date: Tue, 21 Feb 2023 19:27:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/4] drm/displayid: provide access to DisplayID version
 and primary use case
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
References: <cover.1676580180.git.jani.nikula@intel.com>
 <ad8a35c109f97ffe115e6b18e4a132b592f11089.1676580180.git.jani.nikula@intel.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <ad8a35c109f97ffe115e6b18e4a132b592f11089.1676580180.git.jani.nikula@intel.com>
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

On 2/16/23 23:45, Jani Nikula wrote:
> The DisplayID structure version and primary use case are stored in the
> DisplayID Base Section. We should be checking them in a number of places
> when parsing the DisplayID blocks. Currently, we completely ignore the
> primary use case, and just look at the block tags without cross-checking
> against structure version.
> 
> Store the version and primary use case in the DisplayID iterator, and
> provide accessors to them. In general, the information is needed when
> iterating the blocks, and this is a convenient place to both store and
> retrieve the information during parsing.
> 
> Promote using accessors rather than users poking at the iterator
> directly.
> 
> Cc: Iaroslav Boliukin <iam@lach.pw>
> Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_displayid.c | 30 ++++++++++++++++++++++++++++++
>  include/drm/drm_displayid.h     | 12 +++++++++++-
>  2 files changed, 41 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_displayid.c b/drivers/gpu/drm/drm_displayid.c
> index 0de9b5530393..9edc111be7ee 100644
> --- a/drivers/gpu/drm/drm_displayid.c
> +++ b/drivers/gpu/drm/drm_displayid.c
> @@ -123,6 +123,9 @@ __displayid_iter_next(struct displayid_iter *iter)
>  	}
>  
>  	for (;;) {
> +		/* The first section we encounter is the base section */
> +		bool base_section = !iter->section;
> +
>  		iter->section = drm_find_displayid_extension(iter->drm_edid,
>  							     &iter->length,
>  							     &iter->idx,
> @@ -132,6 +135,18 @@ __displayid_iter_next(struct displayid_iter *iter)
>  			return NULL;
>  		}
>  
> +		/* Save the structure version and primary use case. */
> +		if (base_section) {
> +			const struct displayid_header *base;
> +
> +			base = displayid_get_header(iter->section, iter->length,
> +						    iter->idx);
> +			if (!IS_ERR(base)) {
> +				iter->version = base->rev;
> +				iter->primary_use = base->prod_id;
> +			}
> +		}
> +
>  		iter->idx += sizeof(struct displayid_header);
>  
>  		block = displayid_iter_block(iter);
> @@ -144,3 +159,18 @@ void displayid_iter_end(struct displayid_iter *iter)
>  {
>  	memset(iter, 0, sizeof(*iter));
>  }
> +
> +/* DisplayID Structure Version/Revision from the Base Section. */
> +u8 displayid_version(const struct displayid_iter *iter)
> +{
> +	return iter->version;
> +}
> +
> +/*
> + * DisplayID Primary Use Case (2.0+) or Product Type Identifier (1.0-1.3) from
> + * the Base Section.
> + */
> +u8 displayid_primary_use(const struct displayid_iter *iter)
> +{
> +	return iter->primary_use;
> +}
> diff --git a/include/drm/drm_displayid.h b/include/drm/drm_displayid.h
> index 49649eb8447e..566497eeb3b8 100644
> --- a/include/drm/drm_displayid.h
> +++ b/include/drm/drm_displayid.h
> @@ -139,7 +139,11 @@ struct displayid_vesa_vendor_specific_block {
>  	u8 mso;
>  } __packed;
>  
> -/* DisplayID iteration */
> +/*
> + * DisplayID iteration.
> + *
> + * Do not access directly, this is private.
> + */
>  struct displayid_iter {
>  	const struct drm_edid *drm_edid;
>  
> @@ -147,6 +151,9 @@ struct displayid_iter {
>  	int length;
>  	int idx;
>  	int ext_index;
> +
> +	u8 version;
> +	u8 primary_use;
>  };
>  
>  void displayid_iter_edid_begin(const struct drm_edid *drm_edid,
> @@ -157,4 +164,7 @@ __displayid_iter_next(struct displayid_iter *iter);
>  	while (((__block) = __displayid_iter_next(__iter)))
>  void displayid_iter_end(struct displayid_iter *iter);
>  
> +u8 displayid_version(const struct displayid_iter *iter);
> +u8 displayid_primary_use(const struct displayid_iter *iter);
> +
>  #endif

Tested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry

