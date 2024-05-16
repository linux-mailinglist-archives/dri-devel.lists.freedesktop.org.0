Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B033A8C7E7B
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 00:12:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10E3610E0E6;
	Thu, 16 May 2024 22:12:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ieQlFZrW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0684C10E0E6
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 22:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1715897540;
 bh=pdo/CEMGnwi61BSt/0rnGMNUGXy5eJpcP16+ckAoQlo=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=ieQlFZrW0obs4RfZ7e8QzSi6Ql5WJthHqk0tTUKOnAShilT0EBLCZz9mHGaPO0vtn
 jlBi3ho9qkNzptzP8+1PAfnmX0YSA7KrNn90/Zq9EhIYA0bPQBPe2jFtkkVyFQhU87
 /2f+l8WozJJZkc5rc5XSY13P5Pi/nHNRmw4gqL1mb7+Pf1/dEB8+JsAvidGPUVK1MY
 G9T/3/SGfoEN6a9zEeH6EXRe3yvZj0ohf2sCFnlb0Q3AohrJYwEITWqZe3QhJ6/rE9
 YnTzDFZacV3trk4g1G/Bo3XnDqRdwUNBBlBNXGWmQwu02suhC2jQ8lwOFR+epEpMt/
 ZRdHegZtLArfg==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: alarumbe)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id DBAEE378020D;
 Thu, 16 May 2024 22:12:19 +0000 (UTC)
Date: Thu, 16 May 2024 23:12:19 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH v2 1/1] drm: Add ioctl for querying a DRM device's list
 of open client PIDs
Message-ID: <a3hakatontuh535xkvwz3txbaocjx44ajkarmiigt3prekqysc@hp2zayht4hbh>
References: <20240501185047.3126832-1-adrian.larumbe@collabora.com>
 <20240501185047.3126832-2-adrian.larumbe@collabora.com>
 <ZjNKLVZgekRqw5AL@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZjNKLVZgekRqw5AL@phenom.ffwll.local>
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

Hi Daniel,

On 02.05.2024 10:09, Daniel Vetter wrote:
> On Wed, May 01, 2024 at 07:50:43PM +0100, Adrián Larumbe wrote:
> > Up to this day, all fdinfo-based GPU profilers must traverse the entire
> > /proc directory structure to find open DRM clients with fdinfo file
> > descriptors. This is inefficient and time-consuming.
> > 
> > This patch adds a new DRM ioctl that allows users to obtain a list of PIDs
> > for clients who have opened the DRM device. Output from the ioctl isn't
> > human-readable, and it's meant to be retrieved only by GPU profilers like
> > gputop and nvtop.
> > 
> > Cc: Rob Clark <robdclark@gmail.com>
> > Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> > Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> > ---
> >  drivers/gpu/drm/drm_internal.h |  1 +
> >  drivers/gpu/drm/drm_ioctl.c    | 89 ++++++++++++++++++++++++++++++++++
> >  include/uapi/drm/drm.h         |  7 +++
> >  3 files changed, 97 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> > index 690505a1f7a5..6f78954cae16 100644
> > --- a/drivers/gpu/drm/drm_internal.h
> > +++ b/drivers/gpu/drm/drm_internal.h
> > @@ -243,6 +243,7 @@ static inline void drm_debugfs_encoder_remove(struct drm_encoder *encoder)
> >  drm_ioctl_t drm_version;
> >  drm_ioctl_t drm_getunique;
> >  drm_ioctl_t drm_getclient;
> > +drm_ioctl_t drm_getclients;
> >  
> >  /* drm_syncobj.c */
> >  void drm_syncobj_open(struct drm_file *file_private);
> > diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> > index e368fc084c77..da7057376581 100644
> > --- a/drivers/gpu/drm/drm_ioctl.c
> > +++ b/drivers/gpu/drm/drm_ioctl.c
> > @@ -207,6 +207,93 @@ int drm_getclient(struct drm_device *dev, void *data,
> >  	}
> >  }
> >  
> > +/*
> > + * Get list of client PIDs who have opened a DRM file
> > + *
> > + * \param dev DRM device we are querying
> > + * \param data IOCTL command input.
> > + * \param file_priv DRM file private.
> > + *
> > + * \return zero on success or a negative number on failure.
> > + *
> > + * Traverses list of open clients for the given DRM device, and
> > + * copies them into userpace as an array of PIDs
> > + */
> > +int drm_getclients(struct drm_device *dev, void *data,
> > +		   struct drm_file *file_priv)
> > +
> > +{
> > +	struct drm_get_clients *get_clients = data;
> > +	ssize_t size = get_clients->len;
> > +	char __user *pid_buf;
> > +	ssize_t offset = 0;
> > +	int ret = 0;
> > +
> > +	/*
> > +	 * We do not want to show clients of display only devices so
> > +	 * as to avoid confusing UM GPU profilers
> > +	 */
> > +	if (!dev->render) {
> > +		get_clients->len = 0;
> > +		return 0;
> > +	}
> > +
> > +	/*
> > +	 * An input size of zero means UM wants to know the size of the PID buffer
> > +	 * We round it up to the nearest multiple of the page size so that we can have
> > +	 * some spare headroom in case more clients came in between successive calls
> > +	 * of this ioctl, and also to simplify parsing of the PIDs buffer, because
> > +	 * sizeof(pid_t) will hopefully always divide PAGE_SIZE
> > +	 */
> > +	if (size == 0) {
> > +		get_clients->len =
> > +			roundup(atomic_read(&dev->open_count) * sizeof(pid_t), PAGE_SIZE);
> > +		return 0;
> > +	}
> > +
> > +	pid_buf = (char *)(void *)get_clients->user_data;
> > +
> > +	if (!pid_buf)
> > +		return -EINVAL;
> > +
> > +	mutex_lock(&dev->filelist_mutex);
> > +	list_for_each_entry_reverse(file_priv, &dev->filelist, lhead) {
> > +		pid_t pid_num;
> > +
> > +		if ((size - offset) < sizeof(pid_t))
> > +			break;
> > +
> > +		rcu_read_lock();
> > +		pid_num = pid_vnr(rcu_dereference(file_priv->pid));
> > +		rcu_read_unlock();
> > +
> > +		/* We do not want to return the profiler's PID */
> > +		if (pid_vnr(task_tgid(current)) == pid_num)
> > +			continue;
> > +
> > +		ret = copy_to_user(pid_buf + offset, &pid_num, sizeof(pid_t));
> > +		if (ret)
> > +			break;
> > +
> > +		offset += sizeof(pid_t);
> > +	}
> > +	mutex_unlock(&dev->filelist_mutex);
> > +
> > +	if (ret)
> > +		return -EFAULT;
> > +
> > +	if ((size - offset) >= sizeof(pid_t)) {
> > +		pid_t pid_zero = 0;
> > +
> > +		ret = copy_to_user(pid_buf + offset,
> > +				   &pid_zero, sizeof(pid_t));
> > +		if (ret)
> > +			return -EFAULT;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  /*
> >   * Get statistics information.
> >   *
> > @@ -672,6 +759,8 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
> >  	DRM_IOCTL_DEF(DRM_IOCTL_MODE_LIST_LESSEES, drm_mode_list_lessees_ioctl, DRM_MASTER),
> >  	DRM_IOCTL_DEF(DRM_IOCTL_MODE_GET_LEASE, drm_mode_get_lease_ioctl, DRM_MASTER),
> >  	DRM_IOCTL_DEF(DRM_IOCTL_MODE_REVOKE_LEASE, drm_mode_revoke_lease_ioctl, DRM_MASTER),
> > +
> > +	DRM_IOCTL_DEF(DRM_IOCTL_GET_CLIENTS, drm_getclients, DRM_RENDER_ALLOW),
> 
> Uh RENDER_ALLOW sounds like a very bad idea for this, flat out leaks
> information that really paranoid people don't want to have leaked.

I'm curious, how is this ioctl leakier than, let's say, any of the driver
getparam ioctls, like Panfrost's panfrost_ioctl_get_param() ?

I'm asking this because I checked the way access to a drm file is being handled
in drm_ioctl_permit(), and it seems in the case of a render node (which are the
kind we're most interested in retrieving the list of client PIDs for),
DRM_RENDER_ALLOW access is mandatory.

> Natural would be to limit to ptrace ability, but ptrace is for processes
> and fd aren't tied to that. So I'm not sure ...
> 
> I think a separate file (whether in procfs or a special chardev) where you
> can set access rights that suit feels a lot better for this. Plus putting
> it into procfs would also give the natural property that you can only read
> it if you have access to procfs anyway, so imo that feels like the best
> place for this ...
> 
> And yes that means some lkml bikeshedding with procfs folks, but I do
> think that's good here since we're likely not the only ones who need a bit
> faster procfs trawling for some special use-cases. So consistency across
> subsystems would be nice to at least try to aim for.
> -Sima

I think using procfs would make sense if we were displaying process-specific
information, and such is the case of fdinfo directories therein, but this ioctl
(and the device sysfs knob that it replaces from a previous patch series) is
meant to yield all the device's client PIDs. To me that doesn't sound like
something that is tied to a single render client, but to the device as a whole.

> >  };
> >  
> >  #define DRM_CORE_IOCTL_COUNT	ARRAY_SIZE(drm_ioctls)
> > diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> > index 16122819edfe..c47aa9de51ab 100644
> > --- a/include/uapi/drm/drm.h
> > +++ b/include/uapi/drm/drm.h
> > @@ -1024,6 +1024,11 @@ struct drm_crtc_queue_sequence {
> >  	__u64 user_data;	/* user data passed to event */
> >  };
> >  
> > +struct drm_get_clients {
> > +	__u64 user_data;
> > +	__kernel_size_t len;
> > +};
> > +
> >  #if defined(__cplusplus)
> >  }
> >  #endif
> > @@ -1236,6 +1241,8 @@ extern "C" {
> >  #define DRM_IOCTL_SYNCOBJ_TRANSFER	DRM_IOWR(0xCC, struct drm_syncobj_transfer)
> >  #define DRM_IOCTL_SYNCOBJ_TIMELINE_SIGNAL	DRM_IOWR(0xCD, struct drm_syncobj_timeline_array)
> >  
> > +#define DRM_IOCTL_GET_CLIENTS		DRM_IOWR(0xD1, struct drm_get_clients)
> > +
> >  /**
> >   * DRM_IOCTL_MODE_GETFB2 - Get framebuffer metadata.
> >   *
> > -- 
> > 2.44.0
> > 

Adrian Larumbe
