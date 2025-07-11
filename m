Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9EB0B022D7
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 19:42:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2355910E3AD;
	Fri, 11 Jul 2025 17:42:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Xo4b895n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 888E110E3AD;
 Fri, 11 Jul 2025 17:42:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id CDF24A54F91;
 Fri, 11 Jul 2025 17:42:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1473CC4CEED;
 Fri, 11 Jul 2025 17:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752255720;
 bh=sb4Xf0ULCx2Ti9sAnwhk9/aOAFZICH+JDYlm80FvR6c=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=Xo4b895nuT7lxuwx0uddkCG8D0N+iV8pxQbVl+/ov6kLwHP5Ih0PT1nfPFsF3ltxa
 vN7mkTbxD/jnWW57qLt/8OwM23tmcRlKiO5XlQ/rVsW7vvNIwd2GXY9/UUH5Hpf3bN
 vj6OhS9HgyJ+1eh9dWSOJuJOSP+VygwUt2V1lIZSpObV9MJlow5RLmVi1q2GVW/vsK
 oIz32xhPk7iG64PmgJqDStWdpsqm7hTR+ahk5NFz5uMX5kgsSpxLQTC+XQLp+ecNlL
 yKwf/QQU1J2UG9ZaB7nz+KDuAOSmYXXdUVyxaIIMtGnCVFrzyme+SpnSzJw3FEtNyj
 /IK2muToGegtg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Jul 2025 19:41:56 +0200
Message-Id: <DB9ET7AG2N2D.YCVQRF9398V2@kernel.org>
Subject: Re: [PATCH] drm/nouveau: check ioctl command codes better
Cc: "Lyude Paul" <lyude@redhat.com>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Ben Skeggs" <bskeggs@redhat.com>, "Arnd
 Bergmann" <arnd@arndb.de>, "Ben Skeggs" <bskeggs@nvidia.com>, "Timur Tabi"
 <ttabi@nvidia.com>, "Dave Airlie" <airlied@redhat.com>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
To: "Arnd Bergmann" <arnd@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250711072458.2665325-1-arnd@kernel.org>
In-Reply-To: <20250711072458.2665325-1-arnd@kernel.org>
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

On Fri Jul 11, 2025 at 9:24 AM CEST, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> nouveau_drm_ioctl() only checks the _IOC_NR() bits in the DRM_NOUVEAU_NVI=
F
> command, but ignores the type and direction bits, so any command with
> '7' in the low eight bits gets passed into nouveau_abi16_ioctl() instead
> of drm_ioctl().
>
> Check for all the bits except the size that is handled inside of the hand=
ler.
>
> Fixes: 27111a23d01c ("drm/nouveau: expose the full object/event interface=
s to userspace")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/nouveau/nouveau_drm.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouv=
eau/nouveau_drm.c
> index 1527b801f013..506eeb44f0d4 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -1284,6 +1284,9 @@ nouveau_ioctls[] =3D {
>  	DRM_IOCTL_DEF_DRV(NOUVEAU_EXEC, nouveau_exec_ioctl_exec, DRM_RENDER_ALL=
OW),
>  };
> =20
> +#define DRM_IOCTL_NOUVEAU_NVIV _IOC(_IOC_READ|_IOC_WRITE, DRM_IOCTL_BASE=
, \
> +				    DRM_COMMAND_BASE + DRM_NOUVEAU_NVIF, 0)

Is there any intention behind NVIV vs NVIF? Indicator that size is not
considered?

> +
>  long
>  nouveau_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg=
)
>  {
> @@ -1297,14 +1300,10 @@ nouveau_drm_ioctl(struct file *file, unsigned int=
 cmd, unsigned long arg)
>  		return ret;
>  	}
> =20
> -	switch (_IOC_NR(cmd) - DRM_COMMAND_BASE) {
> -	case DRM_NOUVEAU_NVIF:
> +	if ((cmd & ~IOCSIZE_MASK) =3D=3D DRM_IOCTL_NOUVEAU_NVIV)
>  		ret =3D nouveau_abi16_ioctl(filp, (void __user *)arg, _IOC_SIZE(cmd));
> -		break;
> -	default:
> +	else
>  		ret =3D drm_ioctl(file, cmd, arg);
> -		break;
> -	}
> =20
>  	pm_runtime_mark_last_busy(dev->dev);
>  	pm_runtime_put_autosuspend(dev->dev);

