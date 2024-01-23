Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F4A8394A9
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 17:29:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0F0910E1AD;
	Tue, 23 Jan 2024 16:29:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD63010E1AD
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 16:29:15 +0000 (UTC)
Received: from i53875b8c.versanet.de ([83.135.91.140] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1rSJeD-00017x-W9; Tue, 23 Jan 2024 17:29:14 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v4 11/14] drm/panthor: Add the driver frontend block
Date: Tue, 23 Jan 2024 17:29:12 +0100
Message-ID: <2477309.UkFFEUeh36@diego>
In-Reply-To: <20240122163047.1954733-12-boris.brezillon@collabora.com>
References: <20240122163047.1954733-1-boris.brezillon@collabora.com>
 <20240122163047.1954733-12-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
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
Cc: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, kernel@collabora.com,
 Daniel Stone <daniels@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Ketil Johnsen <ketil.johnsen@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 =?ISO-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Chris Diamand <chris.diamand@foss.arm.com>,
 Grant Likely <grant.likely@linaro.org>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Montag, 22. Januar 2024, 17:30:42 CET schrieb Boris Brezillon:
> This is the last piece missing to expose the driver to the outside
> world.
>=20
> This is basically a wrapper between the ioctls and the other logical
> blocks.
>=20
> v4:
> - Add an ioctl to let the UMD query the VM state
> - Fix kernel doc
> - Let panthor_device_init() call panthor_device_init()
> - Fix cleanup ordering in the panthor_init() error path
> - Add Steve's and Liviu's R-b
>=20
> v3:
> - Add acks for the MIT/GPL2 relicensing
> - Fix 32-bit support
> - Account for panthor_vm and panthor_sched changes
> - Simplify the resv preparation/update logic
> - Use a linked list rather than xarray for list of signals.
> - Simplify panthor_get_uobj_array by returning the newly allocated
>   array.
> - Drop the "DOC" for job submission helpers and move the relevant
>   comments to panthor_ioctl_group_submit().
> - Add helpers sync_op_is_signal()/sync_op_is_wait().
> - Simplify return type of panthor_submit_ctx_add_sync_signal() and
>   panthor_submit_ctx_get_sync_signal().
> - Drop WARN_ON from panthor_submit_ctx_add_job().
> - Fix typos in comments.
>=20
> Co-developed-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Acked-by: Steven Price <steven.price@arm.com> # MIT+GPL2 relicensing,Arm
> Acked-by: Grant Likely <grant.likely@linaro.org> # MIT+GPL2 relicensing,L=
inaro
> Acked-by: Boris Brezillon <boris.brezillon@collabora.com> # MIT+GPL2 reli=
censing,Collabora
> Reviewed-by: Steven Price <steven.price@arm.com>
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> ---
>  drivers/gpu/drm/panthor/panthor_drv.c | 1470 +++++++++++++++++++++++++
>  1 file changed, 1470 insertions(+)
>  create mode 100644 drivers/gpu/drm/panthor/panthor_drv.c
>=20
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/pant=
hor/panthor_drv.c
> new file mode 100644
> index 000000000000..207aacaccd39
> --- /dev/null
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -0,0 +1,1470 @@
> +// SPDX-License-Identifier: GPL-2.0 or MIT
> +/* Copyright 2018 Marty E. Plummer <hanetzer@startmail.com> */
> +/* Copyright 2019 Linaro, Ltd., Rob Herring <robh@kernel.org> */
> +/* Copyright 2019 Collabora ltd. */
> +
> +#include <linux/list.h>
> +#include <linux/module.h>
> +#include <linux/of_platform.h>
> +#include <linux/pagemap.h>
> +#include <linux/pm_runtime.h>

@@ -7,6 +7,7 @@
 #include <linux/module.h>
 #include <linux/of_platform.h>
 #include <linux/pagemap.h>
+#include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
=20
 #include <drm/drm_drv.h>

with v6.8-rc1 this needs a linux/platform_device.h include to keep
finding struct platform_device and friends

[...]


> +static int panthor_submit_ctx_init(struct panthor_submit_ctx *ctx,
> +				   struct drm_file *file, u32 job_count)
> +{
> +	ctx->jobs =3D kvmalloc_array(job_count, sizeof(*ctx->jobs),
> +				   GFP_KERNEL | __GFP_ZERO);
> +	if (!ctx->jobs)
> +		return -ENOMEM;
> +
> +	ctx->file =3D file;
> +	ctx->job_count =3D job_count;
> +	INIT_LIST_HEAD(&ctx->signals);
> +	drm_exec_init(&ctx->exec, DRM_EXEC_INTERRUPTIBLE_WAIT | DRM_EXEC_IGNORE=
_DUPLICATES);

=2E./drivers/gpu/drm/panthor/panthor_drv.c: In function =E2=80=98panthor_su=
bmit_ctx_init=E2=80=99:
=2E./drivers/gpu/drm/panthor/panthor_drv.c:722:9: error: too few arguments =
to function =E2=80=98drm_exec_init=E2=80=99
  722 |         drm_exec_init(&ctx->exec, DRM_EXEC_INTERRUPTIBLE_WAIT | DRM=
_EXEC_IGNORE_DUPLICATES);
      |         ^~~~~~~~~~~~~

In v6.8-rc1 (or drm-misc-next I guess) the calling convention of
drm_exec_init changed to include a number of initial objects, see
commit 05d249352f1a ("drm/exec: Pass in initial # of objects")


Heiko


