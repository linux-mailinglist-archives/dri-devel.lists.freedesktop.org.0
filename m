Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34934660111
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 14:18:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70C7E10E154;
	Fri,  6 Jan 2023 13:18:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F7E010E154
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 13:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673011121; x=1704547121;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=wBuP01Qvl56F9Q2Fl7IJspz3bfK36fiXXl8TCpVheN0=;
 b=gdDTYlhTylp4bephQ9F03J6BxHaxR6p6rCXCx5MXQhq3phW8A8lUovLP
 AqvdCUF8h+0PmYnY6GeGDHbvW/LtqvINZRLuhgYoeisUyM1IVrdBppCM5
 4Xxsxk2LmIZSi48xvpSuINu2YbDUYAxgCqz6ixEOCFMgw+PmfGhJDG4+C
 cSlwBh+bQozuyOWq0uypeEMx1Tkki60CxpGb5vit5Xqu5XDzaa7mwaduw
 0zAdg69Sb7OQZTHzVIGeYnTcLTij4ChZfBzwIb+bWaMsWaw+z/5MWu4s1
 cQ09+zbl+/GLzf/e27zHxIniIztQotWT9QacjKjFH0ApSE70huVGLTYqT w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10581"; a="302173405"
X-IronPort-AV: E=Sophos;i="5.96,305,1665471600"; d="scan'208";a="302173405"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2023 05:18:40 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10581"; a="763519915"
X-IronPort-AV: E=Sophos;i="5.96,305,1665471600"; d="scan'208";a="763519915"
Received: from mjervis-mobl1.ger.corp.intel.com (HELO [10.213.209.50])
 ([10.213.209.50])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2023 05:18:39 -0800
Message-ID: <0a9916cd-0736-57c6-3fc0-d849a935fbd9@linux.intel.com>
Date: Fri, 6 Jan 2023 13:18:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC 3/3] drm: Update file owner during use
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20221130133407.2689864-1-tvrtko.ursulin@linux.intel.com>
 <20221130133407.2689864-4-tvrtko.ursulin@linux.intel.com>
 <Y4dmKgn8X4yPUnqk@phenom.ffwll.local>
 <157dcd11-ea4d-b22a-b10f-0934451d3c1d@linux.intel.com>
 <3eccd500-9e69-111d-54bd-90e6292b2b98@amd.com>
 <Y7bDdU0nZg+6GBZL@phenom.ffwll.local>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <Y7bDdU0nZg+6GBZL@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 05/01/2023 12:32, Daniel Vetter wrote:
> On Fri, Dec 02, 2022 at 10:01:01AM +0100, Christian König wrote:
>> Am 01.12.22 um 12:09 schrieb Tvrtko Ursulin:
>>>
>>> On 30/11/2022 14:18, Daniel Vetter wrote:
>>>> On Wed, Nov 30, 2022 at 01:34:07PM +0000, Tvrtko Ursulin wrote:
>>>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>>
>>>>> With the typical model where the display server opends the file
>>>>> descriptor
>>>>> and then hands it over to the client we were showing stale data in
>>>>> debugfs.
>>>>>
>>>>> Fix it by updating the drm_file->pid on ioctl access from a different
>>>>> process.
>>>>>
>>>>> The field is also made RCU protected to allow for lockless
>>>>> readers. Update
>>>>> side is protected with dev->filelist_mutex.
>>>>>
>>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>> Cc: "Christian König" <christian.koenig@amd.com>
>>>>> ---
>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c |  6 +++--
>>>>>    drivers/gpu/drm/drm_auth.c              |  3 ++-
>>>>>    drivers/gpu/drm/drm_debugfs.c           | 10 ++++----
>>>>>    drivers/gpu/drm/drm_file.c              | 32
>>>>> ++++++++++++++++++++++++-
>>>>>    drivers/gpu/drm/drm_ioctl.c             |  3 +++
>>>>>    drivers/gpu/drm/nouveau/nouveau_drm.c   |  5 +++-
>>>>>    drivers/gpu/drm/vmwgfx/vmwgfx_gem.c     |  6 +++--
>>>>>    include/drm/drm_file.h                  | 13 ++++++++--
>>>>>    8 files changed, 65 insertions(+), 13 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>>>> index 30e24da1f398..385deb044058 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>>>> @@ -959,6 +959,7 @@ static int
>>>>> amdgpu_debugfs_gem_info_show(struct seq_file *m, void *unused)
>>>>>        list_for_each_entry(file, &dev->filelist, lhead) {
>>>>>            struct task_struct *task;
>>>>>            struct drm_gem_object *gobj;
>>>>> +        struct pid *pid;
>>>>>            int id;
>>>>>              /*
>>>>> @@ -968,8 +969,9 @@ static int
>>>>> amdgpu_debugfs_gem_info_show(struct seq_file *m, void *unused)
>>>>>             * Therefore, we need to protect this ->comm access
>>>>> using RCU.
>>>>>             */
>>>>>            rcu_read_lock();
>>>>> -        task = pid_task(file->pid, PIDTYPE_TGID);
>>>>> -        seq_printf(m, "pid %8d command %s:\n", pid_nr(file->pid),
>>>>> +        pid = rcu_dereference(file->pid);
>>>>> +        task = pid_task(pid, PIDTYPE_TGID);
>>>>> +        seq_printf(m, "pid %8d command %s:\n", pid_nr(pid),
>>>>>                   task ? task->comm : "<unknown>");
>>>>>            rcu_read_unlock();
>>>>>    diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
>>>>> index cf92a9ae8034..2ed2585ded37 100644
>>>>> --- a/drivers/gpu/drm/drm_auth.c
>>>>> +++ b/drivers/gpu/drm/drm_auth.c
>>>>> @@ -235,7 +235,8 @@ static int drm_new_set_master(struct
>>>>> drm_device *dev, struct drm_file *fpriv)
>>>>>    static int
>>>>>    drm_master_check_perm(struct drm_device *dev, struct drm_file
>>>>> *file_priv)
>>>>>    {
>>>>> -    if (file_priv->pid == task_pid(current) && file_priv->was_master)
>>>>> +    if (file_priv->was_master &&
>>>>> +        rcu_access_pointer(file_priv->pid) == task_pid(current))
>>>>
>>>> This scares me, and also makes me wonder whether we really want to
>>>> conflate the original owner with the rendering owner. And also,
>>>> whether we
>>>> really want to keep updating that, because for some of the "bind an
>>>> fd to
>>>> a pid" use-cases like svm we really do not want to ever again allow a
>>>> change.
>>>>
>>>> So sligthly different idea:
>>>> - we have a separate render pid/drm_file owner frome the open()
>>>> owner that
>>>>     we track in drm_auth.c
>>>> - that one is set the first time a driver specific ioctl is called
>>>> (which
>>>>     for the "pass me the fd" dri3 mode should never be the compositor)
>>>> - we start out with nothing and only set it once, which further
>>>> simplifies
>>>>     the model (still need the mutex for concurrent first ioctl ofc)
>>>
>>> Simpler solution sounds plausible and mostly works for me. Certainly is
>>> attractive to simplify things. And as the disclaimer I put in the cover
>>> letter - I wasn't really sure at all if passing a master fd is a thing
>>> or not. Happy to implement your version if that will be the decision.
>>>
>>> The only downside I can think of right now with having two owners is if
>>> someone is "naughty" and actually uses the fd for rendering from two
>>> sides. That wouldn't conceptually work for what I am doing in the cgroup
>>> controller, where I need to attribute GPU usage to a process, which is a
>>> lookup from struct pid -> list of drm_files -> etc. So in the two owners
>>> scheme I would just need to ignore the "open owner" and rely that
>>> "render ownder" truly is the only one doing the rendering. Or maybe I'd
>>> need to add support for multiple owners as well.. would be a bit
>>> annoying probably.
>>>
>>> Hm now that I think about more.. the one shot nature of this scheme
>>> would have another downside. One could just send the fd back to itself
>>> via a throway forked helper, which only does one ioctl before sending it
>>> back, and then the "render owner" is forever lost. The proposal as I had
>>> it would be immune to this problem at least.
>>>
>>>> Eventually we could then use that to enforce static binding to a pid,
>>>> which is what we want for svm style models, i.e. if the pid changes, the
>>>> fd does an -EACCESS or similar.
>>>>
>>>> Thoughts?
>>>
>>> This use case I am not familiar with at all so can't comment. Only
>>> intuitively I would ask - why is it something that needs to be solved at
>>> the DRM level? Because essentially it sounds like there is a want to
>>> disallow sending fds via sockets.
> 
> Disallowing passing isn't the idea I had. It's to disallow passing to more
> than one recipient, once that recipient has started using the fd for real.

And this restriction would always apply, not just for SVM?

If it would always apply the "two owners / one-shot change" approach 
would work for me. If "pass once" would not be universally applied then 
"two owners / one-shot change" does not work IMO because real user may 
not be correctly reflected.

And I have some reservations on disallow passing implemented in a driver 
framework. Need to snoop around a bit to see if someone else is doing it.

>> I think we should only disallow binding an fd to a different process when
>> there is a reason to do so.
>>
>> For SVM it's an rather obvious security problem when we allow accessing the
>> address space of another process. But this should probably be handled in the
>> SVM code, not here. E.g. we check during CS if the mm_struct is still the
>> same. Which pid or tgid this fd has last or initially used it completely
>> irrelevant to this.
> 
> Yeah my idea was to also then build the SVM check on top of this as
> enforcement.
> 
>> For the case of an master fd I actually don't see the reason why we should
>> limit that? And fd can become master if it either was master before or has
>> CAP_SYS_ADMIN. Why would we want an extra check for the pid/tgid here?
> 
> This is just info/debug printing, I don't see the connection to
> drm_auth/master stuff? Aside from the patch mixes up the master opener and
> the current user due to fd passing or something like that.

For now it is for info/debug printing, but the idea is to use it from 
the cgroup controller so usage can be attributed against the real user.

Where do you see the breakage? I left the master perm check as is 
deliberatly to not break that ie. it is not changing ownership ever is 
file->was_master is set.

> Note that we cannot do that (I think at least, after pondering this some
> more) because it would break the logind master fd passing scheme - there
> the receiving compositor is explicitly _not_ allowed to acquire master
> rights on its own. So the master priviledges must not move with the fd or
> things can go wrong.

Since file->was_master is AFAICT immutable I don't think I broke anything.

Regards,

Tvrtko

> 
> 
> 
>>
>> Regards,
>> Christian.
>>
>>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>>> -Daniel
>>>>
>>>>
>>>>>            return 0;
>>>>>          if (!capable(CAP_SYS_ADMIN))
>>>>> diff --git a/drivers/gpu/drm/drm_debugfs.c
>>>>> b/drivers/gpu/drm/drm_debugfs.c
>>>>> index 42f657772025..9d4e3146a2b8 100644
>>>>> --- a/drivers/gpu/drm/drm_debugfs.c
>>>>> +++ b/drivers/gpu/drm/drm_debugfs.c
>>>>> @@ -90,15 +90,17 @@ static int drm_clients_info(struct seq_file
>>>>> *m, void *data)
>>>>>         */
>>>>>        mutex_lock(&dev->filelist_mutex);
>>>>>        list_for_each_entry_reverse(priv, &dev->filelist, lhead) {
>>>>> -        struct task_struct *task;
>>>>>            bool is_current_master = drm_is_current_master(priv);
>>>>> +        struct task_struct *task;
>>>>> +        struct pid *pid;
>>>>>    -        rcu_read_lock(); /* locks pid_task()->comm */
>>>>> -        task = pid_task(priv->pid, PIDTYPE_TGID);
>>>>> +        rcu_read_lock(); /* Locks priv->pid and pid_task()->comm! */
>>>>> +        pid = rcu_dereference(priv->pid);
>>>>> +        task = pid_task(pid, PIDTYPE_TGID);
>>>>>            uid = task ? __task_cred(task)->euid : GLOBAL_ROOT_UID;
>>>>>            seq_printf(m, "%20s %5d %3d   %c    %c %5d %10u\n",
>>>>>                   task ? task->comm : "<unknown>",
>>>>> -               pid_vnr(priv->pid),
>>>>> +               pid_vnr(pid),
>>>>>                   priv->minor->index,
>>>>>                   is_current_master ? 'y' : 'n',
>>>>>                   priv->authenticated ? 'y' : 'n',
>>>>> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
>>>>> index 20a9aef2b398..3433f9610dba 100644
>>>>> --- a/drivers/gpu/drm/drm_file.c
>>>>> +++ b/drivers/gpu/drm/drm_file.c
>>>>> @@ -156,7 +156,7 @@ struct drm_file *drm_file_alloc(struct
>>>>> drm_minor *minor)
>>>>>        if (!file)
>>>>>            return ERR_PTR(-ENOMEM);
>>>>>    -    file->pid = get_pid(task_tgid(current));
>>>>> +    rcu_assign_pointer(file->pid, get_pid(task_tgid(current)));
>>>>>        file->minor = minor;
>>>>>          /* for compatibility root is always authenticated */
>>>>> @@ -502,6 +502,36 @@ int drm_release(struct inode *inode, struct
>>>>> file *filp)
>>>>>    }
>>>>>    EXPORT_SYMBOL(drm_release);
>>>>>    +void drm_file_update_pid(struct drm_file *filp)
>>>>> +{
>>>>> +    struct drm_device *dev;
>>>>> +    struct pid *pid, *old;
>>>>> +
>>>>> +    /* Master nodes are not expected to be passed between
>>>>> processes. */
>>>>> +    if (filp->was_master)
>>>>> +        return;
>>>>> +
>>>>> +    pid = task_tgid(current);
>>>>> +
>>>>> +    /*
>>>>> +     * Quick unlocked check since the model is a single
>>>>> handover followed by
>>>>> +     * exclusive repeated use.
>>>>> +     */
>>>>> +    if (pid == rcu_access_pointer(filp->pid))
>>>>> +        return;
>>>>> +
>>>>> +    dev = filp->minor->dev;
>>>>> +    mutex_lock(&dev->filelist_mutex);
>>>>> +    old = rcu_replace_pointer(filp->pid, pid, 1);
>>>>> +    mutex_unlock(&dev->filelist_mutex);
>>>>> +
>>>>> +    if (pid != old) {
>>>>> +        get_pid(pid);
>>>>> +        synchronize_rcu();
>>>>> +        put_pid(old);
>>>>> +    }
>>>>> +}
>>>>> +
>>>>>    /**
>>>>>     * drm_release_noglobal - release method for DRM file
>>>>>     * @inode: device inode
>>>>> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
>>>>> index 7c9d66ee917d..305b18d9d7b6 100644
>>>>> --- a/drivers/gpu/drm/drm_ioctl.c
>>>>> +++ b/drivers/gpu/drm/drm_ioctl.c
>>>>> @@ -775,6 +775,9 @@ long drm_ioctl_kernel(struct file *file,
>>>>> drm_ioctl_t *func, void *kdata,
>>>>>        struct drm_device *dev = file_priv->minor->dev;
>>>>>        int retcode;
>>>>>    +    /* Update drm_file owner if fd was passed along. */
>>>>> +    drm_file_update_pid(file_priv);
>>>>> +
>>>>>        if (drm_dev_is_unplugged(dev))
>>>>>            return -ENODEV;
>>>>>    diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c
>>>>> b/drivers/gpu/drm/nouveau/nouveau_drm.c
>>>>> index 80f154b6adab..a763d3ee61fb 100644
>>>>> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
>>>>> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
>>>>> @@ -1097,7 +1097,10 @@ nouveau_drm_open(struct drm_device *dev,
>>>>> struct drm_file *fpriv)
>>>>>        }
>>>>>          get_task_comm(tmpname, current);
>>>>> -    snprintf(name, sizeof(name), "%s[%d]", tmpname,
>>>>> pid_nr(fpriv->pid));
>>>>> +    rcu_read_lock();
>>>>> +    snprintf(name, sizeof(name), "%s[%d]",
>>>>> +         tmpname, pid_nr(rcu_dereference(fpriv->pid)));
>>>>> +    rcu_read_unlock();
>>>>>          if (!(cli = kzalloc(sizeof(*cli), GFP_KERNEL))) {
>>>>>            ret = -ENOMEM;
>>>>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
>>>>> b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
>>>>> index f2985337aa53..3853d9bb9ab8 100644
>>>>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
>>>>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
>>>>> @@ -251,6 +251,7 @@ static int vmw_debugfs_gem_info_show(struct
>>>>> seq_file *m, void *unused)
>>>>>        list_for_each_entry(file, &dev->filelist, lhead) {
>>>>>            struct task_struct *task;
>>>>>            struct drm_gem_object *gobj;
>>>>> +        struct pid *pid;
>>>>>            int id;
>>>>>              /*
>>>>> @@ -260,8 +261,9 @@ static int vmw_debugfs_gem_info_show(struct
>>>>> seq_file *m, void *unused)
>>>>>             * Therefore, we need to protect this ->comm access
>>>>> using RCU.
>>>>>             */
>>>>>            rcu_read_lock();
>>>>> -        task = pid_task(file->pid, PIDTYPE_TGID);
>>>>> -        seq_printf(m, "pid %8d command %s:\n", pid_nr(file->pid),
>>>>> +        pid = rcu_dereference(file->pid);
>>>>> +        task = pid_task(pid, PIDTYPE_TGID);
>>>>> +        seq_printf(m, "pid %8d command %s:\n", pid_nr(pid),
>>>>>                   task ? task->comm : "<unknown>");
>>>>>            rcu_read_unlock();
>>>>>    diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
>>>>> index 0d1f853092ab..27d545131d4a 100644
>>>>> --- a/include/drm/drm_file.h
>>>>> +++ b/include/drm/drm_file.h
>>>>> @@ -255,8 +255,15 @@ struct drm_file {
>>>>>        /** @master_lookup_lock: Serializes @master. */
>>>>>        spinlock_t master_lookup_lock;
>>>>>    -    /** @pid: Process that opened this file. */
>>>>> -    struct pid *pid;
>>>>> +    /**
>>>>> +     * @pid: Process that is using this file.
>>>>> +     *
>>>>> +     * Must only be dereferenced under a rcu_read_lock or equivalent.
>>>>> +     *
>>>>> +     * Updates are guarded with dev->filelist_mutex and
>>>>> reference must be
>>>>> +     * dropped after a RCU grace period to accommodate lockless
>>>>> readers.
>>>>> +     */
>>>>> +    struct pid __rcu *pid;
>>>>>          /** @magic: Authentication magic, see @authenticated. */
>>>>>        drm_magic_t magic;
>>>>> @@ -415,6 +422,8 @@ static inline bool drm_is_accel_client(const
>>>>> struct drm_file *file_priv)
>>>>>        return file_priv->minor->type == DRM_MINOR_ACCEL;
>>>>>    }
>>>>>    +void drm_file_update_pid(struct drm_file *);
>>>>> +
>>>>>    int drm_open(struct inode *inode, struct file *filp);
>>>>>    int drm_open_helper(struct file *filp, struct drm_minor *minor);
>>>>>    ssize_t drm_read(struct file *filp, char __user *buffer,
>>>>> -- 
>>>>> 2.34.1
>>>>>
>>>>
>>
> 
