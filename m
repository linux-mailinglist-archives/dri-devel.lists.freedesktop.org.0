Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A33092F64FB
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 16:46:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D833289A14;
	Thu, 14 Jan 2021 15:46:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 905 seconds by postgrey-1.36 at gabe;
 Thu, 14 Jan 2021 15:46:18 UTC
Received: from EX13-EDG-OU-002.vmware.com (ex13-edg-ou-002.vmware.com
 [208.91.0.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B84D189A14
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 15:46:18 +0000 (UTC)
Received: from sc9-mailhost3.vmware.com (10.113.161.73) by
 EX13-EDG-OU-002.vmware.com (10.113.208.156) with Microsoft SMTP Server id
 15.0.1156.6; Thu, 14 Jan 2021 07:31:07 -0800
Received: from [0.0.0.0] (oddjob.vmware.com [10.253.4.32])
 by sc9-mailhost3.vmware.com (Postfix) with ESMTP id CA2AF20539;
 Thu, 14 Jan 2021 07:31:10 -0800 (PST)
Subject: Re: [PATCH 1/3] drm/vmwgfx: Drop svga_lock
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>
References: <20201211162942.3399050-1-daniel.vetter@ffwll.ch>
 <CAKMK7uFjeJHS9siPfY4swYyHi92Ee2eEVw1syQ0h-efOHEKPig@mail.gmail.com>
From: Roland Scheidegger <sroland@vmware.com>
Message-ID: <ed5a3fbb-5aee-a7d8-e8f2-2b8a117eab6c@vmware.com>
Date: Thu, 14 Jan 2021 16:31:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uFjeJHS9siPfY4swYyHi92Ee2eEVw1syQ0h-efOHEKPig@mail.gmail.com>
Content-Language: de-DE
Received-SPF: None (EX13-EDG-OU-002.vmware.com: sroland@vmware.com does not
 designate permitted sender hosts)
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

looking at it, seems alright. Not sure why the lock was supposedly
needed, maybe it was at some point (it seems like all usage of this lock
was introduced way back in 2015, commit 153b3d5b037ee).

For the series: Reviewed-by: Roland Scheidegger <sroland@vmware.com>

Roland

Am 12.01.21 um 09:49 schrieb Daniel Vetter:
> Hi Roland,
> 
> Hopefully you had a nice start into the new year! Ping for some
> review/testing on this series.
> 
> Thanks, Daniel
> 
> On Fri, Dec 11, 2020 at 5:29 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>>
>> This isn't actually protecting anything becuase:
>> - when running, ttm_resource_manager->use_type is protected through
>>   vmw_private->reservation_semaphore against concurrent execbuf or
>>   well anything else that might evict or reserve buffers
>> - during suspend/resume there's nothing else running, hence
>>   vmw_pm_freeze and vmw_pm_restore do not need to take the same lock.
>> - this also holds for the SVGA_REG_ENABLE register write
>>
>> Hence it is safe to just remove that spinlock.
>>
>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>> Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
>> Cc: Roland Scheidegger <sroland@vmware.com>
>> ---
>>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 10 +---------
>>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h |  1 -
>>  2 files changed, 1 insertion(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
>> index 0008be02d31c..204f7a1830f0 100644
>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
>> @@ -672,7 +672,6 @@ static int vmw_driver_load(struct drm_device *dev, unsigned long chipset)
>>         spin_lock_init(&dev_priv->hw_lock);
>>         spin_lock_init(&dev_priv->waiter_lock);
>>         spin_lock_init(&dev_priv->cap_lock);
>> -       spin_lock_init(&dev_priv->svga_lock);
>>         spin_lock_init(&dev_priv->cursor_lock);
>>
>>         for (i = vmw_res_context; i < vmw_res_max; ++i) {
>> @@ -1189,12 +1188,10 @@ static void __vmw_svga_enable(struct vmw_private *dev_priv)
>>  {
>>         struct ttm_resource_manager *man = ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM);
>>
>> -       spin_lock(&dev_priv->svga_lock);
>>         if (!ttm_resource_manager_used(man)) {
>>                 vmw_write(dev_priv, SVGA_REG_ENABLE, SVGA_REG_ENABLE);
>>                 ttm_resource_manager_set_used(man, true);
>>         }
>> -       spin_unlock(&dev_priv->svga_lock);
>>  }
>>
>>  /**
>> @@ -1220,14 +1217,12 @@ static void __vmw_svga_disable(struct vmw_private *dev_priv)
>>  {
>>         struct ttm_resource_manager *man = ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM);
>>
>> -       spin_lock(&dev_priv->svga_lock);
>>         if (ttm_resource_manager_used(man)) {
>>                 ttm_resource_manager_set_used(man, false);
>>                 vmw_write(dev_priv, SVGA_REG_ENABLE,
>>                           SVGA_REG_ENABLE_HIDE |
>>                           SVGA_REG_ENABLE_ENABLE);
>>         }
>> -       spin_unlock(&dev_priv->svga_lock);
>>  }
>>
>>  /**
>> @@ -1254,17 +1249,14 @@ void vmw_svga_disable(struct vmw_private *dev_priv)
>>          */
>>         vmw_kms_lost_device(dev_priv->dev);
>>         ttm_write_lock(&dev_priv->reservation_sem, false);
>> -       spin_lock(&dev_priv->svga_lock);
>>         if (ttm_resource_manager_used(man)) {
>>                 ttm_resource_manager_set_used(man, false);
>> -               spin_unlock(&dev_priv->svga_lock);
>>                 if (ttm_resource_manager_evict_all(&dev_priv->bdev, man))
>>                         DRM_ERROR("Failed evicting VRAM buffers.\n");
>>                 vmw_write(dev_priv, SVGA_REG_ENABLE,
>>                           SVGA_REG_ENABLE_HIDE |
>>                           SVGA_REG_ENABLE_ENABLE);
>> -       } else
>> -               spin_unlock(&dev_priv->svga_lock);
>> +       }
>>         ttm_write_unlock(&dev_priv->reservation_sem);
>>  }
>>
>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
>> index 5b9a28157dd3..715f2bfee08a 100644
>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
>> @@ -596,7 +596,6 @@ struct vmw_private {
>>
>>         bool stealth;
>>         bool enable_fb;
>> -       spinlock_t svga_lock;
>>
>>         /**
>>          * PM management.
>> --
>> 2.29.2
>>
> 
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
