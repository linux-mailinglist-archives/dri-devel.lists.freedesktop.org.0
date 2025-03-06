Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0294AA53F06
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 01:18:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD75F10E7A0;
	Thu,  6 Mar 2025 00:18:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EvRmMMAT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2058.outbound.protection.outlook.com [40.107.244.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D44110E7A0;
 Thu,  6 Mar 2025 00:18:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FConBLS8IpT/nXaFW4HhGOAaRrmHeSDNzedC29Y6WFJ8X9lRsUgjjAgBlbGhwPoer0k+7WepTKvKF9fhnA4TiSk8FQW/paybgVK0g4TvHuU9zunYkXw0svydjI70RJ8DqNqhB/7uf55q8tkA7a6HhmD2oSttv26n4SoJA68erZ0PLDomBx6YXvOb6P/W5NvBPOeOLn4zplyI1uIJx+xYJc1P9WMQvh8gcZFvj3jKVxKdNfs1UNVMCDBxzLJeFt0LKBgHfuB5PbvbhujaM4/vH4BgMhmH9wWGdSdhEdjWIIntTdn8kKkrQW7G9lHffzrsKDNOK3v/nwscch6ZDhIeAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jUEBzYiMcoXn5CkBzdxaHmxBiKA9+v+urxpe+IKbdhU=;
 b=g2gZ5M/EBgrQsUWr2PdFjD09+tG0EmqSzrq9mIDwyy/CUXDwBfuokVUjwK+Zo7hfEe2twHR76WnucSL6wOWEU2YkeVVsEpuLO1edt0r6d+WILHZD1KpUbWPGpW+IfxJdCmKDyAR6GDO3UKIVNvi6rdbYlByqHAuiIgfJuAHlyNT/k3G3dDFKn48+5lv89sj+wEeeZ157iNzO6azWxQuPn34Cs26ZZX+lctaaRpOGg+SzZ3dja/5uSvl0Ee2WD7zW8pHhXcL2SbWlPznfDh8U2bt4J2Ue/4cKt/b8m3ggT7Z0VhY5LNziFT3wF/tzNvhN8ph57LAuhVMBbVUXCLUHPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jUEBzYiMcoXn5CkBzdxaHmxBiKA9+v+urxpe+IKbdhU=;
 b=EvRmMMAT4Hwfk2EKYvvALq3NgZVWdLTwAg/zCii017HM7TeNlgobPa7TxBVtJHjofEf1DyKSa6wlnSuJ4m7phrFHt8uwGtKtqz+ZZSyMbycA2yBCmg+X5zhKQXm7QDfmqLSdDDTOaBxvKM4RsY26I13loKfF3PpVPd/BQNjGR6g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5112.namprd12.prod.outlook.com (2603:10b6:208:316::16)
 by PH7PR12MB6859.namprd12.prod.outlook.com (2603:10b6:510:1b5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.29; Thu, 6 Mar
 2025 00:18:41 +0000
Received: from BL1PR12MB5112.namprd12.prod.outlook.com
 ([fe80::4179:4c7f:76be:47d8]) by BL1PR12MB5112.namprd12.prod.outlook.com
 ([fe80::4179:4c7f:76be:47d8%6]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 00:18:41 +0000
Message-ID: <a5b1d94e-30ee-411c-88f5-1e340068220c@amd.com>
Date: Wed, 5 Mar 2025 19:18:33 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: amdkfd: Replace (un)register_chrdev() by
 (unregister/alloc)_chrdev_region()
To: Salah Triki <salah.triki@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250305210809.218138-1-salah.triki@gmail.com>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20250305210809.218138-1-salah.triki@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0162.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8c::24) To BL1PR12MB5112.namprd12.prod.outlook.com
 (2603:10b6:208:316::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5112:EE_|PH7PR12MB6859:EE_
X-MS-Office365-Filtering-Correlation-Id: a32181dd-fa8c-4f52-a29e-08dd5c446f7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YlVUckU2QkpneTlXMldJTWJvRjdJZ1YySkhlci92L2xFbHdsR3I1UEFCQXBS?=
 =?utf-8?B?RG5kc0R5VU1CbzZxUkEwNXUrYmlNdjZCbC80blIydnpwK2ZwTmZLTVQ0cmxa?=
 =?utf-8?B?VTFOdGRySjJlS2dxcG1aSFpmbGJSdFU4bldpbTA2VGphR1h4Wkc3akNOZDdI?=
 =?utf-8?B?SEVUSnBBTGxrWmpwNlpmeVBwd2J5Z0NOUkg1Zm84OFhxT2lyUjQ4aWZndzBE?=
 =?utf-8?B?c1llSzNBaGhnNndkK2hVNy85bU04WTBnTkxGYjNMell0aGZQeWI2THhDRkQw?=
 =?utf-8?B?ZmhwSDdBRjdlVWlkVjhubGs5bFBEdk9YcGZoUlVzN24wNUgxWTdrdWpzd3g0?=
 =?utf-8?B?QXZRNVBUeUN6NEYxeC9ibnJGUVdMUXBoLzhpQXExb2ZtZkgzdHdBRlVJZUV2?=
 =?utf-8?B?ajhvMVp6dlJMaUl1aVdoeWxaQlAwdmxFaThtM3FZUjloRktGa2xlUGpMQXpi?=
 =?utf-8?B?Sll4VUlsdXo0ekJDLzFrQ1NKQW8wVFBTOERYV0lMYmVUWU1EanpCZlgzZ1p4?=
 =?utf-8?B?bDc0Smoya1UrLzVVVXpNUFYxdDZSZktwTEFRNGVkTlY2Wi85cGg1S2N4aS9X?=
 =?utf-8?B?VHVGSitMMEVkcXN4MHA4YnBJOTRuT2ptbWlnRlZSNTRrRjRSR29TTVJEZFNi?=
 =?utf-8?B?NDBvY05OVWRNRms5ZDFlSm4wUHpKTWhFaHBXQmdXbGkwd1kyekxLelBDdEpI?=
 =?utf-8?B?c1o2T0pWTUhlTFZMOFJVeC9nUkpPcDJxanp1YUhwbU81YTFLNVJiOStvL205?=
 =?utf-8?B?NUNRUVNld084RHl3QXVWcWlGeFMwQWxzTHlOWWQrTkc5YWc5SHZ5SXFTZzZI?=
 =?utf-8?B?ZnFKQUpxczAwNDA4QktySjA3dVBVSjRrbHpEa2tZbUFXRzk4djhDRzR4RUNC?=
 =?utf-8?B?cmE3aTluTzBpTUN0dEtDa2JmSDNlaHdnK0JRb1Fiek5Rd1kvR1ZFYmpnUGZ6?=
 =?utf-8?B?NWRlWlU5dHBYZFVNZ3c0aHNTQWdwK0c3aExYYzU1cXFUYUtNZXBJMHIzUFJq?=
 =?utf-8?B?Ukp1ejV2UUlhTGFlR3lQRFlQcy9sdGdLWnZ1cHBQR2ZOWFE0ejA2bHBNOFI3?=
 =?utf-8?B?SjFGcUJQazhjbG1JRGIwbzdEWUxBL1h2MlVyZHBTc3ZESWF6VDB2NnZ2K20w?=
 =?utf-8?B?MG5EWFRNdkVwYkNYNkhmc3hSOHR5ek1qdHdFRSs4WlRuR21YT3JZZU9aRFow?=
 =?utf-8?B?VUNnTjNyTkdnZzM2aE0ySlhabmpMMmJrbFpldStIMm82RW5jZk5lcXV6WC82?=
 =?utf-8?B?dlpCRGJXbGFxejR4N0ROSHBOMmRGSVBtOWtMd3RpbkFVVjkvL0dId0xZOE5Y?=
 =?utf-8?B?UkxCY29UQUFoOUVkWndnYUFpd1NLSTVBM0FrenZUM0VxVkpsZWR1cldVTTBU?=
 =?utf-8?B?blAwcG9xOXFsM3hQK01HVjRkV3FzUlAxNFZNOCs3SXZlS21WZ1B3cmhlLzdW?=
 =?utf-8?B?aXVobWViMmZlNWdBS3gyOC95MVBheFRCUVhHSnQxTHVRaE1DdGdrckZWT3Ix?=
 =?utf-8?B?RXNEcWlVOW0wY0lKbWlhVE1vMGpNUDE0M0ZVcHltNS81L213cmNnNXd6cmhX?=
 =?utf-8?B?WVlqZ2lpdjdBMDFFYlJvelRlNm50NlNtZDVXbUN6cjVnVXpKWE54UHkrYncz?=
 =?utf-8?B?bEpndnNtVVhBMWIvVDFDV1N0QVh2WFdGSENNRUxDZWdHUXNVeTdTSXo3ZktC?=
 =?utf-8?B?c3JENis3L2xUV3RsWHUvUk1mVWh3THJRU1B0SGxkbHkrMS9Wb1ZZRVNNbXpT?=
 =?utf-8?B?WktIYklHdVJBYnRtMG5XMnJkYTR0Y0RuN21CYk10MFl2eEFUeEphZzZhalhk?=
 =?utf-8?B?SjE4NmFCZW55dWZXZThaQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5112.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2tGcnMreW1lVnJGclMrU2VFODl2NEpGbEl4Mm9paDJrTHZBRElmZDlGWjlJ?=
 =?utf-8?B?SFZMOThubVIrRy84K2xZcU1iMytnQTdYeTJ0MmtLR3V4ZGFCNzdLTkY0SkZH?=
 =?utf-8?B?elBacnZ3K0VBU2lxZ090L25TWHc5WG5mcFZuZWZla282bzZ5NUpQbm1GU0pX?=
 =?utf-8?B?TzRWTnhmcS9kRHhDVzh0cXNVWURDbGsybHNIcHoxMGdvbUVIcWdCSVRLOHZ5?=
 =?utf-8?B?VGRMZTZKSjZDcEFRbWZIYk9wSFdTV2JJUm5ldjhzQWF4dHF6MlhYK1ZkMnFF?=
 =?utf-8?B?Vm1FdlhWT3ozMjRyR01UTm9md3YwMTV6bGhlZUNOZ296VkdUSzhXeEU4dzNs?=
 =?utf-8?B?clp1YWl4VlBRUkRUZzN2NXBFaVFWeTg2djNzQ1d2ckNxOHhSVzZYQ040VENm?=
 =?utf-8?B?alZuUE9JR2lTK1RNRkIwblFWZytOU2dUQ3I0N09tZHNyQzU1Rm9pRjJZWjZy?=
 =?utf-8?B?Z29OV2RVem1OY3FsTDAvY1BVOTRBeWdDMVUrRzlGMG94aWdGdjFQcFRjd0hj?=
 =?utf-8?B?SmVPazhWV2hvRHVDYzY1L0ozQlFSZHJWNHJVTCtXbGZlRXNidlVZMWRIKzUy?=
 =?utf-8?B?M2lqNEFERk1rSE9pZitvUW1QREEzQytIcUJLNzhiNHhTdzU1SjlsL2tmSitB?=
 =?utf-8?B?OERLSzU2MnVSbjhPcjBkUGU0STh0QWtrSzVRQVNKNEtNblVLU1R1TERMRWZU?=
 =?utf-8?B?b0MrQ3RuYzBoeGlqdFJwTGdFRTh1U1YvK1V1aFNmT1JVZ0Z4UjFCNTd6RnM4?=
 =?utf-8?B?N3V1S1RRZVJ1R1lYUm1mUjNaZ29ob3BmZEVibDE5SHdQM1R1ZVV6aHQxTXBo?=
 =?utf-8?B?MGxjRXVLZDZtUnlST2p1czhHeU1vVzVic3NPbzlRVDdSb2xCMkRoc0p0MFpv?=
 =?utf-8?B?dmg1cmNYTTlidHNIQXQ2NUE0VnRPbmoyS1p1ZHZjcHdEVEpleCtmZHBUTm9Q?=
 =?utf-8?B?RFpDZDVjcmJmL1JkRDB4Nzd2UGpFaUVDN2d6b3VBS3gwUlpxbFdQL2VQdFdO?=
 =?utf-8?B?MXdpbU5oSWkvdG1mTzBERVpRdUpBdUdGRlpFaElhRGJSdjlmcS8veFFGM0N5?=
 =?utf-8?B?dzY2SzE0cmhmZE5NZHgyeWN0bllMVlU5eEc5NWxrV083aDlLQUtySmgxL1Nq?=
 =?utf-8?B?SUlPbzFISUNhd1dkZ01Tb2c5cldpTnY4amlJRzJKTUZIQVpsT0g2WE81c1h3?=
 =?utf-8?B?T01IYVVsL0ZzRUdRd1A0dXN0VGIyTDJZRjBhQmUxaC9mamVGeURjem94R3Zm?=
 =?utf-8?B?U2dwd3kvamFRTzFkY2MzTm9qakw2SmN0a3ZXQzVvK2Q1RDFGc1JRZ2QyUFZR?=
 =?utf-8?B?aldYR3hQc1BrT1BhZmlIaFp6TGk0TmRkMXoxL2x0Zit0elBjNFBCMVBzZW9N?=
 =?utf-8?B?WE51TndDT1I1WFFRdFp5aEJZSmFSbkpsWkdFUGVEaVZqMlNBaHEvQXphVUcv?=
 =?utf-8?B?ODZjSkpYUThMd0tYWFFPZEttUnUyWGZzQTJzS0hpTHhuSE9pZUJvUTRCbE9Y?=
 =?utf-8?B?RHV3OCtrVWd0Nk9VcENES1RURnJIT3pkdXplcUhKTitsaC8zeWZ1cHUzdldp?=
 =?utf-8?B?eTVMdnVWbG96WTAvdHBnSW9YaEgvbC82ZDlqaTVQUFQvdlppUGFuQlFCcnV3?=
 =?utf-8?B?Q3RXUGswcXcyWVUzcTRGSGp2aGtQTTB6SndpVzdzamQ0MjJhNUxWUGtVcXpN?=
 =?utf-8?B?S0hiUXlsZzBDVld3aWljY2VWMmYvVlpsZVRMYnFHejQwTTRlaStGQXd2enFV?=
 =?utf-8?B?bDZHL0VtZENxYzlVeTFRTFJjbTBhZmc2SGNibmd2cTl5N00veGtlZWd1NDRX?=
 =?utf-8?B?RGwwenBnekZmYmdnck5ubnIvVUQ2ZGphbGxBaE1naTFacm5pQzZpSThmVXdq?=
 =?utf-8?B?ODRLVnk1c1p3VjhlVm55ckJhbnhGMFB1d21jZDk2OUhNMHRRNlNkMVladzB5?=
 =?utf-8?B?U3ZFSlpReHJFZXZUcmQzdWE4VVRiM09JSzgydzg5UkRONUQvZ2dJOUZKa1J1?=
 =?utf-8?B?S3BIZ3dpaml4c0d1MThoRExRMjNhUHZGSHJRaS9RMG9YaVZYL1RXYTVEZnB3?=
 =?utf-8?B?Rk5IeWVaQktEKzg3UmFZbmQ3SEc3ZWIzbWZ5K2E2UnM5VnRFZ3VobmxWbmZw?=
 =?utf-8?Q?ec0X3pfkl7EvDMSjyYPmmNZOC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a32181dd-fa8c-4f52-a29e-08dd5c446f7a
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5112.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 00:18:41.0147 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bSlwQNm3GCE+38rKZqUfgUmrALczm0L8vcX/4icCGJnPhotFZxKjKLGBELNyrX9PO39YBDnrvsIpwBZ4G+QKNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6859
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


On 2025-03-05 16:08, Salah Triki wrote:
> Replace (un)register_chrdev() by (unregister/alloc)_chrdev_region() as
> they are deprecated since kernel 2.6.

Where is that information coming from? I see __register_chrdev 
documented in the current kernel documentation. I see no indication that 
it's deprecated: 
https://docs.kernel.org/core-api/kernel-api.html#c.__register_chrdev


>   alloc_chrdev_region() generates a
> dev_t value, so replace the kfd_char_dev_major int variable by the
> kfd_char_dev_id dev_t variable and drop the MKDEV() call. Initialize a
> cdev structure and add it to the device driver model as register_chrdev()
> used to do and since alloc_chrdev_region() does not do it. Drop the
> iminor() call since alloc_chrdev_region() allocates only one minor number.
> On error and in the module exit function, remove the cdev structure from
> the device driver model as unregister_chrdev() used to do.

Sounds complicated. Your patch seems to open-code a bunch of details 
that are neatly hidden inside register_chrdev. Why would I want all that 
detail in my driver? I don't see an obvious advantage.

Regards,
   Felix


> Signed-off-by: Salah Triki <salah.triki@gmail.com>
> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 35 ++++++++++++++++--------
>   1 file changed, 23 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> index 065d87841459..55c74466d2c5 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -37,6 +37,8 @@
>   #include <linux/ptrace.h>
>   #include <linux/dma-buf.h>
>   #include <linux/processor.h>
> +#include <linux/cdev.h>
> +
>   #include "kfd_priv.h"
>   #include "kfd_device_queue_manager.h"
>   #include "kfd_svm.h"
> @@ -61,12 +63,14 @@ static const struct file_operations kfd_fops = {
>   	.mmap = kfd_mmap,
>   };
>   
> -static int kfd_char_dev_major = -1;
> +static dev_t kfd_char_dev_id;
>   struct device *kfd_device;
>   static const struct class kfd_class = {
>   	.name = kfd_dev_name,
>   };
>   
> +static struct cdev kfd_cdev;
> +
>   static inline struct kfd_process_device *kfd_lock_pdd_by_id(struct kfd_process *p, __u32 gpu_id)
>   {
>   	struct kfd_process_device *pdd;
> @@ -90,17 +94,24 @@ int kfd_chardev_init(void)
>   {
>   	int err = 0;
>   
> -	kfd_char_dev_major = register_chrdev(0, kfd_dev_name, &kfd_fops);
> -	err = kfd_char_dev_major;
> +	err = alloc_chrdev_region(&kfd_char_dev_id, 0, 1, kfd_dev_name);
> +
>   	if (err < 0)
> -		goto err_register_chrdev;
> +		goto err_alloc_chrdev_region;
> +
> +	cdev_init(&kfd_cdev, &kfd_fops);
> +	kfd_cdev.owner = THIS_MODULE;
> +
> +	err = cdev_add(&kfd_cdev, kfd_char_dev_id, 1);
> +	if (err)
> +		goto err_cdev_add;
>   
>   	err = class_register(&kfd_class);
>   	if (err)
>   		goto err_class_create;
>   
>   	kfd_device = device_create(&kfd_class, NULL,
> -				   MKDEV(kfd_char_dev_major, 0),
> +				   kfd_char_dev_id,
>   				   NULL, kfd_dev_name);
>   	err = PTR_ERR(kfd_device);
>   	if (IS_ERR(kfd_device))
> @@ -111,16 +122,19 @@ int kfd_chardev_init(void)
>   err_device_create:
>   	class_unregister(&kfd_class);
>   err_class_create:
> -	unregister_chrdev(kfd_char_dev_major, kfd_dev_name);
> -err_register_chrdev:
> +	cdev_del(&kfd_cdev);
> +err_cdev_add:
> +	unregister_chrdev_region(kfd_char_dev_id, 1);
> +err_alloc_chrdev_region:
>   	return err;
>   }
>   
>   void kfd_chardev_exit(void)
>   {
> -	device_destroy(&kfd_class, MKDEV(kfd_char_dev_major, 0));
> +	device_destroy(&kfd_class, kfd_char_dev_id);
>   	class_unregister(&kfd_class);
> -	unregister_chrdev(kfd_char_dev_major, kfd_dev_name);
> +	cdev_del(&kfd_cdev);
> +	unregister_chrdev_region(kfd_char_dev_id, 1);
>   	kfd_device = NULL;
>   }
>   
> @@ -130,9 +144,6 @@ static int kfd_open(struct inode *inode, struct file *filep)
>   	struct kfd_process *process;
>   	bool is_32bit_user_mode;
>   
> -	if (iminor(inode) != 0)
> -		return -ENODEV;
> -
>   	is_32bit_user_mode = in_compat_syscall();
>   
>   	if (is_32bit_user_mode) {
