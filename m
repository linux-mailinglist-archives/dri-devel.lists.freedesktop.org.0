Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7469395F73D
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2024 18:57:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECCA410E25B;
	Mon, 26 Aug 2024 16:57:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PPdZ/DVa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2075.outbound.protection.outlook.com [40.107.237.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91C6110E25B;
 Mon, 26 Aug 2024 16:57:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n94pij+m+KT2W2C+voXDA+BDiKeoX01WylGJth057lPV92JdKEyFTMZtO6EvDFgDE/yIy4DdspSIuvrCPO8pyMGaxi7SJ7rYuu/tW9OIB9Ky232J3coI3MKh4cqXJmFTV/zFECo3WJj5MxaEHWUf0o7pkzqyHGf4a+ecaxGxs0vCQsoHuJ1vmnit9cJcpoxUG48Fbb0QZ0w4s4Pm8pxhMT3KDxdmITI/LZ68aroDAmzcC+iMVo6LSeU7ZFXwS1ZTYvW5diplXebp6wOOiGbSo31pHQ97E5fUjnDY74gZyqn/2w6RdGez/kILvp6DGSkDVLVEKzgQRDvnh/ic7JcOfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CVGV7PKEjTLXS8YxI0bvLBbKZ5o4Q2Jp1NKzV0Duksk=;
 b=hpA2pWSFMtd8zhoA/8azUus8vI8pv66gHLW7RDGAoIpUeEognwR6x5o4GdAw9NRKBVECSyXvQS70ttp6eBo0NawEgrnPLcWuYuQBC5KOxHS/1VCZYaMlXfWN4eEiVaqU19dlMQeG5Ro386pLtKkk0DvkuVNyaGBlvcvEnc38aLyg1l9HV07JMbMc4sdaLtVPF3aj6zt8q3ElzQz4gtB/w2HWCxM31iaSnUHwjbKIASsjVfZra9R9KYcBNBktQQl0pSlufgSq8M+9FtdYYGK7y/MHlnYTwrbKnn9W1ubzEiFE3l4Xh6YK0CMlEMigOXRssWgMaAnsrxpEX0lP4Xbr8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CVGV7PKEjTLXS8YxI0bvLBbKZ5o4Q2Jp1NKzV0Duksk=;
 b=PPdZ/DVaqMvBdzja2sQrtI62TM7VvDzfwM1ji29a8w3IxcGB/Uwmmz5/t7P/iYiZgUhrkzeSN9zojxy+1ACtw9tfI7Trai6O2a6ytlsJoMiT8/JTttUnvrCvF72kX4NkPJzDywYhoQfXFNf4XZtqvoe09SlQJZMQj/BCUTh+jWs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CY8PR12MB7538.namprd12.prod.outlook.com (2603:10b6:930:95::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Mon, 26 Aug
 2024 16:57:24 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.7875.016; Mon, 26 Aug 2024
 16:57:23 +0000
Message-ID: <1396eead-b584-4b36-b9b2-18ef783cfdbf@amd.com>
Date: Mon, 26 Aug 2024 11:57:20 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] drm/amd/display: Add support for minimum backlight
 quirk
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dustin Howett <dustin@howett.net>,
 linux-doc@vger.kernel.org, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?=
 <linux@weissschuh.net>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Matt Hartley <matt.hartley@gmail.com>, Kieran Levin <ktl@framework.net>,
 Hans de Goede <hdegoede@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Xinhui Pan <Xinhui.Pan@amd.com>,
 Jonathan Corbet <corbet@lwn.net>
References: <20240824-amdgpu-min-backlight-quirk-v6-0-1ed776a17fb3@weissschuh.net>
 <20240824-amdgpu-min-backlight-quirk-v6-2-1ed776a17fb3@weissschuh.net>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20240824-amdgpu-min-backlight-quirk-v6-2-1ed776a17fb3@weissschuh.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1P222CA0020.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:22c::21) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CY8PR12MB7538:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b54998b-c482-45af-b24b-08dcc5f02831
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cFZiTFNQTHlaQ3I2RmJHUGVpcEtCcTVLWHE1YVhydHc4Z1d2a2pvTXkyVnZp?=
 =?utf-8?B?SDg5RElyUEZTZytBV0hqVE1sVVZoRm4rSmdJT0RqWmsrNHBMZzVGb0d4T1Mw?=
 =?utf-8?B?ZytYMmNCcE5TOWhYMTF2T2Npa1NUbXJDMmFWU3VmRFdhSUFyWlZsamRVeEFx?=
 =?utf-8?B?eExxMWpwaCtVcm9kS0IwUmtxbHJmYm41VFhrWXZLSWNQT1I1SWxVaHFhQUN4?=
 =?utf-8?B?YnlrYzl1cnIzZjBwbTRLUlAxb2YxS2VVN1c0NW84dEN1RVZ6cnJFTjZnU2tw?=
 =?utf-8?B?dWQ2U3pNK3lIM3FhM0FDV0ljSHg4Q1duQmtLZmE4TTVGbkpmRUtlSmRlSWF0?=
 =?utf-8?B?SjVXWEMyVkYyeTVCaWJqNlVMWFdLMU9yNmdnZUZHNnUvZm1iTXorZ3pKNmFv?=
 =?utf-8?B?dnRtKzBNR0NZcXZ1R2J6ZituN1pnQk5QNDlOQys0TE5aQWxaMXVFMEhWZElO?=
 =?utf-8?B?U0lxT1kzaTJSallkbXJVcDVSVmNWUVVUZHRRSExubFZFNFlBYjNoSzlNRFFw?=
 =?utf-8?B?KzlrcG1wR2JRaXVpYlpuREJGVzVkRzJ3YmQ4cGtFMEc2OUlKMFlUdm1BcVFv?=
 =?utf-8?B?TlhtVkt4Z3l4ZUNqU2xlaUtIWkZ6dm9MaW5sYmFIdjNkanFodmwvTG9YeC85?=
 =?utf-8?B?dUc4elBjNHIwOGtaZUVtMU1jSnpMZVRvT1Btcjl5alRvNU5WYzlmMzhSUnZ5?=
 =?utf-8?B?U2w5UDNWTlpQMjhRU1FrOThVa3YwdjE2UnJ2RUdPcTVFcVRya3RiMUttcS9L?=
 =?utf-8?B?azlDaEl1Sm5BaEF0dm5CTmZUQ3BMZGVRTFBKbmxKQXU2NFcraG9VZ0JlSGpO?=
 =?utf-8?B?NGhEb3d4ZWxNVm9IUzRiZ2FWYkFxMkIwODErZitMSGExSnZIc1FmY0RmSVFS?=
 =?utf-8?B?WkNnZnZhMEVMTVgrdXF0WWwrVGlPR1dKQmpFYVlzek9WcUZNNW8wRUN3ZElD?=
 =?utf-8?B?R1ZCSUtIekxKMDJMc0Q4TW92U0tYU1dQU2JDQlVTb1lkU01LRGdibkJleFc1?=
 =?utf-8?B?Vmh1cVVwOUorcUtlQ1dJbXRrbUNPVTEvQ0Q4cnUvTTBKTldBem0zaTBGcGlu?=
 =?utf-8?B?WnJ4RDZuaENmanRPRHdyVHFhdDFRajlrNFAzRmdqNTVrQU1VTWdxQXNENG5s?=
 =?utf-8?B?Zkp5eFZwb2ZuTmdvMSt2dEYvNXlXdWVuanhMUFhLRURaQ3M4eE1sREpwMUxy?=
 =?utf-8?B?VkZObW83MmsvSlVBeTBicnk4NUtFQ0U2U2dObExtalE2WUx2Zm1yUjFYV2JO?=
 =?utf-8?B?ODlpYkt5MUhnWHZVSUU1ZWRMQUY5Zi9KRDQ1R2RlWkwrczhpV3RJa25OakUr?=
 =?utf-8?B?N0hseEFCaEZRTGNkN0RWejI3TzNhWldhZ3RSZnZJeDl4MVRFZThTcEFGUTNM?=
 =?utf-8?B?QUhUc3NldC96LzlnaHhUNmp4YUVIRjIzMmNNNGRpN0MwMUxBc0N1TkxtUHd5?=
 =?utf-8?B?bjFNNFBRS3BTRDBMVWkwbTJUTWdWRnVqZ3VkV1RpSTZxUUFUeTlpN256N3BM?=
 =?utf-8?B?VnZWWDcvcy9rbnd3bERHZFVQYXdPYmhlcVNmYjNqYjhCYnN5cm5VNUZwTm54?=
 =?utf-8?B?a1E2SkZUNXZ3amRSYi94MUZLakNPeThZb2w1ODFtb1dxNmVhNGVZQWZub3BB?=
 =?utf-8?B?am1NaGRVMXFHRndBYmdFRG02OWJZYUtkQkpYYXhkM3pwNGVhQnBsaG41V0s2?=
 =?utf-8?B?cEdTbGRuaWdteWN1TFNyWktvZW5KZnNuTU5uNTU3S3R5Z0hFTmxmODc5bWxD?=
 =?utf-8?B?czhFS0xjcTJPa1oxYk5NYXlSUUFGRGRFbXRMOWRTNjhMeGd5TGpLeWlQUVFL?=
 =?utf-8?B?dlJNbmsxKzJ1NENNWXNodz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y01ad2JOUWl5VW9OV1hHUDFXUkhoaE5xMXkrZFo1UnN6dlhCekJobXRLUE9x?=
 =?utf-8?B?cmw5QllYSWdEZlBvZFhzcWVkWjljN2gwUE1VdzdJT3ZpOGVuS2hWV2l3cENx?=
 =?utf-8?B?eUNqUkNFSUp2NlIxQndrRS92WXNjamhYTHZjUlpEaEpnV1ZBRXFwaU91c2t1?=
 =?utf-8?B?YWcwck5MTFQrbVB4ejRFOTZXYzdHV3pQZXczWURCYmN5Y2F4YlFqMVFaMlFY?=
 =?utf-8?B?UzZvb3pGTVM4NWhsbVJoSjF6a2FIU2pSRENYYmJ2L2cycnlpU203UXBQSkM2?=
 =?utf-8?B?dStyMFJINmkrRGFpV3laaWFsOXpRczVITVR2ZWRFQldkZjhxZk1nMkxpSEFQ?=
 =?utf-8?B?NmRvOGNTa2Y1T2V5eFZqWStVMmgwZm5VYkpXdDV0eWQxa3FnWlR1aU5yOTM1?=
 =?utf-8?B?ejVMUnJUdDF2M0VDZWMyZjdRQWFLUEY2K3B3dHNlUTN3TkdHOE1iMFozaXAw?=
 =?utf-8?B?WGc5N2JkbVBQanV4SWNiS1hiQ1ZnOENIOUlhSGx2bUgvMGVSb054MStIU2kr?=
 =?utf-8?B?Z0hLdUIxQUVEc3Z2V3pzOGU0aVR6aDVXOHljVHNhcHlOKzFTRUR0THFTbVZM?=
 =?utf-8?B?OXdTd3d2akNRaUxRd2IvSDVkalc4bXpLdlBWd3RJNWQveWRIS3dCTWx2ck1s?=
 =?utf-8?B?Z3MxVEVHb3d6Y2RJbkZ3em1ZdFFjNUEyMWhlbVV3czNDSyt2aC9vOHFFeElk?=
 =?utf-8?B?bitrNUtsd3RTbVo3YjRwM3FQdWZDalcvUVFCdnpmOW83dUZiRndpRi9QR3hr?=
 =?utf-8?B?REpNYTVzWHNNSDN1WjJmU0ozVVBXV2pQVUhnak5EaHB1V2s4ejV2dXdVWGk0?=
 =?utf-8?B?UTZTQ25UcCtlU2tNaG0xR1dTL3EwQU1BMnBqUzFOUDBVbXA5SzdFNUVJT3Ew?=
 =?utf-8?B?c05QaWU1aXhtQ0ZaYVhtRysrQS82WVZ4UjBvamRnTVg5TUlyU3ZnSW9sU3E5?=
 =?utf-8?B?azdjNGxId0MwZTBMSlp4SmU3S0FEVENHWUdURmdlYmNaWi9TYmg0dTNabmdl?=
 =?utf-8?B?cGxUVHFXa29TK0Vvb09BUERpaHpwQlBUMGdvc1A0U0JnbVVFbW5Na0ViNWVj?=
 =?utf-8?B?UE52KzcvRituMGIvZml3T0gwbnFNRVNSYkJaUWJNYS80VDlrQTlzQlEzcVFD?=
 =?utf-8?B?cjdyb0FjZzBsRm9NTmxtM1FNRHU2Qm1WUyswVDBqRU1vS3NRR2hiNmI2ckdD?=
 =?utf-8?B?c0ZQN0x2TTUzY0dHd2VJRWxNZklvTy8vb0hGWlJzelJyU1NDSDZBMElNN0JP?=
 =?utf-8?B?NkkvT3FjeVkvcGxyTCsvQmhEQ29GbXdNcWxmSFdqTjZPbG4yTVk0dmkyS2s5?=
 =?utf-8?B?aGxXV1lXazQwZ1lCaXI0WFhCUkoxcnF4dnZPSWRkNURHTjZSNEJJczI4RXVW?=
 =?utf-8?B?QzRpbE5DQ2pjR05IMkExc3FPK2tpVCtsZ1FjRERZVm5iRzVyQUF6UnFtT0pR?=
 =?utf-8?B?TFJtMk93aWFYZW1JYmhacjdDaDZhc1ArSkl4KzRmcW1BTU9wZ3NFMXZUaHFY?=
 =?utf-8?B?TzAybWtSSVZ6Rng1cjMrSVZRUmNKMWtvdmxCTjREaFVjVTlKN3Q3V2lacUFO?=
 =?utf-8?B?WmhqcWlVUnhCOXhVejVOakY2cWdxMWVBZWd0VThjbHhTbi9VbHVwY29Jdmht?=
 =?utf-8?B?NGNOOU05b0d1MnVZb0drMWo0NWR1bERvODJPVEN1NXBCZmphQWduQlBKUVNn?=
 =?utf-8?B?UkowSHJ1cVo0VDU4V2hleXI3WVZheVlLQTMxYk05MW5lcnNFMzRBeUZTMFBv?=
 =?utf-8?B?ZGNJWWptUXBZOFkyU2R6YnY5RGNrWkZNOXhYMUN2dVBDM2NJWGdNTWVSaVlj?=
 =?utf-8?B?bDNCTzNvS1NYWDJWTUNLOHQ0ZHVTVGFMSUNNblNzZW5mc08xUWY4bkxSZjh3?=
 =?utf-8?B?ZFlrQ1RIZGdQRG9CVjVlenJobVJjS1hVckNPTHJkV2hFME4yUTN0RStPcm9n?=
 =?utf-8?B?UVBMQ0VDVFdLM2lNZ3dIY2Z3STcrMHFlOEs2a2VFUDRVV1VVUDBES0drQ2pX?=
 =?utf-8?B?SVUwWUVrT21SY2NqekdtTGdPL0JzM25nUFY2ZzNieU1OTmNaK0xhRFpLdGtl?=
 =?utf-8?B?VjEray9KclpHT0VmSzY4bkl3MUNUN2dLZWRWSGFiZ0FhdCtKU2pxbW16WnEw?=
 =?utf-8?Q?HR1DtU8CDofWRFoiLK8jXr7yN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b54998b-c482-45af-b24b-08dcc5f02831
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 16:57:23.8881 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GtefSaH9m/oMzquSOcKB47ZjzNfeiZSv0SF12x7+gpbvXHJ3jV6IfgD+HZ0xkQ1/1Z7vWRifY40NzI7vb5FBPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7538
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

On 8/24/2024 13:33, Thomas Weißschuh wrote:
> Not all platforms provide the full range of PWM backlight capabilities
> supported by the hardware through ATIF.
> Use the generic drm panel minimum backlight quirk infrastructure to
> override the capabilities where necessary.
> 
> Testing the backlight quirk together with the "panel_power_savings"
> sysfs file has not shown any negative impact.
> One quirk seems to be that 0% at panel_power_savings=0 seems to be
> slightly darker than at panel_power_savings=4.

Thanks; This is the kind of thing I was worried about.

Harry, Leo,

Is that expected?  I wonder if we need to internally turn off panel 
power savings in display code when brightness falls a threshold (12 IIRC 
was the real "minimum" advertised in the table?).

> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> Tested-by: Dustin L. Howett <dustin@howett.net>
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/Kconfig                |  1 +
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 10 ++++++++++
>   2 files changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig b/drivers/gpu/drm/amd/amdgpu/Kconfig
> index 0051fb1b437f..655c10aef2e3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/Kconfig
> +++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
> @@ -23,6 +23,7 @@ config DRM_AMDGPU
>   	select DRM_BUDDY
>   	select DRM_SUBALLOC_HELPER
>   	select DRM_EXEC
> +	select DRM_PANEL_BACKLIGHT_QUIRKS
>   	# amdgpu depends on ACPI_VIDEO when ACPI is enabled, for select to work
>   	# ACPI_VIDEO's dependencies must also be selected.
>   	select INPUT if ACPI
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 983a977632ff..056960ea335c 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -93,6 +93,7 @@
>   #include <drm/drm_fourcc.h>
>   #include <drm/drm_edid.h>
>   #include <drm/drm_eld.h>
> +#include <drm/drm_utils.h>
>   #include <drm/drm_vblank.h>
>   #include <drm/drm_audio_component.h>
>   #include <drm/drm_gem_atomic_helper.h>
> @@ -3333,6 +3334,8 @@ static void update_connector_ext_caps(struct amdgpu_dm_connector *aconnector)
>   	struct drm_connector *conn_base;
>   	struct amdgpu_device *adev;
>   	struct drm_luminance_range_info *luminance_range;
> +	const struct drm_edid *drm_edid;
> +	int min_input_signal_override;
>   
>   	if (aconnector->bl_idx == -1 ||
>   	    aconnector->dc_link->connector_signal != SIGNAL_TYPE_EDP)
> @@ -3367,6 +3370,13 @@ static void update_connector_ext_caps(struct amdgpu_dm_connector *aconnector)
>   		caps->aux_min_input_signal = 0;
>   		caps->aux_max_input_signal = 512;
>   	}
> +
> +	drm_edid = drm_edid_alloc(aconnector->edid,
> +				  EDID_LENGTH * (aconnector->edid->extensions + 1));
> +	min_input_signal_override = drm_get_panel_min_brightness_quirk(drm_edid);
> +	drm_edid_free(drm_edid);
> +	if (min_input_signal_override >= 0)
> +		caps->min_input_signal = min_input_signal_override;
>   }
>   
>   void amdgpu_dm_update_connector_after_detect(
> 

