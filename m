Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 851073F092B
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 18:33:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 879C66E85F;
	Wed, 18 Aug 2021 16:33:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A35826E85A
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 16:33:36 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 61-20020a9d0d430000b02903eabfc221a9so4867570oti.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 09:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eCXA2zyPQAHS4vo82QVOH0nIRnuHikfTX6KZzHmuKg8=;
 b=QjC5m39FFqS5LCTw1JjDcl5B6GEqE4J6pQQCAqHO0dIZPp0kFChKdVrcqgX4J7k2iN
 0W461aQvEEZJ/77xOGhMtNPK37ArAb6nSZnXdeFen/mBS7y8blIxPeDo6/iH9Jv7dxjG
 XYx0/mcOxznQU7DqJ23C8B9nlMbTUOgVqLoX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eCXA2zyPQAHS4vo82QVOH0nIRnuHikfTX6KZzHmuKg8=;
 b=tmZrpqyGBBoyBUT1yl03fINXqcacwfO6i2qkWvi5+eea4GvYbzzjn8XtYJ/wplF7Jn
 E/MHqJzA149QWaesEF4azy1CmZYc90zrpl0WrWmJo5wEiepEEyptNqD9wZOlTMtTMcg6
 sH9fJpzj4Gfj0b2EO6oYaBdCQPDRekMAwNvFc/44asxdbj+EfgFc8fbXUUxMnYlj17/a
 jnmIV0OCUr5JYWYtb8hjN20tcYSP8yRsl/zeye6TaROrMr8NxHm7fGmvSYJMogoaPaiY
 2APcY0VI/TtB1D0YOm639O7HLwJM+f7RVJjKtlaatbPYE/7Qbd9txZLDcxSUMMNmqWMz
 ZcsQ==
X-Gm-Message-State: AOAM533cc/CbBZUQ9fvXCaVAkQglNnQbhLQSgvNORGdNryodxjL4Dcsl
 3HHGT4HwTeedQc7RKpDbje63DnKtQtkS+YmnCLrr/Q==
X-Google-Smtp-Source: ABdhPJxWStQd2lhV6/8pAdrwTDTsMPhhFVB2e1gL192lZFqb5+22njoozSqbDmc46xhVjO9OiXZ5h3OsAHALgZyXtck=
X-Received: by 2002:a9d:4785:: with SMTP id b5mr7756337otf.188.1629304415812; 
 Wed, 18 Aug 2021 09:33:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210818073824.1560124-1-desmondcheongzx@gmail.com>
 <20210818073824.1560124-5-desmondcheongzx@gmail.com>
 <YRzcuiQrLFsWowas@phenom.ffwll.local>
 <53a63ac8-f2de-91f7-4e0f-20b0f3f61d52@gmail.com>
In-Reply-To: <53a63ac8-f2de-91f7-4e0f-20b0f3f61d52@gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 18 Aug 2021 18:33:24 +0200
Message-ID: <CAKMK7uG+nqnkNd56WPhze3V=e1ioL0PTLQxveBofQT3gNPB9HA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v3 4/9] drm: fix potential null ptr
 dereferences in drm_{auth, ioctl}
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@linux.ie>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, 
 Dmitry Vyukov <dvyukov@google.com>, walter-zh.wu@mediatek.com, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, 
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>, 
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Shuah Khan <skhan@linuxfoundation.org>, 
 Greg KH <gregkh@linuxfoundation.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 18, 2021 at 5:37 PM Desmond Cheong Zhi Xi
<desmondcheongzx@gmail.com> wrote:
>
> On 18/8/21 6:11 pm, Daniel Vetter wrote:
> > On Wed, Aug 18, 2021 at 03:38:19PM +0800, Desmond Cheong Zhi Xi wrote:
> >> There are three areas where we dereference struct drm_master without
> >> checking if the pointer is non-NULL.
> >>
> >> 1. drm_getmagic is called from the ioctl_handler. Since
> >> DRM_IOCTL_GET_MAGIC has no ioctl flags, drm_getmagic is run without
> >> any check that drm_file.master has been set.
> >>
> >> 2. Similarly, drm_getunique is called from the ioctl_handler, but
> >> DRM_IOCTL_GET_UNIQUE has no ioctl flags. So there is no guarantee that
> >> drm_file.master has been set.
> >
> > I think the above two are impossible, due to the refcounting rules for
> > struct file.
> >
>
> Right, will drop those two parts from the patch.
>
> >> 3. drm_master_release can also be called without having a
> >> drm_file.master set. Here is one error path:
> >>    drm_open():
> >>      drm_open_helper():
> >>        drm_master_open():
> >>          drm_new_set_master(); <--- returns -ENOMEM,
> >>                                     drm_file.master not set
> >>        drm_file_free():
> >>          drm_master_release(); <--- NULL ptr dereference
> >>                                     (file_priv->master->magic_map)
> >>
> >> Fix these by checking if the master pointers are NULL before use.
> >>
> >> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> >> ---
> >>   drivers/gpu/drm/drm_auth.c  | 16 ++++++++++++++--
> >>   drivers/gpu/drm/drm_ioctl.c |  5 +++++
> >>   2 files changed, 19 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
> >> index f9267b21556e..b7230604496b 100644
> >> --- a/drivers/gpu/drm/drm_auth.c
> >> +++ b/drivers/gpu/drm/drm_auth.c
> >> @@ -95,11 +95,18 @@ EXPORT_SYMBOL(drm_is_current_master);
> >>   int drm_getmagic(struct drm_device *dev, void *data, struct drm_file *file_priv)
> >>   {
> >>      struct drm_auth *auth = data;
> >> +    struct drm_master *master;
> >>      int ret = 0;
> >>
> >>      mutex_lock(&dev->master_mutex);
> >> +    master = file_priv->master;
> >> +    if (!master) {
> >> +            mutex_unlock(&dev->master_mutex);
> >> +            return -EINVAL;
> >> +    }
> >> +
> >>      if (!file_priv->magic) {
> >> -            ret = idr_alloc(&file_priv->master->magic_map, file_priv,
> >> +            ret = idr_alloc(&master->magic_map, file_priv,
> >>                              1, 0, GFP_KERNEL);
> >>              if (ret >= 0)
> >>                      file_priv->magic = ret;
> >> @@ -355,8 +362,12 @@ void drm_master_release(struct drm_file *file_priv)
> >>
> >>      mutex_lock(&dev->master_mutex);
> >>      master = file_priv->master;
> >> +
> >> +    if (!master)
> >> +            goto unlock;
> >
> > This is a bit convoluted, since we're in the single-threaded release path
> > we don't need any locking for file_priv related things. Therefore we can
> > pull the master check out and just directly return.
> >
> > But since it's a bit surprising maybe a comment that this can happen when
> > drm_master_open in drm_open_helper fails?
> >
>
> Sounds good. This can actually also happen in the failure path of
> mock_drm_getfile if anon_inode_getfile fails. I'll leave a short note
> about both of them.
>
> > Another option, and maybe cleaner, would be to move the drm_master_release
> > from drm_file_free into drm_close_helper. That would be fully symmetrical
> > and should also fix the bug here?
> > -Daniel
> >
> Hmmm maybe the first option to move the check out of the lock might be
> better. If I'm not wrong, we would otherwise also need to move
> drm_master_release into drm_client_close.

Do we have to?

If I haven't missed anything, the drm_client stuff only calls
drm_file_alloc and doesn't set up a master. So this should work?
-Daniel

>
> >
> >> +
> >>      if (file_priv->magic)
> >> -            idr_remove(&file_priv->master->magic_map, file_priv->magic);
> >> +            idr_remove(&master->magic_map, file_priv->magic);
> >>
> >>      if (!drm_is_current_master_locked(file_priv))
> >>              goto out;
> >> @@ -379,6 +390,7 @@ void drm_master_release(struct drm_file *file_priv)
> >>              drm_master_put(&file_priv->master);
> >>              spin_unlock(&dev->master_lookup_lock);
> >>      }
> >> +unlock:
> >>      mutex_unlock(&dev->master_mutex);
> >>   }
> >>
> >> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> >> index 26f3a9ede8fe..4d029d3061d9 100644
> >> --- a/drivers/gpu/drm/drm_ioctl.c
> >> +++ b/drivers/gpu/drm/drm_ioctl.c
> >> @@ -121,6 +121,11 @@ int drm_getunique(struct drm_device *dev, void *data,
> >>
> >>      mutex_lock(&dev->master_mutex);
> >>      master = file_priv->master;
> >> +    if (!master) {
> >> +            mutex_unlock(&dev->master_mutex);
> >> +            return -EINVAL;
> >> +    }
> >> +
> >>      if (u->unique_len >= master->unique_len) {
> >>              if (copy_to_user(u->unique, master->unique, master->unique_len)) {
> >>                      mutex_unlock(&dev->master_mutex);
> >> --
> >> 2.25.1
> >>
> >
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
