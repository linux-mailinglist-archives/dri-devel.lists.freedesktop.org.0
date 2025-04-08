Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1CFA80FDC
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 17:26:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51CD710E27C;
	Tue,  8 Apr 2025 15:26:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="JAPahznK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B3010E23F
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 15:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744125975;
 bh=/kGtS8/BtmaNVNliS+L8soxs5sdtkhO9WztZgJbV9t8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JAPahznKpbfsqrB8MbGLRGL6q6jT45uotHSYCPtg1ADGJmpOQ/SnGFCs01g0wLu/u
 ZEdaQkMsR3KEC7kgzonuqqXBjcaDdN0Nn4G2dmHhrDvLk8LNjZeZxBBo02k2CERw/R
 UZbeeVsazM4tJCGc+BfOcwal1gbRTCTkAJX7mRKHhYpNf6k7u4bwziyXKiN3zLFCeS
 Zm8jPO/BxL8jZ4xUjCP6FOCGXLuN3b6O8/L1u+M6BxTxGHKBQ3DAeLh9hKrljjniGn
 xmR9b3I5BxygaWPpQjQvXrR9HAIigrenayOs/lmhjruZATjfUZ66VHJIgtK/JrR6ug
 3hAmuMgm4YTtg==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9B6C117E0D13;
 Tue,  8 Apr 2025 17:26:14 +0200 (CEST)
Date: Tue, 8 Apr 2025 17:26:10 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v4 4/4] drm/panthor: show device-wide list of DRM GEM
 objects over DebugFS
Message-ID: <20250408172610.428f689d@collabora.com>
In-Reply-To: <20250402115432.1469703-5-adrian.larumbe@collabora.com>
References: <20250402115432.1469703-1-adrian.larumbe@collabora.com>
 <20250402115432.1469703-5-adrian.larumbe@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Wed,  2 Apr 2025 12:54:29 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> +static void panthor_gem_debugfs_bo_print(struct panthor_gem_object *bo,
> +					 struct seq_file *m,
> +					 struct gem_size_totals *totals)
> +{
> +	unsigned int refcount =3D kref_read(&bo->base.base.refcount);
> +	char creator_info[32] =3D {};
> +	bool has_flags =3D false;
> +	size_t resident_size;
> +
> +	/* Skip BOs being destroyed. */
> +	if (!refcount)
> +		return;
> +
> +	resident_size =3D bo->base.pages !=3D NULL ? bo->base.base.size : 0;
> +
> +	snprintf(creator_info, sizeof(creator_info),
> +		 "%s/%d", bo->debugfs.creator.process_name, bo->debugfs.creator.tgid);
> +	seq_printf(m, "%-32s%-16d%-16d%-16zd%-16zd%-16lx",
> +		   creator_info,
> +		   bo->base.base.name,
> +		   refcount,
> +		   bo->base.base.size,
> +		   resident_size,
> +		   drm_vma_node_start(&bo->base.base.vma_node));
> +
> +	seq_puts(m, "(");
> +	has_flags =3D panfrost_gem_print_flag("imported", bo->base.base.import_=
attach !=3D NULL,
> +					    has_flags, m);
> +	has_flags =3D panfrost_gem_print_flag("exported", bo->base.base.dma_buf=
 !=3D NULL,
> +					    has_flags, m);
> +	if (bo->base.madv < 0)
> +		has_flags =3D panfrost_gem_print_flag("purged", true, has_flags, m);
> +	else if (bo->base.madv > 0)
> +		has_flags =3D panfrost_gem_print_flag("purgeable", true, has_flags, m);

I would probably go:

	has_flags =3D panfrost_gem_print_flag("purged", bo->base.madv < 0, has_fla=
gs, m);
	has_flags =3D panfrost_gem_print_flag("purgeable", bo->base.madv > 0, has_=
flags, m);

to keep it one line per flag.

BTW, most of those flags are encoding the GEM state, so maybe the column
should be named state, and the helper panfrost_gem_print_state_flag().

> +	if (!has_flags)
> +		seq_puts(m, "none");
> +	seq_puts(m, ")");
> +
> +	seq_printf(m, "%-6s0x%-2x", "", bo->debugfs.bo_mask);

It's probably better if we print the debugfs flags like the GEM flags
(one string per flag, with a ',' separator). We can even make it a
helper function taking a list of flags and their associated strings so
we can use it for both panthor_gem_object::flags and
panthor_gem_object::debugfs::flags.

static void
panthor_gem_debugfs_print_flags(const char *names,
				u32 name_count,
				u32 flags)
{
	bool first =3D true;

	seq_puts(m, "(");

	if (!flags)
		seq_puts(m, "none");

	while (flags) {
		u32 bit =3D fls(flags) - 1;

		if (!first)
			seq_puts(m, ",");

		if (bit >=3D name_count || !names[bit])
			seq_printf(m, "unknown-bit%d", bit);
		else
			seq_puts(m, name);

		first =3D false;
		flags &=3D ~BIT(bit);
	}

	seq_puts(m, ")");
}

> +
> +	mutex_lock(&bo->label.lock);
> +	seq_printf(m, "%-6s%-60s", "", bo->label.str ? : NULL);
> +	mutex_unlock(&bo->label.lock);
> +	seq_puts(m, "\n");
> +
> +	totals->size +=3D bo->base.base.size;
> +	totals->resident +=3D resident_size;
> +	if (bo->base.madv > 0)
> +		totals->reclaimable +=3D resident_size;
> +}
> +
> +void panthor_gem_debugfs_print_bos(struct panthor_device *ptdev,
> +				   struct seq_file *m)
> +{
> +	struct gem_size_totals totals =3D {0};
> +	struct panthor_gem_object *bo;
> +
> +	seq_puts(m, "created-by                      global-name     refcount  =
      size            resident-size   file-offset     flags     kflags     =
label\n");
> +	seq_puts(m, "----------------------------------------------------------=
---------------------------------------------------------------------------=
-----------\n");
> +
> +	scoped_guard(mutex, &ptdev->gems.lock) {
> +		list_for_each_entry(bo, &ptdev->gems.node, debugfs.node)
> +			panthor_gem_debugfs_bo_print(bo, m, &totals);
> +	}
> +
> +	seq_puts(m, "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n");
> +	seq_printf(m, "Total size: %zd, Total resident: %zd, Total reclaimable:=
 %zd\n",
> +		   totals.size, totals.resident, totals.reclaimable);
> +}
> +#endif
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/pant=
hor/panthor_gem.h
> index 49daa5088a0d..22ecc0d39d5e 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.h
> +++ b/drivers/gpu/drm/panthor/panthor_gem.h
> @@ -15,6 +15,32 @@ struct panthor_vm;
> =20
>  #define PANTHOR_BO_LABEL_MAXLEN	PAGE_SIZE
> =20
> +#define PANTHOR_BO_KERNEL	BIT(0)

s/PANTHOR_BO_KERNEL/PANTHOR_DEBUGFS_BO_FLAG_KERNEL/

> +#define PANTHOR_BO_FW_MAPPED	BIT(1)

s/PANTHOR_BO_FW_MAPPED/PANTHOR_DEBUGFS_BO_FLAG_FW_MAPPED/

And it'd be better if those flags were documented.

I would also add a

#define PANTHOR_DEBUGFS_BO_FLAG_INITIALIZED BIT(0)

and move the other flags one bit left.

> +
> +/**
> + * struct panthor_gem_debugfs - GEM object's DebugFS list information
> + */
> +struct panthor_gem_debugfs {
> +	/**
> +	 * @node: Node used to insert the object in the device-wide list of
> +	 * GEM objects, to display information about it through a DebugFS file.
> +	 */
> +	struct list_head node;
> +
> +	/** @creator: Information about the UM process which created the GEM. */
> +	struct {
> +		/** @creator.process_name: Group leader name in owning thread's proces=
s */
> +		char process_name[TASK_COMM_LEN];
> +
> +		/** @creator.tgid: PID of the thread's group leader within its process=
 */
> +		pid_t tgid;
> +	} creator;
> +
> +	/** @bo_mask: Bitmask encoding BO type as {USER, KERNEL} x {GPU, FW} */
> +	u32 bo_mask;

s/bo_mask/flags/ and mention that it's a combination of
PANTHOR_DEBUGFS_BO_FLAG_xxx in the doc.

> +};
> +
>  /**
>   * struct panthor_gem_object - Driver specific GEM object.
>   */
> @@ -62,6 +88,10 @@ struct panthor_gem_object {
>  		/** @lock.str: Protects access to the @label.str field. */
>  		struct mutex lock;
>  	} label;
> +
> +#ifdef CONFIG_DEBUG_FS
> +	struct panthor_gem_debugfs debugfs;
> +#endif
>  };
> =20
>  /**
> @@ -157,4 +187,9 @@ panthor_kernel_bo_create(struct panthor_device *ptdev=
, struct panthor_vm *vm,
> =20
>  void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo);
> =20
> +#ifdef CONFIG_DEBUG_FS
> +void panthor_gem_debugfs_print_bos(struct panthor_device *pfdev,
> +				   struct seq_file *m);
> +#endif
> +
>  #endif /* __PANTHOR_GEM_H__ */

