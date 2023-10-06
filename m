Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E43F17BBD49
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 18:54:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A81F510E53B;
	Fri,  6 Oct 2023 16:54:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3006::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDF5510E028
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 16:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202212;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZMYPCJyJeiJWFYUZcmVtFzwOLruN/7x9tV2gmTlqQWc=; b=oww2cSBdHOuvVwBMRmXjvp2Ao+
 n4yJmwmgadGV6n4pFOTyyec1FOYTdJ5sVwSgEaeoDGq3/ZSF3q2b5kPQ0Y1wEnBDexBNpqxSfQrQG
 fcg4JZtXxa8HdE+opks4rQNrMOzURhr8UqXskDAUA/TQrEuTHcv/NhVmuBufdHNEIh6RbJGE5+JTo
 v8hxDpIfA65Dfgo6IrsieE4W70zw2A05u7mDoSxOS/IqC/lhC5mN7dYOEwB6gEb+36mEP2b8ZkkzU
 vbpBiOw43dO5OLI6f5xu0BH6/9ZMzJAeh7hVcb84VbwoCAy+Rma0QaEWbukxaP/i9zgXmJQN+xO3T
 0vC66OOw==;
Received: from [2a01:799:95f:2800:2fb5:c6db:11b1:a10f] (port=37788)
 by smtp.domeneshop.no with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <noralf@tronnes.org>) id 1qoo5h-00GyzC-OX;
 Fri, 06 Oct 2023 18:54:17 +0200
Message-ID: <bd880231-f161-0773-63f7-ded6cb3fddc1@tronnes.org>
Date: Fri, 6 Oct 2023 18:54:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 2/4] drm/panic: Add a drm panic handler
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>, Jocelyn Falempe <jfalempe@redhat.com>
References: <20231003142508.190246-1-jfalempe@redhat.com>
 <20231003142508.190246-3-jfalempe@redhat.com>
 <lbwngkco3zam7yjo3owwpn47o3pe6g7oh5giglsclenx52jk5q@lw2fwsxz6kqp>
 <3a359910-31ae-355f-2608-239e04689fde@redhat.com>
 <6iaqx7ef4hdd6bucsxtfy37nsizloraxbudez4ms7jlusbghr3@i5hliqpimdp2>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <6iaqx7ef4hdd6bucsxtfy37nsizloraxbudez4ms7jlusbghr3@i5hliqpimdp2>
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
Cc: bluescreen_avenger@verizon.net, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, gpiccoli@igalia.com, noralf@tronnes.org,
 tzimmermann@suse.de, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/6/23 16:35, Maxime Ripard wrote:
> Hi Jocelyn,
> 
> On Thu, Oct 05, 2023 at 11:16:15AM +0200, Jocelyn Falempe wrote:
>> On 05/10/2023 10:18, Maxime Ripard wrote:
>>> Hi,
>>>
>>> On Tue, Oct 03, 2023 at 04:22:45PM +0200, Jocelyn Falempe wrote:
>>>> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
>>>> index 89e2706cac56..e538c87116d3 100644
>>>> --- a/include/drm/drm_drv.h
>>>> +++ b/include/drm/drm_drv.h
>>>> @@ -43,6 +43,7 @@ struct dma_buf_attachment;
>>>>   struct drm_display_mode;
>>>>   struct drm_mode_create_dumb;
>>>>   struct drm_printer;
>>>> +struct drm_scanout_buffer;
>>>>   struct sg_table;
>>>>   /**
>>>> @@ -408,6 +409,19 @@ struct drm_driver {
>>>>   	 */
>>>>   	void (*show_fdinfo)(struct drm_printer *p, struct drm_file *f);
>>>> +	/**
>>>> +	 * @get_scanout_buffer:
>>>> +	 *
>>>> +	 * Get the current scanout buffer, to display a panic message with drm_panic.
>>>> +	 * It is called from a panic callback, and must follow its restrictions.
>>>> +	 *
>>>> +	 * Returns:
>>>> +	 *
>>>> +	 * Zero on success, negative errno on failure.
>>>> +	 */
>>>> +	int (*get_scanout_buffer)(struct drm_device *dev,
>>>> +				  struct drm_scanout_buffer *sb);
>>>> +
>>>
>>> What is the format of that buffer? What is supposed to happen if the
>>> planes / CRTC are setup in a way that is incompatible with the buffer
>>> format?
>>
>> Currently, it only supports linear format, either in system memory, or
>> iomem.
>> But really what is needed is the screen size, and a way to write pixels to
>> it.
>> For more complex GPU, I don't know if it's easier to reprogram the GPU to
>> linear format, or to add a simple "tiled" support to drm_panic.
>> What would you propose as a panic interface to handle those complex format ?
> 
> It's not just about tiling, but also about YUV formats. If the display
> engine is currently playing a video at the moment, it's probably going
> to output some variation of multi-planar YUV and you won't have an RGB
> buffer available.
> 

I had support for some YUV formats in my 2019 attempt on a panic
handler[1] and I made a recording of a test run as well[2] (see 4:30 for
YUV). There was a discussion about challenges and i915 can disable
tiling by flipping a bit in a register[3] and AMD has a debug
interface[4] they can use to write pixels.

Noralf.

[1]
https://lore.kernel.org/dri-devel/20190311174218.51899-1-noralf@tronnes.org/
[2] https://youtu.be/lZ80vL4dgpE
[3]
https://lore.kernel.org/dri-devel/20190314095004.GP2665@phenom.ffwll.local/
[4]
https://lore.kernel.org/dri-devel/d233c376-ed07-2127-6084-8292d313dac7@amd.com/

> Same story if you're using a dma-buf buffer. You might not even be able
> to access that buffer at all from the CPU or the kernel.
> 
> I really think we should have some emergency state ready to commit on
> the side, and possibly a panic_commit function to prevent things like
> sleeping or waiting that regular atomic_commit can use.
> 
> That way, you know have all the resources available to you any time.
> 
>> Sometime it's also just not possible to write pixels to the screen, like if
>> the panic occurs in the middle of suspend/resume, or during a mode-setting,
>> and the hardware state is broken. In this case it's ok to return an error,
>> and nothing will get displayed.
> 
> And yeah, you won't be able to do it every time, but if it's never for
> some workload it's going to be a concern.
> 
> Anyway, we should at the very least document what we expect here.
> 
> Maxime
