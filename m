Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE2188779E
	for <lists+dri-devel@lfdr.de>; Sat, 23 Mar 2024 09:55:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B8C112BAB;
	Sat, 23 Mar 2024 08:55:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Cn8GFEYH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58144112BA4
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Mar 2024 08:55:01 +0000 (UTC)
Received: from [192.168.88.20] (91-154-34-181.elisa-laajakaista.fi
 [91.154.34.181])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 59DCA669;
 Sat, 23 Mar 2024 09:54:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1711184069;
 bh=kcPY+uAYhpR11SyqWUdaVLpYzTaSDlEU7e/g5QTEhqA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Cn8GFEYHJEqI2jPkHtG9YZnYFWD9F5zv1+n/8hzXO3VbE2H3S1i6Mz9VX4pStrDl0
 jlANx7jWO6cSjKS7qQXyI/yaH2cGzVLOJOo2Y2moReY04YjLTlJNC4ZNwGzJE9+xbX
 TtVSEwoJyshSZgroEWQg4wHbPJrVnXY69IYfiFtc=
Message-ID: <a5b9a5eb-2707-49ce-b5b0-f6e2839cdb82@ideasonboard.com>
Date: Sat, 23 Mar 2024 10:54:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] drm: zynqmp_dp: Don't retrain the link in our IRQ
Content-Language: en-US
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Michal Simek <michal.simek@amd.com>, David Airlie <airlied@gmail.com>,
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
References: <20240319225122.3048400-1-sean.anderson@linux.dev>
 <20240319225122.3048400-6-sean.anderson@linux.dev>
 <ca4de45b-302c-4eea-bd6b-8c04e2ed89cb@ideasonboard.com>
 <53b2df23-d5ea-498b-a501-b64f753c0074@linux.dev>
 <0514ef71-5baa-4989-9b7d-8bd9526c4d8d@ideasonboard.com>
 <16ccf678-270c-4770-8cc9-f676b4fabf09@linux.dev>
 <1f27ce69-9ea6-4df4-9147-332d74febdf0@ideasonboard.com>
 <b2bef7f9-fe46-45d0-a09b-50777f71f43c@linux.dev>
 <d6a8bc5c-aed9-4ef4-adb2-dc171106b44b@ideasonboard.com>
 <2dbf138f-5112-48e1-85a6-9e3ad84ec4a6@linux.dev>
 <305a8e43-4d65-490c-9f83-afce6490bc83@ideasonboard.com>
 <7a4c332b-a044-4c82-a5b2-cb4b318f5110@linux.dev>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <7a4c332b-a044-4c82-a5b2-cb4b318f5110@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 22/03/2024 23:22, Sean Anderson wrote:
> On 3/22/24 14:09, Tomi Valkeinen wrote:
>> On 22/03/2024 18:18, Sean Anderson wrote:
>>> On 3/22/24 01:32, Tomi Valkeinen wrote:
>>>> On 21/03/2024 21:17, Sean Anderson wrote:
>>>>> On 3/21/24 15:08, Tomi Valkeinen wrote:
>>>>>> On 21/03/2024 20:01, Sean Anderson wrote:
>>>>>>> On 3/21/24 13:25, Tomi Valkeinen wrote:
>>>>>>>> On 21/03/2024 17:52, Sean Anderson wrote:
>>>>>>>>> On 3/20/24 02:53, Tomi Valkeinen wrote:
>>>>>>>>>> On 20/03/2024 00:51, Sean Anderson wrote:
>>>>>>>>>> Do we need to handle interrupts while either delayed work is being done?
>>>>>>>>>
>>>>>>>>> Probably not.
>>>>>>>>>
>>>>>>>>>> If we do need a delayed work, would just one work be enough which
>>>>>>>>>> handles both HPD_EVENT and HPD_IRQ, instead of two?
>>>>>>>>>
>>>>>>>>> Maybe, but then we need to determine which pending events we need to
>>>>>>>>> handle. I think since we have only two events it will be easier to just
>>>>>>>>> have separate workqueues.
>>>>>>>>
>>>>>>>> The less concurrency, the better...Which is why it would be nice to do it all in the threaded irq.
>>>>>>>
>>>>>>> Yeah, but we can use a mutex for this which means there is not too much
>>>>>>> interesting going on.
>>>>>>
>>>>>> Ok. Yep, if we get (hopefully) a single mutex with clearly defined fields that it protects, I'm ok with workqueues.
>>>>>>
>>>>>> I'd still prefer just one workqueue, though...
>>>>>
>>>>> Yeah, but then we need a spinlock or something to tell the workqueue what it should do.
>>>>
>>>> Yep. We could also always look at the HPD (if we drop the big sleeps) in the wq, and have a flag for the HPD IRQ, which would reduce the state to a single bit.
>>>
>>> How about something like
>>>
>>> zynqmp_dp_irq_handler(...)
>>> {
>>>      /* Read status and handle underflow/overflow/vblank */
>>>
>>>      status &= ZYNQMP_DP_INT_HPD_EVENT | ZYNQMP_DP_INT_HPD_IRQ;
>>>      if (status) {
>>>          atomic_or(status, &dp->status);
>>>          return IRQ_WAKE_THREAD;
>>>      }
>>>
>>>      return IRQ_HANDLED;
>>> }
>>>
>>> zynqmp_dp_thread_handler(...)
>>> {
>>>      status = atomic_xchg(&dp->status, 0);
>>>      /* process HPD stuff */
>>> }
>>>
>>> which gets rid of the workqueue too.
>>
>> I like it. We can't use IRQF_ONESHOT, as that would keep the irq masked while the threaded handler is being ran. I don't think that's a problem, but just something to keep in mind that both handlers can run concurrently.
> 
> Actually, I'm not sure we can do it like this. Imagine we have something
> like
> 
> CPU 0                      CPU 1
> zynqmp_dp_thread_handler()
>    atomic_xchg()
> 			   __handle_irq_event_percpu
>                               zynqmp_dp_irq_handler()
>                                 atomic_or()
>                                 return IRQ_WAIT_THREAD
>                               __irq_wake_thread()
>                                 test_and_set_bit(IRQTF_RUNTHREAD, ...)
>                                 return
>    return IRQ_HANDLED
> 
> and whoops we now have bits set in dp->status but the thread isn't
> running. I don't think there's a way to fix this without locking (or two

In your example above, the IRQTF_RUNTHREAD has been cleared by the 
threaded-irq before calling zynqmp_dp_thread_handler. So the hard-irq 
will set that flag before the zynqmp_dp_thread_handler() returns.

When zynqmp_dp_thread_handler() returns, the execution will go to 
irq_wait_for_interrupt(). That function will notice the IRQTF_RUNTHREAD 
flag (and clear it), and run the zynqmp_dp_thread_handler() again.

So if I'm not mistaken, when the hard-irq function returns 
IRQ_WAKE_THREAD, it's always guaranteed that a "fresh" run of the 
threaded handler will be ran.

I think that makes sense, as I'm not sure how threaded handlers without 
IRQF_ONESHOT could be used if that were not the case. I hope I'm right 
in my analysis =).

  Tomi

