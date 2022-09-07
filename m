Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A62F35B0167
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 12:14:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A20D10E4DB;
	Wed,  7 Sep 2022 10:14:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (unknown [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0DC910E4DB
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 10:14:13 +0000 (UTC)
X-UUID: ee3f0bf849424bac817c286aeb55a4f2-20220907
X-UUID: ee3f0bf849424bac817c286aeb55a4f2-20220907
X-User: oushixiong@kylinos.cn
Received: from [172.20.20.1] [(116.128.244.169)] by mailgw
 (envelope-from <oushixiong@kylinos.cn>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES128-GCM-SHA256 128/128)
 with ESMTP id 971097487; Wed, 07 Sep 2022 18:14:35 +0800
Subject: Re: [PATCH v3] drm/ast: add dmabuf/prime buffer sharing support
To: Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Dave Airlie <airlied@redhat.com>
References: <20220901124451.2523077-1-oushixiong@kylinos.cn>
 <5bc77d8f-928c-1d41-9b3c-eaad1bf3cfff@suse.de>
 <ee27c832-a1fd-bc93-9f1b-33f828195e83@amd.com>
 <f078d10f-9613-d6b1-0ee8-50feaf7d5299@suse.de>
From: oushixiong <oushixiong@kylinos.cn>
Message-ID: <d4efb102-2f09-3f95-7175-7177f57fcd25@kylinos.cn>
Date: Wed, 7 Sep 2022 18:14:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <f078d10f-9613-d6b1-0ee8-50feaf7d5299@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Firstly, the dirty() call back function is called by 
drm_mode_dirtyfb_ioctl.

     drm_mode_dirtyfb_ioctl
         |__   fb->funcs->dirty(fb, file_priv, flags, r->color,clips, 
num_clips);
                         |__ ast_user_framebuffer_dirty
                                     |__ ast_handle_damage

Secondly, due to hardware limitations, the AST  display control modules 
can not access the dmabuf that in GTT, so it had to copy the data to AST 
VRAM, if we do not use the dmabuf , it need to copy data from discrete 
card's VRAM to memory,and copy the data from memory to AST VRAM.

Best regards
oushixiong


On 2022/9/7 下午5:40, Thomas Zimmermann wrote:
> Hi ,
>
> Am 07.09.22 um 10:10 schrieb Christian König:
>> Hi Thomas,
>>
>> I was wondering pretty much the same thing, but then thought that 
>> this might be the first step to direct scanout from DMA-bufs.
>>
>> If this isn't the case then I to see this rather critically since 
>> that functionality belongs into userspace.
>
> With GEM VRAM helpers, ast currently doesn't support dma-buf sharing. 
> I do have patches that convert it to GEM SHMEM (for other reasons), 
> which would also add this functionality.
>
> I intent to post these patches in the coming days. My suggestion is to 
> merge them first and then see how to go from there.
>
> Best regards
> Thomas
>
>>
>> Regards,
>> Christian.
>>
>> Am 07.09.22 um 09:50 schrieb Thomas Zimmermann:
>>> Hi,
>>>
>>> on a more general note, let me say that your patch doesn't seem to 
>>> fit the ideas of how buffer sharing is supposed to work. Your patch 
>>> does the BMC screen update 'behind the scenes.'
>>>
>>> Shouldn't userspace set up the DRM state for mirroring the output of 
>>> the discrete card to the BMC?
>>>
>>> Best regards
>>> Thomas
>>>
>>> Am 01.09.22 um 14:44 schrieb oushixiong:
>>>>
>>>> This patch adds ast specific codes for DRM prime feature, this is to
>>>> allow for offloading of rending in one direction and outputs in other.
>>>>
>>>> This patch is designed to solve the problem that the AST is not 
>>>> displayed
>>>> when the server plug in a discrete graphics card at the same time.
>>>> We call the dirty callback function to copy the rendering results 
>>>> of the
>>>> discrete graphics card to the ast side by dma-buf.
>>>>
>>>> v1->v2:
>>>>    - Fix the comment.
>>>> v2->v3:
>>>>    - we remove the gem_prime_import_sg_table callback and use the
>>>>      gem_prime_import callback, because it just map and access the 
>>>> buffer
>>>>      with the CPU. and do not to pin the buffer.
>>>>
>>>> Signed-off-by: oushixiong <oushixiong@kylinos.cn>
>>>> Acked-by: Christian König <christian.koenig@amd.com>
>>>> ---
>>>>   drivers/gpu/drm/ast/ast_drv.c  |  27 +++++++
>>>>   drivers/gpu/drm/ast/ast_mode.c | 125 
>>>> ++++++++++++++++++++++++++++++++-
>>>>   2 files changed, 151 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/ast/ast_drv.c 
>>>> b/drivers/gpu/drm/ast/ast_drv.c
>>>> index 7465c4f0156a..fd3c4bad2eb4 100644
>>>> --- a/drivers/gpu/drm/ast/ast_drv.c
>>>> +++ b/drivers/gpu/drm/ast/ast_drv.c
>>>> @@ -28,6 +28,7 @@
>>>>     #include <linux/module.h>
>>>>   #include <linux/pci.h>
>>>> +#include <linux/dma-buf.h>
>>>>     #include <drm/drm_aperture.h>
>>>>   #include <drm/drm_atomic_helper.h>
>>>> @@ -50,6 +51,29 @@ module_param_named(modeset, ast_modeset, int, 
>>>> 0400);
>>>>     DEFINE_DRM_GEM_FOPS(ast_fops);
>>>>   +static struct drm_gem_object *ast_gem_prime_import(struct 
>>>> drm_device *dev,
>>>> +                        struct dma_buf *dma_buf)
>>>> +{
>>>> +    struct drm_gem_vram_object *gbo;
>>>> +
>>>> +    gbo = drm_gem_vram_of_gem(dma_buf->priv);
>>>> +    if (gbo->bo.base.dev == dev) {
>>>> +        /*
>>>> +         * Importing dmabuf exported from out own gem increases
>>>> +         * refcount on gem itself instead of f_count of dmabuf.
>>>> +         */
>>>> +        drm_gem_object_get(&gbo->bo.base);
>>>> +        return &gbo->bo.base;
>>>> +    }
>>>> +
>>>> +    gbo = drm_gem_vram_create(dev, dma_buf->size, 0);
>>>> +    if (IS_ERR(gbo))
>>>> +        return NULL;
>>>> +
>>>> +    get_dma_buf(dma_buf);
>>>> +    return &gbo->bo.base;
>>>> +}
>>>> +
>>>>   static const struct drm_driver ast_driver = {
>>>>       .driver_features = DRIVER_ATOMIC |
>>>>                  DRIVER_GEM |
>>>> @@ -63,6 +87,9 @@ static const struct drm_driver ast_driver = {
>>>>       .minor = DRIVER_MINOR,
>>>>       .patchlevel = DRIVER_PATCHLEVEL,
>>>>   +    .prime_fd_to_handle = drm_gem_prime_fd_to_handle,
>>>> +    .gem_prime_import = ast_gem_prime_import,
>>>> +
>>>>       DRM_GEM_VRAM_DRIVER
>>>>   };
>>>>   diff --git a/drivers/gpu/drm/ast/ast_mode.c 
>>>> b/drivers/gpu/drm/ast/ast_mode.c
>>>> index 45b56b39ad47..65a4342c5622 100644
>>>> --- a/drivers/gpu/drm/ast/ast_mode.c
>>>> +++ b/drivers/gpu/drm/ast/ast_mode.c
>>>> @@ -48,6 +48,8 @@
>>>>   #include "ast_drv.h"
>>>>   #include "ast_tables.h"
>>>>   +MODULE_IMPORT_NS(DMA_BUF);
>>>> +
>>>>   static inline void ast_load_palette_index(struct ast_private *ast,
>>>>                        u8 index, u8 red, u8 green,
>>>>                        u8 blue)
>>>> @@ -1535,8 +1537,129 @@ static const struct 
>>>> drm_mode_config_helper_funcs ast_mode_config_helper_funcs =
>>>>       .atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
>>>>   };
>>>>   +static int ast_handle_damage(struct drm_framebuffer *fb, int x, 
>>>> int y,
>>>> +                    int width, int height)
>>>> +{
>>>> +    struct drm_gem_vram_object *dst_bo = NULL;
>>>> +    void *dst = NULL;
>>>> +    int ret = 0, i;
>>>> +    unsigned long offset = 0;
>>>> +    bool unmap = false;
>>>> +    unsigned int bytesPerPixel;
>>>> +    struct iosys_map map;
>>>> +    struct iosys_map dmabuf_map;
>>>> +
>>>> +    bytesPerPixel = fb->format->cpp[0];
>>>> +
>>>> +    if (!fb->obj[0]->dma_buf)
>>>> +        return -EINVAL;
>>>> +
>>>> +    if (!fb->obj[0]->dma_buf->vmap_ptr.vaddr) {
>>>> +        ret = dma_buf_vmap(fb->obj[0]->dma_buf, &dmabuf_map);
>>>> +        if (ret)
>>>> +            return ret;
>>>> +    } else
>>>> +        dmabuf_map.vaddr = fb->obj[0]->dma_buf->vmap_ptr.vaddr;
>>>> +
>>>> +    dst_bo = drm_gem_vram_of_gem(fb->obj[0]);
>>>> +
>>>> +    ret = drm_gem_vram_pin(dst_bo, 0);
>>>> +    if (ret) {
>>>> +        DRM_ERROR("ast_bo_pin failed\n");
>>>> +        return ret;
>>>> +    }
>>>> +
>>>> +    if (!dst_bo->map.vaddr) {
>>>> +        ret = drm_gem_vram_vmap(dst_bo, &map);
>>>> +        if (ret) {
>>>> +            drm_gem_vram_unpin(dst_bo);
>>>> +            DRM_ERROR("failed to vmap fbcon\n");
>>>> +            return ret;
>>>> +        }
>>>> +        unmap = true;
>>>> +    }
>>>> +    dst = dst_bo->map.vaddr;
>>>> +
>>>> +    for (i = y; i < y + height; i++) {
>>>> +        offset = i * fb->pitches[0] + (x * bytesPerPixel);
>>>> +        memcpy_toio(dst + offset, dmabuf_map.vaddr + offset,
>>>> +            width * bytesPerPixel);
>>>> +    }
>>>> +
>>>> +    if (unmap)
>>>> +        drm_gem_vram_vunmap(dst_bo, &map);
>>>> +
>>>> +    drm_gem_vram_unpin(dst_bo);
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +
>>>> +static int ast_user_framebuffer_dirty(struct drm_framebuffer *fb,
>>>> +                struct drm_file *file,
>>>> +                unsigned int flags,
>>>> +                unsigned int color,
>>>> +                struct drm_clip_rect *clips,
>>>> +                unsigned int num_clips)
>>>> +{
>>>> +    int i, ret = 0;
>>>> +
>>>> +    drm_modeset_lock_all(fb->dev);
>>>> +    if (fb->obj[0]->dma_buf) {
>>>> +        ret = dma_buf_begin_cpu_access(fb->obj[0]->dma_buf,
>>>> +                DMA_FROM_DEVICE);
>>>> +        if (ret)
>>>> +            goto unlock;
>>>> +    }
>>>> +
>>>> +    for (i = 0; i < num_clips; i++) {
>>>> +        ret = ast_handle_damage(fb, clips[i].x1, clips[i].y1,
>>>> +                clips[i].x2 - clips[i].x1, clips[i].y2 - 
>>>> clips[i].y1);
>>>> +        if (ret)
>>>> +            break;
>>>> +    }
>>>> +
>>>> +    if (fb->obj[0]->dma_buf) {
>>>> +        dma_buf_end_cpu_access(fb->obj[0]->dma_buf,
>>>> +                DMA_FROM_DEVICE);
>>>> +    }
>>>> +
>>>> +unlock:
>>>> +    drm_modeset_unlock_all(fb->dev);
>>>> +
>>>> +    return ret;
>>>> +}
>>>> +
>>>> +static void ast_user_framebuffer_destroy(struct drm_framebuffer *fb)
>>>> +{
>>>> +    struct iosys_map dmabuf_map;
>>>> +
>>>> +    if (fb->obj[0]->dma_buf) {
>>>> +        dmabuf_map.is_iomem = fb->obj[0]->dma_buf->vmap_ptr.is_iomem;
>>>> +        dmabuf_map.vaddr = fb->obj[0]->dma_buf->vmap_ptr.vaddr;
>>>> +        if (dmabuf_map.vaddr)
>>>> +            dma_buf_vunmap(fb->obj[0]->dma_buf, &dmabuf_map);
>>>> +    }
>>>> +
>>>> +    drm_gem_fb_destroy(fb);
>>>> +}
>>>> +
>>>> +static const struct drm_framebuffer_funcs ast_gem_fb_funcs_dirtyfb 
>>>> = {
>>>> +    .destroy    = ast_user_framebuffer_destroy,
>>>> +    .create_handle    = drm_gem_fb_create_handle,
>>>> +    .dirty        = ast_user_framebuffer_dirty,
>>>> +};
>>>> +
>>>> +static struct drm_framebuffer *
>>>> +ast_gem_fb_create_with_dirty(struct drm_device *dev, struct 
>>>> drm_file *file,
>>>> +                const struct drm_mode_fb_cmd2 *mode_cmd)
>>>> +{
>>>> +    return drm_gem_fb_create_with_funcs(dev, file, mode_cmd,
>>>> +                    &ast_gem_fb_funcs_dirtyfb);
>>>> +}
>>>> +
>>>>   static const struct drm_mode_config_funcs ast_mode_config_funcs = {
>>>> -    .fb_create = drm_gem_fb_create,
>>>> +    .fb_create = ast_gem_fb_create_with_dirty,
>>>>       .mode_valid = drm_vram_helper_mode_valid,
>>>>       .atomic_check = drm_atomic_helper_check,
>>>>       .atomic_commit = drm_atomic_helper_commit,
>>>>
>>>>
>>>> Content-type: Text/plain
>>>>
>>>> No virus found
>>>>         Checked by Hillstone Network AntiVirus
>>>
>>
>
