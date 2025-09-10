Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC83FB51C13
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 17:42:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 108C610E95C;
	Wed, 10 Sep 2025 15:42:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1DC5A10E95A
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 15:42:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B4DF1756;
 Wed, 10 Sep 2025 08:42:40 -0700 (PDT)
Received: from [10.1.25.55] (e122027.cambridge.arm.com [10.1.25.55])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 66D643F694;
 Wed, 10 Sep 2025 08:42:46 -0700 (PDT)
Message-ID: <5a6d3ffe-1edd-4082-ad7a-85256ececa86@arm.com>
Date: Wed, 10 Sep 2025 16:42:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] drm/panfrost: Display list of device JM contexts
 over debugfs
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20250904001054.147465-1-adrian.larumbe@collabora.com>
 <20250904001054.147465-5-adrian.larumbe@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250904001054.147465-5-adrian.larumbe@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 04/09/2025 01:08, Adrián Larumbe wrote:
> From: Boris Brezillon <boris.brezillon@collabora.com>
> 
> For DebugFS builds, create a filesystem knob that, for every single open
> file of the Panfrost DRM device, shows its command name information and
> PID (when applicable), and all of its existing JM contexts.
> 
> For every context, show its priority and job config.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 97 +++++++++++++++++++++++++
>  1 file changed, 97 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 02f704ec4961..b3d14b887da4 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -712,6 +712,48 @@ static int panthor_gems_show(struct seq_file *m, void *data)
>  	return 0;
>  }
>  
> +static void show_panfrost_jm_ctx(struct panfrost_jm_ctx *jm_ctx, u32 handle,
> +				 struct seq_file *m)
> +{
> +	struct drm_device *ddev = ((struct drm_info_node *)m->private)->minor->dev;
> +	const char *prio = NULL;
> +
> +	static const char * const prios[] = {
> +		[DRM_SCHED_PRIORITY_HIGH] = "HIGH",
> +		[DRM_SCHED_PRIORITY_NORMAL] = "NORMAL",
> +		[DRM_SCHED_PRIORITY_LOW] = "LOW",
> +	};
> +
> +	if (jm_ctx->slots[0].sched_entity.priority !=
> +	    jm_ctx->slots[1].sched_entity.priority)
> +		drm_warn(ddev, "Slot priorities should be the same in a single context");
> +
> +	if (jm_ctx->slots[0].sched_entity.priority < ARRAY_SIZE(prios))
> +		prio = prios[jm_ctx->slots[0].sched_entity.priority];
> +
> +	seq_printf(m, " JM context %u: priority %s config %x\n",
> +		   handle, prio ? prio : "UNKNOWN", jm_ctx->config);

NIT: If you assign prio to "UNKNOWN" to begin with (rather than NULL)
you can avoid this ?: operator.

> +}
> +
> +static int show_file_jm_ctxs(struct panfrost_file_priv *pfile,
> +			     struct seq_file *m)
> +{
> +	struct panfrost_jm_ctx *jm_ctx;
> +	unsigned long i;
> +
> +	xa_lock(&pfile->jm_ctxs);
> +	xa_for_each(&pfile->jm_ctxs, i, jm_ctx) {
> +		jm_ctx = panfrost_jm_ctx_get(jm_ctx);
> +		xa_unlock(&pfile->jm_ctxs);
> +		show_panfrost_jm_ctx(jm_ctx, i, m);
> +		panfrost_jm_ctx_put(jm_ctx);
> +		xa_lock(&pfile->jm_ctxs);
> +	}
> +	xa_unlock(&pfile->jm_ctxs);

Is it so bad if we just held the xa lock for the whole loop? It just
seems unnecessarily complex.

Thanks,
Steve

> +
> +	return 0;
> +}
> +
>  static struct drm_info_list panthor_debugfs_list[] = {
>  	{"gems", panthor_gems_show, 0, NULL},
>  };
> @@ -725,9 +767,64 @@ static int panthor_gems_debugfs_init(struct drm_minor *minor)
>  	return 0;
>  }
>  
> +static int show_each_file(struct seq_file *m, void *arg)
> +{
> +	struct drm_info_node *node = (struct drm_info_node *)m->private;
> +	struct drm_device *ddev = node->minor->dev;
> +	int (*show)(struct panfrost_file_priv *, struct seq_file *) =
> +		node->info_ent->data;
> +	struct drm_file *file;
> +	int ret;
> +
> +	ret = mutex_lock_interruptible(&ddev->filelist_mutex);
> +	if (ret)
> +		return ret;
> +
> +	list_for_each_entry(file, &ddev->filelist, lhead) {
> +		struct task_struct *task;
> +		struct panfrost_file_priv *pfile = file->driver_priv;
> +		struct pid *pid;
> +
> +		/*
> +		 * Although we have a valid reference on file->pid, that does
> +		 * not guarantee that the task_struct who called get_pid() is
> +		 * still alive (e.g. get_pid(current) => fork() => exit()).
> +		 * Therefore, we need to protect this ->comm access using RCU.
> +		 */
> +		rcu_read_lock();
> +		pid = rcu_dereference(file->pid);
> +		task = pid_task(pid, PIDTYPE_TGID);
> +		seq_printf(m, "client_id %8llu pid %8d command %s:\n",
> +			   file->client_id, pid_nr(pid),
> +			   task ? task->comm : "<unknown>");
> +		rcu_read_unlock();
> +
> +		ret = show(pfile, m);
> +		if (ret < 0)
> +			break;
> +
> +		seq_puts(m, "\n");
> +	}
> +
> +	mutex_unlock(&ddev->filelist_mutex);
> +	return ret;
> +}
> +
> +static struct drm_info_list panfrost_sched_debugfs_list[] = {
> +	{ "sched_ctxs", show_each_file, 0, show_file_jm_ctxs },
> +};
> +
> +static void panfrost_sched_debugfs_init(struct drm_minor *minor)
> +{
> +	drm_debugfs_create_files(panfrost_sched_debugfs_list,
> +				 ARRAY_SIZE(panfrost_sched_debugfs_list),
> +				 minor->debugfs_root, minor);
> +}
> +
>  static void panfrost_debugfs_init(struct drm_minor *minor)
>  {
>  	panthor_gems_debugfs_init(minor);
> +	panfrost_sched_debugfs_init(minor);
>  }
>  #endif
>  

