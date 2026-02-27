Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NSsK6LzoWkwxgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 20:42:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D4F1BCF82
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 20:42:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80C7910EC1D;
	Fri, 27 Feb 2026 19:42:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="OMoQStnz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B606910EC1B;
 Fri, 27 Feb 2026 19:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=noHE7pfh63E5rVDQ2b9EDcb8A7egfmJm61G5yueZQoE=; b=OMoQStnzaUwEoJMirkl6rJxgek
 Kn/I3XBPkYLx6+64u1Jmu78guZw5LoWaAdRCJM/32iwTSGUqyPBLYw+ExXsb6Lq0SLmoJsmvTZf/t
 U1l5zatAT4mJ8EiWivBojpgVyJf7VK4huAHlwFLyF6G0NciBukwhXQ3IAfeZ/GRwQ0/bo4wPb767X
 tGYDhUMOmb7qHWFOzMwISAFwvU6/r20WD5mLPsrXUIrwbsrIIF1foNBFSqJK3x/GUx75oLysQiGtq
 P7/sQ4Ll83JE8NM8cQebrltMVRdebRmtkZAwEkuRXMqA+kkjr/RAK1u6fXBxKUvINJCLQUIf2IOf3
 cz33awNA==;
Received: from [186.208.68.119] (helo=[192.168.18.14])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vw3j7-006fFd-7W; Fri, 27 Feb 2026 20:42:17 +0100
Message-ID: <ee8871ed-e443-4ca7-97ea-8055451211c2@igalia.com>
Date: Fri, 27 Feb 2026 16:42:10 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: Use mpc.preblend flag to indicate 3D LUT
To: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: alexander.deucher@amd.com, harry.wentland@amd.com, sunpeng.li@amd.com,
 siqueira@igalia.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, contact@emersion.fr, daniels@collabora.com,
 Alvin.Lee2@amd.com, mario.limonciello@amd.com,
 chaitanya.kumar.borah@intel.com
References: <20260227192604.1377163-1-alex.hung@amd.com>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <20260227192604.1377163-1-alex.hung@amd.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[amd.com,igalia.com,gmail.com,ffwll.ch,emersion.fr,collabora.com,intel.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[mwen@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[igalia.com:mid,igalia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email]
X-Rspamd-Queue-Id: 60D4F1BCF82
X-Rspamd-Action: no action



On 27/02/2026 16:26, Alex Hung wrote:
> [WHAT]
> New ASIC's 3D LUT is indicated by mpc.preblend.
Nice catch.

Reviewed-by: Melissa Wen <mwen@igalia.com>
>
> Fixes: 0de2b1afea8d ("drm/amd/display: add 3D LUT colorop")
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c   | 6 ++++--
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 3 ++-
>   2 files changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> index 2ba98f384685..cd1e58b8defc 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> @@ -1706,6 +1706,7 @@ __set_dm_plane_colorop_3dlut(struct drm_plane_state *plane_state,
>   	struct dc_transfer_func *tf = &dc_plane_state->in_shaper_func;
>   	struct drm_atomic_state *state = plane_state->state;
>   	const struct amdgpu_device *adev = drm_to_adev(colorop->dev);
> +	bool has_3dlut = adev->dm.dc->caps.color.dpp.hw_3d_lut || adev->dm.dc->caps.color.mpc.preblend;
>   	const struct drm_device *dev = colorop->dev;
>   	const struct drm_color_lut32 *lut3d;
>   	uint32_t lut3d_size;
> @@ -1722,7 +1723,7 @@ __set_dm_plane_colorop_3dlut(struct drm_plane_state *plane_state,
>   	}
>   
>   	if (colorop_state && !colorop_state->bypass && colorop->type == DRM_COLOROP_3D_LUT) {
> -		if (!adev->dm.dc->caps.color.dpp.hw_3d_lut) {
> +		if (!has_3dlut) {
>   			drm_dbg(dev, "3D LUT is not supported by hardware\n");
>   			return -EINVAL;
>   		}
> @@ -1875,6 +1876,7 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
>   	struct drm_colorop *colorop = plane_state->color_pipeline;
>   	struct drm_device *dev = plane_state->plane->dev;
>   	struct amdgpu_device *adev = drm_to_adev(dev);
> +	bool has_3dlut = adev->dm.dc->caps.color.dpp.hw_3d_lut || adev->dm.dc->caps.color.mpc.preblend;
>   	int ret;
>   
>   	/* 1D Curve - DEGAM TF */
> @@ -1907,7 +1909,7 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
>   	if (ret)
>   		return ret;
>   
> -	if (adev->dm.dc->caps.color.dpp.hw_3d_lut) {
> +	if (has_3dlut) {
>   		/* 1D Curve & LUT - SHAPER TF & LUT */
>   		colorop = colorop->next;
>   		if (!colorop) {
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> index f25c0ede7199..d59ba82d3d7c 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> @@ -60,6 +60,7 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
>   	struct drm_colorop *ops[MAX_COLOR_PIPELINE_OPS];
>   	struct drm_device *dev = plane->dev;
>   	struct amdgpu_device *adev = drm_to_adev(dev);
> +	bool has_3dlut = adev->dm.dc->caps.color.dpp.hw_3d_lut || adev->dm.dc->caps.color.mpc.preblend;
>   	int ret;
>   	int i = 0;
>   
> @@ -112,7 +113,7 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
>   
>   	i++;
>   
> -	if (adev->dm.dc->caps.color.dpp.hw_3d_lut) {
> +	if (has_3dlut) {
>   		/* 1D curve - SHAPER TF */
>   		ops[i] = kzalloc_obj(*ops[0]);
>   		if (!ops[i]) {

