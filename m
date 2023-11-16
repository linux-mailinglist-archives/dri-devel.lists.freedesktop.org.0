Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 695A37EE0D7
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 13:45:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 038F010E28E;
	Thu, 16 Nov 2023 12:45:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E18E910E28E
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 12:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700138744; x=1731674744;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=A4k5oXIjTHmAp/SkLso9fZWLC4szlyA8/21YX/tDP1o=;
 b=MchvLHhKI02dS3h/njHw4oNNytVzQLEq1pkuu8ehB4mk0tbDJanlv292
 /sJoopHJae7At/gaOqDrvUWVCtt9VigTkQiwXg5aiIJ4XXBaxbUzwvv/E
 ukjgL9lg6386BvKqWLf3m2/bSRBGvqy2jbkcOz1IpgZizGncjFEs2JlQe
 tQgPorS4Rl8JfegPkPBbJhxvXQSEx5Tm3wPZcHHjqLpSVzipq9JaDSxdU
 qdcfhHHpp8kdJZ0Sh8Vu7QV7iK7wXde0EwH2xdECVm1/iEAtFGRmhPrYW
 J/9LaUqHrkRBEdFnYRiJ9PYr46/3/YrcxqTKo4j5p5DDJAiRpIW08JaL+ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="376126084"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; d="scan'208";a="376126084"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 04:45:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="1012598731"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; d="scan'208";a="1012598731"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.249.152.238])
 ([10.249.152.238])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 04:45:43 -0800
Message-ID: <4e5af85b-4a84-491c-87a6-6e26532bf758@linux.intel.com>
Date: Thu, 16 Nov 2023 13:45:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] accel/ivpu: Replace IPC kthread with threaded IRQ
To: dri-devel@lists.freedesktop.org
References: <20231113170252.758137-1-jacek.lawrynowicz@linux.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20231113170252.758137-1-jacek.lawrynowicz@linux.intel.com>
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

Applied to drm-misc-next

On 13.11.2023 18:02, Jacek Lawrynowicz wrote:
> Use threaded IRQ to handle incoming IPC messages. IPC consumers can now
> provide optional callback that will be executed once message is received.
> This allows to handle multiple message types in a generic manner.
> 
> Removing kthread also simplifies synchronization as disable_irq() will block
> until all pending messages are handled.
> 
> v2:
>   - Don't do bit operations on enum irqreturn
> 
> v1: https://lore.kernel.org/all/20231107123514.2218850-1-jacek.lawrynowicz@linux.intel.com
> 
> Jacek Lawrynowicz (1):
>   accel/ivpu: Use threaded IRQ to handle JOB done messages
> 
> Stanislaw Gruszka (4):
>   accel/ivpu: Rename cons->rx_msg_lock
>   accel/ivpu: Do not use irqsave in ivpu_ipc_dispatch
>   accel/ivpu: Do not use cons->aborted for job_done_thread
>   accel/ivpu: Use dedicated work for job timeout detection
> 
>  drivers/accel/ivpu/ivpu_drv.c     |  30 ++--
>  drivers/accel/ivpu/ivpu_drv.h     |   3 +-
>  drivers/accel/ivpu/ivpu_hw_37xx.c |  29 ++--
>  drivers/accel/ivpu/ivpu_hw_40xx.c |  30 ++--
>  drivers/accel/ivpu/ivpu_ipc.c     | 223 +++++++++++++++++-------------
>  drivers/accel/ivpu/ivpu_ipc.h     |  24 +++-
>  drivers/accel/ivpu/ivpu_job.c     |  99 +++----------
>  drivers/accel/ivpu/ivpu_job.h     |   6 +-
>  drivers/accel/ivpu/ivpu_pm.c      |  31 +++++
>  drivers/accel/ivpu/ivpu_pm.h      |   3 +
>  10 files changed, 251 insertions(+), 227 deletions(-)
> 
> --
> 2.42.0
