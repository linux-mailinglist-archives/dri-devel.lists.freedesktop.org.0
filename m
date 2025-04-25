Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F39A9CDA1
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 17:58:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E22BE10E344;
	Fri, 25 Apr 2025 15:58:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 08A6E10E344
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 15:58:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E84F6106F;
 Fri, 25 Apr 2025 08:58:16 -0700 (PDT)
Received: from [10.1.36.15] (e122027.cambridge.arm.com [10.1.36.15])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C2C183F66E;
 Fri, 25 Apr 2025 08:58:21 -0700 (PDT)
Message-ID: <fdb76676-52c1-4768-9ed8-2558bf70ffbf@arm.com>
Date: Fri, 25 Apr 2025 16:58:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drm/panfrost: question about cache coherency handling
To: Gregory Greenman <Gregory.Greenman@mobileye.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <AM8PR09MB5258059DE4B54A464C8ADCF3ED852@AM8PR09MB5258.eurprd09.prod.outlook.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <AM8PR09MB5258059DE4B54A464C8ADCF3ED852@AM8PR09MB5258.eurprd09.prod.outlook.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/04/2025 07:08, Gregory Greenman wrote:
> Hello,
> 
> I'm new to DRM developmentand ran into something in the Panfrost (but
> also Panthor) driver I'm curious about.
> 
> In drivers/gpu/drm/panfrost/panfrost_gem.c, there's this line: obj-
>>base.map_wc = !pfdev->coherent;
> 
> From what I can tell, this means when the CPU isn't coherent, it uses
> write-combining mapping.
> 
> I'm wondering why this approach instead of something like the
> dma_sync_single_* functions at the appropriate places?

Because this memory is mapped into user space - and user space doesn't
(want to) deal with coherency. So if the GPU is coherent with the CPU we
can use cached memory (on the CPU) and everything is fine. If we don't
have coherency then we fall back to a write-combining mapping on the CPU.

If you've looked at the "kbase" kernel driver for the proprietary "DDK
driver" from Arm then you'll see a different approach where ioctls are
exported to user space to allow user space to perform the coherency
management (using the dma_sync_single_* functions). But the benefits are
minor and it comes with it's own set of problems (user space can
deliberately make the memory incoherent and the kernel has to protect
itself from that). There's also overhead calling into the kernel for
this, so kbase also provides coherent (i.e. write-combining assuming the
hardware isn't coherent) memory.

Steve

> Thanks,
> 
> Gregory
> 

