Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 345F8872205
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 15:53:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66FE4112B80;
	Tue,  5 Mar 2024 14:53:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AFaPK0fe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7442A112B8C
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 14:53:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A8377CE1C4B;
 Tue,  5 Mar 2024 14:53:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58739C433F1;
 Tue,  5 Mar 2024 14:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709650410;
 bh=48ZBckNm2eTa/sKxgF1YiQKzL2MaEvFkqjIo4/LE9Vk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AFaPK0feEGMGeOkaMvrUZbB6RlgYm8OqEZEYJhYHFz/ODm7eNdH4OGs/P6UaKiFDN
 9qaSfnvABA4Tb0ojU/C4n+EU3RclN7vPmEfCUbSr8nSYTyTDo8lBjTzLEaWv49e2IM
 qi0KGR1yq7I4pfIG4pXBdqd0rlEOwM9Gpv6TWQoxWt8kubqSktXoEQR/O384SVBSx8
 EH7lr7jehI/TO4X+495/fmLhA6y08T3WUeNY0u5r2G9iGmGXi3P1bF1uV9PqmSJcyx
 asLfB3tfEM+Hx+KpiKExQXvPHnePapUzA9YN/naYDjph6VVlInH9CB4T6txSf6AWGN
 wp1ycOIO+IuuA==
Date: Tue, 5 Mar 2024 14:53:25 +0000
From: Lee Jones <lee@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: andy@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 deller@gmx.de, robin@protonic.nl, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-input@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v3 00/10] backlight: Replace struct fb_info in interfaces
Message-ID: <20240305145325.GF86322@google.com>
References: <20240304163220.19144-1-tzimmermann@suse.de>
 <20240305104459.GA86322@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240305104459.GA86322@google.com>
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

On Tue, 05 Mar 2024, Lee Jones wrote:

> On Mon, 04 Mar 2024, Thomas Zimmermann wrote:
> 
> > Backlight drivers implement struct backlight_ops.check_fb, which
> > uses struct fb_info in its interface. Replace the callback with one
> > that does not use fb_info.
> > 
> > In DRM, we have several drivers that implement backlight support. By
> > including <linux/backlight.h> these drivers depend on <linux/fb.h>.
> > At the same time, fbdev is deprecated for new drivers and likely to
> > be replaced on many systems.
> > 
> > This patchset is part of a larger effort to implement the backlight
> > code without depending on fbdev.
> > 
> > Patch 1 makes the backlight core match backlight and framebuffer
> > devices via struct fb_info.bl_dev. Patches 2 to 9 then go through
> > drivers and remove unnecessary implementations of check_fb. Finally,
> > patch 10 replaces the check_fb hook with controls_device, which
> > uses the framebuffer's Linux device instead of the framebuffer.
> > 
> > v3:
> > 	* hide CONFIG_FB_BACKLIGHT behind fb_bl_device() (Lee)
> > 	* if-else cleanups (Andy)
> > 	* fix commit message of patch 2 (Andy)
> > v2:
> > 	* fix hid-picolcd for CONFIG_FB_BACKLIGHT=n
> > 	* fixes to commit messages
> > 
> > Thomas Zimmermann (10):
> >   backlight: Match backlight device against struct fb_info.bl_dev
> >   auxdisplay/ht16k33: Remove struct backlight_ops.check_fb
> >   hid/hid-picolcd: Fix initialization order
> >   hid/hid-picolcd: Remove struct backlight_ops.check_fb
> >   backlight/aat2870-backlight: Remove struct backlight.check_fb
> >   backlight/pwm-backlight: Remove struct backlight_ops.check_fb
> >   fbdev/sh_mobile_lcdc_fb: Remove struct backlight_ops.check_fb
> >   fbdev/ssd1307fb: Init backlight before registering framebuffer
> >   fbdev/ssd1307fb: Remove struct backlight_ops.check_fb
> >   backlight: Add controls_device callback to struct backlight_ops
> > 
> >  drivers/auxdisplay/ht16k33.c             |  8 ------
> >  drivers/hid/hid-picolcd_backlight.c      |  7 ------
> >  drivers/hid/hid-picolcd_core.c           | 14 +++++------
> >  drivers/hid/hid-picolcd_fb.c             |  6 +++++
> >  drivers/video/backlight/aat2870_bl.c     |  7 ------
> >  drivers/video/backlight/backlight.c      |  8 ++++--
> >  drivers/video/backlight/bd6107.c         | 12 ++++-----
> >  drivers/video/backlight/gpio_backlight.c | 12 ++++-----
> >  drivers/video/backlight/lv5207lp.c       | 12 ++++-----
> >  drivers/video/backlight/pwm_bl.c         | 12 ---------
> >  drivers/video/fbdev/core/fb_backlight.c  |  5 ++++
> >  drivers/video/fbdev/sh_mobile_lcdcfb.c   |  7 ------
> >  drivers/video/fbdev/ssd1307fb.c          | 31 +++++++++---------------
> >  include/linux/backlight.h                | 16 ++++++------
> >  include/linux/fb.h                       |  9 +++++++
> >  include/linux/pwm_backlight.h            |  1 -
> >  16 files changed, 70 insertions(+), 97 deletions(-)
> 
> All applied.  Submitted for build testing.
> 
> Will follow-up with a PR once that's passed.

In file included from /builds/linux/include/linux/backlight.h:13,
                 from /builds/linux/drivers/video/backlight/lp855x_bl.c:12:
/builds/linux/include/linux/fb.h:736:26: warning: no previous prototype for 'fb_bl_device' [-Wmissing-prototypes]
 struct backlight_device *fb_bl_device(struct fb_info *info)

##########################

 Errors were caused
 
[v6.8-rc1] ib-backlight-auxdisplay-hid-fb-6.8 7e508af663e20 ("backlight: Add controls_device callback to struct backlight_ops")

 arc allnoconfig gcc-8
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOFnv6gFmUDNhk9qfBePj2N0/ 	Pass (0 errors - 1 warnings) : v6.8-rc1
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQhlmdHMnzDWy8bgy8Yhwp4b/ 	Pass (0 errors - 2 warnings) : ib-backlight-auxdisplay-hid-fb-6.8 

 arc allnoconfig gcc-9
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOKKrZxZBeoUCAsVcKq7Im3B/ 	Pass (0 errors - 1 warnings) : v6.8-rc1
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQtDIJZ7rQPDViKMcsNEOgvR/ 	Pass (0 errors - 2 warnings) : ib-backlight-auxdisplay-hid-fb-6.8 

 arc axs101_defconfig gcc-9
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOLZg1SwVMW2RAjIULk4qh65/ 	Pass (0 errors - 1 warnings) : v6.8-rc1
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQpsxuvbbnXzVO6TfUCzEbtW/ 	Fail (3 errors - 31 warnings) : ib-backlight-auxdisplay-hid-fb-6.8 

 arc hsdk_defconfig gcc-8
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOFgReAHQOVHiFozZbdQWn7l/ 	Pass (0 errors - 1 warnings) : v6.8-rc1
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQjUYkWfJ5thTdSZElfjJnQ2/ 	Fail (2 errors - 22 warnings) : ib-backlight-auxdisplay-hid-fb-6.8 

 arc tinyconfig gcc-8
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOD0gTB8Eoj9sqLm7eItgcw2/ 	Pass (0 errors - 1 warnings) : v6.8-rc1
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQjcwsTzF1TscpNtSmcOHfN8/ 	Pass (0 errors - 2 warnings) : ib-backlight-auxdisplay-hid-fb-6.8 

 arc tinyconfig gcc-9
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOLHB7Cd0OF48LwEHORZYUwC/ 	Pass (0 errors - 1 warnings) : v6.8-rc1
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQpQOjAX4HLQfDttdu7SGmCo/ 	Pass (0 errors - 2 warnings) : ib-backlight-auxdisplay-hid-fb-6.8 

 arm64 allmodconfig gcc-8
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOJvNqgXUenz1S3BY8KEW8S8/ 	Fail (0 errors - 0 warnings) : v6.8-rc1
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQpLqwVSS5U9KFsvs4aihPWN/ 	Fail (9450 errors - 0 warnings) : ib-backlight-auxdisplay-hid-fb-6.8 

 arm64 allmodconfig gcc-9
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOXeoVHzFSP6J4xI6S6f1jZB/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQpu5ujPvzKUvV3N2YvVlG37/ 	Fail (9450 errors - 0 warnings) : ib-backlight-auxdisplay-hid-fb-6.8 

 arm64 allnoconfig gcc-8
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOMLAnQrN28HpvM436yUGptz/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQtT41KhGSq7E9oCIbXpmr0L/ 	Pass (0 errors - 1 warnings) : ib-backlight-auxdisplay-hid-fb-6.8 

 arm64 allnoconfig gcc-9
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOUECCIEuIC9qjtR2usPZVgr/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQyxt3hdpHhuhYMdJyAvz8T0/ 	Pass (0 errors - 1 warnings) : ib-backlight-auxdisplay-hid-fb-6.8 

 arm64 defconfig gcc-8
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOKTLSaqJNwPfX7rrqtMbjWQ/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQvoRqEQxDA9OPui9oEZY2Eh/ 	Fail (3 errors - 63 warnings) : ib-backlight-auxdisplay-hid-fb-6.8 

 arm64 defconfig gcc-9
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOSVqbxoqJ5ZlloM16u1j9uH/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXR0ksfisbtdlWn5zidhfKgfG/ 	Fail (3 errors - 63 warnings) : ib-backlight-auxdisplay-hid-fb-6.8 

 arm64 tinyconfig gcc-8
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOL2h9r84ReHNsQbFWdYb9zA/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQtg2U3DMmhrx5XZjhMzLvaK/ 	Pass (0 errors - 1 warnings) : ib-backlight-auxdisplay-hid-fb-6.8 

 arm64 tinyconfig gcc-9
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOX0H8ClYysl2wGU5FXeqStj/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQyP560IGFjrOVkI1wzH3Mdm/ 	Pass (0 errors - 1 warnings) : ib-backlight-auxdisplay-hid-fb-6.8 

 arm allnoconfig gcc-8
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOL0yb08iiVb3drd15ZjY9n9/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQi1aUmJ9H8cQEhcTpGF5B2O/ 	Pass (0 errors - 1 warnings) : ib-backlight-auxdisplay-hid-fb-6.8 

 arm allnoconfig gcc-9
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOJn5VKF99ZsIeyzXcYFO7C4/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQrGOAirtIXiCS166B7sq73F/ 	Pass (0 errors - 1 warnings) : ib-backlight-auxdisplay-hid-fb-6.8 

 arm bcm2835_defconfig gcc-8
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOKFaEb1Lan8L82nDqdOCBaE/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQkhxNsajVdPofEcQrhbEqh1/ 	Fail (181 errors - 31 warnings) : ib-backlight-auxdisplay-hid-fb-6.8 

 arm bcm2835_defconfig gcc-9
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOVvc8VYa7ynzXPRaDBhw7L7/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQqthXPr0GiiZCpN2awTiCvm/ 	Fail (181 errors - 31 warnings) : ib-backlight-auxdisplay-hid-fb-6.8 

 arm exynos_defconfig gcc-8
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOJxJLpW84g2Y2ygYhjTCS7D/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQlfcaTd744gHsEQZQ7kju8U/ 	Fail (125 errors - 38 warnings) : ib-backlight-auxdisplay-hid-fb-6.8 

 arm exynos_defconfig gcc-9
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOSAzoCZZvh08E7IdX902i8m/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQuDstveo2iHo2LcLJwNSdZI/ 	Fail (125 errors - 38 warnings) : ib-backlight-auxdisplay-hid-fb-6.8 

 arm hisi_defconfig gcc-8
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXONgXlcrobSvs8vkdY9VbqsX/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQs3F7nkztLdqLQTO3TvN0Fp/ 	Fail (0 errors - 5 warnings) : ib-backlight-auxdisplay-hid-fb-6.8 

 arm hisi_defconfig gcc-9
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOXFSwRBq2bGw0OalI9CP8sH/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQsvaNlkPx3Pz4mTNb3aHyJt/ 	Fail (0 errors - 5 warnings) : ib-backlight-auxdisplay-hid-fb-6.8 

 arm qcom_defconfig gcc-8
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOKSmcS9QdzxGDbmsWMMXDVV/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQqFN1R07pYGNMP0ZNgTKL4h/ 	Fail (3 errors - 34 warnings) : ib-backlight-auxdisplay-hid-fb-6.8 

 arm qcom_defconfig gcc-9
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOWVygTuMUJ0QqsqxbVro5tS/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQrgWUUTbt9WBGVEYYySdKKT/ 	Fail (3 errors - 34 warnings) : ib-backlight-auxdisplay-hid-fb-6.8 

 arm rpc_defconfig gcc-8
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOP5kio8OZ4hBaLiqKTH638B/ 	Pass (0 errors - 8 warnings) : v6.8-rc1
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQqBxPgWkDVQOvoZbVXVEJUk/ 	Fail (46 errors - 30 warnings) : ib-backlight-auxdisplay-hid-fb-6.8 

 arm tinyconfig gcc-8
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOOrIT03LWNJBYy4I7SZZLwo/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQl5K1AcAa4uLbJ4mSP46vji/ 	Pass (0 errors - 1 warnings) : ib-backlight-auxdisplay-hid-fb-6.8 

 arm tinyconfig gcc-9
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOP8UPgUANWxizuVLJ5RFrOh/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQrScpCj7WUtQ7hEoerry89n/ 	Pass (0 errors - 1 warnings) : ib-backlight-auxdisplay-hid-fb-6.8 

 arm u8500_defconfig gcc-8
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOOTc4fY8ZVksLpu4B0Cept6/ 	Pass (0 errors - 1 warnings) : v6.8-rc1
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQucBv9mphTfIec2iCoO7FAA/ 	Fail (17 errors - 39 warnings) : ib-backlight-auxdisplay-hid-fb-6.8 

 arm u8500_defconfig gcc-9
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOVlcdE6uJPJpjrW4D0i2Zea/ 	Pass (0 errors - 1 warnings) : v6.8-rc1
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQuddQgdScLgr7z1yjLtU9kE/ 	Fail (17 errors - 39 warnings) : ib-backlight-auxdisplay-hid-fb-6.8 

 i386 i386_defconfig gcc-8
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOQXYkIEKnb3F9LjpG1Sy9iW/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQuJhoRWFU4ScPBfrw1cXua3/ 	Fail (20 errors - 0 warnings) : ib-backlight-auxdisplay-hid-fb-6.8 

 i386 i386_defconfig gcc-9
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOX6NMFqS3YRL2NvLkZoA1HB/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXR29cg5J4k4ks6lDKIq6rFos/ 	Fail (20 errors - 0 warnings) : ib-backlight-auxdisplay-hid-fb-6.8 

 mips allnoconfig gcc-8
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOKPoYSFZYdBRYlkK3t7dqB6/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQripL0vUGBKFPyFk3uKScQF/ 	Pass (0 errors - 1 warnings) : ib-backlight-auxdisplay-hid-fb-6.8 

 mips allnoconfig gcc-9
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOTLX4kx8Zrggtb3HIhoEQUo/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXR2Sq0jeTq61n7ZNAmNjkvA2/ 	Pass (0 errors - 1 warnings) : ib-backlight-auxdisplay-hid-fb-6.8 

 mips cu1000-neo_defconfig gcc-9
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXORDLo8D5VpJTcjyzCDiq4uI/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXR2oyxBTN2eie0N1bZ8nbRn3/ 	Pass (0 errors - 1 warnings) : ib-backlight-auxdisplay-hid-fb-6.8 

 mips qi_lb60_defconfig gcc-8
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOMInwFyDNM7Dz60GHmKD92A/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQpuRsIk3nCg2M4UygGXYznA/ 	Fail (2 errors - 7 warnings) : ib-backlight-auxdisplay-hid-fb-6.8 

 mips qi_lb60_defconfig gcc-9
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOWgX0mWwhL4C4odKOlhykGO/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQzOCWgsfADTGWZDAmjSwwI7/ 	Fail (2 errors - 7 warnings) : ib-backlight-auxdisplay-hid-fb-6.8 

 mips tinyconfig gcc-8
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOJxQ6uBNx3rqvHJUB9jYmfI/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQw5sOQ3Pk2B3ClS9jZvaBmY/ 	Pass (0 errors - 1 warnings) : ib-backlight-auxdisplay-hid-fb-6.8 

 mips tinyconfig gcc-9
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOTjzBn19txhKK68byvdMnI3/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXR3a7PmtE6m7zobe9vSArMjp/ 	Pass (0 errors - 1 warnings) : ib-backlight-auxdisplay-hid-fb-6.8 

 mips xilfpga_defconfig gcc-8
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOQp85uaxAauoKtAIWshN254/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQtRlZoiImIidUOtNfW9EM2F/ 	Pass (0 errors - 1 warnings) : ib-backlight-auxdisplay-hid-fb-6.8 

 powerpc allmodconfig gcc-8
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOKZUZ4luBNDCJNLUgqOnVe8/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQsnc4xsG2u2ixGczVQDpyCU/ 	Fail (9005 errors - 0 warnings) : ib-backlight-auxdisplay-hid-fb-6.8 

 powerpc allmodconfig gcc-9
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOYdyNpKcalGcP2YntdEk1IA/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXR0Ua9sytZxT839zEgXRNCMj/ 	Fail (9005 errors - 0 warnings) : ib-backlight-auxdisplay-hid-fb-6.8 

 powerpc allnoconfig gcc-8
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXONTngxZkx4CkQWFCiOfwg70/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQrbRjTyt95ltP3t1MxzrYh1/ 	Fail (1 errors - 1 warnings) : ib-backlight-auxdisplay-hid-fb-6.8 

 powerpc allnoconfig gcc-9
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOTEfkQyCRHEOzbbOH0afLAh/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQz0clzBdEy0qhFTh2IEu00a/ 	Fail (1 errors - 1 warnings) : ib-backlight-auxdisplay-hid-fb-6.8 

 powerpc tinyconfig gcc-8
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOPIu7RaL9aDGJ8pkSZv4bMR/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQsyReY2GIrGfYLSxlOWZ74f/ 	Fail (1 errors - 1 warnings) : ib-backlight-auxdisplay-hid-fb-6.8 

 powerpc tinyconfig gcc-9
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOU2QIY0zQXtGZ5mIV3UQ5x1/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXR2f4C7iZbU6gca36QRf8xzz/ 	Fail (1 errors - 1 warnings) : ib-backlight-auxdisplay-hid-fb-6.8 

 x86_64 allmodconfig gcc-8
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOOdlotTccsa3jUsMw0mEMqK/ 	Pass (0 errors - 2 warnings) : v6.8-rc1
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQptW04gBeDYysPHUVtKxrzA/ 	Fail (9781 errors - 2 warnings) : ib-backlight-auxdisplay-hid-fb-6.8 

 x86_64 allmodconfig gcc-9
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOV5o3OJ8cjSaaRKbPMwxRDb/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQzKo3q53SPT2S4dgai8cAlU/ 	Fail (9781 errors - 0 warnings) : ib-backlight-auxdisplay-hid-fb-6.8 

 x86_64 x86_64_defconfig gcc-8
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOO41yqQgH7KziVn2oV8KNWq/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQutvDXWLAAjvOY80xsf1wgQ/ 	Fail (20 errors - 0 warnings) : ib-backlight-auxdisplay-hid-fb-6.8 

 x86_64 x86_64_defconfig gcc-9
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXOUPQnMxIxbqO1K7t3oCexeC/ 	Pass (0 errors - 0 warnings) : v6.8-rc1
     https://storage.tuxsuite.com/public/google/lee.jones/builds/2dGXQxFJaNzNzrfUj974h9F1nmG/ 	Fail (20 errors - 0 warnings) : ib-backlight-auxdisplay-hid-fb-6.8

-- 
Lee Jones [李琼斯]
