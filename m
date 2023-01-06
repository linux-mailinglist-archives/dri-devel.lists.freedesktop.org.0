Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE94F66061E
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 19:00:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D89610E8AA;
	Fri,  6 Jan 2023 18:00:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F263510E8AA
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 18:00:31 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id o15so1581900wmr.4
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Jan 2023 10:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=dReYlXlT3zcJjc/Hoc7g6q9Ny1A7N/JoGGms5gn1pM4=;
 b=YuKh0HCR2JDrqMySN1Vmf89TxhE7f3/pOk8Sx1rNO9Cx8jqBhoOKy2tf1jZN+sgLzK
 Y/rSFavPrbr6lm9k3Uqm6ElNH/Kkcxf/yyRV1qj0tlJmcLmCdQfi0OVAZEJoNDPer8Hh
 VfNf/vTRf7AsXbcBeq8YdWfuGSxMGnJUCCEgM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dReYlXlT3zcJjc/Hoc7g6q9Ny1A7N/JoGGms5gn1pM4=;
 b=ng85u4E4d9otSzkKek5W4vjQ/DRB1rQHsH34iw0sU//Cn1wkDVOomgNPpp4KisU4G4
 54okhBvISBfCpG/RacMoVIjQ0pauLDdVihytaxFeXr+5A3qnicxHTxjjyt8zYnaTzpDN
 8ysK6EF+j9FiwShGWJqs1WnoAxrCH4PDo2TNNh2gCILeLKh20Tc49JB5dzCEV3BqhhId
 W6f+zjyTIYC5PzCP7FmhYAhY8UK+I8HYGppyUBFbmndswOBU4pNDBjggvQySjHPkX1IS
 yhp0c93Du5TAYcVf5aoDSzaAoOeAhdVLTJVsMzGA/GIYHST98EC+N7ESB/PvlqKnfQPF
 DsPw==
X-Gm-Message-State: AFqh2kqBV8Y8BbwJ7fPyCFS3y5l4bI+5aL1RK3JNU8k/7kX/ar1V7LuA
 7FYKOZ+DcZ8WgO287QNXHu6BEg==
X-Google-Smtp-Source: AMrXdXs/k3qWU4FzKZ7/uZjsqhDMfDxARS8KjLFhonggtuzMEbl5B4z5ltQiObN40ewgbX3J/kMMsQ==
X-Received: by 2002:a05:600c:5114:b0:3d2:5e4e:6fa with SMTP id
 o20-20020a05600c511400b003d25e4e06famr42611275wms.34.1673028030483; 
 Fri, 06 Jan 2023 10:00:30 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 bi22-20020a05600c3d9600b003d208eb17ecsm2443537wmb.26.2023.01.06.10.00.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 10:00:29 -0800 (PST)
Date: Fri, 6 Jan 2023 19:00:27 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [RFC 3/3] drm: Update file owner during use
Message-ID: <Y7hhu9M1b1thMpVf@phenom.ffwll.local>
References: <20221130133407.2689864-1-tvrtko.ursulin@linux.intel.com>
 <20221130133407.2689864-4-tvrtko.ursulin@linux.intel.com>
 <Y4dmKgn8X4yPUnqk@phenom.ffwll.local>
 <157dcd11-ea4d-b22a-b10f-0934451d3c1d@linux.intel.com>
 <3eccd500-9e69-111d-54bd-90e6292b2b98@amd.com>
 <Y7bDdU0nZg+6GBZL@phenom.ffwll.local>
 <5a875e31-138e-7e11-3a47-b0b85fc1413f@amd.com>
 <Y7f9weWJc1c0XiG1@phenom.ffwll.local>
 <414e4217-4ba2-3bf2-1c75-b01f679cde54@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <414e4217-4ba2-3bf2-1c75-b01f679cde54@amd.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 06, 2023 at 03:53:13PM +0100, Christian König wrote:
> Am 06.01.23 um 11:53 schrieb Daniel Vetter:
> > On Fri, Jan 06, 2023 at 11:32:17AM +0100, Christian König wrote:
> > > Am 05.01.23 um 13:32 schrieb Daniel Vetter:
> > > > [SNIP]
> > > > > For the case of an master fd I actually don't see the reason why we should
> > > > > limit that? And fd can become master if it either was master before or has
> > > > > CAP_SYS_ADMIN. Why would we want an extra check for the pid/tgid here?
> > > > This is just info/debug printing, I don't see the connection to
> > > > drm_auth/master stuff? Aside from the patch mixes up the master opener and
> > > > the current user due to fd passing or something like that.
> > > That's exactly why my comment meant as well.
> > > 
> > > The connect is that the drm_auth/master code currently the pid/tgid as
> > > indicator if the "owner" of the fd has changed and so if an access should be
> > > allowed or not. I find that approach a bit questionable.
> > > 
> > > > Note that we cannot do that (I think at least, after pondering this some
> > > > more) because it would break the logind master fd passing scheme - there
> > > > the receiving compositor is explicitly _not_ allowed to acquire master
> > > > rights on its own. So the master priviledges must not move with the fd or
> > > > things can go wrong.
> > > That could be the rational behind that, but why doesn't logind then just
> > > pass on a normal render node to the compositor?
> > Because the compositor wants the kms node. We have 3 access levels in drm
> > 
> > - render stuff
> > - modeset stuff (needs a card* node and master rights for changing things)
> > - set/drop master (needs root)
> > 
> > logind wants to give the compositor modeset access, but not master
> > drop/set access (because vt switching is controlled by logind).
> > 
> > The pid check in drm_auth is for the use-case where you start your
> > compositor on a root vt (or setuid-root), and then want to make sure
> > that after cred dropping, set/drop master keeps working. Because in that
> > case the vt switch dance is done by the compositor.
> > 
> > Maybe we should document this stuff a bit better :-)
> 
> Maybe add a friendly warning? E.g. like "Don't touch it, it works!" :)

I think Tvrtko just volunteered for that :-) Maybe addition in the
drm-uapi.rst section would be good that fills out the gaps we have.

> So basically this is a valid use case where logind set/get the master status
> of a fd while the compositor uses the master functionality?

Yup, and the compositor is _not_ allowed to call these. Despite that it's
the exact sime struct file - it has to be the same struct file in both
loging and compositor, otherwise logind cannot orchestratet the vt switch
dance for the compositors. Which unlike non-logind vt switching has the
nice property that if a compositor dies/goes rogue, logind can still force
the switch. With vt-only switching you need the sysrq to reset the console
to text and kill the foreground process for the same effect.
-Daniel

> 
> Christian.
> 
> > -Daniel
> > 
> > > Christian.
> > > 
> > > > -Daniel
> > > > 
> > > > 
> > > > 
> > > > > Regards,
> > > > > Christian.
> > > > > 
> > > > > > Regards,
> > > > > > 
> > > > > > Tvrtko
> > > > > > 
> > > > > > > -Daniel
> > > > > > > 
> > > > > > > 
> > > > > > > >             return 0;
> > > > > > > >           if (!capable(CAP_SYS_ADMIN))
> > > > > > > > diff --git a/drivers/gpu/drm/drm_debugfs.c
> > > > > > > > b/drivers/gpu/drm/drm_debugfs.c
> > > > > > > > index 42f657772025..9d4e3146a2b8 100644
> > > > > > > > --- a/drivers/gpu/drm/drm_debugfs.c
> > > > > > > > +++ b/drivers/gpu/drm/drm_debugfs.c
> > > > > > > > @@ -90,15 +90,17 @@ static int drm_clients_info(struct seq_file
> > > > > > > > *m, void *data)
> > > > > > > >          */
> > > > > > > >         mutex_lock(&dev->filelist_mutex);
> > > > > > > >         list_for_each_entry_reverse(priv, &dev->filelist, lhead) {
> > > > > > > > -        struct task_struct *task;
> > > > > > > >             bool is_current_master = drm_is_current_master(priv);
> > > > > > > > +        struct task_struct *task;
> > > > > > > > +        struct pid *pid;
> > > > > > > >     -        rcu_read_lock(); /* locks pid_task()->comm */
> > > > > > > > -        task = pid_task(priv->pid, PIDTYPE_TGID);
> > > > > > > > +        rcu_read_lock(); /* Locks priv->pid and pid_task()->comm! */
> > > > > > > > +        pid = rcu_dereference(priv->pid);
> > > > > > > > +        task = pid_task(pid, PIDTYPE_TGID);
> > > > > > > >             uid = task ? __task_cred(task)->euid : GLOBAL_ROOT_UID;
> > > > > > > >             seq_printf(m, "%20s %5d %3d   %c    %c %5d %10u\n",
> > > > > > > >                    task ? task->comm : "<unknown>",
> > > > > > > > -               pid_vnr(priv->pid),
> > > > > > > > +               pid_vnr(pid),
> > > > > > > >                    priv->minor->index,
> > > > > > > >                    is_current_master ? 'y' : 'n',
> > > > > > > >                    priv->authenticated ? 'y' : 'n',
> > > > > > > > diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> > > > > > > > index 20a9aef2b398..3433f9610dba 100644
> > > > > > > > --- a/drivers/gpu/drm/drm_file.c
> > > > > > > > +++ b/drivers/gpu/drm/drm_file.c
> > > > > > > > @@ -156,7 +156,7 @@ struct drm_file *drm_file_alloc(struct
> > > > > > > > drm_minor *minor)
> > > > > > > >         if (!file)
> > > > > > > >             return ERR_PTR(-ENOMEM);
> > > > > > > >     -    file->pid = get_pid(task_tgid(current));
> > > > > > > > +    rcu_assign_pointer(file->pid, get_pid(task_tgid(current)));
> > > > > > > >         file->minor = minor;
> > > > > > > >           /* for compatibility root is always authenticated */
> > > > > > > > @@ -502,6 +502,36 @@ int drm_release(struct inode *inode, struct
> > > > > > > > file *filp)
> > > > > > > >     }
> > > > > > > >     EXPORT_SYMBOL(drm_release);
> > > > > > > >     +void drm_file_update_pid(struct drm_file *filp)
> > > > > > > > +{
> > > > > > > > +    struct drm_device *dev;
> > > > > > > > +    struct pid *pid, *old;
> > > > > > > > +
> > > > > > > > +    /* Master nodes are not expected to be passed between
> > > > > > > > processes. */
> > > > > > > > +    if (filp->was_master)
> > > > > > > > +        return;
> > > > > > > > +
> > > > > > > > +    pid = task_tgid(current);
> > > > > > > > +
> > > > > > > > +    /*
> > > > > > > > +     * Quick unlocked check since the model is a single
> > > > > > > > handover followed by
> > > > > > > > +     * exclusive repeated use.
> > > > > > > > +     */
> > > > > > > > +    if (pid == rcu_access_pointer(filp->pid))
> > > > > > > > +        return;
> > > > > > > > +
> > > > > > > > +    dev = filp->minor->dev;
> > > > > > > > +    mutex_lock(&dev->filelist_mutex);
> > > > > > > > +    old = rcu_replace_pointer(filp->pid, pid, 1);
> > > > > > > > +    mutex_unlock(&dev->filelist_mutex);
> > > > > > > > +
> > > > > > > > +    if (pid != old) {
> > > > > > > > +        get_pid(pid);
> > > > > > > > +        synchronize_rcu();
> > > > > > > > +        put_pid(old);
> > > > > > > > +    }
> > > > > > > > +}
> > > > > > > > +
> > > > > > > >     /**
> > > > > > > >      * drm_release_noglobal - release method for DRM file
> > > > > > > >      * @inode: device inode
> > > > > > > > diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> > > > > > > > index 7c9d66ee917d..305b18d9d7b6 100644
> > > > > > > > --- a/drivers/gpu/drm/drm_ioctl.c
> > > > > > > > +++ b/drivers/gpu/drm/drm_ioctl.c
> > > > > > > > @@ -775,6 +775,9 @@ long drm_ioctl_kernel(struct file *file,
> > > > > > > > drm_ioctl_t *func, void *kdata,
> > > > > > > >         struct drm_device *dev = file_priv->minor->dev;
> > > > > > > >         int retcode;
> > > > > > > >     +    /* Update drm_file owner if fd was passed along. */
> > > > > > > > +    drm_file_update_pid(file_priv);
> > > > > > > > +
> > > > > > > >         if (drm_dev_is_unplugged(dev))
> > > > > > > >             return -ENODEV;
> > > > > > > >     diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c
> > > > > > > > b/drivers/gpu/drm/nouveau/nouveau_drm.c
> > > > > > > > index 80f154b6adab..a763d3ee61fb 100644
> > > > > > > > --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> > > > > > > > +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> > > > > > > > @@ -1097,7 +1097,10 @@ nouveau_drm_open(struct drm_device *dev,
> > > > > > > > struct drm_file *fpriv)
> > > > > > > >         }
> > > > > > > >           get_task_comm(tmpname, current);
> > > > > > > > -    snprintf(name, sizeof(name), "%s[%d]", tmpname,
> > > > > > > > pid_nr(fpriv->pid));
> > > > > > > > +    rcu_read_lock();
> > > > > > > > +    snprintf(name, sizeof(name), "%s[%d]",
> > > > > > > > +         tmpname, pid_nr(rcu_dereference(fpriv->pid)));
> > > > > > > > +    rcu_read_unlock();
> > > > > > > >           if (!(cli = kzalloc(sizeof(*cli), GFP_KERNEL))) {
> > > > > > > >             ret = -ENOMEM;
> > > > > > > > diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> > > > > > > > b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> > > > > > > > index f2985337aa53..3853d9bb9ab8 100644
> > > > > > > > --- a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> > > > > > > > +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> > > > > > > > @@ -251,6 +251,7 @@ static int vmw_debugfs_gem_info_show(struct
> > > > > > > > seq_file *m, void *unused)
> > > > > > > >         list_for_each_entry(file, &dev->filelist, lhead) {
> > > > > > > >             struct task_struct *task;
> > > > > > > >             struct drm_gem_object *gobj;
> > > > > > > > +        struct pid *pid;
> > > > > > > >             int id;
> > > > > > > >               /*
> > > > > > > > @@ -260,8 +261,9 @@ static int vmw_debugfs_gem_info_show(struct
> > > > > > > > seq_file *m, void *unused)
> > > > > > > >              * Therefore, we need to protect this ->comm access
> > > > > > > > using RCU.
> > > > > > > >              */
> > > > > > > >             rcu_read_lock();
> > > > > > > > -        task = pid_task(file->pid, PIDTYPE_TGID);
> > > > > > > > -        seq_printf(m, "pid %8d command %s:\n", pid_nr(file->pid),
> > > > > > > > +        pid = rcu_dereference(file->pid);
> > > > > > > > +        task = pid_task(pid, PIDTYPE_TGID);
> > > > > > > > +        seq_printf(m, "pid %8d command %s:\n", pid_nr(pid),
> > > > > > > >                    task ? task->comm : "<unknown>");
> > > > > > > >             rcu_read_unlock();
> > > > > > > >     diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> > > > > > > > index 0d1f853092ab..27d545131d4a 100644
> > > > > > > > --- a/include/drm/drm_file.h
> > > > > > > > +++ b/include/drm/drm_file.h
> > > > > > > > @@ -255,8 +255,15 @@ struct drm_file {
> > > > > > > >         /** @master_lookup_lock: Serializes @master. */
> > > > > > > >         spinlock_t master_lookup_lock;
> > > > > > > >     -    /** @pid: Process that opened this file. */
> > > > > > > > -    struct pid *pid;
> > > > > > > > +    /**
> > > > > > > > +     * @pid: Process that is using this file.
> > > > > > > > +     *
> > > > > > > > +     * Must only be dereferenced under a rcu_read_lock or equivalent.
> > > > > > > > +     *
> > > > > > > > +     * Updates are guarded with dev->filelist_mutex and
> > > > > > > > reference must be
> > > > > > > > +     * dropped after a RCU grace period to accommodate lockless
> > > > > > > > readers.
> > > > > > > > +     */
> > > > > > > > +    struct pid __rcu *pid;
> > > > > > > >           /** @magic: Authentication magic, see @authenticated. */
> > > > > > > >         drm_magic_t magic;
> > > > > > > > @@ -415,6 +422,8 @@ static inline bool drm_is_accel_client(const
> > > > > > > > struct drm_file *file_priv)
> > > > > > > >         return file_priv->minor->type == DRM_MINOR_ACCEL;
> > > > > > > >     }
> > > > > > > >     +void drm_file_update_pid(struct drm_file *);
> > > > > > > > +
> > > > > > > >     int drm_open(struct inode *inode, struct file *filp);
> > > > > > > >     int drm_open_helper(struct file *filp, struct drm_minor *minor);
> > > > > > > >     ssize_t drm_read(struct file *filp, char __user *buffer,
> > > > > > > > -- 
> > > > > > > > 2.34.1
> > > > > > > > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
