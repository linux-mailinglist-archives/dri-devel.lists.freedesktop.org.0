Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34545B352CD
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 06:42:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59BEE10E5BC;
	Tue, 26 Aug 2025 04:42:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fj3c2Jz0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 820F210E2CC;
 Tue, 26 Aug 2025 04:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756183335; x=1787719335;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=j80c9KrBS0eJq9QuyoUvCfu/0iAZd03T2Afb5yHpNOE=;
 b=Fj3c2Jz0bOJGo59iQa2I8RtBWooyb+AQaznETHqW+YvurTJJ9C3rxPJO
 OBAwdYSo+4OvBIG2r2NO9Lg57hAx/uYa00OsO9MIyGjtPR6HGTUNxKc5i
 EhtHjVzCXjeLmUrl72uZ3yEwAUTD4ZcGj+7+xOt9qJel+wB2tBvontcyX
 4aXG7QU8ll1ebEiEHb4hgW3sMw4Q22Jo6UlPBoKpGSRppINepg1Wjoglx
 cZvT/WzCyiAUKr7naLz5EYjd49m+FfOXvPqYvZTL86Fif5GsIF0wIIVNq
 IUVB1y3PqM5+S0/GYFFBL2L8EoDRIGgsa0LYAVzl9W/rz+XOUdYcPsNZm A==;
X-CSE-ConnectionGUID: hjxHpsV4SKCnDo1EzfbrMQ==
X-CSE-MsgGUID: TQ2IClvRQkiFxxYio+U44A==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="57608554"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="57608554"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 21:42:15 -0700
X-CSE-ConnectionGUID: 6P+FmAzsR8Cq6mlr7/MzvQ==
X-CSE-MsgGUID: ZMbbQUeARZWz6k1oaTnuxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="206632239"
Received: from aiddamse-mobl3.gar.corp.intel.com (HELO [10.247.150.174])
 ([10.247.150.174])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 21:42:11 -0700
Message-ID: <7eb3441d-0c78-4842-901c-8b1812660fa0@linux.intel.com>
Date: Tue, 26 Aug 2025 10:12:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v5 0/5] Proposal to use netlink for RAS and Telemetry across
 drm subsystem
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Dave Airlie <airlied@gmail.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Simona Vetter <simona@ffwll.ch>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Michael J <michael.j.ruhl@intel.com>, Riana Tauro <riana.tauro@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>
References: <20250730064956.1385855-1-aravind.iddamsetty@linux.intel.com>
 <aJzzr-ZuJCrd8r7x@intel.com> <aJ-lctLF0f745Pyu@intel.com>
Content-Language: en-US
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <aJ-lctLF0f745Pyu@intel.com>
Content-Type: text/plain; charset=UTF-8
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


On 16-08-2025 02:54, Rodrigo Vivi wrote:
> On Wed, Aug 13, 2025 at 04:21:03PM -0400, Rodrigo Vivi wrote:
>> On Wed, Jul 30, 2025 at 12:19:51PM +0530, Aravind Iddamsetty wrote:
>>> Revisiting this patch series to address pending feedback and help move
>>> the discussion towards a conclusion. This revision includes updates
>>> based on previous comments[1] and aims to clarify outstanding concerns.
>>> Specifically added command to facility reporting errors from IP blocks
>>> to support AMDGPU driver model of RAS.
>>> [1]: https://lore.kernel.org/all/4cbdfcc5-5020-a942-740e-a602d4c00cc2@linux.intel.com/
>>>
>>> I sincerely appreciate everyones patience and thoughtful reviews so
>>> far, and I hope this refreshed series facilitates the final evaluation
>>> and acceptance.
>>>
>>> Please feel free to share any further suggestions or questions.
>>>
>>> Thank you for your continued consideration.
>>> ----------------------------------------------------------------------
>>>
>>> Our hardware supports RAS(Reliability, Availability, Serviceability) by
>>> reporting the errors to the host, which the KMD processes and exposes a
>>> set of error counters which can be used by observability tools to take 
>>> corrective actions or repairs. Traditionally there were being exposed 
>>> via PMU (for relative counters) and sysfs interface (for absolute 
>>> value) in our internal branch. But, due to the limitations in this 
>>> approach to use two interfaces and also not able to have an event based 
>>> reporting or configurability, an alternative approach to try netlink 
>>> was suggested by community for drm subsystem wide UAPI for RAS and 
>>> telemetry as discussed in [2]. 
>>>
>>> This [2] is the inspiration to this series. It uses the generic
>>> netlink(genl) family subsystem and exposes a set of commands that can
>>> be used by every drm driver, the framework provides a means to have
>>> custom commands too. Each drm driver instance in this example xe driver
>>> instance registers a family and operations to the genl subsystem through
>>> which it enumerates and reports the error counters. An event based
>>> notification is also supported to which userpace can subscribe to and
>>> be notified when any error occurs and read the error counter this avoids
>>> continuous polling on error counter. This can also be extended to
>>> threshold based notification.
>>>
>>> [2]: https://airlied.blogspot.com/2022/09/accelerators-bof-outcomes-summary.html
>> I'm bringing some thoughts below and I'd like to get inputs from folks involved
>> in the original discussions here please.
>> Any thought is welcomed so we can move faster towards a real GPU standard RAS
>> solution.
>>
>>> This series is on top [3] series which introduces error counting infra in Xe
>>> driver.
>>> [3]: https://lore.kernel.org/all/20250730054814.1376770-1-aravind.iddamsetty@linux.intel.com/
>>>
>>> V5:
>>> Add support to read error corresponding to an IP BLOCK
>> I honestly don't believe that this version solves all the concerns raised by
>> AMD folks in the previous reviews. It is true that this is bringing ways of
>> reading errors per IP block, but if I understood them correctly, they would
>> like better (and separate) ways to declare and handle the errors coming from
>> different IP block, rather than simply reading/querying for them filtered out.
>>
>> So, I have som grouping ideas below.
>>
>>> v4:
>>> 1. Rebase
>>> 2. rename drm_genl_send to drm_genl_reply
>> But before going to the ideas below I'd like to also raise the naming issue
>> that I see with this proposal.
>>
>> I was recently running some experiments to devlink with this and similar
>> cases. I don't believe that devlink is a good fit for our drm-ras. It is
>> way too much centric on network devices and any addition there to our
>> GPU RAS would be a heavy lift. But, there are some good things from there
>> that we could perhaps get inspiration from.
>>
>> Starting from the name. devlink is the name of the tool and the name
>> of the framework. It uses netlink on the back, but totally abstracting
>> that. Here in this version we can see:
>> drm_ras: the tool
>> drm_netlink: the abstraction
>> drm_genl_*: the wrapper?
>>
>> So, I believe that as devlink we should have a single name for everything
>> and avoid wrappers but providing the real module registration, with
>> groups, and functions. Entirely abstracting the netlink and focusing
>> on the RAS functionalities.
>>
>> I'm terrible with naming, but playing a bit with AI for some suggestions,
>> I'd say that my favorites are:
>> drmras - no '_' like most of the tools, but not only for the tool, but also for
>> the files and functions.
>> drmlink - more link, but less ras :/
>> grill - GPU RAS Interface Link Layer
>>
>> For the rest of the examples below I'm going with grill, but let me know your
>> preferences.
>>
>>> 3. catch error from xa_store and handle appropriately
>>> 4. presently xe_list_errors fills blank data for IGFX, prevent it by
>>> having an early check of IS_DGFX (Michael J. Ruhl)
>>>
>>> v3:
>>> 1. Rebase on latest RAS series for XE
>>> 2. drop DRIVER_NETLINK flag and use the driver_genl_ops structure to
>>> register to netlink subsystem
>>>
>>> v2: define common interfaces to genl netlink subsystem that all drm drivers
>>> can leverage.
>>>
>>> Below is an example tool drm_ras which demonstrates the use of the
>>> supported commands. The tool will be sent to ML with the subject
>>> "[RFC i-g-t v3 0/1] A tool to demonstrate use of netlink sockets to read RAS error counters"
>>> https://lore.kernel.org/all/20250730061342.1380217-2-aravind.iddamsetty@linux.intel.com/
>>>
>>> read single error counter:
>>>
>>> $ ./drm_ras READ_ONE --device=drm:/dev/dri/card1 --error_id=0x0000000000000005
>>> counter value 0
>> no need for --device, that should be mandatory argument.
>> And we could accept BDF or card identification
>>
>> $ grill list
>> 00:03:00.0 - card0 - xe
>>
>> $ grill 00:03:00.0 list # Querying available modules.
>> monitor - global
>> erros - gt
>> erros - soc
>>
>> Yes, my idea is that driver should be able to register modules and group per module
> Please allow me to emphasize here that the group registration
> is just to make this extensible and also to accommodate the AMD case,
> but not change the original essence of the goal which is to
> create the drm-ras solution.
I'm not sure if i correctly understood the group reservation you are
referring too.
Like i mentioned earlier the AMD's request is not register a group of IP
as a separate
netlink family but rather have the ability to present the errors at IP
block level
with the commands this series proposes.

IIUC the modules have different functionalities,I believe having them as
a separate 
netlink family might be an overkill, I believe we can support them as
commands, 
looking at devlink too flash update, health are all commands they are not
registered as separate family.
>
>> GRILL would be designed to accommodate multiple kinds of RAS modules, each module,
>> with groups, categories and operations.
> also let me take back on the naming here.
>
> Please let's go with the obvious drm_ras.
>
> Perhaps drm_ras for the code here and drmras (one-word) for the IGT tool.
>
>> Modules: monitor, error, flash?!, etc?!
> Here, please let me also tune it down a bit. The overall goal continue
> to be the creation of our drm-ras framework using netlink to report
> error counters and events.
>
> Any addition is a good-to-have, but shouldn't delay the main goal.
> Also, any addition should be carefully reviewed individually in the
> future. My only wish here at this moment is to think from the very
> beginning in something that is expansible.
agree, but as you mentioned let's focus on error reporting and get it
going as
we are designing it we can plan to make it extensible to any future
requirements.

Thanks,
Aravind.
>
> Thanks,
> Rodrigo.
>
>> Groups: Global or per IP block depending on the HW underneath
>> Categories: Sub-groups like correctable-error vs uncorrectable-error for instance if/where
>> 	    it makes sense.
>> Operations: Monitor: set-threshold / listen (listen is just a tool operation, but every monitor
>> 	    needs to provide events over netlink)
>> 	    Error: read, clear, logs
>>
>>
>> $ grill 00:03:00.0 error global counter list
>> # List all available counters in this gpu
>>
>> $ grill 00:03:00.0 error global counter show soc_fatal_hbm2_chnl0
>> # Show a specific counter.
>>
>> $ grill 00:03:00.0 error global log
>> # Print all the stashed CPER logs (stash can be hw/fw/sw or a combination -
>>   	    		     	   in AMD case it is a dump of their debugfs ring)
>>
>>
>> So, I'm sure the next question is what if the log is global, but the counters
>> are not? Well, perhaps we should have different Modules for error-counter
>> split from error-logging ?!
>>
>> So yes, my thoughts still have some opens, but I'd like to hear your thoughts
>> and opinions on the overall idea here.
>>
>> Thanks in advance,
>> Rodrigo.
>>
>>> read all error counters:
>>>
>>> $ ./drm_ras READ_ALL --device=drm:/dev/dri/card1
>>> name                                                    config-id               counter
>>>
>>> error-gt0-correctable-guc                               0x0000000000000001      0
>>> error-gt0-correctable-slm                               0x0000000000000003      0
>>> error-gt0-correctable-eu-ic                             0x0000000000000004      0
>>> error-gt0-correctable-eu-grf                            0x0000000000000005      0
>>> error-gt0-fatal-guc                                     0x0000000000000009      0
>>> error-gt0-fatal-slm                                     0x000000000000000d      0
>>> error-gt0-fatal-eu-grf                                  0x000000000000000f      0
>>> error-gt0-fatal-fpu                                     0x0000000000000010      0
>>> error-gt0-fatal-tlb                                     0x0000000000000011      0
>>> error-gt0-fatal-l3-fabric                               0x0000000000000012      0
>>> error-gt0-correctable-subslice                          0x0000000000000013      0
>>> error-gt0-correctable-l3bank                            0x0000000000000014      0
>>> error-gt0-fatal-subslice                                0x0000000000000015      0
>>> error-gt0-fatal-l3bank                                  0x0000000000000016      0
>>> error-gt0-sgunit-correctable                            0x0000000000000017      0
>>> error-gt0-sgunit-nonfatal                               0x0000000000000018      0
>>> error-gt0-sgunit-fatal                                  0x0000000000000019      0
>>> error-gt0-soc-fatal-psf-csc-0                           0x000000000000001a      0
>>> error-gt0-soc-fatal-psf-csc-1                           0x000000000000001b      0
>>> error-gt0-soc-fatal-psf-csc-2                           0x000000000000001c      0
>>> error-gt0-soc-fatal-punit                               0x000000000000001d      0
>>> error-gt0-soc-fatal-psf-0                               0x000000000000001e      0
>>> error-gt0-soc-fatal-psf-1                               0x000000000000001f      0
>>> error-gt0-soc-fatal-psf-2                               0x0000000000000020      0
>>> error-gt0-soc-fatal-cd0                                 0x0000000000000021      0
>>> error-gt0-soc-fatal-cd0-mdfi                            0x0000000000000022      0
>>> error-gt0-soc-fatal-mdfi-east                           0x0000000000000023      0
>>> error-gt0-soc-fatal-mdfi-south                          0x0000000000000024      0
>>> error-gt0-soc-fatal-hbm-ss0-0                           0x0000000000000025      0
>>> error-gt0-soc-fatal-hbm-ss0-1                           0x0000000000000026      0
>>> error-gt0-soc-fatal-hbm-ss0-2                           0x0000000000000027      0
>>> error-gt0-soc-fatal-hbm-ss0-3                           0x0000000000000028      0
>>> error-gt0-soc-fatal-hbm-ss0-4                           0x0000000000000029      0
>>> error-gt0-soc-fatal-hbm-ss0-5                           0x000000000000002a      0
>>> error-gt0-soc-fatal-hbm-ss0-6                           0x000000000000002b      0
>>> error-gt0-soc-fatal-hbm-ss0-7                           0x000000000000002c      0
>>> error-gt0-soc-fatal-hbm-ss1-0                           0x000000000000002d      0
>>> error-gt0-soc-fatal-hbm-ss1-1                           0x000000000000002e      0
>>> error-gt0-soc-fatal-hbm-ss1-2                           0x000000000000002f      0
>>> error-gt0-soc-fatal-hbm-ss1-3                           0x0000000000000030      0
>>> error-gt0-soc-fatal-hbm-ss1-4                           0x0000000000000031      0
>>> error-gt0-soc-fatal-hbm-ss1-5                           0x0000000000000032      0
>>> error-gt0-soc-fatal-hbm-ss1-6                           0x0000000000000033      0
>>> error-gt0-soc-fatal-hbm-ss1-7                           0x0000000000000034      0
>>> error-gt0-soc-fatal-hbm-ss2-0                           0x0000000000000035      0
>>> error-gt0-soc-fatal-hbm-ss2-1                           0x0000000000000036      0
>>> error-gt0-soc-fatal-hbm-ss2-2                           0x0000000000000037      0
>>> error-gt0-soc-fatal-hbm-ss2-3                           0x0000000000000038      0
>>> error-gt0-soc-fatal-hbm-ss2-4                           0x0000000000000039      0
>>> error-gt0-soc-fatal-hbm-ss2-5                           0x000000000000003a      0
>>> error-gt0-soc-fatal-hbm-ss2-6                           0x000000000000003b      0
>>> error-gt0-soc-fatal-hbm-ss2-7                           0x000000000000003c      0
>>> error-gt0-soc-fatal-hbm-ss3-0                           0x000000000000003d      0
>>> error-gt0-soc-fatal-hbm-ss3-1                           0x000000000000003e      0
>>> error-gt0-soc-fatal-hbm-ss3-2                           0x000000000000003f      0
>>> error-gt0-soc-fatal-hbm-ss3-3                           0x0000000000000040      0
>>> error-gt0-soc-fatal-hbm-ss3-4                           0x0000000000000041      0
>>> error-gt0-soc-fatal-hbm-ss3-5                           0x0000000000000042      0
>>> error-gt0-soc-fatal-hbm-ss3-6                           0x0000000000000043      0
>>> error-gt0-soc-fatal-hbm-ss3-7                           0x0000000000000044      0
>>> error-gt0-gsc-correctable-sram-ecc                      0x0000000000000045      0
>>> error-gt0-gsc-nonfatal-mia-shutdown                     0x0000000000000046      0
>>> error-gt0-gsc-nonfatal-mia-int                          0x0000000000000047      0
>>> error-gt0-gsc-nonfatal-sram-ecc                         0x0000000000000048      0
>>> error-gt0-gsc-nonfatal-wdg-timeout                      0x0000000000000049      0
>>> error-gt0-gsc-nonfatal-rom-parity                       0x000000000000004a      0
>>> error-gt0-gsc-nonfatal-ucode-parity                     0x000000000000004b      0
>>> error-gt0-gsc-nonfatal-glitch-det                       0x000000000000004c      0
>>> error-gt0-gsc-nonfatal-fuse-pull                        0x000000000000004d      0
>>> error-gt0-gsc-nonfatal-fuse-crc-check                   0x000000000000004e      0
>>> error-gt0-gsc-nonfatal-selfmbist                        0x000000000000004f      0
>>> error-gt0-gsc-nonfatal-aon-parity                       0x0000000000000050      0
>>> error-gt1-correctable-guc                               0x1000000000000001      0
>>> error-gt1-correctable-slm                               0x1000000000000003      0
>>> error-gt1-correctable-eu-ic                             0x1000000000000004      0
>>> error-gt1-correctable-eu-grf                            0x1000000000000005      0
>>> error-gt1-fatal-guc                                     0x1000000000000009      0
>>> error-gt1-fatal-slm                                     0x100000000000000d      0
>>> error-gt1-fatal-eu-grf                                  0x100000000000000f      0
>>> error-gt1-fatal-fpu                                     0x1000000000000010      0
>>> error-gt1-fatal-tlb                                     0x1000000000000011      0
>>> error-gt1-fatal-l3-fabric                               0x1000000000000012      0
>>> error-gt1-correctable-subslice                          0x1000000000000013      0
>>> error-gt1-correctable-l3bank                            0x1000000000000014      0
>>> error-gt1-fatal-subslice                                0x1000000000000015      0
>>> error-gt1-fatal-l3bank                                  0x1000000000000016      0
>>> error-gt1-sgunit-correctable                            0x1000000000000017      0
>>> error-gt1-sgunit-nonfatal                               0x1000000000000018      0
>>> error-gt1-sgunit-fatal                                  0x1000000000000019      0
>>> error-gt1-soc-fatal-psf-csc-0                           0x100000000000001a      0
>>> error-gt1-soc-fatal-psf-csc-1                           0x100000000000001b      0
>>> error-gt1-soc-fatal-psf-csc-2                           0x100000000000001c      0
>>> error-gt1-soc-fatal-punit                               0x100000000000001d      0
>>> error-gt1-soc-fatal-psf-0                               0x100000000000001e      0
>>> error-gt1-soc-fatal-psf-1                               0x100000000000001f      0
>>> error-gt1-soc-fatal-psf-2                               0x1000000000000020      0
>>> error-gt1-soc-fatal-cd0                                 0x1000000000000021      0
>>> error-gt1-soc-fatal-cd0-mdfi                            0x1000000000000022      0
>>> error-gt1-soc-fatal-mdfi-east                           0x1000000000000023      0
>>> error-gt1-soc-fatal-mdfi-south                          0x1000000000000024      0
>>> error-gt1-soc-fatal-hbm-ss0-0                           0x1000000000000025      0
>>> error-gt1-soc-fatal-hbm-ss0-1                           0x1000000000000026      0
>>> error-gt1-soc-fatal-hbm-ss0-2                           0x1000000000000027      0
>>> error-gt1-soc-fatal-hbm-ss0-3                           0x1000000000000028      0
>>> error-gt1-soc-fatal-hbm-ss0-4                           0x1000000000000029      0
>>> error-gt1-soc-fatal-hbm-ss0-5                           0x100000000000002a      0
>>> error-gt1-soc-fatal-hbm-ss0-6                           0x100000000000002b      0
>>> error-gt1-soc-fatal-hbm-ss0-7                           0x100000000000002c      0
>>> error-gt1-soc-fatal-hbm-ss1-0                           0x100000000000002d      0
>>> error-gt1-soc-fatal-hbm-ss1-1                           0x100000000000002e      0
>>> error-gt1-soc-fatal-hbm-ss1-2                           0x100000000000002f      0
>>> error-gt1-soc-fatal-hbm-ss1-3                           0x1000000000000030      0
>>> error-gt1-soc-fatal-hbm-ss1-4                           0x1000000000000031      0
>>> error-gt1-soc-fatal-hbm-ss1-5                           0x1000000000000032      0
>>> error-gt1-soc-fatal-hbm-ss1-6                           0x1000000000000033      0
>>> error-gt1-soc-fatal-hbm-ss1-7                           0x1000000000000034      0
>>> error-gt1-soc-fatal-hbm-ss2-0                           0x1000000000000035      0
>>> error-gt1-soc-fatal-hbm-ss2-1                           0x1000000000000036      0
>>> error-gt1-soc-fatal-hbm-ss2-2                           0x1000000000000037      0
>>> error-gt1-soc-fatal-hbm-ss2-3                           0x1000000000000038      0
>>> error-gt1-soc-fatal-hbm-ss2-4                           0x1000000000000039      0
>>> error-gt1-soc-fatal-hbm-ss2-5                           0x100000000000003a      0
>>> error-gt1-soc-fatal-hbm-ss2-6                           0x100000000000003b      0
>>> error-gt1-soc-fatal-hbm-ss2-7                           0x100000000000003c      0
>>> error-gt1-soc-fatal-hbm-ss3-0                           0x100000000000003d      0
>>> error-gt1-soc-fatal-hbm-ss3-1                           0x100000000000003e      0
>>> error-gt1-soc-fatal-hbm-ss3-2                           0x100000000000003f      0
>>> error-gt1-soc-fatal-hbm-ss3-3                           0x1000000000000040      0
>>> error-gt1-soc-fatal-hbm-ss3-4                           0x1000000000000041      0
>>> error-gt1-soc-fatal-hbm-ss3-5                           0x1000000000000042      0
>>> error-gt1-soc-fatal-hbm-ss3-6                           0x1000000000000043      0
>>> error-gt1-soc-fatal-hbm-ss3-7                           0x1000000000000044      0
>>>
>>> wait on a error event:
>>>
>>> $ ./drm_ras WAIT_ON_EVENT --device=drm:/dev/dri/card1
>>> waiting for error event
>>> error event received
>>> counter value 0
>>>
>>> list all errors:
>>>
>>> $ ./drm_ras LIST_ERRORS --device=drm:/dev/dri/card1
>>> name                                                    config-id
>>>
>>> error-gt0-correctable-guc                               0x0000000000000001
>>> error-gt0-correctable-slm                               0x0000000000000003
>>> error-gt0-correctable-eu-ic                             0x0000000000000004
>>> error-gt0-correctable-eu-grf                            0x0000000000000005
>>> error-gt0-fatal-guc                                     0x0000000000000009
>>> error-gt0-fatal-slm                                     0x000000000000000d
>>> error-gt0-fatal-eu-grf                                  0x000000000000000f
>>> error-gt0-fatal-fpu                                     0x0000000000000010
>>> error-gt0-fatal-tlb                                     0x0000000000000011
>>> error-gt0-fatal-l3-fabric                               0x0000000000000012
>>> error-gt0-correctable-subslice                          0x0000000000000013
>>> error-gt0-correctable-l3bank                            0x0000000000000014
>>> error-gt0-fatal-subslice                                0x0000000000000015
>>> error-gt0-fatal-l3bank                                  0x0000000000000016
>>> error-gt0-sgunit-correctable                            0x0000000000000017
>>> error-gt0-sgunit-nonfatal                               0x0000000000000018
>>> error-gt0-sgunit-fatal                                  0x0000000000000019
>>> error-gt0-soc-fatal-psf-csc-0                           0x000000000000001a
>>> error-gt0-soc-fatal-psf-csc-1                           0x000000000000001b
>>> error-gt0-soc-fatal-psf-csc-2                           0x000000000000001c
>>> error-gt0-soc-fatal-punit                               0x000000000000001d
>>> error-gt0-soc-fatal-psf-0                               0x000000000000001e
>>> error-gt0-soc-fatal-psf-1                               0x000000000000001f
>>> error-gt0-soc-fatal-psf-2                               0x0000000000000020
>>> error-gt0-soc-fatal-cd0                                 0x0000000000000021
>>> error-gt0-soc-fatal-cd0-mdfi                            0x0000000000000022
>>> error-gt0-soc-fatal-mdfi-east                           0x0000000000000023
>>> error-gt0-soc-fatal-mdfi-south                          0x0000000000000024
>>> error-gt0-soc-fatal-hbm-ss0-0                           0x0000000000000025
>>> error-gt0-soc-fatal-hbm-ss0-1                           0x0000000000000026
>>> error-gt0-soc-fatal-hbm-ss0-2                           0x0000000000000027
>>> error-gt0-soc-fatal-hbm-ss0-3                           0x0000000000000028
>>> error-gt0-soc-fatal-hbm-ss0-4                           0x0000000000000029
>>> error-gt0-soc-fatal-hbm-ss0-5                           0x000000000000002a
>>> error-gt0-soc-fatal-hbm-ss0-6                           0x000000000000002b
>>> error-gt0-soc-fatal-hbm-ss0-7                           0x000000000000002c
>>> error-gt0-soc-fatal-hbm-ss1-0                           0x000000000000002d
>>> error-gt0-soc-fatal-hbm-ss1-1                           0x000000000000002e
>>> error-gt0-soc-fatal-hbm-ss1-2                           0x000000000000002f
>>> error-gt0-soc-fatal-hbm-ss1-3                           0x0000000000000030
>>> error-gt0-soc-fatal-hbm-ss1-4                           0x0000000000000031
>>> error-gt0-soc-fatal-hbm-ss1-5                           0x0000000000000032
>>> error-gt0-soc-fatal-hbm-ss1-6                           0x0000000000000033
>>> error-gt0-soc-fatal-hbm-ss1-7                           0x0000000000000034
>>> error-gt0-soc-fatal-hbm-ss2-0                           0x0000000000000035
>>> error-gt0-soc-fatal-hbm-ss2-1                           0x0000000000000036
>>> error-gt0-soc-fatal-hbm-ss2-2                           0x0000000000000037
>>> error-gt0-soc-fatal-hbm-ss2-3                           0x0000000000000038
>>> error-gt0-soc-fatal-hbm-ss2-4                           0x0000000000000039
>>> error-gt0-soc-fatal-hbm-ss2-5                           0x000000000000003a
>>> error-gt0-soc-fatal-hbm-ss2-6                           0x000000000000003b
>>> error-gt0-soc-fatal-hbm-ss2-7                           0x000000000000003c
>>> error-gt0-soc-fatal-hbm-ss3-0                           0x000000000000003d
>>> error-gt0-soc-fatal-hbm-ss3-1                           0x000000000000003e
>>> error-gt0-soc-fatal-hbm-ss3-2                           0x000000000000003f
>>> error-gt0-soc-fatal-hbm-ss3-3                           0x0000000000000040
>>> error-gt0-soc-fatal-hbm-ss3-4                           0x0000000000000041
>>> error-gt0-soc-fatal-hbm-ss3-5                           0x0000000000000042
>>> error-gt0-soc-fatal-hbm-ss3-6                           0x0000000000000043
>>> error-gt0-soc-fatal-hbm-ss3-7                           0x0000000000000044
>>> error-gt0-gsc-correctable-sram-ecc                      0x0000000000000045
>>> error-gt0-gsc-nonfatal-mia-shutdown                     0x0000000000000046
>>> error-gt0-gsc-nonfatal-mia-int                          0x0000000000000047
>>> error-gt0-gsc-nonfatal-sram-ecc                         0x0000000000000048
>>> error-gt0-gsc-nonfatal-wdg-timeout                      0x0000000000000049
>>> error-gt0-gsc-nonfatal-rom-parity                       0x000000000000004a
>>> error-gt0-gsc-nonfatal-ucode-parity                     0x000000000000004b
>>> error-gt0-gsc-nonfatal-glitch-det                       0x000000000000004c
>>> error-gt0-gsc-nonfatal-fuse-pull                        0x000000000000004d
>>> error-gt0-gsc-nonfatal-fuse-crc-check                   0x000000000000004e
>>> error-gt0-gsc-nonfatal-selfmbist                        0x000000000000004f
>>> error-gt0-gsc-nonfatal-aon-parity                       0x0000000000000050
>>> error-gt1-correctable-guc                               0x1000000000000001
>>> error-gt1-correctable-slm                               0x1000000000000003
>>> error-gt1-correctable-eu-ic                             0x1000000000000004
>>> error-gt1-correctable-eu-grf                            0x1000000000000005
>>> error-gt1-fatal-guc                                     0x1000000000000009
>>> error-gt1-fatal-slm                                     0x100000000000000d
>>> error-gt1-fatal-eu-grf                                  0x100000000000000f
>>> error-gt1-fatal-fpu                                     0x1000000000000010
>>> error-gt1-fatal-tlb                                     0x1000000000000011
>>> error-gt1-fatal-l3-fabric                               0x1000000000000012
>>> error-gt1-correctable-subslice                          0x1000000000000013
>>> error-gt1-correctable-l3bank                            0x1000000000000014
>>> error-gt1-fatal-subslice                                0x1000000000000015
>>> error-gt1-fatal-l3bank                                  0x1000000000000016
>>> error-gt1-sgunit-correctable                            0x1000000000000017
>>> error-gt1-sgunit-nonfatal                               0x1000000000000018
>>> error-gt1-sgunit-fatal                                  0x1000000000000019
>>> error-gt1-soc-fatal-psf-csc-0                           0x100000000000001a
>>> error-gt1-soc-fatal-psf-csc-1                           0x100000000000001b
>>> error-gt1-soc-fatal-psf-csc-2                           0x100000000000001c
>>> error-gt1-soc-fatal-punit                               0x100000000000001d
>>> error-gt1-soc-fatal-psf-0                               0x100000000000001e
>>> error-gt1-soc-fatal-psf-1                               0x100000000000001f
>>> error-gt1-soc-fatal-psf-2                               0x1000000000000020
>>> error-gt1-soc-fatal-cd0                                 0x1000000000000021
>>> error-gt1-soc-fatal-cd0-mdfi                            0x1000000000000022
>>> error-gt1-soc-fatal-mdfi-east                           0x1000000000000023
>>> error-gt1-soc-fatal-mdfi-south                          0x1000000000000024
>>> error-gt1-soc-fatal-hbm-ss0-0                           0x1000000000000025
>>> error-gt1-soc-fatal-hbm-ss0-1                           0x1000000000000026
>>> error-gt1-soc-fatal-hbm-ss0-2                           0x1000000000000027
>>> error-gt1-soc-fatal-hbm-ss0-3                           0x1000000000000028
>>> error-gt1-soc-fatal-hbm-ss0-4                           0x1000000000000029
>>> error-gt1-soc-fatal-hbm-ss0-5                           0x100000000000002a
>>> error-gt1-soc-fatal-hbm-ss0-6                           0x100000000000002b
>>> error-gt1-soc-fatal-hbm-ss0-7                           0x100000000000002c
>>> error-gt1-soc-fatal-hbm-ss1-0                           0x100000000000002d
>>> error-gt1-soc-fatal-hbm-ss1-1                           0x100000000000002e
>>> error-gt1-soc-fatal-hbm-ss1-2                           0x100000000000002f
>>> error-gt1-soc-fatal-hbm-ss1-3                           0x1000000000000030
>>> error-gt1-soc-fatal-hbm-ss1-4                           0x1000000000000031
>>> error-gt1-soc-fatal-hbm-ss1-5                           0x1000000000000032
>>> error-gt1-soc-fatal-hbm-ss1-6                           0x1000000000000033
>>> error-gt1-soc-fatal-hbm-ss1-7                           0x1000000000000034
>>> error-gt1-soc-fatal-hbm-ss2-0                           0x1000000000000035
>>> error-gt1-soc-fatal-hbm-ss2-1                           0x1000000000000036
>>> error-gt1-soc-fatal-hbm-ss2-2                           0x1000000000000037
>>> error-gt1-soc-fatal-hbm-ss2-3                           0x1000000000000038
>>> error-gt1-soc-fatal-hbm-ss2-4                           0x1000000000000039
>>> error-gt1-soc-fatal-hbm-ss2-5                           0x100000000000003a
>>> error-gt1-soc-fatal-hbm-ss2-6                           0x100000000000003b
>>> error-gt1-soc-fatal-hbm-ss2-7                           0x100000000000003c
>>> error-gt1-soc-fatal-hbm-ss3-0                           0x100000000000003d
>>> error-gt1-soc-fatal-hbm-ss3-1                           0x100000000000003e
>>> error-gt1-soc-fatal-hbm-ss3-2                           0x100000000000003f
>>> error-gt1-soc-fatal-hbm-ss3-3                           0x1000000000000040
>>> error-gt1-soc-fatal-hbm-ss3-4                           0x1000000000000041
>>> error-gt1-soc-fatal-hbm-ss3-5                           0x1000000000000042
>>> error-gt1-soc-fatal-hbm-ss3-6                           0x1000000000000043
>>> error-gt1-soc-fatal-hbm-ss3-7                           0x1000000000000044
>>>
>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>> Cc: David Airlie <airlied@gmail.com>
>>> Cc: Simona Vetter <simona@ffwll.ch>
>>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Cc: Hawking Zhang <Hawking.Zhang@amd.com>
>>> Cc: Lijo Lazar <lijo.lazar@amd.com>
>>> Cc: Ruhl, Michael J <michael.j.ruhl@intel.com>
>>> Cc: Riana Tauro <riana.tauro@intel.com>
>>> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
>>>
>>>
>>> Aravind Iddamsetty (5):
>>>   drm/netlink: Add netlink infrastructure
>>>   drm/xe/RAS: Register netlink capability
>>>   drm/xe/RAS: Expose the error counters
>>>   drm/netlink: Define multicast groups
>>>   drm/xe/RAS: send multicast event on occurrence of an error
>>>
>>>  drivers/gpu/drm/Makefile             |   1 +
>>>  drivers/gpu/drm/drm_drv.c            |   7 +
>>>  drivers/gpu/drm/drm_netlink.c        | 219 +++++++++++
>>>  drivers/gpu/drm/xe/Makefile          |   2 +
>>>  drivers/gpu/drm/xe/xe_device.c       |   6 +
>>>  drivers/gpu/drm/xe/xe_device_types.h |   1 +
>>>  drivers/gpu/drm/xe/xe_hw_error.c     |  56 ++-
>>>  drivers/gpu/drm/xe/xe_netlink.c      | 531 +++++++++++++++++++++++++++
>>>  include/drm/drm_device.h             |  10 +
>>>  include/drm/drm_drv.h                |   7 +
>>>  include/drm/drm_netlink.h            |  46 +++
>>>  include/uapi/drm/drm_netlink.h       | 105 ++++++
>>>  include/uapi/drm/xe_drm.h            |  85 +++++
>>>  13 files changed, 1071 insertions(+), 5 deletions(-)
>>>  create mode 100644 drivers/gpu/drm/drm_netlink.c
>>>  create mode 100644 drivers/gpu/drm/xe/xe_netlink.c
>>>  create mode 100644 include/drm/drm_netlink.h
>>>  create mode 100644 include/uapi/drm/drm_netlink.h
>>>
>>> -- 
>>> 2.25.1
>>>
