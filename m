Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BF67A607A
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 13:00:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DEF310E38D;
	Tue, 19 Sep 2023 11:00:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0243C10E38D
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 11:00:37 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C3CD46606F85;
 Tue, 19 Sep 2023 12:00:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1695121236;
 bh=pGABrkdMPNOId/UpOvVX0W6yAEUBMmgWgmu2kx8oQPo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=D+5/LSvlB2WPeQftHfgNSnq2s/t/wiLMXq3IYleEi5nSsebq+TVVlVYhPYRmOOvZy
 9g37nQyJIkciCMjcHc+SN9DSZku7zx4GgHAkmtiNhF0t65tSRJ862EA/+KK9WQn/vl
 5uQucyNIYElMbOT0OFyuLRboluvrnwBahVjvkb2bji7d/2ZJEQKShW3v7qPx01MYX2
 lYz5BYuSXVKkOimtCEAV8p6Tw1GhfA44Z3Yq1byPkGLC8X8THB11gepUx2aAh5gO9I
 MMOKFiGGF8fvc8i4mCrMfBMa0+7mUoJGV02Huv19EBZ3sXDX2btCXQetvjPyrAyb20
 aUnIJkRXH/okA==
Message-ID: <75bcb583-a3c8-661c-d520-affc46c8f6e5@collabora.com>
Date: Tue, 19 Sep 2023 13:00:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] drm/mediatek: Add spinlock for setting vblank event in
 atomic_begin
Content-Language: en-US
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, 
 "fshao@chromium.org" <fshao@chromium.org>
References: <20230822132646.9811-1-jason-jh.lin@mediatek.com>
 <5a4a0d12-d16a-0836-f6c5-6e6c2f3a9097@collabora.com>
 <CAC=S1ng8033sSGNFYr1vYfYfHbdG0Dk_0xai08=uomGO-EN66A@mail.gmail.com>
 <9a7b56ec641f79fc14ecd83faff61bfed05b12a5.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <9a7b56ec641f79fc14ecd83faff61bfed05b12a5.camel@mediatek.com>
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
Cc: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "amergnat@baylibre.com" <amergnat@baylibre.com>,
 =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "eugen.hristev@collabora.com" <eugen.hristev@collabora.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?UTF-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?= <Jason-ch.Chen@mediatek.com>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?UTF-8?B?Sm9obnNvbiBXYW5nICjnjovogZbpkasp?= <Johnson.Wang@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?UTF-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 19/09/23 09:37, Jason-JH Lin (林睿祥) ha scritto:
> Hi Angelo
> 
> Thanks for the reviews.
> 
> Hi Fei,
> 
> Thanks for the testing.
> 
> On Mon, 2023-09-18 at 18:47 +0800, Fei Shao wrote:
>>   	
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>   Hi Angelo,
>>
>> On Wed, Sep 13, 2023 at 4:35 PM AngeloGioacchino Del Regno
>> <angelogioacchino.delregno@collabora.com> wrote:
>>>
>>> Il 22/08/23 15:26, Jason-JH.Lin ha scritto:
>>>> Add spinlock protection to avoid race condition on vblank event
>>>> between mtk_drm_crtc_atomic_begin() and
>> mtk_drm_finish_page_flip().
>>>>
>>>
>>> Hello Jason,
>>>
>>> Can you please provide more information about this race condition?
>>> (check below)
>>>
>>>> Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek
>> SoC MT8173.")
>>>> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
>>>> ---
>>>>    drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 5 +++++
>>>>    1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
>> b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
>>>> index d40142842f85..128a672fe3c9 100644
>>>> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
>>>> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
>>>> @@ -746,6 +746,9 @@ static void mtk_drm_crtc_atomic_begin(struct
>> drm_crtc *crtc,
>>>
>>>                                                                     
>>       crtc);
>>>>        struct mtk_crtc_state *mtk_crtc_state =
>> to_mtk_crtc_state(crtc_state);
>>>>        struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
>>>> +     unsigned long flags;
>>>> +
>>>> +     spin_lock_irqsave(&crtc->dev->event_lock, flags);
>>>>
>>>>        if (mtk_crtc->event && mtk_crtc_state->base.event)
>>>>                DRM_ERROR("new event while there is still a pending
>> event\n");
>>>> @@ -756,6 +759,8 @@ static void mtk_drm_crtc_atomic_begin(struct
>> drm_crtc *crtc,
>>>
>>> ...because my suspect is that what creates the race condition in
>> this function is
>>> the unlocked *assignment* to mtk_crtc->event, not the rest.
>>>
>>> If I'm right, you don't need to unconditionally spinlock at the
>> beginning of this
>>> function hence ever-so-slightly improving performance compared to
>> this version.
>>>
>>> Can you please try this one and check if this *also* solves the
>> issue?
>>>
>>>          if (mtk_crtc_state->base.event) {
>>>                  mtk_crtc_state->base.event->pipe =
>> drm_crtc_index(crtc);
>>>                  WARN_ON(drm_crtc_vblank_get(crtc) != 0);
>>>
>>>                  spin_lock_irqsave(&crtc->dev->event_lock, flags);
>>>                  mtk_crtc->event = mtk_crtc_state->base.event;
>>>                  spin_lock_irqrestore(&crtc->dev->event_lock,
>> flags);
>>>
>>>                  mtk_crtc_state->base.event = NULL;
>>>          }
>>>
>>> P.S.: I'd try that myself, but I can't seem to reproduce the issue.
>>
> I can't reproduce the system hang issue reported from customer by
> toggling the night light mode in UI panel either.
> But I can see the error message "new event while there is still a
> pending event" when I was reproducing the issue.
> 
> Here is the debug info from "Wei-Shun <weishunc@google.com>":
> 
>  From the kernel tracing:
> 99342.377173: mtk_crtc_ddp_irq <-mtk_disp_ovl_irq_handler
> 99342.377226:
> drm_crtc_send_vblank_event <-mtk_crtc_ddp_irq
> 99342.393831:
> mtk_crtc_ddp_irq <-mtk_disp_ovl_irq_handler
> 99342.393887:
> drm_crtc_send_vblank_event <-mtk_crtc_ddp_irq
> 99342.410469:
> mtk_crtc_ddp_irq <-mtk_disp_ovl_irq_handler
> 99342.410519:
> drm_crtc_send_vblank_event <-mtk_crtc_ddp_irq
> 99342.427094:
> mtk_crtc_ddp_irq <-mtk_disp_ovl_irq_handler
> 99342.443831:
> mtk_crtc_ddp_irq <-mtk_disp_ovl_irq_handler
> 99342.460495:
> mtk_crtc_ddp_irq <-mtk_disp_ovl_irq_handler
> 99342.477157:
> mtk_crtc_ddp_irq <-mtk_disp_ovl_irq_handler
> 99342.493841:
> mtk_crtc_ddp_irq <-mtk_disp_ovl_irq_handler
> 99342.510453:
> mtk_crtc_ddp_irq <-mtk_disp_ovl_irq_handler
> 
> Every mtk_crtc_ddp_irq should come with a drm_crtc_send_vblank_event.
> However, when the issue happens, the mtk_crtc_ddp_irq keeps firing but
> no drm_crtc_send_vblank_event. I suspect this is the main reason
> causing flip_done timeout.
> 
> In mtk_drm_crtc.c, mtk_crtc->config_updating and mtk_crtc-
>> pending_needs_vblank are the conditions that may impact the vblank
> event.
> 
> static void mtk_drm_finish_page_flip(struct mtk_drm_crtc *mtk_crtc)
> {
>      struct drm_crtc *crtc = &mtk_crtc->base;
>      unsigned long flags;
> 
>      drm_crtc_handle_vblank(&mtk_crtc->base);
> 
>      spin_lock_irqsave(&crtc->dev->event_lock, flags);
> ==> if (!mtk_crtc->config_updating && mtk_crtc->pending_needs_vblank) {
>           mtk_drm_crtc_finish_page_flip(mtk_crtc);
>           mtk_crtc->pending_needs_vblank = false;
>      }
>      spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
> }
> 
> 
> There are 3 lines are called in mtk_drm_crtc_finish_page_flip():
> drm_crtc_send_vblank_event(crtc, mtk_crtc->event);
> drm_crtc_vblank_put(crtc);
> mtk_crtc->event = NULL;
> 
> So I want to protect these 3 things to avoid them encountering race
> conditions:
> mtk_crtc_state->base.event //will be provided on atomic_commit complete
> drm_crtc_vblank_get(crtc)
> mtk_crtc->event
> 
> 
> I have tried to protect this line only:
> 
> spin_lock_irqsave(&crtc->dev->event_lock, flags);
> mtk_crtc->event = mtk_crtc_state->base.event;
> spin_lock_irqrestore(&crtc->dev->event_lock,flags);
> 
> I can still see the error message "new event while there is still a
> pending event" when I toggled the night light mode.
> 
> Maybe that is mtk_crtc->event here:
> if (mtk_crtc->event && mtk_crtc_state->base.event)
> haven't set to NULL by mtk_drm_crtc_finish_page_flip().
> 
> But that not a problem because we will protect mtk_crtc->event here:
> mtk_crtc->event = mtk_crtc_state->base.event;
> 
> 
> So should we remove that error message since it doesn't help and may
> cause the confuse after we fix this issue?
> 
> 
>> I'm still able to reproduce it so I gave it a try, and this approach
>> also seems to fix the issue.  :)
>> FWIW, the way I reproduce that is to toggle the night light mode on
>> and off repeatedly through the UI panel while playing YouTube videos
>> on my device.
>>
>> Jason, can you post a new version with Angelo's suggestion?
>>
> 
> OK, I can take Angelo's suggestion. Thanks!
> But I am wondering if we should remove this log?
> DRM_ERROR("new event while there is still a pending event\n");
> 

Thanks for the analysis.

Please don't remove that line, this indicates that there might be another issue
somewhere else, and someone will tackle that later.

Regards,
Angelo

> 
> Regards,
> Jason-JH.Lin
> 
>> Regards,
>> Fei
>>
>>>
>>> Regards,
>>> Angelo
>>>
>>

