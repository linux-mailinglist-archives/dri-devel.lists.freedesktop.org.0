Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA867D803C
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 12:05:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CB2510E79C;
	Thu, 26 Oct 2023 10:05:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2069.outbound.protection.outlook.com [40.107.223.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2B6410E79C;
 Thu, 26 Oct 2023 10:05:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LIKick0/P44Jt+GDQ0Jdt7kRrYA9Mzy8EKTE3m3fbi1V6NGEWAUwRAALVSGFrHq2yb86d2gDXyIH4OBDd2MOJITMkL2zE6Y9urKvZqRo04wGelgg70UlF4iBDBm80isAKQ11Q/7tq4ogpaOhAhDfGBE/eAHZyL/5hAtlScdCgguC2Q7CP2J84FNkGc0iJ/cZ7jLZjV53QgUASMSN4t/cBvjZ/0TiV755/5MrQ2JB4Gl9dHaanVBUOt+qOuF2OokkruDB6eC2lZczICF8LhYKCMA1TNbKmzVEMqv4RfOikJ2fm7vAKhQu/sZGXwOKpB3uy1UY/vusMSEVU3kemaUGNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hb/hCOCO5sCG83pbG9B+p9+f7XH+fu4GXP/RIoXuWio=;
 b=PZiCJGq7WalOw9bJ29O5z+NQ8NHrbLL/VcZHHPhRIViYv68k/YyQn7V1wejUZpuORdR24VTLfLo5sCu8L50wpiGeBr0Td82Kna5SObFEJ8ms6Q8zjWDDgWoIkNG0LQPsJr4Gc7ShVZX6pKC/cXCJ+oOm4VNzhCb1oyecS/f8OCnLYBXYe+EpARc0Cz/J2H7ysgGWgt3HxeGrGyv51VDyAYgrP7B1DVfceKv71EUpzfP7xg3LNH5IcOTy8M3/o87S0Fie/StCCZ8tlbv7hFoPWM6dqhPvQzjAr5vamOtT6vR72bkt0kVwPelOLGAxznU891ZOwfonLlv/j0FbVstcNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hb/hCOCO5sCG83pbG9B+p9+f7XH+fu4GXP/RIoXuWio=;
 b=RFlKK7MiMCeU3tb6+DQ65Dw7ZWBu2BcLs6QLYiovKHkXZS62/of2KFdl/oLipTVC+vAlRDJL1mVRFISrPKpcbBsbIqp2h0F9xg2MLHoQW6A5/5iNVgKOIGaj1LoVoHTS02LlUpVGrUNyZC9M2FLWPa7PyklY7sy3uReWqjGSC1c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4614.namprd12.prod.outlook.com (2603:10b6:a03:a6::22)
 by BL3PR12MB6449.namprd12.prod.outlook.com (2603:10b6:208:3b8::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Thu, 26 Oct
 2023 10:04:59 +0000
Received: from BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::737e:9615:922a:d3d4]) by BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::737e:9615:922a:d3d4%4]) with mapi id 15.20.6933.019; Thu, 26 Oct 2023
 10:04:58 +0000
Message-ID: <7b3d3e43-57f7-9a56-14e3-75d6df6dc004@amd.com>
Date: Thu, 26 Oct 2023 15:34:46 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [RFC v4 0/5] Proposal to use netlink for RAS and Telemetry across
 drm subsystem
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>,
 Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
References: <20231020155835.1295524-1-aravind.iddamsetty@linux.intel.com>
 <CADnq5_PLfTg6hBpSHLND9FF-B++D=BMXQKSJQknOxy8y=Qz-ZA@mail.gmail.com>
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <CADnq5_PLfTg6hBpSHLND9FF-B++D=BMXQKSJQknOxy8y=Qz-ZA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0178.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::33) To BYAPR12MB4614.namprd12.prod.outlook.com
 (2603:10b6:a03:a6::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB4614:EE_|BL3PR12MB6449:EE_
X-MS-Office365-Filtering-Correlation-Id: 23594890-4913-4bf9-7e74-08dbd60b024f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uGdYdVxYs3sjVyXniANoq2x5pd+TMUiiM06gyxNS8WgBZbPW2pCs8zPNgCHXIKZ/1tfQyn922bF3LCEAzD+ClFSzNNJ95XNmi4ES9XrWZ2w5j5+6tvkohWFva6gwywGw4rLYl1w+sDjaDF4lswvv9uX1Gz5Cd1t495H0ThZOneMgxmPlK9FLLVqKxh3cOdzw6ziVtUUBdVU3Yux+SsKdtRvYepAu3DA+QUxGXqp2lA06IVeMTNLsT8K9tJz3rxZpLAaliWp65aQyzUtQWxyrvPIMs1WEzbEl4Huo/bP6fW+vAukgNZ2d7QEvn9MRt7mRkYd1pNrpA1wq6TzIEzXAaEVDeUQuQ3hfHFZKSCQEMndb88G6ZZyGOxdNIa8rd3IE8/RuADSi/6PqSsEGW5VCkpj41RqRG7L+iDnm7D3B9EjiP2JDBIl9zTPB+TmVIsyy+K5U7I1xHfdyQnztjLhE3ZC6+mE55+IPq+fQPlgjs8siLxIMhO4+mi5fLwwcIMGN4Itac3u5WfGGofd5yeHeAoznnKqZweZTvmIHDg6C1c2136eTnLxzNfy00U5akXLOT2mW5GqA5h/hb31EnxcW3uWD3/I1GK1oiMH6Mo8/MaoTshokytw9SzKS9qliqI4Lj5UHGI2HmjqXwbRMeHewRlqk3jPOQAiXP6fkLPPV3cFctJdbdwIZNJNJUdBOCVjf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4614.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(396003)(376002)(366004)(39860400002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(26005)(31686004)(316002)(38100700002)(66476007)(2906002)(30864003)(41300700001)(5660300002)(7416002)(36756003)(86362001)(2616005)(4326008)(8936002)(8676002)(6506007)(6666004)(66556008)(478600001)(66946007)(83380400001)(3613699003)(31696002)(110136005)(966005)(6486002)(53546011)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VE1BUUkzQ29pT3QyRnEzQlBieVNXck14cnUrcEtZb0xNSEEvNEV1WkVJMTFN?=
 =?utf-8?B?ZGZnSjI1VGcvaDRzbFIzUGNnckM4NE1VR3ArZ1JwQStmdHFGZUlxS2dOQ29a?=
 =?utf-8?B?UWVCUUZmRXlyditXaVdaZldTQ254TDVKdzIrdHBZT0xlNkFsanNCZGQxNmFl?=
 =?utf-8?B?WmJtSVJsNkp2OUFvN0FPNjFab3d6d2RXOU5MRVJDcW9WQ1QvMlNmV1NKRVA2?=
 =?utf-8?B?SDlyRFkvTUdWdVhWZG1kY3BlcENTU28wSXo3RU9lemN6U1FudnlDQVZYZ3R4?=
 =?utf-8?B?Z0NsSnR3TmhDZm5JMEZ2M2ZkdlpsRWgzNHJBUk8wUTl5aTR2N0NKSWRPOHZT?=
 =?utf-8?B?akJmVEdxRmsxL3JkQTBsV2tJQm0wMk83Q29NMktORmg4MEU4T2JLelYxUXBN?=
 =?utf-8?B?RU0zYnZubCs3dHlwY001aTZoZkM3UU9GNHhCejdZTzhqbWE0UEVxYjVkUGFI?=
 =?utf-8?B?c0txY2MreU40TEUvd3VQZ2FEVkpiZTNmcnh0QlFhZFVxbyszUW1aSldJMjJW?=
 =?utf-8?B?anNaWWZXTjN6SHdQVnl6TGtid08zVHMxdE4zMEdzekxCRnAwT3RzUG04Q0ow?=
 =?utf-8?B?YzFZOFo4YWZXUTRhajdDVGhmTWM0bGlRVjRSQldheDhIenA3c3BNaHR0VUZr?=
 =?utf-8?B?b2lQbW91V2E2NE5wYWViL3BjWnZzYnRuWEpIamdGbXUrOUNrZjNwbHdZemRZ?=
 =?utf-8?B?L3dmQmljM0tManJJMG5hRkhiT3I5NnV3OWdFdzFGMkxjMWtSVThBMExWUWR4?=
 =?utf-8?B?VGIzZUgzU29yTGlDWVdRYkJJMTA1MzkvaHd0OHAra0lJUitSWGh2UCtmbDBJ?=
 =?utf-8?B?SmlkWXdLV29XRFJydWVvM3FVOUgvRkFDb0puZjJnbWhFUWUycjlxK1BhREZS?=
 =?utf-8?B?T0lUKzdOTmRBbUFrVDVFckdzUjdDUmd5NjNwRTNGZVB0eHlSZWV0OFpENEw4?=
 =?utf-8?B?U2RScUpRWlZvT2ljalhORnpvN3BYTmVWQmZMSDRhOGRVSmgraWY0ck05VEZj?=
 =?utf-8?B?bmZmRWZUNHBERTVMVTlGNkdnYTAvZ3pHdlB3NFowRStaeDBUTkJMYm11cjRH?=
 =?utf-8?B?VnpLM0lwMXdhMXd4dDhncHMvQ051Zm1tWGk2RnFtZ2ZzYUUySmpkRXMvMWNQ?=
 =?utf-8?B?b1RiZm9UUkhWaEljOFUxV3FleS85SldYaWlEekwrcGc0elFkb0FBZjFmMnhE?=
 =?utf-8?B?UUhSc1pKRzg5VTRPZSt4Z1VhRlZtRWUvYi9kTHVTRC8wV0V2Q1hyejJmNG15?=
 =?utf-8?B?NWJzVzBwVnFnRUxsUlpHYnlVcFhHanZ1Nk1RcXZMdzZ3WU1oRmtXV3RBdE12?=
 =?utf-8?B?cFBRaVNHVHVsYjNYNWtvemhuaGxwN25VTHhZaFBoVExENjRqeHcxd250amJs?=
 =?utf-8?B?dFZmL1BQcGJLbGdCNDRuZlZmU3p5Mk5qVWNqVVp1NVloak5Id2xCaVZBMjhx?=
 =?utf-8?B?Y0hIaWtPcHZiejhJZ3o0SUdEQWl3TktFUGJFdGsvSm04cVhwaHdEQWV3Sm1O?=
 =?utf-8?B?T2svelp6bE9SR2IrNzl6elR4UWd4ZHZiTU0vVmRkc3g2K1JCU2xCakR5THlR?=
 =?utf-8?B?VkNabVpuZ0xEMEdzWmRpTjhUZEFURHYrcXIwWFNLSEFtWS9NRUc5Mk9JWHc5?=
 =?utf-8?B?eml4Q3ZTdHlkT3F3ZkZ3MmlhY21FVEJOcjF3TkJveXVJWW8yclEzYlBWZmlv?=
 =?utf-8?B?NHFBazA1Ky9CSDdJMi9GQ2p0a3lBVnJqY2grVjBzd1VWRnNmSXd6ZkYyL2w3?=
 =?utf-8?B?R1c4U0xrTUJhTHBudVFyWTMxZUZEMEJxNHBPdFlNUyswWGZwYWdqcXVaTGZB?=
 =?utf-8?B?S1hWVG1aTEhQTFg5RERCWlRBQTBmc3FWM2p0bzhjWkdRMWZPd0g3elpIbHds?=
 =?utf-8?B?eW5OVG44eFg0LzJKMTlxbHR5VlU5d2Q4Qmp4SEE3ZmMzRW11aVZjRmhJNWtl?=
 =?utf-8?B?b1U5d0w2dHZnTmNIaUtwYWhGaTlibHdSSUovUTB0QTFQUHd5bkdLbW9qZTQ4?=
 =?utf-8?B?T1BSUkczQXpNcEYwWXBScDlUc3JRdi9HT3h0elVwYWdJbzJMSVoxQ09JeFND?=
 =?utf-8?B?UTFyOCs5QVFqdWxuMnJDNStVU0JHclpCeXorUWFtSFZXckQrZ1ljaGt4U2Q5?=
 =?utf-8?Q?rXBJZA0CvyUUjtT7IJ/YhxYCc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23594890-4913-4bf9-7e74-08dbd60b024f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4614.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 10:04:57.8702 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dhusKZ93FE7JTOYXpbJBjfxE4YryCxQ5wiOhVp30kznSXviLX43o14XoftIXmYiY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6449
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



On 10/23/2023 8:59 PM, Alex Deucher wrote:
> On Fri, Oct 20, 2023 at 7:42 PM Aravind Iddamsetty
> <aravind.iddamsetty@linux.intel.com> wrote:
>>
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

The commands used seems very limited. In AMD SOCs, IP blocks, instances 
of IP blocks, block types which support RAS will change across generations.

This series has a single command to query the counters supported. Within 
that it seems to assign unique ids for every combination of error type, 
IP block type and then another for each instance. Not sure how good this 
kind of approach is for an end user. The Ids won't necessarily the stay 
the same across multiple generations. Users will generally be interested 
in specific IP blocks.

For ex: to get HBM errors, it looks like the current patch series 
supports READALL which dumps the whole set of errors. Or, users have to 
figure out the ids of HBM stack instance (whose capacity can change 
depending on the SOC and within a single family multiple configurations 
can exist) errors and do multiple READ_ONE calls. Both don't look good.

It would be better if the command argument format can be well defined so 
that it can be queried based on IP block type, instance, and error types 
supported (CE/UE/fatal/parity/deferred etc.).

Thanks,
Lijo

> 
> @Hawking Zhang, @Lazar, Lijo
> 
> Can you take a look at this series and API and see if it would align
> with our RAS requirements going forward?
> 
> Alex
> 
> 
>>
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
>> --
>> 2.25.1
>>
