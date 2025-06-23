Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 652AEAE488F
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 17:28:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EF7610E3D2;
	Mon, 23 Jun 2025 15:28:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="iU/Alsp5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B85410E3D6
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 15:28:37 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-453643020bdso26276865e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 08:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1750692516; x=1751297316;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=T5jsPJ1p5Egrtae+4G+WGKOerqdw7nmTqDz+XFCcz+E=;
 b=iU/Alsp5CvHC0PWrkNTejIt/mGvj7KseVjIek7FznYiQGFmZjjuySz3U/ZGQT/xTkA
 FnhAXxFg+DJ2WsBSuySC0HGT7qk2Okfgv+/xWX/lrFirrB7ZINLebHmqrKWYVprQHgev
 ydcZHr1OM7anCK6Dy/D0XiskhO/OqvXdu4xn2Co7ICqrJ55bzqbnRzQl14iBmNXgXcW0
 jwp4fX558lEJrroR0eGfgdvfTB+FF86X9ua5Kcz5x5ZL2R6OI82fCxQI9GtVCRkYWjkf
 b8CrtQLQ8i03cr9SpvW7ca5haVl3QzZAOdO1O2iomOE+9h1HKPqChXrE0Pi0QADvOjPj
 Yrnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750692516; x=1751297316;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T5jsPJ1p5Egrtae+4G+WGKOerqdw7nmTqDz+XFCcz+E=;
 b=DnO3+7e5DE8O/9Ly5pKfw16ylGqcuec883hb9B8vSSfC/Lxd8BpWFLmkVD7O/Wg1kZ
 k5Qs6hc73SwUiUlQydVsFHx21u5GmDRpFY4LUDC/YQlgum/8n/O3L7PRq1Y0slqOSYoZ
 otOZmPZvjOLOgYk7a4cXCAEXlNmRp8cKi1eq/evag6ILVb8tbsPqa4etuDRTxa/YNFi0
 whPIxoU1eRk1RbqB4XCcF/uVbGaIqkVNIWe349zbJ+Tr/H5629hujnFU9lnj1jlBrDDY
 VwWC8rmPyeSLwL08Hpmx0RdfxYGBnpy2f64waAvXGPOH/xiURtNqSjSMg1m9HhfbWWWM
 ouDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXK8MWl6i+WE+O9OzhREmHNlMfI3gjM50d252BgAMh7amAUeV4b2oBZhsI8NHKt6PgHzJOvvghNm9I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwF9LJcQlpafsPjJKzr4TBvEv8stQqn9AlUXMrrFFbk8kzUg/38
 6/iyzt1ugu09ZxkoLsmF5tLN8NPe5P7kt5K+15kNy9lZadIjq3Bprq1gfYLMkP0fZrs=
X-Gm-Gg: ASbGncvMyAamhukQvuaWXZeiE9COQ0FX3maQ62cHCvgh4zKRPmgTR5xIwRweJAvVen2
 20fc7pKLPa0Z4QdDDFo6Esv0v6PP6Jmo2z0fcI3/o8YVPpVy8TQUdVTttqXGACg0KSVrYDJescg
 SPPOpLOYwN/wq7mJX8IM+xd4eWmuXn3TGZMxiEHvSzNqr80chm+rWm72dBXCwLJaSt8upuHftnr
 qhJeqxui1Pybv84nLfK/ur7pPakVvUVk6zUkzebUi0RhcTXXeOl0jssH1oriplHe5w3AR5kg+OF
 tQiAFXIpsw9uHmGaKTu36H0VsMU2QZqsOiS/cMsZp8Qf3rAXAg+jfmG26ygSKab2ruKSWnpvDwy
 y
X-Google-Smtp-Source: AGHT+IFQpDGlRRJnUzpoHTSyJAhCWxlzPofzDLWcKPngGnjPSLg2iE2SjgwKKIyXdc7jCTB3NGk5KQ==
X-Received: by 2002:a05:600c:c48e:b0:442:c993:6f94 with SMTP id
 5b1f17b1804b1-453659c58d6mr123235975e9.12.1750692515705; 
 Mon, 23 Jun 2025 08:28:35 -0700 (PDT)
Received: from [192.168.0.101] ([81.79.92.254])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45364703f1esm114414125e9.32.2025.06.23.08.28.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jun 2025 08:28:35 -0700 (PDT)
Message-ID: <7c0652b5-90c6-490a-a67f-ffda0143121d@ursulin.net>
Date: Mon, 23 Jun 2025 16:28:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] drm: add debugfs support on per client-id basis
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Khatri, Sunil" <sukhatri@amd.com>, Sunil Khatri <sunil.khatri@amd.com>,
 dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, simona@ffwll.ch, tzimmermann@suse.de,
 phasta@kernel.org, dakr@kernel.org
References: <20250618134747.3893138-1-sunil.khatri@amd.com>
 <20250618134747.3893138-2-sunil.khatri@amd.com>
 <d1372124-616b-4bc7-8a5c-50c524bc3e5d@ursulin.net>
 <090b8491-329e-4dd7-9480-cf58fd4477da@amd.com>
 <067c1b95-9411-437c-9c57-0cc040547ffd@ursulin.net>
 <fd381676-d0c7-4981-8d23-b666ea5b29f6@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <fd381676-d0c7-4981-8d23-b666ea5b29f6@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 23/06/2025 15:55, Christian König wrote:
> On 23.06.25 15:07, Tvrtko Ursulin wrote:
>>
>> On 23/06/2025 11:24, Khatri, Sunil wrote:
>>>
>>> On 6/23/2025 2:58 PM, Tvrtko Ursulin wrote:
>>>>
>>>>
>>>> On 18/06/2025 14:47, Sunil Khatri wrote:
>>>>> add support to add a directory for each client-id
>>>>> with root at the dri level. Since the clients are
>>>>> unique and not just related to one single drm device,
>>>>> so it makes more sense to add all the client based
>>>>> nodes with root as dri.
>>>>>
>>>>> Also create a symlink back to the parent drm device
>>>>> from each client.
>>>>
>>>> TBH I can see an use case for both clients at DRI level and clients under DRM devices. I guess you have an use case for global and per device can be added later if it becomes needed.
> 
> We already have a "clients" file in the driver directory giving you a list of clients who use this driver instance.

Okay, that won't work then.

>>>>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>>>>> ---
>>>>>    drivers/gpu/drm/drm_debugfs.c | 32 ++++++++++++++++++++++++++++++++
>>>>>    drivers/gpu/drm/drm_file.c    | 10 ++++++++++
>>>>>    include/drm/drm_debugfs.h     | 12 ++++++++++++
>>>>>    include/drm/drm_file.h        |  7 +++++++
>>>>>    4 files changed, 61 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/ drm_debugfs.c
>>>>> index 5a33ec299c04..875276d5fb9f 100644
>>>>> --- a/drivers/gpu/drm/drm_debugfs.c
>>>>> +++ b/drivers/gpu/drm/drm_debugfs.c
>>>>> @@ -298,6 +298,38 @@ void drm_debugfs_remove_dir(void)
>>>>>        debugfs_remove(drm_debugfs_root);
>>>>>    }
>>>>>    +int drm_debugfs_clients_add(struct drm_file *file)
>>>>> +{
>>>>> +    struct drm_device *dev;
>>>>> +    char *client_dir, *symlink;
>>>>> +
>>>>> +    dev = file->minor->dev;
>>>>
>>>> FWIW, as dev is only used once and string locals are not overlapping, you could reduce to a single local variable like char *name and re-use it. Up to you.
>>>>
>>> Let me see what i could do with that. But yes can reduce locals.
>>
>> Ok.
>>
>>> regards
>>>
>>> Sunil
>>
>> Usually when you sign people stop reading. In this case I accidentaly spotted there is more below.
>>
>>>
>>>>> +
>>>>> +    client_dir = kasprintf(GFP_KERNEL, "client-%llu", file->client_id);
>>>>> +    if (!client_dir)
>>>>> +        return -ENOMEM;
>>>>
>>>> It is a bit more work, but I think a clients/ directory with numerical client id subdirs would be nicer.
>>>
>>> It was with the id only first but with feedback from Christian i moved it with client-$. Also since we want it in main root directory along with nodes like 0 and 128, it makes sense to differentiate and make a clear
>>>
>>> representation of clients.
>>
>> I don't mean id only in the root dir, but add a clients subdir in the root, where clients subdir contains more subdirs for individual clients. Maybe it is personal but for me $dri_root/clients/1/something feels nicer, less cluttered and potentially easier to handle in scripts and/or code that $dri_root/client-1/something.
> 
> I've played around with that idea as well, but then abandoned it as only an extra step. But it might indeed be nicer.
> 
>>>
>>>>
>>>>> +
>>>>> +    /* Create a debugfs directory for the client in root on drm debugfs */
>>>>> +    file->debugfs_client = debugfs_create_dir(client_dir, drm_debugfs_root);
>>>>> +    kfree(client_dir);
>>>>> +
>>>>> +    symlink = kasprintf(GFP_KERNEL, "../%s", dev->unique);
>>>>> +    if (!symlink)
>>>>> +        return -ENOMEM;
>>>>
>>>> Worth removing the partial construction?
>>> Ideally it should never fail and but yes makes sense to clean up.
>>>>
>>>>> +
>>>>> +    /* Create a link from client_id to the drm device this client id belongs to */
>>>>> +    debugfs_create_symlink("device", file->debugfs_client, symlink);
>>>>
>>>> This can also fail.
>>> sure. Noted
> 
> Keep in mind that the results of debugfs functions should *not* be checked and failures should *not* be fatal.
> 
> Otherwise Greg comes out and beats your code into shape :)

Oops, my bad!

>>>>> +    kfree(symlink);
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>> +void drm_debugfs_clients_remove(struct drm_file *file)
>>>>> +{
>>>>> +    debugfs_remove_recursive(file->debugfs_client);
>>>>> +    file->debugfs_client = NULL;
>>>>> +}
>>>>> +
>>>>>    /**
>>>>>     * drm_debugfs_dev_init - create debugfs directory for the device
>>>>>     * @dev: the device which we want to create the directory for
>>>>> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
>>>>> index 06ba6dcbf5ae..8502c5a630b1 100644
>>>>> --- a/drivers/gpu/drm/drm_file.c
>>>>> +++ b/drivers/gpu/drm/drm_file.c
>>>>> @@ -39,12 +39,14 @@
>>>>>    #include <linux/poll.h>
>>>>>    #include <linux/slab.h>
>>>>>    #include <linux/vga_switcheroo.h>
>>>>> +#include <linux/debugfs.h>
>>>>>      #include <drm/drm_client_event.h>
>>>>>    #include <drm/drm_drv.h>
>>>>>    #include <drm/drm_file.h>
>>>>>    #include <drm/drm_gem.h>
>>>>>    #include <drm/drm_print.h>
>>>>> +#include <drm/drm_debugfs.h>
>>>>>      #include "drm_crtc_internal.h"
>>>>>    #include "drm_internal.h"
>>>>> @@ -143,6 +145,13 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
>>>>>        rcu_assign_pointer(file->pid, get_pid(task_tgid(current)));
>>>>>        file->minor = minor;
>>>>>    +    ret = drm_debugfs_clients_add(file);
> 
> No error handling for debugfs functions please!

Hmm but then any userspace will have a hard time figuring out what 
clients exist.

> 
>>>>
>>>> Slightly tricky part is that as soon as this runs userspace can enter debugfs. If in the future any debufs clients file is added which can dereference any of the drm_file fields not yet initialized it has the potential to explode and/or be exploited.
>>>>
>>>> Hence I think to be safe the usual pattern of exposing drm_file to userspace at the end, only _after_ drm_file has been *fully* initialized.
>>>>
>>>> Slightly annoying part with that might be undoing dev->driver->open() but maybe it is not that bad.
>>>
>>> I need this before driver open as the entry is accessed in driver->open in amdgpu to add files to the directory.
>>>
>>> So, i could see to move it just before the open but not after. Anyways if we reach till driver open surely file is fully initialized. Nothing else is done in that function after that.
>>
>> I guess it is fine as long as dev->driver->open() will be the only place which will be adding files. If one day DRM core decides to add some common file it will need to make things it can dereference are fully initialized.
>>
>> Perhaps what makes sense today to make this more robust, and it is not hard, is to simply move drm_debugfs_clients_add to just before dev->driver->open()?
> 
> Well the common files should always work and never crash on read, don't they? So it should be save to have them created as soon as the drm_file exists.

Yes they should not. :)

My concern is one day someone adds a common DRM file in here which maybe 
accesses file->client_name_lock. So the debugfs register must not be 
before the mutex_init.

Second option is a common file which would call some DRM helper, which 
in turn could dereference into driver ops, where those driver ops assume 
dev->driver->open() has already set up the relevant state.

For now it is theoretical but if any of the two happens it would be a 
timing sensitive null ptr deref, or worse.

Whether or not it is worth protecting against that at this stage I am 
not sure. One way would be two stage setup. First set up the client dir, 
then after dev->driver->open call a new hook into the driver to set up 
the files under it.

> The question is rather how do we handle teardown? Removing the directory as soon as possible?

You think the placent in the patch is too late?

Regards,

Tvrtko

>>>>
>>>>> +    if (ret) {
>>>>> +        put_pid(rcu_access_pointer(file->pid));
>>>>> +        kfree(file);
>>>>> +        return ERR_PTR(ret);
>>>>
>>>> Onion unwind already exists in the function so could have used it. (Add a new label and here simply "goto out_put_pid".) But as above we discuss tweaking the order lets see how that goes first.
>>> Sure.
>>>>
>>>>> +    }
>>>>> +
>>>>>        /* for compatibility root is always authenticated */
>>>>>        file->authenticated = capable(CAP_SYS_ADMIN);
>>>>>    @@ -236,6 +245,7 @@ void drm_file_free(struct drm_file *file)
>>>>>                 atomic_read(&dev->open_count));
>>>>>          drm_events_release(file);
>>>>> +    drm_debugfs_clients_remove(file);
>>>>>          if (drm_core_check_feature(dev, DRIVER_MODESET)) {
>>>>>            drm_fb_release(file);
>>>>> diff --git a/include/drm/drm_debugfs.h b/include/drm/drm_debugfs.h
>>>>> index cf06cee4343f..4bd6cc1d0900 100644
>>>>> --- a/include/drm/drm_debugfs.h
>>>>> +++ b/include/drm/drm_debugfs.h
>>>>> @@ -153,6 +153,9 @@ void drm_debugfs_add_files(struct drm_device *dev,
>>>>>      int drm_debugfs_gpuva_info(struct seq_file *m,
>>>>>                   struct drm_gpuvm *gpuvm);
>>>>> +
>>>>> +int drm_debugfs_clients_add(struct drm_file *file);
>>>>> +void drm_debugfs_clients_remove(struct drm_file *file);
>>>>>    #else
>>>>>    static inline void drm_debugfs_create_files(const struct drm_info_list *files,
>>>>>                            int count, struct dentry *root,
>>>>> @@ -181,6 +184,15 @@ static inline int drm_debugfs_gpuva_info(struct seq_file *m,
>>>>>    {
>>>>>        return 0;
>>>>>    }
>>>>> +
>>>>> +int drm_debugfs_clients_add(struct drm_file *file)
>>>>> +{
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>> +void drm_debugfs_clients_remove(struct drm_file *file)
>>>>> +{
>>>>> +}
>>>>
>>>> Static inline for the two above.
>>> Noted
>>>>
>>>>>    #endif
>>>>>      #endif /* _DRM_DEBUGFS_H_ */
>>>>> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
>>>>> index 5c3b2aa3e69d..eab7546aad79 100644
>>>>> --- a/include/drm/drm_file.h
>>>>> +++ b/include/drm/drm_file.h
>>>>> @@ -400,6 +400,13 @@ struct drm_file {
>>>>>         * @client_name_lock: Protects @client_name.
>>>>>         */
>>>>>        struct mutex client_name_lock;
>>>>> +
>>>>> +    /**
>>>>> +     * @debugfs_client:
>>>>> +     *
>>>>> +     * debugfs directory for each client under a drm node.
>>>>> +     */
>>>>> +    struct dentry *debugfs_client;
>>>>
>>>> Is it worth idefing this out if !CONFIG_DEBUG_FS?
>>>
>>> Surprisingly i dont see CONFIG_DEBUG_FS used in drm much.  So keeping it same for this one variable too. Need a whole new change to keep debugfs related things under the if.
>>
>> Ah struct drm_device.. I see what you mean. I guess the waste if progressively worse as the unused fields move from structs with fewer instances to ones which can be a lot more.
>>
>> Regards,
>>
>> Tvrtko
>>
>>>
>>> Regards
>>> Sunil Khatri
>>>
>>>>
>>>> Regards,
>>>>
>>>> Tvrtko
>>>>
>>>>>    };
>>>>>      /**
>>>>
>>
> 

