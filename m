Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PVFHJdXgWkFFwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 03:04:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 484FCD39A5
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 03:04:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9081610E4C6;
	Tue,  3 Feb 2026 02:04:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="A4HLdSOU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 907D110E2F7;
 Tue,  3 Feb 2026 02:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:
 Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xXySNBRq2X0toQ75IUwlKTn1DlOUVBe2wMK7L5VhHro=; b=A4HLdSOUCUqj9VkDRdbJWxs96b
 Pp+fm3xcpYGyWnWnCD7FAbjMGHwjwztnjkSiKOYqLduyee4cqcjEu5iMgLPIPHqW2V/ci7gZZvICQ
 aF5tHekN/OcI9z3JuDmq5g6nF55H3CvRd9ZCH5TYcfcrl81lO2lrNlspdpRHdC39bFDSTvgXX5NRW
 husme9WXLfWKZLYqgtXzCOnmWiJjYruaUelBdfmD5PN/CKKFwit+OTJ1XIPaa6XmtvTqW0QfNJ1ql
 imslahcUvSbtbm+m3DXY4uzTG4HlXmiz44F+XVygjQq3KVRzAd0bLWJZTsRVPFSdUbfuXmQF4y/+H
 b+pS8i+w==;
Received: from [186.208.68.91] (helo=[192.168.18.14])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vn5li-00D1PC-5L; Tue, 03 Feb 2026 03:03:54 +0100
Message-ID: <003737a0-7777-45f3-af55-4cee7a73ab9d@igalia.com>
Date: Mon, 2 Feb 2026 23:03:49 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: expose plane blend LUT in HW with MCM
From: Melissa Wen <mwen@igalia.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, siqueira@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: Matthew Schwartz <matthew.schwartz@linux.dev>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, Alex Hung <alex.hung@amd.com>
References: <20251209151032.91738-1-mwen@igalia.com>
Content-Language: en-US
In-Reply-To: <20251209151032.91738-1-mwen@igalia.com>
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
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[amd.com,igalia.com,gmail.com,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[igalia.com:mid,igalia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 484FCD39A5
X-Rspamd-Action: no action


On 09/12/2025 12:09, Melissa Wen wrote:
> Since commit 39923050615cd ("drm/amd/display: Clear DPP 3DLUT Cap")
> there is a flag in the mpc_color_caps that indicates the pre-blend usage
> of MPC color caps. Do the same as commit a0c3e8bfbab6 ("drm/amd/display:
> Use mpc.preblend flag to indicate preblend") and use the mpc.preblend
> flag to expose plane blend LUT/TF properties on AMD display driver.

A gentle ping here.

Melissa

>
> CC: Matthew Schwartz <matthew.schwartz@linux.dev>
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> index 56cb866ac6f8..b15f0cf86008 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> @@ -1649,7 +1649,7 @@ dm_atomic_plane_attach_color_mgmt_properties(struct amdgpu_display_manager *dm,
>   					   MAX_COLOR_3DLUT_SIZE);
>   	}
>   
> -	if (dpp_color_caps.ogam_ram) {
> +	if (dpp_color_caps.ogam_ram || dm->dc->caps.color.mpc.preblend) {
>   		drm_object_attach_property(&plane->base,
>   					   mode_info.plane_blend_lut_property, 0);
>   		drm_object_attach_property(&plane->base,

