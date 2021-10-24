Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 856F34387A5
	for <lists+dri-devel@lfdr.de>; Sun, 24 Oct 2021 10:33:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C70F589FA0;
	Sun, 24 Oct 2021 08:33:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52CE089FA0
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Oct 2021 08:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202012;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=65RlaRrC7lDrEjewQhWmAarZm2pT+v5fMP7uMLXsL6c=; b=adz02WEnV/TxS7So01KXMEIB6v
 fPN7H8wTmJwWlV5rkGrES3sjst0LNicPXGN5ypTbhteKKFocsK+PFFVeGFCDhQyj0LPE5R0zkw0rq
 IytBm007J06iBPCBX/fIrVtTHrvbg0nYUqq5mqvmZ7f/CMb5Koelk7L7pxvAon4JIMdvhvCGcHPJR
 vl9Xayj3/+1SFt4duYl70pjr76Ag6JsDjwKWj+aC7t/2zwdi78TI2Er9LpvMnG5t3eqx5ZO2YrbU6
 w+1WAi2rJOIi2hYPEmn3TUK66hseiMZg9cTnKxFo2WDubYYuqkKhTqMFkkD0k87bK7bZM7JpAgggC
 078lahHw==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:49388
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1meYwU-00084L-4U; Sun, 24 Oct 2021 10:33:22 +0200
Subject: Re: [PATCH 3/9] drm/format-helper: Add destination-buffer pitch to
 drm_fb_swab()
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 drawat.floss@gmail.com, airlied@redhat.com, kraxel@redhat.com,
 david@lechnology.com, sam@ravnborg.org, javierm@redhat.com,
 kernel@amanoeldawod.com, dirty.ice.hu@gmail.com, michael+lkml@stapelberg.ch,
 aros@gmx.com, joshua@stroblindustries.com, arnd@arndb.de
Cc: dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 virtualization@lists.linux-foundation.org
References: <20211022132829.7697-1-tzimmermann@suse.de>
 <20211022132829.7697-4-tzimmermann@suse.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <5df27b45-c560-3495-5fc3-91b30684eb25@tronnes.org>
Date: Sun, 24 Oct 2021 10:33:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211022132829.7697-4-tzimmermann@suse.de>
Content-Type: text/plain; charset=utf-8
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



Den 22.10.2021 15.28, skrev Thomas Zimmermann:
> Add destination-buffer pitch as argument to drm_fb_swab(). Done for
> consistency with the rest of the interface.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_format_helper.c | 19 +++++++++++++++----
>  drivers/gpu/drm/drm_mipi_dbi.c      |  2 +-
>  drivers/gpu/drm/gud/gud_pipe.c      |  2 +-
>  include/drm/drm_format_helper.h     |  5 +++--
>  4 files changed, 20 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
> index 38c8055f6fa8..79869ed553d9 100644
> --- a/drivers/gpu/drm/drm_format_helper.c
> +++ b/drivers/gpu/drm/drm_format_helper.c
> @@ -92,6 +92,7 @@ EXPORT_SYMBOL(drm_fb_memcpy_toio);
>  /**
>   * drm_fb_swab - Swap bytes into clip buffer
>   * @dst: Destination buffer
> + * @dst_pitch: Number of bytes between two consecutive scanlines within dst
>   * @src: Source buffer
>   * @fb: DRM framebuffer
>   * @clip: Clip rectangle area to copy
> @@ -103,19 +104,25 @@ EXPORT_SYMBOL(drm_fb_memcpy_toio);
>   * This function does not apply clipping on dst, i.e. the destination

You have changed this line on the other functions, maybe you just missed
it here:

>   * is a small buffer containing the clip rect only.
>   */
> -void drm_fb_swab(void *dst, void *src, struct drm_framebuffer *fb,
> -		 struct drm_rect *clip, bool cached)
> +void drm_fb_swab(void *dst, unsigned int dst_pitch, const void *src,
> +		 const struct drm_framebuffer *fb, const struct drm_rect *clip,
> +		 bool cached)

Tested-by: Noralf Trønnes <noralf@tronnes.org>
Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
