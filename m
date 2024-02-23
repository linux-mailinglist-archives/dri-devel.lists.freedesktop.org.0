Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3665E86123B
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 14:07:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 795EB10EC00;
	Fri, 23 Feb 2024 13:07:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="F6N+SaA+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B853C10EBD5
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 11:52:42 +0000 (UTC)
Received: from mx0.riseup.net (mx0-pn.riseup.net [10.0.1.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4Th7fy312GzDqH8
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 11:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1708689162; bh=OUmiIYV1ZOxPQwwDzWBugUjrO/94kZzGcCCUhw19TKo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=F6N+SaA+KaOhwT2CycoSYXxA5EEWi9Zj8r6Xe3PUh8NOpgGjFs2fTngR+I6uEBS7R
 BzmQ6PbtuIcUvCCEU+dl59pFZldvejsC2zNUxcRnEuJoeQk6gWILzOMYHsW9Hb/7Q5
 ViDLRbNkOpByE+3o/EZXNwNBgusT0DQA74cWkxac=
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4Th7fx1tgFz9wx0;
 Fri, 23 Feb 2024 11:52:41 +0000 (UTC)
X-Riseup-User-ID: 0EF8E654CC1AEAB381F9584BCE1A40612DF66BFDD921DB16F4891EE24A96A184
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4Th7fr1hYYzFsSY;
 Fri, 23 Feb 2024 11:52:35 +0000 (UTC)
Message-ID: <282a368c-6713-4c36-8713-4e081025b0bb@riseup.net>
Date: Fri, 23 Feb 2024 08:52:33 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/9] drm/vkms: Reimplement line-per-line pixel
 conversion for plane reading
Content-Language: en-US
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, arthurgrillo@riseup.net,
 Jonathan Corbet <corbet@lwn.net>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com
References: <20240223-yuv-v2-0-aa6be2827bb7@bootlin.com>
From: Maira Canal <mairacanal@riseup.net>
In-Reply-To: <20240223-yuv-v2-0-aa6be2827bb7@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 23 Feb 2024 13:07:09 +0000
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

Hi Louis,

On 2/23/24 08:37, Louis Chauvet wrote:
> This patchset is the second version of [1]. It is almost a complete
> rewrite to use a line-by-line algorithm for the composition.
> It can be divided in three parts:
> - PATCH 1 to 4: no functional change is intended, only some formatting and
> documenting
> (PATCH 2 is taken from [2])
> - PATCH 5: main patch for this series, it reintroduce the
> line-by-line algorithm
> - PATCH 6 to 9: taken from Arthur's series [2], with sometimes adaptation
> to use the pixel-by-pixel algorithm.
> 
> The PATCH 5 aims to restore the line-by-line pixel reading algorithm. It
> was introduced in 8ba1648567e2 ("drm: vkms: Refactor the plane composer to
> accept new formats") but removed in 8ba1648567e2 ("drm: vkms: Refactor the
> plane composer to accept new formats") in a over-simplification effort.
> At this time, nobody noticed the performance impact of this commit. After
> the first iteration of my series, poeple notice performance impact, and it
> was the case. Pekka suggested to reimplement the line-by-line algorithm.
> 
> Expiriments on my side shown great improvement for the line-by-line
> algorithm, and the performances are the same as the original line-by-line
> algorithm. I targeted my effort to make the code working for all the
> rotations and translations. The usage of helpers from drm_rect_* avoid
> reimplementing existing logic.
> 
> The only "complex" part remaining is the clipping of the coordinate to
> avoid reading/writing outside of src/dst. Thus I added a lot of comments
> to help when someone will want to add some features (framebuffer resizing
> for example).
> 
> The YUV part is not mandatory for this series, but as my first effort was
> to help the integration of YUV, I decided to rebase Arthur's series on
> mine to help. I took [3], [4], [5] and [6] and adapted them to use the
> line-by-line reading. If I did something wrong here, please let me
> know.
> 
> My series was mainly tested with:
> - kms_plane (for color conversions)
> - kms_rotation_crc (for rotations of planes)
> - kms_cursor_crc (for translations)
> The benchmark used to measure the improvment was done with:
> - kms_fb_stress
> 
> [1]: https://lore.kernel.org/r/20240201-yuv-v1-0-3ca376f27632@bootlin.com
> [2]: https://lore.kernel.org/all/20240110-vkms-yuv-v2-0-952fcaa5a193@riseup.net/
> [3]: https://lore.kernel.org/all/20240110-vkms-yuv-v2-3-952fcaa5a193@riseup.net/
> [4]: https://lore.kernel.org/all/20240110-vkms-yuv-v2-5-952fcaa5a193@riseup.net/
> [5]: https://lore.kernel.org/all/20240110-vkms-yuv-v2-6-952fcaa5a193@riseup.net/
> [6]: https://lore.kernel.org/all/20240110-vkms-yuv-v2-7-952fcaa5a193@riseup.net/
> 
> To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> To: Melissa Wen <melissa.srw@gmail.com>
> To: Maíra Canal <mairacanal@riseup.net>
> To: Haneen Mohammed <hamohammed.sa@gmail.com>
> To: Daniel Vetter <daniel@ffwll.ch>
> To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> To: Maxime Ripard <mripard@kernel.org>
> To: Thomas Zimmermann <tzimmermann@suse.de>
> To: David Airlie <airlied@gmail.com>
> To: arthurgrillo@riseup.net
> To: Jonathan Corbet <corbet@lwn.net>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Cc: jeremie.dautheribes@bootlin.com
> Cc: miquel.raynal@bootlin.com
> Cc: thomas.petazzoni@bootlin.com
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> 
> Note: after my changes, those tests seems to pass, so [7] may need
> updating (I did not check, it was maybe already the case):
> - kms_cursor_legacy@flip-vs-cursor-atomic
> - kms_pipe_crc_basic@nonblocking-crc
> - kms_pipe_crc_basic@nonblocking-crc-frame-sequence
> - kms_writeback@writeback-pixel-formats
> - kms_writeback@writeback-invalid-parameters
> - kms_flip@flip-vs-absolute-wf_vblank-interruptible
> And those tests pass, I did not investigate why the runners fails:
> - kms_flip@flip-vs-expired-vblank-interruptible
> - kms_flip@flip-vs-expired-vblank
> - kms_flip@plain-flip-fb-recreate
> - kms_flip@plain-flip-fb-recreate-interruptible
> - kms_flip@plain-flip-ts-check-interruptible
> - kms_cursor_legacy@cursorA-vs-flipA-toggle
> - kms_pipe_crc_basic@nonblocking-crc
> - kms_prop_blob@invalid-get-prop
> - kms_flip@flip-vs-absolute-wf_vblank-interruptible
> - kms_invalid_mode@zero-hdisplay
> - kms_invalid_mode@bad-vtotal
> - kms_cursor_crc.* (everything is SUCCEED or SKIP, but no fails)

This is great news! Could you just adjust the series fixing the
compiling errors?

Best Regards,
- Maíra

> 
> [7]: https://lore.kernel.org/all/20240201065346.801038-1-vignesh.raman@collabora.com/
> 
> Changes in v2:
> - Rebased the series on top of drm-misc/drm-misc-net
> - Extract the typedef for pixel_read/pixel_write
> - Introduce the line-by-line algorithm per pixel format
> - Add some documentation for existing and new code
> - Port the series [1] to use line-by-line algorithm
> - Link to v1: https://lore.kernel.org/r/20240201-yuv-v1-0-3ca376f27632@bootlin.com
> 
> ---
> Arthur Grillo (5):
>        drm/vkms: Use drm_frame directly
>        drm/vkms: Add YUV support
>        drm/vkms: Add range and encoding properties to pixel_read function
>        drm/vkms: Drop YUV formats TODO
>        drm/vkms: Create KUnit tests for YUV conversions
> 
> Louis Chauvet (4):
>        drm/vkms: Code formatting
>        drm/vkms: write/update the documentation for pixel conversion and pixel write functions
>        drm/vkms: Add typedef and documentation for pixel_read and pixel_write functions
>        drm/vkms: Re-introduce line-per-line composition algorithm
> 
>   Documentation/gpu/vkms.rst                    |   3 +-
>   drivers/gpu/drm/vkms/Makefile                 |   1 +
>   drivers/gpu/drm/vkms/tests/.kunitconfig       |   4 +
>   drivers/gpu/drm/vkms/tests/Makefile           |   3 +
>   drivers/gpu/drm/vkms/tests/vkms_format_test.c | 155 +++++++
>   drivers/gpu/drm/vkms/vkms_composer.c          | 233 ++++++++---
>   drivers/gpu/drm/vkms/vkms_crtc.c              |   6 +-
>   drivers/gpu/drm/vkms/vkms_drv.c               |   3 +-
>   drivers/gpu/drm/vkms/vkms_drv.h               |  56 ++-
>   drivers/gpu/drm/vkms/vkms_formats.c           | 565 +++++++++++++++++++++-----
>   drivers/gpu/drm/vkms/vkms_formats.h           |  13 +-
>   drivers/gpu/drm/vkms/vkms_plane.c             |  50 ++-
>   drivers/gpu/drm/vkms/vkms_writeback.c         |  14 +-
>   13 files changed, 916 insertions(+), 190 deletions(-)
> ---
> base-commit: aa1267e673fe5307cf00d02add4017d2878598b6
> change-id: 20240201-yuv-1337d90d9576
> 
> Best regards,
