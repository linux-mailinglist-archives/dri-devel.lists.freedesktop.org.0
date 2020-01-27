Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5AC14A0A4
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2020 10:24:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B1856EA96;
	Mon, 27 Jan 2020 09:24:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 730AA6EA93
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2020 09:24:42 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id c9so10238220wrw.8
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2020 01:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ZdKqX+CuPfl29GTYT8exXnFh3891eYU1oarqJwzB9IE=;
 b=Fsg1O7vZHiTortlTrLk6+ZgxxECVtNVQYPRqoLftWU0SvedJmiZmN7N1RM2J58uvT2
 Aq8pQ6OYTDzVboc3Nc0X9g09ZnDBj8JXzdIOgSLQ1vjJy/EsPEnEyZAEm2Ncjp3rtxqt
 GJLNmdOpsoHelHdf4c5mTrzYe2L0cIefvGYxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ZdKqX+CuPfl29GTYT8exXnFh3891eYU1oarqJwzB9IE=;
 b=j0rQhaBtrQq9OdwSUHL+5qrkvWv25iGXyY+XFbKbAKF1FO0vTFqZkGz/CDI9kPVlL8
 EA8SA4+QOJ0s7LfmBOqJrnYSMG0iECcIqOG1pGcU73S5u1l4LQEMvScw3G+BWPeA8us+
 GfJDHFritluRFr/QwUSl3F9S5FcsM/Hh6fMuGvCIJGc1TlnI2DampDgS+jw4vLe0EXQu
 1ZeqM1PIkeVtnn34Ak7w6vDf+Y95tecj+Qirp3mi8LXpDCi8cHDO7PnHInvXC+x2Kpbq
 JY4CG7B/v74AHWaIVtfNVXT21dHXRKsnqxrHyrX4+xS2Eu9R3rUTThAr6FnaBrAHvpGJ
 PTWA==
X-Gm-Message-State: APjAAAWSxVlYUavLYsCp8XeqVhzbX0MYmlnDwKNS+3RpvT7uK/wT+t5v
 bhLR8ohL1QIeKrD+BAN1MN3KcP/7cpcjWQ==
X-Google-Smtp-Source: APXvYqzS6DYptgme3dToSWpn2wpuLOXoJW+jcBZNqhU6u2SfPiDOHA/VG8ex3T2wJN5rM/ywLjAiPw==
X-Received: by 2002:adf:fa50:: with SMTP id y16mr19449856wrr.183.1580117081092; 
 Mon, 27 Jan 2020 01:24:41 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id e17sm2278206wma.12.2020.01.27.01.24.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2020 01:24:40 -0800 (PST)
Date: Mon, 27 Jan 2020 10:24:38 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH 1/2] drm/amdgpu: Reduce global locking around filp release
Message-ID: <20200127092438.GX43062@phenom.ffwll.local>
References: <20200124204149.550337-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200124204149.550337-1-chris@chris-wilson.co.uk>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 24, 2020 at 08:41:48PM +0000, Chris Wilson wrote:
> For largely legacy reasons, a global mutex (drm_global_mutex) is taken
> around open/close of the drm_device, including serialising the filp
> release. For drivers with their own fine grained locking, such global
> coordination is a hindrance, albeit off the common hot paths.
> =

> References: 7a2c65dd32b1 ("drm: Release filp before global lock")
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Alex Deucher <alexdeucher@gmail.com>
> Cc: Christian K=F6nig <christian.koenig@amd.com>

At least on the open side the global mutex also prevents against the
backwards sequence of the ->load callback. Since it's all a huge mess I'm
kinda leaning towards one set of rules for optimized drm_global_mutex
locking, and not a shotgun approach. It's already one of the nastiest
locks we have :-/
-Daniel

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_drv.c
> index 94e2fd758e01..9bce9cfa982e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -1351,7 +1351,7 @@ static const struct file_operations amdgpu_driver_k=
ms_fops =3D {
>  	.owner =3D THIS_MODULE,
>  	.open =3D drm_open,
>  	.flush =3D amdgpu_flush,
> -	.release =3D drm_release,
> +	.release =3D drm_release_noglobal,
>  	.unlocked_ioctl =3D amdgpu_drm_ioctl,
>  	.mmap =3D amdgpu_mmap,
>  	.poll =3D drm_poll,
> -- =

> 2.25.0
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
