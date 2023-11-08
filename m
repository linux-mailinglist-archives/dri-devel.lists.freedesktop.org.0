Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA857E5297
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 10:21:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE59110E0A6;
	Wed,  8 Nov 2023 09:21:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 303A310E041;
 Wed,  8 Nov 2023 09:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699435274; x=1730971274;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=IvD7vYyWG1/FJJRInSvltyrswxyYVr1pwf6NK8bbuwI=;
 b=I8aXdB+ANmeFB8K4jvUCw2SkH2uDXVdkbiUD9QepjdlUmNSUm/KQTgkR
 8DWu7ZX8ASlrjD4VRMS+xfXlRJ96jnhe5Hvg6UbrDAsqHKDd9dqH0iEps
 vitwKtDZUevM1MJbr8CLNJa7TkSs+VbFWdGY4iLhsxfaLqKwVhSwp7P73
 gpwDaAjSL1ng8sJMFjcQCdUi2eYcTH8MtLD95euAi8oscv9+n8XmMIPti
 Ik4PdVuwLhbL/U4qs1GFFZW29iZoViidjmqb/E0Imc9hqg0+2svoUevJc
 FW0CXJKmNEc9ntXYqi4RG0reGKzHxFAOJ7nep4fMCKpUwLPOosu07CreI A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="475954213"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; d="scan'208";a="475954213"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2023 01:21:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="756499010"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; d="scan'208";a="756499010"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2023 01:21:07 -0800
Message-ID: <4cbdfcc5-5020-a942-740e-a602d4c00cc2@linux.intel.com>
Date: Wed, 8 Nov 2023 14:54:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC v4 0/5] Proposal to use netlink for RAS and Telemetry across
 drm subsystem
Content-Language: en-US
To: "Lazar, Lijo" <lijo.lazar@amd.com>, Alex Deucher <alexdeucher@gmail.com>
References: <20231020155835.1295524-1-aravind.iddamsetty@linux.intel.com>
 <CADnq5_PLfTg6hBpSHLND9FF-B++D=BMXQKSJQknOxy8y=Qz-ZA@mail.gmail.com>
 <7b3d3e43-57f7-9a56-14e3-75d6df6dc004@amd.com>
 <2caad369-360e-44f3-a375-d69027e3e6b9@linux.intel.com>
 <04d5878f-c129-8979-87ff-0046560e2dcd@amd.com>
 <124d13ae-c5e7-41c5-43fa-9bde9802fbb8@linux.intel.com>
 <aa23f0ef-a4ab-ca73-5ab3-ef23d6e36e89@amd.com>
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <aa23f0ef-a4ab-ca73-5ab3-ef23d6e36e89@amd.com>
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
Cc: ogabbay@kernel.org, Harish.Kasiviswanathan@amd.com,
 dri-devel@lists.freedesktop.org, michael.j.ruhl@intel.com,
 Luben.Tuikov@amd.com, ttayar@habana.ai, alexander.deucher@amd.com,
 Felix.Kuehling@amd.com, intel-xe@lists.freedesktop.org, Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 07/11/23 11:00, Lazar, Lijo wrote:
>
>
> On 11/1/2023 1:36 PM, Aravind Iddamsetty wrote:
>>
>> On 30/10/23 20:41, Lazar, Lijo wrote:
>>>
>>>
>>> On 10/30/2023 11:49 AM, Aravind Iddamsetty wrote:
>>>>
>>>> On 26/10/23 15:34, Lazar, Lijo wrote:
>>>>
>>>> Hi Lijo,
>>>>
>>>> Thank you for your comments.
>>>>
>>>>>
>>>>>
>>>>> On 10/23/2023 8:59 PM, Alex Deucher wrote:
>>>>>> On Fri, Oct 20, 2023 at 7:42 PM Aravind Iddamsetty
>>>>>> <aravind.iddamsetty@linux.intel.com> wrote:
>>>>>>>
>>>>>>> Our hardware supports RAS(Reliability, Availability, Serviceability) by
>>>>>>> reporting the errors to the host, which the KMD processes and exposes a
>>>>>>> set of error counters which can be used by observability tools to take
>>>>>>> corrective actions or repairs. Traditionally there were being exposed
>>>>>>> via PMU (for relative counters) and sysfs interface (for absolute
>>>>>>> value) in our internal branch. But, due to the limitations in this
>>>>>>> approach to use two interfaces and also not able to have an event based
>>>>>>> reporting or configurability, an alternative approach to try netlink
>>>>>>> was suggested by community for drm subsystem wide UAPI for RAS and
>>>>>>> telemetry as discussed in [1].
>>>>>>>
>>>>>>> This [1] is the inspiration to this series. It uses the generic
>>>>>>> netlink(genl) family subsystem and exposes a set of commands that can
>>>>>>> be used by every drm driver, the framework provides a means to have
>>>>>>> custom commands too. Each drm driver instance in this example xe driver
>>>>>>> instance registers a family and operations to the genl subsystem through
>>>>>>> which it enumerates and reports the error counters. An event based
>>>>>>> notification is also supported to which userpace can subscribe to and
>>>>>>> be notified when any error occurs and read the error counter this avoids
>>>>>>> continuous polling on error counter. This can also be extended to
>>>>>>> threshold based notification.
>>>>>
>>>>> The commands used seems very limited. In AMD SOCs, IP blocks, instances of IP blocks, block types which support RAS will change across generations.
>>>>>
>>>>> This series has a single command to query the counters supported. Within that it seems to assign unique ids for every combination of error type, IP block type and then another for each instance. Not sure how good this kind of approach is for an end user. The Ids won't necessarily the stay the same across multiple generations. Users will generally be interested in specific IP blocks.
>>>>
>>>> Exactly the IDs are UAPI and won't change once defined for a platform and any new SKU or platform will add on top of existing ones. Userspace can include the header and use the defines. The query is used to know what all errors exists on a platform and userspace can process the IDs of IP block of interest. I believe even if we list block wise a query will be needed without which userspace wouldn't know which blocks exist on a platform.
>>>>
>>>
>>> What I meant is - assigning an id for every combination of IP block/ instance number/error type is not maintainable across different SOCs.
>>>
>>> Instead, can we have  something like -
>>>      Query -> returns IP block ids, number of instances, error types supported by each IP block.
>>>      Read Error -> IP block id | Instance number /Instance ALL | Error type id/Error type ALL.
>>
>> Hi Lijo,
>>
>> Would you please elaborate more on what is the issue you fore see with the maintainability. But I have a query on the model suggested
>>
>> This might work well with user input based tools, but don't think it suits if we want to periodically read a particular counter.
>>
>> The inspiration to have ID for each is taken from PMU subsystem where every event has an ID and a flat list so no multiple queries and we can read them individually or group together
>> which can be achieved via READ_MULTI command I proposed earlier.
>>
>
> The problem is mainly with maintaining a static list including all ip_id | instance | err_type combinations.  Instead, preference is for client to query the capabilities -> instance/error types supported and then use that info later to fetch error info.
>
> Capability query could return something like ip block, total instance available and error types supported. This doesn't require to maintain an ID list for each combination.
>
> The instances per SOC could be variable. For ex: it's not required that all SKUs of your SOC type to have have ss0-ss3 HBMs. For the same SOC type or for new SOC type, it could be more or less.
>
> Roughly something like ..
>
> enum ip_block_id
> {
>     block1,
>     block2,
>     block3,
>     ....
>     block_all
> }
>
> enum ip_sub_block_id (if required)
> {
>     sub_block1,
>     sub_block2,
>     ....
>     sub_block_all
> }
>
> #define INSTANCE_ALL  -1
>
> enum ras_error_type
> {
>     correctable,
>     uncorrectable,
>     deferred,
>     fatal,
>     ...
>     err_all
> }
>
> Then define something like below while querying error details.
>
>     <31:24> = Block Id
>     <23:16> subblock id
>     <15:8> - interested instance
>     <7:0> - error_type
>
> Instance number could be 'inst_all' or specific IP instance.
Hi Lijo,

Thanks for the explanation, will rework as suggested and re post a new series soon.

Thanks,
Aravind.
>
> Thanks,
> Lijo
>
>> Thanks,
>> Aravind.
>>>
>>> Thanks,
>>> Lijo
>>>
>>>>>
>>>>> For ex: to get HBM errors, it looks like the current patch series supports READALL which dumps the whole set of errors. Or, users have to figure out the ids of HBM stack instance (whose capacity can change depending on the SOC and within a single family multiple configurations can exist) errors and do multiple READ_ONE calls. Both don't look good.
>>>>>
>>>>> It would be better if the command argument format can be well defined so that it can be queried based on IP block type, instance, and error types supported (CE/UE/fatal/parity/deferred etc.).
>>>>
>>>> so to mitigate multiple read limitation, we can introduce a new GENL command like READ_MULTI which accepts a list of errors ids which userspace can pass and get all interested error counter as response at once. Also, listing individual errors helps if userspace wants to read a particular error at regular intervals. The intention is also to keep KMD logic simple, userspace can build required model on top of flat enumeration.
>>>>
>>>> Please let me know if this sounds reasonable to you.
>>>>
>>>> Thanks,
>>>> Aravind.
>>>>>
>>>>> Thanks,
>>>>> Lijo
>>>>>
>>>>>>
>>>>>> @Hawking Zhang, @Lazar, Lijo
>>>>>>
>>>>>> Can you take a look at this series and API and see if it would align
>>>>>> with our RAS requirements going forward?
>>>>>>
>>>>>> Alex
>>>>>>
>>>>>>
>>>>>>>
>>>>>>> [1]: https://airlied.blogspot.com/2022/09/accelerators-bof-outcomes-summary.html
>>>>>>>
>>>>>>> this series is on top of https://patchwork.freedesktop.org/series/125373/,
>>>>>>>
>>>>>>> v4:
>>>>>>> 1. Rebase
>>>>>>> 2. rename drm_genl_send to drm_genl_reply
>>>>>>> 3. catch error from xa_store and handle appropriately
>>>>>>> 4. presently xe_list_errors fills blank data for IGFX, prevent it by
>>>>>>> having an early check of IS_DGFX (Michael J. Ruhl)
>>>>>>>
>>>>>>> v3:
>>>>>>> 1. Rebase on latest RAS series for XE
>>>>>>> 2. drop DRIVER_NETLINK flag and use the driver_genl_ops structure to
>>>>>>> register to netlink subsystem
>>>>>>>
>>>>>>> v2: define common interfaces to genl netlink subsystem that all drm drivers
>>>>>>> can leverage.
>>>>>>>
>>>>>>> Below is an example tool drm_ras which demonstrates the use of the
>>>>>>> supported commands. The tool will be sent to ML with the subject
>>>>>>> "[RFC i-g-t v2 0/1] A tool to demonstrate use of netlink sockets to read RAS error counters"
>>>>>>> https://patchwork.freedesktop.org/series/118437/#rev2
>>>>>>>
>>>>>>> read single error counter:
>>>>>>>
>>>>>>> $ ./drm_ras READ_ONE --device=drm:/dev/dri/card1 --error_id=0x0000000000000005
>>>>>>> counter value 0
>>>>>>>
>>>>>>> read all error counters:
>>>>>>>
>>>>>>> $ ./drm_ras READ_ALL --device=drm:/dev/dri/card1
>>>>>>> name                                                    config-id               counter
>>>>>>>
>>>>>>> error-gt0-correctable-guc                               0x0000000000000001      0
>>>>>>> error-gt0-correctable-slm                               0x0000000000000003      0
>>>>>>> error-gt0-correctable-eu-ic                             0x0000000000000004      0
>>>>>>> error-gt0-correctable-eu-grf                            0x0000000000000005      0
>>>>>>> error-gt0-fatal-guc                                     0x0000000000000009      0
>>>>>>> error-gt0-fatal-slm                                     0x000000000000000d      0
>>>>>>> error-gt0-fatal-eu-grf                                  0x000000000000000f      0
>>>>>>> error-gt0-fatal-fpu                                     0x0000000000000010      0
>>>>>>> error-gt0-fatal-tlb                                     0x0000000000000011      0
>>>>>>> error-gt0-fatal-l3-fabric                               0x0000000000000012      0
>>>>>>> error-gt0-correctable-subslice                          0x0000000000000013      0
>>>>>>> error-gt0-correctable-l3bank                            0x0000000000000014      0
>>>>>>> error-gt0-fatal-subslice                                0x0000000000000015      0
>>>>>>> error-gt0-fatal-l3bank                                  0x0000000000000016      0
>>>>>>> error-gt0-sgunit-correctable                            0x0000000000000017      0
>>>>>>> error-gt0-sgunit-nonfatal                               0x0000000000000018      0
>>>>>>> error-gt0-sgunit-fatal                                  0x0000000000000019      0
>>>>>>> error-gt0-soc-fatal-psf-csc-0                           0x000000000000001a      0
>>>>>>> error-gt0-soc-fatal-psf-csc-1                           0x000000000000001b      0
>>>>>>> error-gt0-soc-fatal-psf-csc-2                           0x000000000000001c      0
>>>>>>> error-gt0-soc-fatal-punit                               0x000000000000001d      0
>>>>>>> error-gt0-soc-fatal-psf-0                               0x000000000000001e      0
>>>>>>> error-gt0-soc-fatal-psf-1                               0x000000000000001f      0
>>>>>>> error-gt0-soc-fatal-psf-2                               0x0000000000000020      0
>>>>>>> error-gt0-soc-fatal-cd0                                 0x0000000000000021      0
>>>>>>> error-gt0-soc-fatal-cd0-mdfi                            0x0000000000000022      0
>>>>>>> error-gt0-soc-fatal-mdfi-east                           0x0000000000000023      0
>>>>>>> error-gt0-soc-fatal-mdfi-south                          0x0000000000000024      0
>>>>>>> error-gt0-soc-fatal-hbm-ss0-0                           0x0000000000000025      0
>>>>>>> error-gt0-soc-fatal-hbm-ss0-1                           0x0000000000000026      0
>>>>>>> error-gt0-soc-fatal-hbm-ss0-2                           0x0000000000000027      0
>>>>>>> error-gt0-soc-fatal-hbm-ss0-3                           0x0000000000000028      0
>>>>>>> error-gt0-soc-fatal-hbm-ss0-4                           0x0000000000000029      0
>>>>>>> error-gt0-soc-fatal-hbm-ss0-5                           0x000000000000002a      0
>>>>>>> error-gt0-soc-fatal-hbm-ss0-6                           0x000000000000002b      0
>>>>>>> error-gt0-soc-fatal-hbm-ss0-7                           0x000000000000002c      0
>>>>>>> error-gt0-soc-fatal-hbm-ss1-0                           0x000000000000002d      0
>>>>>>> error-gt0-soc-fatal-hbm-ss1-1                           0x000000000000002e      0
>>>>>>> error-gt0-soc-fatal-hbm-ss1-2                           0x000000000000002f      0
>>>>>>> error-gt0-soc-fatal-hbm-ss1-3                           0x0000000000000030      0
>>>>>>> error-gt0-soc-fatal-hbm-ss1-4                           0x0000000000000031      0
>>>>>>> error-gt0-soc-fatal-hbm-ss1-5                           0x0000000000000032      0
>>>>>>> error-gt0-soc-fatal-hbm-ss1-6                           0x0000000000000033      0
>>>>>>> error-gt0-soc-fatal-hbm-ss1-7                           0x0000000000000034      0
>>>>>>> error-gt0-soc-fatal-hbm-ss2-0                           0x0000000000000035      0
>>>>>>> error-gt0-soc-fatal-hbm-ss2-1                           0x0000000000000036      0
>>>>>>> error-gt0-soc-fatal-hbm-ss2-2                           0x0000000000000037      0
>>>>>>> error-gt0-soc-fatal-hbm-ss2-3                           0x0000000000000038      0
>>>>>>> error-gt0-soc-fatal-hbm-ss2-4                           0x0000000000000039      0
>>>>>>> error-gt0-soc-fatal-hbm-ss2-5                           0x000000000000003a      0
>>>>>>> error-gt0-soc-fatal-hbm-ss2-6                           0x000000000000003b      0
>>>>>>> error-gt0-soc-fatal-hbm-ss2-7                           0x000000000000003c      0
>>>>>>> error-gt0-soc-fatal-hbm-ss3-0                           0x000000000000003d      0
>>>>>>> error-gt0-soc-fatal-hbm-ss3-1                           0x000000000000003e      0
>>>>>>> error-gt0-soc-fatal-hbm-ss3-2                           0x000000000000003f      0
>>>>>>> error-gt0-soc-fatal-hbm-ss3-3                           0x0000000000000040      0
>>>>>>> error-gt0-soc-fatal-hbm-ss3-4                           0x0000000000000041      0
>>>>>>> error-gt0-soc-fatal-hbm-ss3-5                           0x0000000000000042      0
>>>>>>> error-gt0-soc-fatal-hbm-ss3-6                           0x0000000000000043      0
>>>>>>> error-gt0-soc-fatal-hbm-ss3-7                           0x0000000000000044      0
>>>>>>> error-gt0-gsc-correctable-sram-ecc                      0x0000000000000045      0
>>>>>>> error-gt0-gsc-nonfatal-mia-shutdown                     0x0000000000000046      0
>>>>>>> error-gt0-gsc-nonfatal-mia-int                          0x0000000000000047      0
>>>>>>> error-gt0-gsc-nonfatal-sram-ecc                         0x0000000000000048      0
>>>>>>> error-gt0-gsc-nonfatal-wdg-timeout                      0x0000000000000049      0
>>>>>>> error-gt0-gsc-nonfatal-rom-parity                       0x000000000000004a      0
>>>>>>> error-gt0-gsc-nonfatal-ucode-parity                     0x000000000000004b      0
>>>>>>> error-gt0-gsc-nonfatal-glitch-det                       0x000000000000004c      0
>>>>>>> error-gt0-gsc-nonfatal-fuse-pull                        0x000000000000004d      0
>>>>>>> error-gt0-gsc-nonfatal-fuse-crc-check                   0x000000000000004e      0
>>>>>>> error-gt0-gsc-nonfatal-selfmbist                        0x000000000000004f      0
>>>>>>> error-gt0-gsc-nonfatal-aon-parity                       0x0000000000000050      0
>>>>>>> error-gt1-correctable-guc                               0x1000000000000001      0
>>>>>>> error-gt1-correctable-slm                               0x1000000000000003      0
>>>>>>> error-gt1-correctable-eu-ic                             0x1000000000000004      0
>>>>>>> error-gt1-correctable-eu-grf                            0x1000000000000005      0
>>>>>>> error-gt1-fatal-guc                                     0x1000000000000009      0
>>>>>>> error-gt1-fatal-slm                                     0x100000000000000d      0
>>>>>>> error-gt1-fatal-eu-grf                                  0x100000000000000f      0
>>>>>>> error-gt1-fatal-fpu                                     0x1000000000000010      0
>>>>>>> error-gt1-fatal-tlb                                     0x1000000000000011      0
>>>>>>> error-gt1-fatal-l3-fabric                               0x1000000000000012      0
>>>>>>> error-gt1-correctable-subslice                          0x1000000000000013      0
>>>>>>> error-gt1-correctable-l3bank                            0x1000000000000014      0
>>>>>>> error-gt1-fatal-subslice                                0x1000000000000015      0
>>>>>>> error-gt1-fatal-l3bank                                  0x1000000000000016      0
>>>>>>> error-gt1-sgunit-correctable                            0x1000000000000017      0
>>>>>>> error-gt1-sgunit-nonfatal                               0x1000000000000018      0
>>>>>>> error-gt1-sgunit-fatal                                  0x1000000000000019      0
>>>>>>> error-gt1-soc-fatal-psf-csc-0                           0x100000000000001a      0
>>>>>>> error-gt1-soc-fatal-psf-csc-1                           0x100000000000001b      0
>>>>>>> error-gt1-soc-fatal-psf-csc-2                           0x100000000000001c      0
>>>>>>> error-gt1-soc-fatal-punit                               0x100000000000001d      0
>>>>>>> error-gt1-soc-fatal-psf-0                               0x100000000000001e      0
>>>>>>> error-gt1-soc-fatal-psf-1                               0x100000000000001f      0
>>>>>>> error-gt1-soc-fatal-psf-2                               0x1000000000000020      0
>>>>>>> error-gt1-soc-fatal-cd0                                 0x1000000000000021      0
>>>>>>> error-gt1-soc-fatal-cd0-mdfi                            0x1000000000000022      0
>>>>>>> error-gt1-soc-fatal-mdfi-east                           0x1000000000000023      0
>>>>>>> error-gt1-soc-fatal-mdfi-south                          0x1000000000000024      0
>>>>>>> error-gt1-soc-fatal-hbm-ss0-0                           0x1000000000000025      0
>>>>>>> error-gt1-soc-fatal-hbm-ss0-1                           0x1000000000000026      0
>>>>>>> error-gt1-soc-fatal-hbm-ss0-2                           0x1000000000000027      0
>>>>>>> error-gt1-soc-fatal-hbm-ss0-3                           0x1000000000000028      0
>>>>>>> error-gt1-soc-fatal-hbm-ss0-4                           0x1000000000000029      0
>>>>>>> error-gt1-soc-fatal-hbm-ss0-5                           0x100000000000002a      0
>>>>>>> error-gt1-soc-fatal-hbm-ss0-6                           0x100000000000002b      0
>>>>>>> error-gt1-soc-fatal-hbm-ss0-7                           0x100000000000002c      0
>>>>>>> error-gt1-soc-fatal-hbm-ss1-0                           0x100000000000002d      0
>>>>>>> error-gt1-soc-fatal-hbm-ss1-1                           0x100000000000002e      0
>>>>>>> error-gt1-soc-fatal-hbm-ss1-2                           0x100000000000002f      0
>>>>>>> error-gt1-soc-fatal-hbm-ss1-3                           0x1000000000000030      0
>>>>>>> error-gt1-soc-fatal-hbm-ss1-4                           0x1000000000000031      0
>>>>>>> error-gt1-soc-fatal-hbm-ss1-5                           0x1000000000000032      0
>>>>>>> error-gt1-soc-fatal-hbm-ss1-6                           0x1000000000000033      0
>>>>>>> error-gt1-soc-fatal-hbm-ss1-7                           0x1000000000000034      0
>>>>>>> error-gt1-soc-fatal-hbm-ss2-0                           0x1000000000000035      0
>>>>>>> error-gt1-soc-fatal-hbm-ss2-1                           0x1000000000000036      0
>>>>>>> error-gt1-soc-fatal-hbm-ss2-2                           0x1000000000000037      0
>>>>>>> error-gt1-soc-fatal-hbm-ss2-3                           0x1000000000000038      0
>>>>>>> error-gt1-soc-fatal-hbm-ss2-4                           0x1000000000000039      0
>>>>>>> error-gt1-soc-fatal-hbm-ss2-5                           0x100000000000003a      0
>>>>>>> error-gt1-soc-fatal-hbm-ss2-6                           0x100000000000003b      0
>>>>>>> error-gt1-soc-fatal-hbm-ss2-7                           0x100000000000003c      0
>>>>>>> error-gt1-soc-fatal-hbm-ss3-0                           0x100000000000003d      0
>>>>>>> error-gt1-soc-fatal-hbm-ss3-1                           0x100000000000003e      0
>>>>>>> error-gt1-soc-fatal-hbm-ss3-2                           0x100000000000003f      0
>>>>>>> error-gt1-soc-fatal-hbm-ss3-3                           0x1000000000000040      0
>>>>>>> error-gt1-soc-fatal-hbm-ss3-4                           0x1000000000000041      0
>>>>>>> error-gt1-soc-fatal-hbm-ss3-5                           0x1000000000000042      0
>>>>>>> error-gt1-soc-fatal-hbm-ss3-6                           0x1000000000000043      0
>>>>>>> error-gt1-soc-fatal-hbm-ss3-7                           0x1000000000000044      0
>>>>>>>
>>>>>>> wait on a error event:
>>>>>>>
>>>>>>> $ ./drm_ras WAIT_ON_EVENT --device=drm:/dev/dri/card1
>>>>>>> waiting for error event
>>>>>>> error event received
>>>>>>> counter value 0
>>>>>>>
>>>>>>> list all errors:
>>>>>>>
>>>>>>> $ ./drm_ras LIST_ERRORS --device=drm:/dev/dri/card1
>>>>>>> name                                                    config-id
>>>>>>>
>>>>>>> error-gt0-correctable-guc                               0x0000000000000001
>>>>>>> error-gt0-correctable-slm                               0x0000000000000003
>>>>>>> error-gt0-correctable-eu-ic                             0x0000000000000004
>>>>>>> error-gt0-correctable-eu-grf                            0x0000000000000005
>>>>>>> error-gt0-fatal-guc                                     0x0000000000000009
>>>>>>> error-gt0-fatal-slm                                     0x000000000000000d
>>>>>>> error-gt0-fatal-eu-grf                                  0x000000000000000f
>>>>>>> error-gt0-fatal-fpu                                     0x0000000000000010
>>>>>>> error-gt0-fatal-tlb                                     0x0000000000000011
>>>>>>> error-gt0-fatal-l3-fabric                               0x0000000000000012
>>>>>>> error-gt0-correctable-subslice                          0x0000000000000013
>>>>>>> error-gt0-correctable-l3bank                            0x0000000000000014
>>>>>>> error-gt0-fatal-subslice                                0x0000000000000015
>>>>>>> error-gt0-fatal-l3bank                                  0x0000000000000016
>>>>>>> error-gt0-sgunit-correctable                            0x0000000000000017
>>>>>>> error-gt0-sgunit-nonfatal                               0x0000000000000018
>>>>>>> error-gt0-sgunit-fatal                                  0x0000000000000019
>>>>>>> error-gt0-soc-fatal-psf-csc-0                           0x000000000000001a
>>>>>>> error-gt0-soc-fatal-psf-csc-1                           0x000000000000001b
>>>>>>> error-gt0-soc-fatal-psf-csc-2                           0x000000000000001c
>>>>>>> error-gt0-soc-fatal-punit                               0x000000000000001d
>>>>>>> error-gt0-soc-fatal-psf-0                               0x000000000000001e
>>>>>>> error-gt0-soc-fatal-psf-1                               0x000000000000001f
>>>>>>> error-gt0-soc-fatal-psf-2                               0x0000000000000020
>>>>>>> error-gt0-soc-fatal-cd0                                 0x0000000000000021
>>>>>>> error-gt0-soc-fatal-cd0-mdfi                            0x0000000000000022
>>>>>>> error-gt0-soc-fatal-mdfi-east                           0x0000000000000023
>>>>>>> error-gt0-soc-fatal-mdfi-south                          0x0000000000000024
>>>>>>> error-gt0-soc-fatal-hbm-ss0-0                           0x0000000000000025
>>>>>>> error-gt0-soc-fatal-hbm-ss0-1                           0x0000000000000026
>>>>>>> error-gt0-soc-fatal-hbm-ss0-2                           0x0000000000000027
>>>>>>> error-gt0-soc-fatal-hbm-ss0-3                           0x0000000000000028
>>>>>>> error-gt0-soc-fatal-hbm-ss0-4                           0x0000000000000029
>>>>>>> error-gt0-soc-fatal-hbm-ss0-5                           0x000000000000002a
>>>>>>> error-gt0-soc-fatal-hbm-ss0-6                           0x000000000000002b
>>>>>>> error-gt0-soc-fatal-hbm-ss0-7                           0x000000000000002c
>>>>>>> error-gt0-soc-fatal-hbm-ss1-0                           0x000000000000002d
>>>>>>> error-gt0-soc-fatal-hbm-ss1-1                           0x000000000000002e
>>>>>>> error-gt0-soc-fatal-hbm-ss1-2                           0x000000000000002f
>>>>>>> error-gt0-soc-fatal-hbm-ss1-3                           0x0000000000000030
>>>>>>> error-gt0-soc-fatal-hbm-ss1-4                           0x0000000000000031
>>>>>>> error-gt0-soc-fatal-hbm-ss1-5                           0x0000000000000032
>>>>>>> error-gt0-soc-fatal-hbm-ss1-6                           0x0000000000000033
>>>>>>> error-gt0-soc-fatal-hbm-ss1-7                           0x0000000000000034
>>>>>>> error-gt0-soc-fatal-hbm-ss2-0                           0x0000000000000035
>>>>>>> error-gt0-soc-fatal-hbm-ss2-1                           0x0000000000000036
>>>>>>> error-gt0-soc-fatal-hbm-ss2-2                           0x0000000000000037
>>>>>>> error-gt0-soc-fatal-hbm-ss2-3                           0x0000000000000038
>>>>>>> error-gt0-soc-fatal-hbm-ss2-4                           0x0000000000000039
>>>>>>> error-gt0-soc-fatal-hbm-ss2-5                           0x000000000000003a
>>>>>>> error-gt0-soc-fatal-hbm-ss2-6                           0x000000000000003b
>>>>>>> error-gt0-soc-fatal-hbm-ss2-7                           0x000000000000003c
>>>>>>> error-gt0-soc-fatal-hbm-ss3-0                           0x000000000000003d
>>>>>>> error-gt0-soc-fatal-hbm-ss3-1                           0x000000000000003e
>>>>>>> error-gt0-soc-fatal-hbm-ss3-2                           0x000000000000003f
>>>>>>> error-gt0-soc-fatal-hbm-ss3-3                           0x0000000000000040
>>>>>>> error-gt0-soc-fatal-hbm-ss3-4                           0x0000000000000041
>>>>>>> error-gt0-soc-fatal-hbm-ss3-5                           0x0000000000000042
>>>>>>> error-gt0-soc-fatal-hbm-ss3-6                           0x0000000000000043
>>>>>>> error-gt0-soc-fatal-hbm-ss3-7                           0x0000000000000044
>>>>>>> error-gt0-gsc-correctable-sram-ecc                      0x0000000000000045
>>>>>>> error-gt0-gsc-nonfatal-mia-shutdown                     0x0000000000000046
>>>>>>> error-gt0-gsc-nonfatal-mia-int                          0x0000000000000047
>>>>>>> error-gt0-gsc-nonfatal-sram-ecc                         0x0000000000000048
>>>>>>> error-gt0-gsc-nonfatal-wdg-timeout                      0x0000000000000049
>>>>>>> error-gt0-gsc-nonfatal-rom-parity                       0x000000000000004a
>>>>>>> error-gt0-gsc-nonfatal-ucode-parity                     0x000000000000004b
>>>>>>> error-gt0-gsc-nonfatal-glitch-det                       0x000000000000004c
>>>>>>> error-gt0-gsc-nonfatal-fuse-pull                        0x000000000000004d
>>>>>>> error-gt0-gsc-nonfatal-fuse-crc-check                   0x000000000000004e
>>>>>>> error-gt0-gsc-nonfatal-selfmbist                        0x000000000000004f
>>>>>>> error-gt0-gsc-nonfatal-aon-parity                       0x0000000000000050
>>>>>>> error-gt1-correctable-guc                               0x1000000000000001
>>>>>>> error-gt1-correctable-slm                               0x1000000000000003
>>>>>>> error-gt1-correctable-eu-ic                             0x1000000000000004
>>>>>>> error-gt1-correctable-eu-grf��                           0x1000000000000005
>>>>>>> error-gt1-fatal-guc                                     0x1000000000000009
>>>>>>> error-gt1-fatal-slm                                     0x100000000000000d
>>>>>>> error-gt1-fatal-eu-grf                                  0x100000000000000f
>>>>>>> error-gt1-fatal-fpu                                     0x1000000000000010
>>>>>>> error-gt1-fatal-tlb                                     0x1000000000000011
>>>>>>> error-gt1-fatal-l3-fabric                               0x1000000000000012
>>>>>>> error-gt1-correctable-subslice                          0x1000000000000013
>>>>>>> error-gt1-correctable-l3bank                            0x1000000000000014
>>>>>>> error-gt1-fatal-subslice                                0x1000000000000015
>>>>>>> error-gt1-fatal-l3bank                                  0x1000000000000016
>>>>>>> error-gt1-sgunit-correctable                            0x1000000000000017
>>>>>>> error-gt1-sgunit-nonfatal                               0x1000000000000018
>>>>>>> error-gt1-sgunit-fatal                                  0x1000000000000019
>>>>>>> error-gt1-soc-fatal-psf-csc-0                           0x100000000000001a
>>>>>>> error-gt1-soc-fatal-psf-csc-1                           0x100000000000001b
>>>>>>> error-gt1-soc-fatal-psf-csc-2                           0x100000000000001c
>>>>>>> error-gt1-soc-fatal-punit                               0x100000000000001d
>>>>>>> error-gt1-soc-fatal-psf-0                               0x100000000000001e
>>>>>>> error-gt1-soc-fatal-psf-1                               0x100000000000001f
>>>>>>> error-gt1-soc-fatal-psf-2                               0x1000000000000020
>>>>>>> error-gt1-soc-fatal-cd0                                 0x1000000000000021
>>>>>>> error-gt1-soc-fatal-cd0-mdfi                      ��     0x1000000000000022
>>>>>>> error-gt1-soc-fatal-mdfi-east                           0x1000000000000023
>>>>>>> error-gt1-soc-fatal-mdfi-south                          0x1000000000000024
>>>>>>> error-gt1-soc-fatal-hbm-ss0-0                           0x1000000000000025
>>>>>>> error-gt1-soc-fatal-hbm-ss0-1                           0x1000000000000026
>>>>>>> error-gt1-soc-fatal-hbm-ss0-2                           0x1000000000000027
>>>>>>> error-gt1-soc-fatal-hbm-ss0-3                           0x1000000000000028
>>>>>>> error-gt1-soc-fatal-hbm-ss0-4                           0x1000000000000029
>>>>>>> error-gt1-soc-fatal-hbm-ss0-5                           0x100000000000002a
>>>>>>> error-gt1-soc-fatal-hbm-ss0-6                           0x100000000000002b
>>>>>>> error-gt1-soc-fatal-hbm-ss0-7                           0x100000000000002c
>>>>>>> error-gt1-soc-fatal-hbm-ss1-0                           0x100000000000002d
>>>>>>> error-gt1-soc-fatal-hbm-ss1-1                           0x100000000000002e
>>>>>>> error-gt1-soc-fatal-hbm-ss1-2                           0x100000000000002f
>>>>>>> error-gt1-soc-fatal-hbm-ss1-3                           0x1000000000000030
>>>>>>> error-gt1-soc-fatal-hbm-ss1-4                           0x1000000000000031
>>>>>>> error-gt1-soc-fatal-hbm-ss1-5                           0x1000000000000032
>>>>>>> error-gt1-soc-fatal-hbm-ss1-6                           0x1000000000000033
>>>>>>> error-gt1-soc-fatal-hbm-ss1-7                           0x1000000000000034
>>>>>>> error-gt1-soc-fatal-hbm-ss2-0                           0x1000000000000035
>>>>>>> error-gt1-soc-fatal-hbm-ss2-1                           0x1000000000000036
>>>>>>> error-gt1-soc-fatal-hbm-ss2-2                           0x1000000000000037
>>>>>>> error-gt1-soc-fatal-hbm-ss2-3                           0x1000000000000038
>>>>>>> error-gt1-soc-fatal-hbm-ss2-4                           0x1000000000000039
>>>>>>> error-gt1-soc-fatal-hbm-ss2-5                           0x100000000000003a
>>>>>>> error-gt1-soc-fatal-hbm-ss2-6                           0x100000000000003b
>>>>>>> error-gt1-soc-fatal-hbm-ss2-7                           0x100000000000003c
>>>>>>> error-gt1-soc-fatal-hbm-ss3-0                           0x100000000000003d
>>>>>>> error-gt1-soc-fatal-hbm-ss3-1                           0x100000000000003e
>>>>>>> error-gt1-soc-fatal-hbm-ss3-2                           0x100000000000003f
>>>>>>> error-gt1-soc-fatal-hbm-ss3-3                           0x1000000000000040
>>>>>>> error-gt1-soc-fatal-hbm-ss3-4                           0x1000000000000041
>>>>>>> error-gt1-soc-fatal-hbm-ss3-5                           0x1000000000000042
>>>>>>> error-gt1-soc-fatal-hbm-ss3-6                           0x1000000000000043
>>>>>>> error-gt1-soc-fatal-hbm-ss3-7                           0x1000000000000044
>>>>>>>
>>>>>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>>>>>> Cc: David Airlie <airlied@gmail.com>
>>>>>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>>>>>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>>>>>>> Cc: Oded Gabbay <ogabbay@kernel.org>
>>>>>>> Cc: Tomer Tayar <ttayar@habana.ai>
>>>>>>> Cc: Hawking Zhang <Hawking.Zhang@amd.com>
>>>>>>> Cc: Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>
>>>>>>> Cc: Kuehling Felix <Felix.Kuehling@amd.com>
>>>>>>> Cc: Tuikov Luben <Luben.Tuikov@amd.com>
>>>>>>> Cc: Ruhl, Michael J <michael.j.ruhl@intel.com>
>>>>>>>
>>>>>>>
>>>>>>> Aravind Iddamsetty (5):
>>>>>>>      drm/netlink: Add netlink infrastructure
>>>>>>>      drm/xe/RAS: Register netlink capability
>>>>>>>      drm/xe/RAS: Expose the error counters
>>>>>>>      drm/netlink: Define multicast groups
>>>>>>>      drm/xe/RAS: send multicast event on occurrence of an error
>>>>>>>
>>>>>>>     drivers/gpu/drm/Makefile             |   1 +
>>>>>>>     drivers/gpu/drm/drm_drv.c            |   7 +
>>>>>>>     drivers/gpu/drm/drm_netlink.c        | 195 ++++++++++
>>>>>>>     drivers/gpu/drm/xe/Makefile          |   1 +
>>>>>>>     drivers/gpu/drm/xe/xe_device.c       |   4 +
>>>>>>>     drivers/gpu/drm/xe/xe_device_types.h |   1 +
>>>>>>>     drivers/gpu/drm/xe/xe_hw_error.c     |  33 ++
>>>>>>>     drivers/gpu/drm/xe/xe_netlink.c      | 517 +++++++++++++++++++++++++++
>>>>>>>     include/drm/drm_device.h             |   8 +
>>>>>>>     include/drm/drm_drv.h                |   7 +
>>>>>>>     include/drm/drm_netlink.h            |  35 ++
>>>>>>>     include/uapi/drm/drm_netlink.h       |  87 +++++
>>>>>>>     include/uapi/drm/xe_drm.h            |  81 +++++
>>>>>>>     13 files changed, 977 insertions(+)
>>>>>>>     create mode 100644 drivers/gpu/drm/drm_netlink.c
>>>>>>>     create mode 100644 drivers/gpu/drm/xe/xe_netlink.c
>>>>>>>     create mode 100644 include/drm/drm_netlink.h
>>>>>>>     create mode 100644 include/uapi/drm/drm_netlink.h
>>>>>>>
>>>>>>> -- 
>>>>>>> 2.25.1
>>>>>>>
