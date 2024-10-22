Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F569AB23C
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 17:36:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 106BB10E1FC;
	Tue, 22 Oct 2024 15:36:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ksUwNtvu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2040.outbound.protection.outlook.com [40.107.223.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A183C10E1FC
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 15:36:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FXAMYiz+SyV1ChdHqXFmQrhZuQiJvSohxcQHcMsKnd0A77iblCbzLt0D3Thfnw8GGkv3aTZkZPveniT8IlEMUAb7L0CUtIz685LqdEVga+h5L/hhyq5ORi7CEKc6oDtaJ0gUpoc+8MqvJx2uN+H88FkEgFgwDl6WDI4By3F9b9O3/4Xdp9DKaIQcFtU5omE+t6z8Ui4VDTetMywTwbi0TlLeYKfpRdLuPdD6KXkY3PkklZh78jXw6LyY0Ck1Bu9xRPqGfvVyHmIb8IpGh1CrTnwg4Nt2+Vp5m4h2f0NiMwaud+Ru8Q0wKNCRXaFxv5ojcdALLHyrfu4JLP5y9ZgDfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hUjysQuPdZ6wwDfCzitq1Kd/P5NOKSLTFCwgqljWRCQ=;
 b=RlFBo+5iZt3dhwX5w5/FsDet9TARzrMCSBClBXmbIcytHpPODSZWP2VwCMX4Bzaq06dPcWkR2F+2C6L20k6QQG8f68j+xVL01GelXIJfp2PtzYePRwr9xYicHcnNj8T/crWeZ1sbMfSGifDBi9Daj9iSqlHvbYV7AsXfqHHBsPKAhZEyAwsFqnuhOyMjC45d5FPgOBaCO0qcXWur7qsIziQ7vCtyzxiwFmN+c7F+4ecs4ailJSz3OXPGG1Eowp5IHpRHErhzuqy39c45E+NtqDuRp54m47jwQ+tsDYBJ0VT5EeDYZ8QZUpdFlH5+h3X8LFOwlvFw+InQ6y1MPhi02g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hUjysQuPdZ6wwDfCzitq1Kd/P5NOKSLTFCwgqljWRCQ=;
 b=ksUwNtvup5PRPjV/K2WTe1LhdSklmgsbnVjtXB4lp5xyzBolhQ/VTk/YgKSaAWJDc7dNjajycaT2vvily+E57xDgUciMJg3cTuudNR6E6z68KyBJrCZ1Lecin3Q3u3qCxIYRidlhj3msv6epx35lWoo26TkOtj1Tg4+xN8nFSc3pu83hHaiL06u5w7Be+G8y0WgV6oVCpUi3UMbsc5JFqBjqNYuIgUfdAL/Qo3c5erae5dCN0CtAkeL+fpRojwNTh11yA6Fph5zGM49fEgCckbNcju1mSsl+sGr2nvI0Yxu3iZ7KRBcKNi3S/13cjtuqAnRatoLB4W3mbVxZHoqH5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.29; Tue, 22 Oct
 2024 15:36:20 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%5]) with mapi id 15.20.8093.014; Tue, 22 Oct 2024
 15:36:20 +0000
Message-ID: <8b1059d8-7f28-4f97-9fb6-1d3c66cc3713@nvidia.com>
Date: Tue, 22 Oct 2024 16:36:14 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 42/43] drm/fbdev-generic: Convert to fbdev-ttm
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, deller@gmx.de, javierm@redhat.com
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20240312154834.26178-1-tzimmermann@suse.de>
 <20240312154834.26178-43-tzimmermann@suse.de>
 <1094c262-9d39-4a7b-bede-dc927cd1f52a@nvidia.com>
 <279c7b9b-9973-4eab-8321-a3bc23c97550@suse.de>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <279c7b9b-9973-4eab-8321-a3bc23c97550@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0039.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::27) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|LV2PR12MB5990:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b132a78-dd6e-4c2e-9ba7-08dcf2af46b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R3libGM5cWh3VkhOekRtdmU1UnovRXhlaFJaWkwrdjl5K1VEZmFtM0M0ZjBT?=
 =?utf-8?B?MVBXRVdJYjZBK2hqcHMyZ3I4Q09XaW1JZ0hSNmxqZmpsd3Bwd21mOGtod2ty?=
 =?utf-8?B?QUVzMlRJYUdheHRkWjdGYnBCMmt2UCtjRjI3UWpWZWlwS2Y4SmZZbkxOVEM3?=
 =?utf-8?B?L3pGZUo5N2dYVUpaSmUweGVMNHR6a2VYblRiN0pyK0xFRFhSMlpTbnNwYXhm?=
 =?utf-8?B?WWVZdTBvRFJTYjh5ZVBpZmJQNWJSR0FyNksrcFVIbmhPb2duT2xFczFGMUlJ?=
 =?utf-8?B?MjM0T2liQXBJZ3g5Vmg3Y1M5Mi9aOWdYMHhsTmJIZk9Xb0VKbUg0MFpnQnI5?=
 =?utf-8?B?aVV6N2VDTThmeFg4aHA4clcrakx3SHRvQ1k4LzBOMWY1c1RkQS92MGl0TzZl?=
 =?utf-8?B?QWdTM0dTTGkvZmo2am5WZlg0RHA5eFUvaGNNQlNqT3VYVXMzMlJnZTlvTFAx?=
 =?utf-8?B?L2lVOHZ6aFNyUUc5SEdVZXR5RlR4ZTVRMGxBNmYwaEFmbFpUdjc5NXFaWkls?=
 =?utf-8?B?TmVBZVhhZVVpOUNhS2daZHEwSGFBbkpyUXlyNnF2aENiT1lwdXlKMVpKR3ZO?=
 =?utf-8?B?Nnozay9yL3ExYXI2SnhZRDhJOGdHVlNuRGVpRGhLeWxIUHNmVnlPa1oyRWJ3?=
 =?utf-8?B?eVIrVW5ZSDNTUXI4Nkx0R2I4T1MyU2x1T3IvMW1QVnh2ZVJxbEVvZU9ZMGpG?=
 =?utf-8?B?ZlNVREcvcTZyMXlaZmtpWHBaTGw1R1ozUjY5NUM0ZENUTGJzWE94cW1GU1N2?=
 =?utf-8?B?bXlKVTc5ZE5LbHVBRzF5MWdxbEs2akhxaVhVSHhqQmFndm9yMFBTTVJhT0E2?=
 =?utf-8?B?ZXp5a0FoV2ZDM0RsYU5URE8rSURyTjlyZGI3cnZRVjRhOUNxZVlQYW1tZ0to?=
 =?utf-8?B?Z2ppZEpGaDVrcmYwK2RIbVJ2OHhDaEtUZ0h0aXRNdUNZcUIyR2ZHZzVxdk1L?=
 =?utf-8?B?YlRMWTFjSGYrWU9xQ0RqeG1zbFFReEtGZjd1ZXdPcWxmZ2ovUEhZQWpCdXBt?=
 =?utf-8?B?RjlsMVZMbmV3cytra1g3VndGSW1CcW15cnBIelZJRmhtTDI1YTRreDB3MmNp?=
 =?utf-8?B?RmZVQXJLOUpoc1dxOVE5c0Y2aFFZN0h4ak8rQ29IckFZVm9CRDJ1ckVGRDVE?=
 =?utf-8?B?enhYV1VRQVo1QnJkc2Y4bS9RQU9WWDJEWk43azlHeHhYNTA2bGZKUDByQVh6?=
 =?utf-8?B?SXRkVG83VE1VQWliak9Zd3VQUk5BL1FVV1FjQ0NjenNuMzU1a3IyeXp1bVRj?=
 =?utf-8?B?TVBlWFVhZEVDaHVFZFRNZXEyK295Z0pnUENMR1Q0aU9RanlZeFpSNXNpbmF2?=
 =?utf-8?B?aDBJOVRKY0dScG9aY0I1bjBZQ3V5Tkt5U1JCc2d6S2NPOUZIek9iK2RReUV1?=
 =?utf-8?B?M214NGorZjI2WVpPYncxdW9QbTB0VEhoRnMzODZPaEtpSTJWd3R5TTVmM1cr?=
 =?utf-8?B?UGdOb0pzdG1GWTVGd1kxZzViY0o2blBuU2MvazBGQllXTkZneXZKKzRmSXND?=
 =?utf-8?B?ck91TGMvd0pGNml0OENFWTBGS1V5OGhQanEyQXVDSFlRK2tCdmRFYXdKS1dQ?=
 =?utf-8?B?RjU2Mmp0d0s5cm02RGMyRzA5dWxBdXlETmZqeGo4c01HbThhR0RRc1orUW9Z?=
 =?utf-8?B?RWVWUTBsRUVmUFM5enptVThWUzdtelFvWFNtSXdndjJld3FpTy9EMklKUkxO?=
 =?utf-8?B?VDJXa2pmang2Y1VJclRpUjc4cGFiSWhCVnNSNDlTVHlQYWhINS9ZbXhvNVY1?=
 =?utf-8?Q?ZaB3ck9YsYrql8BCdAgoAaeUiWdACkRV1DMlt17?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB8784.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFJXa2xHZUt6OVE2czd1K1QzY1ZRbGc3MWdxWVROV2c3ODVjeVh1V3c1UEdS?=
 =?utf-8?B?QktVNURrVWx4OE5udjcxNmtpS3dkQnJjSU5PdkMyZmsrVFgyajVCayttV2Va?=
 =?utf-8?B?WDZJOXAwS3BRTFprUUI4cDA3dUpWMTJKSzloYnNQN3R6UXZVOUptQU9CbzBL?=
 =?utf-8?B?MVFVVlczdW5tQUl4ODJ3UDBkMmRKNnlVeThLVVFQYldENUtkb0hOWlBqaGE1?=
 =?utf-8?B?dTJLcjBqcm5GUXBnOHpyRDB6bG9EQi9WWlRtSURGaGFxUXRSY3JEdTljem9X?=
 =?utf-8?B?T09QM1BVRVNSbndDZVc1N0VySHRDK045aU1Sem9JUW9YQ0M5bzI1eHlQUThJ?=
 =?utf-8?B?cEZ0OXo5RG45TVg0TDhka29CNDNxUlBuRld1SWtUb0hnVnFpM2RBSlRTdkFm?=
 =?utf-8?B?d00yRmtCWlNPMnVtTGFxWkRveXlZbzI2akI1RlRLMVovYm1WeVZla2I3NnBX?=
 =?utf-8?B?VTd3RVhSTkRHcHVManRIWnZPSFBFdGpyUE14NE4wRVBUd25HemxMUndNTVdo?=
 =?utf-8?B?MWxIUEdWbjlJNU1Tb2c3TzVHMFlvRkYxS2o5WHg4MkxCMEpkOXU0WjJSTTRQ?=
 =?utf-8?B?R0RnaUFxejcwOXdHQUdBM1JBQ2VWNTZJdXJZVzVSOVExSS9nSGpyMndnWFFE?=
 =?utf-8?B?S0JjMUczQWdycWQwNUVRWVdWb21idjlPSWFaeHBSbG9oZExxTEMwNCtiMEo3?=
 =?utf-8?B?cUVVK2hWSkZXbERhS2NzUERKQVN6V1VHNWpqUUFoYk0vYXpuVEQ3aUhBZU9B?=
 =?utf-8?B?YWl4TUJ5RjZTK0tLMUFIVjlmMDQ5eTBuVmFqaW4yVFRiQ1hGM3BBRzVEbWY3?=
 =?utf-8?B?aFpIckxWMTRqOHVwdThTN1V6SEJUL1puVWg2ZXpPOGNlZWJUOEJvRHFpR3NP?=
 =?utf-8?B?NjlCVW5HNWlaSGhXZUZOZitVRXQ3SzdReVl2aGFON0VNaXNRcE4yeWJSenB6?=
 =?utf-8?B?cG5IbW82YkJqMjl1eGpPWkNpZld0ak9TN2t4dkxhVkdqdWhJdng1NmI1WHpt?=
 =?utf-8?B?cCtkQVBHWk9LYnpEbWMwa1I5Uy9KZnF6VXdWU2NHNDhqSVVQMVpXclJmblE3?=
 =?utf-8?B?bms2YzVwQ2tYQ1NCVjZCYkJuSWNDdUUycVIxZUhhcE92a0dwVWFBQ0lwK2My?=
 =?utf-8?B?NUJlY2N1UWRLczZ6Yko3VGNyRmpPUjRBQllzSk5wQ1IrZjJVeFk5K0dKejJp?=
 =?utf-8?B?VjA2UC92TkMyTmVqVm9lSGdXd2x1SVVmNXBsN1VqcWpNSE91VEk5bUFzRWpB?=
 =?utf-8?B?aDh1RDgzZjhDK3E5Y2U1MUxGeHVudXFGTDN4cXFQYjhUNU4zMFFTeEluVGdl?=
 =?utf-8?B?eHlYR2kzeVZFaUowY3R6Ry9BUGdOOW9yb241NzVPMEgyajJtL2xYWjgrSENn?=
 =?utf-8?B?WkVVUWVhMWRqTGxnVzV3V1lMdHU4MngveTdnNmc4VHZxUUxFaVhzQ0Q1VFVj?=
 =?utf-8?B?anJ4bk5yZStBR3o3VVhGc25VQzhvNTlWK3I0N2p5dmtnSFpyaXZkTzF0YjBU?=
 =?utf-8?B?aUREUS9WN3FyM2NOTHlrdUcwK2VLOWU4SVpNWlpkRkFPckdJZmJnVjVKOTd4?=
 =?utf-8?B?WEM0M25jTkdRbDNkVlhyUEp6TVFnNTNRRHFNbkhUNHo4Z2g5dE55c090NzZq?=
 =?utf-8?B?MVZxckJmZTIwOTVTY1ZSZURMMTVpWS9oM3dHbGh1Q1FsK1gveDJ5eDNacVhG?=
 =?utf-8?B?dmxzZTJ6REJWa1RjQWNXZThPak05RGN2SVZ6VUVhS0FiVTVNRzdpNkZwZ003?=
 =?utf-8?B?SWpsdDNJZ0dNc3ZKVFp3bXRxWDJtbENzU05sV3JIRndHS0NLTWFSR2RSWEpY?=
 =?utf-8?B?M3huaFJWWWEzZ0hrYnVUd0MxUkNxNi9HS2txeERGUVlzOEJaWlFBaEVJaUdL?=
 =?utf-8?B?MHJFS3VkcnRid214Rkdsdk1aMlUxVFRHcGtYS1h6U2Jnb3BkRTJYMk1oNzV5?=
 =?utf-8?B?b2gzODAwU01mdDljUG80U2UrL2FaS1JXUDk5V1dQN2h0ampySEF3ZlFybkdC?=
 =?utf-8?B?UmpmcTJva0Z3Z2gxUkxFQWpJbFBNcmp1VFAxM0taZ3N1UjNQMGJ1TEVXSlZj?=
 =?utf-8?B?L0lxK3hEL29ZRTNCcm1tbVV4dWdYajl2bnZBdUdEdSt6Q3lGN0dZaklySGFT?=
 =?utf-8?Q?0FaFyqoyCI1XpQEZuZljgJzre?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b132a78-dd6e-4c2e-9ba7-08dcf2af46b3
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 15:36:20.3861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HtcLOJ9k9rOUDjNMYCS2Z2ErAd2usTjSydCY7d6vIrIMZtPFlWdP6oUhJXLl/GDIPUHIJETlGNx3Nu+ESHmV/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5990
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


On 22/10/2024 15:55, Thomas Zimmermann wrote:
> Hi
> 
> Am 22.10.24 um 15:31 schrieb Jon Hunter:
>> Hi Thomas,
>>
>> On 12/03/2024 15:45, Thomas Zimmermann wrote:
>>> Only TTM-based drivers use fbdev-generic. Rename it to fbdev-ttm and
>>> change the symbol infix from _generic_ to _ttm_. Link the source file
>>> into TTM helpers, so that it is only build if TTM-based drivers have
>>> been selected. Select DRM_TTM_HELPER for loongson.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> ---
>>>   Documentation/gpu/drm-kms-helpers.rst         |  2 +-
>>>   drivers/gpu/drm/Makefile                      |  5 +-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  6 +-
>>>   .../{drm_fbdev_generic.c => drm_fbdev_ttm.c}  | 80 +++++++++----------
>>>   .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  4 +-
>>>   drivers/gpu/drm/loongson/Kconfig              |  1 +
>>>   drivers/gpu/drm/loongson/lsdc_drv.c           |  4 +-
>>>   drivers/gpu/drm/nouveau/nouveau_drm.c         |  6 +-
>>>   drivers/gpu/drm/qxl/qxl_drv.c                 |  4 +-
>>>   drivers/gpu/drm/tiny/bochs.c                  |  4 +-
>>>   drivers/gpu/drm/vboxvideo/vbox_drv.c          |  4 +-
>>>   drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           |  4 +-
>>>   include/drm/drm_fbdev_generic.h               | 15 ----
>>>   include/drm/drm_fbdev_ttm.h                   | 15 ++++
>>>   14 files changed, 77 insertions(+), 77 deletions(-)
>>>   rename drivers/gpu/drm/{drm_fbdev_generic.c => drm_fbdev_ttm.c} (76%)
>>>   delete mode 100644 include/drm/drm_fbdev_generic.h
>>>   create mode 100644 include/drm/drm_fbdev_ttm.h
>>
>> ...
>>
>>> diff --git a/include/drm/drm_fbdev_ttm.h b/include/drm/drm_fbdev_ttm.h
>>> new file mode 100644
>>> index 0000000000000..9e6c3bdf35376
>>> --- /dev/null
>>> +++ b/include/drm/drm_fbdev_ttm.h
>>> @@ -0,0 +1,15 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +
>>> +#ifndef DRM_FBDEV_TTM_H
>>> +#define DRM_FBDEV_TTM_H
>>> +
>>> +struct drm_device;
>>> +
>>> +#ifdef CONFIG_DRM_FBDEV_EMULATION
>>> +void drm_fbdev_ttm_setup(struct drm_device *dev, unsigned int 
>>> preferred_bpp);
>>> +#else
>>> +static inline void drm_fbdev_ttm_setup(struct drm_device *dev, 
>>> unsigned int preferred_bpp)
>>> +{ }
>>> +#endif
>>> +
>>> +#endif
>>
>>
>> I recently noticed that with Linux v6.11 it is possible to enable
>> CONFIG_DRM_FBDEV_EMULATION without enabling CONFIG_DRM_TTM_HELPER. Now
>> while this does not currently cause any build issues, I believe that if
>> the function drm_fbdev_ttm_setup() is ever used somewhere that does not
>> explicitly select CONFIG_DRM_TTM_HELPER, then you could get a 'ERROR:
>> modpost: "drm_fbdev_ttm_setup"'.
>>
>> So I was thinking that may be this should be ...
>>
>> diff --git a/include/drm/drm_fbdev_ttm.h b/include/drm/drm_fbdev_ttm.h
>> index 9e6c3bdf3537..5b6723a37caa 100644
>> --- a/include/drm/drm_fbdev_ttm.h
>> +++ b/include/drm/drm_fbdev_ttm.h
>> @@ -5,7 +5,7 @@
>>
>>  struct drm_device;
>>
>> -#ifdef CONFIG_DRM_FBDEV_EMULATION
>> +#if defined(CONFIG_DRM_FBDEV_EMULATION) && 
>> defined(CONFIG_DRM_TTM_HELPER)
>>  void drm_fbdev_ttm_setup(struct drm_device *dev, unsigned int 
>> preferred_bpp);
>>  #else
>>  static inline void drm_fbdev_ttm_setup(struct drm_device *dev, 
>> unsigned int preferred_bpp)
>>
>>
>> The above function has been removed now in -next, but I believe we could
>> have the same problem with drm_fbdev_ttm_helper_fb_probe()?
> 
> We'd turn a linker/modpost error into a compiler error. Likely makes no 
> difference. And AFAICT every driver that selects TTM also selects 
> TTM_HELPER. Drivers without TTM should not use this header.


Yes I also noted that all the current drivers select TTM_HELPER and so 
we don't run into this. However, it still seems a bit odd that we don't 
expose a proper stub if TTM_HELPER is disabled (especially seeing as 
there is a stub defined).

Jon

-- 
nvpublic
