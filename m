Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 081DF9B1425
	for <lists+dri-devel@lfdr.de>; Sat, 26 Oct 2024 04:01:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD19B10E2CD;
	Sat, 26 Oct 2024 02:01:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="UEMWm671";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D7C510E2CD;
 Sat, 26 Oct 2024 02:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i+SwFuCkZ2g6wYRWhpHEIR55B4pDdWdZrX87DD4/JQE=; b=UEMWm671vTzrkn1nZv+4vcA8Sh
 P54g2xfnV6Wl5Vk5d1i7cY9utXf1iC9lb3Vl8O86RqxKffjtscl10ttDzjEwALfWjrXekze6ePyw6
 MNhwY3WJQOrqrmU+lIrsbnwW39KA+zWK0dsVqwWLez92Ka5aGBjaK/F+LyiMjTL08wogpdJyHDtrK
 RBCSOPJTKM5SGusJLC3xJ1bZwrpycfn2FosOcc5s2Et6hwuQ01ngRE/NyTOa0e1KKWBnuvLqvdkoq
 64e7QdUZQ2Hey2t2BbNHqQ4Edjg6Jv3ZnLBz7sc28miX9MoVSQlYmzpU3BzVeMkAYZWPsyR9jx54M
 EYiFs6uA==;
Received: from [189.6.17.125] (helo=[192.168.0.55])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1t4W7g-00FF9G-Og; Sat, 26 Oct 2024 04:01:49 +0200
Message-ID: <575d66c7-e77d-42ea-acbf-412d6e508a0b@igalia.com>
Date: Fri, 25 Oct 2024 23:01:40 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/1] SWDEV476969 - dm: Fail dm_atomic_check if cursor
 overlay is required at MAX_SURFACES
To: Zaeem Mohamed <zaeem.mohamed@amd.com>, airlied@gmail.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, daniel@ffwll.ch,
 harry.wentland@amd.com, Rodrigo.Siqueira@amd.com, sunpeng.li@amd.com,
 Xinhui.Pan@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
References: <20241025193727.765195-1-zaeem.mohamed@amd.com>
 <20241025193727.765195-2-zaeem.mohamed@amd.com>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <20241025193727.765195-2-zaeem.mohamed@amd.com>
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




On 25/10/2024 16:37, Zaeem Mohamed wrote:
> [why]
> Prevent index-out-of-bounds due to requiring cursor overlay when
> plane_count is MAX_SURFACES.
Hi Zaeem,

Thanks for working on this fix.
>
> [how]
> Bounds check on plane_count when requiring overlay cursor.
I agree. Atomic check makes sense.

1) Since the native cursor mode was previously the unique mode avaliable, I
wonder if the driver should fall to native cursor mode in favor of the 
overlay
planes advertised. I.e. if driver says it supports two overlay planes and
the userspace requested both, cursor overlay mode should not be available or
should switch to native cursor mode, as before the introduction of cursor
overlay mode.

2) Then my second question: can we increase the number of surfaces to 4 
first to
accommodate more than one active overlay plane with cursor overly mode 
enabled.
If four is still possible, this increase can reduce the number of commit
failure scenarios and mitigate current userspace issues first. After 
addressing
current array-out-of-bounds, follow-up patches can do the proper changes and
checks.

3) IMHO, the incoherence between MAX_SURFACE_NUM and MAX_SURFACE should be
addressed before adding debugging points. For example, there are part of the
DC code using MAX_SURFACE_NUM == MAX_PLANE == 6 to allocate 
dc_surface_update
arrays, instead of using MAX_SURFACE value. You can find one of this 
case here:
https://gitlab.freedesktop.org/agd5f/linux/-/blob/amd-staging-drm-next/drivers/gpu/drm/amd/display/dc/core/dc.c#L4507
It doesn't make sense to me and it can contribute to an incomplete solution.

Also, please add the references of bugs reported in the amd tracker, so far:

Link: https://gitlab.freedesktop.org/drm/amd/-/issues/3693
Link: https://gitlab.freedesktop.org/drm/amd/-/issues/3594
> Co-developed-by: Melissa Wen <mwen@igalia.com>
I don't think I contributed enough to your code to get any credits.
Thanks, but you can remove my co-dev-by :)

Best Regards,

Melissa
> Signed-off-by: Zaeem Mohamed <zaeem.mohamed@amd.com>
> ---
>   amdgpu_dm/amdgpu_dm.c | 16 +++++++++++++++-
>   1 file changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/amdgpu_dm/amdgpu_dm.c b/amdgpu_dm/amdgpu_dm.c
> index df83e7b42b..c2595efb74 100644
> --- a/amdgpu_dm/amdgpu_dm.c
> +++ b/amdgpu_dm/amdgpu_dm.c
> @@ -11676,6 +11676,12 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
>   		 * need to be added for DC to not disable a plane by mistake
>   		 */
>   		if (dm_new_crtc_state->cursor_mode == DM_CURSOR_OVERLAY_MODE) {
> +			if(dc->current_state->stream_status->plane_count >= MAX_SURFACES){
> +				drm_dbg_driver(crtc->dev,
> +				       "Can't enable cursor plane with %d planes\n", MAX_SURFACES);
> +				ret = -EINVAL;
> +				goto fail;
> +			}
>   			ret = drm_atomic_add_affected_planes(state, crtc);
>   			if (ret)
>   				goto fail;
> @@ -11769,8 +11775,16 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
>   
>   		/* Overlay cusor not subject to native cursor restrictions */
>   		dm_new_crtc_state = to_dm_crtc_state(new_crtc_state);
> -		if (dm_new_crtc_state->cursor_mode == DM_CURSOR_OVERLAY_MODE)
> +		if (dm_new_crtc_state->cursor_mode == DM_CURSOR_OVERLAY_MODE){
> +			if(dc->current_state->stream_status->plane_count > MAX_SURFACES){
> +				drm_dbg_driver(crtc->dev,
> +				       "Can't enable cursor plane with %d planes\n", MAX_SURFACES);
> +				ret = -EINVAL;
> +				goto fail;
> +			}
> +			
>   			continue;
> +		}
>   
>   		/* Check if rotation or scaling is enabled on DCN401 */
>   		if ((drm_plane_mask(crtc->cursor) & new_crtc_state->plane_mask) &&

