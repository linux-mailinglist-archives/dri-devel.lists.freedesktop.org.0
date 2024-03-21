Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E10886033
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 19:02:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18A8D10F63D;
	Thu, 21 Mar 2024 18:02:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="DnkRB0aQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-184.mta1.migadu.com (out-184.mta1.migadu.com
 [95.215.58.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3D4610F63D
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Mar 2024 18:02:00 +0000 (UTC)
Message-ID: <16ccf678-270c-4770-8cc9-f676b4fabf09@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1711044116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3jCNE51iIDU7D8f4vJ8vC3wJ5igSMaQyRWOs6SDcoc4=;
 b=DnkRB0aQO1YjTp7DlSavLOZxGJXRzWuU8HJ42U3HPopVHMQ9zrMXGIYX7e+glDubg9JRzS
 qJZ+IUKyH3mwMSrhtObV1SeUA8P7BN3be7BtJddsA5wuZ4WkN1/+T/XiBkVeIrpYZJKFdb
 Im6loUb5p/Hl88rmdvY7nw/cIkhg4/o=
Date: Thu, 21 Mar 2024 14:01:52 -0400
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
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <0514ef71-5baa-4989-9b7d-8bd9526c4d8d@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 3/21/24 13:25, Tomi Valkeinen wrote:
> On 21/03/2024 17:52, Sean Anderson wrote:
>> On 3/20/24 02:53, Tomi Valkeinen wrote:
>>> On 20/03/2024 00:51, Sean Anderson wrote:
>>>> Retraining the link can take a while, and might involve waiting for
>>>> DPCD reads/writes to complete. This is inappropriate for an IRQ handler.
>>>> Just schedule this work for later completion. This is racy, but will be
>>>> fixed in the next commit.
>>>
>>> You should add the locks first, and use them here, rather than first
>>> adding a buggy commit and fixing it in the next one.
>>
>> I didn't think I could add the locks first since I only noticed the IRQ
>> was threaded right before sending out this series. So yeah, we could add
>> locking, add the workqueue, and then unthread the IRQ.
>>
>>>> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
>>>> ---
>>>> Actually, on second look this IRQ is threaded. So why do we have a
>>>> workqueue for HPD events? Maybe we should make it unthreaded?
>>>
>>> Indeed, there's not much work being done in the IRQ handler. I don't know why it's threaded.
>>>
>>> We could move the queued work to be inside the threaded irq handler,
>>> but with a quick look, the HPD work has lines like "msleep(100)" (and
>>> that's inside a for loop...), which is probably not a good thing to do
>>> even in threaded irq handler.
>>>
>>> Although I'm not sure if that code is good to have anywhere. Why do we
>>> even have such code in the HPD work path... We already got the HPD
>>> interrupt. What does "It takes some delay (ex, 100 ~ 500 msec) to get
>>> the HPD signal with some monitors" even mean...
>>
>> The documentation for this bit is
>>
>> | HPD_STATE    0    ro    0x0    Contains the raw state of the HPD pin on the DisplayPort connector.
>>
>> So I think the idea is to perform some debouncing.
> 
> Hmm, it just looks a bit odd to me. It can sleep for a second. And the wording "It takes some delay (ex, 100 ~ 500 msec) to get the HPD signal with some monitors" makes it sound like some kind of a hack...
> 
> The docs mention debounce once:
> 
> https://docs.amd.com/r/en-US/pg299-v-dp-txss1/Hot-Plug-Detection

Are you sure this is the right document? This seems to be documentation for [1]. Is that instantiated as a hard block on the ZynqMP?

[1] https://www.xilinx.com/products/intellectual-property/ef-di-displayport.html

> But it's not immediately obvious what the SW must do and what's done by the HW. Debounce is not mentioned later, e.g. in the HPD Event Handling. But if debounce is needed, wouldn't it be perhaps in a few milliseconds, instead of hundreds of milliseconds...

Well, the DP spec says

| If the HPD is the result of a new device being connected, either
| directly to the Source device (signaled by a long HPD), –or– downstream
| of a Branch device (indicated by incrementing the DFP_COUNT field value
| in the DOWN_STREAM_PORT_COUNT register (DPCD 00007h[3:0]) and signaled
| by an IRQ_HPD pulse), the Source device shall read the new DisplayID or
| legacy EDID that has been made available to it to ensure that content
| being transmitted over the link is able to be properly received and
| rendered.
|
| Informative Note: If the HPD signal toggling (or bouncing) is the
|                   result of the Hot Unplug followed by Hot Plug of a
|                   cable-connector assembly, the HPD signal is likely
|                   to remain unstable during the de-bouncing period,
|                   which is in the order of tens of milliseconds. The
|                   Source device may either check the HPD signal’s
|                   stability before initiating an AUX read transaction,
|                   –or– immediately initiate the AUX read transaction
|                   after each HPD rising edge.

So a 100 ms delay seems plausible for some monitors.

That said, maybe we can just skip this and always read the DPCD.

> zynqmp_dp_bridge_detect() is used for drm_bridge_funcs.detect(), and if the cable is not connected, it'll sleep for 1 second (probably more) until returning not connected. It just doesn't sound correct to me.
> 
> Well, it's not part of this patch as such, but related to the amount of time we spend in the interrupt handler (and also the detect()).
> 
>>> Would it be possible to clean up the work funcs a bit (I haven't
>>> looked a the new work func yet), to remove the worst extra sleeps, and
>>> just do all that inside the threaded irq handler?
>>
>> Probably not, since a HPD IRQ results in link retraining, which can take a while.
> 
> But is it any different if you have a workqueue? Isn't a threaded interrupt handler basically the same thing?
> 
> Probably at least the zynqmp_dp_hpd_work_func() could be done in the threaded irq just fine, if the insane 1s sleep can be dropped.

Anything involving AUX shouldn't been in an IRQ, since
zynqmp_dp_aux_transfer will retry for up to 50ms by default.

>>> Do we need to handle interrupts while either delayed work is being done?
>>
>> Probably not.
>>
>>> If we do need a delayed work, would just one work be enough which
>>> handles both HPD_EVENT and HPD_IRQ, instead of two?
>>
>> Maybe, but then we need to determine which pending events we need to
>> handle. I think since we have only two events it will be easier to just
>> have separate workqueues.
> 
> The less concurrency, the better...Which is why it would be nice to do it all in the threaded irq.

Yeah, but we can use a mutex for this which means there is not too much
interesting going on.

--Sean
