Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4027F48E4
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 15:26:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33EBE10E64F;
	Wed, 22 Nov 2023 14:26:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4685710E638;
 Wed, 22 Nov 2023 14:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700663159; x=1732199159;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=UtfFo94nHksKdeyVJfivT8Hzljx/knRk3tA7qKFy6Fk=;
 b=VCYK3dxsO0fefQBI8l3LxVkh7odBc8Nh+1R/aqKQyQpVEAh3HbCbvzfs
 ytIB1hdxtGQi5BMgoj4W000HlWiTmwXLKM16sN6RiXJkWiDnIAoera1AC
 TSesUbU32nZbgo+s/cGIScJIwajuxnW/MYUrVNgHeghQWowWiXIgEAnEk
 PAcFCdmY0PnZ7Mr/g91uVmTt9662H4sipeGtaHETAkOizpr471U4McfWU
 R7Z/fOhF65DtLgbS/XYM1Iisl2WghHq6U+WrUmiGbC2udOiCewhIXnCjo
 UlgoMow/YEUY+1X8A00Ev8YOPCL9x/1NBYdPzzPVhONcv514UXkyaTY5v A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="5257149"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="5257149"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 06:25:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="833030505"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="833030505"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 06:25:54 -0800
Message-ID: <91981447-c593-40f6-8fd3-bfd43b66ca10@linux.intel.com>
Date: Wed, 22 Nov 2023 19:58:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 0/5] Proposal to use netlink for RAS and Telemetry across
 drm subsystem
To: Tomer Tayar <ttayar@habana.ai>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>,
 "Hawking.Zhang@amd.com" <Hawking.Zhang@amd.com>,
 "Harish.Kasiviswanathan@amd.com" <Harish.Kasiviswanathan@amd.com>,
 "Felix.Kuehling@amd.com" <Felix.Kuehling@amd.com>,
 "Luben.Tuikov@amd.com" <Luben.Tuikov@amd.com>,
 "Ruhl, Michael J" <michael.j.ruhl@intel.com>
References: <20231020155835.1295524-1-aravind.iddamsetty@linux.intel.com>
 <69388e16-a57e-4611-a276-d4035d637c73@habana.ai>
Content-Language: en-US
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <69388e16-a57e-4611-a276-d4035d637c73@habana.ai>
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


On 11/10/23 17:53, Tomer Tayar wrote:
> On 20/10/2023 18:58, Aravind Iddamsetty wrote:
>> Our hardware supports RAS(Reliability, Availability, Serviceability) by
>> reporting the errors to the host, which the KMD processes and exposes a
>> set of error counters which can be used by observability tools to take
>> corrective actions or repairs. Traditionally there were being exposed
>> via PMU (for relative counters) and sysfs interface (for absolute
>> value) in our internal branch. But, due to the limitations in this
>> approach to use two interfaces and also not able to have an event based
>> reporting or configurability, an alternative approach to try netlink
>> was suggested by community for drm subsystem wide UAPI for RAS and
>> telemetry as discussed in [1].
>>
>> This [1] is the inspiration to this series. It uses the generic
>> netlink(genl) family subsystem and exposes a set of commands that can
>> be used by every drm driver, the framework provides a means to have
>> custom commands too. Each drm driver instance in this example xe driver
>> instance registers a family and operations to the genl subsystem through
>> which it enumerates and reports the error counters. An event based
>> notification is also supported to which userpace can subscribe to and
>> be notified when any error occurs and read the error counter this avoids
>> continuous polling on error counter. This can also be extended to
>> threshold based notification.
> Hi Aravind,

Hi Tomer,

sorry for the late response been sick for a while.

>
> I can see that the "nomenclature" in the patch series is mainly around 
> errors.
> When we refer to RAS can't be other non-error values which might be 
> relevant, e.g. statistics, status/state, etc.?
Yes RAS in general involves only error handling and their associated
counters but not any other stats or status.


Thanks,
Aravind.
>
> Thanks,
> Tomer
>
>> [1]: https://airlied.blogspot.com/2022/09/accelerators-bof-outcomes-summary.html
>>
>> this series is on top of https://patchwork.freedesktop.org/series/125373/,
>>
>> v4:
>> 1. Rebase
>> 2. rename drm_genl_send to drm_genl_reply
>> 3. catch error from xa_store and handle appropriately
>> 4. presently xe_list_errors fills blank data for IGFX, prevent it by
>> having an early check of IS_DGFX (Michael J. Ruhl)
>>
>> v3:
>> 1. Rebase on latest RAS series for XE
>> 2. drop DRIVER_NETLINK flag and use the driver_genl_ops structure to
>> register to netlink subsystem
>>
>> v2: define common interfaces to genl netlink subsystem that all drm drivers
>> can leverage.
>>
>> Below is an example tool drm_ras which demonstrates the use of the
>> supported commands. The tool will be sent to ML with the subject
>> "[RFC i-g-t v2 0/1] A tool to demonstrate use of netlink sockets to read RAS error counters"
>> https://patchwork.freedesktop.org/series/118437/#rev2
>>
>> read single error counter:
>>
>> $ ./drm_ras READ_ONE --device=drm:/dev/dri/card1 --error_id=0x0000000000000005
>> counter value 0
>>
>> read all error counters:
>>
>> $ ./drm_ras READ_ALL --device=drm:/dev/dri/card1
>> name                                                    config-id               counter
>>
>> error-gt0-correctable-guc                               0x0000000000000001      0
>> error-gt0-correctable-slm                               0x0000000000000003      0
>> error-gt0-correctable-eu-ic                             0x0000000000000004      0
>> error-gt0-correctable-eu-grf                            0x0000000000000005      0
>> error-gt0-fatal-guc                                     0x0000000000000009      0
>> error-gt0-fatal-slm                                     0x000000000000000d      0
>> error-gt0-fatal-eu-grf                                  0x000000000000000f      0
>> error-gt0-fatal-fpu                                     0x0000000000000010      0
>> error-gt0-fatal-tlb                                     0x0000000000000011      0
>> error-gt0-fatal-l3-fabric                               0x0000000000000012      0
>> error-gt0-correctable-subslice                          0x0000000000000013      0
>> error-gt0-correctable-l3bank                            0x0000000000000014      0
>> error-gt0-fatal-subslice                                0x0000000000000015      0
>> error-gt0-fatal-l3bank                                  0x0000000000000016      0
>> error-gt0-sgunit-correctable                            0x0000000000000017      0
>> error-gt0-sgunit-nonfatal                               0x0000000000000018      0
>> error-gt0-sgunit-fatal                                  0x0000000000000019      0
>> error-gt0-soc-fatal-psf-csc-0                           0x000000000000001a      0
>> error-gt0-soc-fatal-psf-csc-1                           0x000000000000001b      0
>> error-gt0-soc-fatal-psf-csc-2                           0x000000000000001c      0
>> error-gt0-soc-fatal-punit                               0x000000000000001d      0
>> error-gt0-soc-fatal-psf-0                               0x000000000000001e      0
>> error-gt0-soc-fatal-psf-1                               0x000000000000001f      0
>> error-gt0-soc-fatal-psf-2                               0x0000000000000020      0
>> error-gt0-soc-fatal-cd0                                 0x0000000000000021      0
>> error-gt0-soc-fatal-cd0-mdfi                            0x0000000000000022      0
>> error-gt0-soc-fatal-mdfi-east                           0x0000000000000023      0
>> error-gt0-soc-fatal-mdfi-south                          0x0000000000000024      0
>> error-gt0-soc-fatal-hbm-ss0-0                           0x0000000000000025      0
>> error-gt0-soc-fatal-hbm-ss0-1                           0x0000000000000026      0
>> error-gt0-soc-fatal-hbm-ss0-2                           0x0000000000000027      0
>> error-gt0-soc-fatal-hbm-ss0-3                           0x0000000000000028      0
>> error-gt0-soc-fatal-hbm-ss0-4                           0x0000000000000029      0
>> error-gt0-soc-fatal-hbm-ss0-5                           0x000000000000002a      0
>> error-gt0-soc-fatal-hbm-ss0-6                           0x000000000000002b      0
>> error-gt0-soc-fatal-hbm-ss0-7                           0x000000000000002c      0
>> error-gt0-soc-fatal-hbm-ss1-0                           0x000000000000002d      0
>> error-gt0-soc-fatal-hbm-ss1-1                           0x000000000000002e      0
>> error-gt0-soc-fatal-hbm-ss1-2                           0x000000000000002f      0
>> error-gt0-soc-fatal-hbm-ss1-3                           0x0000000000000030      0
>> error-gt0-soc-fatal-hbm-ss1-4                           0x0000000000000031      0
>> error-gt0-soc-fatal-hbm-ss1-5                           0x0000000000000032      0
>> error-gt0-soc-fatal-hbm-ss1-6                           0x0000000000000033      0
>> error-gt0-soc-fatal-hbm-ss1-7                           0x0000000000000034      0
>> error-gt0-soc-fatal-hbm-ss2-0                           0x0000000000000035      0
>> error-gt0-soc-fatal-hbm-ss2-1                           0x0000000000000036      0
>> error-gt0-soc-fatal-hbm-ss2-2                           0x0000000000000037      0
>> error-gt0-soc-fatal-hbm-ss2-3                           0x0000000000000038      0
>> error-gt0-soc-fatal-hbm-ss2-4                           0x0000000000000039      0
>> error-gt0-soc-fatal-hbm-ss2-5                           0x000000000000003a      0
>> error-gt0-soc-fatal-hbm-ss2-6                           0x000000000000003b      0
>> error-gt0-soc-fatal-hbm-ss2-7                           0x000000000000003c      0
>> error-gt0-soc-fatal-hbm-ss3-0                           0x000000000000003d      0
>> error-gt0-soc-fatal-hbm-ss3-1                           0x000000000000003e      0
>> error-gt0-soc-fatal-hbm-ss3-2                           0x000000000000003f      0
>> error-gt0-soc-fatal-hbm-ss3-3                           0x0000000000000040      0
>> error-gt0-soc-fatal-hbm-ss3-4                           0x0000000000000041      0
>> error-gt0-soc-fatal-hbm-ss3-5                           0x0000000000000042      0
>> error-gt0-soc-fatal-hbm-ss3-6                           0x0000000000000043      0
>> error-gt0-soc-fatal-hbm-ss3-7                           0x0000000000000044      0
>> error-gt0-gsc-correctable-sram-ecc                      0x0000000000000045      0
>> error-gt0-gsc-nonfatal-mia-shutdown                     0x0000000000000046      0
>> error-gt0-gsc-nonfatal-mia-int                          0x0000000000000047      0
>> error-gt0-gsc-nonfatal-sram-ecc                         0x0000000000000048      0
>> error-gt0-gsc-nonfatal-wdg-timeout                      0x0000000000000049      0
>> error-gt0-gsc-nonfatal-rom-parity                       0x000000000000004a      0
>> error-gt0-gsc-nonfatal-ucode-parity                     0x000000000000004b      0
>> error-gt0-gsc-nonfatal-glitch-det                       0x000000000000004c      0
>> error-gt0-gsc-nonfatal-fuse-pull                        0x000000000000004d      0
>> error-gt0-gsc-nonfatal-fuse-crc-check                   0x000000000000004e      0
>> error-gt0-gsc-nonfatal-selfmbist                        0x000000000000004f      0
>> error-gt0-gsc-nonfatal-aon-parity                       0x0000000000000050      0
>> error-gt1-correctable-guc                               0x1000000000000001      0
>> error-gt1-correctable-slm                               0x1000000000000003      0
>> error-gt1-correctable-eu-ic                             0x1000000000000004      0
>> error-gt1-correctable-eu-grf                            0x1000000000000005      0
>> error-gt1-fatal-guc                                     0x1000000000000009      0
>> error-gt1-fatal-slm                                     0x100000000000000d      0
>> error-gt1-fatal-eu-grf                                  0x100000000000000f      0
>> error-gt1-fatal-fpu                                     0x1000000000000010      0
>> error-gt1-fatal-tlb                                     0x1000000000000011      0
>> error-gt1-fatal-l3-fabric                               0x1000000000000012      0
>> error-gt1-correctable-subslice                          0x1000000000000013      0
>> error-gt1-correctable-l3bank                            0x1000000000000014      0
>> error-gt1-fatal-subslice                                0x1000000000000015      0
>> error-gt1-fatal-l3bank                                  0x1000000000000016      0
>> error-gt1-sgunit-correctable                            0x1000000000000017      0
>> error-gt1-sgunit-nonfatal                               0x1000000000000018      0
>> error-gt1-sgunit-fatal                                  0x1000000000000019      0
>> error-gt1-soc-fatal-psf-csc-0                           0x100000000000001a      0
>> error-gt1-soc-fatal-psf-csc-1                           0x100000000000001b      0
>> error-gt1-soc-fatal-psf-csc-2                           0x100000000000001c      0
>> error-gt1-soc-fatal-punit                               0x100000000000001d      0
>> error-gt1-soc-fatal-psf-0                               0x100000000000001e      0
>> error-gt1-soc-fatal-psf-1                               0x100000000000001f      0
>> error-gt1-soc-fatal-psf-2                               0x1000000000000020      0
>> error-gt1-soc-fatal-cd0                                 0x1000000000000021      0
>> error-gt1-soc-fatal-cd0-mdfi                            0x1000000000000022      0
>> error-gt1-soc-fatal-mdfi-east                           0x1000000000000023      0
>> error-gt1-soc-fatal-mdfi-south                          0x1000000000000024      0
>> error-gt1-soc-fatal-hbm-ss0-0                           0x1000000000000025      0
>> error-gt1-soc-fatal-hbm-ss0-1                           0x1000000000000026      0
>> error-gt1-soc-fatal-hbm-ss0-2                           0x1000000000000027      0
>> error-gt1-soc-fatal-hbm-ss0-3                           0x1000000000000028      0
>> error-gt1-soc-fatal-hbm-ss0-4                           0x1000000000000029      0
>> error-gt1-soc-fatal-hbm-ss0-5                           0x100000000000002a      0
>> error-gt1-soc-fatal-hbm-ss0-6                           0x100000000000002b      0
>> error-gt1-soc-fatal-hbm-ss0-7                           0x100000000000002c      0
>> error-gt1-soc-fatal-hbm-ss1-0                           0x100000000000002d      0
>> error-gt1-soc-fatal-hbm-ss1-1                           0x100000000000002e      0
>> error-gt1-soc-fatal-hbm-ss1-2                           0x100000000000002f      0
>> error-gt1-soc-fatal-hbm-ss1-3                           0x1000000000000030      0
>> error-gt1-soc-fatal-hbm-ss1-4                           0x1000000000000031      0
>> error-gt1-soc-fatal-hbm-ss1-5                           0x1000000000000032      0
>> error-gt1-soc-fatal-hbm-ss1-6                           0x1000000000000033      0
>> error-gt1-soc-fatal-hbm-ss1-7                           0x1000000000000034      0
>> error-gt1-soc-fatal-hbm-ss2-0                           0x1000000000000035      0
>> error-gt1-soc-fatal-hbm-ss2-1                           0x1000000000000036      0
>> error-gt1-soc-fatal-hbm-ss2-2                           0x1000000000000037      0
>> error-gt1-soc-fatal-hbm-ss2-3                           0x1000000000000038      0
>> error-gt1-soc-fatal-hbm-ss2-4                           0x1000000000000039      0
>> error-gt1-soc-fatal-hbm-ss2-5                           0x100000000000003a      0
>> error-gt1-soc-fatal-hbm-ss2-6                           0x100000000000003b      0
>> error-gt1-soc-fatal-hbm-ss2-7                           0x100000000000003c      0
>> error-gt1-soc-fatal-hbm-ss3-0                           0x100000000000003d      0
>> error-gt1-soc-fatal-hbm-ss3-1                           0x100000000000003e      0
>> error-gt1-soc-fatal-hbm-ss3-2                           0x100000000000003f      0
>> error-gt1-soc-fatal-hbm-ss3-3                           0x1000000000000040      0
>> error-gt1-soc-fatal-hbm-ss3-4                           0x1000000000000041      0
>> error-gt1-soc-fatal-hbm-ss3-5                           0x1000000000000042      0
>> error-gt1-soc-fatal-hbm-ss3-6                           0x1000000000000043      0
>> error-gt1-soc-fatal-hbm-ss3-7                           0x1000000000000044      0
>>
>> wait on a error event:
>>
>> $ ./drm_ras WAIT_ON_EVENT --device=drm:/dev/dri/card1
>> waiting for error event
>> error event received
>> counter value 0
>>
>> list all errors:
>>
>> $ ./drm_ras LIST_ERRORS --device=drm:/dev/dri/card1
>> name                                                    config-id
>>
>> error-gt0-correctable-guc                               0x0000000000000001
>> error-gt0-correctable-slm                               0x0000000000000003
>> error-gt0-correctable-eu-ic                             0x0000000000000004
>> error-gt0-correctable-eu-grf                            0x0000000000000005
>> error-gt0-fatal-guc                                     0x0000000000000009
>> error-gt0-fatal-slm                                     0x000000000000000d
>> error-gt0-fatal-eu-grf                                  0x000000000000000f
>> error-gt0-fatal-fpu                                     0x0000000000000010
>> error-gt0-fatal-tlb                                     0x0000000000000011
>> error-gt0-fatal-l3-fabric                               0x0000000000000012
>> error-gt0-correctable-subslice                          0x0000000000000013
>> error-gt0-correctable-l3bank                            0x0000000000000014
>> error-gt0-fatal-subslice                                0x0000000000000015
>> error-gt0-fatal-l3bank                                  0x0000000000000016
>> error-gt0-sgunit-correctable                            0x0000000000000017
>> error-gt0-sgunit-nonfatal                               0x0000000000000018
>> error-gt0-sgunit-fatal                                  0x0000000000000019
>> error-gt0-soc-fatal-psf-csc-0                           0x000000000000001a
>> error-gt0-soc-fatal-psf-csc-1                           0x000000000000001b
>> error-gt0-soc-fatal-psf-csc-2                           0x000000000000001c
>> error-gt0-soc-fatal-punit                               0x000000000000001d
>> error-gt0-soc-fatal-psf-0                               0x000000000000001e
>> error-gt0-soc-fatal-psf-1                               0x000000000000001f
>> error-gt0-soc-fatal-psf-2                               0x0000000000000020
>> error-gt0-soc-fatal-cd0                                 0x0000000000000021
>> error-gt0-soc-fatal-cd0-mdfi                            0x0000000000000022
>> error-gt0-soc-fatal-mdfi-east                           0x0000000000000023
>> error-gt0-soc-fatal-mdfi-south                          0x0000000000000024
>> error-gt0-soc-fatal-hbm-ss0-0                           0x0000000000000025
>> error-gt0-soc-fatal-hbm-ss0-1                           0x0000000000000026
>> error-gt0-soc-fatal-hbm-ss0-2                           0x0000000000000027
>> error-gt0-soc-fatal-hbm-ss0-3                           0x0000000000000028
>> error-gt0-soc-fatal-hbm-ss0-4                           0x0000000000000029
>> error-gt0-soc-fatal-hbm-ss0-5                           0x000000000000002a
>> error-gt0-soc-fatal-hbm-ss0-6                           0x000000000000002b
>> error-gt0-soc-fatal-hbm-ss0-7                           0x000000000000002c
>> error-gt0-soc-fatal-hbm-ss1-0                           0x000000000000002d
>> error-gt0-soc-fatal-hbm-ss1-1                           0x000000000000002e
>> error-gt0-soc-fatal-hbm-ss1-2                           0x000000000000002f
>> error-gt0-soc-fatal-hbm-ss1-3                           0x0000000000000030
>> error-gt0-soc-fatal-hbm-ss1-4                           0x0000000000000031
>> error-gt0-soc-fatal-hbm-ss1-5                           0x0000000000000032
>> error-gt0-soc-fatal-hbm-ss1-6                           0x0000000000000033
>> error-gt0-soc-fatal-hbm-ss1-7                           0x0000000000000034
>> error-gt0-soc-fatal-hbm-ss2-0                           0x0000000000000035
>> error-gt0-soc-fatal-hbm-ss2-1                           0x0000000000000036
>> error-gt0-soc-fatal-hbm-ss2-2                           0x0000000000000037
>> error-gt0-soc-fatal-hbm-ss2-3                           0x0000000000000038
>> error-gt0-soc-fatal-hbm-ss2-4                           0x0000000000000039
>> error-gt0-soc-fatal-hbm-ss2-5                           0x000000000000003a
>> error-gt0-soc-fatal-hbm-ss2-6                           0x000000000000003b
>> error-gt0-soc-fatal-hbm-ss2-7                           0x000000000000003c
>> error-gt0-soc-fatal-hbm-ss3-0                           0x000000000000003d
>> error-gt0-soc-fatal-hbm-ss3-1                           0x000000000000003e
>> error-gt0-soc-fatal-hbm-ss3-2                           0x000000000000003f
>> error-gt0-soc-fatal-hbm-ss3-3                           0x0000000000000040
>> error-gt0-soc-fatal-hbm-ss3-4                           0x0000000000000041
>> error-gt0-soc-fatal-hbm-ss3-5                           0x0000000000000042
>> error-gt0-soc-fatal-hbm-ss3-6                           0x0000000000000043
>> error-gt0-soc-fatal-hbm-ss3-7                           0x0000000000000044
>> error-gt0-gsc-correctable-sram-ecc                      0x0000000000000045
>> error-gt0-gsc-nonfatal-mia-shutdown                     0x0000000000000046
>> error-gt0-gsc-nonfatal-mia-int                          0x0000000000000047
>> error-gt0-gsc-nonfatal-sram-ecc                         0x0000000000000048
>> error-gt0-gsc-nonfatal-wdg-timeout                      0x0000000000000049
>> error-gt0-gsc-nonfatal-rom-parity                       0x000000000000004a
>> error-gt0-gsc-nonfatal-ucode-parity                     0x000000000000004b
>> error-gt0-gsc-nonfatal-glitch-det                       0x000000000000004c
>> error-gt0-gsc-nonfatal-fuse-pull                        0x000000000000004d
>> error-gt0-gsc-nonfatal-fuse-crc-check                   0x000000000000004e
>> error-gt0-gsc-nonfatal-selfmbist                        0x000000000000004f
>> error-gt0-gsc-nonfatal-aon-parity                       0x0000000000000050
>> error-gt1-correctable-guc                               0x1000000000000001
>> error-gt1-correctable-slm                               0x1000000000000003
>> error-gt1-correctable-eu-ic                             0x1000000000000004
>> error-gt1-correctable-eu-grf                            0x1000000000000005
>> error-gt1-fatal-guc                                     0x1000000000000009
>> error-gt1-fatal-slm                                     0x100000000000000d
>> error-gt1-fatal-eu-grf                                  0x100000000000000f
>> error-gt1-fatal-fpu                                     0x1000000000000010
>> error-gt1-fatal-tlb                                     0x1000000000000011
>> error-gt1-fatal-l3-fabric                               0x1000000000000012
>> error-gt1-correctable-subslice                          0x1000000000000013
>> error-gt1-correctable-l3bank                            0x1000000000000014
>> error-gt1-fatal-subslice                                0x1000000000000015
>> error-gt1-fatal-l3bank                                  0x1000000000000016
>> error-gt1-sgunit-correctable                            0x1000000000000017
>> error-gt1-sgunit-nonfatal                               0x1000000000000018
>> error-gt1-sgunit-fatal                                  0x1000000000000019
>> error-gt1-soc-fatal-psf-csc-0                           0x100000000000001a
>> error-gt1-soc-fatal-psf-csc-1                           0x100000000000001b
>> error-gt1-soc-fatal-psf-csc-2                           0x100000000000001c
>> error-gt1-soc-fatal-punit                               0x100000000000001d
>> error-gt1-soc-fatal-psf-0                               0x100000000000001e
>> error-gt1-soc-fatal-psf-1                               0x100000000000001f
>> error-gt1-soc-fatal-psf-2                               0x1000000000000020
>> error-gt1-soc-fatal-cd0                                 0x1000000000000021
>> error-gt1-soc-fatal-cd0-mdfi                            0x1000000000000022
>> error-gt1-soc-fatal-mdfi-east                           0x1000000000000023
>> error-gt1-soc-fatal-mdfi-south                          0x1000000000000024
>> error-gt1-soc-fatal-hbm-ss0-0                           0x1000000000000025
>> error-gt1-soc-fatal-hbm-ss0-1                           0x1000000000000026
>> error-gt1-soc-fatal-hbm-ss0-2                           0x1000000000000027
>> error-gt1-soc-fatal-hbm-ss0-3                           0x1000000000000028
>> error-gt1-soc-fatal-hbm-ss0-4                           0x1000000000000029
>> error-gt1-soc-fatal-hbm-ss0-5                           0x100000000000002a
>> error-gt1-soc-fatal-hbm-ss0-6                           0x100000000000002b
>> error-gt1-soc-fatal-hbm-ss0-7                           0x100000000000002c
>> error-gt1-soc-fatal-hbm-ss1-0                           0x100000000000002d
>> error-gt1-soc-fatal-hbm-ss1-1                           0x100000000000002e
>> error-gt1-soc-fatal-hbm-ss1-2                           0x100000000000002f
>> error-gt1-soc-fatal-hbm-ss1-3                           0x1000000000000030
>> error-gt1-soc-fatal-hbm-ss1-4                           0x1000000000000031
>> error-gt1-soc-fatal-hbm-ss1-5                           0x1000000000000032
>> error-gt1-soc-fatal-hbm-ss1-6                           0x1000000000000033
>> error-gt1-soc-fatal-hbm-ss1-7                           0x1000000000000034
>> error-gt1-soc-fatal-hbm-ss2-0                           0x1000000000000035
>> error-gt1-soc-fatal-hbm-ss2-1                           0x1000000000000036
>> error-gt1-soc-fatal-hbm-ss2-2                           0x1000000000000037
>> error-gt1-soc-fatal-hbm-ss2-3                           0x1000000000000038
>> error-gt1-soc-fatal-hbm-ss2-4                           0x1000000000000039
>> error-gt1-soc-fatal-hbm-ss2-5                           0x100000000000003a
>> error-gt1-soc-fatal-hbm-ss2-6                           0x100000000000003b
>> error-gt1-soc-fatal-hbm-ss2-7                           0x100000000000003c
>> error-gt1-soc-fatal-hbm-ss3-0                           0x100000000000003d
>> error-gt1-soc-fatal-hbm-ss3-1                           0x100000000000003e
>> error-gt1-soc-fatal-hbm-ss3-2                           0x100000000000003f
>> error-gt1-soc-fatal-hbm-ss3-3                           0x1000000000000040
>> error-gt1-soc-fatal-hbm-ss3-4                           0x1000000000000041
>> error-gt1-soc-fatal-hbm-ss3-5                           0x1000000000000042
>> error-gt1-soc-fatal-hbm-ss3-6                           0x1000000000000043
>> error-gt1-soc-fatal-hbm-ss3-7                           0x1000000000000044
>>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>> Cc: Oded Gabbay <ogabbay@kernel.org>
>> Cc: Tomer Tayar <ttayar@habana.ai>
>> Cc: Hawking Zhang <Hawking.Zhang@amd.com>
>> Cc: Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>
>> Cc: Kuehling Felix <Felix.Kuehling@amd.com>
>> Cc: Tuikov Luben <Luben.Tuikov@amd.com>
>> Cc: Ruhl, Michael J <michael.j.ruhl@intel.com>
>>
>>
>> Aravind Iddamsetty (5):
>>    drm/netlink: Add netlink infrastructure
>>    drm/xe/RAS: Register netlink capability
>>    drm/xe/RAS: Expose the error counters
>>    drm/netlink: Define multicast groups
>>    drm/xe/RAS: send multicast event on occurrence of an error
>>
>>   drivers/gpu/drm/Makefile             |   1 +
>>   drivers/gpu/drm/drm_drv.c            |   7 +
>>   drivers/gpu/drm/drm_netlink.c        | 195 ++++++++++
>>   drivers/gpu/drm/xe/Makefile          |   1 +
>>   drivers/gpu/drm/xe/xe_device.c       |   4 +
>>   drivers/gpu/drm/xe/xe_device_types.h |   1 +
>>   drivers/gpu/drm/xe/xe_hw_error.c     |  33 ++
>>   drivers/gpu/drm/xe/xe_netlink.c      | 517 +++++++++++++++++++++++++++
>>   include/drm/drm_device.h             |   8 +
>>   include/drm/drm_drv.h                |   7 +
>>   include/drm/drm_netlink.h            |  35 ++
>>   include/uapi/drm/drm_netlink.h       |  87 +++++
>>   include/uapi/drm/xe_drm.h            |  81 +++++
>>   13 files changed, 977 insertions(+)
>>   create mode 100644 drivers/gpu/drm/drm_netlink.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_netlink.c
>>   create mode 100644 include/drm/drm_netlink.h
>>   create mode 100644 include/uapi/drm/drm_netlink.h
>>
