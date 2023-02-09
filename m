Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB2969070E
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 12:23:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B448810E9C0;
	Thu,  9 Feb 2023 11:23:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B82010E9C0
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 11:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vpDNxDdaa72NOdFuWP7eTnZTVfZhc5qbnAANBOjD5TI=; b=seQ7W0kjQGRPIxxRLeJitW176W
 Nk/Y++feG3qlToaKE+q2WBXEh+m6xgo6HMwj2p3sYHnVLx5zLIwrYbKvoCI5rPylqTME3HKUCOuPZ
 CwHnufIkv6INje7qVsKgW5d6T2ml7mqTf1psLX/mJqAKxv5EBeKrQ7KNLKWvIqzZJcj5SFhSHdcGs
 /a+uXdXWqdMc5tOBt4wB1wlgUGff+glUmLxHVnWup0yQkWIWyA9/xtWciXQxObflkfzMcc1BzQvDc
 yxBO4iPrYTOVM+xPGIH1Fs2OmGP5FRCT1BG4sxfkV90Z4hTHPcpth0VkK5/e6mpBSsOGBsfVMLC/y
 URkKh1Pg==;
Received: from [187.36.234.139] (helo=[192.168.1.195])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pQ51P-00DsXK-Qn; Thu, 09 Feb 2023 12:23:24 +0100
Message-ID: <0d9c852b-8639-55f4-4ec1-ca24f72d72f7@igalia.com>
Date: Thu, 9 Feb 2023 08:23:19 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: Try to address the drm_debugfs issues
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 daniel.vetter@ffwll.ch, wambui.karugax@gmail.com, maxime@cerno.tech,
 mwen@igalia.com, mairacanal@riseup.net
References: <20230209081838.45273-1-christian.koenig@amd.com>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20230209081838.45273-1-christian.koenig@amd.com>
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

On 2/9/23 05:18, Christian König wrote:
> Hello everyone,
> 
> the drm_debugfs has a couple of well known design problems.
> 
> Especially it wasn't possible to add files between initializing and registering
> of DRM devices since the underlying debugfs directory wasn't created yet.
> 
> The resulting necessity of the driver->debugfs_init() callback function is a
> mid-layering which is really frowned on since it creates a horrible
> driver->DRM->driver design layering.
> 
> The recent patch "drm/debugfs: create device-centered debugfs functions" tried
> to address those problem, but doesn't seem to work correctly. This looks like
> a misunderstanding of the call flow around drm_debugfs_init(), which is called
> multiple times, once for the primary and once for the render node.
> 
> So what happens now is the following:
> 
> 1. drm_dev_init() initially allocates the drm_minor objects.
> 2. ... back to the driver ...
> 3. drm_dev_register() is called.
> 
> 4. drm_debugfs_init() is called for the primary node.
> 5. drm_framebuffer_debugfs_init(), drm_client_debugfs_init() and
>     drm_atomic_debugfs_init() call drm_debugfs_add_file(s)() to add the files
>     for the primary node.
> 6. The driver->debugfs_init() callback is called to add debugfs files for the
>     primary node.
> 7. The added files are consumed and added to the primary node debugfs directory.
> 
> 8. drm_debugfs_init() is called for the render node.
> 9. drm_framebuffer_debugfs_init(), drm_client_debugfs_init() and
>     drm_atomic_debugfs_init() call drm_debugfs_add_file(s)() to add the files
>     again for the render node.
> 10. The driver->debugfs_init() callback is called to add debugfs files for the
>      render node.
> 11. The added files are consumed and added to the render node debugfs directory.
> 
> 12. Some more files are added through drm_debugfs_add_file().
> 13. drm_debugfs_late_register() add the files once more to the primary node
>      debugfs directory.
> 14. From this point on files added through drm_debugfs_add_file() are simply ignored.
> 15. ... back to the driver ...
> 
> Because of this the dev->debugfs_mutex lock is also completely pointless since
> any concurrent use of the interface would just randomly either add the files to
> the primary or render node or just not at all.
> 
> Even worse is that this implementation nails the coffin for removing the
> driver->debugfs_init() mid-layering because otherwise drivers can't control
> where their debugfs (primary/render node) are actually added.
> 
> This patch set here now tries to clean this up a bit, but most likely isn't
> fully complete either since I didn't audit every driver/call path.

I tested the patchset on the v3d, vc4 and vkms and all the files are generated
as expected, but I'm getting the following errors on dmesg:

[    3.872026] debugfs: File 'v3d_ident' in directory '0' already present!
[    3.872064] debugfs: File 'v3d_ident' in directory '128' already present!
[    3.872078] debugfs: File 'v3d_regs' in directory '0' already present!
[    3.872087] debugfs: File 'v3d_regs' in directory '128' already present!
[    3.872097] debugfs: File 'measure_clock' in directory '0' already present!
[    3.872105] debugfs: File 'measure_clock' in directory '128' already present!
[    3.872116] debugfs: File 'bo_stats' in directory '0' already present!
[    3.872124] debugfs: File 'bo_stats' in directory '128' already present!

It looks like the render node is being added twice, since this doesn't happen
for vc4 and vkms.

Otherwise, the patchset looks good to me, but maybe Daniel has some other
thoughts about it.

Best Regards,
- Maíra Canal

> 
> Please comment/discuss.
> 
> Cheers,
> Christian.
> 
> 
