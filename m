Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59101B09075
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 17:24:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1178B10E30D;
	Thu, 17 Jul 2025 15:24:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1C4B510E30D
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 15:24:17 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C8B201596;
 Thu, 17 Jul 2025 08:24:08 -0700 (PDT)
Received: from [10.1.28.24] (e122027.cambridge.arm.com [10.1.28.24])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 42F383F694;
 Thu, 17 Jul 2025 08:24:14 -0700 (PDT)
Message-ID: <2aee25e2-b9cd-4f86-80dd-9d9881c036c8@arm.com>
Date: Thu, 17 Jul 2025 16:24:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] panthor: save task pid and comm in panthor_group
To: Chia-I Wu <olvaffe@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250713030831.3227607-1-olvaffe@gmail.com>
 <20250713030831.3227607-3-olvaffe@gmail.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250713030831.3227607-3-olvaffe@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 13/07/2025 04:08, Chia-I Wu wrote:
> We would like to report them on gpu errors.
> 
> We choose to save the info on panthor_group_create rather than on
> panthor_open because, when the two differ, we are more interested in the
> task that created the group.
> 
> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>

One nit below, but with that fixed:

Reviewed-by: Steven Price <steven.price@arm.com>

> 
> ---
> v2: save to panthor_group on panthor_group_create rather than to
>     panthor_file on panthor_open
> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index a2248f692a030..823b0fe678ba6 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -641,6 +641,15 @@ struct panthor_group {
>  		size_t kbo_sizes;
>  	} fdinfo;
>  
> +	/** @task_info: Info of current->group_leader that created the group. */
> +	struct {
> +		/** @pid: pid of current->group_leader */
> +		pid_t pid;
> +
> +		/** @comm: comm of current->group_leader */
> +		char comm[TASK_COMM_LEN];

As the kernel test robot reports, this kerneldoc isn't quite right.
We've got other issues in this file but you need to specify the struct
name as well, i.e.:

		/** @task_info.pid: pid of current->group_leader */
		pid_t pid;

		/** @task_info.comm: comm of current->group_leader */
		char comm[TASK_COMM_LEN];

It's been on my TODO list for a while to fix the rest of the file...

Thanks,
Steve

> +	} task_info;
> +
>  	/** @state: Group state. */
>  	enum panthor_group_state state;
>  
> @@ -3389,6 +3398,14 @@ group_create_queue(struct panthor_group *group,
>  	return ERR_PTR(ret);
>  }
>  
> +static void group_init_task_info(struct panthor_group *group)
> +{
> +	struct task_struct *task = current->group_leader;
> +
> +	group->task_info.pid = task->pid;
> +	get_task_comm(group->task_info.comm, task);
> +}
> +
>  static void add_group_kbo_sizes(struct panthor_device *ptdev,
>  				struct panthor_group *group)
>  {
> @@ -3540,6 +3557,8 @@ int panthor_group_create(struct panthor_file *pfile,
>  	add_group_kbo_sizes(group->ptdev, group);
>  	spin_lock_init(&group->fdinfo.lock);
>  
> +	group_init_task_info(group);
> +
>  	return gid;
>  
>  err_put_group:

