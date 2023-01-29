Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 119F468073F
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 09:17:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FD8710E0EB;
	Mon, 30 Jan 2023 08:17:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F74810E04B
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jan 2023 11:33:53 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id ml19so1034650ejb.0
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jan 2023 03:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=7DeF/Im5Ox/EC8aY91BfzAVcVX2OaqPeNjgRIOWyYlo=;
 b=qher80ixuhNYiAm65L77Ie+Xe1m7zKiEpiceSOHBvZWm8iPx3lTRavImzkl4iFS43n
 m7e6yb6q8dXPr2MRNr7g8GkyvTstbGrIkLEsJ5/dJtaBoGXMUOKP8WPqFyb/DxiJAA8D
 YRjcZbXnJdl8bky2iTRfXoVwVqZ63HIxYiqaE/bFQuknncER2u6b5S1SuNeQ5DVWbUIM
 f4DiBcGGlxIFLeomnCBddw9bTfJ5WU6lgoTXHCti9DVRTkJLN7F1GHRmTpS4k9e2YDst
 nBbjz9df1jnuF4f/kV2vX4L/Un4OCoaf8i4yr5otQunsxrH0sxl++qPxRqclbSCGjx4H
 rd3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7DeF/Im5Ox/EC8aY91BfzAVcVX2OaqPeNjgRIOWyYlo=;
 b=OVI04lBsWkA1r14KkpX82csJiLQH2ymKhpQXeVEpvzhaHf2cAG2WSjAfXvb+mcWgv3
 1uHFw0ToV0M3uPu5MA3sCBljLVZNB3lqqWgrUa+M7nlnwV/ddh1PYDqA7qM/Esij1Iry
 deqh/+XCnG2DDPr1CPhF+d/wUPYv0tbY0yyzb9C6eQIhKKlQK/RGf1g/i0h1i0LSbJGq
 PPbhxAzYxDk67I4lwX+C1FgoLNAHg6q++aYjghRC5Cnt9jhX0SFE4ri26+dAuq168P6R
 4CHg8PlvOaMHR0j+WwqSXI0NlC7aOTcq4JwXbwWFluXJeypUQpmN/SzDcLzYbo8wgv89
 YDag==
X-Gm-Message-State: AO0yUKXd5cAP1m3UK+m7dTGTGSCQYKF9JlF9p3CMIlXmLFl4BBf9pCNk
 SjTWjYxJ1oHmm1mmN3xYoNR7lXk95KxZIw==
X-Google-Smtp-Source: AK7set8tkB+4AG0XBVkn/oUh87SFkhEebpfBV2rtvTsx7eOG3IgsqeqnA4HGkhbpJ9rfDTstLP6kxg==
X-Received: by 2002:a17:907:93d6:b0:87b:a1ed:4a57 with SMTP id
 cp22-20020a17090793d600b0087ba1ed4a57mr8555069ejc.16.1674992031588; 
 Sun, 29 Jan 2023 03:33:51 -0800 (PST)
Received: from sakura.myxoz.lan (90-224-45-44-no2390.tbcn.telia.com.
 [90.224.45.44]) by smtp.gmail.com with ESMTPSA id
 v14-20020a170906564e00b0081bfc79beaesm5172715ejr.75.2023.01.29.03.33.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 03:33:51 -0800 (PST)
Message-ID: <4bca96c7614eefa5e46959dc46bcb25165fd28cf.camel@gmail.com>
Subject: Re: [PATCH v2] fbdev: Fix invalid page access after closing
 deferred I/O devices
From: Miko Larsson <mikoxyzzz@gmail.com>
To: Takashi Iwai <tiwai@suse.de>, Helge Deller <deller@gmx.de>
Date: Sun, 29 Jan 2023 12:33:50 +0100
In-Reply-To: <20230129082856.22113-1-tiwai@suse.de>
References: <20230129082856.22113-1-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.module_f37+15877+cf3308f9) 
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 30 Jan 2023 08:17:13 +0000
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Patrik Jakobsson <pjakobsson@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 2023-01-29 at 09:28 +0100, Takashi Iwai wrote:
> When a fbdev with deferred I/O is once opened and closed, the dirty
> pages still remain queued in the pageref list, and eventually later
> those may be processed in the delayed work.=C2=A0 This may lead to a
> corruption of pages, hitting an Oops.
>=20
> This patch makes sure to cancel the delayed work and clean up the
> pageref list at closing the device for addressing the bug.=C2=A0 A part o=
f
> the cleanup code is factored out as a new helper function that is
> called from the common fb_release().
>=20
> Reviewed-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
> v1->v2: Fix build error without CONFIG_FB_DEFERRED_IO
>=20
> =C2=A0drivers/video/fbdev/core/fb_defio.c | 10 +++++++++-
> =C2=A0drivers/video/fbdev/core/fbmem.c=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ++++
> =C2=A0include/linux/fb.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A03 files changed, 14 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/video/fbdev/core/fb_defio.c
> b/drivers/video/fbdev/core/fb_defio.c
> index c730253ab85c..583cbcf09446 100644
> --- a/drivers/video/fbdev/core/fb_defio.c
> +++ b/drivers/video/fbdev/core/fb_defio.c
> @@ -313,7 +313,7 @@ void fb_deferred_io_open(struct fb_info *info,
> =C2=A0}
> =C2=A0EXPORT_SYMBOL_GPL(fb_deferred_io_open);
> =C2=A0
> -void fb_deferred_io_cleanup(struct fb_info *info)
> +void fb_deferred_io_release(struct fb_info *info)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct fb_deferred_io *fb=
defio =3D info->fbdefio;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct page *page;
> @@ -327,6 +327,14 @@ void fb_deferred_io_cleanup(struct fb_info
> *info)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0page =3D fb_deferred_io_page(info, i);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0page->mapping =3D NULL;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> +}
> +EXPORT_SYMBOL_GPL(fb_deferred_io_release);
> +
> +void fb_deferred_io_cleanup(struct fb_info *info)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct fb_deferred_io *fbdefio=
 =3D info->fbdefio;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0fb_deferred_io_release(info);
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0kvfree(info->pagerefs);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mutex_destroy(&fbdefio->l=
ock);
> diff --git a/drivers/video/fbdev/core/fbmem.c
> b/drivers/video/fbdev/core/fbmem.c
> index 3a6c8458eb8d..ab3545a00abc 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -1454,6 +1454,10 @@ __releases(&info->lock)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct fb_info * const in=
fo =3D file->private_data;
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0lock_fb_info(info);
> +#if IS_ENABLED(CONFIG_FB_DEFERRED_IO)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (info->fbdefio)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0fb_deferred_io_release(info);
> +#endif
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (info->fbops->fb_relea=
se)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0info->fbops->fb_release(info,1);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0module_put(info->fbops->o=
wner);
> diff --git a/include/linux/fb.h b/include/linux/fb.h
> index 96b96323e9cb..73eb1f85ea8e 100644
> --- a/include/linux/fb.h
> +++ b/include/linux/fb.h
> @@ -662,6 +662,7 @@ extern int=C2=A0 fb_deferred_io_init(struct fb_info
> *info);
> =C2=A0extern void fb_deferred_io_open(struct fb_info *info,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct inode *inode,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct file *file);
> +extern void fb_deferred_io_release(struct fb_info *info);
> =C2=A0extern void fb_deferred_io_cleanup(struct fb_info *info);
> =C2=A0extern int fb_deferred_io_fsync(struct file *file, loff_t start,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0loff_t end, int datasync);

Tested-by: Miko Larsson <mikoxyzzz@gmail.com>
--=20
~miko
