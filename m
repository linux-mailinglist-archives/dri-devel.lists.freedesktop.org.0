Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 720AF44B18E
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 17:51:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D81D89DD8;
	Tue,  9 Nov 2021 16:51:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2745 seconds by postgrey-1.36 at gabe;
 Tue, 09 Nov 2021 16:51:16 UTC
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1234::107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8E1B89D4A
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Nov 2021 16:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=XDU+9igmpCB85REE+/wNVC8TdK7iPyISbmV/9GyGl/0=; b=HQCp+aPWqoqcd+b68MG+H8KyYw
 3c6plEJNlnVS3/4Ogml0JnIM822L3MIm8b+5SyCI2RdLmNz+bnzE2A56eSTJ2cvT81hw2EpufHUht
 4aCky2r7Hsi+bsxjE6O2jrYCkIGYf3M/Y2RJ6KTBo8T+xiMR/rBklYEPChe3qXJzNVjNyXiXoxSup
 Xghqj0z+YAVwmZgSNrw+L2lJs9cLgLWsHermT9PjfuZ6LDhQgoSQ/CMke+sRt6KLt0zTtAd75Ap7H
 AdL83GRjdTtE+/U/wZeLFiWewFLXZTJ2SumfIyh1wnmVkUEND/HhCuf7EUkQW5Z+FGELolpImIvYO
 NyL+ZWgg==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by merlin.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkUL4-008o9f-78; Tue, 09 Nov 2021 16:51:14 +0000
Subject: Re: [PATCH] [RESEND] drm/rcar: stop using 'imply' for dependencies
To: Arnd Bergmann <arnd@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20210927142629.2016647-1-arnd@kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <d4f45653-ca8d-733e-ba5f-cc911d4ccaf9@infradead.org>
Date: Tue, 9 Nov 2021 08:51:09 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210927142629.2016647-1-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/27/21 7:26 AM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The meaning of the 'imply' keyword has changed recently, and neither the
> old meaning (select the symbol if its dependencies are met) nor the new
> meaning (enable it by default, but let the user set any other setting)
> is what we want here.
> 
> Work around this by adding two more Kconfig options that lead to
> the correct behavior: if DRM_RCAR_USE_CMM and DRM_RCAR_USE_LVDS
> are enabled, that portion of the driver becomes usable, and no
> configuration results in a link error.
> 
> This avoids a link failure:
> 
> arm-linux-gnueabi-ld: drivers/gpu/drm/rcar-du/rcar_du_crtc.o: in function `rcar_du_crtc_atomic_begin':
> rcar_du_crtc.c:(.text+0x1444): undefined reference to `rcar_cmm_setup'
> arm-linux-gnueabi-ld: drivers/gpu/drm/rcar-du/rcar_du_crtc.o: in function `rcar_du_crtc_atomic_enable':
> rcar_du_crtc.c:(.text+0x14d4): undefined reference to `rcar_cmm_enable'
> arm-linux-gnueabi-ld: rcar_du_crtc.c:(.text+0x1548): undefined reference to `rcar_cmm_setup'
> arm-linux-gnueabi-ld: drivers/gpu/drm/rcar-du/rcar_du_crtc.o: in function `rcar_du_crtc_atomic_disable':
> rcar_du_crtc.c:(.text+0x18b8): undefined reference to `rcar_cmm_disable'
> arm-linux-gnueabi-ld: drivers/gpu/drm/rcar-du/rcar_du_kms.o: in function `rcar_du_modeset_init':
> 
> Link: https://lore.kernel.org/all/20200417155553.675905-5-arnd@arndb.de/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> This was last posted as part of a longer series to rework the
> DRM dependencies in a more logical way. The rest of the series
> is still open, but this one is needed as a bug fix regardless of
> the rest.
> ---
>   drivers/gpu/drm/rcar-du/Kconfig | 25 ++++++++++++++++---------
>   1 file changed, 16 insertions(+), 9 deletions(-)
> 

Yes Yes Yes.

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

-- 
~Randy
