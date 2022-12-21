Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD5D652DDE
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 09:25:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30D6010E00E;
	Wed, 21 Dec 2022 08:25:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B1E210E00E
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 08:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671611133; x=1703147133;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=C8fDUovD/odTwy9ovBmY7X5fveSuSkm5Uo/zeW9/lRg=;
 b=QV1xWRrKnBwLHW6q7QRmESKgaAD2pSI0cwuShiOzR+ZJ/dw5pGuSUecr
 2BsaMaDb10PVPLHBYuE95YELI088kS7PQzVKShzVmqNxSxU985xUTXKQI
 juNjawUU5MzZgEwqS43hn3uH9YbLzEQO1l4r6Y3i4o3N9s2AebNVuuG2r
 YSzUjs79RC4XCNSC8e3JTP6HlODnl67L7wIkmyICLJLyKfmOhh8ZPfjA4
 lk0/l5R8KhcNW5qZ+ysiRcTE9h36QMaF3U6PLRoDOsYkpNSk+9jDHbexd
 /khTbJoNlMDeqHx3xVSaAlHU8T9M01OoM7LIp5HaMQ9Z+bWK+5vO896iW Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="320995652"
X-IronPort-AV: E=Sophos;i="5.96,262,1665471600"; d="scan'208";a="320995652"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 00:25:32 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="719868658"
X-IronPort-AV: E=Sophos;i="5.96,262,1665471600"; d="scan'208";a="719868658"
Received: from gciesiel-mobl.ger.corp.intel.com (HELO [10.249.140.33])
 ([10.249.140.33])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 00:25:30 -0800
Message-ID: <5c4fadd0-c358-0712-6bdf-c640e63d409c@linux.intel.com>
Date: Wed, 21 Dec 2022 09:25:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4 1/7] accel/ivpu: Introduce a new DRM driver for Intel
 VPU
To: Oded Gabbay <oded.gabbay@gmail.com>
References: <20221208110733.5498-1-jacek.lawrynowicz@linux.intel.com>
 <20221208110733.5498-2-jacek.lawrynowicz@linux.intel.com>
 <CAFCwf12rtUk2qEMRS-awzEzX=eKL8+8v79b7sS_s8pTwetn2SA@mail.gmail.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <CAFCwf12rtUk2qEMRS-awzEzX=eKL8+8v79b7sS_s8pTwetn2SA@mail.gmail.com>
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
Cc: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org,
 stanislaw.gruszka@linux.intel.com, tzimmermann@suse.de,
 andrzej.kacprowski@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 20.12.2022 21:17, Oded Gabbay wrote:
> On Thu, Dec 8, 2022 at 1:08 PM Jacek Lawrynowicz
> <jacek.lawrynowicz@linux.intel.com> wrote:
>>
>> VPU stands for Versatile Processing Unit and it's a CPU-integrated
>> inference accelerator for Computer Vision and Deep Learning
>> applications.
>>
>> The VPU device consist of following components:
>>   - Buttress - provides CPU to VPU integration, interrupt, frequency and
>>     power management.
>>   - Memory Management Unit (based on ARM MMU-600) - translates VPU to
>>     host DMA addresses, isolates user workloads.
>>   - RISC based microcontroller - executes firmware that provides job
>>     execution API for the kernel-mode driver
>>   - Neural Compute Subsystem (NCS) - does the actual work, provides
>>     Compute and Copy engines.
>>   - Network on Chip (NoC) - network fabric connecting all the components
>>
>> This driver supports VPU IP v2.7 integrated into Intel Meteor Lake
>> client CPUs (14th generation).
>>
>> Module sources are at drivers/accel/ivpu and module name is
>> "intel_vpu.ko".
>>
>> This patch includes only very besic functionality:
>>   - module, PCI device and IRQ initialization
>>   - register definitions and low level register manipulation functions
>>   - SET/GET_PARAM ioctls
>>   - power up without firmware
>>
>> Co-developed-by: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
>> Signed-off-by: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
>> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>> ---
>>  MAINTAINERS                          |    9 +
>>  drivers/Makefile                     |    1 +
>>  drivers/accel/Kconfig                |    2 +
>>  drivers/accel/Makefile               |    3 +
>>  drivers/accel/ivpu/Kconfig           |   15 +
>>  drivers/accel/ivpu/Makefile          |    8 +
>>  drivers/accel/ivpu/TODO              |    7 +
>>  drivers/accel/ivpu/ivpu_drv.c        |  359 +++++++++
>>  drivers/accel/ivpu/ivpu_drv.h        |  162 ++++
>>  drivers/accel/ivpu/ivpu_hw.h         |  170 +++++
>>  drivers/accel/ivpu/ivpu_hw_mtl.c     | 1048 ++++++++++++++++++++++++++
>>  drivers/accel/ivpu/ivpu_hw_mtl_reg.h |  280 +++++++
>>  drivers/accel/ivpu/ivpu_hw_reg_io.h  |  115 +++
>>  include/uapi/drm/ivpu_drm.h          |   95 +++
>>  14 files changed, 2274 insertions(+)
> 
> Another thing I would like to ask you to do is to rename ivpu_drm.h to
> ivpu_accel.h to make it clear this is an accel uapi file and not a
> classic drm driver uapi file.
> i.e. to make it clear it exposes the accel device char nodes, sysfs, etc.
> 
> But leave it in include/uapi/drm, because we might still need drm.h
> down the road.
> 

Sure, I will rename it.

Regards,
Jacek

