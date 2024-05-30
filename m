Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 442058D4499
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 06:41:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC07C11B1A4;
	Thu, 30 May 2024 04:41:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Z95ScKKF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2082.outbound.protection.outlook.com [40.107.243.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C97D711B1AA;
 Thu, 30 May 2024 04:41:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FGIfKJzZgiBnx3MBj3GMS2724BRtpSqf9A7GE9fUW0qH37Mxm2URJ3ne5BYFrb5hQOOS8Old7ZEQ8dVK2q3tFnodchlgv+2nQw4jUTPuXm/HDy9ZAC0wW/UE1+I9jwDcl0eh7q2kbvo0a9gmzliBsHukA8NGAvImiWLcP8mlaPYy+oasyUsfWOZnxejYR3iAcdBO1Flma0i/bkZWaQvVM69v9Opo1CgVZdFN0FcGV2lZW/lSI4E4mOZ/LoM3FTUF1yv18b52Yab6tiPc1qkrbVxKzuHcYTdW4BU3/j1z/7yRCK9amJ9AFVN+7uii2DLVMyZs5c4Vepw8PHoj+HOJ+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9o4db4Zej+T6vEPp/wPvNpo2adBWMwjPNP+YlOdzA3U=;
 b=T3am9fpvpOt+9sd/P/wo82buH066WY7JMFy8j4kvt/z3sIqsIBsvbMzboRNa8xA9VPvOaGTG5haMorKd4EGwJh7YKF7ik8JL8+0SnafZri60PhLAgsFgO0s8gOKgDMBlUDRvhCFBZQcJrVwS/uy3r/yjLGjcyfnzPe7moMhcp2jX2Hkp+K5oTjZ6WeOhFmVNK1Hi3qtsufuIAIHrwVt6apqTSamNLwYzHM5gZy3ycopr6/kHBaqNdKLtMjsqcF3SWT+E27vdxb15gMrRVWPUX9MEZGs/eVJZI0Ck+auQnKmw1iFrIQ4+BCRaYamJ689h3/KOimhO183yLdw9wKFXJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9o4db4Zej+T6vEPp/wPvNpo2adBWMwjPNP+YlOdzA3U=;
 b=Z95ScKKFyDTxM1gxZb1I1pK+NahYBBn/TqsAVslxoYFJqiU4QoQPZkP+Z+KHWq1cJzxKlVS2xuLS3vXR2W5YSjI26YGzOSlOEncvGCh7MRan6ZOdMoVrHe6OwL4gB9HNja4LKDLkdkmEp56LlTILCyAiodZ4eIbMjeGmDAM5hAg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM4PR12MB5748.namprd12.prod.outlook.com (2603:10b6:8:5f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Thu, 30 May
 2024 04:41:16 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.7633.018; Thu, 30 May 2024
 04:41:16 +0000
Message-ID: <873b7a7b-139d-498e-89da-098cb3d7599d@amd.com>
Date: Wed, 29 May 2024 23:41:12 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/client: Detect when ACPI lid is closed during
 initialization
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org, Chris Bainbridge <chris.bainbridge@gmail.com>,
 hughsient@gmail.com
References: <20240528210319.1242-1-mario.limonciello@amd.com>
 <Zlc4V1goFvU2antl@intel.com> <197d195f-9206-41dd-8ff1-f4bb4988fb9b@amd.com>
 <ZldMKZ1MzSDXOheJ@intel.com>
 <g34f3sdk22grheq2vaaonkl543dtk7nb5sffqgmkl5ywtj5skk@p5ht5ug33q4z>
Content-Language: en-US
From: "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <g34f3sdk22grheq2vaaonkl543dtk7nb5sffqgmkl5ywtj5skk@p5ht5ug33q4z>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR18CA0026.namprd18.prod.outlook.com
 (2603:10b6:5:15b::39) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DM4PR12MB5748:EE_
X-MS-Office365-Filtering-Correlation-Id: f6ca288c-5d9d-44e9-38b0-08dc8062bdf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|7416005|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QVJHWFQyRk0yZUc5VW5PbmZOT3BHWjVOMTY2a3NSRGI1UmlDUmVnb0d6WGRa?=
 =?utf-8?B?ejlEQTRLay94YmsyR3plK3o4UVZHb3duQzhCM2hKelY3MWdVQ0w3emtiUHY2?=
 =?utf-8?B?a29GaU9CRXdPTnRSa0xKVWtUdE4wM2s1bG9va2VxaHIrcFJnTlZKZy9tUmlv?=
 =?utf-8?B?TnhtYWNkajlwTlhUS3U5M2pJblJWMzl5TlBCeDRQeVB4OHVNRDRsajhDZklQ?=
 =?utf-8?B?M0NoYmY3dWk3M0RPbTcrU09FOGljOGlvSk03T0xTbXhnYVA5L3lsbjJ4WVZv?=
 =?utf-8?B?aFZzd285djZxMUxndWFpb1YwbTR6L3hKeGhZYjA4MjZpdmt4NWVzTWxuWHBQ?=
 =?utf-8?B?enlnVG02bS9uL0lJcFNkVkFyNFJqT1ZkemtJWEU1VWpCV05RTUxYdjZhUnF2?=
 =?utf-8?B?QkJCMTd2THdQWWp6WjdQdkRYODYvUjdwMFBuUzhEbEVlTllqQy9EbUM0QlRy?=
 =?utf-8?B?NVk1Z3RyNmpFL0xQbjdYMXFsdGp4TFAvTTNobWtHSG5XdzVuVDhzbFJyTEJM?=
 =?utf-8?B?QzdldGVDL2hLYTYrQTZ3SGlrNVJVT2g3bnhLRlZlbWd2emlwZXlYeUJaUm9R?=
 =?utf-8?B?cU5UbTQvMjlvSWU1TWZpYk5GeVRpQzRuaXhKN2srL1JVb01SdTRBM3ZHOUFL?=
 =?utf-8?B?cm9Mb2NqajdvU3dJbnJLNU5aaVU2YWJ0ZDhVVXVhWElUUFRFaEM4bU9VaStP?=
 =?utf-8?B?R2pzZW00SDNyUlZqSk5teFkyK3FKVzlQa0dUWmJ5TG11WUJYQWJtTE50K0hS?=
 =?utf-8?B?ekZubC82TEF1ODBBdE1VSXV6R0kvMFJiS0J5cG5Ydkw3VzZKYThTc2Y4OEVO?=
 =?utf-8?B?STExOXh6bU5uZ0JPUklRM1p3Z1dpRVVLalUvN2hKejVxNlVLOWorS0NkY3V2?=
 =?utf-8?B?NWZFUVpVQS9ZWjZobzFoSTBJOXNCMVJDOXlBdFdiU20xMFFEMFBjRkJyQmJS?=
 =?utf-8?B?OFlidEV5VHRQdlViRHdIZ1V5Vm5PVVNCdmJMWXZ2MVVNWlBneGNHeE5ETlcz?=
 =?utf-8?B?b3QrY2VqN3BkZm1HZ1pCV05uci9FZVQ3aUR0KzUxeWpqbUNXa2RSRGw2VlRO?=
 =?utf-8?B?Z2hXRTNJN1ExS1pVb0trNk5HTHBqYytYRW5mM0pxekNMREJ0U0ljRlR0WXBa?=
 =?utf-8?B?allNQmg2MCtuZE56Qk9NblNCUHgwcW5lSVhwTXdxRGhvaEoyT045elFZOUh2?=
 =?utf-8?B?cS9WNm90Wm5qTFZXSFlURkt6ZzlsbTd6YWdDOGtiTDFRazZKekI2elVQYnVF?=
 =?utf-8?B?QkhJMzl0QnBJSEVkZ2dIMHo4enYxMUw2SDFNN2F6blRnZWtxTkR2OHB6SlRu?=
 =?utf-8?B?WXNvWXdGV1hRS245WVlySUZPUE1KVnVoVC8rK2lDb0ptREtzcGY1Q0JPYlJy?=
 =?utf-8?B?SWs0QWdodUZXaFphaFpLRWNvbzVhOTBDS0psRXNnRWc4Y3pBY1NQZnBvOTU3?=
 =?utf-8?B?WkYvZFhnYjdNTXMyMTlmZ2Y4cTdlVHlSVmF1MlpNY1g4MldkTS9vL0tLa29T?=
 =?utf-8?B?QXdlVnc0aUdZNXZEVmRSRTc1NE5JYzI3ZGhqR3JickNZRkc5V1dtcUd0Nzda?=
 =?utf-8?B?REtPNkd1YU41UDlaeGdqbmlvZm1iRDBURTNXUUxiUnRSVHY0UkllK2ROblJ4?=
 =?utf-8?B?NVA2cmU2VDg2ZG1vS0g0Y1NtNHBQOFNZbjNxT0FKUHdMVnR4UFkrdVVwQXZM?=
 =?utf-8?B?aVR3NWcydkI5U3RDc3dyUlZ5SW5RNGZ3cHVMQzBvVlYyMEpKM3ZaZW5nPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(7416005)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1M0M3E0anozSjR2YVJSQ3g1VEJRTjNVb2MvOGg0ZFRtVjNRckdub2twMlhn?=
 =?utf-8?B?Z1p1UDM1Yi9INDdaNktEUEowbEJmanhNYTI1bUxKZElxWk4wQXYvYWdRR2ZP?=
 =?utf-8?B?UjJKWXZCOUZITlkxa0g3dU5iK1RVVnVCakN5bTdxNnRTTFdGdzJFcVMwcUNM?=
 =?utf-8?B?R0hNL01TQ2thbzBueHNKZFNncFJSQWVBLzRkNkZ1NmRzWTVLcW94VTBQZGNG?=
 =?utf-8?B?RHY2VnM0YzhzSzdiSDRDQk9iRzRlTStmU0lrVjZpSkNSaUlSMU44MFFiNFI1?=
 =?utf-8?B?N0lhTFQ5dzBMTmVIN3RldXBrQW1VcFdBcGpuSDQvRWhubHBGWHRRRTJRQ3lp?=
 =?utf-8?B?ODdibGtUaFEwZWVVenBMenRqdmVtOElycnRYaHd5eGVkZ3F0d1hqNUd3aGVW?=
 =?utf-8?B?VDVKNVBvYWRzay85T1d5TndaSnlBeXdpK0pHT3pqVGdEMklnVmh6bTNWZUtV?=
 =?utf-8?B?bDNhZEt5eXVhS04rNzc2WUptdTFrV3BWOFI4eTRLRGRnSVJOZzJVcFI4OS9y?=
 =?utf-8?B?WG03WFpWUHBHTElFLytabUxzS0E1WTlETVliWVQvdkoyZ0VrU0NXeGdVMk4y?=
 =?utf-8?B?WGQ2WER4VXV1bHl0R2JVRld2cC9sMzJ5Z214ODNMS1VpemtiaGZ1WWoreEY1?=
 =?utf-8?B?bTZYd00vQmIzSzZmMGtYRnAxSkpnZ0hzN0NUYzJtVjhac2RGdEEyWjZ3S3Ar?=
 =?utf-8?B?V2I4UzZRNHpTdnluNUxVV2RFbUxJeXdBcnkzSFM3NXNBNk0xZGIvclVjbU5E?=
 =?utf-8?B?Tjh0anFGRHUzdHRUNGMrRko4ZkVzZy9hblVVNlNhNUdQKzBWYTJKNzVieGJx?=
 =?utf-8?B?Qk80VHRPSGg2TE1meGVZbVlXSUt3RmxKRXQ2Skp0K3JCVzIwcUZmeHQyTlp2?=
 =?utf-8?B?NVFZcHB2SURHdUZJbHhMTmcxbndacjViVlhMV202NkY4QnBGMEN6SWk2RVlL?=
 =?utf-8?B?cStmWFR3aklBZDgzOEdOSFZseTlCazhHdkRRUEY4WFBPMWh3N1dueWxFbWlo?=
 =?utf-8?B?WnRjaXdnWkJYMlJzNENlaHU2L2p2dzRrQ2lpZVRacDk0eWgweEdSbGhEazVo?=
 =?utf-8?B?cFJOSGMra0p1QVZEZEhoT0g0bzBibjVMVmwyUTdoS3BvYkRGYWpCdHppek0z?=
 =?utf-8?B?cE9FdnhSTFFiOERUOWZUd3NGV0ZDL0s0aEpoeCt2eE56N0l0ay9VbmxZdm5h?=
 =?utf-8?B?VzFDaHdrTDl3S1RLV0VCMDc2VDZZRjQwQ0gxcnlBc1ZjaFBOTDBSNGJicVdF?=
 =?utf-8?B?eDVVTk9LZEp1ZjhDUU9FMzV5bDRMKzRwbTl6aS9Bd2VIVnprdWxrUUt6TVpQ?=
 =?utf-8?B?eEdYcmdjd3ZWbmp5akxNMDBHTHFnSUozajU0bFNod3RQcC9DMGhZVE15Z01D?=
 =?utf-8?B?MWJaT2s0UmpsT1hhbG9mNXBNOXJxT3lzRjNicDlRZHNBUW9OY1VrMFRVWW5G?=
 =?utf-8?B?eXNKYnZ1aWxwK0MyRW94Y2tnVm5tSU9iNi9EUDVHWWdzMDZJOW02UllnZ2V5?=
 =?utf-8?B?R29jbE42SEs4SCt6dkFEcjFaUnk5bkNOcThaNGlTKzlucHAvbWJ3MFRCZGdl?=
 =?utf-8?B?aE1DYW9Dd294S0hXT0xuMXh2RDVCeSsrWmdMLyt3OEhIQm1kMVVsa0dQZEo4?=
 =?utf-8?B?SndkWk9VRnNzSzNMR3ZzYk9BVW56Mi92QW53MnJZUy82VnMxMTl6SUEwb1lX?=
 =?utf-8?B?QWYzcHM5aVl3MjhLNExRMlpyWjdrV2l6RkhxaU5TNjE2ZENtVHdBbEFOZ2JB?=
 =?utf-8?B?WDIyV2NTOVdIMS9IazJvTGRGZG5qZ0ZmUnhxUGYxTGRzaVg1NldlYWRMWm5D?=
 =?utf-8?B?RVFsUlpzRGdJNzBYbTNiamgrdlFYdzV1TnpUV2JOUThKVkdlQUFPbXFLb0R4?=
 =?utf-8?B?S3h0dFJhbXBWZjUzYXMvOWJmazIxeERxWFVKczZTRVVwQWxvWStQaThHY1p3?=
 =?utf-8?B?UmtXUzc1MzhkaEI4Q1JNUDJJSjBQTU1vSklWNXJ0UkFjWHNnN0cyZ1llYU9M?=
 =?utf-8?B?Wm1LQnNVUmVWT0N2U0tONEJHb1BpWUVKdHhuY2UvSElnUjNjOWFrSkxuRmdD?=
 =?utf-8?B?d1pYT0NnanpBUkVMcTVlMmc3SzlvTzdOcmNvem1HQXQxdjRDWHZNR2FsMUoz?=
 =?utf-8?Q?oYq1D3vSTT1VD+Hqy71cgkhf1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6ca288c-5d9d-44e9-38b0-08dc8062bdf1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 04:41:16.2969 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cA3StnI0+0/wer/09otnb/KGuGMXw+nrDZqrZ6gkxcN8ELxG4NWCgYxEOQDVaXFwqUoR/cWH4+nn3v5eyN2qHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5748
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


>> Also a direct acpi_lid_open() call seems a bit iffy. But I guess if
>> someone needs this to work on non-ACPI system they get to figure out
>> how to abstract it better. acpi_lid_open() does seem to return != 0
>> when ACPI is not supported, so at least it would err on the side
>> of enabling everything.
> 
> Thanks. I was going to comment, but you got it first. I think a proper
> implementation should check for SW_LID input device instead of simply
> using acpi_lid_open(). This will handle the issue for other,
> non-ACPI-based laptops.
> 

Can you suggest how this would actually work?  AFAICT the only way to 
discover if input devices support SW_LID would be to iterate all the 
input devices in the kernel and look for whether ->swbit has SW_LID set.

This then turns into a dependency problem of whether any myriad of 
drivers have started to report SW_LID.  It's also a state machine 
problem because other drivers can be unloaded at will.

And then what do you if more than one sets SW_LID?

IOW - a lot of complexity for a non-ACPI system.  Does such a problem 
exist in non-ACPI systems?
