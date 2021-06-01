Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0AA53971CF
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 12:49:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 385C76EA24;
	Tue,  1 Jun 2021 10:49:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.180])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8C94D6EA23;
 Tue,  1 Jun 2021 10:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id B75DA20201C;
 Tue,  1 Jun 2021 12:49:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id Zp5_JBPVcIGN; Tue,  1 Jun 2021 12:49:45 +0200 (CEST)
Received: from thor (24.99.2.85.dynamic.wline.res.cust.swisscom.ch
 [85.2.99.24])
 by netline-mail3.netline.ch (Postfix) with ESMTPA id 03C7B20201A;
 Tue,  1 Jun 2021 12:49:44 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.94.2)
 (envelope-from <michel@daenzer.net>)
 id 1lo1xw-001piq-0Y; Tue, 01 Jun 2021 12:49:44 +0200
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>,
 Alex Deucher <alexdeucher@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@gmail.com>, Jason Ekstrand <jason@jlekstrand.net>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
References: <CAAxE2A4XS2mCXOdvxm1ZAhG2OY9w1P0X2E1ac1TXNFKDekog5g@mail.gmail.com>
 <e7cb9833-1044-0426-5ce4-5b5fc32a3603@daenzer.net>
 <327e4008-b29f-f5b7-bb30-532fa52c797f@gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: Linux Graphics Next: Userspace submission update
Message-ID: <7f19e3c7-b6b2-5200-95eb-3fed8d22a6b3@daenzer.net>
Date: Tue, 1 Jun 2021 12:49:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <327e4008-b29f-f5b7-bb30-532fa52c797f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-CA
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-06-01 12:21 p.m., Christian König wrote:
> Am 01.06.21 um 11:02 schrieb Michel Dänzer:
>> On 2021-05-27 11:51 p.m., Marek Olšák wrote:
>>> 3) Compositors (and other privileged processes, and display flipping) can't trust imported/exported fences. They need a timeout recovery mechanism from the beginning, and the following are some possible solutions to timeouts:
>>>
>>> a) use a CPU wait with a small absolute timeout, and display the previous content on timeout
>>> b) use a GPU wait with a small absolute timeout, and conditional rendering will choose between the latest content (if signalled) and previous content (if timed out)
>>>
>>> The result would be that the desktop can run close to 60 fps even if an app runs at 1 fps.
>> FWIW, this is working with
>> https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1880 , even with implicit sync (on current Intel GPUs; amdgpu/radeonsi would need to provide the same dma-buf poll semantics as other drivers and high priority GFX contexts via EGL_IMG_context_priority which can preempt lower priority ones).
> 
> Yeah, that is really nice to have.
> 
> One question is if you wait on the CPU or the GPU for the new surface to become available?

It's based on polling dma-buf fds, i.e. CPU.

> The former is a bit bad for latency and power management.

There isn't a choice for Wayland compositors in general, since there can be arbitrary other state which needs to be applied atomically together with the new buffer. (Though in theory, a compositor might get fancy and special-case surface commits which can be handled by waiting on the GPU)

Latency is largely a matter of scheduling in the compositor. The latency incurred by the compositor shouldn't have to be more than single-digit milliseconds. (I've seen total latency from when the client starts processing a (static) frame to when it starts being scanned out as low as ~6 ms with https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1620, lower than typical with Xorg)


> Another question is if that is sufficient as security for the display server or if we need further handling down the road? I mean essentially we are moving the reliability problem into the display server.

Good question. This should generally protect the display server from freezing due to client fences never signalling, but there might still be corner cases.


-- 
Earthling Michel Dänzer               |               https://redhat.com
Libre software enthusiast             |             Mesa and X developer
