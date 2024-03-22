Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FF88870C3
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 17:19:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18AC610F0E7;
	Fri, 22 Mar 2024 16:19:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="rAcq/Pr6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com
 [91.218.175.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC92810F0E7
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 16:19:06 +0000 (UTC)
Message-ID: <2dbf138f-5112-48e1-85a6-9e3ad84ec4a6@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1711124341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KB5GftMYyC75xN2sRG0i/ixBELjpxJvza4IaI6qq1+0=;
 b=rAcq/Pr6acgADB2ZF7hpy57CL4pr5Hkb9gWfpeXR4lEYG85SU/XKXu/IApF7Y25mcQMjM5
 xgZWPtKC95rPVrPXF0K6vyByn2iKWAdzLWgM1zF8R4gtfH7/4ZWB65Ovz7dZjTMhiRCevr
 ahirJGR9OtB93xVSpOibVK6cMaAV4i4=
Date: Fri, 22 Mar 2024 12:18:57 -0400
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
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <d6a8bc5c-aed9-4ef4-adb2-dc171106b44b@ideasonboard.com>
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

On 3/22/24 01:32, Tomi Valkeinen wrote:
> On 21/03/2024 21:17, Sean Anderson wrote:
>> On 3/21/24 15:08, Tomi Valkeinen wrote:
>>> On 21/03/2024 20:01, Sean Anderson wrote:
>>>> On 3/21/24 13:25, Tomi Valkeinen wrote:
>>>>> On 21/03/2024 17:52, Sean Anderson wrote:
>>>>>> On 3/20/24 02:53, Tomi Valkeinen wrote:
>>>>>>> On 20/03/2024 00:51, Sean Anderson wrote:
>>>>>>> Do we need to handle interrupts while either delayed work is being done?
>>>>>>
>>>>>> Probably not.
>>>>>>
>>>>>>> If we do need a delayed work, would just one work be enough which
>>>>>>> handles both HPD_EVENT and HPD_IRQ, instead of two?
>>>>>>
>>>>>> Maybe, but then we need to determine which pending events we need to
>>>>>> handle. I think since we have only two events it will be easier to just
>>>>>> have separate workqueues.
>>>>>
>>>>> The less concurrency, the better...Which is why it would be nice to do it all in the threaded irq.
>>>>
>>>> Yeah, but we can use a mutex for this which means there is not too much
>>>> interesting going on.
>>>
>>> Ok. Yep, if we get (hopefully) a single mutex with clearly defined fields that it protects, I'm ok with workqueues.
>>>
>>> I'd still prefer just one workqueue, though...
>>
>> Yeah, but then we need a spinlock or something to tell the workqueue what it should do.
> 
> Yep. We could also always look at the HPD (if we drop the big sleeps) in the wq, and have a flag for the HPD IRQ, which would reduce the state to a single bit.

How about something like

zynqmp_dp_irq_handler(...)
{
	/* Read status and handle underflow/overflow/vblank */

	status &= ZYNQMP_DP_INT_HPD_EVENT | ZYNQMP_DP_INT_HPD_IRQ;
	if (status) {
		atomic_or(status, &dp->status);
		return IRQ_WAKE_THREAD;
	}

	return IRQ_HANDLED;
}

zynqmp_dp_thread_handler(...)
{
	status = atomic_xchg(&dp->status, 0);
	/* process HPD stuff */
}

which gets rid of the workqueue too.

--Sean
