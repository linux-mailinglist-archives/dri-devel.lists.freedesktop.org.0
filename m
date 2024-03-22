Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FC2887468
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 22:23:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 019E510E37C;
	Fri, 22 Mar 2024 21:23:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="EYgHCIod";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com
 [95.215.58.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FC02112787
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 21:23:01 +0000 (UTC)
Message-ID: <7a4c332b-a044-4c82-a5b2-cb4b318f5110@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1711142577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n4WPHqLerzC8ab0n7LldeLvSy2z0lzhG43YXJDO+5do=;
 b=EYgHCIodIKnO0p2+qooONaEquVNo90Iqoglv8JTq73y3Zt9MEG2QLtmTS3rDCsxdz+zpZv
 1TPNQASdDZw7PksAKghkzmF9ZiT4ebwNdw0nBaW//DAmN9Vukgwe1cNaKz11C/iXZqmwnT
 5WjhDD3qLvT9CCXEuvbjisjEe5hvNgI=
Date: Fri, 22 Mar 2024 17:22:46 -0400
MIME-Version: 1.0
Subject: Re: [PATCH v2 5/8] drm: zynqmp_dp: Don't retrain the link in our IRQ
Content-Language: en-US
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
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
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <305a8e43-4d65-490c-9f83-afce6490bc83@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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

On 3/22/24 14:09, Tomi Valkeinen wrote:
> On 22/03/2024 18:18, Sean Anderson wrote:
>> On 3/22/24 01:32, Tomi Valkeinen wrote:
>>> On 21/03/2024 21:17, Sean Anderson wrote:
>>>> On 3/21/24 15:08, Tomi Valkeinen wrote:
>>>>> On 21/03/2024 20:01, Sean Anderson wrote:
>>>>>> On 3/21/24 13:25, Tomi Valkeinen wrote:
>>>>>>> On 21/03/2024 17:52, Sean Anderson wrote:
>>>>>>>> On 3/20/24 02:53, Tomi Valkeinen wrote:
>>>>>>>>> On 20/03/2024 00:51, Sean Anderson wrote:
>>>>>>>>> Do we need to handle interrupts while either delayed work is being done?
>>>>>>>>
>>>>>>>> Probably not.
>>>>>>>>
>>>>>>>>> If we do need a delayed work, would just one work be enough which
>>>>>>>>> handles both HPD_EVENT and HPD_IRQ, instead of two?
>>>>>>>>
>>>>>>>> Maybe, but then we need to determine which pending events we need to
>>>>>>>> handle. I think since we have only two events it will be easier to just
>>>>>>>> have separate workqueues.
>>>>>>>
>>>>>>> The less concurrency, the better...Which is why it would be nice to do it all in the threaded irq.
>>>>>>
>>>>>> Yeah, but we can use a mutex for this which means there is not too much
>>>>>> interesting going on.
>>>>>
>>>>> Ok. Yep, if we get (hopefully) a single mutex with clearly defined fields that it protects, I'm ok with workqueues.
>>>>>
>>>>> I'd still prefer just one workqueue, though...
>>>>
>>>> Yeah, but then we need a spinlock or something to tell the workqueue what it should do.
>>>
>>> Yep. We could also always look at the HPD (if we drop the big sleeps) in the wq, and have a flag for the HPD IRQ, which would reduce the state to a single bit.
>>
>> How about something like
>>
>> zynqmp_dp_irq_handler(...)
>> {
>>     /* Read status and handle underflow/overflow/vblank */
>>
>>     status &= ZYNQMP_DP_INT_HPD_EVENT | ZYNQMP_DP_INT_HPD_IRQ;
>>     if (status) {
>>         atomic_or(status, &dp->status);
>>         return IRQ_WAKE_THREAD;
>>     }
>>
>>     return IRQ_HANDLED;
>> }
>>
>> zynqmp_dp_thread_handler(...)
>> {
>>     status = atomic_xchg(&dp->status, 0);
>>     /* process HPD stuff */
>> }
>>
>> which gets rid of the workqueue too.
> 
> I like it. We can't use IRQF_ONESHOT, as that would keep the irq masked while the threaded handler is being ran. I don't think that's a problem, but just something to keep in mind that both handlers can run concurrently.

Actually, I'm not sure we can do it like this. Imagine we have something
like

CPU 0                      CPU 1
zynqmp_dp_thread_handler()
  atomic_xchg()                      
			   __handle_irq_event_percpu 
                             zynqmp_dp_irq_handler()
                               atomic_or()
                               return IRQ_WAIT_THREAD
                             __irq_wake_thread()
                               test_and_set_bit(IRQTF_RUNTHREAD, ...)
                               return
  return IRQ_HANDLED

and whoops we now have bits set in dp->status but the thread isn't
running. I don't think there's a way to fix this without locking (or two
works). TBH I am leaning towards just having two works; it is a clean
implementation. We can also convert to use work_struct instead of
delayed_work, since we never set a delay.

--Sean
