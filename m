Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A46885CA0
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 16:52:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A21AD10E97A;
	Thu, 21 Mar 2024 15:52:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="NOYQ4dW4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com
 [91.218.175.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C75E110E97A
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Mar 2024 15:52:29 +0000 (UTC)
Message-ID: <53b2df23-d5ea-498b-a501-b64f753c0074@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1711036347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2reTOytJMh5foizD5SWaFSRwZSD2WulrWEB+iTZT+JA=;
 b=NOYQ4dW4Jm1mvANK62WuzMcS2fhb/Cz2mmzJ6a6obOy1x/zCVi9iJrokRVLaSp8ymgicJ1
 O6pMTLiEF44xOjsTQyjS+MmwWPUCZNd03HfTM5NOEg2IrOMCX1fxtfG4WlkkRLr97b3OSz
 rk28k0t9IEvkCpxUQqE2T71VIEfM5Ro=
Date: Thu, 21 Mar 2024 11:52:23 -0400
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
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <ca4de45b-302c-4eea-bd6b-8c04e2ed89cb@ideasonboard.com>
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

On 3/20/24 02:53, Tomi Valkeinen wrote:
> On 20/03/2024 00:51, Sean Anderson wrote:
>> Retraining the link can take a while, and might involve waiting for
>> DPCD reads/writes to complete. This is inappropriate for an IRQ handler.
>> Just schedule this work for later completion. This is racy, but will be
>> fixed in the next commit.
> 
> You should add the locks first, and use them here, rather than first
> adding a buggy commit and fixing it in the next one.

I didn't think I could add the locks first since I only noticed the IRQ
was threaded right before sending out this series. So yeah, we could add
locking, add the workqueue, and then unthread the IRQ.

>> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
>> ---
>> Actually, on second look this IRQ is threaded. So why do we have a
>> workqueue for HPD events? Maybe we should make it unthreaded?
> 
> Indeed, there's not much work being done in the IRQ handler. I don't know why it's threaded.
> 
> We could move the queued work to be inside the threaded irq handler,
> but with a quick look, the HPD work has lines like "msleep(100)" (and
> that's inside a for loop...), which is probably not a good thing to do
> even in threaded irq handler.
> 
> Although I'm not sure if that code is good to have anywhere. Why do we
> even have such code in the HPD work path... We already got the HPD
> interrupt. What does "It takes some delay (ex, 100 ~ 500 msec) to get
> the HPD signal with some monitors" even mean...

The documentation for this bit is

| HPD_STATE	0	ro	0x0	Contains the raw state of the HPD pin on the DisplayPort connector.

So I think the idea is to perform some debouncing.

> Would it be possible to clean up the work funcs a bit (I haven't
> looked a the new work func yet), to remove the worst extra sleeps, and
> just do all that inside the threaded irq handler?

Probably not, since a HPD IRQ results in link retraining, which can take a while.

> Do we need to handle interrupts while either delayed work is being done?

Probably not.

> If we do need a delayed work, would just one work be enough which
> handles both HPD_EVENT and HPD_IRQ, instead of two?

Maybe, but then we need to determine which pending events we need to
handle. I think since we have only two events it will be easier to just
have separate workqueues.

--Sean
