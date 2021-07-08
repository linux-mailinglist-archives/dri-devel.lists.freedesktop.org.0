Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 630B33BFA3E
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 14:30:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 496C489FD1;
	Thu,  8 Jul 2021 12:30:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EC0289FD1
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 12:30:52 +0000 (UTC)
Received: from [IPv6:2a02:810a:880:f54:e8eb:1d02:4dd8:a76b] (unknown
 [IPv6:2a02:810a:880:f54:e8eb:1d02:4dd8:a76b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id AAF981F43B8D;
 Thu,  8 Jul 2021 13:30:50 +0100 (BST)
Subject: Re: Aw: Re: BUG: MTK DRM/HDMI broken on 5.13 (mt7623/bpi-r2)
To: Frank Wunderlich <frank-w@public-files.de>
References: <trinity-cc8f5927-9aaf-43ae-a107-6a6229f1b481-1625565279264@3c-app-gmx-bs60>
 <25d61873-38ae-5648-faab-03431b74f777@collabora.com>
 <trinity-e6443313-a436-4e9d-a93c-1bef1cce135d-1625736911475@3c-app-gmx-bap19>
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <df431199-0c65-fb9a-02b4-9f84899f37ee@collabora.com>
Date: Thu, 8 Jul 2021 14:30:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <trinity-e6443313-a436-4e9d-a93c-1bef1cce135d-1625736911475@3c-app-gmx-bap19>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Collabora Kernel ML <kernel@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

On 08.07.21 11:35, Frank Wunderlich wrote:
> Hi
> 
> just a small update, added debug in the vendor-specific functions for page_flip and vblank and it seems they never get called
> 
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -87,21 +87,25 @@ static void mtk_drm_crtc_finish_page_flip(struct mtk_drm_crtc *mtk_crtc)
>   {
>          struct drm_crtc *crtc = &mtk_crtc->base;
>          unsigned long flags;
> -
> +printk(KERN_ALERT "DEBUG: Passed %s %d \n",__FUNCTION__,__LINE__);
>          spin_lock_irqsave(&crtc->dev->event_lock, flags);
>          drm_crtc_send_vblank_event(crtc, mtk_crtc->event);
>          drm_crtc_vblank_put(crtc);
>          mtk_crtc->event = NULL;
>          spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
> +printk(KERN_ALERT "DEBUG: Passed %s %d \n",__FUNCTION__,__LINE__);
>   }
> 
>   static void mtk_drm_finish_page_flip(struct mtk_drm_crtc *mtk_crtc)
>   {
> +printk(KERN_ALERT "DEBUG: Passed %s %d update:%d,needsvblank:%d\n",__FUNCTION__,__LINE__,mtk_crtc->config_updating,mtk_crtc->pending_needs_vblank);
>          drm_crtc_handle_vblank(&mtk_crtc->base);
>          if (!mtk_crtc->config_updating && mtk_crtc->pending_needs_vblank) {
> +printk(KERN_ALERT "DEBUG: Passed %s %d \n",__FUNCTION__,__LINE__);
>                  mtk_drm_crtc_finish_page_flip(mtk_crtc);
>                  mtk_crtc->pending_needs_vblank = false;
>          }
> +printk(KERN_ALERT "DEBUG: Passed %s %d \n",__FUNCTION__,__LINE__);
>   }
> 
>   static void mtk_drm_crtc_destroy(struct drm_crtc *crtc)
> 
> finish_page_flip is called by mtk_crtc_ddp_irq. this seems to be set in mtk_drm_crtc_enable_vblank with mtk_ddp_comp_enable_vblank. this is called correctly
> 
> 113 static inline void mtk_ddp_comp_enable_vblank(struct mtk_ddp_comp *comp,
> 114                           void (*vblank_cb)(void *),
> 115                           void *vblank_cb_data)
> 116 {
> 117 printk(KERN_ALERT "DEBUG: Passed %s %d \n",__FUNCTION__,__LINE__);
> 118     if (comp->funcs && comp->funcs->enable_vblank)
> 119     {
> 120         comp->funcs->enable_vblank(comp->dev, vblank_cb, vblank_cb_data);
> 121 printk(KERN_ALERT "DEBUG: Passed %s %d \n",__FUNCTION__,__LINE__);
> 122     }
> 123 }
> 
> i see both messages, but mtk_crtc_ddp_irq is never called and so the other 2 not.

Yes, In my case the irq isr is also not called after resume which cause the warning
even though "enable_vblank" do get called. Don't know why is that.

> 
> root@bpi-r2:~# dmesg | grep -i DEBUG
> [    6.433509] DEBUG: Passed mtk_drm_crtc_enable_vblank 510
> [    6.433530] DEBUG: Passed mtk_ddp_comp_enable_vblank 117
> [    6.433537] DEBUG: Passed mtk_ddp_comp_enable_vblank 121 <<<
> 
> 
> comp->funcs->enable_vblank should be mtk_drm_crtc_enable_vblank, right?

No, this is a bit confusing , there are also the funcs of the components, see in file mtk_drm_ddp_comp.c
so for mt7623  it is mtk_ovl_enable_vblank.

Thanks,
Dafna

> 
> 641 static const struct drm_crtc_funcs mtk_crtc_funcs = {
> 642     .set_config     = drm_atomic_helper_set_config,
> 643     .page_flip      = drm_atomic_helper_page_flip,
> 644     .destroy        = mtk_drm_crtc_destroy,
> 645     .reset          = mtk_drm_crtc_reset,
> 646     .atomic_duplicate_state = mtk_drm_crtc_duplicate_state,
> 647     .atomic_destroy_state   = mtk_drm_crtc_destroy_state,
> 648     .enable_vblank      = mtk_drm_crtc_enable_vblank, <<<<<<<
> 649     .disable_vblank     = mtk_drm_crtc_disable_vblank,
> 650 };
> 
> but it looks like a recursion:
> mtk_drm_crtc_enable_vblank calls mtk_ddp_comp_enable_vblank => enable_vblank (=mtk_drm_crtc_enable_vblank), but i see the messages not repeating
> 
> mtk_drm_crtc_enable_vblank(struct drm_crtc *crtc)
> 511     mtk_ddp_comp_enable_vblank(comp, mtk_crtc_ddp_irq, &mtk_crtc->base);
> 
> 113 static inline void mtk_ddp_comp_enable_vblank(struct mtk_ddp_comp *comp,
> 114                           void (*vblank_cb)(void *),
> 115                           void *vblank_cb_data)
> 116 {
> 118     if (comp->funcs && comp->funcs->enable_vblank)
> 120         comp->funcs->enable_vblank(comp->dev, vblank_cb, vblank_cb_data);
> 
> but params do not match...comp->funcs->enable_vblank takes 3 arguments but comp->funcs->enable_vblank has only one.something i miss here...
> 
> i guess not, but is watchdog somehow involved? i ask because i see this on reboot/poweroff:
> 
> "watchdog: watchdog0: watchdog did not stop!"
> 
> i see this with my 5.13, 5.12-drm (5.12.0+mtk/core drm-patches) and 5.12.14 too (hdmi is working there), but not 5.12.0!
> that means something in drm-patches (mtk/core) breaks watchdog. maybe the recursion mentioned above?
> 
> regards Frank
> 
> 
>> Gesendet: Donnerstag, 08. Juli 2021 um 09:22 Uhr
>> Von: "Dafna Hirschfeld" <dafna.hirschfeld@collabora.com>
> 
>>
>> Hi Frank,
>>
>>
>> On 06.07.21 11:54, Frank Wunderlich wrote:
>>> Hi,
>>>
>>> i've noticed that HDMI is broken at least on my board (Bananapi-r2,mt7623) on 5.13.
>>>
>>> after some research i noticed that it is working till
>>>
>>> commit 2e477391522354e763aa62ee3e281c1ad9e8eb1b
>>> Author: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> 
>>
>> We also encountered that warning on mt8173 device - Acer Chromebook R13. It happen after resuming from suspend to ram.
>> We could not find a version that works and we were not able to find the fix of the bug.
>> It seems like the irq isr is not called after resuming from suspend.
>> Please share if you have new findings regarding that bug.
>>
>> Thanks,
>> Dafna
> 
