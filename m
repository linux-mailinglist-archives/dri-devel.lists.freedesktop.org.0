Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4897BD494
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 09:48:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B19010E098;
	Mon,  9 Oct 2023 07:47:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89BDD10E098
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 07:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696837674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xJBY/oZHYz4t9mZWE1oIrTf8De99FIs2hYZqRt7kFFs=;
 b=I7iQSLvIiYQeLMxBh6OfrfcKkGmJVKbTXrwIqKZEM+9ksfRKBpWd6ulG47aQStuzfqrIPG
 7U6pHwudi9V28fq3T8BhQZW4nOQvaXHWwUekv1FFPXM2bkjxgOvx8ggZtLHuRT1bXEApH3
 wdpDpTVDzQhntx3xxMSnRxwhqRx6qaY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-475-7hN02ma_NM67ePkIngJ2HA-1; Mon, 09 Oct 2023 03:47:52 -0400
X-MC-Unique: 7hN02ma_NM67ePkIngJ2HA-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3233a13b47eso3143676f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 00:47:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696837671; x=1697442471;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xJBY/oZHYz4t9mZWE1oIrTf8De99FIs2hYZqRt7kFFs=;
 b=cUFd4hMg03BOzubGzVtokiGWwlAogZcjNhwswWULS2zaORG5LEXKEX6vN5s/waWDFQ
 If8ApEz+x62TfiRARBOlft29uds4a8K5cLszSgfw62DGRFlF6/lUkCi7bmpH5OCFZYV4
 7fXUlVnwYZ20Kdj+WLpiT6M6UxdT2Q9SewpXI56qQR5T4oLgQPQPMcCiLKd528iSm2iy
 zpjNXNIByxiZOj6hXJ1WJ8Qeh8Nf5LLeAf0L8+Q6w+0COUaVULMEbQGNIVEJk3eDrkGi
 +zf4jWHBcUlwG6D87ev8UURnWGaNBp08jWW30lEMOX5Vc7nVpgEn5meg6nDlIVwTlGQd
 FtbQ==
X-Gm-Message-State: AOJu0Yy//zKxKI3dlv5bwyVluLcPQ1BTHnmbjRVAs4kD1GmTzz/qc+nx
 /qEvRWZh8OKLd9fheWtvioCxGvtO4ViznGxybXBINZyIeb0sqRQx2GztxmmrDSxvj2lpR2x7IkJ
 43EeiORbgtM/yjwZo1kjjxN4H7V8/
X-Received: by 2002:a05:6000:3c1:b0:329:6bdc:5a60 with SMTP id
 b1-20020a05600003c100b003296bdc5a60mr7142304wrg.12.1696837671460; 
 Mon, 09 Oct 2023 00:47:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuwnPxS8/a8O0NOpmEXWvZcrkGqkmUm/fYYOWERh0gHqFDVxupytxt7vOLiorQGazUDjBptg==
X-Received: by 2002:a05:6000:3c1:b0:329:6bdc:5a60 with SMTP id
 b1-20020a05600003c100b003296bdc5a60mr7142290wrg.12.1696837671039; 
 Mon, 09 Oct 2023 00:47:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 c12-20020adfe74c000000b003258934a4bfsm8812861wrn.36.2023.10.09.00.47.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Oct 2023 00:47:50 -0700 (PDT)
Message-ID: <b4aadfb4-9393-d6b6-e876-a420afcf2b36@redhat.com>
Date: Mon, 9 Oct 2023 09:47:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH v4 2/4] drm/panic: Add a drm panic handler
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Maxime Ripard <mripard@kernel.org>
References: <20231003142508.190246-1-jfalempe@redhat.com>
 <20231003142508.190246-3-jfalempe@redhat.com>
 <lbwngkco3zam7yjo3owwpn47o3pe6g7oh5giglsclenx52jk5q@lw2fwsxz6kqp>
 <3a359910-31ae-355f-2608-239e04689fde@redhat.com>
 <6iaqx7ef4hdd6bucsxtfy37nsizloraxbudez4ms7jlusbghr3@i5hliqpimdp2>
 <bd880231-f161-0773-63f7-ded6cb3fddc1@tronnes.org>
In-Reply-To: <bd880231-f161-0773-63f7-ded6cb3fddc1@tronnes.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: bluescreen_avenger@verizon.net, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, gpiccoli@igalia.com, tzimmermann@suse.de,
 airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/10/2023 18:54, Noralf Trønnes wrote:
> 
> 
> On 10/6/23 16:35, Maxime Ripard wrote:
>> Hi Jocelyn,
>>
>> On Thu, Oct 05, 2023 at 11:16:15AM +0200, Jocelyn Falempe wrote:
>>> On 05/10/2023 10:18, Maxime Ripard wrote:
>>>> Hi,
>>>>
>>>> On Tue, Oct 03, 2023 at 04:22:45PM +0200, Jocelyn Falempe wrote:
>>>>> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
>>>>> index 89e2706cac56..e538c87116d3 100644
>>>>> --- a/include/drm/drm_drv.h
>>>>> +++ b/include/drm/drm_drv.h
>>>>> @@ -43,6 +43,7 @@ struct dma_buf_attachment;
>>>>>    struct drm_display_mode;
>>>>>    struct drm_mode_create_dumb;
>>>>>    struct drm_printer;
>>>>> +struct drm_scanout_buffer;
>>>>>    struct sg_table;
>>>>>    /**
>>>>> @@ -408,6 +409,19 @@ struct drm_driver {
>>>>>    	 */
>>>>>    	void (*show_fdinfo)(struct drm_printer *p, struct drm_file *f);
>>>>> +	/**
>>>>> +	 * @get_scanout_buffer:
>>>>> +	 *
>>>>> +	 * Get the current scanout buffer, to display a panic message with drm_panic.
>>>>> +	 * It is called from a panic callback, and must follow its restrictions.
>>>>> +	 *
>>>>> +	 * Returns:
>>>>> +	 *
>>>>> +	 * Zero on success, negative errno on failure.
>>>>> +	 */
>>>>> +	int (*get_scanout_buffer)(struct drm_device *dev,
>>>>> +				  struct drm_scanout_buffer *sb);
>>>>> +
>>>>
>>>> What is the format of that buffer? What is supposed to happen if the
>>>> planes / CRTC are setup in a way that is incompatible with the buffer
>>>> format?
>>>
>>> Currently, it only supports linear format, either in system memory, or
>>> iomem.
>>> But really what is needed is the screen size, and a way to write pixels to
>>> it.
>>> For more complex GPU, I don't know if it's easier to reprogram the GPU to
>>> linear format, or to add a simple "tiled" support to drm_panic.
>>> What would you propose as a panic interface to handle those complex format ?
>>
>> It's not just about tiling, but also about YUV formats. If the display
>> engine is currently playing a video at the moment, it's probably going
>> to output some variation of multi-planar YUV and you won't have an RGB
>> buffer available.
>>
> 
> I had support for some YUV formats in my 2019 attempt on a panic
> handler[1] and I made a recording of a test run as well[2] (see 4:30 for
> YUV). There was a discussion about challenges and i915 can disable
> tiling by flipping a bit in a register[3] and AMD has a debug
> interface[4] they can use to write pixels.

I only added support for the format used by simpledrm, because I don't 
want to add support for all possible format if no driver are using it.
It should be possible to add YUV format too.

I also prefer to convert only the foreground/background color, and then 
write directly into the buffers, instead of converting line by line.
It works for all format where pixel size is a multiple of byte.

> 
> Noralf.
> 
> [1]
> https://lore.kernel.org/dri-devel/20190311174218.51899-1-noralf@tronnes.org/
> [2] https://youtu.be/lZ80vL4dgpE
> [3]
> https://lore.kernel.org/dri-devel/20190314095004.GP2665@phenom.ffwll.local/
> [4]
> https://lore.kernel.org/dri-devel/d233c376-ed07-2127-6084-8292d313dac7@amd.com/
> 
>> Same story if you're using a dma-buf buffer. You might not even be able
>> to access that buffer at all from the CPU or the kernel.
>>
>> I really think we should have some emergency state ready to commit on
>> the side, and possibly a panic_commit function to prevent things like
>> sleeping or waiting that regular atomic_commit can use.
>>
>> That way, you know have all the resources available to you any time.

I think reusing the atomic commit functions might be hard, because there 
are locks/allocation/threads hidden in drivers callback. I'm more in 
favor of an emergency function, that each driver has to implement, and 
use what the hardware can do to display a simple frame quickly.
get_scanout_buffer() is a good start for simple driver, but will need 
refactoring for the more complex case, like adding a callback to write 
pixels one by one, if there is no memory mapped buffer available.

>>
>>> Sometime it's also just not possible to write pixels to the screen, like if
>>> the panic occurs in the middle of suspend/resume, or during a mode-setting,
>>> and the hardware state is broken. In this case it's ok to return an error,
>>> and nothing will get displayed.
>>
>> And yeah, you won't be able to do it every time, but if it's never for
>> some workload it's going to be a concern.
>>
>> Anyway, we should at the very least document what we expect here.

Yes I should better document the drm panic feature, and the 
get_scanout_buffer() interface.

>>
>> Maxime
> 

-- 

Jocelyn

