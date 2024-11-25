Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0139D841C
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 12:11:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A00910E600;
	Mon, 25 Nov 2024 11:11:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id CED5910E600
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 11:11:11 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E8BA202C
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 03:11:41 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 125083F66E
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 03:11:10 -0800 (PST)
Date: Mon, 25 Nov 2024 11:10:51 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: cgzones@googlemail.com
Cc: linux-security-module@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Richard Weinberger <richard@nod.at>,
 Zhihao Cheng <chengzhihao1@huawei.com>, Serge Hallyn <serge@hallyn.com>,
 Julia Lawall <Julia.Lawall@inria.fr>,
 Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org,
 cocci@inria.fr
Subject: Re: [PATCH 06/11] ubifs: reorder capability check last
Message-ID: <Z0RbO1lSXoUnAtxj@e110455-lin.cambridge.arm.com>
References: <20241125104011.36552-1-cgoettsche@seltendoof.de>
 <20241125104011.36552-5-cgoettsche@seltendoof.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241125104011.36552-5-cgoettsche@seltendoof.de>
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

Hi Christian,

On Mon, Nov 25, 2024 at 11:39:58AM +0100, Christian Göttsche wrote:
> From: Christian Göttsche <cgzones@googlemail.com>
> 
> capable() calls refer to enabled LSMs whether to permit or deny the
> request.  This is relevant in connection with SELinux, where a
> capability check results in a policy decision and by default a denial
> message on insufficient permission is issued.
> It can lead to three undesired cases:
>   1. A denial message is generated, even in case the operation was an
>      unprivileged one and thus the syscall succeeded, creating noise.
>   2. To avoid the noise from 1. the policy writer adds a rule to ignore
>      those denial messages, hiding future syscalls, where the task
>      performs an actual privileged operation, leading to hidden limited
>      functionality of that task.
>   3. To avoid the noise from 1. the policy writer adds a rule to permit
>      the task the requested capability, while it does not need it,
>      violating the principle of least privilege.
> 
> Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
> ---
>  drivers/gpu/drm/panthor/panthor_drv.c | 2 +-
>  fs/ubifs/budget.c                     | 5 +++--
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index ac7e53f6e3f0..2de0c3627fbf 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -791,7 +791,7 @@ static int group_priority_permit(struct drm_file *file,
>  		return 0;
>  
>  	/* Higher priorities require CAP_SYS_NICE or DRM_MASTER */
> -	if (capable(CAP_SYS_NICE) || drm_is_current_master(file))
> +	if (drm_is_current_master(file) || capable(CAP_SYS_NICE))
>  		return 0;
>  
>  	return -EACCES;

Can the patch above be split into a separate one? It's for a different subsystem than ubifs.

Otherwise, it looks good to me, so you can add my Reviewed-by to the new patch.

Best regards,
Liviu

> diff --git a/fs/ubifs/budget.c b/fs/ubifs/budget.c
> index d76eb7b39f56..6137aeadec3f 100644
> --- a/fs/ubifs/budget.c
> +++ b/fs/ubifs/budget.c
> @@ -256,8 +256,9 @@ long long ubifs_calc_available(const struct ubifs_info *c, int min_idx_lebs)
>   */
>  static int can_use_rp(struct ubifs_info *c)
>  {
> -	if (uid_eq(current_fsuid(), c->rp_uid) || capable(CAP_SYS_RESOURCE) ||
> -	    (!gid_eq(c->rp_gid, GLOBAL_ROOT_GID) && in_group_p(c->rp_gid)))
> +	if (uid_eq(current_fsuid(), c->rp_uid) ||
> +	    (!gid_eq(c->rp_gid, GLOBAL_ROOT_GID) && in_group_p(c->rp_gid)) ||
> +	    capable(CAP_SYS_RESOURCE))
>  		return 1;
>  	return 0;
>  }
> -- 
> 2.45.2
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
