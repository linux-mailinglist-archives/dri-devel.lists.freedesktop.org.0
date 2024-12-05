Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E86389E4CDE
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 04:53:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9E2310E37B;
	Thu,  5 Dec 2024 03:53:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QaNZqVq1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2085.outbound.protection.outlook.com [40.107.236.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 443D510E06C
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 03:53:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bn9LbDOpuJWVeu2DE0t6bSr83d49s9Pgq19Db2N5Jtv5Huz4GAgWbnQQOMrIdQ+z270TpnHgYzfmCtXqhJl5NvBPvONELTL9e4KiDqkbKojypPXq/02HWfnBFkNFnFmf7pQBgiIrm2fSle6/tLB2WF4+3x7pf9b9AbdYjwOPfkwzK9Bj+YRhaAA9uko00FJj62xVKldVygtLFKACt3aswzOgOE/cdBCJxSSyOy+WX8GYrevQojui44GkEs2GB94BoVC/KXYOpEnKI6wm6mXUZJbU879TUHNAvV6cRGpikZZGrGzlAHIwPOY1m0QkYHJJvMeZvRH+OA5SV92AshNTVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RvaBM3/dcqVMRF82XEkSGy+qpiqUcVx6rxbImHzMdO4=;
 b=giTqlSNEInHCXENdU96lK38Or3ZEMQD20bFTPabX6xTEmKYHuMJb/FjTHeY+YaWTb8ckm3P1TKneEpCx9tDHjFt2hYvYkY7vUHW/IvWwXm8TkeRdeVJfnDdeKEOylgikydjTSDCHazepU8D0s2ykY02DuYlNe6LzfYTGWUk1hLxE3KjDAFQ9HGpkO8jvcthDPTSQgDqMQCc9CoZP0RwkpM6zelceK8lUpl3mQd4IDJyj6rgtzhkm6wA/ttcc8tYJ7xtcnIsjLvrpb79hBTNUyUULMMQFWmuW0YZXVzMLdv89+Syzl3JRqSq0c93R5kpa7NROPoYqSma1/vb9R7bVug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RvaBM3/dcqVMRF82XEkSGy+qpiqUcVx6rxbImHzMdO4=;
 b=QaNZqVq1OtI/I0qXSBPyRlByHOFOkn1zjnsPp34n0FulKpKZ+yXt7F5yfisHp/mYctaTsauZzMNKAe/W7+DIS45mQI9y+gfzvsi8xTlg+UIouzHQK3SPW0o1AJx9eM5+PeQpTuMLQGZM15dzRn6XRRaOW2WoCIEI7N36eaKyn0o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS0PR12MB6389.namprd12.prod.outlook.com (2603:10b6:8:cf::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8207.19; Thu, 5 Dec 2024 03:52:56 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8207.017; Thu, 5 Dec 2024
 03:52:56 +0000
Message-ID: <ea8ff99e-1117-4d24-91a9-349e6c3695d6@amd.com>
Date: Wed, 4 Dec 2024 21:52:53 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 6/7] accel/amdxdna: Enhance power management settings
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, min.ma@amd.com, max.zhen@amd.com,
 sonal.santan@amd.com, king.tam@amd.com,
 Narendra Gutta <VenkataNarendraKumar.Gutta@amd.com>,
 George Yang <George.Yang@amd.com>
References: <20241204213729.3113941-1-lizhi.hou@amd.com>
 <20241204213729.3113941-7-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20241204213729.3113941-7-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR16CA0058.namprd16.prod.outlook.com
 (2603:10b6:805:ca::35) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DS0PR12MB6389:EE_
X-MS-Office365-Filtering-Correlation-Id: 206f9480-3abf-406e-80cd-08dd14e04d7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dmJ2M0doRXVCWDBDSGtqZ1MvVzRPblRJLzNPSXFKckt4ZkV3QUl2N3RDU1ZO?=
 =?utf-8?B?TTVoV24rdEtIUVQxVFJFWDZPSllUSHk2RFFNU1crNU4vMGJ3MStDZEc1eDdl?=
 =?utf-8?B?RHp0VEtKdjRkRnIvZ05wQW9hOFdubVZFdnpDMEM1TnRaMnQ2THNDNnVKQ1Zk?=
 =?utf-8?B?b2hoOXF2YUlYdFJXMlhKbjZNZXFmWVdNbEV3a0Mrdkx2dXZHWms3Tmo4Y3F2?=
 =?utf-8?B?VCtZdFI3akNOOXFyWmYxejlhdHB0TVdEeGIxYTJDN0xpUk0wb2lVb2UvTTNC?=
 =?utf-8?B?NzdreFgrVzNPYWpjei9kN1hmVENFT3V5UmhVaE5YUlhzakc5NmJsZ3N1ZCtt?=
 =?utf-8?B?ZmdzcEFBZVNSZVRCQytPcHRFZFpZSDdiSGpGMDlETk9mZXJldElDYmFCNzdr?=
 =?utf-8?B?Mm9kVkF5R3pLS1VoSGxIdkdURVVhakdIc1NQK1l2RnhCMVlxMmwweEt4UGpH?=
 =?utf-8?B?V2VUWG5MWHdJc2ozbDZlMXJqU3NZR3Y0ZFgxMmZUUG1lVDBOdGd3aXV2aFht?=
 =?utf-8?B?dXJtakYyWWYxZlc3UGtIN1IxdjdQcDZ1bFpaMWZTNVhjYXdrb3pqS2F6TkVZ?=
 =?utf-8?B?RnArcml6dFRVVFpyc0NnNWFPcGZzMzR5MHZpWEtua0lSRXdRd2x3UVhNdkFL?=
 =?utf-8?B?WHZNY0VjV3FRRVhOQWdjaGRsR1ZnWURKK1AwUlI3K2U0a0dldDUwcEN0Z0tT?=
 =?utf-8?B?Lzd3eXYxMWdMS1g1bFRaYjJGSVBLRmNtcXltRFJaVll6WFlOcUlVTHFVS0h0?=
 =?utf-8?B?YjZFOElhTjJqZjMyS2t5UnpYRUdEKzJud2xTVFFvd0pkWk51T2VGcTZiM2Z4?=
 =?utf-8?B?RmdPWW9MYWxlZGRKa0ZWZGpFdXhYT0c2bzZTNlJwWFQwbTVnZGFzWUlNZThz?=
 =?utf-8?B?bWJ4c1N5OEVZVGZ1WWR3UHNpYnBQS3hGMWxmNEZ3TWxHRVFlZnFuVlhtcUE1?=
 =?utf-8?B?MGlWajFtb2M0THgvWVlIaklrdTdwakZkSExSeG9NL1l0S0dvT2taaEp0a01m?=
 =?utf-8?B?Q25CY3B5aURadCtqS2xabm9SN1RZbTVYaWR0dTc2MzVTTUg3OU95VEEwSHd0?=
 =?utf-8?B?TXk3b2dzaU9IRlBqUjdpNmMrSmZxMTJ5c3RldDVXbEFCNXpSYlVlWklnWXdx?=
 =?utf-8?B?Sk5YYzBaOEI4Qm9tTE0rb2phR09LOFZGYlg3bW5mdFFjN3lvMHhidWh5Vnd2?=
 =?utf-8?B?T3poM3dnaGZjMUcwWjJpbnAzbVppcjArWjlkMENHTXFkZ3JzRklxaGI1RjlW?=
 =?utf-8?B?dkVoNzBEMUN2a044NTZMTldPU1VnOENpRll4YWw2TWY1Vi9SQTBCM3F4SWlD?=
 =?utf-8?B?WEJjUHhoVnV2UEtUZTBsT1N4ODI5SytkV2ZCdktGQWRzTjBybm1VcnVYMVI1?=
 =?utf-8?B?WjVZbC9lOU9CV3VqSEpEZ0Q1Q2kwYzBlMzJtclBOcjdmd0tYeWJSdVRxTGJL?=
 =?utf-8?B?TnpSWTNLVEZ3NkxGLzk0c0I4TCtSNERYYVdXQ0ptdGUyVEM5Yk0wSElqaXFp?=
 =?utf-8?B?YmdocDFkOThUTnJDb1NRVytCWVdDOTFEUFBpMS9neExJNkhEMXhuRzhSMHE3?=
 =?utf-8?B?d2VmZTFnTXM0Mm5hV3Y5VTIydkxPRC92a0dVdjhSRlVNY0FVeHpsSEJmT3BF?=
 =?utf-8?B?SDBKNUtUaUorU1E0cXpnMnA5dVRYUExKYXpvbmpZMDhIVTc5eEpKNnBnbUZC?=
 =?utf-8?B?T2lDRUgyV2w0ZFNYWEZVcUlKQ1dIdzc1OTJ5akdCSUo3ejhLcVQ2Uk9xbkNU?=
 =?utf-8?B?N0Y1VTFFZ1RLbGNTR1p0R3FLZDUyVitqb0FibWR6dTFLTG41N3l2UzFaZE9Q?=
 =?utf-8?B?b1dacHhiMWg2d09lWFF3Zz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXV1QXhNSE1QaWJjRHJBTmZVRWl4Sk1Nb2RQVUNkYXBvdzdUb2ZCZjN2bjFq?=
 =?utf-8?B?Tm1iQmd0Z28xc0ZvSExrZlMybWQzZU1yclRyMXVmQ1padjhUci9jcFlKMmhC?=
 =?utf-8?B?TUxPRklVYW5OZ1dJVmpmcmsreTl0cG5sdkgwWm5sN2djNVhZY1VMbWllUnFC?=
 =?utf-8?B?NVVZOXY0Z2dIWm1FRE91WDVuR3BrR3VxT3B6WThFbkJHM2dPbEl3NEo0Y1Uv?=
 =?utf-8?B?Zjh3bTZhVUpuc3pKNlJqTWtDWXVldEVDS0tJb0hObjUyUUFTbmtmbU1QMTl6?=
 =?utf-8?B?b01zSEVucG1vcDY3MGwrV0F3VkdJUG9nMlhsUnRpUmpaM1ZiNklTNUthUHBi?=
 =?utf-8?B?enZLYXNKOG9ZclBDZ0FIdXVwSjV5STN6SXY2Sk5ERmQ0bVlqN3ZhMWg5SFRn?=
 =?utf-8?B?Vjhhd3lMYitBUU5jQlppR1JvalBUVUpxcFZjckZLT2RzY2dsaU1HWFVRTVVT?=
 =?utf-8?B?bzIwMExhcC91cVF6NEdPRDBSbmlNMGpIci9NeDJKVXQvVmNIcTlzU3E5dE1D?=
 =?utf-8?B?dmFyVXRJOFIzeGFZay92VlFUNFRWNUxTakh0NmFuV00rQnRKd2p5TW5vditS?=
 =?utf-8?B?MXdOR3JrOUdlVTFFV0JqeUhYRmRTa1FadDRIQnJNblgwQm0rREd0a1JJQVV4?=
 =?utf-8?B?QVd6TU5WTENGSHZSYXU3SE12ZEU1c2dNSUhnK0gzcjI3cndudXhRYWZ1V2Q5?=
 =?utf-8?B?WE5MTEwxajBobmN2Z01rQU5aM1JkY2RlSWVKS1I0YnBPVW9QR0NPQUZCNHR4?=
 =?utf-8?B?MERRWVE2YXBZRFkxT0pQKzF6TFdVVXB1TXlPaThxYlpKSHVLK2c3QzZkT0l4?=
 =?utf-8?B?OWp6QlYvckc1K3NUV29ObDlhejluWjJ0THc4WnNBcFoxSkhmWTkvL094RVJN?=
 =?utf-8?B?NzlVMGxhRkN3Z1JoTEpEbFJoQk5ycjIwUWwwVUJHU0pJOWZBT1FnTm5ybHVF?=
 =?utf-8?B?RTV0aGhQYWNOZVE1czlGRGxza1ZuK3pjeDBiRTNRcnh4eHNsdVgrcUlrM09V?=
 =?utf-8?B?OVd6TmduSlU2dXp1NUZLV0oyMy9FL1ptMllNUDRDRGV5NlRXNHlXSGd0K1hK?=
 =?utf-8?B?Rlh0WnhOb09ydnI5N2dxTXQyVCtMVVF4WlFIc1l5aDk4aEE1WWJvR2hFWmww?=
 =?utf-8?B?b3dwTnVpc1IvZlZLYjhmZ1lvdi8wKy9oRGJBbkw2YzdFT1N1dXhwOFNuRzU2?=
 =?utf-8?B?emxOV2RHMm9GZ0p1bkkyR21UZk4xYWpJdzdDZjAvNW91amY2T3IyVlQ1aEMw?=
 =?utf-8?B?Y1JoWjlhRmVOVEp4VVNpT3FsWlJldXpZY3AxL2g0eTFrZVRMcWtnRVB1ZDh0?=
 =?utf-8?B?bnhFd29xMjdVTmdvOFJ6TXZhRG1WbFgvMnI2dk1kTExzV3ZabnZrT1E1ZndH?=
 =?utf-8?B?VFRUM2JCbE5Lb3hPby9iNC9hL2pmYWpUdElyejBTcC9ZdjdvWVhOQWJPYy9H?=
 =?utf-8?B?eDhYb2JEanA5UE8xVWRsckNkaUlvbmYybjROQVNyR2RIYVVFbGE0aGR1Mmh0?=
 =?utf-8?B?ZEJ4dmx3LzdFT1R4V0NPMlUrWUJJTzlGaEJxWHZhWE5qRFNxSWN0STJGZGhn?=
 =?utf-8?B?aGoxeUZ0VWU2bXFMcjFaMElDZVkwS1NESGtOMGE3RlA4YTRETEVYd29scE1B?=
 =?utf-8?B?V3FvRVZ3L1ZWQ0ZoQXUybVZZcHB1YmIrN042cmNqM0lsT2tRdXpGd09TNC9H?=
 =?utf-8?B?VHlVaVNGcVpuSWc0RlhmVWdhM2pqV0VsUUkxTEFkYjF4L2k0SEVsd3AxU250?=
 =?utf-8?B?WWhIVGdYbE1sYVlSSTE4ZlF3V0pPK2pYeUhnbGEvU0JaWlpvUmRvb2NDdFdP?=
 =?utf-8?B?SlgyK2M5dUU0eG4rdWNCd2xDK1U0UTlpWHlieUlyallPVTBJcTN6cSswQ3I1?=
 =?utf-8?B?UitIMjhrTWNqbWllWGxkMllBSVZDaFIrMHNrUnVrUFFIclRvU1pzTEwvZ2RU?=
 =?utf-8?B?cmprNENLWkQ3SWRiaHRqK1FKT3Fsd3lHNG8ra1AzZ2hNN3JBaWM2Wk9KcE9n?=
 =?utf-8?B?Q1JuNWJiUjBiZXhwb3dNODJQSXVIdkZYTnhweVdNbVNzbjlJNlRmVkxLWFgv?=
 =?utf-8?B?YTZ3bGlIYXFLd3BIZUpOR1pWbmxyd2tzTnJSVWhLYXNEeWtxYThIQ2lNelE1?=
 =?utf-8?Q?2PLC5ZX+wK1xIyeBJEoAv+H+V?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 206f9480-3abf-406e-80cd-08dd14e04d7b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 03:52:56.4279 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uzg7MOYLqp1SvUqXVqPViBnRCppZNCAZ0/uUUb2zO5Rjfq/GaTTlqGQyy+MX3W46OuLoFhXt3DMFzfM1TspRsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6389
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

On 12/4/2024 15:37, Lizhi Hou wrote:
> Add SET_STATE ioctl to configure device power mode for aie2 device.
> Three modes are supported initially.
> 
> POWER_MODE_DEFAULT: Enable clock gating and set DPM (Dynamic Power
> Management) level to value which has been set by resource solver or
> maximum DPM level the device supports.
> 
> POWER_MODE_HIGH: Enable clock gating and set DPM level to maximum DPM
> level the device supports.
> 
> POWER_MODE_TURBO: Disable clock gating and set DPM level to maximum DPM
> level the device supports.
> 
> Disabling clock gating means all clocks always run on full speed. And
> the different clock frequency are used based on DPM level been set.
> Initially, the driver set the power mode to default mode.
> 
> Co-developed-by: Narendra Gutta <VenkataNarendraKumar.Gutta@amd.com>
> Signed-off-by: Narendra Gutta <VenkataNarendraKumar.Gutta@amd.com>
> Co-developed-by: George Yang <George.Yang@amd.com>
> Signed-off-by: George Yang <George.Yang@amd.com>
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> ---
>   drivers/accel/amdxdna/Makefile          |   1 +
>   drivers/accel/amdxdna/TODO              |   1 -
>   drivers/accel/amdxdna/aie2_ctx.c        |   6 ++
>   drivers/accel/amdxdna/aie2_message.c    |   9 +-
>   drivers/accel/amdxdna/aie2_pci.c        | 136 +++++++++++++++++++-----
>   drivers/accel/amdxdna/aie2_pci.h        |  55 ++++++++--
>   drivers/accel/amdxdna/aie2_pm.c         | 108 +++++++++++++++++++
>   drivers/accel/amdxdna/aie2_smu.c        |  85 +++++++++------
>   drivers/accel/amdxdna/aie2_solver.c     |  59 +++++++++-
>   drivers/accel/amdxdna/aie2_solver.h     |   1 +
>   drivers/accel/amdxdna/amdxdna_pci_drv.c |  19 ++++
>   drivers/accel/amdxdna/amdxdna_pci_drv.h |   2 +
>   drivers/accel/amdxdna/npu1_regs.c       |  29 +++--
>   drivers/accel/amdxdna/npu2_regs.c       |  15 +--
>   drivers/accel/amdxdna/npu4_regs.c       |  32 ++++--
>   drivers/accel/amdxdna/npu5_regs.c       |  15 +--
>   drivers/accel/amdxdna/npu6_regs.c       |  19 ++--
>   include/uapi/drm/amdxdna_accel.h        |  51 +++++++++
>   18 files changed, 515 insertions(+), 128 deletions(-)
>   create mode 100644 drivers/accel/amdxdna/aie2_pm.c
> 
> diff --git a/drivers/accel/amdxdna/Makefile b/drivers/accel/amdxdna/Makefile
> index 6baf181298de..0e9adf6890a0 100644
> --- a/drivers/accel/amdxdna/Makefile
> +++ b/drivers/accel/amdxdna/Makefile
> @@ -5,6 +5,7 @@ amdxdna-y := \
>   	aie2_error.o \
>   	aie2_message.o \
>   	aie2_pci.o \
> +	aie2_pm.o \
>   	aie2_psp.o \
>   	aie2_smu.o \
>   	aie2_solver.o \
> diff --git a/drivers/accel/amdxdna/TODO b/drivers/accel/amdxdna/TODO
> index de4e1dbc8868..5119bccd1917 100644
> --- a/drivers/accel/amdxdna/TODO
> +++ b/drivers/accel/amdxdna/TODO
> @@ -1,4 +1,3 @@
>   - Add import and export BO support
>   - Add debugfs support
>   - Add debug BO support
> -- Improve power management
> diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
> index 07eecb40767f..6b4e6fcb7794 100644
> --- a/drivers/accel/amdxdna/aie2_ctx.c
> +++ b/drivers/accel/amdxdna/aie2_ctx.c
> @@ -518,6 +518,7 @@ int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
>   	struct drm_gpu_scheduler *sched;
>   	struct amdxdna_hwctx_priv *priv;
>   	struct amdxdna_gem_obj *heap;
> +	struct amdxdna_dev_hdl *ndev;
>   	int i, ret;
>   
>   	priv = kzalloc(sizeof(*hwctx->priv), GFP_KERNEL);
> @@ -612,6 +613,8 @@ int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
>   	}
>   
>   	hwctx->status = HWCTX_STAT_INIT;
> +	ndev = xdna->dev_handle;
> +	ndev->hwctx_num++;
>   
>   	XDNA_DBG(xdna, "hwctx %s init completed", hwctx->name);
>   
> @@ -641,10 +644,13 @@ int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
>   
>   void aie2_hwctx_fini(struct amdxdna_hwctx *hwctx)
>   {
> +	struct amdxdna_dev_hdl *ndev;
>   	struct amdxdna_dev *xdna;
>   	int idx;
>   
>   	xdna = hwctx->client->xdna;
> +	ndev = xdna->dev_handle;
> +	ndev->hwctx_num--;
>   	drm_sched_wqueue_stop(&hwctx->priv->sched);
>   
>   	/* Now, scheduler will not send command to device. */
> diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
> index fc33a158d223..13b5a96f8d25 100644
> --- a/drivers/accel/amdxdna/aie2_message.c
> +++ b/drivers/accel/amdxdna/aie2_message.c
> @@ -70,11 +70,18 @@ int aie2_resume_fw(struct amdxdna_dev_hdl *ndev)
>   int aie2_set_runtime_cfg(struct amdxdna_dev_hdl *ndev, u32 type, u64 value)
>   {
>   	DECLARE_AIE2_MSG(set_runtime_cfg, MSG_OP_SET_RUNTIME_CONFIG);
> +	int ret;
>   
>   	req.type = type;
>   	req.value = value;
>   
> -	return aie2_send_mgmt_msg_wait(ndev, &msg);
> +	ret = aie2_send_mgmt_msg_wait(ndev, &msg);
> +	if (ret) {
> +		XDNA_ERR(ndev->xdna, "Failed to set runtime config, ret %d", ret);
> +		return ret;
> +	}
> +
> +	return 0;
>   }
>   
>   int aie2_get_runtime_cfg(struct amdxdna_dev_hdl *ndev, u32 type, u64 *value)
> diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
> index 83abd16ade11..489744a2e226 100644
> --- a/drivers/accel/amdxdna/aie2_pci.c
> +++ b/drivers/accel/amdxdna/aie2_pci.c
> @@ -109,28 +109,26 @@ static int aie2_get_mgmt_chann_info(struct amdxdna_dev_hdl *ndev)
>   	return 0;
>   }
>   
> -static int aie2_runtime_cfg(struct amdxdna_dev_hdl *ndev)
> +int aie2_runtime_cfg(struct amdxdna_dev_hdl *ndev,
> +		     enum rt_config_category category, u32 *val)
>   {
> -	const struct rt_config *cfg = &ndev->priv->rt_config;
> -	u64 value;
> +	const struct rt_config *cfg;
> +	u32 value;
>   	int ret;
>   
> -	ret = aie2_set_runtime_cfg(ndev, cfg->type, cfg->value);
> -	if (ret) {
> -		XDNA_ERR(ndev->xdna, "Set runtime type %d value %d failed",
> -			 cfg->type, cfg->value);
> -		return ret;
> -	}
> +	for (cfg = ndev->priv->rt_config; cfg->type; cfg++) {
> +		if (cfg->category != category)
> +			continue;
>   
> -	ret = aie2_get_runtime_cfg(ndev, cfg->type, &value);
> -	if (ret) {
> -		XDNA_ERR(ndev->xdna, "Get runtime cfg failed");
> -		return ret;
> +		value = val ? *val : cfg->value;
> +		ret = aie2_set_runtime_cfg(ndev, cfg->type, value);
> +		if (ret) {
> +			XDNA_ERR(ndev->xdna, "Set type %d value %d failed",
> +				 cfg->type, value);
> +			return ret;
> +		}
>   	}
>   
> -	if (value != cfg->value)
> -		return -EINVAL;
> -
>   	return 0;
>   }
>   
> @@ -163,7 +161,7 @@ static int aie2_mgmt_fw_init(struct amdxdna_dev_hdl *ndev)
>   		return ret;
>   	}
>   
> -	ret = aie2_runtime_cfg(ndev);
> +	ret = aie2_runtime_cfg(ndev, AIE2_RT_CFG_INIT, NULL);
>   	if (ret) {
>   		XDNA_ERR(ndev->xdna, "Runtime config failed");
>   		return ret;
> @@ -257,9 +255,25 @@ static int aie2_xrs_unload(void *cb_arg)
>   	return ret;
>   }
>   
> +static int aie2_xrs_set_dft_dpm_level(struct drm_device *ddev, u32 dpm_level)
> +{
> +	struct amdxdna_dev *xdna = to_xdna_dev(ddev);
> +	struct amdxdna_dev_hdl *ndev;
> +
> +	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
> +
> +	ndev = xdna->dev_handle;
> +	ndev->dft_dpm_level = dpm_level;
> +	if (ndev->pw_mode != POWER_MODE_DEFAULT || ndev->dpm_level == dpm_level)
> +		return 0;
> +
> +	return ndev->priv->hw_ops.set_dpm(ndev, dpm_level);
> +}
> +
>   static struct xrs_action_ops aie2_xrs_actions = {
>   	.load = aie2_xrs_load,
>   	.unload = aie2_xrs_unload,
> +	.set_dft_dpm_level = aie2_xrs_set_dft_dpm_level,
>   };
>   
>   static void aie2_hw_stop(struct amdxdna_dev *xdna)
> @@ -354,6 +368,12 @@ static int aie2_hw_start(struct amdxdna_dev *xdna)
>   		goto stop_psp;
>   	}
>   
> +	ret = aie2_pm_init(ndev);
> +	if (ret) {
> +		XDNA_ERR(xdna, "failed to init pm, ret %d", ret);
> +		goto destroy_mgmt_chann;
> +	}
> +
>   	ret = aie2_mgmt_fw_init(ndev);
>   	if (ret) {
>   		XDNA_ERR(xdna, "initial mgmt firmware failed, ret %d", ret);
> @@ -480,10 +500,9 @@ static int aie2_init(struct amdxdna_dev *xdna)
>   	}
>   	ndev->total_col = min(aie2_max_col, ndev->metadata.cols);
>   
> -	xrs_cfg.clk_list.num_levels = 3;
> -	xrs_cfg.clk_list.cu_clk_list[0] = 0;
> -	xrs_cfg.clk_list.cu_clk_list[1] = 800;
> -	xrs_cfg.clk_list.cu_clk_list[2] = 1000;
> +	xrs_cfg.clk_list.num_levels = ndev->max_dpm_level + 1;
> +	for (i = 0; i < xrs_cfg.clk_list.num_levels; i++)
> +		xrs_cfg.clk_list.cu_clk_list[i] = ndev->priv->dpm_clk_tbl[i].hclk;
>   	xrs_cfg.sys_eff_factor = 1;
>   	xrs_cfg.ddev = &xdna->ddev;
>   	xrs_cfg.actions = &aie2_xrs_actions;
> @@ -657,6 +676,22 @@ static int aie2_get_firmware_version(struct amdxdna_client *client,
>   	return 0;
>   }
>   
> +static int aie2_get_power_mode(struct amdxdna_client *client,
> +			       struct amdxdna_drm_get_info *args)
> +{
> +	struct amdxdna_drm_get_power_mode mode = {};
> +	struct amdxdna_dev *xdna = client->xdna;
> +	struct amdxdna_dev_hdl *ndev;
> +
> +	ndev = xdna->dev_handle;
> +	mode.power_mode = ndev->pw_mode;
> +
> +	if (copy_to_user(u64_to_user_ptr(args->buffer), &mode, sizeof(mode)))
> +		return -EFAULT;
> +
> +	return 0;
> +}
> +
>   static int aie2_get_clock_metadata(struct amdxdna_client *client,
>   				   struct amdxdna_drm_get_info *args)
>   {
> @@ -670,11 +705,11 @@ static int aie2_get_clock_metadata(struct amdxdna_client *client,
>   	if (!clock)
>   		return -ENOMEM;
>   
> -	memcpy(clock->mp_npu_clock.name, ndev->mp_npu_clock.name,
> -	       sizeof(clock->mp_npu_clock.name));
> -	clock->mp_npu_clock.freq_mhz = ndev->mp_npu_clock.freq_mhz;
> -	memcpy(clock->h_clock.name, ndev->h_clock.name, sizeof(clock->h_clock.name));
> -	clock->h_clock.freq_mhz = ndev->h_clock.freq_mhz;
> +	snprintf(clock->mp_npu_clock.name, sizeof(clock->mp_npu_clock.name),
> +		 "MP-NPU Clock");
> +	clock->mp_npu_clock.freq_mhz = ndev->npuclk_freq;
> +	snprintf(clock->h_clock.name, sizeof(clock->h_clock.name), "H Clock");
> +	clock->h_clock.freq_mhz = ndev->hclk_freq;
>   
>   	if (copy_to_user(u64_to_user_ptr(args->buffer), clock, sizeof(*clock)))
>   		ret = -EFAULT;
> @@ -772,6 +807,9 @@ static int aie2_get_info(struct amdxdna_client *client, struct amdxdna_drm_get_i
>   	case DRM_AMDXDNA_QUERY_FIRMWARE_VERSION:
>   		ret = aie2_get_firmware_version(client, args);
>   		break;
> +	case DRM_AMDXDNA_GET_POWER_MODE:
> +		ret = aie2_get_power_mode(client, args);
> +		break;
>   	default:
>   		XDNA_ERR(xdna, "Not supported request parameter %u", args->param);
>   		ret = -EOPNOTSUPP;
> @@ -782,12 +820,58 @@ static int aie2_get_info(struct amdxdna_client *client, struct amdxdna_drm_get_i
>   	return ret;
>   }
>   
> +static int aie2_set_power_mode(struct amdxdna_client *client,
> +			       struct amdxdna_drm_set_state *args)
> +{
> +	struct amdxdna_drm_set_power_mode power_state;
> +	enum amdxdna_power_mode_type power_mode;
> +	struct amdxdna_dev *xdna = client->xdna;
> +
> +	if (copy_from_user(&power_state, u64_to_user_ptr(args->buffer),
> +			   sizeof(power_state))) {
> +		XDNA_ERR(xdna, "Failed to copy power mode request into kernel");
> +		return -EFAULT;
> +	}
> +
> +	power_mode = power_state.power_mode;
> +	if (power_mode > POWER_MODE_TURBO) {
> +		XDNA_ERR(xdna, "Invalid power mode %d", power_mode);
> +		return -EINVAL;
> +	}
> +
> +	return aie2_pm_set_mode(xdna->dev_handle, power_mode);
> +}
> +
> +static int aie2_set_state(struct amdxdna_client *client,
> +			  struct amdxdna_drm_set_state *args)
> +{
> +	struct amdxdna_dev *xdna = client->xdna;
> +	int ret, idx;
> +
> +	if (!drm_dev_enter(&xdna->ddev, &idx))
> +		return -ENODEV;
> +
> +	switch (args->param) {
> +	case DRM_AMDXDNA_SET_POWER_MODE:
> +		ret = aie2_set_power_mode(client, args);
> +		break;
> +	default:
> +		XDNA_ERR(xdna, "Not supported request parameter %u", args->param);
> +		ret = -EOPNOTSUPP;
> +		break;
> +	}
> +
> +	drm_dev_exit(idx);
> +	return ret;
> +}
> +
>   const struct amdxdna_dev_ops aie2_ops = {
>   	.init           = aie2_init,
>   	.fini           = aie2_fini,
>   	.resume         = aie2_hw_start,
>   	.suspend        = aie2_hw_stop,
>   	.get_aie_info   = aie2_get_info,
> +	.set_aie_state	= aie2_set_state,
>   	.hwctx_init     = aie2_hwctx_init,
>   	.hwctx_fini     = aie2_hwctx_fini,
>   	.hwctx_config   = aie2_hwctx_config,
> diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
> index 5d262ae5c9bb..5f0bfe152455 100644
> --- a/drivers/accel/amdxdna/aie2_pci.h
> +++ b/drivers/accel/amdxdna/aie2_pci.h
> @@ -6,6 +6,7 @@
>   #ifndef _AIE2_PCI_H_
>   #define _AIE2_PCI_H_
>   
> +#include <drm/amdxdna_accel.h>
>   #include <linux/semaphore.h>
>   
>   #include "amdxdna_mailbox.h"
> @@ -48,9 +49,6 @@
>   	pci_resource_len(NDEV2PDEV(_ndev), (_ndev)->xdna->dev_info->mbox_bar); \
>   })
>   
> -#define SMU_MPNPUCLK_FREQ_MAX(ndev) ((ndev)->priv->smu_mpnpuclk_freq_max)
> -#define SMU_HCLK_FREQ_MAX(ndev) ((ndev)->priv->smu_hclk_freq_max)
> -
>   enum aie2_smu_reg_idx {
>   	SMU_CMD_REG = 0,
>   	SMU_ARG_REG,
> @@ -112,14 +110,20 @@ struct aie_metadata {
>   	struct aie_tile_metadata shim;
>   };
>   
> -struct clock_entry {
> -	char name[16];
> -	u32 freq_mhz;
> +enum rt_config_category {
> +	AIE2_RT_CFG_INIT,
> +	AIE2_RT_CFG_CLK_GATING,
>   };
>   
>   struct rt_config {
>   	u32	type;
>   	u32	value;
> +	u32	category;
> +};
> +
> +struct dpm_clk_freq {
> +	u32	npuclk;
> +	u32	hclk;
>   };
>   
>   /*
> @@ -150,6 +154,7 @@ struct amdxdna_hwctx_priv {
>   };
>   
>   enum aie2_dev_status {
> +	AIE2_DEV_UNINIT,
>   	AIE2_DEV_INIT,
>   	AIE2_DEV_START,
>   };
> @@ -169,8 +174,15 @@ struct amdxdna_dev_hdl {
>   	u32				total_col;
>   	struct aie_version		version;
>   	struct aie_metadata		metadata;
> -	struct clock_entry		mp_npu_clock;
> -	struct clock_entry		h_clock;
> +
> +	/* power management and clock*/
> +	enum amdxdna_power_mode_type	pw_mode;
> +	u32				dpm_level;
> +	u32				dft_dpm_level;
> +	u32				max_dpm_level;
> +	u32				clk_gating;
> +	u32				npuclk_freq;
> +	u32				hclk_freq;
>   
>   	/* Mailbox and the management channel */
>   	struct mailbox			*mbox;
> @@ -178,6 +190,7 @@ struct amdxdna_dev_hdl {
>   	struct async_events		*async_events;
>   
>   	u32				dev_status;
> +	u32				hwctx_num;
>   };
>   
>   #define DEFINE_BAR_OFFSET(reg_name, bar, reg_addr) \
> @@ -188,11 +201,17 @@ struct aie2_bar_off_pair {
>   	u32	offset;
>   };
>   
> +struct aie2_hw_ops {
> +	int (*set_dpm)(struct amdxdna_dev_hdl *ndev, u32 dpm_level);
> +};
> +
>   struct amdxdna_dev_priv {
>   	const char			*fw_path;
>   	u64				protocol_major;
>   	u64				protocol_minor;
> -	struct rt_config		rt_config;
> +	const struct rt_config		*rt_config;
> +	const struct dpm_clk_freq	*dpm_clk_tbl;
> +
>   #define COL_ALIGN_NONE   0
>   #define COL_ALIGN_NATURE 1
>   	u32				col_align;
> @@ -203,15 +222,29 @@ struct amdxdna_dev_priv {
>   	struct aie2_bar_off_pair	sram_offs[SRAM_MAX_INDEX];
>   	struct aie2_bar_off_pair	psp_regs_off[PSP_MAX_REGS];
>   	struct aie2_bar_off_pair	smu_regs_off[SMU_MAX_REGS];
> -	u32				smu_mpnpuclk_freq_max;
> -	u32				smu_hclk_freq_max;
> +	struct aie2_hw_ops		hw_ops;
>   };
>   
>   extern const struct amdxdna_dev_ops aie2_ops;
>   
> +int aie2_runtime_cfg(struct amdxdna_dev_hdl *ndev,
> +		     enum rt_config_category category, u32 *val);
> +
> +/* aie2 npu hw config */
> +extern const struct dpm_clk_freq npu1_dpm_clk_table[];
> +extern const struct dpm_clk_freq npu4_dpm_clk_table[];
> +extern const struct rt_config npu1_default_rt_cfg[];
> +extern const struct rt_config npu4_default_rt_cfg[];
> +
>   /* aie2_smu.c */
>   int aie2_smu_init(struct amdxdna_dev_hdl *ndev);
>   void aie2_smu_fini(struct amdxdna_dev_hdl *ndev);
> +int npu1_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level);
> +int npu4_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level);
> +
> +/* aie2_pm.c */
> +int aie2_pm_init(struct amdxdna_dev_hdl *ndev);
> +int aie2_pm_set_mode(struct amdxdna_dev_hdl *ndev, enum amdxdna_power_mode_type target);
>   
>   /* aie2_psp.c */
>   struct psp_device *aie2m_psp_create(struct drm_device *ddev, struct psp_config *conf);
> diff --git a/drivers/accel/amdxdna/aie2_pm.c b/drivers/accel/amdxdna/aie2_pm.c
> new file mode 100644
> index 000000000000..426c38fce848
> --- /dev/null
> +++ b/drivers/accel/amdxdna/aie2_pm.c
> @@ -0,0 +1,108 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2024, Advanced Micro Devices, Inc.
> + */
> +
> +#include <drm/amdxdna_accel.h>
> +#include <drm/drm_device.h>
> +#include <drm/drm_print.h>
> +#include <drm/gpu_scheduler.h>
> +
> +#include "aie2_pci.h"
> +#include "amdxdna_pci_drv.h"
> +
> +#define AIE2_CLK_GATING_ENABLE	1
> +#define AIE2_CLK_GATING_DISABLE	0
> +
> +static int aie2_pm_set_clk_gating(struct amdxdna_dev_hdl *ndev, u32 val)
> +{
> +	int ret;
> +
> +	ret = aie2_runtime_cfg(ndev, AIE2_RT_CFG_CLK_GATING, &val);
> +	if (ret)
> +		return ret;
> +
> +	ndev->clk_gating = val;
> +	return 0;
> +}
> +
> +int aie2_pm_init(struct amdxdna_dev_hdl *ndev)
> +{
> +	int ret;
> +
> +	if (ndev->dev_status != AIE2_DEV_UNINIT) {
> +		/* Resume device */
> +		ret = ndev->priv->hw_ops.set_dpm(ndev, ndev->dpm_level);
> +		if (ret)
> +			return ret;
> +
> +		ret = aie2_pm_set_clk_gating(ndev, ndev->clk_gating);
> +		if (ret)
> +			return ret;
> +
> +		return 0;
> +	}
> +
> +	while (ndev->priv->dpm_clk_tbl[ndev->max_dpm_level].hclk)
> +		ndev->max_dpm_level++;
> +	ndev->max_dpm_level--;
> +
> +	ret = ndev->priv->hw_ops.set_dpm(ndev, ndev->max_dpm_level);
> +	if (ret)
> +		return ret;
> +
> +	ret = aie2_pm_set_clk_gating(ndev, AIE2_CLK_GATING_ENABLE);
> +	if (ret)
> +		return ret;
> +
> +	ndev->pw_mode = POWER_MODE_DEFAULT;
> +	ndev->dft_dpm_level = ndev->max_dpm_level;
> +
> +	return 0;
> +}
> +
> +int aie2_pm_set_mode(struct amdxdna_dev_hdl *ndev, enum amdxdna_power_mode_type target)
> +{
> +	struct amdxdna_dev *xdna = ndev->xdna;
> +	u32 clk_gating, dpm_level;
> +	int ret;
> +
> +	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
> +
> +	if (ndev->pw_mode == target)
> +		return 0;
> +
> +	switch (target) {
> +	case POWER_MODE_TURBO:
> +		if (ndev->hwctx_num) {
> +			XDNA_ERR(xdna, "Can not set turbo when there is active hwctx");
> +			return -EINVAL;
> +		}

Does any similar limitation exist in reverse?  That you can't set 
another DPM level if you're already in turbo mode with an active 
hardware context?

> +
> +		clk_gating = AIE2_CLK_GATING_DISABLE;
> +		dpm_level = ndev->max_dpm_level;
> +		break;
> +	case POWER_MODE_HIGH:
> +		clk_gating = AIE2_CLK_GATING_ENABLE;
> +		dpm_level = ndev->max_dpm_level;
> +		break;
> +	case POWER_MODE_DEFAULT:
> +		clk_gating = AIE2_CLK_GATING_ENABLE;
> +		dpm_level = ndev->dft_dpm_level;
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	ret = ndev->priv->hw_ops.set_dpm(ndev, dpm_level);
> +	if (ret)
> +		return ret;
> +
> +	ret = aie2_pm_set_clk_gating(ndev, clk_gating);
> +	if (ret)
> +		return ret;
> +
> +	ndev->pw_mode = target;
> +
> +	return 0;
> +}
> diff --git a/drivers/accel/amdxdna/aie2_smu.c b/drivers/accel/amdxdna/aie2_smu.c
> index 91893d438da7..73388443c676 100644
> --- a/drivers/accel/amdxdna/aie2_smu.c
> +++ b/drivers/accel/amdxdna/aie2_smu.c
> @@ -19,8 +19,11 @@
>   #define AIE2_SMU_POWER_OFF		0x4
>   #define AIE2_SMU_SET_MPNPUCLK_FREQ	0x5
>   #define AIE2_SMU_SET_HCLK_FREQ		0x6
> +#define AIE2_SMU_SET_SOFT_DPMLEVEL	0x7
> +#define AIE2_SMU_SET_HARD_DPMLEVEL	0x8
>   
> -static int aie2_smu_exec(struct amdxdna_dev_hdl *ndev, u32 reg_cmd, u32 reg_arg)
> +static int aie2_smu_exec(struct amdxdna_dev_hdl *ndev, u32 reg_cmd,
> +			 u32 reg_arg, u32 *out)
>   {
>   	u32 resp;
>   	int ret;
> @@ -40,6 +43,9 @@ static int aie2_smu_exec(struct amdxdna_dev_hdl *ndev, u32 reg_cmd, u32 reg_arg)
>   		return ret;
>   	}
>   
> +	if (out)
> +		*out = readl(SMU_REG(ndev, SMU_OUT_REG));
> +
>   	if (resp != SMU_RESULT_OK) {
>   		XDNA_ERR(ndev->xdna, "smu cmd %d failed, 0x%x", reg_cmd, resp);
>   		return -EINVAL;
> @@ -48,63 +54,71 @@ static int aie2_smu_exec(struct amdxdna_dev_hdl *ndev, u32 reg_cmd, u32 reg_arg)
>   	return 0;
>   }
>   
> -static int aie2_smu_set_mpnpu_clock_freq(struct amdxdna_dev_hdl *ndev, u32 freq_mhz)
> +int npu1_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level)
>   {
> +	u32 freq;
>   	int ret;
>   
> -	if (!freq_mhz || freq_mhz > SMU_MPNPUCLK_FREQ_MAX(ndev)) {
> -		XDNA_ERR(ndev->xdna, "invalid mpnpu clock freq %d", freq_mhz);
> -		return -EINVAL;
> +	ret = aie2_smu_exec(ndev, AIE2_SMU_SET_MPNPUCLK_FREQ,
> +			    ndev->priv->dpm_clk_tbl[dpm_level].npuclk, &freq);
> +	if (ret) {
> +		XDNA_ERR(ndev->xdna, "Set npu clock to %d failed, ret %d\n",
> +			 ndev->priv->dpm_clk_tbl[dpm_level].npuclk, ret);
>   	}
> +	ndev->npuclk_freq = freq;
>   
> -	ndev->mp_npu_clock.freq_mhz = freq_mhz;
> -	ret = aie2_smu_exec(ndev, AIE2_SMU_SET_MPNPUCLK_FREQ, freq_mhz);
> -	if (!ret)
> -		XDNA_INFO_ONCE(ndev->xdna, "set mpnpu_clock = %d mhz", freq_mhz);
> -
> -	return ret;
> -}
> -
> -static int aie2_smu_set_hclock_freq(struct amdxdna_dev_hdl *ndev, u32 freq_mhz)
> -{
> -	int ret;
> -
> -	if (!freq_mhz || freq_mhz > SMU_HCLK_FREQ_MAX(ndev)) {
> -		XDNA_ERR(ndev->xdna, "invalid hclock freq %d", freq_mhz);
> -		return -EINVAL;
> +	ret = aie2_smu_exec(ndev, AIE2_SMU_SET_HCLK_FREQ,
> +			    ndev->priv->dpm_clk_tbl[dpm_level].hclk, &freq);
> +	if (ret) {
> +		XDNA_ERR(ndev->xdna, "Set h clock to %d failed, ret %d\n",
> +			 ndev->priv->dpm_clk_tbl[dpm_level].hclk, ret);
>   	}
> +	ndev->hclk_freq = freq;
> +	ndev->dpm_level = dpm_level;
>   
> -	ndev->h_clock.freq_mhz = freq_mhz;
> -	ret = aie2_smu_exec(ndev, AIE2_SMU_SET_HCLK_FREQ, freq_mhz);
> -	if (!ret)
> -		XDNA_INFO_ONCE(ndev->xdna, "set npu_hclock = %d mhz", freq_mhz);
> +	XDNA_DBG(ndev->xdna, "MP-NPU clock %d, H clock %d\n",
> +		 ndev->npuclk_freq, ndev->hclk_freq);
>   
> -	return ret;
> +	return 0;
>   }
>   
> -int aie2_smu_init(struct amdxdna_dev_hdl *ndev)
> +int npu4_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level)
>   {
>   	int ret;
>   
> -	ret = aie2_smu_exec(ndev, AIE2_SMU_POWER_ON, 0);
> +	ret = aie2_smu_exec(ndev, AIE2_SMU_SET_HARD_DPMLEVEL, dpm_level, NULL);
>   	if (ret) {
> -		XDNA_ERR(ndev->xdna, "Power on failed, ret %d", ret);
> +		XDNA_ERR(ndev->xdna, "Set hard dpm level %d failed, ret %d ",
> +			 dpm_level, ret);
>   		return ret;
>   	}
>   
> -	ret = aie2_smu_set_mpnpu_clock_freq(ndev, SMU_MPNPUCLK_FREQ_MAX(ndev));
> +	ret = aie2_smu_exec(ndev, AIE2_SMU_SET_SOFT_DPMLEVEL, dpm_level, NULL);
>   	if (ret) {
> -		XDNA_ERR(ndev->xdna, "Set mpnpu clk freq failed, ret %d", ret);
> +		XDNA_ERR(ndev->xdna, "Set soft dpm level %d failed, ret %d",
> +			 dpm_level, ret);
>   		return ret;
>   	}
> -	snprintf(ndev->mp_npu_clock.name, sizeof(ndev->mp_npu_clock.name), "MP-NPU Clock");
>   
> -	ret = aie2_smu_set_hclock_freq(ndev, SMU_HCLK_FREQ_MAX(ndev));
> +	ndev->npuclk_freq = ndev->priv->dpm_clk_tbl[dpm_level].npuclk;
> +	ndev->hclk_freq = ndev->priv->dpm_clk_tbl[dpm_level].hclk;
> +	ndev->dpm_level = dpm_level;
> +
> +	XDNA_DBG(ndev->xdna, "MP-NPU clock %d, H clock %d\n",
> +		 ndev->npuclk_freq, ndev->hclk_freq);
> +
> +	return 0;
> +}
> +
> +int aie2_smu_init(struct amdxdna_dev_hdl *ndev)
> +{
> +	int ret;
> +
> +	ret = aie2_smu_exec(ndev, AIE2_SMU_POWER_ON, 0, NULL);
>   	if (ret) {
> -		XDNA_ERR(ndev->xdna, "Set hclk freq failed, ret %d", ret);
> +		XDNA_ERR(ndev->xdna, "Power on failed, ret %d", ret);
>   		return ret;
>   	}
> -	snprintf(ndev->h_clock.name, sizeof(ndev->h_clock.name), "H Clock");
>   
>   	return 0;
>   }
> @@ -113,7 +127,8 @@ void aie2_smu_fini(struct amdxdna_dev_hdl *ndev)
>   {
>   	int ret;
>   
> -	ret = aie2_smu_exec(ndev, AIE2_SMU_POWER_OFF, 0);
> +	ndev->priv->hw_ops.set_dpm(ndev, 0);
> +	ret = aie2_smu_exec(ndev, AIE2_SMU_POWER_OFF, 0, NULL);
>   	if (ret)
>   		XDNA_ERR(ndev->xdna, "Power off failed, ret %d", ret);
>   }
> diff --git a/drivers/accel/amdxdna/aie2_solver.c b/drivers/accel/amdxdna/aie2_solver.c
> index a537c66589a4..1939625d6027 100644
> --- a/drivers/accel/amdxdna/aie2_solver.c
> +++ b/drivers/accel/amdxdna/aie2_solver.c
> @@ -25,6 +25,7 @@ struct solver_node {
>   
>   	struct partition_node	*pt_node;
>   	void			*cb_arg;
> +	u32			dpm_level;
>   	u32			cols_len;
>   	u32			start_cols[] __counted_by(cols_len);
>   };
> @@ -95,6 +96,51 @@ static int sanity_check(struct solver_state *xrs, struct alloc_requests *req)
>   	return 0;
>   }
>   
> +static bool is_valid_qos_dpm_params(struct aie_qos *rqos)
> +{
> +	/*
> +	 * gops is retrieved from the xmodel, so it's always set
> +	 * fps and latency are the configurable params from the application
> +	 */
> +	if (rqos->gops > 0 && (rqos->fps > 0 ||  rqos->latency > 0))
> +		return true;
> +
> +	return false;
> +}
> +
> +static int set_dpm_level(struct solver_state *xrs, struct alloc_requests *req, u32 *dpm_level)
> +{
> +	struct solver_rgroup *rgp = &xrs->rgp;
> +	struct cdo_parts *cdop = &req->cdo;
> +	struct aie_qos *rqos = &req->rqos;
> +	u32 freq, max_dpm_level, level;
> +	struct solver_node *node;
> +
> +	max_dpm_level = xrs->cfg.clk_list.num_levels - 1;
> +	/* If no QoS parameters are passed, set it to the max DPM level */
> +	if (!is_valid_qos_dpm_params(rqos)) {
> +		level = max_dpm_level;
> +		goto set_dpm;
> +	}
> +
> +	/* Find one CDO group that meet the GOPs requirement. */
> +	for (level = 0; level < max_dpm_level; level++) {
> +		freq = xrs->cfg.clk_list.cu_clk_list[level];
> +		if (!qos_meet(xrs, rqos, cdop->qos_cap.opc * freq / 1000))
> +			break;
> +	}
> +
> +	/* set the dpm level which fits all the sessions */
> +	list_for_each_entry(node, &rgp->node_list, list) {
> +		if (node->dpm_level > level)
> +			level = node->dpm_level;
> +	}
> +
> +set_dpm:
> +	*dpm_level = level;
> +	return xrs->cfg.actions->set_dft_dpm_level(xrs->cfg.ddev, level);
> +}
> +
>   static struct solver_node *rg_search_node(struct solver_rgroup *rgp, u64 rid)
>   {
>   	struct solver_node *node;
> @@ -159,12 +205,9 @@ static int get_free_partition(struct solver_state *xrs,
>   	pt_node->ncols = ncols;
>   
>   	/*
> -	 * Before fully support latency in QoS, if a request
> -	 * specifies a non-zero latency value, it will not share
> -	 * the partition with other requests.
> +	 * Always set exclusive to false for now.
>   	 */
> -	if (req->rqos.latency)
> -		pt_node->exclusive = true;
> +	pt_node->exclusive = false;
>   
>   	list_add_tail(&pt_node->list, &xrs->rgp.pt_node_list);
>   	xrs->rgp.npartition_node++;
> @@ -257,6 +300,7 @@ int xrs_allocate_resource(void *hdl, struct alloc_requests *req, void *cb_arg)
>   	struct xrs_action_load load_act;
>   	struct solver_node *snode;
>   	struct solver_state *xrs;
> +	u32 dpm_level;
>   	int ret;
>   
>   	xrs = (struct solver_state *)hdl;
> @@ -281,6 +325,11 @@ int xrs_allocate_resource(void *hdl, struct alloc_requests *req, void *cb_arg)
>   	if (ret)
>   		goto free_node;
>   
> +	ret = set_dpm_level(xrs, req, &dpm_level);
> +	if (ret)
> +		goto free_node;
> +
> +	snode->dpm_level = dpm_level;
>   	snode->cb_arg = cb_arg;
>   
>   	drm_dbg(xrs->cfg.ddev, "start col %d ncols %d\n",
> diff --git a/drivers/accel/amdxdna/aie2_solver.h b/drivers/accel/amdxdna/aie2_solver.h
> index 9b1847bb46a6..a2e3c52229e9 100644
> --- a/drivers/accel/amdxdna/aie2_solver.h
> +++ b/drivers/accel/amdxdna/aie2_solver.h
> @@ -99,6 +99,7 @@ struct clk_list_info {
>   struct xrs_action_ops {
>   	int (*load)(void *cb_arg, struct xrs_action_load *action);
>   	int (*unload)(void *cb_arg);
> +	int (*set_dft_dpm_level)(struct drm_device *ddev, u32 level);
>   };
>   
>   /*
> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
> index c3541796d189..6bbd437d48d8 100644
> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
> @@ -160,6 +160,24 @@ static int amdxdna_drm_get_info_ioctl(struct drm_device *dev, void *data, struct
>   	return ret;
>   }
>   
> +static int amdxdna_drm_set_state_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
> +{
> +	struct amdxdna_client *client = filp->driver_priv;
> +	struct amdxdna_dev *xdna = to_xdna_dev(dev);
> +	struct amdxdna_drm_set_state *args = data;
> +	int ret;
> +
> +	if (!xdna->dev_info->ops->set_aie_state)
> +		return -EOPNOTSUPP;
> +
> +	XDNA_DBG(xdna, "Request parameter %u", args->param);
> +	mutex_lock(&xdna->dev_lock);
> +	ret = xdna->dev_info->ops->set_aie_state(client, args);
> +	mutex_unlock(&xdna->dev_lock);

With newly introduced mutex code, perhaps consider using guard(mutex) 
instead. This can turn into simpler code like:

guard(mutex)(&xdna->dev_lock);

return xdna->dev_info->ops->set_aie_state(client, args);


> +
> +	return ret;
> +}
> +
>   static const struct drm_ioctl_desc amdxdna_drm_ioctls[] = {
>   	/* Context */
>   	DRM_IOCTL_DEF_DRV(AMDXDNA_CREATE_HWCTX, amdxdna_drm_create_hwctx_ioctl, 0),
> @@ -173,6 +191,7 @@ static const struct drm_ioctl_desc amdxdna_drm_ioctls[] = {
>   	DRM_IOCTL_DEF_DRV(AMDXDNA_EXEC_CMD, amdxdna_drm_submit_cmd_ioctl, 0),
>   	/* AIE hardware */
>   	DRM_IOCTL_DEF_DRV(AMDXDNA_GET_INFO, amdxdna_drm_get_info_ioctl, 0),
> +	DRM_IOCTL_DEF_DRV(AMDXDNA_SET_STATE, amdxdna_drm_set_state_ioctl, DRM_ROOT_ONLY),
>   };
>   
>   static const struct file_operations amdxdna_fops = {
> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.h b/drivers/accel/amdxdna/amdxdna_pci_drv.h
> index f5b830fb14bb..e2071e31d949 100644
> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.h
> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.h
> @@ -20,6 +20,7 @@ extern const struct drm_driver amdxdna_drm_drv;
>   struct amdxdna_client;
>   struct amdxdna_dev;
>   struct amdxdna_drm_get_info;
> +struct amdxdna_drm_set_state;
>   struct amdxdna_gem_obj;
>   struct amdxdna_hwctx;
>   struct amdxdna_sched_job;
> @@ -40,6 +41,7 @@ struct amdxdna_dev_ops {
>   	void (*hwctx_resume)(struct amdxdna_hwctx *hwctx);
>   	int (*cmd_submit)(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job, u64 *seq);
>   	int (*get_aie_info)(struct amdxdna_client *client, struct amdxdna_drm_get_info *args);
> +	int (*set_aie_state)(struct amdxdna_client *client, struct amdxdna_drm_set_state *args);
>   };
>   
>   /*
> diff --git a/drivers/accel/amdxdna/npu1_regs.c b/drivers/accel/amdxdna/npu1_regs.c
> index f00c50461b09..c8f4d1cac65d 100644
> --- a/drivers/accel/amdxdna/npu1_regs.c
> +++ b/drivers/accel/amdxdna/npu1_regs.c
> @@ -44,18 +44,30 @@
>   #define NPU1_SMU_BAR_BASE  MPNPU_APERTURE0_BASE
>   #define NPU1_SRAM_BAR_BASE MPNPU_APERTURE1_BASE
>   
> -#define NPU1_RT_CFG_TYPE_PDI_LOAD 2
> -#define NPU1_RT_CFG_VAL_PDI_LOAD_MGMT 0
> -#define NPU1_RT_CFG_VAL_PDI_LOAD_APP 1
> +const struct rt_config npu1_default_rt_cfg[] = {
> +	{ 2, 1, AIE2_RT_CFG_INIT }, /* PDI APP LOAD MODE */
> +	{ 1, 1, AIE2_RT_CFG_CLK_GATING }, /* Clock gating on */
> +	{ 0 },
> +};
>   
> -#define NPU1_MPNPUCLK_FREQ_MAX  600
> -#define NPU1_HCLK_FREQ_MAX      1024
> +const struct dpm_clk_freq npu1_dpm_clk_table[] = {
> +	{400, 800},
> +	{600, 1024},
> +	{600, 1024},
> +	{600, 1024},
> +	{600, 1024},
> +	{720, 1309},
> +	{720, 1309},
> +	{847, 1600},
> +	{ 0 }
> +};
>   
>   const struct amdxdna_dev_priv npu1_dev_priv = {
>   	.fw_path        = "amdnpu/1502_00/npu.sbin",
>   	.protocol_major = 0x5,
>   	.protocol_minor = 0x1,
> -	.rt_config	= {NPU1_RT_CFG_TYPE_PDI_LOAD, NPU1_RT_CFG_VAL_PDI_LOAD_APP},
> +	.rt_config	= npu1_default_rt_cfg,
> +	.dpm_clk_tbl	= npu1_dpm_clk_table,
>   	.col_align	= COL_ALIGN_NONE,
>   	.mbox_dev_addr  = NPU1_MBOX_BAR_BASE,
>   	.mbox_size      = 0, /* Use BAR size */
> @@ -80,8 +92,9 @@ const struct amdxdna_dev_priv npu1_dev_priv = {
>   		DEFINE_BAR_OFFSET(SMU_RESP_REG, NPU1_SMU, MPNPU_PUB_SCRATCH6),
>   		DEFINE_BAR_OFFSET(SMU_OUT_REG,  NPU1_SMU, MPNPU_PUB_SCRATCH7),
>   	},
> -	.smu_mpnpuclk_freq_max = NPU1_MPNPUCLK_FREQ_MAX,
> -	.smu_hclk_freq_max     = NPU1_HCLK_FREQ_MAX,
> +	.hw_ops		= {
> +		.set_dpm = npu1_set_dpm,
> +	},
>   };
>   
>   const struct amdxdna_dev_info dev_npu1_info = {
> diff --git a/drivers/accel/amdxdna/npu2_regs.c b/drivers/accel/amdxdna/npu2_regs.c
> index 00cb381031d2..ac63131f9c7c 100644
> --- a/drivers/accel/amdxdna/npu2_regs.c
> +++ b/drivers/accel/amdxdna/npu2_regs.c
> @@ -61,18 +61,12 @@
>   #define NPU2_SMU_BAR_BASE	MMNPU_APERTURE4_BASE
>   #define NPU2_SRAM_BAR_BASE	MMNPU_APERTURE1_BASE
>   
> -#define NPU2_RT_CFG_TYPE_PDI_LOAD 5
> -#define NPU2_RT_CFG_VAL_PDI_LOAD_MGMT 0
> -#define NPU2_RT_CFG_VAL_PDI_LOAD_APP 1
> -
> -#define NPU2_MPNPUCLK_FREQ_MAX  1267
> -#define NPU2_HCLK_FREQ_MAX      1800
> -
>   const struct amdxdna_dev_priv npu2_dev_priv = {
>   	.fw_path        = "amdnpu/17f0_00/npu.sbin",
>   	.protocol_major = 0x6,
>   	.protocol_minor = 0x1,
> -	.rt_config	= {NPU2_RT_CFG_TYPE_PDI_LOAD, NPU2_RT_CFG_VAL_PDI_LOAD_APP},
> +	.rt_config	= npu4_default_rt_cfg,
> +	.dpm_clk_tbl	= npu4_dpm_clk_table,
>   	.col_align	= COL_ALIGN_NATURE,
>   	.mbox_dev_addr  = NPU2_MBOX_BAR_BASE,
>   	.mbox_size      = 0, /* Use BAR size */
> @@ -97,8 +91,9 @@ const struct amdxdna_dev_priv npu2_dev_priv = {
>   		DEFINE_BAR_OFFSET(SMU_RESP_REG, NPU2_SMU, MP1_C2PMSG_61),
>   		DEFINE_BAR_OFFSET(SMU_OUT_REG,  NPU2_SMU, MP1_C2PMSG_60),
>   	},
> -	.smu_mpnpuclk_freq_max = NPU2_MPNPUCLK_FREQ_MAX,
> -	.smu_hclk_freq_max     = NPU2_HCLK_FREQ_MAX,
> +	.hw_ops	=	 {
> +		.set_dpm = npu4_set_dpm,
> +	},
>   };
>   
>   const struct amdxdna_dev_info dev_npu2_info = {
> diff --git a/drivers/accel/amdxdna/npu4_regs.c b/drivers/accel/amdxdna/npu4_regs.c
> index b6dae9667cca..a713ac18adfc 100644
> --- a/drivers/accel/amdxdna/npu4_regs.c
> +++ b/drivers/accel/amdxdna/npu4_regs.c
> @@ -61,18 +61,33 @@
>   #define NPU4_SMU_BAR_BASE	MMNPU_APERTURE4_BASE
>   #define NPU4_SRAM_BAR_BASE	MMNPU_APERTURE1_BASE
>   
> -#define NPU4_RT_CFG_TYPE_PDI_LOAD 5
> -#define NPU4_RT_CFG_VAL_PDI_LOAD_MGMT 0
> -#define NPU4_RT_CFG_VAL_PDI_LOAD_APP 1
> +const struct rt_config npu4_default_rt_cfg[] = {
> +	{ 5, 1, AIE2_RT_CFG_INIT }, /* PDI APP LOAD MODE */
> +	{ 1, 1, AIE2_RT_CFG_CLK_GATING }, /* Clock gating on */
> +	{ 2, 1, AIE2_RT_CFG_CLK_GATING }, /* Clock gating on */
> +	{ 3, 1, AIE2_RT_CFG_CLK_GATING }, /* Clock gating on */
> +	{ 4, 1, AIE2_RT_CFG_CLK_GATING }, /* Clock gating on */
> +	{ 0 },
> +};
>   
> -#define NPU4_MPNPUCLK_FREQ_MAX  1267
> -#define NPU4_HCLK_FREQ_MAX      1800
> +const struct dpm_clk_freq npu4_dpm_clk_table[] = {
> +	{396, 792},
> +	{600, 1056},
> +	{792, 1152},
> +	{975, 1267},
> +	{975, 1267},
> +	{1056, 1408},
> +	{1152, 1584},
> +	{1267, 1800},
> +	{ 0 }
> +};
>   
>   const struct amdxdna_dev_priv npu4_dev_priv = {
>   	.fw_path        = "amdnpu/17f0_10/npu.sbin",
>   	.protocol_major = 0x6,
>   	.protocol_minor = 0x1,
> -	.rt_config	= {NPU4_RT_CFG_TYPE_PDI_LOAD, NPU4_RT_CFG_VAL_PDI_LOAD_APP},
> +	.rt_config	= npu4_default_rt_cfg,
> +	.dpm_clk_tbl	= npu4_dpm_clk_table,
>   	.col_align	= COL_ALIGN_NATURE,
>   	.mbox_dev_addr  = NPU4_MBOX_BAR_BASE,
>   	.mbox_size      = 0, /* Use BAR size */
> @@ -97,8 +112,9 @@ const struct amdxdna_dev_priv npu4_dev_priv = {
>   		DEFINE_BAR_OFFSET(SMU_RESP_REG, NPU4_SMU, MP1_C2PMSG_61),
>   		DEFINE_BAR_OFFSET(SMU_OUT_REG,  NPU4_SMU, MP1_C2PMSG_60),
>   	},
> -	.smu_mpnpuclk_freq_max = NPU4_MPNPUCLK_FREQ_MAX,
> -	.smu_hclk_freq_max     = NPU4_HCLK_FREQ_MAX,
> +	.hw_ops		= {
> +		.set_dpm = npu4_set_dpm,
> +	},
>   };
>   
>   const struct amdxdna_dev_info dev_npu4_info = {
> diff --git a/drivers/accel/amdxdna/npu5_regs.c b/drivers/accel/amdxdna/npu5_regs.c
> index bed1baf8e160..67a5d5bc8a49 100644
> --- a/drivers/accel/amdxdna/npu5_regs.c
> +++ b/drivers/accel/amdxdna/npu5_regs.c
> @@ -61,18 +61,12 @@
>   #define NPU5_SMU_BAR_BASE	MMNPU_APERTURE4_BASE
>   #define NPU5_SRAM_BAR_BASE	MMNPU_APERTURE1_BASE
>   
> -#define NPU5_RT_CFG_TYPE_PDI_LOAD 5
> -#define NPU5_RT_CFG_VAL_PDI_LOAD_MGMT 0
> -#define NPU5_RT_CFG_VAL_PDI_LOAD_APP 1
> -
> -#define NPU5_MPNPUCLK_FREQ_MAX  1267
> -#define NPU5_HCLK_FREQ_MAX      1800
> -
>   const struct amdxdna_dev_priv npu5_dev_priv = {
>   	.fw_path        = "amdnpu/17f0_11/npu.sbin",
>   	.protocol_major = 0x6,
>   	.protocol_minor = 0x1,
> -	.rt_config	= {NPU5_RT_CFG_TYPE_PDI_LOAD, NPU5_RT_CFG_VAL_PDI_LOAD_APP},
> +	.rt_config	= npu4_default_rt_cfg,
> +	.dpm_clk_tbl	= npu4_dpm_clk_table,
>   	.col_align	= COL_ALIGN_NATURE,
>   	.mbox_dev_addr  = NPU5_MBOX_BAR_BASE,
>   	.mbox_size      = 0, /* Use BAR size */
> @@ -97,8 +91,9 @@ const struct amdxdna_dev_priv npu5_dev_priv = {
>   		DEFINE_BAR_OFFSET(SMU_RESP_REG, NPU5_SMU, MP1_C2PMSG_61),
>   		DEFINE_BAR_OFFSET(SMU_OUT_REG,  NPU5_SMU, MP1_C2PMSG_60),
>   	},
> -	.smu_mpnpuclk_freq_max = NPU5_MPNPUCLK_FREQ_MAX,
> -	.smu_hclk_freq_max     = NPU5_HCLK_FREQ_MAX,
> +	.hw_ops		= {
> +		.set_dpm = npu4_set_dpm,
> +	},
>   };
>   
>   const struct amdxdna_dev_info dev_npu5_info = {
> diff --git a/drivers/accel/amdxdna/npu6_regs.c b/drivers/accel/amdxdna/npu6_regs.c
> index d1168fc55533..f46c760cefc7 100644
> --- a/drivers/accel/amdxdna/npu6_regs.c
> +++ b/drivers/accel/amdxdna/npu6_regs.c
> @@ -61,23 +61,12 @@
>   #define NPU6_SMU_BAR_BASE	MMNPU_APERTURE4_BASE
>   #define NPU6_SRAM_BAR_BASE	MMNPU_APERTURE1_BASE
>   
> -#define NPU6_RT_CFG_TYPE_PDI_LOAD 5
> -#define NPU6_RT_CFG_TYPE_DEBUG_BO 10
> -
> -#define NPU6_RT_CFG_VAL_PDI_LOAD_MGMT 0
> -#define NPU6_RT_CFG_VAL_PDI_LOAD_APP 1
> -
> -#define NPU6_RT_CFG_VAL_DEBUG_BO_DEFAULT 0
> -#define NPU6_RT_CFG_VAL_DEBUG_BO_LARGE   1
> -
> -#define NPU6_MPNPUCLK_FREQ_MAX  1267
> -#define NPU6_HCLK_FREQ_MAX      1800
> -
>   const struct amdxdna_dev_priv npu6_dev_priv = {
>   	.fw_path        = "amdnpu/17f0_10/npu.sbin",
>   	.protocol_major = 0x6,
>   	.protocol_minor = 12,
> -	.rt_config	= {NPU6_RT_CFG_TYPE_PDI_LOAD, NPU6_RT_CFG_VAL_PDI_LOAD_APP},
> +	.rt_config	= npu4_default_rt_cfg,
> +	.dpm_clk_tbl	= npu4_dpm_clk_table,
>   	.col_align	= COL_ALIGN_NATURE,
>   	.mbox_dev_addr  = NPU6_MBOX_BAR_BASE,
>   	.mbox_size      = 0, /* Use BAR size */
> @@ -102,6 +91,10 @@ const struct amdxdna_dev_priv npu6_dev_priv = {
>   		DEFINE_BAR_OFFSET(SMU_RESP_REG, NPU6_SMU, MP1_C2PMSG_61),
>   		DEFINE_BAR_OFFSET(SMU_OUT_REG,  NPU6_SMU, MP1_C2PMSG_60),
>   	},
> +	.hw_ops         = {
> +		.set_dpm = npu4_set_dpm,
> +	},
> +
>   };
>   
>   const struct amdxdna_dev_info dev_npu6_info = {
> diff --git a/include/uapi/drm/amdxdna_accel.h b/include/uapi/drm/amdxdna_accel.h
> index ea86c57beb92..08eeb9d70cd7 100644
> --- a/include/uapi/drm/amdxdna_accel.h
> +++ b/include/uapi/drm/amdxdna_accel.h
> @@ -33,6 +33,7 @@ enum amdxdna_drm_ioctl_id {
>   	DRM_AMDXDNA_SYNC_BO,
>   	DRM_AMDXDNA_EXEC_CMD,
>   	DRM_AMDXDNA_GET_INFO,
> +	DRM_AMDXDNA_SET_STATE,
>   };
>   
>   /**
> @@ -375,6 +376,24 @@ struct amdxdna_drm_query_hwctx {
>   	__u64 errors;
>   };
>   
> +enum amdxdna_power_mode_type {
> +	POWER_MODE_DEFAULT, /* Fallback to calculated DPM */
> +	POWER_MODE_LOW,     /* Set frequency to lowest DPM */
> +	POWER_MODE_MEDIUM,  /* Set frequency to medium DPM */
> +	POWER_MODE_HIGH,    /* Set frequency to highest DPM */
> +	POWER_MODE_TURBO,   /* Maximum power */
> +};
> +
> +/**
> + * struct amdxdna_drm_get_power_mode - Get the configured power mode
> + * @power_mode: The mode type from enum amdxdna_power_mode_type
> + * @pad: MBZ.
> + */
> +struct amdxdna_drm_get_power_mode {
> +	__u8 power_mode;
> +	__u8 pad[7];
> +};
> +
>   /**
>    * struct amdxdna_drm_query_firmware_version - Query the firmware version
>    * @major: The major version number
> @@ -416,6 +435,34 @@ struct amdxdna_drm_get_info {
>   	__u64 buffer; /* in/out */
>   };
>   
> +enum amdxdna_drm_set_param {
> +	DRM_AMDXDNA_SET_POWER_MODE,
> +	DRM_AMDXDNA_WRITE_AIE_MEM,
> +	DRM_AMDXDNA_WRITE_AIE_REG,
> +};
> +
> +/**
> + * struct amdxdna_drm_set_state - Set the state of the AIE hardware.
> + * @param: Value in enum amdxdna_drm_set_param.
> + * @buffer_size: Size of the input param.
> + * @buffer: Input param.
> + */
> +struct amdxdna_drm_set_state {
> +	__u32 param; /* in */
> +	__u32 buffer_size; /* in */
> +	__u64 buffer; /* in */
> +};
> +
> +/**
> + * struct amdxdna_drm_set_power_mode - Set the power mode of the AIE hardware
> + * @power_mode: The sensor type from enum amdxdna_power_mode_type
> + * @pad: MBZ.
> + */
> +struct amdxdna_drm_set_power_mode {
> +	__u8 power_mode;
> +	__u8 pad[7];
> +};
> +
>   #define DRM_IOCTL_AMDXDNA_CREATE_HWCTX \
>   	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDXDNA_CREATE_HWCTX, \
>   		 struct amdxdna_drm_create_hwctx)
> @@ -448,6 +495,10 @@ struct amdxdna_drm_get_info {
>   	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDXDNA_GET_INFO, \
>   		 struct amdxdna_drm_get_info)
>   
> +#define DRM_IOCTL_AMDXDNA_SET_STATE \
> +	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDXDNA_SET_STATE, \
> +		 struct amdxdna_drm_set_state)
> +
>   #if defined(__cplusplus)
>   } /* extern c end */
>   #endif

