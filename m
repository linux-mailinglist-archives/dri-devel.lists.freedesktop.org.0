Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD0183BD26
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 10:23:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C48FC10EB8C;
	Thu, 25 Jan 2024 09:23:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 718A010EB8C
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 09:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706174582; x=1737710582;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=ivsSDfd0zFj/TOtFoyeZWMZUp26EXmnqx4BzqkwnXHI=;
 b=mJ6MphxVRD1+mq1n50NPJtsu7lEh+y+jQN7m02hxx01Nm1wUJxm6c6Ep
 8RerDp+ZxWid5X5mk1JSBa4fkMTcWZyZiptXR+wM5s6YpolsHlm2h7N/j
 TWjJOUM3SxdUpBFvYrcy3XLaGuaHJkJRvc7kQbznn2yu86vbd1+A40IsX
 aiQptIXwaCyjT+f3Ul8dt169FC518/N9fCPBXuzQcYIH3DgoQbbFherWU
 hiUNv03zvYnEbI8G8NiGSgCaKyJwvjzPRB4082nM15ENF/9/xol5N0iEo
 lBmr/M1awe8x5+oJsHqOlk657LGJs8SQkpXym0HnYq54FbVsDkcL/91xm w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="8871208"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="8871208"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 01:23:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="929959704"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="929959704"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.246.3.118])
 ([10.246.3.118])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 01:23:00 -0800
Message-ID: <ad29b231-5201-46d4-b849-7d63c0aada30@linux.intel.com>
Date: Thu, 25 Jan 2024 10:22:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] accel/ivpu fixes for 6.8-rc1
To: dri-devel@lists.freedesktop.org
References: <20240122120945.1150728-1-jacek.lawrynowicz@linux.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240122120945.1150728-1-jacek.lawrynowicz@linux.intel.com>
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

Applied to drm-misc-fixes

On 22.01.2024 13:09, Jacek Lawrynowicz wrote:
> Stability fixes for reset, recovery and unbind.
> 
> Jacek Lawrynowicz (3):
>   accel/ivpu: Fix dev open/close races with unbind
>   accel/ivpu: Improve stability of ivpu_submit_ioctl()
>   accel/ivpu: Improve recovery and reset support
> 
>  drivers/accel/ivpu/ivpu_debugfs.c |  20 +++-
>  drivers/accel/ivpu/ivpu_drv.c     | 110 +++++++++++++--------
>  drivers/accel/ivpu/ivpu_drv.h     |   3 +-
>  drivers/accel/ivpu/ivpu_gem.c     |  18 ++--
>  drivers/accel/ivpu/ivpu_gem.h     |   2 +-
>  drivers/accel/ivpu/ivpu_hw_37xx.c |  14 +--
>  drivers/accel/ivpu/ivpu_hw_40xx.c |   8 +-
>  drivers/accel/ivpu/ivpu_ipc.c     |   6 +-
>  drivers/accel/ivpu/ivpu_job.c     | 157 +++++++++++++-----------------
>  drivers/accel/ivpu/ivpu_job.h     |   3 +-
>  drivers/accel/ivpu/ivpu_mmu.c     |  14 ++-
>  drivers/accel/ivpu/ivpu_pm.c      |  48 ++++++---
>  drivers/accel/ivpu/ivpu_pm.h      |   6 +-
>  13 files changed, 218 insertions(+), 191 deletions(-)
> 
> --
> 2.43.0
