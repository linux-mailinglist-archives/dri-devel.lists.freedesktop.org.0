Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2C7640656
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 13:04:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7553610E6E7;
	Fri,  2 Dec 2022 12:04:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D3410E6E7
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Dec 2022 12:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CiyckMu2coaqEUEz/RilYM4hLRM5FYqvwJC4/xa9Mwc=; b=j13QZWsSmEL7Jou4tuzYUX7iYb
 1D/S+zy32rfO95L2ZoSA1I+vuUdINxXFUnlbR4/2sq/yPoMd7v5eZpdfLUs1d5+X9urtOsgpOUdUH
 i25g0c0pZZFaPy7nHFwmIZEqf7CmDe6LZdw0LbBar5nsne7TL7v63TgL3cw3+rBW4EiItYFN456u4
 kZGK/GZQIzmsAFB8aYgCn6UzNW2syCfroAAwwkd5XkYiipayppd6lDA4cWieIK4gBIE/rqFocpjQ6
 rjzoAJdTwrMaYzKmUyL1ArkLd/Y1so4xnNVSAkH71HxZQsXmjg4tfFuRA2VWcUHk9WCkvhblVp3Eq
 j0mDnHRQ==;
Received: from [2a01:799:95e:1700:6395:ccbd:d000:d42b] (port=62865)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1p14m6-0002D8-Fj; Fri, 02 Dec 2022 13:04:14 +0100
Message-ID: <6aeb596a-65b9-8c87-b4de-97256e3a8576@tronnes.org>
Date: Fri, 2 Dec 2022 13:04:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 5/8] drm/mipi-dbi: Prepare framebuffer copy operation in
 pipe-update helpers
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 thierry.reding@gmail.com, sam@ravnborg.org, emma@anholt.net,
 david@lechnology.com, kamlesh.gurudasani@gmail.com, javierm@redhat.com
References: <20221121104532.8301-1-tzimmermann@suse.de>
 <20221121104532.8301-6-tzimmermann@suse.de>
 <4e1b19de-04b1-3fa5-6aaa-72a4ad694b64@tronnes.org>
 <9b42a348-bad0-2615-8690-b7973375af02@suse.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <9b42a348-bad0-2615-8690-b7973375af02@suse.de>
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 02.12.2022 12.27, skrev Thomas Zimmermann:
> Hi
> 
> Am 25.11.22 um 18:39 schrieb Noralf Trønnes:
>>
>>
>> Den 21.11.2022 11.45, skrev Thomas Zimmermann:
>>> Move the vmap/vunmap blocks from the inner fb_dirty helpers into the
>>> MIPI DBI update helpers. The function calls can result in waiting and/or
>>> processing overhead. Reduce the penalties by executing the functions
>>> once
>>> in the outer-most function of the pipe update.
>>>
>>> This change also prepares for MIPI DBI for shadow-plane helpers. With
>>> shadow-plane helpers, transfer source buffers are mapped into kernel
>>> address space automatically.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> ---

>>> @@ -303,9 +291,6 @@ static void mipi_dbi_fb_dirty(struct
>>> drm_framebuffer *fb, struct drm_rect *rect)
>>>       if (ret)
>>>           drm_err_once(fb->dev, "Failed to update display %d\n", ret);
>>>   -    drm_gem_fb_vunmap(fb, map);
>>> -
>>> -err_drm_dev_exit:
>>>       drm_dev_exit(idx);
>>>   }
>>>   @@ -338,14 +323,27 @@ EXPORT_SYMBOL(mipi_dbi_pipe_mode_valid);
>>>   void mipi_dbi_pipe_update(struct drm_simple_display_pipe *pipe,
>>>                 struct drm_plane_state *old_state)
>>>   {
>>> +    struct iosys_map map[DRM_FORMAT_MAX_PLANES];
>>> +    struct iosys_map data[DRM_FORMAT_MAX_PLANES];
>>
>> These should have been zeroed to avoid UBSAN complaint, but you'll
>> remove these later so not so important.
> 
> Will be fixed.
> 
> But do you know how these warnings happen? I went through the helpers
> before and changed them to only access the format-info's relevant
> planes. No unintialized memory access should be reported.
> 

It happens with imported buffers, iosys_map_clear() looks at the
uninitialized boolean variable ->is_iomem:

drm_gem_fb_vmap -> ... -> dma_buf_vmap -> iosys_map_clear

static inline void iosys_map_clear(struct iosys_map *map)
{
	if (map->is_iomem) {
		map->vaddr_iomem = NULL;
		map->is_iomem = false;
	} else {
		map->vaddr = NULL;
	}
}

Noralf.
