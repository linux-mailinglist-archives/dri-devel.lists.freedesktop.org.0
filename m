Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 807D1ABC367
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 18:02:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CBD410E2B0;
	Mon, 19 May 2025 16:02:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 432EF10E2B0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 16:02:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 67ADF153B;
 Mon, 19 May 2025 09:02:02 -0700 (PDT)
Received: from [10.57.24.231] (unknown [10.57.24.231])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CD20F3F5A1;
 Mon, 19 May 2025 09:02:12 -0700 (PDT)
Message-ID: <6a00017f-89dd-47b9-a4db-ceedd63f456f@arm.com>
Date: Mon, 19 May 2025 17:02:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/panfrost: show device-wide list of DRM GEM
 objects over DebugFS
To: Daniel Stone <daniel@fooishbar.org>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>
References: <20250507160713.1363985-1-adrian.larumbe@collabora.com>
 <20250507160713.1363985-4-adrian.larumbe@collabora.com>
 <9c0b95c8-bf2d-4689-ac1f-ccacba826060@arm.com>
 <CAPj87rOiEa1bTOPqyauYhoVoXEtNeDjE+DkLbzeGVJ1tW9fJcQ@mail.gmail.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <CAPj87rOiEa1bTOPqyauYhoVoXEtNeDjE+DkLbzeGVJ1tW9fJcQ@mail.gmail.com>
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

On 15/05/2025 19:04, Daniel Stone wrote:
> Hi Steven,
> 
> On Thu, 8 May 2025 at 11:42, Steven Price <steven.price@arm.com> wrote:
>> I'm also seeing a splat when running this, see below. I haven't got my
>> head around how this is happening, but I see it when glmark quits at the
>> end of the test.
>>
>> [  399.505066] Unable to handle kernel NULL pointer dereference at virtual address 00000004 when write
>> [...]
>> [  399.882216] Call trace:
>> [  399.882222]  panfrost_gem_free_object [panfrost] from drm_gem_handle_delete+0x84/0xb0
>> [  399.893813]  drm_gem_handle_delete from drm_ioctl+0x2b8/0x4f4
>> [  399.900237]  drm_ioctl from sys_ioctl+0x428/0xe30
>> [  399.905496]  sys_ioctl from ret_fast_syscall+0x0/0x1c
> 
> Soooo. Let's assume it has to actually occur in
> panfrost_gem_debugfs_bo_rm(), since that's all that's changed here.
> 
> I don't think pfdev can be NULL here, because we've already
> dereferenced ptdev and written to a structure member earlier in
> panfrost_gem_free_object(). I don't think it can be the debugfs mutex,
> because a) that's initialised with the device, and b) wouldn't be
> offset 0x4.
> 
> I'm looking then at list_del_init(&bo->debugfs.node), which would
> effectively execute bo->debugfs.node->next->prev =
> bo->debugfs.node->prev. So if bo->debugfs.node->next was NULL, that
> would explain a write to 0x4 on 32-bit systems.

So I finally got some time to do some debugging on this. And you are
absolutely correct on where the fault is triggered.

The cause of it is that panfrost_gem_debugfs_bo_add() is called from
panfrost_gem_create(), but that isn't the only place that Panfrost GEM
objects are created - it turns out panfrost_perfcnt_enable_locked() also
calls drm_gem_shmem_create(). And in that case the list next/prev
pointers are left set to NULL, causing things to blow up when the GEM
object is freed.

The below patch gets things working, or alternatively just init the list
in panfrost_gem_create_object() if we don't want to include the perfcnt
buffer in the list.

Steve

---8<--
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c
b/drivers/gpu/drm/panfrost/panfrost_gem.c
index fe2cdbe8baf0..51da13cd81f0 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -297,13 +297,14 @@ struct drm_gem_object
*panfrost_gem_create_object(struct drm_device *dev, size_t
        obj->base.map_wc = !pfdev->coherent;
        mutex_init(&obj->label.lock);

+       panfrost_gem_debugfs_bo_add(pfdev, obj);
+
        return &obj->base.base;
 }

 struct panfrost_gem_object *
 panfrost_gem_create(struct drm_device *dev, size_t size, u32 flags)
 {
-       struct panfrost_device *pfdev = dev->dev_private;
        struct drm_gem_shmem_object *shmem;
        struct panfrost_gem_object *bo;

@@ -319,8 +320,6 @@ panfrost_gem_create(struct drm_device *dev, size_t
size, u32 flags)
        bo->noexec = !!(flags & PANFROST_BO_NOEXEC);
        bo->is_heap = !!(flags & PANFROST_BO_HEAP);

-       panfrost_gem_debugfs_bo_add(pfdev, bo);
-
        return bo;
 }


