Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DFD58924C
	for <lists+dri-devel@lfdr.de>; Wed,  3 Aug 2022 20:31:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 151E510E67F;
	Wed,  3 Aug 2022 18:31:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod1-cph3.one.com
 (mailrelay1-1.pub.mailoutpod1-cph3.one.com [46.30.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBCBB18A39D
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Aug 2022 18:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=65y2wtoqQCBqVrsSrAIKNGOeVAKV8o3MY4b6Y1Eav/A=;
 b=i90WrpF9CC81gCX+wdbGglJ0U/k3X3fJ4JXp9ptxLzvG5E7uiJLMypjAaaF4jB5KTiGWPCdKoajE8
 ooz47gnkb6mSjKzlrOESUc0TQsqYKwqVO+1WmK0rsMOpboZYb1Qve+Iou/7UEsTGXtcjKJtJYbp+kJ
 LnvY+2p6MJKW5QrALMEViFwVea1KuTxCLzoSeR7rtrIDFd7cRnTZjKK4t6WtfIvpXyGH8BmUc73C4i
 jcQAploP6jVspv8kguDp6JyeBkamP1vtWvFrzIDgGZd9cvQn6t45ymW0jkZsHkGbIJdyl77xmwXPFj
 6Qgw6kgK2ZhewB71IiW+CERPXI18J8A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=65y2wtoqQCBqVrsSrAIKNGOeVAKV8o3MY4b6Y1Eav/A=;
 b=e/s5UO7hlZU1T+u4r+DFOChz3ljq+1Z3e+7Jq+MXTxZk2i4Az26l0euzk7rgnwXDpgkeE11zMwW39
 Q6/ji2wDw==
X-HalOne-Cookie: fcc8388dc46c66a467ca33f7355d09cec17be80e
X-HalOne-ID: 7185b375-135a-11ed-a6ca-d0431ea8a283
Received: from mailproxy2.cst.dirpod3-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 7185b375-135a-11ed-a6ca-d0431ea8a283;
 Wed, 03 Aug 2022 18:31:09 +0000 (UTC)
Date: Wed, 3 Aug 2022 20:31:07 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH] drm/virtio: remove drm_plane_cleanup() destroy hook
Message-ID: <Yuq+63QAyOYQvbvX@ravnborg.org>
References: <20220803145520.1143208-1-dakr@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220803145520.1143208-1-dakr@redhat.com>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, kraxel@redhat.com,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Danilo,

On Wed, Aug 03, 2022 at 04:55:20PM +0200, Danilo Krummrich wrote:
> drmm_universal_plane_alloc() already registers drm_plane_cleanup() as
> managed release action via drmm_add_action_or_reset(). Hence,
> drm_plane_cleanup() should not be set as drm_plane_funcs.destroy hook.
> 
> Fixes: 7847628862a8 ("drm/virtio: plane: use drm managed resources")
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/virtio/virtgpu_plane.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
> index c599c99f228e..4c09e313bebc 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_plane.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
> @@ -69,7 +69,6 @@ uint32_t virtio_gpu_translate_format(uint32_t drm_fourcc)
>  static const struct drm_plane_funcs virtio_gpu_plane_funcs = {
>  	.update_plane		= drm_atomic_helper_update_plane,
>  	.disable_plane		= drm_atomic_helper_disable_plane,
> -	.destroy		= drm_plane_cleanup,
>  	.reset			= drm_atomic_helper_plane_reset,
>  	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
>  	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
> -- 
> 2.37.1
