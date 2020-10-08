Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FB8287231
	for <lists+dri-devel@lfdr.de>; Thu,  8 Oct 2020 12:04:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C3BB6E114;
	Thu,  8 Oct 2020 10:04:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D6E6D6E114
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Oct 2020 10:04:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 297E331B;
 Thu,  8 Oct 2020 03:04:21 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 31DC43F70D;
 Thu,  8 Oct 2020 03:04:20 -0700 (PDT)
Subject: Re: [PATCH v3] drm/panfrost: Fix job timeout handling
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
References: <20201002122506.1374183-1-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <ddd62ed0-d659-b57e-38de-247bac9a0430@arm.com>
Date: Thu, 8 Oct 2020 11:04:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201002122506.1374183-1-boris.brezillon@collabora.com>
Content-Language: en-GB
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
Cc: stable@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/10/2020 13:25, Boris Brezillon wrote:
> If more than two jobs end up timeout-ing concurrently, only one of them
> (the one attached to the scheduler acquiring the lock) is fully handled.
> The other one remains in a dangling state where it's no longer part of
> the scheduling queue, but still blocks something in scheduler, leading
> to repetitive timeouts when new jobs are queued.
> 
> Let's make sure all bad jobs are properly handled by the thread
> acquiring the lock.
> 
> v3:
> - Add Steven's R-b
> - Don't take the sched_lock when stopping the schedulers
> 
> v2:
> - Fix the subject prefix
> - Stop the scheduler before returning from panfrost_job_timedout()
> - Call cancel_delayed_work_sync() after drm_sched_stop() to make sure
>    no timeout handlers are in flight when we reset the GPU (Steven Price)
> - Make sure we release the reset lock before restarting the
>    schedulers (Steven Price)
> 
> Fixes: f3ba91228e8e ("drm/panfrost: Add initial panfrost driver")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>

Applied to drm-misc-next, thanks!

Steve
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
