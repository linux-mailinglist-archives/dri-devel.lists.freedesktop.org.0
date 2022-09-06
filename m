Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E783D5AE730
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 14:06:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E72B710E628;
	Tue,  6 Sep 2022 12:06:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id B8C6E10E628
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 12:06:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 46F1C139F;
 Tue,  6 Sep 2022 05:06:14 -0700 (PDT)
Received: from [10.57.15.197] (unknown [10.57.15.197])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5A5E73F534;
 Tue,  6 Sep 2022 05:06:07 -0700 (PDT)
Message-ID: <278d20f5-271f-7118-c6a5-c7854f694879@arm.com>
Date: Tue, 6 Sep 2022 13:06:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: mesa-22.3.0-devel + linux-5.19.6 + mediapipe: panfrost js fault
Content-Language: en-GB
To: Chris Ruehl <chris.ruehl@gtsys.com.hk>, dri-devel@lists.freedesktop.org
References: <254478a0-4077-00fb-7923-2d8d45f1c59a@gtsys.com.hk>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <254478a0-4077-00fb-7923-2d8d45f1c59a@gtsys.com.hk>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-09-04 05:13, Chris Ruehl wrote:
> Hi,
> 
> Something you might have a head up for it,
> 
> have a mediapipe application for POSE which use the T860 GPU for the 
> calculation
> but the kernel driver report error (js fault) - I see one or 2 
> calculation frames on the mat-picture output only before
> the pipe stop working.
> 
> Linux bullseye64 5.19.6 #1 SMP PREEMPT Fri Sep 2 02:25:59 UTC 2022 
> aarch64 GNU/Linux
> 
> [    5.164415] panfrost ff9a0000.gpu: clock rate = 500000000
> [    5.169845] panfrost ff9a0000.gpu: [drm:panfrost_devfreq_init 
> [panfrost]] Failed to register cooling device
> [    5.169989] panfrost ff9a0000.gpu: mali-t860 id 0x860 major 0x2 minor 
> 0x0 status 0x0
> [    5.169999] panfrost ff9a0000.gpu: features: 00000000,00000407, 
> issues: 00000000,24040400
> [    5.170008] panfrost ff9a0000.gpu: Features: L2:0x07120206 
> Shader:0x00000000 Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
> [    5.170017] panfrost ff9a0000.gpu: shader_present=0xf l2_present=0x1
> [    5.206827] [drm] Initialized panfrost 1.2.0 20180908 for 
> ff9a0000.gpu on minor 1
> ...
> [  162.862064] panfrost ff9a0000.gpu: js fault, js=1, 
> status=DATA_INVALID_FAULT, head=0xaba7100, tail=0xaba7100
> [  162.862269] panfrost ff9a0000.gpu: js fault, js=1, 
> status=DATA_INVALID_FAULT, head=0xa1e0100, tail=0xa1e0100
> 
> Have a RK3399 customized board and compiled the mesa drivers for it
> 
> meson $1 . build/ \
> -D dri-drivers= \
> -D vulkan-drivers= \
> -D gallium-drivers=panfrost,kmsro \
> -D llvm=disabled \
> -D libunwind=false \
> -D platforms=x11,wayland
> 
> glmark2 runs flawless scores 588.
> 
> Same code run on a x86_64 with an AMD GPU working fine.
> 
> Anything help fix the bug is welcome.

This is almost certainly a userspace problem, so you're best off raising 
a Mesa issue with some more details - an apitrace of the failing 
application and/or PAN_MESA_DEBUG=trace output capturing the offending 
invalid descriptors would probably be a good starting point.

Robin.
