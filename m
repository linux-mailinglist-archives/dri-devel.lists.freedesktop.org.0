Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECD2AB771D
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 22:33:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8C5910E73C;
	Wed, 14 May 2025 20:33:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Q0+M0nkY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 408A810E739;
 Wed, 14 May 2025 20:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:
 Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CAnLRsQo89uQfQAI6NVigjappG+KeeuIMhp4mSOEY9w=; b=Q0+M0nkYfkyQ4M3G7FMZkW2Xq/
 Si1FsSVnaXiEewVH/y8cimGj/zkQiahyUiTkmmYkA0h58tvjbivfr2wyJVhfC4AOZGAI3bIgnFTvD
 akw+CQB3eiZSOj91JvDPimNqhJ4NbGLBY1ug6b4KpVpdoYNtwamde160T5Wpq8hgzX1tUf7g0FRmc
 OX99Vzw/fFJPoIblwpWcysb3QASEaVLmQE0P1Rh75vkFFAQlWOkmYdOzNDXnc7cant8h+saPVStk3
 7mUeBeVmiKbu0KjvWhoT7sffTKi+OZsnRvX9pR3Rf2sjdWZwUQVUmSak3CVj5ujI2yDRsTqv+2lqZ
 RgvgV+Ew==;
Received: from [189.6.16.79] (helo=[192.168.0.55])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uFIh0-008L6m-5h; Wed, 14 May 2025 22:32:55 +0200
Message-ID: <1a623ab1-5d98-4ee0-a621-c79d4fe10635@igalia.com>
Date: Wed, 14 May 2025 17:32:48 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/14] drm/amd/display: simplify
 dm_helpers_parse_edid_caps signature
From: Melissa Wen <mwen@igalia.com>
To: Alex Hung <alex.hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Michel Daenzer <michel.daenzer@mailbox.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20250514202130.291324-1-mwen@igalia.com>
 <20250514202130.291324-9-mwen@igalia.com>
Content-Language: en-US
In-Reply-To: <20250514202130.291324-9-mwen@igalia.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 14/05/2025 17:19, Melissa Wen wrote:
> Pass dc_sink to dm_helpers_parse_edid_caps(), since it already contains
> edid info. It's a groundwork to get rid of raw edid stored as dc_edid.
>
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  5 +----
>   .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c  | 18 +++++++-----------
>   drivers/gpu/drm/amd/display/dc/dm_helpers.h    |  7 ++-----
>   .../drm/amd/display/dc/link/link_detection.c   |  5 +----
>   4 files changed, 11 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 6a85d0ea20dc..0650866dfb6d 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -7384,10 +7384,7 @@ static void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
>   		memset(&dc_em_sink->edid_caps, 0, sizeof(struct dc_edid_caps));
>   		memmove(dc_em_sink->dc_edid.raw_edid, edid,
>   			(edid->extensions + 1) * EDID_LENGTH);
> -		dm_helpers_parse_edid_caps(
> -			dc_link,
> -			&dc_em_sink->dc_edid,
> -			&dc_em_sink->edid_caps);
> +		dm_helpers_parse_edid_caps(dc_link, dc_em_sink);
>   	}
>   }
>   
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index e7cfbee6c67f..6e42b610cdea 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -95,23 +95,22 @@ static void apply_edid_quirks(struct drm_device *dev,
>    *
>    * Return: void
>    */
Ugh.. I forgot to update the kernel-doc for dm_helpers_parse_edid_caps().
But I'll wait a bit for comments before sending a another version with 
this fix.

Melissa
> -enum dc_edid_status dm_helpers_parse_edid_caps(
> -		struct dc_link *link,
> -		const struct dc_edid *edid,
> -		struct dc_edid_caps *edid_caps)
> +enum dc_edid_status dm_helpers_parse_edid_caps(struct dc_link *link,
> +					       struct dc_sink *sink)
>   {
>   	struct amdgpu_dm_connector *aconnector = link->priv;
>   	struct drm_connector *connector = &aconnector->base;
>   	struct drm_device *dev = connector->dev;
> -	struct edid *edid_buf = edid ? (struct edid *) edid->raw_edid : NULL;
> +	struct edid *edid_buf;
>   	const struct drm_edid *drm_edid;
>   	struct drm_edid_product_id product_id;
> +	struct dc_edid_caps *edid_caps = &sink->edid_caps;
>   	int sad_count;
>   	int i = 0;
>   	enum dc_edid_status result = EDID_OK;
>   
> -
> -	if (!edid_caps || !edid)
> +	edid_buf = (struct edid *) &sink->dc_edid.raw_edid;
> +	if (!edid_caps || !edid_buf)
>   		return EDID_BAD_INPUT;
>   
>   	drm_edid = drm_edid_alloc(edid_buf, EDID_LENGTH * (edid_buf->extensions + 1));
> @@ -1030,10 +1029,7 @@ enum dc_edid_status dm_helpers_read_local_edid(
>   		/* We don't need the original edid anymore */
>   		drm_edid_free(drm_edid);
>   
> -		edid_status = dm_helpers_parse_edid_caps(
> -						link,
> -						&sink->dc_edid,
> -						&sink->edid_caps);
> +		edid_status = dm_helpers_parse_edid_caps(link, sink);
>   
>   	} while (edid_status == EDID_BAD_CHECKSUM && --retry > 0);
>   
> diff --git a/drivers/gpu/drm/amd/display/dc/dm_helpers.h b/drivers/gpu/drm/amd/display/dc/dm_helpers.h
> index 9d160b39e8c5..ce6a70368bd0 100644
> --- a/drivers/gpu/drm/amd/display/dc/dm_helpers.h
> +++ b/drivers/gpu/drm/amd/display/dc/dm_helpers.h
> @@ -59,11 +59,8 @@ void dm_helpers_free_gpu_mem(
>   		enum dc_gpu_mem_alloc_type type,
>   		void *pvMem);
>   
> -enum dc_edid_status dm_helpers_parse_edid_caps(
> -	struct dc_link *link,
> -	const struct dc_edid *edid,
> -	struct dc_edid_caps *edid_caps);
> -
> +enum dc_edid_status dm_helpers_parse_edid_caps(struct dc_link *link,
> +					       struct dc_sink *sink);
>   
>   /*
>    * Update DP branch info
> diff --git a/drivers/gpu/drm/amd/display/dc/link/link_detection.c b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
> index cc9191a5c9e6..8c7a00c1ad2b 100644
> --- a/drivers/gpu/drm/amd/display/dc/link/link_detection.c
> +++ b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
> @@ -1429,10 +1429,7 @@ struct dc_sink *link_add_remote_sink(
>   			dc_sink))
>   		goto fail_add_sink;
>   
> -	edid_status = dm_helpers_parse_edid_caps(
> -			link,
> -			&dc_sink->dc_edid,
> -			&dc_sink->edid_caps);
> +	edid_status = dm_helpers_parse_edid_caps(link, dc_sink);
>   
>   	/*
>   	 * Treat device as no EDID device if EDID

