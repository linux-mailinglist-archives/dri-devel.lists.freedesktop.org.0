Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F59BFA12A
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 07:38:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3E0810E6A6;
	Wed, 22 Oct 2025 05:38:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="js7TzFod";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C524110E6A6
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 05:38:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1761111472; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=cmk/TKDZHFtCux6wfAoQO+yL58jxkqga9VyKKD6dpLpxF61hpf3yhuzhd2NRmC7kLmHJdWQG/wJ9tV2WtLp4jQORAkiHYaQ8Q07KVP38BJow1n4tm9qQIO++PCpkwhJchKagkj9xdMux7GkaG5bQsYS5GQ6D0ZvPPL9ycJSfRDQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1761111472;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=VO4B1pkSclkmI1SCkjDTMuMUmyyMu6oemMdK2zXFy9A=; 
 b=M6O8+0em8lE1enuhKu5Ig6pEYplSJpcgZ6UjVpove9na9BXbDWCbZkOizQQOiZtM/CNIBDwCrEdp9ANvO1i7DkhK1oxpb1NkPx/iblHl6C2yvBLies7W6AUTxWm6v24nj66G5I61+wqX79Cjdpj5L/pYkV/dlwRZklX82OBOuu8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761111472; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=VO4B1pkSclkmI1SCkjDTMuMUmyyMu6oemMdK2zXFy9A=;
 b=js7TzFodKFtEwM/xHJimjb0w3mAgjbuIjzNpRJ+0Moqqn5lPaIQbNyBB0age+sHP
 DT/l4fhyTdDQQEe8ES6XtDeWIOpwazvRSbGoa/QUqp5PX3ElTT9aBE8KC53rHSywi4h
 CGRuNx2c0i56QXfKuiyyB4rlX8KtAEluaRF8xBwQ=
Received: by mx.zohomail.com with SMTPS id 176111146875886.45487193819713;
 Tue, 21 Oct 2025 22:37:48 -0700 (PDT)
Message-ID: <c6b44524-4e44-46e8-89b4-8f90e074431b@collabora.com>
Date: Wed, 22 Oct 2025 08:37:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH] drm/virtgpu: Make vblank event dependent on the host
 resource
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "gurchetansingh@chromium.org" <gurchetansingh@chromium.org>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "airlied@redhat.com" <airlied@redhat.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux.dev" <virtualization@lists.linux.dev>
References: <20251016145230.79270-1-tzimmermann@suse.de>
 <IA0PR11MB7185A7BA7B8CEAC46CBC0922F8F6A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <21851b98-06ee-4e2c-8570-70e8a4fe5d86@suse.de>
 <afc6ba14-cd95-49b9-89f5-e90fd19c8927@collabora.com>
 <a2afbc13-0be6-46ef-a6da-9461fd30376b@collabora.com>
 <126a0b10-a550-430c-a1b3-7e144461a0ff@suse.de>
 <IA0PR11MB71850CA585D6E42C1E7217DDF8F3A@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <IA0PR11MB71850CA585D6E42C1E7217DDF8F3A@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

On 10/22/25 08:02, Kasireddy, Vivek wrote:
> Hi Thomas,
> 
>> Subject: Re: [RFC][PATCH] drm/virtgpu: Make vblank event dependent on
>> the host resource
>>
>>>>
>>>> On 10/17/25 10:38, Thomas Zimmermann wrote:
>>>> ...
>>>>> There's little difference between the current event handling and the
>> one
>>>>> where no vblanks have been set up. I suspect that the vblank timer
>>>>> callback interferes with the locking in atomic_flush. That would also
>>>>> explain why the fps drop at no clear pattern.
>>>>>
>>>>> Could you please test the attached patch? It enables/disables the
>> vblank
>>>>> timer depending on the buffer resources; as you suggested
>> before.  Does
>>>>> this make a difference?
>>>> The attached patch doesn't work, please see the trace below.
>>>>
>>>> @Vivek Please clarify whether you only see frames drop with your
>>>> multi-gpu guest-blob setup or with a usual virgl too. I haven't noticed
>>>> problem with frames pacing for virgl and nctx modes yesterday, will
>>>> check again.
>>> On a second look, I now see that this RFC (not the attached) patch
>>> doesn't work properly with host blobs.
>>>
>>> I'm getting 100-150fps with this patch applied instead of expected
>>> 60fps. Without this RFC patch I'm getting constant 60fps with native
>>> context displaying host blobs.
>>>
>>> Not sure why guest blob would behave differently from the host blob.
>>> Suspect something if off with the prime sharing that Vivek uses in the
>>> vfio testing setup. I'd suggest to disable vblank timer only for guest
>>> blobs if no quick solution will be found.
>>
>> After reading your reply and Vivek's new results, I'm confused now. Does
>> it work or is there another patch needed?
> Considering my use-case and Dmitry's virgl/venus/native context use-cases
> and the benefits offered by vblank timer in these different scenarios, I think
> the following patch should be sufficient for now:
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
> index e972d9b015a9..c1a8f88f0a20 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_display.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_display.c
> @@ -102,7 +102,11 @@ static void virtio_gpu_crtc_mode_set_nofb(struct drm_crtc *crtc)
>  static void virtio_gpu_crtc_atomic_enable(struct drm_crtc *crtc,
>                                           struct drm_atomic_state *state)
>  {
> -       drm_crtc_vblank_on(crtc);
> +       struct drm_device *dev = crtc->dev;
> +       struct virtio_gpu_device *vgdev = dev->dev_private;
> +
> +       if (!vgdev->has_resource_blob || vgdev->has_virgl_3d)
> +               drm_crtc_vblank_on(crtc);
>  }
>  
>  static void virtio_gpu_crtc_atomic_disable(struct drm_crtc *crtc,
> @@ -112,7 +116,8 @@ static void virtio_gpu_crtc_atomic_disable(struct drm_crtc *crtc,
>         struct virtio_gpu_device *vgdev = dev->dev_private;
>         struct virtio_gpu_output *output = drm_crtc_to_virtio_gpu_output(crtc);
>  
> -       drm_crtc_vblank_off(crtc);
> +       if (!vgdev->has_resource_blob || vgdev->has_virgl_3d)
> +               drm_crtc_vblank_off(crtc);

I'm fine with this change. Will need a clarifying comment in the code.

On the other hand, I tried with "-device virtio-vga,blob=true" and still
don't see problem with the incorrect frame rate.

Vivek, could you please clarify whether you only seeing problem when
using prime sharing? I.e. whether you can reproduce the wrong fps by
running qemu casually without using vfio.

Might test the vfio setup myself sometime later. It's a bit cumbersome
to set it up, will need to re-plug GPUs and etc, currently busy with
other stuff.

-- 
Best regards,
Dmitry
