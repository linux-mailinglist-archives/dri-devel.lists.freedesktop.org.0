Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA7AAFF21C
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 21:58:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B178310E81E;
	Wed,  9 Jul 2025 19:58:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="PIZmlANF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 912AF10E819;
 Wed,  9 Jul 2025 19:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KWvS1L4O4fRedeIVtwYpBSrNFtEuOLPmgUMy7+x5L48=; b=PIZmlANFRtX/c4z2T+g/FycLXG
 7IDSOmQCbbrXdkuSkgbsOfoqyghGNebyqKYdH980sNwKPbaBe/UzfbpmqSDZnZFjw6vtAhBDDhxi5
 KFwRsxrnbUUMjQn3f14YLOjw/4to3MdgOiXVqkq3zWKJ09Z1IiRBPv3sDm87UMBEW4/3Futi0XL+N
 vHNjZ10O+WDFi/aJKKKfcQZI8S007AyjYEgn9LsYzdHy8+t6Ux3+EPHEFCFWqjv0fIuv0I5CgFp1y
 z1Lg4OM1dxDYhmWbK0Gw2+e+aczXPNCzIzsM99LM6LBG99bn5MgyXiJeDpHlqjzCV35knGZ6OOndZ
 I0T13x4A==;
Received: from [165.204.54.249] (helo=[192.168.111.39])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uZavv-00Ecr5-L4; Wed, 09 Jul 2025 21:58:23 +0200
Message-ID: <94546290-5dd2-466b-b554-46580d8350a7@igalia.com>
Date: Wed, 9 Jul 2025 15:58:18 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V10 46/46] drm/amd/display: Disable CRTC degamma when
 color pipeline is enabled
To: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: wayland-devel@lists.freedesktop.org, harry.wentland@amd.com,
 leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, jadahl@redhat.com,
 sebastian.wick@redhat.com, shashank.sharma@amd.com, agoins@nvidia.com,
 joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 uma.shankar@intel.com, quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 louis.chauvet@bootlin.com, arthurgrillo@riseup.net
References: <20250617041746.2884343-1-alex.hung@amd.com>
 <20250617041746.2884343-47-alex.hung@amd.com>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <20250617041746.2884343-47-alex.hung@amd.com>
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



On 17/06/2025 00:17, Alex Hung wrote:
> The degamma is to be handled by Color pipeline API.
>
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
> V10:
>   - Disable CRTC degamma when color pipeline is enabled (Melissa Wen)
>
>   .../drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c    | 15 ++++++++++-----
>   1 file changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> index 87058271b00c..62bb4855306d 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> @@ -685,7 +685,7 @@ int amdgpu_dm_crtc_init(struct amdgpu_display_manager *dm,
>   {
>   	struct amdgpu_crtc *acrtc = NULL;
>   	struct drm_plane *cursor_plane;
> -	bool is_dcn;
> +	bool has_degamma;
>   	int res = -ENOMEM;
>   
>   	cursor_plane = kzalloc(sizeof(*cursor_plane), GFP_KERNEL);
> @@ -724,11 +724,16 @@ int amdgpu_dm_crtc_init(struct amdgpu_display_manager *dm,
>   
>   	dm->adev->mode_info.crtcs[crtc_index] = acrtc;
>   
> -	/* Don't enable DRM CRTC degamma property for DCE since it doesn't
> -	 * support programmable degamma anywhere.
> +	/* Don't enable DRM CRTC degamma property for
> +	 * 1. Degamma is replaced by color pipeline.
> +	 * 2. DCE since it doesn't support programmable degamma anywhere.
>   	 */
> -	is_dcn = dm->adev->dm.dc->caps.color.dpp.dcn_arch;
> -	drm_crtc_enable_color_mgmt(&acrtc->base, is_dcn ? MAX_COLOR_LUT_ENTRIES : 0,
> +	if (plane->color_pipeline_property)
> +		has_degamma = false;
> +	else
> +		has_degamma = dm->adev->dm.dc->caps.color.dpp.dcn_arch;

Just a reminder to take into account this patch (if applied) for DCN401 
when rebasing:
https://lore.kernel.org/amd-gfx/20250511213847.61930-1-mwen@igalia.com/

> +
> +	drm_crtc_enable_color_mgmt(&acrtc->base, has_degamma ? MAX_COLOR_LUT_ENTRIES : 0,
>   				   true, MAX_COLOR_LUT_ENTRIES);
>   
>   	drm_mode_crtc_set_gamma_size(&acrtc->base, MAX_COLOR_LEGACY_LUT_ENTRIES);

