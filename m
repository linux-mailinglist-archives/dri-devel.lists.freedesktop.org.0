Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CC49FE081
	for <lists+dri-devel@lfdr.de>; Sun, 29 Dec 2024 21:11:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA55E10E03A;
	Sun, 29 Dec 2024 20:11:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Y9Nhj1e8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2045.outbound.protection.outlook.com [40.107.95.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF70710E03A;
 Sun, 29 Dec 2024 20:11:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NAZWIDO1AFDcWQWCwixpx9c02vlMPbE/ZUYn/Xo1GDcTBaKIZuhfDBO6i5yUdamsaAyRZ4osgjkumYqeRAhFCdez6PgM6bjhfCSne/SPtQn5dIv0UBspavZBD+f8ICL9jDI/RAMXF8r19lb2itOTTVXq6ysm0T6NjWw5wDwkGipphSdwjnPgYrVWyX6uil7s4gl7jIbsVTleqXpZijfrIUGnr1dnY4yUfpwh+qnVKcg4QLTP/YQA0gOEOttT24Bv5EIJjMPdCL3C1aOGWxQQPEzacmazDNimCNWjB8w9XmF+jAZqgUyF5a6MZZB2OCfoG+3wPuIFXz7VOWDzTay5Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kYHwdglSc4IUbSlkcVVNNGIqRUkV3BF8eJXVSEcHqKY=;
 b=YyKYaXEy8JQEW/jVnJF8izB16KkB2BXB/uFjsverkki7+O1w+amuwSHSXTYFZf24XdKVGzVf8kREtxUW2HWBisJelRRhu2Sq2dYw3jOcnflOe97vADCASI/bl9Q2IF/cLoCf8al53IKM3B4ipV20wdavoV0rgG2J+B2EKoNFrK64w+onqbMz0HSmG0FWW3d7ZeLzlPaGCVM0MWqSLbYpVknxK9WNK6XhLPOzGAVtbQgA0Be+wzZD6KgpuHFEqoq9N7ZkxBBHF/XMN82cXukZ14jrH+TH6O3SaShw/jsVgBuaE2Hig3KQtiCRsCFIT20TFzhNUpONGIPdmQLF9lUykA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kYHwdglSc4IUbSlkcVVNNGIqRUkV3BF8eJXVSEcHqKY=;
 b=Y9Nhj1e8XhTzlniB9Uatw6JPDnw7CF9E3nt6vt16jVmDDAw7BNGoLAI9wbMVV3bNms4Ey/IdedpYDwB00jvydF0oo4GH70lrGXKxvDRRTBa0DQB/tmR6ArTExXEdFiY0Suq/Oh9GxCDIQuJ75tNVxoTEiAUFA3uwXX9gOfdmQfQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB6555.namprd12.prod.outlook.com (2603:10b6:208:3a1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.17; Sun, 29 Dec
 2024 20:11:45 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8293.000; Sun, 29 Dec 2024
 20:11:45 +0000
Message-ID: <563b1797-5524-44c5-89b0-754f245e6b8f@amd.com>
Date: Sun, 29 Dec 2024 21:11:38 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: Enable runtime modification of gpu_recovery
 parameter with validation
To: Shuai Xue <xueshuai@linux.alibaba.com>, alexander.deucher@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, simona@ffwll.ch, lijo.lazar@amd.com,
 le.ma@amd.com, hamza.mahfooz@amd.com, tzimmermann@suse.de,
 shaoyun.liu@amd.com, Jun.Ma2@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20241228063245.61874-1-xueshuai@linux.alibaba.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20241228063245.61874-1-xueshuai@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB6555:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c8e8721-1206-401f-9b56-08dd28450493
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MWt0VFRacVRUWmx1SGVFV2FydGEyTHNRbXJ2N3ByQ25tL01rVHlGTFBQcVJa?=
 =?utf-8?B?WmlYNENmYXRhRmpNWDFYZHM0eWtHbnB6emczNXNzdFAzWVFJWk5nYTBYd25G?=
 =?utf-8?B?U2FkNjg3RmJSWkNQeDFmSFowOUJlWTUxS1lWYVJrcWJrcSt0YzQ3cFQyZmF0?=
 =?utf-8?B?dmI2TGt0ZDJUSHlZNmozN05td3NMcXZ6SkQ5UlVjcUo5K3cyM3Y1OS9yb0Mv?=
 =?utf-8?B?YnpUN2dNL3ozL2tGWVFTQytMVXhDek8xaWlQQnQwdGZwaExjNkdTTUN5SytZ?=
 =?utf-8?B?cVpEQmM2emhuOE9CRG8xcDA1RGozbldsZ0xKbDR2bmltZ0QxVE16UHdMUzBz?=
 =?utf-8?B?ZnEwTW10d2hzMFQzMlEwZzNjNzFIbWNybzIxYkdLL3JCd1FmdFo3MTNLeDNw?=
 =?utf-8?B?M3Erc2FXYWlrQU1JM3B0Q2swdy9yQkM0YnNCTzMrRnBBbTdqS21PbzFwTHdn?=
 =?utf-8?B?ZDBRYlg2TVhpSEs5KzQvc0tUajZmbWo2V3JoQ0ZNTVZJcmF4QWdKdmJSclB3?=
 =?utf-8?B?STU1VnNaaGM3Wndydkl6OEtpUGxndzNLN0lLMENXbkdHRVNzYkw2akpHWGU1?=
 =?utf-8?B?VFBWbkR4SGZsK2RnL2NPTmpWZlNQKzNiTlNXK2FEVlVGaXNNSmxpMEdZUEw1?=
 =?utf-8?B?SXR2TWNsbjlrTllqRmY5RTBucjk5U3liblhJRE0vUlpaNndrRGRObVRVRTgz?=
 =?utf-8?B?U1JxNkEydlRzdkRWc2FyZmtQMmtnSTlEenJQbVZMNkNiSloxTUdEOWRwM3N0?=
 =?utf-8?B?UzhsMEdhU1VDbXNxUnd2UWc5anRyQ05vdlJTbkp6ZDRGR21TbVdYMFV2OVQ4?=
 =?utf-8?B?R2c4b3JMN1JjZkhpakJZelpmbU1IM0hFeTI1YWhDMUtuaHFOTS80aVg0Qjhi?=
 =?utf-8?B?SnFEWmRuamp0MmNqT3crUHdISGIvNmd3dFhCVDgvUzV4VWJnMkUwMXYxWG1P?=
 =?utf-8?B?YUdFZ0l3UTNKUXVCa0plcnBQL2x0ak42Uk9WOURHR1BoMVZDYjZGYkdoZTFh?=
 =?utf-8?B?U3BGUmpjZllTd0JUeGczaGtFZHVIQTZ1d1FDK1dqdndXaUVFbGc2ejVSZ2xO?=
 =?utf-8?B?TFhsZjR3R0gvL1BGY3JRbEdnN1BobDdQNnBMMWxGMW53NEVEa2dtRjlQc3pY?=
 =?utf-8?B?K1lKM1pNMGZ6VWdVTTB4TlJ1ejA1aUdQck1jaUZOL0JpdGhJc2JSL1VyZ3Yv?=
 =?utf-8?B?eW4zdzdyYmJBV2s4QzJNN0ZuazlCWStyQlhSVjBaNUFiV1ZPZ0FnNFc1ZkFD?=
 =?utf-8?B?R1Vza0J6QVRyODZhNHVDemxDKzZ5b0dnWUpvM0FkNEVQZElWcElPNDhjYXV0?=
 =?utf-8?B?cm1sOFVQWEN5bUllbWlSWi9aRHlleHJ0T0hHaDFLNFU4c25lRy85a0lqT0po?=
 =?utf-8?B?TytEekhJaGwwcm5pWVFTdnRSZ1JVcVhaMmVsWGFTWjRxUHlBYTN2QUcvQjhz?=
 =?utf-8?B?VEV1QXk4dWpLNkpVcnRSNjdERWpPUVFCSmtMNkt0MkpVZWtrMEZSTExVazlo?=
 =?utf-8?B?U0VCSWRlclhndjRXNEc1dkU1alN2TURoeGE3cU4wRTlSOXlLWEtFVXJ6bkNX?=
 =?utf-8?B?T1R5ZzNaSzhhSDFCRGRSZU4xaVQ1Mjk2L3d0S2NQdzRqY3o0L1dlM3VUYlM3?=
 =?utf-8?B?ZjZHeVJCQTBhYVNTWStISGRxMWJ4TzlJN0RnaVpEZFp1eHJqVGtadjFCTzcv?=
 =?utf-8?B?MlFIQ2dpVXZ6VFg3dkVGT1RVYlJvRHpITUJLdVg5UVNNdEhDTVZiM3ZFMkk4?=
 =?utf-8?B?dnJBdzlSVW8zdmJhTnZqQzBDN240VnZyUlBYREFWWkZ0QXFlSXJGNzBqYm9q?=
 =?utf-8?B?dG1hZzU4WHVNamU5RVNLNnBDRFNpTGo1QWVmN1hpUzlRSHBoWnVTS3JoNzlB?=
 =?utf-8?B?MUNOSlBOV3FDb3pveXFrNTAyTURLbFlLNG1pVVUvUkRqTTQ3WHlGSXdEZXRP?=
 =?utf-8?Q?vB0eNxD9GLM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(921020); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tjdyek1nOHBkR1RSbmxDWCt1ZCtqK3NOLzNVMFBLQ0hxcUtCQ1pYY0Zob0FX?=
 =?utf-8?B?bmgwakRLWmJBOVloSXovMmdRclRZZFROdnYxaFJlS3pSdUVvRHJXZmNaeGF5?=
 =?utf-8?B?V2ZTMDhMWEE5cHRaeGtZaDFYM3BLR1hCKzRsVmFSd01RRUxQaFlPaVNFeVJq?=
 =?utf-8?B?eDRteEdTcGxWRkd3NjRIS2Zza0FxeU5FRURpdHVDaHlETHVkeVZPVDB0RzFW?=
 =?utf-8?B?RE0zS1NtUDVUQ3JBcndlVzlvNGF5L1dRTnpFQUhzWjUrek9SZ0JOYUdHdHNB?=
 =?utf-8?B?VnhFSVpPcnhIclNueitDNWNoMEVGNmxaWnZuV09vaTkwZEN6a0l5YmlDQTBR?=
 =?utf-8?B?Ulkrd1JuajllZDlRNHFhTVBEMWUxeU1PbWFSYnN2d3o2NlUwVjhVa2ZyVHlT?=
 =?utf-8?B?Y3BBYXlBbFhNNlpFTWtNWlQyVlFVSDQvd0Z3ekpKbDVQdWMxcVMzak5ZOTV2?=
 =?utf-8?B?em9ZazZQMmJMNi91cVRKa2ZGWC9FNGNFWFlxZzlrMFg2RkM3czlOSmpMc3A0?=
 =?utf-8?B?T0QrVWVWcS9vWXYyRDVZdWFsbm0xTmxac1dvV05aUFc1QWVDSUd2ZjB4NktB?=
 =?utf-8?B?eXNnTlhyd3hZSmtDTHgvWkdORFVya2V6THpGYmExMktGQ2tZWTZPMkc0N1Br?=
 =?utf-8?B?S0JraXB0WGl1NkFQZHJmbWpJWDNpS2o3TUxSY2t6aXpGVWt2aW9tZFdENUk5?=
 =?utf-8?B?QmxDUkk3cVNDNEk4cXE1ZVFPS2F4QnhSZEhEY0lCQW1SY0VMWUcwZUpsRjlE?=
 =?utf-8?B?UDhVSlhVcitKWUcwdUVQOVVqVGFrR3J4NFhkZlRNdHlva0kweGhPaE9jbjAw?=
 =?utf-8?B?RldNekM3RVZaYTVyZEFtYTBhY2NacFNyNWRUd0tTWHZBVUVGOG9xZVJwUWVj?=
 =?utf-8?B?NjVseTh2TktvdzIzSXVNb1ZNRk51Yko0dWpNVVo1QldPU1RWM0dwVk1qU29n?=
 =?utf-8?B?Z24zYko2TnJ1V2FRTGxwanN6akZ4Q3JFbVozTk9zRjhScG4wWHNHZCtmRUJE?=
 =?utf-8?B?MnQzbWZZSk9pS21jeWVqRzB0OFE5WG8vYlcxTVp5TkdPREh6WGlzZlhSbnkz?=
 =?utf-8?B?SDROV3VlSS9TZjRrY1pJQUVRdGVQdlhqd2JIZlhUcVlKaFNHNVMya1lsTWVl?=
 =?utf-8?B?UlJxQjBjSWdpQjBCd3RWeFV1R1dBc2JFU0pFRXJUempDNzlYWVFIczJaeXh5?=
 =?utf-8?B?THRJUUZ5NXpHK3Z3RWVjNmtQVGp0U2Y4dDdxb1oremVNdEJFeXZramg0ejNJ?=
 =?utf-8?B?Y0M5elBiVWI3R1A2ZlZIMk5PSjZhOWpyL050RjNVM25vSWExZTRnWURCRExM?=
 =?utf-8?B?OE1Oa0NJbzhaZnJKNmxuYzQwbVQxcWltNVMyNFYxcDEycXJYMWpycEdFWnZj?=
 =?utf-8?B?dTdvbjA2TVhHMGZTUnh0WXUwTzhna2hNdzRaeFlESm9wWEQ2KzU4ZXlYNjBE?=
 =?utf-8?B?N1RRMElUcHA1SGp0bUd5WmU5UW5mdXNHUXZXTEdMOEp4dENnRHlpRE13QnIv?=
 =?utf-8?B?WlJXbXAxM0U4U2JhalVCNVY1cEFuK0NhSU1BN1VFTHNRcXpPMmEra3ZydDRW?=
 =?utf-8?B?QXZCWFpNS010Y2ZESDVmUlpoWWwwSmx5aWgxdkJZSlJTb1hnUTZKM0VQSFlq?=
 =?utf-8?B?TFViYW1yS041ZXU4L084K21kVUpoN2NQUFlNOFh6R2lFWnlwSjAwVFRMb3dz?=
 =?utf-8?B?bVpYQ0dDNHBxVHRBb05laEVWNFY0eFMxT0V5VXh1ZjZ5ZVlYbVhyMnZBeWZG?=
 =?utf-8?B?QnJMK1hSeXJwMGp1ZG1Ba053SjdxblF6UHVteTdQOGZVRWZtSlJ0MSszcnZV?=
 =?utf-8?B?UWNJUWZGc1J5enZjRkoyZ3FkbXp5ODV2bkU5RWVNc3NSNnJteW9lQlVBZ3A0?=
 =?utf-8?B?UVc1bVBUNjBvcm1OZlhPckNUdmJUT1hnejhCekUyTnJxOTFWY0hweFJnZkxH?=
 =?utf-8?B?TFgwemZXYVdwaUhteUl3QURETmRJa25PUDNSQ1NFekUrUzJ2cDNiUjZNMm8r?=
 =?utf-8?B?MnAxYWdWbmlVK1YvWllIMnJveGlKZ3pvSmdNWS9DVGRJWlEwblY4SVk5cVo2?=
 =?utf-8?B?SmNFNjJlcTRUMkFRQi9UYURaT3NIZkVDVWMvVVErcDJPRENQaFRSK1NoSWJa?=
 =?utf-8?Q?FY+M335ltDPzxzYALosq8iybI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c8e8721-1206-401f-9b56-08dd28450493
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2024 20:11:45.3615 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /jdnrmVpdOkY3SI3+QN6q8E5Ia+Fl9nLlerEKi8NRlYhfYZALUmox4VSORILmi1Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6555
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

Am 28.12.24 um 07:32 schrieb Shuai Xue:
> It's observed that most GPU jobs utilize less than one server, typically
> with each GPU being used by an independent job. If a job consumed poisoned
> data, a SIGBUS signal will be sent to terminate it. Meanwhile, the
> gpu_recovery parameter is set to -1 by default, the amdgpu driver resets
> all GPUs on the server. As a result, all jobs are terminated. Setting
> gpu_recovery to 0 provides an opportunity to preemptively evacuate other
> jobs and subsequently manually reset all GPUs.

*BIG* NAK to this whole approach!

Setting gpu_recovery to 0 in a production environment is *NOT* supported 
at all and should never be done.

This is a pure debugging feature for JTAG debugging and can result in 
random crashes and/or compromised data.

Please don't tell me that you tried to use this in a production environment.

Regards,
Christian.

>   However, this parameter is
> read-only, necessitating correct settings at driver load. And reloading the
> GPU driver in a production environment can be challenging due to reference
> counts maintained by various monitoring services.
>
> Set the gpu_recovery parameter with read-write permission to enable runtime
> modification. It will enables users to dynamically manage GPU recovery
> mechanisms based on real-time requirements or conditions.
>
> Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 26 ++++++++++++++++++++++++-
>   1 file changed, 25 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 38686203bea6..03dd902e1cec 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -563,12 +563,36 @@ module_param_named(lbpw, amdgpu_lbpw, int, 0444);
>   MODULE_PARM_DESC(compute_multipipe, "Force compute queues to be spread across pipes (1 = enable, 0 = disable, -1 = auto)");
>   module_param_named(compute_multipipe, amdgpu_compute_multipipe, int, 0444);
>   
> +static int amdgpu_set_gpu_recovery(const char *buf,
> +				   const struct kernel_param *kp)
> +{
> +	unsigned long val;
> +	int ret;
> +
> +	ret = kstrtol(buf, 10, &val);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (val != 1 && val != 0 && val != -1) {
> +		pr_err("Invalid value for gpu_recovery: %ld, excepted 0,1,-1\n",
> +		       val);
> +		return -EINVAL;
> +	}
> +
> +	return param_set_int(buf, kp);
> +}
> +
> +static const struct kernel_param_ops amdgpu_gpu_recovery_ops = {
> +	.set = amdgpu_set_gpu_recovery,
> +	.get = param_get_int,
> +};
> +
>   /**
>    * DOC: gpu_recovery (int)
>    * Set to enable GPU recovery mechanism (1 = enable, 0 = disable). The default is -1 (auto, disabled except SRIOV).
>    */
>   MODULE_PARM_DESC(gpu_recovery, "Enable GPU recovery mechanism, (1 = enable, 0 = disable, -1 = auto)");
> -module_param_named(gpu_recovery, amdgpu_gpu_recovery, int, 0444);
> +module_param_cb(gpu_recovery, &amdgpu_gpu_recovery_ops, &amdgpu_gpu_recovery, 0644);
>   
>   /**
>    * DOC: emu_mode (int)

