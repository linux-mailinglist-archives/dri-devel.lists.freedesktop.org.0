Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B54D6CE9198
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 09:56:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CE1C10E42C;
	Tue, 30 Dec 2025 08:56:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="oDAsOCDL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 916DA10E42C
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 08:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1767084992; x=1767689792; i=deller@gmx.de;
 bh=cW5OmwtMJpIpRqc79c7nIfX/ogYjvSL2dWh+zvXxtqk=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=oDAsOCDLgpE2LzHPY7eXv4sLLOV5OMt6JkpFVzwP+F/5GZWGRHA++rK9sDSQV5iX
 KTqjwZtv/2/wdpBn2gWgGskn8FD8Xsc4s5AmMYXq/hjtwfx2f1J4PbwuUOy8L1rSS
 1jX6T7J45ndiEC8+S86SAkNi6kDytP5upML7t2ogKArM1ZljniC9bzk4m0l5Tx9I/
 pjxcB67dOLlqIFn5fXjGxzEiT1jETzwkkz6T1lt0IJKki1o7GvPYNtBica2BgeBx+
 q98vYtV1N63ctrdB+n0vlwSKE7yAjrzEfRaNlPi58zvT2gljLKB7V64K4cVai/v9T
 de2Ezxlh3UtczPRYgw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.51.253]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MxDkw-1vppQe3Bma-00v1oD; Tue, 30
 Dec 2025 09:56:32 +0100
Message-ID: <6443ccc9-d6cd-45d5-9d6d-ee4589a8aa0f@gmx.de>
Date: Tue, 30 Dec 2025 09:56:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: Use device_create_with_groups() to fix sysfs
 groups registration race
To: Hans de Goede <johannes.goede@oss.qualcomm.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, stable@vger.kernel.org,
 Shixiong Ou <oushixiong@kylinos.cn>
References: <20251221165740.15821-1-johannes.goede@oss.qualcomm.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20251221165740.15821-1-johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:e366OPoVodHnQuobdahgDY+mJYR4y4Mfk3iBSZAQBFuAB4gKfVD
 Xq1qaIIeDk1vAMsCWYGI+31UucDhSegBMUrj2MlXVvwXs+3/IIOiyQ4oIwbTz0X++Jw8ZMu
 RqPePjOnhS3F5UUNT0J9v7fTMGaJuRYVX40KLyU6xRyjLvqSnJRgDQgtU1dl8ot3T7rtZry
 rO4nWnvCxgMMAAX6vo7vQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:jRqcwu9OZiU=;9+DXFj+GRdopPdth6fmg9J8neAP
 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
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

On 12/21/25 17:57, Hans de Goede wrote:
> The fbdev sysfs attributes are registered after sending the uevent for
> the device creation, leaving a race window where e.g. udev rules may
> not be able to access the sysfs attributes because the registration is
> not done yet.
>=20
> Fix this by switching to device_create_with_groups(). This also results =
in
> a nice cleanup. After switching to device_create_with_groups() all that
> is left of fb_init_device() is setting the drvdata and that can be passe=
d
> to device_create[_with_groups]() too. After which fb_init_device() can
> be completely removed.
>=20
> Dropping fb_init_device() + fb_cleanup_device() in turn allows removing
> fb_info.class_flag as they were the only user of this field.
>=20
> Fixes: 5fc830d6aca1 ("fbdev: Register sysfs groups through device_add_gr=
oup")
> Cc: stable@vger.kernel.org
> Cc: Shixiong Ou <oushixiong@kylinos.cn>
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

applied to fbdev git tree.

Thanks!
Helge


> ---
> Note the fixes tag is technically wrong. This race has existed forever.
> The commit I picked for the fixes tag is a dependency of this change not
> the commit introducing the race. I don't believe that backporting this
> back any further is useful which is why I went with this commit.
> ---
>   drivers/video/fbdev/core/fbsysfs.c | 36 +++---------------------------
>   include/linux/fb.h                 |  1 -
>   2 files changed, 3 insertions(+), 34 deletions(-)
>=20
> diff --git a/drivers/video/fbdev/core/fbsysfs.c b/drivers/video/fbdev/co=
re/fbsysfs.c
> index b8344c40073b..baa2bae0fb5b 100644
> --- a/drivers/video/fbdev/core/fbsysfs.c
> +++ b/drivers/video/fbdev/core/fbsysfs.c
> @@ -12,8 +12,6 @@
>  =20
>   #include "fb_internal.h"
>  =20
> -#define FB_SYSFS_FLAG_ATTR 1
> -
>   static int activate(struct fb_info *fb_info, struct fb_var_screeninfo =
*var)
>   {
>   	int err;
> @@ -451,33 +449,7 @@ static struct attribute *fb_device_attrs[] =3D {
>   	NULL,
>   };
>  =20
> -static const struct attribute_group fb_device_attr_group =3D {
> -	.attrs          =3D fb_device_attrs,
> -};
> -
> -static int fb_init_device(struct fb_info *fb_info)
> -{
> -	int ret;
> -
> -	dev_set_drvdata(fb_info->dev, fb_info);
> -
> -	fb_info->class_flag |=3D FB_SYSFS_FLAG_ATTR;
> -
> -	ret =3D device_add_group(fb_info->dev, &fb_device_attr_group);
> -	if (ret)
> -		fb_info->class_flag &=3D ~FB_SYSFS_FLAG_ATTR;
> -
> -	return 0;
> -}
> -
> -static void fb_cleanup_device(struct fb_info *fb_info)
> -{
> -	if (fb_info->class_flag & FB_SYSFS_FLAG_ATTR) {
> -		device_remove_group(fb_info->dev, &fb_device_attr_group);
> -
> -		fb_info->class_flag &=3D ~FB_SYSFS_FLAG_ATTR;
> -	}
> -}
> +ATTRIBUTE_GROUPS(fb_device);
>  =20
>   int fb_device_create(struct fb_info *fb_info)
>   {
> @@ -485,14 +457,13 @@ int fb_device_create(struct fb_info *fb_info)
>   	dev_t devt =3D MKDEV(FB_MAJOR, node);
>   	int ret;
>  =20
> -	fb_info->dev =3D device_create(fb_class, fb_info->device, devt, NULL, =
"fb%d", node);
> +	fb_info->dev =3D device_create_with_groups(fb_class, fb_info->device, =
devt, fb_info,
> +						 fb_device_groups, "fb%d", node);
>   	if (IS_ERR(fb_info->dev)) {
>   		/* Not fatal */
>   		ret =3D PTR_ERR(fb_info->dev);
>   		pr_warn("Unable to create device for framebuffer %d; error %d\n", no=
de, ret);
>   		fb_info->dev =3D NULL;
> -	} else {
> -		fb_init_device(fb_info);
>   	}
>  =20
>   	return 0;
> @@ -505,7 +476,6 @@ void fb_device_destroy(struct fb_info *fb_info)
>   	if (!fb_info->dev)
>   		return;
>  =20
> -	fb_cleanup_device(fb_info);
>   	device_destroy(fb_class, devt);
>   	fb_info->dev =3D NULL;
>   }
> diff --git a/include/linux/fb.h b/include/linux/fb.h
> index 05cc251035da..c3302d513546 100644
> --- a/include/linux/fb.h
> +++ b/include/linux/fb.h
> @@ -497,7 +497,6 @@ struct fb_info {
>   #if defined(CONFIG_FB_DEVICE)
>   	struct device *dev;		/* This is this fb device */
>   #endif
> -	int class_flag;                    /* private sysfs flags */
>   #ifdef CONFIG_FB_TILEBLITTING
>   	struct fb_tile_ops *tileops;    /* Tile Blitting */
>   #endif

