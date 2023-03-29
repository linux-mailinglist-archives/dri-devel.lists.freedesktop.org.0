Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB96F6CDAC1
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 15:27:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D069810E091;
	Wed, 29 Mar 2023 13:27:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBDB610E091
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 13:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680096418; x=1711632418;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=m6FLnDpgkhlXNUMmZtqLdiaUxH+Hm0aC8mTZPwF4soE=;
 b=OfXE+dY5fVZ0Izj+wTJBq6WyXLRA213dEjzZSbxumMRJV6aVA3PhIk6r
 WcQ15Bn/ld7ACLOI/I5VPu+3pga1Gd3W00//Pr61s0KN9QvBPTlBlZRdY
 y+rI+EQLWNPxlyz24C0iVRTbpySqp/kuZjW3tcqWk1A6SFSrk87HCInmK
 kC8HCAN1EGy+R/hr/s+ocn3H2acHlyGgikrSCiRQdGVEdJD6pWfWrEJUi
 bUeHHvX8v3wZ2faYUYQYZSoCNTQLttxKzXXpSnV+jwWuBzA2xfYgw2QO7
 Nl2kDlTdD7UzaoXUOF+BcfanE8mnD8Fi0db5fSl0NWpeuhgdOU+m0X+f4 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="324778086"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; d="scan'208";a="324778086"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2023 06:26:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="930323217"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; d="scan'208";a="930323217"
Received: from jabolger-mobl2.ger.corp.intel.com (HELO [10.213.199.158])
 ([10.213.199.158])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2023 06:26:56 -0700
Message-ID: <80f5338a-30de-86fe-d316-25d3c4e357fa@linux.intel.com>
Date: Wed, 29 Mar 2023 14:26:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [pull] drm: dma-fence-deadline-core for v6.4
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@gmail.com>
References: <CAF6AEGvoP9_FERdL6U8S2O-BVt-oAUgAytbE6RvygsoAOwOHvw@mail.gmail.com>
 <ZCMhhToEdWVAEtBh@phenom.ffwll.local>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <ZCMhhToEdWVAEtBh@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>, dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 28/03/2023 18:19, Daniel Vetter wrote:
> On Sat, Mar 25, 2023 at 11:24:56AM -0700, Rob Clark wrote:
>> Hi Dave and Daniel,
>>
>> Here is the series for dma-fence deadline hint, without driver
>> specific patches, with the intent that it can be merged into drm-next
>> as well as -driver next trees to enable landing driver specific
>> support through their corresponding -next trees.
>>
>> The following changes since commit eeac8ede17557680855031c6f305ece2378af326:
>>
>>    Linux 6.3-rc2 (2023-03-12 16:36:44 -0700)
>>
>> are available in the Git repository at:
>>
>>    https://gitlab.freedesktop.org/drm/msm.git tags/dma-fence-deadline-core
>>
>> for you to fetch changes up to 0bcc8f52a8d9d1f9cd5af7f88c6599a89e64284a:
>>
>>    drm/atomic-helper: Set fence deadline for vblank (2023-03-25 10:55:08 -0700)
> 
> Ok apparently there's only igts for the sync_file uabi and the only only
> userspace for syncobj is the mesa mr that is still under discussion :-/
> 
> Yes I know there's a clearly established need for something like this, but
> also in drm we don't merge conjectured uabi. Especially with tricky stuff
> that's meant to improve best effort performance/tuning problems, where you
> really have to benchmark the entire thing and make sure you didn't screw
> up some interaction.

Would we consider bypassing any ABI concerns by going with my proposal* 
for the wait boost specific case?

Regards,

Tvrtko

*) https://patchwork.freedesktop.org/series/113846/


> 
> To make sure this isn't stuck another full cycle, is there a way to wittle
> this just down to the kms atomic flip boosting parts? That way we could at
> least start landing the core&driver bits ...
> -Daniel
> 
>>
>> ----------------------------------------------------------------
>> Immutable branch with dma-fence deadline hint support between drm-next
>> and driver -next trees.
>>
>> ----------------------------------------------------------------
>> Rob Clark (11):
>>        dma-buf/dma-fence: Add deadline awareness
>>        dma-buf/fence-array: Add fence deadline support
>>        dma-buf/fence-chain: Add fence deadline support
>>        dma-buf/dma-resv: Add a way to set fence deadline
>>        dma-buf/sync_file: Surface sync-file uABI
>>        dma-buf/sync_file: Add SET_DEADLINE ioctl
>>        dma-buf/sw_sync: Add fence deadline support
>>        drm/scheduler: Add fence deadline support
>>        drm/syncobj: Add deadline support for syncobj waits
>>        drm/vblank: Add helper to get next vblank time
>>        drm/atomic-helper: Set fence deadline for vblank
>>
>>   Documentation/driver-api/dma-buf.rst    | 16 ++++++-
>>   drivers/dma-buf/dma-fence-array.c       | 11 +++++
>>   drivers/dma-buf/dma-fence-chain.c       | 12 +++++
>>   drivers/dma-buf/dma-fence.c             | 60 ++++++++++++++++++++++++
>>   drivers/dma-buf/dma-resv.c              | 22 +++++++++
>>   drivers/dma-buf/sw_sync.c               | 81 +++++++++++++++++++++++++++++++++
>>   drivers/dma-buf/sync_debug.h            |  2 +
>>   drivers/dma-buf/sync_file.c             | 19 ++++++++
>>   drivers/gpu/drm/drm_atomic_helper.c     | 37 +++++++++++++++
>>   drivers/gpu/drm/drm_syncobj.c           | 64 ++++++++++++++++++++------
>>   drivers/gpu/drm/drm_vblank.c            | 53 +++++++++++++++++----
>>   drivers/gpu/drm/scheduler/sched_fence.c | 46 +++++++++++++++++++
>>   drivers/gpu/drm/scheduler/sched_main.c  |  2 +-
>>   include/drm/drm_vblank.h                |  1 +
>>   include/drm/gpu_scheduler.h             | 17 +++++++
>>   include/linux/dma-fence.h               | 22 +++++++++
>>   include/linux/dma-resv.h                |  2 +
>>   include/uapi/drm/drm.h                  | 17 +++++++
>>   include/uapi/linux/sync_file.h          | 59 +++++++++++++++---------
>>   19 files changed, 496 insertions(+), 47 deletions(-)
> 
