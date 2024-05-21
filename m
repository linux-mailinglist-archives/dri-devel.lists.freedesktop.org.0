Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBA48CAD80
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 13:45:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A33610E4A0;
	Tue, 21 May 2024 11:45:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="fjgoCNr/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D48110E4A0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 11:45:03 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-56e6583942dso1477276a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 04:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1716291902; x=1716896702; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=IOG87kRKqhGoWjQDtxhtb40Vr6tjKxEiEr57hLDOyAs=;
 b=fjgoCNr/Kh4XVqDLhoxy6NNOaZmrEe5F1hH92PaDmEI0FosoNz95/rKBereds+JOCt
 i8TkmIJC8iedPvahHD4Uw290K6iLPOwa67jUKqekezVoEfbUkPZ8PbTffn+BSSRdmo10
 pCvNK5u73JQjtjsOb8publmfTRSWwMNjMfB9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716291902; x=1716896702;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IOG87kRKqhGoWjQDtxhtb40Vr6tjKxEiEr57hLDOyAs=;
 b=YE9yl4Xinc+TsGFbHW6bpe1ygl0Basv/Qeq/q3EjT9GcvWDPXp8N+BT7SwtpkC8aqX
 bPx4RhOt2/kTn6dc6Rtiz8WRo4NRXBGFrxT/VUeQW0cS2ceHViq5hWkeVwsjds12vnDM
 rnyx3b4hpxhCq0IkY15MtY7wDYuyrk/1Yj+Tj5fiiHb3Qon9xJIPV1nDsg7qPEUaqCE8
 z7asPHzjlvukqR5n4yO3p7kKWUf5UYLPE7ns4UzADHC/jduKtqPs8s4Vrn0xCAMz08rD
 CMRnwlRwYTuTAl5hh4vau8ywbelgiWy81nFupmKjPRyiGt6H2UFmhL1PzQVXHZF6vmI1
 d6mA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtqzjSCtmM+w4hfJfHs0tHWEhG6hxqZFzIcT3U8tPCScwsW95OrVkiGAYDj/Luti7n/xViYfIGUxkDCug2ySWR35PD9EDWN+0FJC77XEkh
X-Gm-Message-State: AOJu0Ywv4vxpuTwugx3KjVvaVX4w48XzWhL9zm56mEF7oHkV/uQLcgqb
 6mZWgmY3PU4uPPzW8tsBvuWH8WSBSdTrHn0xMDb4GPZZFULWv2HjZoaHBRq3/t0=
X-Google-Smtp-Source: AGHT+IHpqPsQEMClqFfPwE8hlGKP0FeodEfBdWinlRo0GJs8wdzebX+3CZQPu/6okkJEhteu1rblhw==
X-Received: by 2002:a05:6402:8d0:b0:572:5c95:50fe with SMTP id
 4fb4d7f45d1cf-5734d444320mr21767661a12.0.1716291901588; 
 Tue, 21 May 2024 04:45:01 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-574bcad0362sm13110306a12.20.2024.05.21.04.45.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 May 2024 04:45:01 -0700 (PDT)
Date: Tue, 21 May 2024 13:44:59 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: =?iso-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH v2 1/1] drm: Add ioctl for querying a DRM device's list
 of open client PIDs
Message-ID: <ZkyJO01lvuVhFlMG@phenom.ffwll.local>
Mail-Followup-To: =?iso-8859-1?Q?Adri=E1n?= Larumbe
 <adrian.larumbe@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
References: <20240501185047.3126832-1-adrian.larumbe@collabora.com>
 <20240501185047.3126832-2-adrian.larumbe@collabora.com>
 <ZjNKLVZgekRqw5AL@phenom.ffwll.local>
 <a3hakatontuh535xkvwz3txbaocjx44ajkarmiigt3prekqysc@hp2zayht4hbh>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a3hakatontuh535xkvwz3txbaocjx44ajkarmiigt3prekqysc@hp2zayht4hbh>
X-Operating-System: Linux phenom 6.8.9-amd64 
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

On Thu, May 16, 2024 at 11:12:19PM +0100, Adrián Larumbe wrote:
> Hi Daniel,
> 
> On 02.05.2024 10:09, Daniel Vetter wrote:
> > On Wed, May 01, 2024 at 07:50:43PM +0100, Adrián Larumbe wrote:
> > > Up to this day, all fdinfo-based GPU profilers must traverse the entire
> > > /proc directory structure to find open DRM clients with fdinfo file
> > > descriptors. This is inefficient and time-consuming.
> > > 
> > > This patch adds a new DRM ioctl that allows users to obtain a list of PIDs
> > > for clients who have opened the DRM device. Output from the ioctl isn't
> > > human-readable, and it's meant to be retrieved only by GPU profilers like
> > > gputop and nvtop.
> > > 
> > > Cc: Rob Clark <robdclark@gmail.com>
> > > Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> > > Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> > > ---
> > >  drivers/gpu/drm/drm_internal.h |  1 +
> > >  drivers/gpu/drm/drm_ioctl.c    | 89 ++++++++++++++++++++++++++++++++++
> > >  include/uapi/drm/drm.h         |  7 +++
> > >  3 files changed, 97 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> > > index 690505a1f7a5..6f78954cae16 100644
> > > --- a/drivers/gpu/drm/drm_internal.h
> > > +++ b/drivers/gpu/drm/drm_internal.h
> > > @@ -243,6 +243,7 @@ static inline void drm_debugfs_encoder_remove(struct drm_encoder *encoder)
> > >  drm_ioctl_t drm_version;
> > >  drm_ioctl_t drm_getunique;
> > >  drm_ioctl_t drm_getclient;
> > > +drm_ioctl_t drm_getclients;
> > >  
> > >  /* drm_syncobj.c */
> > >  void drm_syncobj_open(struct drm_file *file_private);
> > > diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> > > index e368fc084c77..da7057376581 100644
> > > --- a/drivers/gpu/drm/drm_ioctl.c
> > > +++ b/drivers/gpu/drm/drm_ioctl.c
> > > @@ -207,6 +207,93 @@ int drm_getclient(struct drm_device *dev, void *data,
> > >  	}
> > >  }
> > >  
> > > +/*
> > > + * Get list of client PIDs who have opened a DRM file
> > > + *
> > > + * \param dev DRM device we are querying
> > > + * \param data IOCTL command input.
> > > + * \param file_priv DRM file private.
> > > + *
> > > + * \return zero on success or a negative number on failure.
> > > + *
> > > + * Traverses list of open clients for the given DRM device, and
> > > + * copies them into userpace as an array of PIDs
> > > + */
> > > +int drm_getclients(struct drm_device *dev, void *data,
> > > +		   struct drm_file *file_priv)
> > > +
> > > +{
> > > +	struct drm_get_clients *get_clients = data;
> > > +	ssize_t size = get_clients->len;
> > > +	char __user *pid_buf;
> > > +	ssize_t offset = 0;
> > > +	int ret = 0;
> > > +
> > > +	/*
> > > +	 * We do not want to show clients of display only devices so
> > > +	 * as to avoid confusing UM GPU profilers
> > > +	 */
> > > +	if (!dev->render) {
> > > +		get_clients->len = 0;
> > > +		return 0;
> > > +	}
> > > +
> > > +	/*
> > > +	 * An input size of zero means UM wants to know the size of the PID buffer
> > > +	 * We round it up to the nearest multiple of the page size so that we can have
> > > +	 * some spare headroom in case more clients came in between successive calls
> > > +	 * of this ioctl, and also to simplify parsing of the PIDs buffer, because
> > > +	 * sizeof(pid_t) will hopefully always divide PAGE_SIZE
> > > +	 */
> > > +	if (size == 0) {
> > > +		get_clients->len =
> > > +			roundup(atomic_read(&dev->open_count) * sizeof(pid_t), PAGE_SIZE);
> > > +		return 0;
> > > +	}
> > > +
> > > +	pid_buf = (char *)(void *)get_clients->user_data;
> > > +
> > > +	if (!pid_buf)
> > > +		return -EINVAL;
> > > +
> > > +	mutex_lock(&dev->filelist_mutex);
> > > +	list_for_each_entry_reverse(file_priv, &dev->filelist, lhead) {
> > > +		pid_t pid_num;
> > > +
> > > +		if ((size - offset) < sizeof(pid_t))
> > > +			break;
> > > +
> > > +		rcu_read_lock();
> > > +		pid_num = pid_vnr(rcu_dereference(file_priv->pid));
> > > +		rcu_read_unlock();
> > > +
> > > +		/* We do not want to return the profiler's PID */
> > > +		if (pid_vnr(task_tgid(current)) == pid_num)
> > > +			continue;
> > > +
> > > +		ret = copy_to_user(pid_buf + offset, &pid_num, sizeof(pid_t));
> > > +		if (ret)
> > > +			break;
> > > +
> > > +		offset += sizeof(pid_t);
> > > +	}
> > > +	mutex_unlock(&dev->filelist_mutex);
> > > +
> > > +	if (ret)
> > > +		return -EFAULT;
> > > +
> > > +	if ((size - offset) >= sizeof(pid_t)) {
> > > +		pid_t pid_zero = 0;
> > > +
> > > +		ret = copy_to_user(pid_buf + offset,
> > > +				   &pid_zero, sizeof(pid_t));
> > > +		if (ret)
> > > +			return -EFAULT;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >  /*
> > >   * Get statistics information.
> > >   *
> > > @@ -672,6 +759,8 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
> > >  	DRM_IOCTL_DEF(DRM_IOCTL_MODE_LIST_LESSEES, drm_mode_list_lessees_ioctl, DRM_MASTER),
> > >  	DRM_IOCTL_DEF(DRM_IOCTL_MODE_GET_LEASE, drm_mode_get_lease_ioctl, DRM_MASTER),
> > >  	DRM_IOCTL_DEF(DRM_IOCTL_MODE_REVOKE_LEASE, drm_mode_revoke_lease_ioctl, DRM_MASTER),
> > > +
> > > +	DRM_IOCTL_DEF(DRM_IOCTL_GET_CLIENTS, drm_getclients, DRM_RENDER_ALLOW),
> > 
> > Uh RENDER_ALLOW sounds like a very bad idea for this, flat out leaks
> > information that really paranoid people don't want to have leaked.
> 
> I'm curious, how is this ioctl leakier than, let's say, any of the driver
> getparam ioctls, like Panfrost's panfrost_ioctl_get_param() ?
> 
> I'm asking this because I checked the way access to a drm file is being handled
> in drm_ioctl_permit(), and it seems in the case of a render node (which are the
> kind we're most interested in retrieving the list of client PIDs for),
> DRM_RENDER_ALLOW access is mandatory.

All the resources are attached to a file, and that's fundamentally what
the ioctls we have operate on. Or invariant stuff from the driver/hw, like
the get_param ioctl you mention.

What your ioctl does is give us information about _other_ files opened of
the same underlying render node, which is entirely new and does break the
full isolation between different open render node files we've hade thus
far.

> > Natural would be to limit to ptrace ability, but ptrace is for processes
> > and fd aren't tied to that. So I'm not sure ...
> > 
> > I think a separate file (whether in procfs or a special chardev) where you
> > can set access rights that suit feels a lot better for this. Plus putting
> > it into procfs would also give the natural property that you can only read
> > it if you have access to procfs anyway, so imo that feels like the best
> > place for this ...
> > 
> > And yes that means some lkml bikeshedding with procfs folks, but I do
> > think that's good here since we're likely not the only ones who need a bit
> > faster procfs trawling for some special use-cases. So consistency across
> > subsystems would be nice to at least try to aim for.
> > -Sima
> 
> I think using procfs would make sense if we were displaying process-specific
> information, and such is the case of fdinfo directories therein, but this ioctl
> (and the device sysfs knob that it replaces from a previous patch series) is
> meant to yield all the device's client PIDs. To me that doesn't sound like
> something that is tied to a single render client, but to the device as a whole.

procfs because it's an algorithmic improvement for an interface that _is_
in procfs. If you don't have access to procfs and it's fdinfo files, then
this "give me the list of all open files" is no use. Also with pid name
spaces we need to make sure that the list we hand out matches the relevant
pid name space, if it's global that's a bug. So it's also relevant to the
specific procfs instance a process has.

So from a security pov, that's where it belongs.
-Sima

> 
> > >  };
> > >  
> > >  #define DRM_CORE_IOCTL_COUNT	ARRAY_SIZE(drm_ioctls)
> > > diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> > > index 16122819edfe..c47aa9de51ab 100644
> > > --- a/include/uapi/drm/drm.h
> > > +++ b/include/uapi/drm/drm.h
> > > @@ -1024,6 +1024,11 @@ struct drm_crtc_queue_sequence {
> > >  	__u64 user_data;	/* user data passed to event */
> > >  };
> > >  
> > > +struct drm_get_clients {
> > > +	__u64 user_data;
> > > +	__kernel_size_t len;
> > > +};
> > > +
> > >  #if defined(__cplusplus)
> > >  }
> > >  #endif
> > > @@ -1236,6 +1241,8 @@ extern "C" {
> > >  #define DRM_IOCTL_SYNCOBJ_TRANSFER	DRM_IOWR(0xCC, struct drm_syncobj_transfer)
> > >  #define DRM_IOCTL_SYNCOBJ_TIMELINE_SIGNAL	DRM_IOWR(0xCD, struct drm_syncobj_timeline_array)
> > >  
> > > +#define DRM_IOCTL_GET_CLIENTS		DRM_IOWR(0xD1, struct drm_get_clients)
> > > +
> > >  /**
> > >   * DRM_IOCTL_MODE_GETFB2 - Get framebuffer metadata.
> > >   *
> > > -- 
> > > 2.44.0
> > > 
> 
> Adrian Larumbe

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
