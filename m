Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F459D9344
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 09:27:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6362710E7E0;
	Tue, 26 Nov 2024 08:26:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 566 seconds by postgrey-1.36 at gabe;
 Mon, 25 Nov 2024 11:40:27 UTC
Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C7CD10E616
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 11:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id B357B2E6142;
 Mon, 25 Nov 2024 12:30:59 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id zBiM6kBr8mqI; Mon, 25 Nov 2024 12:30:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id F0F482E613D;
 Mon, 25 Nov 2024 12:30:58 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 6isOqRtT0GRU; Mon, 25 Nov 2024 12:30:58 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id C3F6B2A87E6;
 Mon, 25 Nov 2024 12:30:58 +0100 (CET)
Date: Mon, 25 Nov 2024 12:30:58 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: cgzones@googlemail.com
Cc: LSM <linux-security-module@vger.kernel.org>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 chengzhihao1 <chengzhihao1@huawei.com>, 
 "Serge E. Hallyn" <serge@hallyn.com>, 
 Julia Lawall <Julia.Lawall@inria.fr>, 
 Nicolas Palix <nicolas.palix@imag.fr>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 DRI mailing list <dri-devel@lists.freedesktop.org>, 
 linux-mtd <linux-mtd@lists.infradead.org>, cocci <cocci@inria.fr>
Message-ID: <1045101183.70157813.1732534258584.JavaMail.zimbra@nod.at>
In-Reply-To: <20241125104011.36552-5-cgoettsche@seltendoof.de>
References: <20241125104011.36552-1-cgoettsche@seltendoof.de>
 <20241125104011.36552-5-cgoettsche@seltendoof.de>
Subject: Re: [PATCH 06/11] ubifs: reorder capability check last
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF132
 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: reorder capability check last
Thread-Index: CIQyHdt2r7cFMRbn2TiAVM+y9UFUfA==
X-Mailman-Approved-At: Tue, 26 Nov 2024 08:26:46 +0000
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

----- Urspr=C3=BCngliche Mail -----
> Von: "Christian G=C3=B6ttsche" <cgoettsche@seltendoof.de>
> capable() calls refer to enabled LSMs whether to permit or deny the
> request.  This is relevant in connection with SELinux, where a
> capability check results in a policy decision and by default a denial
> message on insufficient permission is issued.
> It can lead to three undesired cases:
>  1. A denial message is generated, even in case the operation was an
>     unprivileged one and thus the syscall succeeded, creating noise.
>  2. To avoid the noise from 1. the policy writer adds a rule to ignore
>     those denial messages, hiding future syscalls, where the task
>     performs an actual privileged operation, leading to hidden limited
>     functionality of that task.
>  3. To avoid the noise from 1. the policy writer adds a rule to permit
>     the task the requested capability, while it does not need it,
>     violating the principle of least privilege.
>=20
> Signed-off-by: Christian G=C3=B6ttsche <cgzones@googlemail.com>
> ---
> drivers/gpu/drm/panthor/panthor_drv.c | 2 +-

This change is unrelated, please remove it.

> fs/ubifs/budget.c                     | 5 +++--
> 2 files changed, 4 insertions(+), 3 deletions(-)

[...]

> diff --git a/fs/ubifs/budget.c b/fs/ubifs/budget.c
> index d76eb7b39f56..6137aeadec3f 100644
> --- a/fs/ubifs/budget.c
> +++ b/fs/ubifs/budget.c
> @@ -256,8 +256,9 @@ long long ubifs_calc_available(const struct ubifs_inf=
o *c,
> int min_idx_lebs)
>  */
> static int can_use_rp(struct ubifs_info *c)
> {
> -=09if (uid_eq(current_fsuid(), c->rp_uid) || capable(CAP_SYS_RESOURCE) |=
|
> -=09    (!gid_eq(c->rp_gid, GLOBAL_ROOT_GID) && in_group_p(c->rp_gid)))
> +=09if (uid_eq(current_fsuid(), c->rp_uid) ||
> +=09    (!gid_eq(c->rp_gid, GLOBAL_ROOT_GID) && in_group_p(c->rp_gid)) ||
> +=09    capable(CAP_SYS_RESOURCE))
> =09=09return 1;
> =09return 0;
> }

The UBIFS part looks ok:

Acked-by: Richard Weinberger <richard@nod.at>

Since I was not CC'ed to the whole series, I miss a lot of context.
Will this series merged as a whole? By whom?

Thanks,
//richard
