Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEF96016C9
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 21:00:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 837FF10E032;
	Mon, 17 Oct 2022 19:00:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5975A10E032
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 19:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=metanate.com; s=stronger; h=In-Reply-To:Content-Type:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description; bh=KaiF/SCfWzsRvXRBubrvLDOWGhfVrO/hXf7iRdDzGmk=; b=sHtai
 yqAEg9DkUpwrXBnspJ5VZMuZQYaZ85XTaLkxgnHhfTQX2I30OjhPcYuA3AuXZDtMwnIFhYyQAXt2N
 18wzcdV8ZRPLAxg+4proMrSifd0wnRENgY5rwQnZ1qTqv0RJxf6Br/K3HPIShZkClZU6+xHRtsTht
 bNCdWtd6sf2ipr6EFhyxr0e8wN4ruwhobn7jZPeUA/pNszAz1JqpGrGd6HQktfLpmFMLBq74H2+gu
 eOstzi+9GjOYkMAdpaNHU1XeExVa9bHTQQJa4zmcBnMPrc0KBqiQR1NYU+iIl+wqnl9dcB7fFzRC9
 iaHWgHFF4q11A/ryHRFmhlWnHesrg==;
Received: from [81.174.171.191] (helo=donbot)
 by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.95) (envelope-from <john@metanate.com>) id 1okVLZ-0006Sk-25;
 Mon, 17 Oct 2022 20:00:22 +0100
Date: Mon, 17 Oct 2022 20:00:21 +0100
From: John Keeping <john@metanate.com>
To: Johan Jonker <jbx6244@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [BUG] [PATCH] drm/rockchip: use generic fbdev setup
Message-ID: <Y02mRUuecw2C1i+h@donbot>
References: <20211029115014.264084-1-john@metanate.com>
 <d814394b-86c3-beb1-ddd4-04c65004f138@gmail.com>
 <Y00o3M7SKAB/w9sW@donbot> <2220890.jZfb76A358@phil>
 <c4bf7723-b3b8-0955-5ba3-e4d05bdc835a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4bf7723-b3b8-0955-5ba3-e4d05bdc835a@gmail.com>
X-Authenticated: YES
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sandy Huang <hjc@rock-chips.com>,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 17, 2022 at 08:30:23PM +0200, Johan Jonker wrote:
> 
> 
> On 10/17/22 13:29, Heiko Stuebner wrote:
> > Am Montag, 17. Oktober 2022, 12:05:16 CEST schrieb John Keeping:
> >> Hi Johan,
> >>
> >> On Mon, Oct 17, 2022 at 10:11:32AM +0200, Johan Jonker wrote:
> >>> Your patch contribution causes a kernel panic on MK808 with Rockchip rk3066a SoC.
> >>> Would you like to contribute to fix this issue?
> >>> The assumtion that drm_fbdev_generic_setup() does what rockchip_drm_fbdev_init did is not true!
> >>> A revert makes it work again.
> >>
> 
> >> It looks like there are 3 different ways to end up with -ENOMEM here,
> >> can you track down whether you're hitting one of the cases in
> >> rockchip_gem_prime_vmap() or if it's the iosys_map_is_null case in
> >> drm_gem_vmap()?
> 
> It looks like it comes from rockchip_gem_prime_vmap() second return (2).
> 
> 
> 	if (rk_obj->dma_attrs & DMA_ATTR_NO_KERNEL_MAPPING) {
> 
> ////////////////
> 
> 		printk("FBDEV rockchip_gem_prime_vmap 2");
> 
> ////////////////
> 		return -ENOMEM;
> 	}

Ah-ha, Heiko was right that this is because the no-iommu path is broken
as a result of switching to the generic fbdev code.

This patch should fix it, but I wonder if Thomas has any ideas about a
better way to handle this since it feels a bit hacky to special-case the
fb_helper inside the GEM code:

-- >8 --
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
index 614e97aaac80..da8a69953706 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
@@ -364,9 +364,12 @@ rockchip_gem_create_with_handle(struct drm_file *file_priv,
 {
 	struct rockchip_gem_object *rk_obj;
 	struct drm_gem_object *obj;
+	bool is_framebuffer;
 	int ret;
 
-	rk_obj = rockchip_gem_create_object(drm, size, false);
+	is_framebuffer = drm->fb_helper && file_priv == drm->fb_helper->client.file;
+
+	rk_obj = rockchip_gem_create_object(drm, size, is_framebuffer);
 	if (IS_ERR(rk_obj))
 		return ERR_CAST(rk_obj);
-- 8< -- 
