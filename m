Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C4758CECC
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 22:01:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6BBD112DD2;
	Mon,  8 Aug 2022 20:01:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE2F3112E7D
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 20:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c7Zd4O0W+WvPJ2kFFhB/D//vEX5vQtcJh1hMBR2QZy4=; b=jq2HrWKIWNi9tUpohTPdrWD786
 fOtUK4PsKHgnYx3UQRr2zPHRRNDw1rusFYbzEnWNjl3Nh793tU+5QZvTrpSbh9MGsyGpZreI5Bye4
 xMjMlw3aP4qHr0hqFjg/VSu6htf3E31LbqEWUFN11QYLd3949gITYETlKm+Z4bBaSrFhFIMGqnoWS
 5MDtw8qksvaOy6rB96K0rqWVpGQbwcLtUV6TFgeQWIIoglOg5MhSZ4FRmrirvZkgfACeIy1tq5g8f
 Ex9nuiM9rwDmrpxyehB/Yv+NHUZLu8CAuDHbBVSpS0FP/KZwBj0co8HbJOCX8B5CsBtrTtdo/nvwa
 E0q2+umw==;
Received: from [2a01:799:961:d200:c193:6d77:c9c8:8] (port=62215)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1oL8vq-0002K0-NE; Mon, 08 Aug 2022 22:00:58 +0200
Message-ID: <3ecad8dc-5fcf-c63a-ce3c-aa4c3ef22850@tronnes.org>
Date: Mon, 8 Aug 2022 22:00:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 00/14] drm/format-helper: Move to struct iosys_map
To: Thomas Zimmermann <tzimmermann@suse.de>, sam@ravnborg.org,
 jose.exposito89@gmail.com, javierm@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, drawat.floss@gmail.com, lucas.demarchi@intel.com,
 david@lechnology.com, kraxel@redhat.com
References: <20220808125406.20752-1-tzimmermann@suse.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220808125406.20752-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-hyperv@vger.kernel.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 08.08.2022 14.53, skrev Thomas Zimmermann:
> Change format-conversion helpers to use struct iosys_map for source
> and destination buffers. Update all users. Also prepare interface for
> multi-plane color formats.
> 
> The format-conversion helpers mostly used to convert to I/O memory
> or system memory. To actual memory type depended on the usecase. We
> now have drivers upcomming that do the conversion entirely in system
> memory. It's a good opportunity to stream-line the interface of the
> conversion helpers to use struct iosys_map. Source and destination
> buffers can now be either in system or in I/O memory. Note that the
> implementation still only supports source buffers in system memory.
> 
> This patchset also changes the interface to support multi-plane
> color formats, where the values for each component are stored in
> distinct memory locations. Converting from RGBRGBRGB to RRRGGGBBB
> would require a single source buffer with RGB values and 3 destination
> buffers for the R, G and B values. Conversion-helper interfaces now
> support this.
> 
> v2:
> 	* add IOSYS_MAP_INIT_VADDR_IOMEM (Sam)
> 	* use drm_format_info_bpp() (Sam)
> 	* update documentation (Sam)
> 	* rename 'vmap' to 'src' (Sam)
> 	* many smaller cleanups and fixes (Sam, Jose)
> 
> Thomas Zimmermann (14):
>   iosys-map: Add IOSYS_MAP_INIT_VADDR_IOMEM()
>   drm/format-helper: Provide drm_fb_blit()
>   drm/format-helper: Merge drm_fb_memcpy() and drm_fb_memcpy_toio()
>   drm/format-helper: Convert drm_fb_swab() to struct iosys_map
>   drm/format-helper: Rework XRGB8888-to-RGBG332 conversion
>   drm/format-helper: Rework XRGB8888-to-RGBG565 conversion
>   drm/format-helper: Rework XRGB8888-to-RGB888 conversion
>   drm/format-helper: Rework RGB565-to-XRGB8888 conversion
>   drm/format-helper: Rework RGB888-to-XRGB8888 conversion
>   drm/format-helper: Rework XRGB8888-to-XRGB2101010 conversion
>   drm/format-helper: Rework XRGB8888-to-GRAY8 conversion
>   drm/format-helper: Rework XRGB8888-to-MONO conversion
>   drm/format-helper: Move destination-buffer handling into internal
>     helper
>   drm/format-helper: Rename parameter vmap to src
> 

Tested-by: Noralf Trønnes <noralf@tronnes.org>

* gud: XRGB8888-to-{MONO,GRAY8,RGB332,RGB565}
* mi0283qt (drm_mipi_dbi): XRGB8888-to-RGB565 with swap=true,
drm_fb_memcpy, drm_fb_swab

>  drivers/gpu/drm/drm_format_helper.c           | 509 ++++++++++--------
>  drivers/gpu/drm/drm_mipi_dbi.c                |   9 +-
>  drivers/gpu/drm/gud/gud_pipe.c                |  20 +-
>  drivers/gpu/drm/hyperv/hyperv_drm_modeset.c   |   9 +-
>  drivers/gpu/drm/mgag200/mgag200_mode.c        |   9 +-
>  drivers/gpu/drm/solomon/ssd130x.c             |   7 +-
>  .../gpu/drm/tests/drm_format_helper_test.c    |  45 +-
>  drivers/gpu/drm/tiny/cirrus.c                 |  19 +-
>  drivers/gpu/drm/tiny/repaper.c                |   6 +-
>  drivers/gpu/drm/tiny/simpledrm.c              |   8 +-
>  drivers/gpu/drm/tiny/st7586.c                 |   5 +-
>  include/drm/drm_format_helper.h               |  56 +-
>  include/linux/iosys-map.h                     |  15 +-
>  13 files changed, 416 insertions(+), 301 deletions(-)
> 
> 
> base-commit: 2bdae66c9988dd0f07633629c0a85383cfc05940
> prerequisite-patch-id: c2b2f08f0eccc9f5df0c0da49fa1d36267deb11d
> prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
> prerequisite-patch-id: 3f204510fcbf9530d6540bd8e6128cce598988b6
