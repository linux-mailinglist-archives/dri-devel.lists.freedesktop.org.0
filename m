Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 137A54E779D
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 16:28:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B138F10E2A6;
	Fri, 25 Mar 2022 15:28:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2052.outbound.protection.outlook.com [40.107.94.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36F9210E724
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 15:28:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BDYo4ZWVf36KYUuLWrd2g30jufhabSmSPtzN+k00W1OEdGCl0HzAlk/OBFWw4JyMQ7+CNdJ+kR65cI0VRXI6s+Ex5AXlJN59C5q/Svg/lNR+pE4Eryi3LKBZXOfR9nd/9mesQAhgjApY83cerHsXFc7xeN5yP00MpSVcSfOj81GTHb5FaAO4zGEQJqpgf1ywTlvP+QYwdlsU9dwBxef7o21DllUgbT7strc5UZb57CBCIHcwwcArkgL3Yy2RJ7qxJ7OxwK9lA9D67cR4xjui1KBt0YOqay23y107XG7pquRelB06xHbg9qmF1gfmypcIDiY78ea6qp774KdCAtdnYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WXFISOicS62zp0mNpmYwukX8IzyvnslR55UBBeees3c=;
 b=HFluWTXwGF4WdpqiAL0Xp8nzZnksJ32+STHXiTDv0P79tIs/it9LsVtsX61XVyrx6IgCMxcYnwQ8nP6OvIyoFcOiqqwcKkiHOa3QdixMOaQu6dR+E09gYlQI/nDmv/pcdXySPFan/rL91+DEOfPnSRIb1nrfvVEwfPefZVkGBH/BZfLDDtcBuvulZaHy5EvyZMTaXH3YV+fRI2AQAPHhvvu9uakkPawbXKvTsScjPkyWS8axkT2fhwBfgb2NXbHIG9TMFIXMuA097+TMBGnr11EFm0KWCNTbeWicfrrVf+1XI0LJytk9Tl4E82YQ9Ho80j7MnXhp5tTCj2ivlhW6Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WXFISOicS62zp0mNpmYwukX8IzyvnslR55UBBeees3c=;
 b=FeT5GnoWcDHGNPWfJt2xwMf4rf1q2qVi+zuE7KpJwT0hLpRV8MrdHzcfbHs5WCKK6G5MRG3sDlwTb/lFFY3JhBqjWZzY3RfJd3KV0HFN3hCQ3PrWAgWFpJJVIbaGpU42nznCYytLH2X0HrYoW4jRm37gQOFe2INuAt0TGQSLFWU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CY4PR1201MB0005.namprd12.prod.outlook.com (2603:10b6:903:d1::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Fri, 25 Mar
 2022 15:28:07 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5102.017; Fri, 25 Mar 2022
 15:28:07 +0000
Message-ID: <35cc3bd5-c0ab-0bd1-9603-4971234fbcd6@amd.com>
Date: Fri, 25 Mar 2022 16:28:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] dma-buf: add dma_fence_unwrap
Content-Language: en-US
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20220311110244.1245-1-christian.koenig@amd.com>
 <Yj3e0QjbnPoG7n4I@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <Yj3e0QjbnPoG7n4I@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM5PR04CA0011.eurprd04.prod.outlook.com
 (2603:10a6:206:1::24) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 194f5d74-ebdc-4fa9-d60f-08da0e740fdf
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0005:EE_
X-Microsoft-Antispam-PRVS: <CY4PR1201MB00056EC32C2A69377D0EB286831A9@CY4PR1201MB0005.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hQzK8QcJ2YaLQrMxua5vZ/Yk4bp0nxgQfTeJLLiXhtfw2xD1tDjWeffIFy/8qEI59+qriQuAsSgInZx26BRSN3MQ3oTgjwaPXtMofDYtFvLOM8Njmo49UQVsq+OTJfp7HqolWLKLg7OfQBoWSr/nXDfr4F4icdTKPlHaoKpxA7NwJwdvJALTEbg+PzF5kAgXbnG6WT2LDMxxCmuF9ET+EK5WOoV7RsVMY2CRX5RGYcEaR+XoeibNicEYgxnWBZFXT9JxG3hztO9+BcEZ0sq4C4aVcaR2j2W9QpKIlvG5uuX9xfqZdCNx6MLOV9oooXHlQAUcFpXpO9AD+zEy7IgsarzRvcZuJSu9ApsHwndSXyM/JNqdQdQmzzyhrcnZxYT/YBnsoh70q4Qtau0j4PRoeYAw6KsPBjd5nAR5HVvtIkgTiXJctXVM9+w39VtfRUZnzaTVaETQiOtgTW08KN3/4fU4+P4cI3PBtTxidgeOkRsybNh+HssuRz7Ugpz8iimDQNTI/ru4wWQ723/YMUdGGCVYYYxyOGcw9nxaigJPNUPI3BKQTwxdHRscAGu5G/tfoUETfufk2kBG6y7CdemB1SynipP3XS1bIfCXcPUd7CH9xcunuEC3fLET2EZisI13KbzwjeO2S2cs0sk6SSZm+q2Tve9MD8Rpgix4qdIhi+fOVMCTiUolpD+nwve0UyB+nOdXhd8g1KcLbb3Ryo6vXvG4TUa+TRqz0s/xI960Qcg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(2616005)(6512007)(6506007)(2906002)(83380400001)(38100700002)(316002)(8936002)(110136005)(4326008)(8676002)(66574015)(6486002)(36756003)(54906003)(5660300002)(31686004)(45080400002)(508600001)(31696002)(66946007)(86362001)(66476007)(66556008)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVBHTW5iQTZrcEhWcXJ0ckVqRzRCQ1NnWnEzQXdwY0FZMnRFQmIxVG5YSldO?=
 =?utf-8?B?SHM4cDlONlJmcjlNNjFwcVBZZFAyM3IzTVpEbkJPTFVQMzJ4QklaTDZSVm5M?=
 =?utf-8?B?UnJFV25PWmV0TDVydTYrTTJ1aGd6MDRZbkFMVTk3WkN2U3BNZmVnVzIzN2Ro?=
 =?utf-8?B?azVHQm8zZWdVT1pQQUVESDFCcVZmaGFWeDNxZGFlTEZwTlh5aDlXSWlvQXph?=
 =?utf-8?B?bUNwWDhnMlFsMFRxc2R5Vll5aWo5ZWpZRmNnQklUSzdtTyswV1BxTHQ1L1BD?=
 =?utf-8?B?NmUwV2VaNnJXVXJUN29BU1dFTDM5NHl2bHpkYit3bVpaUVFkQjFiaXVGeHRZ?=
 =?utf-8?B?ZmQxbUVwTENMZzdXVHNpN0FxeVdNR2k3VTdhYklXMHZ6RGx6eWxYQU9WSUpq?=
 =?utf-8?B?SzdkbFRuTEpxdSthMlc0Um0ydWhFRTJ6OG11cjFFMEFWWW1Hanh2UDNEbXp2?=
 =?utf-8?B?UmI4Q3I5bFRiSzZFNmRWRlB6Nmx3T3M2U2tGQjhMcTlpQ294blJxbmNoeDJt?=
 =?utf-8?B?TkdvcFBBY1dnYUFxSk5BMG1KZkVMekpHVXJJb2xRU1ZocC81ZUdzSnl4V2da?=
 =?utf-8?B?bmFzV1RPdkVHWXVSZk5MektJOUtSck1sdUtOdTlaQndhTU9wWldFVXBPaU5Z?=
 =?utf-8?B?WWdPc3pBaVdkZ042L1lGZkFZOVJxK28xWjVGM0FjL0ZLa1hLWHR1anphNEJl?=
 =?utf-8?B?cTlkakYyVTF3OFMxa1Y2dTdIZmZHSWkvc2hXSDY5Y2h3MUI5R1N1c1U0ZWNi?=
 =?utf-8?B?Q2JmWmNHUEEyYTJlVFV4ZU0xOTFnTExVMExHWUYwcGJsS24rakV4OU1OK1JR?=
 =?utf-8?B?dzJESExXbGpmNW1iQXZVT1Uvd292UU5kWjdzRksxSE1LRHg4V010M010M3Zy?=
 =?utf-8?B?SUhjdnhKTTBJVmhoU2NQY2dOV0dtTVpabXptT0VlUm9tU1lrMWgrM2UrQjNr?=
 =?utf-8?B?MnJveWlmRE4xd1ZyMVorZnIrR2l6WitaZVBMVWZVUDRpS0Y4UXpJTysxQm9Y?=
 =?utf-8?B?OTRZVEYyYzJ2TE5EdytXTFFwWHNtUmRjN3FDUk9PT0JCQkk1L2JxTEFJSWVK?=
 =?utf-8?B?TGZtNHc5T3NvSFVRSk96MW9yT3NENmFwdStBU2pUWGpNRzNmWDFNN1Z0dWxZ?=
 =?utf-8?B?dWRBdDlFL3ZnTmpndDhCSFJPdzZFMWMvNmRka0w4ZFd0SkoyKy9FbW1VMk9q?=
 =?utf-8?B?VllnNU40Ti9RUjVpdVpTZVZhbko2NDB3dXNScFE4M1JzMHVMd0JmdTFRVHQ3?=
 =?utf-8?B?UlZQRnJncDFJT1hYVFJFaUk3NHhxVkh3bFZyVXZKSEpiSHA3aWlCKzhyNGxT?=
 =?utf-8?B?eXVxVHp4OVcvWFJTTkVReE9tNTcwa00yb2NFUm9QYzNqZU1IYlJ2ZkVGMkdp?=
 =?utf-8?B?RnlZM21mcVAzdzdmUTYxcW9wOThIUkZuODgzQnlYa2JtdzNxYVBxckJSek5a?=
 =?utf-8?B?NUVLY2lOcC9sQnZSUktGbjVVY2FmVmMrdG9MRjE0SlJqeGErZkRrWVlzZkMy?=
 =?utf-8?B?MHh0bERjbFlBL0o2Qm1kamNHaUJwZkdrTVVxVDZvWHBDSjA1akw2alhjVDJw?=
 =?utf-8?B?WGljOVRUVld4REdIaS9ZTlFVL21saU05V3RseFQwT1ZTaWlVdUNHWWRXQ2F3?=
 =?utf-8?B?NmdqVkVuM3lqNm9uN3haZGFBOWxRM3RyOGdoREREaUpFWmhzbzZYblFma1hp?=
 =?utf-8?B?ZWRIWlcwZHBMZHF6cVlYcFUycFRDQmxhZUM0bzBMU1Y3cXFFTVhWTC9tM0g1?=
 =?utf-8?B?MERndDZuQlMxekc1a09hbkdaS3U5UkNXNXdseFF6dE9ScEl4Nk1rdEVCVkJn?=
 =?utf-8?B?WklWYTEzUjN4bEZvOGZNalpmaSsvVnR2eGthbUdkY1RMMWJ3ZnF0dWhXaTRo?=
 =?utf-8?B?YmJMZWdEUXRER3Z3Zkx1czFLR3RqL0JSWXNOTFE3VHVxNVR3dnJyb2NaekhK?=
 =?utf-8?B?cHNQSVBKVVRuODV6RkU1enpTbDUrWjN1TzEya3RUaytoeTFWT3dTeEdjdE9O?=
 =?utf-8?B?bFB4ZUVld1FOUGNLeThFV2E3L3NLTlo3UFQwTURBRERNdzFDbkZlWUJNY2ps?=
 =?utf-8?Q?uzM0dg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 194f5d74-ebdc-4fa9-d60f-08da0e740fdf
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 15:28:07.4169 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: amc3TgZJdS/jA4OumYKOgJ117YcCUa1fNdyk9YqJQgQagyAtu4rOh+xWWDgK3Tf5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0005
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
Cc: gustavo@padovan.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 sumit.semwal@linaro.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 25.03.22 um 16:25 schrieb Ville Syrjälä:
> On Fri, Mar 11, 2022 at 12:02:43PM +0100, Christian König wrote:
>> Add a general purpose helper to deep dive into dma_fence_chain/dma_fence_array
>> structures and iterate over all the fences in them.
>>
>> This is useful when we need to flatten out all fences in those structures.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
> One of the dma-buf patches took down Intel CI. Looks like every
> machine oopses in some sync_file thing now:
> <1>[  260.470008] BUG: kernel NULL pointer dereference, address: 0000000000000010
> <1>[  260.470020] #PF: supervisor read access in kernel mode
> <1>[  260.470025] #PF: error_code(0x0000) - not-present page
> <6>[  260.470030] PGD 0 P4D 0
> <4>[  260.470035] Oops: 0000 [#1] PREEMPT SMP NOPTI
> <4>[  260.470040] CPU: 0 PID: 5306 Comm: core_hotunplug Not tainted 5.17.0-CI-CI_DRM_11405+ #1
> <4>[  260.470049] Hardware name: Intel Corporation Jasper Lake Client Platform/Jasperlake DDR4 SODIMM RVP, BIOS JSLSFWI1.R00.2385.D02.2010160831 10/16/2020
> <4>[  260.470058] RIP: 0010:dma_fence_array_first+0x19/0x20
> <4>[  260.470068] Code: c3 31 c0 c3 0f 1f 00 66 2e 0f 1f 84 00 00 00 00 00 48 85 ff 74 18 48 89 f8 48 81 7f 08 60 7f 0a 82 75 0d 48 8b 87 88 00 00 00 <48> 8b 00 c3 31 c0 c3 31 c0 48 85 ff 74 20 48 81 7f 08 60 7f 0a 82
> <4>[  260.470080] RSP: 0018:ffffc900009a7e40 EFLAGS: 00010246
> <4>[  260.470086] RAX: 0000000000000010 RBX: 000000000000000b RCX: 0000000000000000
> <4>[  260.470100] RDX: 0000000000000001 RSI: 0000000000000001 RDI: ffff888109a796b8
> <4>[  260.470106] RBP: ffff888109a796b8 R08: 0000000000000002 R09: 0000000000000000
> <4>[  260.470112] R10: 0000000000000001 R11: 0000000000000000 R12: ffff888109a796b8
> <4>[  260.470118] R13: 00007ffc5d21f750 R14: ffff8881065be340 R15: 0000000000000000
> <4>[  260.470124] FS:  00007f08bd6d04c0(0000) GS:ffff88885fc00000(0000) knlGS:0000000000000000
> <4>[  260.470131] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> <4>[  260.470137] CR2: 0000000000000010 CR3: 000000010e690000 CR4: 0000000000350ef0
> <4>[  260.470143] Call Trace:
> <4>[  260.470146]  <TASK>
> <4>[  260.470149]  sync_file_ioctl+0x2eb/0xc90
> <4>[  260.470157]  __x64_sys_ioctl+0x6a/0xa0
> <4>[  260.470164]  do_syscall_64+0x37/0xb0
> <4>[  260.470170]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> <4>[  260.470176] RIP: 0033:0x7f08c047750b
> <4>[  260.470182] Code: 0f 1e fa 48 8b 05 85 39 0d 00 64 c7 00 26 00 00 00 48 c7 c0 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 55 39 0d 00 f7 d8 64 89 01 48
> <4>[  260.470195] RSP: 002b:00007ffc5d21f748 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> <4>[  260.470202] RAX: ffffffffffffffda RBX: 000000000000000a RCX: 00007f08c047750b
> <4>[  260.470208] RDX: 00007ffc5d21f750 RSI: 00000000c0303e03 RDI: 000000000000000a
> <4>[  260.470214] RBP: 0000000000000005 R08: 0000000000000000 R09: 00007ffc5d21ebb0
> <4>[  260.470219] R10: 00007f08c0a6170e R11: 0000000000000246 R12: 0000000000000000
> <4>[  260.470225] R13: 00007ffc5d21f840 R14: 000055e80d13d1b0 R15: 0000000000000009
> <4>[  260.470233]  </TASK>
> <4>[  260.470239] Modules linked in: vgem drm_shmem_helper fuse snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio i915 snd_hda_intel snd_intel_dspcfg snd_hda_codec x86_pkg_temp_thermal coretemp crct10dif_pclmul crc32_pclmul snd_hwdep ghash_clmulni_intel snd_hda_core ttm drm_buddy drm_dp_helper snd_pcm drm_kms_helper i2c_i801 r8169 i2c_smbus syscopyarea realtek sysfillrect sysimgblt fb_sys_fops prime_numbers intel_lpss_pci
> <4>[  260.470289] CR2: 0000000000000010
> <4>[  260.470312] ---[ end trace 0000000000000000 ]---
>
> Can we please start running dma-buf stuff through CI so this
> kind of stuff doesn't keep happening so often?

I've did ran it through CI, but since the most recent patches didn't 
applied on top of drm-tip for some reason the result was just garbage.

Going to take a look into this immediately, looks like something which 
I've seen during development maybe the wrong patch was pushed to 
drm-misc-next-fixes or something like this.

Thanks for letting me know,
Christian.
