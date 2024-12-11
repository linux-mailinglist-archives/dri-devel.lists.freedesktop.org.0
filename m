Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8089EC09F
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 01:20:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73EEB10EA24;
	Wed, 11 Dec 2024 00:20:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3EFwE5y8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2040.outbound.protection.outlook.com [40.107.244.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E30B10EA24
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 00:20:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PF2+TPV6W3UR/zLPssjWSuKw/6IM7LIhxikml7890wZq9M3v/b/GOCO680hToN7rL9fGYGP+/CAYLMndR6a34qG3H1x/1sqr1cv1fu/u+9ayuwyLVhYohbFShtuWfWEucNXYhDmWrN8yq1TU106RnZPqVI59QiItc5vSPIAbFs/mrGQj4YYjpRDzB5OVJsEG2tXxWcA1luTTWVdkt132re1byl2u+S9OD0aW9T1l+Ebjim2mzDyh0JbiVtJ2m1uUAT2SGxfurtoYWodudWVwLqEvwPtNEBV09S5NB0KBpOuzBFM2lTbYo74KDGEXeIMKW7QaSDRbHr7zKBVxQP4G9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d9gpceSQS1GM9aXkDvREFp0bf5G+csvJq2zd3at1/QU=;
 b=PA/mSAW3ZCzc3Tk6tVpk+duxpJqku4pB2FVahOoDUjwgGwAr88PorRV+4zVSfUUpayV+SnY8PZ45hXgF4WJCCCrP/AdPk45IC42PDsURKeRHORPrry9EP6yfOMMb6Eftq8sVUe1vlpL2ugw9Ue8/+feb0N0IHl+3g6nWStY2P2MCN42FXU14bv5aCo9cjEomfySk9jGxVDGSN2ygqzHNf9PDOb8x+pg6aEpFePg98GYKTfEA2M36l8DtzkP0fKaNijKm7sB4LisgWPTJQvyGNiFygXqS/7pY5GeTHPnuhHK/J7x26B8+ml0nVEGQrJxuBTTJ+3+NE5AKZpdQeOwYuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d9gpceSQS1GM9aXkDvREFp0bf5G+csvJq2zd3at1/QU=;
 b=3EFwE5y8M4AXFVccUSvBjzmb3VpJlKAUOdHf28068bSTEAbSB1+bM7YRAyl58HiyrtXrWt2frgMmC8/0ejRGrnfBPU23R8IBPF0vOrsy1Ik6oZ0rXF1bRiE7q+PI0GcnmCdyg6QrdJPLpQKLtbKwp19AA37JAvlZRLNOGBy9KYY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM4PR12MB8521.namprd12.prod.outlook.com (2603:10b6:8:17e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Wed, 11 Dec
 2024 00:20:13 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8230.016; Wed, 11 Dec 2024
 00:20:13 +0000
Message-ID: <72c43ee3-0b1e-42be-a936-8389f9954242@amd.com>
Date: Tue, 10 Dec 2024 18:20:10 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 7/8] accel/amdxdna: Read firmware interface version
 from registers
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, min.ma@amd.com, max.zhen@amd.com,
 sonal.santan@amd.com, king.tam@amd.com
References: <20241206220001.164049-1-lizhi.hou@amd.com>
 <20241206220001.164049-8-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20241206220001.164049-8-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR2101CA0007.namprd21.prod.outlook.com
 (2603:10b6:805:106::17) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DM4PR12MB8521:EE_
X-MS-Office365-Filtering-Correlation-Id: 738f3254-488c-4cd6-51be-08dd19799492
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RmxxcndqSFZ6ZjhQTkQwUENkS21RT2JaSXpaK3JiTENDY0k5cHlDQ0RVN0VJ?=
 =?utf-8?B?NTlGNXZISGJWNjNVN3lOUjV5REs5QVVMUnFXRnE1M1FhdHRLTVBBWWJCZ1RJ?=
 =?utf-8?B?V0w5SGJVTTRWMGtadUVXQlFRZUlTb2RBL01NSG5aVHFOL0Q3akZDbEVsa2lX?=
 =?utf-8?B?ZzZZZlM5Zk05VXJaemQxRGlKUGtsWnAyOVFWSzNzRHhzYkl4THVqeEhVN003?=
 =?utf-8?B?WEVTNWlHTm1ucUNtWEJvZC9mWDhvTHJPSkVkMXFMQ2FQdHEvYVJGTm1CeHBB?=
 =?utf-8?B?VG9wVnhFSXdsMEFaWXlEdENQMkdNSDVvalBVdjFXaHFDSjNOdG8xOVd3Qk42?=
 =?utf-8?B?WDRPUWRwcVd0UEpJcWJ5MTdLMGxNaVpybXJibzJsOVd6REwvT2xWSW5yekll?=
 =?utf-8?B?VDNXTWZnZ0tKeWp5VDVVSGc1bDE5cDExQ2JBSm5SWlN4dmFTUjd6MzVRZHJQ?=
 =?utf-8?B?YWh1Q1EydzVpNDljWmZlZmVCWWlFeG44Wkl1QWZJekVIRnN4YkhTTE9FSk5J?=
 =?utf-8?B?QzF1eFQxaDJoMnV5Z1FOUUNhV09wVmJtT2gwelBhMEQ2SnlEN2NuZGZVWFQ5?=
 =?utf-8?B?TmpSYmFyVkhITXJVLzVKR3RZT01JYnlVMkxSTkJIb2kyODVWRjE1Y3pOeW1G?=
 =?utf-8?B?SXFrZEJOeTV4czBlUndCVEhna2N1bmtUV2hnQmkrVUJ0bkF0VUt4ZkU5K2Vr?=
 =?utf-8?B?aDhISFowN29EUk52MW15eFlIYXI4YzBVY0s2S1AwYXc0Qm5ZM3kzSnBISXNW?=
 =?utf-8?B?QnR1OWIxWXd2ZzhrRmpZYW9seTV4RldUdyt0SUdldTYxR2RpR1JJL2xpWXZn?=
 =?utf-8?B?T0VyS1lML3ZUeFhvL2t5aUFaN01qRlFVWHovN2ZSUnhKM01xVThwbkhOdmFn?=
 =?utf-8?B?M2lwY2lZRUF2UlEwQnZueGJ2b3FqNUc0elFVZWJuN244UzJRRkhtdGhwQ0Ju?=
 =?utf-8?B?aWlYN0ZFRzNYOEtLWXArYnRRbFRmWWpvV2JsV2Zvdi8yR3hmMU03MWRkQ1dP?=
 =?utf-8?B?L1pYcUtVZXE2MzJFaHZmSzdyV3BTRUh0TlAwYmIxRUtPTU5pdDV3NGFnZC9o?=
 =?utf-8?B?UUgwd2xRdnhFMTFYb0ZFaVJHSDZpQUdTNUplODVKUGJ2TWIybVN2MEMyUkFn?=
 =?utf-8?B?bmlvejNIWXBxOXVZRGRtV2p6Q1p1c3ZHUHQyd093WXlGbUlBV2ZLR2lxT1JQ?=
 =?utf-8?B?bGxQN1ZYMVVES3JOQ2N2SmVxRjlCV2dpNDlaZDRnNzlCN1BDL0hxWjllaExO?=
 =?utf-8?B?T1N5bjIxZTk4eFlmZUFSYVlCZ3QwdnJvSHZsSXJ3MXFBak9IQUJPSkhmbEZu?=
 =?utf-8?B?VDM2bGFVdzE5U1MzRzhLTFFkeSsxbnI2VjBzRDlSVnYxMjU3L3dlQUhkSmlJ?=
 =?utf-8?B?eUlPUitSMWorbWV2dmNFZGJFTVZnVGtIb1VaYVpCU2hqamdpMW9kekxEN0RS?=
 =?utf-8?B?amo5U2V0ZExSbGNQSHhhNFhSa2h1ZTh6ZVFiSnBwVkNnTjVQL3c0M1ptMUJT?=
 =?utf-8?B?a0dJZklqZ2NQZVY5Vi9hYjBqUUhuYmFFbEFkcGdsRVZPaWtPc1NsS0JzRTJV?=
 =?utf-8?B?WDk3T3pmQzEyRlFheWp0SlFnVkVnVXcxcUo2RFh3andmZU5GZ0ZKcjlrYUg2?=
 =?utf-8?B?SllQR0ROaE1rd2F0Vjh4c3BvZm9BV0NwUXVIY2d0V0hJa011Q2tEL1pmYkR0?=
 =?utf-8?B?OUJLQU82Q1lWTzhBdG5YUmswOWI0ZXJsTHR0bGN0bTdpN1BTekpZSnRXY1hU?=
 =?utf-8?B?VTYvMHVoWDQ3SEttWTg0MkFLSXF2V0JLRTc4QU4rcXJRdTc3R0wxMVZiZm5z?=
 =?utf-8?B?blVENlhSUlNKTUFTcEs1UT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFdESmtwVkkvelRFalpsQ0pyNjhsR1VvWmp1TlYrdHlaS01vTWZQSzdTQ3kr?=
 =?utf-8?B?ZmFEamFTWFVIVW9sbjlKbnV2QVNORmtSamFBUTBycXJLbzdHc1QzNEZnQW5Q?=
 =?utf-8?B?Y0dFa1FnVDMxSVIzUUtGU2ovd2JJYlh6RWJ1eTRuejZZNU9sTXMzSzBqR2RR?=
 =?utf-8?B?a3VtSHhqT045dldzWFJZVUhrMGw1Mkl4UFY1bkhKTnU1UEV1RUpjZXl4ZjRM?=
 =?utf-8?B?bFBtTWd3ZnhRTUcyNGxLUnd5SEpkT2YxdEVNWFYyNUFNNFhXVWdrbEZHdFN2?=
 =?utf-8?B?Y21pdXBlYXFuRjBtWVZaNW5TVC9TeFZWSUtJZW9hNExhaFdENDdDNkFQbW5i?=
 =?utf-8?B?NElONThta0tyYVkyQW5GYWk4L2h0eHA4S2ExZ2YzRmZEbGtOM1JVOWdFMjdS?=
 =?utf-8?B?TTNqOWduck54S0ZvdFRnaE9oQ1hicExGOHczZmFVRVJzK1I1ejVtTTJpaWVi?=
 =?utf-8?B?ZE9FK29EcmZSdjJ2SjNydVQwRVEwQk1SenJPS2VmamNPZDBZZEdMMmhjU3M3?=
 =?utf-8?B?cVVmYnEyUG5qWlhtOXhmdjZMejFlKzIzaTVaZHg2SzZpbW94aDIxSGxsOURs?=
 =?utf-8?B?Z244TXg4RGZMeG5Mc24zakZVOWxBRDc2UU9CZjhubU5GMFpGK1grMGFQYm00?=
 =?utf-8?B?YUR2N0w4Y1ZsZzk0WnlhNFIrcEVZak9PK0JzSEg0MGpOcVQ0UXliOUNSYVRX?=
 =?utf-8?B?Z0l2R2ZIMjVEVE4zSjRKa2J2Z3k1Sm54NlBxNjd6ZENrYXpvNHFRRnAyZGU0?=
 =?utf-8?B?Zm41LzJObGp6dGxKMEtKS0RQVHJkNENBRFZEWk14TjZBZExESXpYbVY5THA3?=
 =?utf-8?B?M3pyYUlaOHFTTWhkT3hBUTRCUVp4OHRIMzJYcFNYV3Joc3ljOGhkS1pMNHhs?=
 =?utf-8?B?dnVlQWN3WkJIOElLcEhNWVhkbUt1Q1l1RStHSGdiOVBkRzdkdzRPOXREcWdi?=
 =?utf-8?B?LzlPa0NuenZWUEg2Zm5NdWNGVm5NSTdxMkRNSEljVVJaQzN5NnRtYkNZdWow?=
 =?utf-8?B?WUV0UW94N0dZRHhWTWw0eXJNQ0NhTEhxb1h5N1NOUk52VXRjcGFScm9FV21D?=
 =?utf-8?B?dTdRK1E3MVRMRDVsWXdFZVVVVFlIdSt4bkhuZHVkRWxHQVhLSVlUNHBTYlAy?=
 =?utf-8?B?UmJpV2VDMmd3Tk5tcXAyZnZuSFZkTDZWQzNNMmpOTzE2WjZtSWJQZUJmd1RL?=
 =?utf-8?B?TU5scVZrMW5LUUVTOSs2L28yL3AwSlJGU1NUbkdOaEw0Qi9zOWFNSXQyNkJI?=
 =?utf-8?B?Nkwwc1hyZ3ZjaktTeWgxZ0RnSEIyVDlacEhmNkVDUlBHM3RzNVNqOTJyZHBn?=
 =?utf-8?B?a2ZuUDk3SVNpLzJFeTBnYW8xSlRFZCsvR29SaVRBRWpBRG8yQ0dCS1hLM1NU?=
 =?utf-8?B?NHByZUhodzA2MW02TE4yZzFaMmlpS2tRc3pQUjlyZlp4SCtrb2JRdzB2ait1?=
 =?utf-8?B?MnJLSUFCYU9YOHl1MS80RHlKRG5OdUR1VEtOMnVUdEZhemR2dDloRnRSUGEz?=
 =?utf-8?B?TUhjSzVvYWI2QnBsa0lnVUJWNk9mYVo5by92VUR6b25JbWJHejhGQkhYUzZD?=
 =?utf-8?B?SUI2Y1lFRDloTVZ5ZWI4R2liSm1UV0xYOU5JMERvK0Vjc2JLaDVNUnFEeVF5?=
 =?utf-8?B?cXJLWlBlVEdmVmk2Vmw0UkUyc21VTWRDUG44R2xBb1p6N296dTZOY2dROENT?=
 =?utf-8?B?bk8xSFZURkxGeThCdXJXSDg0bFVXS0ZzYm5aVGd2YnhYOE9vVTVmcFZOUWRE?=
 =?utf-8?B?WTg3ZFVXUUtScGhydTYrYlFkcW9HZzJVdkN3NDcrQ1NFdmNjYy9aYTE3OGNs?=
 =?utf-8?B?My9DQ2Vid0M1WVh4OUltS1BTQVBqZklmSXB6QVRPQUppTkt1bERoVS9sWnM4?=
 =?utf-8?B?dm44NDMvVzBOYTVkRzQzSUcwTU52MFVKdTJIR25PS1p3aUg0ZWpacnlGME10?=
 =?utf-8?B?cHFsNWh6UVhLdUt6WFIzclZYSmMwYnlaWnZCbnF6aTEyeVZkQjNEbDYrdHky?=
 =?utf-8?B?Rzh3RDBsSFZwR3V5OUxuZTNXSVF2WkxpMllnQ3hqM0JrQnAxaEFNUHQ3SVU5?=
 =?utf-8?B?SFRCVlNCVDE4Znh2SjV5b0VrU2FEMGdTYVhxSVpsWUs5UDI4TmVuQVI4Wlhl?=
 =?utf-8?Q?gp+hwNRWd+pm/Rx1klwyUosOJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 738f3254-488c-4cd6-51be-08dd19799492
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 00:20:13.2994 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZRrY6xhXqk7YMXypKS0Vrfi4oyZ3ZPQKvFpSohPAqBEIM244JdecYRmy9EVJjnoOm3beBx+tJsvS7gZivjAnxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8521
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

On 12/6/2024 16:00, Lizhi Hou wrote:
> The latest released firmware supports reading firmware interface version
> from registers directly. The driver's probe routine reads the major and
> minor version numbers. If the firmware interface does not compatible with
s/does/is/
> the driver, the driver's probe routine returns failure.
> 
> Co-developed-by: Min Ma <min.ma@amd.com>
> Signed-off-by: Min Ma <min.ma@amd.com>
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>

Just to confirm you're not backing yourself into a corner the plan is 
not to bump this major version any time soon for anything already 
supported by the driver; right?

Because once you do that this is going to get messy quickly.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/accel/amdxdna/aie2_message.c | 26 ----------
>   drivers/accel/amdxdna/aie2_pci.c     | 74 ++++++++++++++++++++++------
>   drivers/accel/amdxdna/aie2_pci.h     |  6 +--
>   drivers/accel/amdxdna/npu1_regs.c    |  2 +-
>   drivers/accel/amdxdna/npu2_regs.c    |  2 +-
>   drivers/accel/amdxdna/npu4_regs.c    |  2 +-
>   drivers/accel/amdxdna/npu5_regs.c    |  2 +-
>   7 files changed, 64 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
> index 13b5a96f8d25..f6d46e1e5086 100644
> --- a/drivers/accel/amdxdna/aie2_message.c
> +++ b/drivers/accel/amdxdna/aie2_message.c
> @@ -100,32 +100,6 @@ int aie2_get_runtime_cfg(struct amdxdna_dev_hdl *ndev, u32 type, u64 *value)
>   	return 0;
>   }
>   
> -int aie2_check_protocol_version(struct amdxdna_dev_hdl *ndev)
> -{
> -	DECLARE_AIE2_MSG(protocol_version, MSG_OP_GET_PROTOCOL_VERSION);
> -	struct amdxdna_dev *xdna = ndev->xdna;
> -	int ret;
> -
> -	ret = aie2_send_mgmt_msg_wait(ndev, &msg);
> -	if (ret) {
> -		XDNA_ERR(xdna, "Failed to get protocol version, ret %d", ret);
> -		return ret;
> -	}
> -
> -	if (resp.major != ndev->priv->protocol_major) {
> -		XDNA_ERR(xdna, "Incompatible firmware protocol version major %d minor %d",
> -			 resp.major, resp.minor);
> -		return -EINVAL;
> -	}
> -
> -	if (resp.minor < ndev->priv->protocol_minor) {
> -		XDNA_ERR(xdna, "Firmware minor version smaller than supported");
> -		return -EINVAL;
> -	}
> -
> -	return 0;
> -}
> -
>   int aie2_assign_mgmt_pasid(struct amdxdna_dev_hdl *ndev, u16 pasid)
>   {
>   	DECLARE_AIE2_MSG(assign_mgmt_pasid, MSG_OP_ASSIGN_MGMT_PASID);
> diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
> index 489744a2e226..2d2b6b66617a 100644
> --- a/drivers/accel/amdxdna/aie2_pci.c
> +++ b/drivers/accel/amdxdna/aie2_pci.c
> @@ -33,17 +33,51 @@ MODULE_PARM_DESC(aie2_max_col, "Maximum column could be used");
>    * The related register and ring buffer information is on SRAM BAR.
>    * This struct is the register layout.
>    */
> +#define MGMT_MBOX_MAGIC 0x55504e5f /* _NPU */
>   struct mgmt_mbox_chann_info {
> -	u32	x2i_tail;
> -	u32	x2i_head;
> -	u32	x2i_buf;
> -	u32	x2i_buf_sz;
> -	u32	i2x_tail;
> -	u32	i2x_head;
> -	u32	i2x_buf;
> -	u32	i2x_buf_sz;
> +	__u32	x2i_tail;
> +	__u32	x2i_head;
> +	__u32	x2i_buf;
> +	__u32	x2i_buf_sz;
> +	__u32	i2x_tail;
> +	__u32	i2x_head;
> +	__u32	i2x_buf;
> +	__u32	i2x_buf_sz;
> +	__u32	magic;
> +	__u32	msi_id;
> +	__u32	prot_major;
> +	__u32	prot_minor;
> +	__u32	rsvd[4];
>   };
>   
> +static int aie2_check_protocol(struct amdxdna_dev_hdl *ndev, u32 fw_major, u32 fw_minor)
> +{
> +	struct amdxdna_dev *xdna = ndev->xdna;
> +
> +	/*
> +	 * The driver supported mailbox behavior is defined by
> +	 * ndev->priv->protocol_major and protocol_minor.
> +	 *
> +	 * When protocol_major and fw_major are different, it means driver
> +	 * and firmware are incompatible.
> +	 */
> +	if (ndev->priv->protocol_major != fw_major) {
> +		XDNA_ERR(xdna, "Incompatible firmware protocol major %d minor %d",
> +			 fw_major, fw_minor);
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * When protocol_minor is greater then fw_minor, that means driver
> +	 * relies on operation the installed firmware does not support.
> +	 */
> +	if (ndev->priv->protocol_minor > fw_minor) {
> +		XDNA_ERR(xdna, "Firmware minor version smaller than supported");
> +		return -EINVAL;
> +	}
> +	return 0;
> +}
> +
>   static void aie2_dump_chann_info_debug(struct amdxdna_dev_hdl *ndev)
>   {
>   	struct amdxdna_dev *xdna = ndev->xdna;
> @@ -57,6 +91,8 @@ static void aie2_dump_chann_info_debug(struct amdxdna_dev_hdl *ndev)
>   	XDNA_DBG(xdna, "x2i ringbuf 0x%x", ndev->mgmt_x2i.rb_start_addr);
>   	XDNA_DBG(xdna, "x2i rsize   0x%x", ndev->mgmt_x2i.rb_size);
>   	XDNA_DBG(xdna, "x2i chann index 0x%x", ndev->mgmt_chan_idx);
> +	XDNA_DBG(xdna, "mailbox protocol major 0x%x", ndev->mgmt_prot_major);
> +	XDNA_DBG(xdna, "mailbox protocol minor 0x%x", ndev->mgmt_prot_minor);
>   }
>   
>   static int aie2_get_mgmt_chann_info(struct amdxdna_dev_hdl *ndev)
> @@ -87,6 +123,12 @@ static int aie2_get_mgmt_chann_info(struct amdxdna_dev_hdl *ndev)
>   	for (i = 0; i < sizeof(info_regs) / sizeof(u32); i++)
>   		reg[i] = readl(ndev->sram_base + off + i * sizeof(u32));
>   
> +	if (info_regs.magic != MGMT_MBOX_MAGIC) {
> +		XDNA_ERR(ndev->xdna, "Invalid mbox magic 0x%x", info_regs.magic);
> +		ret = -EINVAL;
> +		goto done;
> +	}
> +
>   	i2x = &ndev->mgmt_i2x;
>   	x2i = &ndev->mgmt_x2i;
>   
> @@ -99,14 +141,20 @@ static int aie2_get_mgmt_chann_info(struct amdxdna_dev_hdl *ndev)
>   	x2i->mb_tail_ptr_reg = AIE2_MBOX_OFF(ndev, info_regs.x2i_tail);
>   	x2i->rb_start_addr   = AIE2_SRAM_OFF(ndev, info_regs.x2i_buf);
>   	x2i->rb_size         = info_regs.x2i_buf_sz;
> -	ndev->mgmt_chan_idx  = CHANN_INDEX(ndev, x2i->rb_start_addr);
>   
> +	ndev->mgmt_chan_idx  = info_regs.msi_id;
> +	ndev->mgmt_prot_major = info_regs.prot_major;
> +	ndev->mgmt_prot_minor = info_regs.prot_minor;
> +
> +	ret = aie2_check_protocol(ndev, ndev->mgmt_prot_major, ndev->mgmt_prot_minor);
> +
> +done:
>   	aie2_dump_chann_info_debug(ndev);
>   
>   	/* Must clear address at FW_ALIVE_OFF */
>   	writel(0, SRAM_GET_ADDR(ndev, FW_ALIVE_OFF));
>   
> -	return 0;
> +	return ret;
>   }
>   
>   int aie2_runtime_cfg(struct amdxdna_dev_hdl *ndev,
> @@ -155,12 +203,6 @@ static int aie2_mgmt_fw_init(struct amdxdna_dev_hdl *ndev)
>   {
>   	int ret;
>   
> -	ret = aie2_check_protocol_version(ndev);
> -	if (ret) {
> -		XDNA_ERR(ndev->xdna, "Check header hash failed");
> -		return ret;
> -	}
> -
>   	ret = aie2_runtime_cfg(ndev, AIE2_RT_CFG_INIT, NULL);
>   	if (ret) {
>   		XDNA_ERR(ndev->xdna, "Runtime config failed");
> diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
> index 8c17b74654ce..cc159cadff9f 100644
> --- a/drivers/accel/amdxdna/aie2_pci.h
> +++ b/drivers/accel/amdxdna/aie2_pci.h
> @@ -39,9 +39,6 @@
>   })
>   
>   #define CHAN_SLOT_SZ SZ_8K
> -#define CHANN_INDEX(ndev, rbuf_off) \
> -	(((rbuf_off) - SRAM_REG_OFF((ndev), MBOX_CHANN_OFF)) / CHAN_SLOT_SZ)
> -
>   #define MBOX_SIZE(ndev) \
>   ({ \
>   	typeof(ndev) _ndev = (ndev); \
> @@ -170,6 +167,8 @@ struct amdxdna_dev_hdl {
>   	struct xdna_mailbox_chann_res	mgmt_x2i;
>   	struct xdna_mailbox_chann_res	mgmt_i2x;
>   	u32				mgmt_chan_idx;
> +	u32				mgmt_prot_major;
> +	u32				mgmt_prot_minor;
>   
>   	u32				total_col;
>   	struct aie_version		version;
> @@ -262,7 +261,6 @@ int aie2_suspend_fw(struct amdxdna_dev_hdl *ndev);
>   int aie2_resume_fw(struct amdxdna_dev_hdl *ndev);
>   int aie2_set_runtime_cfg(struct amdxdna_dev_hdl *ndev, u32 type, u64 value);
>   int aie2_get_runtime_cfg(struct amdxdna_dev_hdl *ndev, u32 type, u64 *value);
> -int aie2_check_protocol_version(struct amdxdna_dev_hdl *ndev);
>   int aie2_assign_mgmt_pasid(struct amdxdna_dev_hdl *ndev, u16 pasid);
>   int aie2_query_aie_version(struct amdxdna_dev_hdl *ndev, struct aie_version *version);
>   int aie2_query_aie_metadata(struct amdxdna_dev_hdl *ndev, struct aie_metadata *metadata);
> diff --git a/drivers/accel/amdxdna/npu1_regs.c b/drivers/accel/amdxdna/npu1_regs.c
> index c8f4d1cac65d..e408af57e378 100644
> --- a/drivers/accel/amdxdna/npu1_regs.c
> +++ b/drivers/accel/amdxdna/npu1_regs.c
> @@ -65,7 +65,7 @@ const struct dpm_clk_freq npu1_dpm_clk_table[] = {
>   const struct amdxdna_dev_priv npu1_dev_priv = {
>   	.fw_path        = "amdnpu/1502_00/npu.sbin",
>   	.protocol_major = 0x5,
> -	.protocol_minor = 0x1,
> +	.protocol_minor = 0x7,
>   	.rt_config	= npu1_default_rt_cfg,
>   	.dpm_clk_tbl	= npu1_dpm_clk_table,
>   	.col_align	= COL_ALIGN_NONE,
> diff --git a/drivers/accel/amdxdna/npu2_regs.c b/drivers/accel/amdxdna/npu2_regs.c
> index ac63131f9c7c..286bd0d475e2 100644
> --- a/drivers/accel/amdxdna/npu2_regs.c
> +++ b/drivers/accel/amdxdna/npu2_regs.c
> @@ -64,7 +64,7 @@
>   const struct amdxdna_dev_priv npu2_dev_priv = {
>   	.fw_path        = "amdnpu/17f0_00/npu.sbin",
>   	.protocol_major = 0x6,
> -	.protocol_minor = 0x1,
> +	.protocol_minor = 0x6,
>   	.rt_config	= npu4_default_rt_cfg,
>   	.dpm_clk_tbl	= npu4_dpm_clk_table,
>   	.col_align	= COL_ALIGN_NATURE,
> diff --git a/drivers/accel/amdxdna/npu4_regs.c b/drivers/accel/amdxdna/npu4_regs.c
> index a713ac18adfc..00c52833ce89 100644
> --- a/drivers/accel/amdxdna/npu4_regs.c
> +++ b/drivers/accel/amdxdna/npu4_regs.c
> @@ -85,7 +85,7 @@ const struct dpm_clk_freq npu4_dpm_clk_table[] = {
>   const struct amdxdna_dev_priv npu4_dev_priv = {
>   	.fw_path        = "amdnpu/17f0_10/npu.sbin",
>   	.protocol_major = 0x6,
> -	.protocol_minor = 0x1,
> +	.protocol_minor = 12,
>   	.rt_config	= npu4_default_rt_cfg,
>   	.dpm_clk_tbl	= npu4_dpm_clk_table,
>   	.col_align	= COL_ALIGN_NATURE,
> diff --git a/drivers/accel/amdxdna/npu5_regs.c b/drivers/accel/amdxdna/npu5_regs.c
> index 67a5d5bc8a49..118849272f27 100644
> --- a/drivers/accel/amdxdna/npu5_regs.c
> +++ b/drivers/accel/amdxdna/npu5_regs.c
> @@ -64,7 +64,7 @@
>   const struct amdxdna_dev_priv npu5_dev_priv = {
>   	.fw_path        = "amdnpu/17f0_11/npu.sbin",
>   	.protocol_major = 0x6,
> -	.protocol_minor = 0x1,
> +	.protocol_minor = 12,
>   	.rt_config	= npu4_default_rt_cfg,
>   	.dpm_clk_tbl	= npu4_dpm_clk_table,
>   	.col_align	= COL_ALIGN_NATURE,

