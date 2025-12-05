Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D62AACA72D0
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 11:34:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 346AE10E98C;
	Fri,  5 Dec 2025 10:34:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gUt0+zT+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010052.outbound.protection.outlook.com [52.101.61.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28AC110E98C;
 Fri,  5 Dec 2025 10:34:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vo3Vs19WL9pfR/pE1wLjNmNbkpG5E/dT5ZA9FKrrti21qclt5skrMIeNjcs3tugls0H+Ty/vOLPG0TcBnvOcL7FPTfqaimo7WlJtKm4TpA0nvZWHlsGonTXEsuXLCgLXjhBo9PkTcQGqWdLdB99QCjOuwiJFZ5c9dzUy6YbbbNPx5U/Ebbzkk0F3ANdy393eSTFNYCyRSZnUWRDarvvxlcpFoQUWOM2EVIZnGK6EKwAak/orHOzHuCfIShebcjOWRlZ5VOCJAOlN5HBzUvv4Q+HfNLCxD6zvwhcuZqibe963IXOnbWsNrG7CeFW3suc6epQDKNXJdI3qjthMeosqig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uyKXGnYqGdM6KR5kUThApYmU753r5jtnJvipTTe9KAg=;
 b=dtB9Nl5G29xHnXwieMexew5wWubepWcJLnmoHW75PvZi7Ub9EAfphbLKS4/1okP08APAczkMi12pjgT+xYv4mqDAkkqVXrb4DK7JGIq2VkG270lwBUCocL651nZ+NkO7yeC7nh4TgWd7U2LiJ8GGdEyX3bw/7plJcJEmob9u7GSYhgt+A/FaddE1WDvS/qjc4U9jVn10oF3OzNCcqbMb363Q2cvMBIY7p4+n194CnQr8HUMEzP8fXd90YKak4OIKOBV+jEkaHYIEPBe0Mk5TInWgl08vzLnGvdVwkeVXdC//U8B7hQmywUgVyBB42I3j+wVsee5eQRobpOPTwq/1EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uyKXGnYqGdM6KR5kUThApYmU753r5jtnJvipTTe9KAg=;
 b=gUt0+zT+/KO9wWoqPOI3Zlrc+xsHhdRf53YfcRrHPtnkPOOVHNw3aOpyQFOrC2orzK0GByPRCl6V2Dm4gixoVSObSRusP6yZ7tY1rORlrQID6X7f4lZ4yCJgYoJk+mdlUyBxIDKkrzdKB8TV0szLeRbdikUvOv+Xvcvibv/vx18=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB7091.namprd12.prod.outlook.com (2603:10b6:806:2d5::17)
 by CY5PR12MB6058.namprd12.prod.outlook.com (2603:10b6:930:2d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 10:34:12 +0000
Received: from SA0PR12MB7091.namprd12.prod.outlook.com
 ([fe80::d759:a62b:f8ba:461d]) by SA0PR12MB7091.namprd12.prod.outlook.com
 ([fe80::d759:a62b:f8ba:461d%4]) with mapi id 15.20.9388.011; Fri, 5 Dec 2025
 10:34:12 +0000
Message-ID: <3ed39b79-ade6-437b-bfd2-9bd8a3779732@amd.com>
Date: Fri, 5 Dec 2025 16:04:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] drm/amdgpu: add UMA allocation interfaces to sysfs
To: "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 "Tsao, Anson" <anson.tsao@amd.com>,
 "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
References: <20251205-vram-carveout-tuning-for-upstream-v5-0-1e87cf3b57be@amd.com>
 <20251205-vram-carveout-tuning-for-upstream-v5-4-1e87cf3b57be@amd.com>
Content-Language: en-US
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <20251205-vram-carveout-tuning-for-upstream-v5-4-1e87cf3b57be@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0136.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::21) To SJ0PR12MB7082.namprd12.prod.outlook.com
 (2603:10b6:a03:4ae::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB7091:EE_|CY5PR12MB6058:EE_
X-MS-Office365-Filtering-Correlation-Id: 236a2c52-5fde-401c-ba88-08de33e9d3ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q3NrSlozR3p6Yk9lWnJ3cXhjRFdqVTR5SndzVGtjRHp1S0NHSVlrd1RKRTMx?=
 =?utf-8?B?ZStuaG0zbjVFZVV6MTFnQUVOWG9reTIwWnlCa2pxWWcrTzgzK2l1YnZBYnAz?=
 =?utf-8?B?eTBZQi9ZTVRrKzFKWE5KZmN5bzFrNHBZUGczZ3RxeE9BOUgrS3g4OHdvU0o0?=
 =?utf-8?B?c1o5YloydDBxQ2lUMjlJNUszaDhpVWozbU92YTJXS1BpeHJISHJKVWNma1po?=
 =?utf-8?B?ZzN0MGw1T3VIdnRtc042ZGcrcTZPczhGQXRSRTNiS1V6VnRLa3g1ZklvaVA0?=
 =?utf-8?B?VlpJRThMb0tSYzNsaDdmUGhRVTFUSDltQ2xnVkFIK3I1QXVUdzF3cjNIVTlD?=
 =?utf-8?B?TzFPQ3VTa05Da1R3cGRXOFM2REdpWk45V0NoQlplWDFsdVZZcG4yb25MMDRo?=
 =?utf-8?B?SHRRT1p4MktrNDN1bDl2TmRQZHR1a1o2d2NkaW9ZTEpnZU55d1c0bnRkUWlH?=
 =?utf-8?B?OG1ENlhKejVGU0lsVlMwOFUxK21tNzdWdjdQSW1HQytOeU1kUFRVaTJzRUp3?=
 =?utf-8?B?WDU1Y0VBWnRZUmc5eTVybU9LeHRYaHQ1WVZUOUd1MzlLaDRhQm84UDdscGc3?=
 =?utf-8?B?bDEvUk9waC9SbG95WVZmUUxVWkxOR084L2FKNlliN1JhOGNEb2E5azlia2Nj?=
 =?utf-8?B?RGhncnVobGhsS1RkdG8yZ0F4T1Y1OXpSZXpueGJLOWtPci9pUCtZbDBaU3ZT?=
 =?utf-8?B?QzRZcTlwTS83Zk5PcHRYMHhnRW92TTBkS0IzaTNUQ0VlUUZpV0pUM1BKVEN6?=
 =?utf-8?B?TVoyblRCV3doMDZCNzNNTk85K3ROWkhtbHRWRmFBaUNuVFVJTE5GRTlQN0lW?=
 =?utf-8?B?WjdTS3FOZ1AwS280VitaVk11NVpBR2dkVUFxb0NlK1UrTTZZbW5Bak5vdnBS?=
 =?utf-8?B?dUZ1SG02dmlhcllnM3lyeUUvNlZ4blZ1dktGUVJOOVNwVFRZOU9RTnQ3a2JN?=
 =?utf-8?B?cEl4UnR3bUhXZ3l3dU11N3pnK0hJa1VsSVZnU3krN0plSUNMV0JmbmRYTGgv?=
 =?utf-8?B?VXhzSjdVR3BhdGR1blV0bTJQTUx4MDNuWWVQT3k0NjZ3UStOODU0M1Z5NDJ1?=
 =?utf-8?B?Zm9tMjY5SVZML253R3FJN0dSNHp4dXVNZEM4eEtNYS9nWFh0QTFyM1laU0dj?=
 =?utf-8?B?UWVLUGdqYVVORXg5RGd5b0VrbWJkM0V5WWM0YzJybWt3eDhWMUpPTXZwTG9w?=
 =?utf-8?B?SWZlRHlrSFhrNFJ6WFRmMk12clUzL3BaSERHdHBiVytzL2pFQUhsaC9RZG9y?=
 =?utf-8?B?UVRROXNxanRwQk9YYXZHbVZ0ckI2QTdPdUtUa242NTNhblpNa1lnVXBBSHlV?=
 =?utf-8?B?TnFXcGNjYWpxMERVM1A0bTdWcTBJdHlUT1ZxZTNZbFh2STFuNHBsSnM3dUN4?=
 =?utf-8?B?aGtBZmUyRnNoTWtGbHR5dG03Z3RNVHR5and3ZWlNV002QThLaWdUUEFIRDJa?=
 =?utf-8?B?R2ZyV2FrdFpOeExxam1nZEtxcmwxb1FUQjZsN0h1UDc4QW9kZ29rNVVpUFc1?=
 =?utf-8?B?dWVBNXhrZHlnalJRaVlWN0htVitmTVdiVUZKRFRFU1ZZb3gzZkNrQ3J0QzBL?=
 =?utf-8?B?RU0zWm11UmdzTGJMbEZZUW1SMTJiWXVoeFR3bXhRa0JCcFovbncrbFdzWnlS?=
 =?utf-8?B?UWI0VS83R3JFdjVsWWlSalNicEFkVWRtdkoxVUoyZ1RRTENBTGZXUGcycHU2?=
 =?utf-8?B?RXl4UnVESm8rZFQ4T0U4OUxCWkxjWHRhOVhJVXA0SW1IWFppYWxpWDh1RmlB?=
 =?utf-8?B?UHhrMVJNWXFEczNVQ2hqb083M2hoS1l2ZXdOWHBKR0trNXF5RU0ybERBTFpr?=
 =?utf-8?B?aVQvT3BnNEFuTHBqTEJObHZoaklONjhEQXRSWmUyUEIrNllSNUl4VXlsZGQx?=
 =?utf-8?B?allkZTdBQlFhK1pnbUhTYWw5Z1lKR0lyaUx1enlrSDQ2TGhVT0dkNURkSHpB?=
 =?utf-8?Q?Qf05VH0CyK5alwcBycdmugwk4glkDo1h?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB7091.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OC9wTGRYZXdtV2M3bzB0c0VVR2NrczB3UEk1N01QRGJNK1NzRUJrOFQ3YWJl?=
 =?utf-8?B?TnpEWTFpcmtldFlzT3I0bGlTWDM4aVRoWk1PbzlUOVN2L2gyaFVxU0wzODZP?=
 =?utf-8?B?a2hObUd5eEZwdkFWK01GL2pUK3VTWjBVRG9HbVJkR2d2ZHczOU55ajNkeERS?=
 =?utf-8?B?Z2tIckdmS2xoSFhFN002VVdrMzBoMm1jcmVkN1QrN1FHTUg1bEZJU0RCZjBU?=
 =?utf-8?B?eHkycFloN3ZaOFNqUy9tdDFVODVjaFQyckptdXlTYmNTYzFiQkNqQlN1cW15?=
 =?utf-8?B?UVNQODh4ZEIxZFIxYkpGSVc3MnFIU3VaRFY3MHE1VzFMRXZ3RGhDOXlMMjQ0?=
 =?utf-8?B?U3hvcEtCZWRORzFmWHJkUDBrdGxLMzE5MHZ1eG1xNWwvTForZ0Q5R1lwWEZu?=
 =?utf-8?B?Lyt2aTdoR29rVEFaYmhKKyt5elR3L21GL0dkdXltNDN5ZWtqNHcwVHprQ3ZV?=
 =?utf-8?B?ZTh4aTc0SnplMHVQdHBVLy9CZ3UzeGdjMUNGcnlGSW9GVFl4a0dZUmRnaEE4?=
 =?utf-8?B?ZUg4dmc0R3FFc2dpUTZyK0VITVNFdUlpVEpRZmpKN0JITDhQbDMzYTY4SFpm?=
 =?utf-8?B?VUwvN1JDNDhVeGNuSGlmTzVHT2pxMngvYWk0djdEVkZrSHlnZ05IL0xqdDNH?=
 =?utf-8?B?TVM1Y3NER1NpaXkrd1Y1RkJ2OVJzWVhmdFlGMTNwN2UwK3VvT083Rk5Payty?=
 =?utf-8?B?bTRWcllYLzA5UDhkcGxkMXlYT3ltbFNHUVFGN0MyYktILzNyS1MzRDIyS0lu?=
 =?utf-8?B?Q1pMSzdCOGVPRjVwSy9sRGNLOStOQ0JLUHBKb3NCTEZCNTJieVVlc09JVjh2?=
 =?utf-8?B?UXVGd0NubGpYaStINXYrVVg5eHVXSEdCcGdtRmd2VHRmOWQ2d0FOTGpUSDZG?=
 =?utf-8?B?dzBrRnlMdm51S3NoQWhzQldsNERsSlJIOEFIYVM4bnFvbXJ5bk9SaEptZ1dC?=
 =?utf-8?B?eXExQW9YQmZZU3U2V0pCdzVkMzAzMnNzSi85L0w3Uk02TG44VkdRVUhhSSty?=
 =?utf-8?B?OEZsdDFGWm5qUnRuYU5ldVcyT2ZxZ3BGM0Z3TFZvc05laTdaRnlQQlBpSXpq?=
 =?utf-8?B?NytUNHMzQTk4NjdMajVkNmlmeG1QZTlhRDhkaWd5bzR3Tllyalk5NU93NWJK?=
 =?utf-8?B?cmpST095MnRrU09IbjNrbDlWcGtvSVhzNnp4b2JpYVZmVWdqdTF0OHkwMWwy?=
 =?utf-8?B?Tk9qY0tIaS9RZmZ5cmNLZS9FbmZOZlNZSkV6bVFxWEFqWlk3bGwrdFdXNTRT?=
 =?utf-8?B?dlJ2eE45UExWcUoyRXh5SUtodkNmeWJHcU80L05KY3ExZWpnMHROWUdNQWlZ?=
 =?utf-8?B?M1k0U2k0N0FWYzlScGRCZzhNbXpqQnJxVnI5MW5pN1FRNkhHOU5FdGordHQv?=
 =?utf-8?B?bGFnUjdHWmVPanhlTmVnWUxybVd0MlVNd2JIbWIxZ2g3bk5HeWtqaVBlKzk2?=
 =?utf-8?B?U3ZFNVZ1d0Q1YVhLZ2wyK0J5Z1c0MStLS3lCbHRBaFJrWTlWM1pCNEFaV00z?=
 =?utf-8?B?MlJtTE5INDd4THVJU0NjRExQdFNldU9icWllUGVTdFVhdFBhL2kwaTZ6ZmVm?=
 =?utf-8?B?ZXVybjM2dzBxbEJ5UmJjbnhiVlpTbU9kSEJkdUI3QzhLdU9VdmVtc3B3TE9Q?=
 =?utf-8?B?a1hIMWVSRjhRdnJKMFMvdXgzUkhveXM1SEl4c01hSEFlSUthYVlzM1JGdTVI?=
 =?utf-8?B?VFlzZ2dRQUllRUNLeEh2Y0xUVHZqL21TMWEwaXdoaEFWckU4UEQ5YmFSNXRz?=
 =?utf-8?B?ZlpuMDg3UDhmSmtQeVNVdW9TRUZsMnhMK2xjejc2VnlpcXN2WjJTMmFDRytp?=
 =?utf-8?B?WW5Tazk1c3VTSG9HeVJPMFAzTmdNRVJXc1dsNUR0Zk1DSGNTSjR4NmtBajFk?=
 =?utf-8?B?bis4R0dZSzVsNi9iMllkeGY5bEpVNDE0MFNZMWlaSFBHVE9lTFl3dWNKTFJW?=
 =?utf-8?B?ZVhMQlN1ZTlTcnJlNUx3RXNuTmV0RjBYSktIeFNQMnlXL1B4ZytHTjNRKzlq?=
 =?utf-8?B?a1N5UDIzZkZBWi9yQ2pZL3k4cnF3Uy9qWkJWRzBtVWxpN2hzRDlCdzV0RE53?=
 =?utf-8?B?TVJjajhCb284NWt1QnJZZ1JSMkJsQmlvYTA2MFo4emkxbXp4dVFiclVSMTNi?=
 =?utf-8?Q?3SZAtu2jvxb/nUaTG3Bzo6trE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 236a2c52-5fde-401c-ba88-08de33e9d3ba
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB7082.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 10:34:12.2182 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UshbQD+FJ2+8874md3WmPi1dfyFGL96365uqiomexyHMOuRHHaU4cwibxZ9Wo0NM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6058
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



On 12/5/2025 12:20 PM, Yo-Jung Leo Lin (AMD) wrote:
> Add a uma/ directory containing two sysfs files as interfaces to
> inspect or change UMA carveout size. These files are:
> 
> - uma/carveout_options: a read-only file listing all the available
>    UMA allocation options and their index.
> 
> - uma/carveout: a file that is both readable and writable. On read,
>    it shows the index of the current setting. Writing a valid index
>    into this file allows users to change the UMA carveout size to that
>    option on the next boot.
> 
> Co-developed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h        |   4 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c   |   7 ++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 138 +++++++++++++++++++++++++++++
>   3 files changed, 149 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 6bf626a51dfc..177376ff5811 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1846,4 +1846,8 @@ void amdgpu_device_set_uid(struct amdgpu_uid *uid_info,
>   			   uint64_t uid);
>   uint64_t amdgpu_device_get_uid(struct amdgpu_uid *uid_info,
>   			       enum amdgpu_uid_type type, uint8_t inst);
> +
> +int amdgpu_acpi_uma_option_init(struct amdgpu_device *adev);
> +void amdgpu_acpi_uma_option_fini(struct amdgpu_device *adev);
> +
>   #endif
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> index bdafcde51107..b2779fc2f712 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> @@ -1288,6 +1288,12 @@ static int amdgpu_acpi_event(struct notifier_block *nb,
>   int amdgpu_acpi_init(struct amdgpu_device *adev)
>   {
>   	struct amdgpu_atif *atif = &amdgpu_acpi_priv.atif;
> +	int rc;
> +
> +	rc = amdgpu_acpi_uma_option_init(adev);
> +
> +	if (rc)
> +		drm_dbg(adev_to_drm(adev), "Not creating uma carveout interfaces: %d", rc);
>   
>   	if (atif->notifications.brightness_change) {
>   		if (adev->dc_enabled) {
> @@ -1340,6 +1346,7 @@ void amdgpu_acpi_get_backlight_caps(struct amdgpu_dm_backlight_caps *caps)
>   void amdgpu_acpi_fini(struct amdgpu_device *adev)
>   {
>   	unregister_acpi_notifier(&adev->acpi_nb);
> +	amdgpu_acpi_uma_option_fini(adev);
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index a7594ae44b20..979298d9c213 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -36,6 +36,7 @@
>   #include <linux/pci.h>
>   #include <linux/pci-p2pdma.h>
>   #include <linux/apple-gmux.h>
> +#include <linux/nospec.h>
>   
>   #include <drm/drm_atomic_helper.h>
>   #include <drm/drm_client_event.h>
> @@ -7835,3 +7836,140 @@ u64 amdgpu_device_get_uid(struct amdgpu_uid *uid_info,
>   
>   	return uid_info->uid[type][inst];
>   }
> +
> +static ssize_t carveout_options_show(struct device *dev,
> +				     struct device_attribute *attr,
> +				     char *buf)
> +{
> +	struct drm_device *ddev = dev_get_drvdata(dev);
> +	struct amdgpu_device *adev = drm_to_adev(ddev);
> +	struct amdgpu_uma_carveout_info *uma_info = &adev->uma_info;
> +	uint32_t memory_carved;
> +	ssize_t size = 0;
> +
> +	if (!uma_info || !uma_info->num_entries)
> +		return -ENODEV;
> +
> +	for (int i = 0; i < uma_info->num_entries; i++) {
> +		memory_carved = uma_info->entries[i].memory_carved_mb;
> +		if (memory_carved >= SZ_1G/SZ_1M) {
> +			size += sysfs_emit_at(buf, size, "%d: %s (%u GB)\n",
> +					      i,
> +					      uma_info->entries[i].name,
> +					      memory_carved >> 10);
> +		} else {
> +			size += sysfs_emit_at(buf, size, "%d: %s (%u MB)\n",
> +					      i,
> +					      uma_info->entries[i].name,
> +					      memory_carved);
> +		}
> +	}
> +
> +	return size;
> +}
> +static DEVICE_ATTR_RO(carveout_options);
> +
> +static ssize_t carveout_show(struct device *dev,
> +			     struct device_attribute *attr,
> +			     char *buf)
> +{
> +	struct drm_device *ddev = dev_get_drvdata(dev);
> +	struct amdgpu_device *adev = drm_to_adev(ddev);
> +
> +	return sysfs_emit(buf, "%u\n", adev->uma_info.uma_option_index);
> +}
> +
> +static ssize_t carveout_store(struct device *dev,
> +			      struct device_attribute *attr,
> +			      const char *buf, size_t count)
> +{
> +	struct drm_device *ddev = dev_get_drvdata(dev);
> +	struct amdgpu_device *adev = drm_to_adev(ddev);
> +	struct amdgpu_uma_carveout_info *uma_info = &adev->uma_info;
> +	struct amdgpu_uma_carveout_option *opt;
> +	unsigned long val;
> +	uint8_t flags;
> +	int r;
> +
> +	r = kstrtoul(buf, 10, &val);
> +	if (r)
> +		return r;
> +
> +	if (val >= uma_info->num_entries)
> +		return -EINVAL;
> +
> +	val = array_index_nospec(val, uma_info->num_entries);
> +	opt = &uma_info->entries[val];
> +
> +	if (!(opt->flags & AMDGPU_UMA_FLAG_AUTO) &&
> +	    !(opt->flags & AMDGPU_UMA_FLAG_CUSTOM)) {
> +		drm_err_once(ddev, "Option %lu not supported due to lack of Custom/Auto flag", val);
> +		return -EINVAL;
> +	}
> +
> +	flags = opt->flags;
> +	flags &= ~((flags & AMDGPU_UMA_FLAG_AUTO) >> 1);
> +
> +	guard(mutex)(&uma_info->update_lock);
> +
> +	r = amdgpu_acpi_set_uma_allocation_size(adev, val, flags);
> +	if (r)
> +		return r;
> +
> +	uma_info->uma_option_index = val;
> +
> +	return count;
> +}
> +static DEVICE_ATTR_RW(carveout);
> +
> +static struct attribute *amdgpu_uma_attrs[] = {
> +	&dev_attr_carveout.attr,
> +	&dev_attr_carveout_options.attr,
> +	NULL
> +};
> +
> +const struct attribute_group amdgpu_uma_attr_group = {
> +	.name = "uma",
> +	.attrs = amdgpu_uma_attrs
> +};
> +
> +int amdgpu_acpi_uma_option_init(struct amdgpu_device *adev)
> +{

To clarify on the comment about moving this to amdgpu_device -

UMA option is a device specific option which could be set through acpi. 
Options are retrieved through atom tables.

So the function names remain amdgpu_device_uma_option_init/fini() and 
init/fini are called within amdgpu_device.c

Thanks,
Lijo

> +	int rc;
> +
> +	if (!amdgpu_acpi_is_set_uma_allocation_size_supported())
> +		return -ENODEV;
> +
> +	rc = amdgpu_atomfirmware_get_uma_carveout_info(adev, &adev->uma_info);
> +	if (rc) {
> +		drm_dbg(adev_to_drm(adev),
> +			"Failed to parse UMA carveout info from VBIOS: %d\n", rc);
> +		goto out_info;
> +	}
> +
> +	mutex_init(&adev->uma_info.update_lock);
> +
> +	rc = devm_device_add_group(adev->dev, &amdgpu_uma_attr_group);
> +	if (rc) {
> +		drm_dbg(adev_to_drm(adev), "Failed to add UMA carveout sysfs interfaces %d\n", rc);
> +		goto out_attr;
> +	}
> +
> +	return 0;
> +
> +out_attr:
> +	mutex_destroy(&adev->uma_info.update_lock);
> +out_info:
> +	return rc;
> +}
> +
> +void amdgpu_acpi_uma_option_fini(struct amdgpu_device *adev)
> +{
> +	struct amdgpu_uma_carveout_info *uma_info = &adev->uma_info;
> +
> +	if (!amdgpu_acpi_is_set_uma_allocation_size_supported())
> +		return;
> +
> +	mutex_destroy(&uma_info->update_lock);
> +	uma_info->num_entries = 0;
> +}
> 

