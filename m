Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B97155870
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 14:29:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 880D96FC8E;
	Fri,  7 Feb 2020 13:29:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DEE26FC8E
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2020 13:29:46 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id a6so2654293wrx.12
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Feb 2020 05:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=EfjsV8m2Qxhq7ylbQVCbbMQaHZ5BYSs0m708734blfQ=;
 b=DHLIXAT7lN0B7l46RyFnJOiBJA+WtAI8+Wkb1yySYI2QBusrfO4zVW0z7uc8SOfzRH
 hqjrmM9SnFURJ7RUXfB2uub8MdhAHl76b5X4yCJCZpmk2ztBwbMiczs3++PNzM+G5e6d
 QJFTU3+zcFT74MM8IMAnd73kw/AnIfCs13opg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EfjsV8m2Qxhq7ylbQVCbbMQaHZ5BYSs0m708734blfQ=;
 b=lmn0fXMCHtQDoLLNw8EZbGjXZ8A8xT9oRInfIZgwBxwwO3Jp6Mhu4eceQPG7sk6fwP
 tPwsAp/+1jLVSE2NpepijnbBVbKBXzMsPSuNFUCt8kf2vE2xvL1DbAyv8qiQ1XpWRTB8
 sNQVltGU9BzwuJRV9dC3gS+hDDhLqgpfYcOhSVlwj+pKarDndoRl9fraPpnFmJW2xExF
 +zMyozPePdPWypfAbsRHDAUblsE6Bpn5mXxonx0pHIYqvqw9dJiRI2kT4Nj9/9BEg/Hl
 Y/rkYywl+lCbKitkNwUATiv3whxKFFqLbeJtfw62l8DO0wKjnCwB00yxT/TCWqwQ9RTR
 DLZQ==
X-Gm-Message-State: APjAAAVYuLZ1h8pXxJwkT0EZbz7T0cZbzVoB+1oHpFbceLwdvuTVALNp
 2KZdHzhTKCM1wlJMXkkhyLbIlg==
X-Google-Smtp-Source: APXvYqyS37ApxJ283w6MXpDNW26i0yesZ5Gnh40x8SL2ht1BwVFXwdx1eOgrIW9V6m/PJ8O4T01rDw==
X-Received: by 2002:adf:d84c:: with SMTP id k12mr4828880wrl.96.1581082185151; 
 Fri, 07 Feb 2020 05:29:45 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z10sm3245144wmk.31.2020.02.07.05.29.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2020 05:29:44 -0800 (PST)
Date: Fri, 7 Feb 2020 14:29:42 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [RFC] drm: rework SET_MASTER and DROP_MASTER perm handling
Message-ID: <20200207132942.GY43062@phenom.ffwll.local>
References: <20200205174839.374658-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200205174839.374658-1-emil.l.velikov@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 05, 2020 at 05:48:39PM +0000, Emil Velikov wrote:
> From: Emil Velikov <emil.velikov@collabora.com>
> 
> This commit reworks the permission handling of the two ioctls. In
> particular it enforced the CAP_SYS_ADMIN check only, if:
>  - we're issuing the ioctl from process other than the one which opened
> the node, and
>  - we are, or were master in the past
> 
> This allows for any application which cannot rely on systemd-logind
> being present (for whichever reason), to drop it's master capabilities
> (and regain them at later point) w/o being ran as root.
> 
> See the comment above drm_master_check_perm() for more details.
> 
> Cc: Adam Jackson <ajax@redhat.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> ---
> This effectively supersedes an earlier patch [1] incorporating ajax's
> feedback (from IRC ages ago).
> 
> [1] https://patchwork.freedesktop.org/patch/268977/
> ---
>  drivers/gpu/drm/drm_auth.c  | 59 +++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_ioctl.c |  4 +--
>  include/drm/drm_file.h      | 11 +++++++
>  3 files changed, 72 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
> index cc9acd986c68..01d9e35c0106 100644
> --- a/drivers/gpu/drm/drm_auth.c
> +++ b/drivers/gpu/drm/drm_auth.c
> @@ -135,6 +135,7 @@ static int drm_set_master(struct drm_device *dev, struct drm_file *fpriv,
>  		}
>  	}
>  
> +	fpriv->was_master = (ret == 0);
>  	return ret;
>  }
>  
> @@ -179,12 +180,64 @@ static int drm_new_set_master(struct drm_device *dev, struct drm_file *fpriv)
>  	return ret;
>  }
>  
> +/*
> + * In the olden days the SET/DROP_MASTER ioctls used to return EACCES when
> + * CAP_SYS_ADMIN was not set.
> + *
> + * Even though the first client is _always_ master, it also had to be run as
> + * root, otherwise SET/DROP_MASTER would fail. In those cases no other client
> + * could become master ... EVER.
> + *
> + * Resulting in a) the graphics session dying badly or b) a completely locked
> + * session :-\
> + *
> + * As some point systemd-logind was introduced to orchestrate and delegate
> + * master as applicable. It does so by opening the fd and passing it to users
> + * while in itself logind a) set/drop master per users' request and b)
> + * implicitly drops master on VT switch.
> + *
> + * Even though logind looks like the future, there are a few obstacles:
> + *  - using it is not possible on some platforms, or
> + *  - applications may not be updated to use it,
> + *  - any client which fails to drop master* can DoS the application using
> + * logind, to a varying degree.
> + *
> + * * Either due missing root permission or simply not calling DROP_MASTER.
> + *
> + *
> + * Here we implement the next best thing:
> + *   We enforce the CAP_SYS_ADMIN check only if the client was not a master
> + * before. We distinguish between the original master client (say logind) and
> + * another client which has the fd passed (say Xorg) by comparing the pids.
> + *
> + * As a result this fixes, the following when using root-less build w/o logind
> + * - startx - some drivers work fine regardless
> + * - weston
> + * - various compositors based on wlroots
> + */

I think this breaks logind security. With logind no compositor can open
the device node directly, hence no compositor can accidentally become the
master and block everyone else.

And for the vt switch logind is the only one that can grant master rights,
and it can make sure that the right compositor gets them. And if the old
compositor is non-cooperating, it can also forcefully remove master
rights.

But with this here we lift this restriction if a compositor has ever been
master. So the following thing could happen:
- We have 3 compositors for different users C1, C2, C3
- We switch from C1 to C2
- While we switch no one is master for a moment, which means C3 could
  sneak in and do a quick setmaster, and become master
- Everything would come crashing done since logind believes it already
  revoked master for C1, but somehow it now cant grant master to C2

I'm not sure we can even support these two models at the same time.

> +static int
> +drm_master_check_perm(struct drm_device *dev, struct drm_file *file_priv)
> +{
> +	if (file_priv->pid != task_pid(current) && file_priv->was_master)

Isn't this a typo? Why should we only allow this if the opener is someone
else ... that looks like the logind approach? Or is my bolean logic parser
broken again.

Cheers, Daniel

> +		return 0;
> +
> +	if (!capable(CAP_SYS_ADMIN))
> +		return -EACCES;
> +
> +	return 0;
> +}
> +
>  int drm_setmaster_ioctl(struct drm_device *dev, void *data,
>  			struct drm_file *file_priv)
>  {
>  	int ret = 0;
>  
>  	mutex_lock(&dev->master_mutex);
> +
> +	ret = drm_master_check_perm(dev, file_priv);
> +	if (ret)
> +		goto out_unlock;
> +
>  	if (drm_is_current_master(file_priv))
>  		goto out_unlock;
>  
> @@ -229,6 +282,12 @@ int drm_dropmaster_ioctl(struct drm_device *dev, void *data,
>  	int ret = -EINVAL;
>  
>  	mutex_lock(&dev->master_mutex);
> +
> +	ret = drm_master_check_perm(dev, file_priv);
> +	if (ret)
> +		goto out_unlock;
> +
> +	ret = -EINVAL;
>  	if (!drm_is_current_master(file_priv))
>  		goto out_unlock;
>  
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index 9e41972c4bbc..73e31dd4e442 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -599,8 +599,8 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
>  	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_SET_SAREA_CTX, drm_legacy_setsareactx, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
>  	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_GET_SAREA_CTX, drm_legacy_getsareactx, DRM_AUTH),
>  
> -	DRM_IOCTL_DEF(DRM_IOCTL_SET_MASTER, drm_setmaster_ioctl, DRM_ROOT_ONLY),
> -	DRM_IOCTL_DEF(DRM_IOCTL_DROP_MASTER, drm_dropmaster_ioctl, DRM_ROOT_ONLY),
> +	DRM_IOCTL_DEF(DRM_IOCTL_SET_MASTER, drm_setmaster_ioctl, 0),
> +	DRM_IOCTL_DEF(DRM_IOCTL_DROP_MASTER, drm_dropmaster_ioctl, 0),
>  
>  	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_ADD_CTX, drm_legacy_addctx, DRM_AUTH|DRM_ROOT_ONLY),
>  	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_RM_CTX, drm_legacy_rmctx, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index 19df8028a6c4..c4746c9d3619 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -201,6 +201,17 @@ struct drm_file {
>  	 */
>  	bool writeback_connectors;
>  
> +	/**
> +	 * @was_master:
> +	 *
> +	 * This client has or had, master capability. Protected by struct
> +	 * &drm_device.master_mutex.
> +	 *
> +	 * This is used to ensure that CAP_SYS_ADMIN is not enforced, if the
> +	 * client is or was master in the past.
> +	 */
> +	bool was_master;
> +
>  	/**
>  	 * @is_master:
>  	 *
> -- 
> 2.25.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
