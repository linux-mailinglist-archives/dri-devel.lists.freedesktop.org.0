Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD48C82B3B4
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 18:10:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6741710E96D;
	Thu, 11 Jan 2024 17:10:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9853210E96D
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 17:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fRbEoRMDEy3NVmmNQG2pO+iYxYN+EhinDamEmnsGggc=; b=lyZRsZEMxnwtUCSbC5MX4jFDde
 L6cx2JFgKaTLYFS+JVRJSyBO1JzGeuaH6IyigL3LN4r4nxrFEkGR9n67nbKndladdplQ8E2JX1cCp
 u29orTlIQ3nTbrxu0VNbRLLJmuM5IgqmZvJnFfgKEEFrXlbbSbhrSZ0j/Xr6JUNBEZIV9jscfbBQk
 WkmCfml+XbX9CluNJVZrin/y905sD0mED5ALTigcW3pAM0P5ewwjGRliISvx9cqQTTIFCUOq2s9bq
 bV8tgIwCInAnHvI3VuXIyBZMXxjCenXykYFwRZlHf8RykCfWsD7/dOppSnY6qt0oxBI+Q0qXrn+BH
 xNepJFpw==;
Received: from 189-68-200-18.dsl.telesp.net.br ([189.68.200.18]
 helo=[192.168.1.111]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1rNyZi-005T9Z-O6; Thu, 11 Jan 2024 18:10:38 +0100
Message-ID: <9247e06b-6466-4eca-834e-d583e477b0b0@igalia.com>
Date: Thu, 11 Jan 2024 14:10:34 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: allow IN_FENCE_FD and FB_DAMAGE_CLIPS to be changed
 with async commits
To: Xaver Hugl <xaver.hugl@gmail.com>
References: <20240111165615.27587-1-xaver.hugl@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20240111165615.27587-1-xaver.hugl@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Xaver,

Em 11/01/2024 13:56, Xaver Hugl escreveu:
> Like with FB_ID, the driver never has to do bandwidth validation to use
> these properties, so there's no reason not to allow them.
> 
> Signed-off-by: Xaver Hugl <xaver.hugl@gmail.com>

Reviewed-by: André Almeida <andrealmeid@igalia.com>

> ---
>   drivers/gpu/drm/drm_atomic_uapi.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index aee4a65d4959..06d476f5a746 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -1108,7 +1108,9 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
>   			break;
>   		}
>   
> -		if (async_flip && prop != config->prop_fb_id) {
> +		if (async_flip && prop != config->prop_fb_id &&
> +			prop != config->prop_in_fence_fd &&
> +			prop != config->prop_fb_damage_clips) {
>   			ret = drm_atomic_plane_get_property(plane, plane_state,
>   							    prop, &old_val);
>   			ret = drm_atomic_check_prop_changes(ret, old_val, prop_value, prop);
