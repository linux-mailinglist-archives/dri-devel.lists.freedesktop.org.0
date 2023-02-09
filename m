Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E5269097F
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 14:06:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF62F10EACB;
	Thu,  9 Feb 2023 13:06:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A07610EAC2
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 13:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iISX3BECeONj5dpvsZDmRapnV6TUmb1U+NazBueluRk=; b=cKD7fD4VvVaLRsouQ8SfQTeZR/
 Ddp+m6K8N0XNYXnOfdL3lJ+O01CpfXqVmXQ3hoPH437+riE1x9bJLOUQfIgXjRZIYWhJ9LZbZUOn9
 fK3f4jsR7ijmccRe8UVoWb0fNU2dwoi7hcOmL3tB6bvPy33VVAvxulWejfWPAg+PRoIewypXi20OZ
 3nfLVKSgROjgm7CR7P3aug8qwzL50l9nG7C/MGSOH4dlHGEoaar60xbOijjO2VFef6YDy9kxS2naB
 Avg4IYDjMFGI71SZHfxZIZJjV4Q/6IopStgHBmMndrdZKYwIQvBtF6Z2KMWZVImlvaiwsdbT1O8jE
 BXM7abvQ==;
Received: from [187.36.234.139] (helo=[192.168.1.195])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pQ6dA-00DwRi-Ot; Thu, 09 Feb 2023 14:06:29 +0100
Message-ID: <613b9aec-7105-ca2d-13cd-16ddd85a6fda@igalia.com>
Date: Thu, 9 Feb 2023 10:06:25 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: Try to address the drm_debugfs issues
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 daniel.vetter@ffwll.ch, wambui.karugax@gmail.com, maxime@cerno.tech,
 mwen@igalia.com, mairacanal@riseup.net
References: <20230209081838.45273-1-christian.koenig@amd.com>
 <0d9c852b-8639-55f4-4ec1-ca24f72d72f7@igalia.com>
 <4161ae4e-549c-00f6-5f37-f635a9cb775d@gmail.com>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <4161ae4e-549c-00f6-5f37-f635a9cb775d@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/9/23 09:13, Christian König wrote:
> Am 09.02.23 um 12:23 schrieb Maíra Canal:
>> On 2/9/23 05:18, Christian König wrote:
>>> Hello everyone,
>>>
>>> the drm_debugfs has a couple of well known design problems.
>>>
>>> Especially it wasn't possible to add files between initializing and registering
>>> of DRM devices since the underlying debugfs directory wasn't created yet.
>>>
>>> The resulting necessity of the driver->debugfs_init() callback function is a
>>> mid-layering which is really frowned on since it creates a horrible
>>> driver->DRM->driver design layering.
>>>
>>> The recent patch "drm/debugfs: create device-centered debugfs functions" tried
>>> to address those problem, but doesn't seem to work correctly. This looks like
>>> a misunderstanding of the call flow around drm_debugfs_init(), which is called
>>> multiple times, once for the primary and once for the render node.
>>>
>>> So what happens now is the following:
>>>
>>> 1. drm_dev_init() initially allocates the drm_minor objects.
>>> 2. ... back to the driver ...
>>> 3. drm_dev_register() is called.
>>>
>>> 4. drm_debugfs_init() is called for the primary node.
>>> 5. drm_framebuffer_debugfs_init(), drm_client_debugfs_init() and
>>>     drm_atomic_debugfs_init() call drm_debugfs_add_file(s)() to add the files
>>>     for the primary node.
>>> 6. The driver->debugfs_init() callback is called to add debugfs files for the
>>>     primary node.
>>> 7. The added files are consumed and added to the primary node debugfs directory.
>>>
>>> 8. drm_debugfs_init() is called for the render node.
>>> 9. drm_framebuffer_debugfs_init(), drm_client_debugfs_init() and
>>>     drm_atomic_debugfs_init() call drm_debugfs_add_file(s)() to add the files
>>>     again for the render node.
>>> 10. The driver->debugfs_init() callback is called to add debugfs files for the
>>>      render node.
>>> 11. The added files are consumed and added to the render node debugfs directory.
>>>
>>> 12. Some more files are added through drm_debugfs_add_file().
>>> 13. drm_debugfs_late_register() add the files once more to the primary node
>>>      debugfs directory.
>>> 14. From this point on files added through drm_debugfs_add_file() are simply ignored.
>>> 15. ... back to the driver ...
>>>
>>> Because of this the dev->debugfs_mutex lock is also completely pointless since
>>> any concurrent use of the interface would just randomly either add the files to
>>> the primary or render node or just not at all.
>>>
>>> Even worse is that this implementation nails the coffin for removing the
>>> driver->debugfs_init() mid-layering because otherwise drivers can't control
>>> where their debugfs (primary/render node) are actually added.
>>>
>>> This patch set here now tries to clean this up a bit, but most likely isn't
>>> fully complete either since I didn't audit every driver/call path.
>>
>> I tested the patchset on the v3d, vc4 and vkms and all the files are generated
>> as expected, but I'm getting the following errors on dmesg:
>>
>> [    3.872026] debugfs: File 'v3d_ident' in directory '0' already present!
>> [    3.872064] debugfs: File 'v3d_ident' in directory '128' already present!
>> [    3.872078] debugfs: File 'v3d_regs' in directory '0' already present!
>> [    3.872087] debugfs: File 'v3d_regs' in directory '128' already present!
>> [    3.872097] debugfs: File 'measure_clock' in directory '0' already present!
>> [    3.872105] debugfs: File 'measure_clock' in directory '128' already present!
>> [    3.872116] debugfs: File 'bo_stats' in directory '0' already present!
>> [    3.872124] debugfs: File 'bo_stats' in directory '128' already present!
>>
>> It looks like the render node is being added twice, since this doesn't happen
>> for vc4 and vkms.
> 
> Thanks for the feedback and yes that's exactly what I meant with that I haven't looked into all code paths.
> 
> Could it be that v3d registers it's debugfs files from the debugfs_init callback?

Although this is true, I'm not sure if this is the reason why the files are
being registered twice, as this doesn't happen to vc4, and it also uses the
debugfs_init callback. I believe it is somewhat related to the fact that
v3d is the primary node and the render node.

Best Regards,
- Maíra Canal

> 
> One alternative would be to just completely nuke support for separate render node debugfs files and only add a symlink to the primary node. Opinions?
> 
> Regards,
> Christian.
> 
>>
>> Otherwise, the patchset looks good to me, but maybe Daniel has some other
>> thoughts about it.
>>
>> Best Regards,
>> - Maíra Canal
>>
>>>
>>> Please comment/discuss.
>>>
>>> Cheers,
>>> Christian.
>>>
>>>
> 
