Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E90AA12680
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 15:50:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7234A10E70A;
	Wed, 15 Jan 2025 14:50:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="er1ESIUB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10EAD10E771;
 Wed, 15 Jan 2025 14:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v9AOha7q2BJbDk7BeY+078h2l+NwyfesTO2SoUQ4E04=; b=er1ESIUBCLVWJwp0oQt77R0Nj2
 C8cxMCFU+t15t9Z7VdYGNbw/RIKptNBhFQve9yTYl+Q28Wb4kOm8Ad6qRL3Fe6PumS4c5/0pWRpaZ
 EIWVng6jt0PrScSnFdknYzigLptwcJfPLhJiAmIYnSDuh70G+Hb6rEaGJ+pY1SKdyyX0kbb5MOuUq
 FTy2epzwjWOxU8HyBR5iDo1iyq1blYb48xnlHDUTYcL2pYdRU9pcrSyElMXOBL2a8jdiR6nVVY0QE
 XnMA3WyJR4QBN5lzqWBqe2GEBtEjqN37nr5PS9Go8HdWqiVY/BFSYUjdhLJBs1E0EXLITHmqe+vO+
 XHMZWS4Q==;
Received: from [177.139.21.57] (helo=[192.168.15.100])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tY4iS-00G7VC-UT; Wed, 15 Jan 2025 15:49:57 +0100
Message-ID: <7676d80e-2310-47db-86fd-5711f7f19b89@igalia.com>
Date: Wed, 15 Jan 2025 11:49:50 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/2] drm/amdgpu: Enable async flip on overlay planes
To: Harry Wentland <harry.wentland@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Simona Vetter <simona@ffwll.ch>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Simon Ser
 <contact@emersion.fr>, dmitry.baryshkov@linaro.org,
 Xinhui Pan <Xinhui.Pan@amd.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Xaver Hugl <xaver.hugl@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Stone <daniel@fooishbar.org>, dri-devel@lists.freedesktop.org,
 joshua@froggi.es, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Leo Li <sunpeng.li@amd.com>, ville.syrjala@linux.intel.com
References: <20241212-tonyk-async_flip-v11-0-14379434be70@igalia.com>
 <20241212-tonyk-async_flip-v11-2-14379434be70@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20241212-tonyk-async_flip-v11-2-14379434be70@igalia.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Harry,

Gentle ping on this one :)

Em 12/12/2024 16:19, André Almeida escreveu:
> amdgpu can handle async flips on overlay planes, so allow it for atomic
> async checks.
> 
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> index 495e3cd70426db0182cb2811bc6d5d09f52f8a4b..2792d393157beec12d6e96843c43158c03f16027 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> @@ -1260,22 +1260,25 @@ static int amdgpu_dm_plane_atomic_check(struct drm_plane *plane,
>   }
>   
>   static int amdgpu_dm_plane_atomic_async_check(struct drm_plane *plane,
> -					      struct drm_atomic_state *state)
> +					      struct drm_atomic_state *state, bool flip)
>   {
>   	struct drm_crtc_state *new_crtc_state;
>   	struct drm_plane_state *new_plane_state;
>   	struct dm_crtc_state *dm_new_crtc_state;
>   
> -	/* Only support async updates on cursor planes. */
> -	if (plane->type != DRM_PLANE_TYPE_CURSOR)
> +	if (flip) {
> +		if (plane->type != DRM_PLANE_TYPE_OVERLAY)
> +			return -EINVAL;
> +	} else if (plane->type != DRM_PLANE_TYPE_CURSOR)
>   		return -EINVAL;
>   
>   	new_plane_state = drm_atomic_get_new_plane_state(state, plane);
>   	new_crtc_state = drm_atomic_get_new_crtc_state(state, new_plane_state->crtc);
>   	dm_new_crtc_state = to_dm_crtc_state(new_crtc_state);
>   	/* Reject overlay cursors for now*/
> -	if (dm_new_crtc_state->cursor_mode == DM_CURSOR_OVERLAY_MODE)
> +	if (!flip && dm_new_crtc_state->cursor_mode == DM_CURSOR_OVERLAY_MODE) {
>   		return -EINVAL;
> +	}
>   
>   	return 0;
>   }
> 

