Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD3B9F3D18
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 22:54:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AFF110E628;
	Mon, 16 Dec 2024 21:54:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5k1UAz+U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2056.outbound.protection.outlook.com [40.107.95.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 391D010E628
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 21:54:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zPE+DmhGuG3BgWlosa9BCQVlBeTdNaUPxHm8HXC7s5OYbu96LAy1KkMsvsfV/8x0J11m9T0b4kZ2/a0CVYAfXRLXtruroNHRM1uEwubdH5q8ib3iv5Wy2+NQ5SrhOUCJI4tPFubgWdX/RZZPRiVITEBw3pYxe5S68uzTDCRnvYQ6opnAQCD3CoRb4uDJ52fQZBoEB6i9C7Mn4n8AxWoj07LxP85qz1r1OturWV1hVuEnlwPl8kL0bVGzoYhknE6MshjsvLmzR+hytdMq5owLnqxrvl3EEWPHzsm3iuQmPlfqQEUxiddsMjFTg+glmNDHqmpmojc6fUWYPrJR0s26jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3bUBu+pqebQ8LwvpnNbKA4co+co0p58Vsg6N856OeQI=;
 b=otgISwU0hpoOXpN0COtEu2YGg1Ncs2BBHeqfgBm5LlWGa84zClQN7+C2wXq5AH/Vgms7/0PU5X5hDC9+nMwiwuCuoEg+4zLW6XRtQlICM5PdtxTY+u9kukDLxpNYmsJTGxXzr6Jbz9RzAVBpzd9HBx0kc52Pc4Vqk6zPbRxlFlIAQ4heawIDJ3vU6/XbdgbEfL06VJ7s7GGaslK5kEvGHHF4YVJJYbWUcotQcXYROU4lfHRS1TWRE4N/zYU+f/DvnOXguGM2Uxky7YsKOdbsqOCFqpyy7ZNZICAl6BuWvgyJzD+3jwcQ9mXD4xuNzcpmRqyu+Xw16oJpkvm5B9MnMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3bUBu+pqebQ8LwvpnNbKA4co+co0p58Vsg6N856OeQI=;
 b=5k1UAz+UcVdgPbGnxm1+6isVFD5Hu7EKvwAICcA01RHLLny2hv2VmG2zhWRdXUJ2icItqraE8Ek413GeEZdS9QXuabEB2UhoJTBIyd++OsNzBFCzuXWdQfgw5kAJlWOfwL9Ye0dS1xZYZ155DE8m+Qcg9Jf65g9E+h5d9LfuSxw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH7PR12MB5997.namprd12.prod.outlook.com (2603:10b6:510:1d9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Mon, 16 Dec
 2024 21:54:28 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8251.015; Mon, 16 Dec 2024
 21:54:28 +0000
Message-ID: <3bf94f99-c12c-463a-8a03-04b8aa2d8a0d@amd.com>
Date: Mon, 16 Dec 2024 15:54:26 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/5] accel/amdxdna: Replace idr api with xarray
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, min.ma@amd.com, max.zhen@amd.com,
 sonal.santan@amd.com, king.tam@amd.com
References: <20241213232933.1545388-1-lizhi.hou@amd.com>
 <20241213232933.1545388-3-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20241213232933.1545388-3-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR11CA0029.namprd11.prod.outlook.com
 (2603:10b6:806:6e::34) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|PH7PR12MB5997:EE_
X-MS-Office365-Filtering-Correlation-Id: 32fb4baf-a206-477a-bb09-08dd1e1c36a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TG5HakdZTTUwcW0vVzJyODltRmV1cENsTlpuQVR2UGpaQlh2dFY4OFdMZHhN?=
 =?utf-8?B?SDBwbllhMzJFanlDYUlJNDdvdXdnWSt6eWJqT2dPMFo4QjV2ZnZsZlZaTm4y?=
 =?utf-8?B?MFAwd0VpVzJSTklYbDg3a1QxTWFGNTl0eklaY0M0QmEzRWV2VFpXQlFPSVBv?=
 =?utf-8?B?bkJHU3pOWWtQcTl5c205YkhnaVBKVHdwejE5M2orTmkzc05teGpsR3lLSzh4?=
 =?utf-8?B?czRnbGFsN1hyMTRTbGVUeVZSVUV2YUgzTWpETncxVlpuZ0F1em1qNTkybDNn?=
 =?utf-8?B?cmJxSHpya0ppMjhvN2VuaHlGNU51cUtWbkpGOE04MW1mWklubHg3enU0SFNx?=
 =?utf-8?B?MEErNEZONllLU0ZwTUZDcGtKQUpmbTl0ZVI1clhDZzA4WXdYbHhPUSttQXZI?=
 =?utf-8?B?aGJPSVBrV2FlYlNWOEFuZC90MGM0dzNuWmZPb0IwQ0xyUFN0ajZwN1dZeU16?=
 =?utf-8?B?V01DNkNGMGgrdjZJQ1NxNEpzSDBiYkNaTGw0NUwxR1NoT3JSblE1YkNIVE5T?=
 =?utf-8?B?bldJYUxJUVJ2MkxlKzgxeDlheVk4eE1aSkpnVzBqdU5peEliWlB3ckUzdE1R?=
 =?utf-8?B?cWpSUzNkcVJHMmFlUzRvdXRzV1pSTmxncGIzQURsL1FIWFZRY2hUbmR5azZL?=
 =?utf-8?B?Nkd6YW5IYXpSb05FQWVqWlZJUm44T1JnSWxtakZ0aDdSVVVuL2lNRkpJVWRx?=
 =?utf-8?B?eXJtcTdhZlplcTQrWGhBQ3NVTjd6bjF6azNDL3BvNUdTc1BpMmcyZk5HM1pW?=
 =?utf-8?B?bWNaaytrbi92b3dwVWNxcWxhY0NWL2dRWHB2ZHo2ajJqNHFNQm5Jd1Z3Q3dn?=
 =?utf-8?B?UlF3Q2tYOUhuSTRlZlBsVEp0ZGp6RXlFdVhMeGp2RU1lZ3BxaWRZVk11aWFr?=
 =?utf-8?B?RCthdjk0NmZQeWtEOTgrWEVWdlBsMEg4VUdRQ0pFNkw1ZW4rSTR1TDBiSXN4?=
 =?utf-8?B?RytQMDZsMHZFanJlblNDcHh4VC9tOEVoUWFCS0NZL1NLOXd0aFQ3b2s2QVg2?=
 =?utf-8?B?M3BDKy9lQlZkekxha3VWMFd6NzJERWdjSWVncng3Rms4SU1CdHJuZnh4MW1h?=
 =?utf-8?B?UUJtalV6dWEwd0IyenhMQThMWWRncVNsUVhFaThEb0dLelJLcmxqcHZZS1RL?=
 =?utf-8?B?K1F5bGZoK2Y0YlBZWHRxdVlGM2lmUE9uNHQ5dzZSTGJKeGhMa2Y4VVlVWlhG?=
 =?utf-8?B?cTBXUzk4d1F5VjJnY0ZwcFVTK1dYWnZiZVhnc0VnWVloeEhqcE44WUVPM3d1?=
 =?utf-8?B?NmlnVDhURWtxV1NBdDJtanlpM1ZoWXRRRTMyZGVWNU44dURLSlplU3RwRElD?=
 =?utf-8?B?a0tQdi90ckJRTXZpTUJnbnM5Y0lYS1ppUkNRSDZuTXRqd3VkMDl6V1hMYXdQ?=
 =?utf-8?B?MUdGN3RBei9RcmVRSVl0ck04WlhXMnVGSmlzUzdySGNFNEtRTktPOWUzak5Z?=
 =?utf-8?B?NFJJMFNrendGaWxuclJGVTBuU3ZtcXN0cENrOVlCbzZuRFRYL3ZKeE1OaE5j?=
 =?utf-8?B?MkN3T01TQTl5YlZUQ1V4ZTl6WmJIZ05oOVpZYUtVM1l2eVlLdDJ1SERFNStP?=
 =?utf-8?B?ZW5CNWJTaXE4THNnMGNhTUJiUTVYa3BacU5OYWlMdGdMcHUvOU5mcmYrZnE1?=
 =?utf-8?B?UUNXbmpGcFliclpKclRYaWw5QTZCMmUyd210Nm9RcTkyYkpyQWZkNUNNWXVP?=
 =?utf-8?B?aHNic3JTOWtFcWU4T2F0TnU3dXREdGNwSnNvVDN1SFVHMjJBbjhuNzMxV2Rx?=
 =?utf-8?B?ck5kaGpCR0hlM2N0eUhGa1lNTVBHYlNSai95S2dwUFFGMSs0Q1c5d1BIMlhm?=
 =?utf-8?B?QUZPYTVqNjB5MldpNVdDTm9mcGFZc1BZS1hKSDlOclpBUTBndDVnbTAwbHB4?=
 =?utf-8?Q?uztSKLEwV/loO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vm9ZMkVQelNMWmxhc0lhZG5tTDBOQlJKdzNLd3RMVXJ6eTVESG5RYnBoeHNi?=
 =?utf-8?B?Wlo0cko5UncvdWxJKzZ5SG0zZjNCdHlsT3ZONklDQXN3M1Q3RVJHTlFvRWgv?=
 =?utf-8?B?S3F0OVcrUHdKeXR2QmRVQlF5KzBGcUtNVTVab3YzTlQ2T0xJSEpoWDF1dEVI?=
 =?utf-8?B?eGRjRXpZSTBSWHdmd2V3L2xycFRzOE1wU1dSU09oT1oyRWI5dGZSNi9CS0Jp?=
 =?utf-8?B?M2dTS2x3M242d283QS9GdVZEemlkVHgvZS9qUUg2c1JhL3YyYTF3dW1jTFk1?=
 =?utf-8?B?Y3cvS2wvRWFLVGZFRUFQbzNtdFd1ay9qZXJ1eHdoamxOLy81cHU5QUtackVW?=
 =?utf-8?B?S3o2ZEhXT1pTeWt1cERJRG9Ba0hkUUp1MUp2NG1FRjVZbTdDOXFxUUQ5TzRi?=
 =?utf-8?B?VnVSVFNPZUZNZHlac3B4c1ZBZmNsMVBCRWhMRjdHMjZPOFV3NTlNcDVvWnBw?=
 =?utf-8?B?K3loOFlmWkhlS2RadHRGS3k3Qmk2VUE2ZjBGek9IejRGOFhuQVRGYlA5d2gv?=
 =?utf-8?B?dnJqanU5Q0ZrYUlaRUpzdXN4RmMwSFVsakdJcE1NL1JneFlybEgxSyt1Vzdt?=
 =?utf-8?B?VjREZW53YzNORHBSK2t0RW9yaGVhaU1zQ3Z3QUhhK3FpQXdPQno5TGhYeGhn?=
 =?utf-8?B?Q3hLQk1RTUtDZUlSRGgyWFk5VkFET3g3enBsWWhuZlpuMlJWdHEwVWVTN2J1?=
 =?utf-8?B?QjU1ZXhNem13ZlZzTEV6d3I2Zi9sWFJKNFFRU1l6eUo3ZnFEeXpiYW55dHQ5?=
 =?utf-8?B?UXNTT1JmY0ErdzZiRXFlby9meDVuc2RCcG5IaFRERUxvc0ZSb0Q0K3Y0QnFK?=
 =?utf-8?B?NFM4dnNMa21vL2EzU3E3Mmt2TTNxMlJsTjh6TklkZm92NFU5YmdRVlZMdDJ5?=
 =?utf-8?B?TUQ5VUxVUW9mVUdnSm0raHA2T1FMVVFhRHpqaTFCa0hIMUtZYmJrQjNva3py?=
 =?utf-8?B?UE55blNJQXFmWDlmRGJBMU5wVWN5RzJoTlpQamljTWdGOWs3VjF6SnFxZWFM?=
 =?utf-8?B?ZFhFZ3phYUtIY0FWcDYzYSt2cFEwL2gyQlViQk94TlZ1YXIxL29jY0tHcmF4?=
 =?utf-8?B?cW1HT2g1anp4NExlT01aTlZwQlc3RnJuRUdsU1NHc2c1QzB6M1lNQlM3UGU1?=
 =?utf-8?B?Y0xOeXlrOEFSSWw5UlhSY2k4MXVKSDY1WGw3T0dIcVJwcEJKcWVWWUFzL0FB?=
 =?utf-8?B?eTlDN0srNjJZMHc3MElyMllPSnZQTDRkQnc0SEZjMmxNWUlNN0kzN2w1K0FS?=
 =?utf-8?B?V2EwOTcrRGRlUDY4Sm9WNVF3Rnl4S1RETWtSUGFwUUZHMWZnQnA4T2xhZXJm?=
 =?utf-8?B?SXhCSGM5bTQ5YXkrMkxvWXpGMUFuK0poSFV3RStHYkpsSmJGTTJuM0dCYmFP?=
 =?utf-8?B?S25Hd08wMFJNS2VmcHRwUTZ2S1BpOWxpcGFtTE1NZXR5OG8rc0NxYXZzZGJF?=
 =?utf-8?B?Vm9vMHpjZ2hVWVYwVi8vQklaa3pGOFo3MHVrT1dJZXF4ckVSd3IyRDVpUit1?=
 =?utf-8?B?clk1dDR6UERhT0ZCTU1iK29wQ3Zwb2lLc0ZFQmNGYzNFYkhPaVFnWHBaTmR0?=
 =?utf-8?B?aWdnUy95K08wRUdSMXZyZ2tlaXBlOWd0NUdrOTNCRmE2SFdaV0dEVVg5UEFC?=
 =?utf-8?B?NllnZTd5aHRsSXhzUkpEOGc4WUhqQmh3NGQ3TmN1NW5uYVcyZy95bVMvQSsx?=
 =?utf-8?B?VGI4VTE5ZG05RFBHaFRYRGxKWDIyTDl2VW5LcWJuc0NsdHpxNElhUkU5Q2tM?=
 =?utf-8?B?dk1JZXIwNE1PcWpTaXBUcnNYZ0pLQnBQRjhpUDk5SHJOYjhSeHE3TkRvK2Rz?=
 =?utf-8?B?SnFmWDZsS2Z0NzNjMHl1d0RMTzdoRTR6ZXg3MEZMbEpvNXNwYkIvRjI1K3NV?=
 =?utf-8?B?OGlQaVZOSExOMlVqVDdQcUN2WmI1RUhTdUM4Q0dOcHVnVFZrZWJtcm1BLyto?=
 =?utf-8?B?cnhYMjB1cS9kSzlyV1BUNzlBR3k5YkR2OGJnbk9EQjMyNDBzQkxCUlBJaEhu?=
 =?utf-8?B?M3ZJaWRaY0ZURW5STlVRbkMrbUg2ZHZHMlN0akRWRVg5UjJmVzJKWW9IbkFM?=
 =?utf-8?B?bGIyTmM3UU5EUVhSUXY3RE84UkMvdHNrUVlSakplM2hkc2tlbEtsVFFJbmpu?=
 =?utf-8?Q?emsYUMMWr3VQqsHuqbp58xMKf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32fb4baf-a206-477a-bb09-08dd1e1c36a4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2024 21:54:28.2369 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nk1WHvN/s1HHQVYqCocaJOIO/1DckAiwqPM3NJfjlKbJ3rf52SNKAPBwOSkoGIafeqr5oxiIL7IFXqTTbRIANw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5997
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

On 12/13/2024 17:29, Lizhi Hou wrote:
> Switch mailbox message id and hardware context id management over from
> the idr api to the xarray api.
> 
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/accel/amdxdna/TODO              |  1 -
>   drivers/accel/amdxdna/aie2_ctx.c        |  5 ++-
>   drivers/accel/amdxdna/aie2_message.c    |  5 ++-
>   drivers/accel/amdxdna/aie2_pci.c        |  6 +--
>   drivers/accel/amdxdna/amdxdna_ctx.c     | 47 +++++++++------------
>   drivers/accel/amdxdna/amdxdna_mailbox.c | 56 ++++++++++---------------
>   drivers/accel/amdxdna/amdxdna_pci_drv.c |  4 +-
>   drivers/accel/amdxdna/amdxdna_pci_drv.h |  8 +++-
>   8 files changed, 60 insertions(+), 72 deletions(-)
> 
> diff --git a/drivers/accel/amdxdna/TODO b/drivers/accel/amdxdna/TODO
> index a130259f5f70..de4e1dbc8868 100644
> --- a/drivers/accel/amdxdna/TODO
> +++ b/drivers/accel/amdxdna/TODO
> @@ -1,4 +1,3 @@
> -- Replace idr with xa
>   - Add import and export BO support
>   - Add debugfs support
>   - Add debug BO support
> diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
> index b5282555bbf2..7218f751144c 100644
> --- a/drivers/accel/amdxdna/aie2_ctx.c
> +++ b/drivers/accel/amdxdna/aie2_ctx.c
> @@ -11,6 +11,7 @@
>   #include <drm/drm_syncobj.h>
>   #include <linux/hmm.h>
>   #include <linux/types.h>
> +#include <linux/xarray.h>
>   #include <trace/events/amdxdna.h>
>   
>   #include "aie2_msg_priv.h"
> @@ -90,11 +91,11 @@ void aie2_restart_ctx(struct amdxdna_client *client)
>   {
>   	struct amdxdna_dev *xdna = client->xdna;
>   	struct amdxdna_hwctx *hwctx;
> -	int next = 0;
> +	unsigned long hwctx_id;
>   
>   	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
>   	mutex_lock(&client->hwctx_lock);
> -	idr_for_each_entry_continue(&client->hwctx_idr, hwctx, next) {
> +	amdxdna_for_each_hwctx(client, hwctx_id, hwctx) {
>   		if (hwctx->status != HWCTX_STAT_STOP)
>   			continue;
>   
> diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
> index c01a1d957b56..c90f5e2fc115 100644
> --- a/drivers/accel/amdxdna/aie2_message.c
> +++ b/drivers/accel/amdxdna/aie2_message.c
> @@ -14,6 +14,7 @@
>   #include <linux/errno.h>
>   #include <linux/pci.h>
>   #include <linux/types.h>
> +#include <linux/xarray.h>
>   
>   #include "aie2_msg_priv.h"
>   #include "aie2_pci.h"
> @@ -315,10 +316,10 @@ int aie2_query_status(struct amdxdna_dev_hdl *ndev, char __user *buf,
>   	struct amdxdna_dev *xdna = ndev->xdna;
>   	struct amdxdna_client *client;
>   	struct amdxdna_hwctx *hwctx;
> +	unsigned long hwctx_id;
>   	dma_addr_t dma_addr;
>   	u32 aie_bitmap = 0;
>   	u8 *buff_addr;
> -	int next = 0;
>   	int ret, idx;
>   
>   	buff_addr = dma_alloc_noncoherent(xdna->ddev.dev, size, &dma_addr,
> @@ -329,7 +330,7 @@ int aie2_query_status(struct amdxdna_dev_hdl *ndev, char __user *buf,
>   	/* Go through each hardware context and mark the AIE columns that are active */
>   	list_for_each_entry(client, &xdna->client_list, node) {
>   		idx = srcu_read_lock(&client->hwctx_srcu);
> -		idr_for_each_entry_continue(&client->hwctx_idr, hwctx, next)
> +		amdxdna_for_each_hwctx(client, hwctx_id, hwctx)
>   			aie_bitmap |= amdxdna_hwctx_col_map(hwctx);
>   		srcu_read_unlock(&client->hwctx_srcu, idx);
>   	}
> diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
> index ebf68e3f8341..25c4215cc456 100644
> --- a/drivers/accel/amdxdna/aie2_pci.c
> +++ b/drivers/accel/amdxdna/aie2_pci.c
> @@ -15,6 +15,7 @@
>   #include <linux/iommu.h>
>   #include <linux/iopoll.h>
>   #include <linux/pci.h>
> +#include <linux/xarray.h>
>   
>   #include "aie2_msg_priv.h"
>   #include "aie2_pci.h"
> @@ -691,11 +692,11 @@ static int aie2_get_hwctx_status(struct amdxdna_client *client,
>   	struct amdxdna_drm_query_hwctx *tmp;
>   	struct amdxdna_client *tmp_client;
>   	struct amdxdna_hwctx *hwctx;
> +	unsigned long hwctx_id;
>   	bool overflow = false;
>   	u32 req_bytes = 0;
>   	u32 hw_i = 0;
>   	int ret = 0;
> -	int next;
>   	int idx;
>   
>   	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
> @@ -707,8 +708,7 @@ static int aie2_get_hwctx_status(struct amdxdna_client *client,
>   	buf = u64_to_user_ptr(args->buffer);
>   	list_for_each_entry(tmp_client, &xdna->client_list, node) {
>   		idx = srcu_read_lock(&tmp_client->hwctx_srcu);
> -		next = 0;
> -		idr_for_each_entry_continue(&tmp_client->hwctx_idr, hwctx, next) {
> +		amdxdna_for_each_hwctx(tmp_client, hwctx_id, hwctx) {
>   			req_bytes += sizeof(*tmp);
>   			if (args->buffer_size < req_bytes) {
>   				/* Continue iterating to get the required size */
> diff --git a/drivers/accel/amdxdna/amdxdna_ctx.c b/drivers/accel/amdxdna/amdxdna_ctx.c
> index 5478b631b73f..324f35c43f6c 100644
> --- a/drivers/accel/amdxdna/amdxdna_ctx.c
> +++ b/drivers/accel/amdxdna/amdxdna_ctx.c
> @@ -11,6 +11,7 @@
>   #include <drm/drm_gem_shmem_helper.h>
>   #include <drm/drm_print.h>
>   #include <drm/gpu_scheduler.h>
> +#include <linux/xarray.h>
>   #include <trace/events/amdxdna.h>
>   
>   #include "amdxdna_ctx.h"
> @@ -63,11 +64,11 @@ void amdxdna_hwctx_suspend(struct amdxdna_client *client)
>   {
>   	struct amdxdna_dev *xdna = client->xdna;
>   	struct amdxdna_hwctx *hwctx;
> -	int next = 0;
> +	unsigned long hwctx_id;
>   
>   	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
>   	mutex_lock(&client->hwctx_lock);
> -	idr_for_each_entry_continue(&client->hwctx_idr, hwctx, next)
> +	amdxdna_for_each_hwctx(client, hwctx_id, hwctx)
>   		xdna->dev_info->ops->hwctx_suspend(hwctx);
>   	mutex_unlock(&client->hwctx_lock);
>   }
> @@ -76,11 +77,11 @@ void amdxdna_hwctx_resume(struct amdxdna_client *client)
>   {
>   	struct amdxdna_dev *xdna = client->xdna;
>   	struct amdxdna_hwctx *hwctx;
> -	int next = 0;
> +	unsigned long hwctx_id;
>   
>   	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
>   	mutex_lock(&client->hwctx_lock);
> -	idr_for_each_entry_continue(&client->hwctx_idr, hwctx, next)
> +	amdxdna_for_each_hwctx(client, hwctx_id, hwctx)
>   		xdna->dev_info->ops->hwctx_resume(hwctx);
>   	mutex_unlock(&client->hwctx_lock);
>   }
> @@ -149,13 +150,13 @@ int amdxdna_cmd_get_cu_idx(struct amdxdna_gem_obj *abo)
>   void amdxdna_hwctx_remove_all(struct amdxdna_client *client)
>   {
>   	struct amdxdna_hwctx *hwctx;
> -	int next = 0;
> +	unsigned long hwctx_id;
>   
>   	mutex_lock(&client->hwctx_lock);
> -	idr_for_each_entry_continue(&client->hwctx_idr, hwctx, next) {
> +	amdxdna_for_each_hwctx(client, hwctx_id, hwctx) {
>   		XDNA_DBG(client->xdna, "PID %d close HW context %d",
>   			 client->pid, hwctx->id);
> -		idr_remove(&client->hwctx_idr, hwctx->id);
> +		xa_erase(&client->hwctx_xa, hwctx->id);
>   		mutex_unlock(&client->hwctx_lock);
>   		amdxdna_hwctx_destroy_rcu(hwctx, &client->hwctx_srcu);
>   		mutex_lock(&client->hwctx_lock);
> @@ -194,15 +195,13 @@ int amdxdna_drm_create_hwctx_ioctl(struct drm_device *dev, void *data, struct dr
>   	hwctx->num_tiles = args->num_tiles;
>   	hwctx->mem_size = args->mem_size;
>   	hwctx->max_opc = args->max_opc;
> -	mutex_lock(&client->hwctx_lock);
> -	ret = idr_alloc_cyclic(&client->hwctx_idr, hwctx, 0, MAX_HWCTX_ID, GFP_KERNEL);
> +	ret = xa_alloc_cyclic(&client->hwctx_xa, &hwctx->id, hwctx,
> +			      XA_LIMIT(AMDXDNA_INVALID_CTX_HANDLE + 1, MAX_HWCTX_ID),
> +			      &client->next_hwctxid, GFP_KERNEL);
>   	if (ret < 0) {
> -		mutex_unlock(&client->hwctx_lock);
>   		XDNA_ERR(xdna, "Allocate hwctx ID failed, ret %d", ret);
>   		goto free_hwctx;
>   	}
> -	hwctx->id = ret;
> -	mutex_unlock(&client->hwctx_lock);
>   
>   	hwctx->name = kasprintf(GFP_KERNEL, "hwctx.%d.%d", client->pid, hwctx->id);
>   	if (!hwctx->name) {
> @@ -228,9 +227,7 @@ int amdxdna_drm_create_hwctx_ioctl(struct drm_device *dev, void *data, struct dr
>   free_name:
>   	kfree(hwctx->name);
>   rm_id:
> -	mutex_lock(&client->hwctx_lock);
> -	idr_remove(&client->hwctx_idr, hwctx->id);
> -	mutex_unlock(&client->hwctx_lock);
> +	xa_erase(&client->hwctx_xa, hwctx->id);
>   free_hwctx:
>   	kfree(hwctx);
>   exit:
> @@ -249,24 +246,18 @@ int amdxdna_drm_destroy_hwctx_ioctl(struct drm_device *dev, void *data, struct d
>   	if (!drm_dev_enter(dev, &idx))
>   		return -ENODEV;
>   
> -	/*
> -	 * Use hwctx_lock to achieve exclusion with other hwctx writers,
> -	 * SRCU to synchronize with exec/wait command ioctls.
> -	 *
> -	 * The pushed jobs are handled by DRM scheduler during destroy.
> -	 */
> -	mutex_lock(&client->hwctx_lock);
> -	hwctx = idr_find(&client->hwctx_idr, args->handle);
> +	hwctx = xa_erase(&client->hwctx_xa, args->handle);
>   	if (!hwctx) {
> -		mutex_unlock(&client->hwctx_lock);
>   		ret = -EINVAL;
>   		XDNA_DBG(xdna, "PID %d HW context %d not exist",
>   			 client->pid, args->handle);
>   		goto out;
>   	}
> -	idr_remove(&client->hwctx_idr, hwctx->id);
> -	mutex_unlock(&client->hwctx_lock);
>   
> +	/*
> +	 * The pushed jobs are handled by DRM scheduler during destroy.
> +	 * SRCU to synchronize with exec command ioctls.
> +	 */
>   	amdxdna_hwctx_destroy_rcu(hwctx, &client->hwctx_srcu);
>   
>   	XDNA_DBG(xdna, "PID %d destroyed HW context %d", client->pid, args->handle);
> @@ -324,7 +315,7 @@ int amdxdna_drm_config_hwctx_ioctl(struct drm_device *dev, void *data, struct dr
>   
>   	mutex_lock(&xdna->dev_lock);
>   	idx = srcu_read_lock(&client->hwctx_srcu);
> -	hwctx = idr_find(&client->hwctx_idr, args->handle);
> +	hwctx = xa_load(&client->hwctx_xa, args->handle);
>   	if (!hwctx) {
>   		XDNA_DBG(xdna, "PID %d failed to get hwctx %d", client->pid, args->handle);
>   		ret = -EINVAL;
> @@ -436,7 +427,7 @@ int amdxdna_cmd_submit(struct amdxdna_client *client,
>   	}
>   
>   	idx = srcu_read_lock(&client->hwctx_srcu);
> -	hwctx = idr_find(&client->hwctx_idr, hwctx_hdl);
> +	hwctx = xa_load(&client->hwctx_xa, hwctx_hdl);
>   	if (!hwctx) {
>   		XDNA_DBG(xdna, "PID %d failed to get hwctx %d",
>   			 client->pid, hwctx_hdl);
> diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c b/drivers/accel/amdxdna/amdxdna_mailbox.c
> index 378d985222cd..1afc8079e3d1 100644
> --- a/drivers/accel/amdxdna/amdxdna_mailbox.c
> +++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
> @@ -8,6 +8,7 @@
>   #include <linux/bitfield.h>
>   #include <linux/interrupt.h>
>   #include <linux/iopoll.h>
> +#include <linux/xarray.h>
>   
>   #define CREATE_TRACE_POINTS
>   #include <trace/events/amdxdna.h>
> @@ -55,8 +56,8 @@ struct mailbox_channel {
>   	struct xdna_mailbox_chann_res	res[CHAN_RES_NUM];
>   	int				msix_irq;
>   	u32				iohub_int_addr;
> -	struct idr			chan_idr;
> -	spinlock_t			chan_idr_lock; /* protect chan_idr */
> +	struct xarray			chan_xa;
> +	u32				next_msgid;
>   	u32				x2i_tail;
>   
>   	/* Received msg related fields */
> @@ -165,19 +166,17 @@ static inline int mailbox_validate_msgid(int msg_id)
>   
>   static int mailbox_acquire_msgid(struct mailbox_channel *mb_chann, struct mailbox_msg *mb_msg)
>   {
> -	unsigned long flags;
> -	int msg_id;
> +	u32 msg_id;
> +	int ret;
>   
> -	spin_lock_irqsave(&mb_chann->chan_idr_lock, flags);
> -	msg_id = idr_alloc_cyclic(&mb_chann->chan_idr, mb_msg, 0,
> -				  MAX_MSG_ID_ENTRIES, GFP_NOWAIT);
> -	spin_unlock_irqrestore(&mb_chann->chan_idr_lock, flags);
> -	if (msg_id < 0)
> -		return msg_id;
> +	ret = xa_alloc_cyclic_irq(&mb_chann->chan_xa, &msg_id, mb_msg,
> +				  XA_LIMIT(0, MAX_MSG_ID_ENTRIES - 1),
> +				  &mb_chann->next_msgid, GFP_NOWAIT);
> +	if (ret < 0)
> +		return ret;
>   
>   	/*
> -	 * The IDR becomes less efficient when dealing with larger IDs.
> -	 * Thus, add MAGIC_VAL to the higher bits.
> +	 * Add MAGIC_VAL to the higher bits.
>   	 */
>   	msg_id |= MAGIC_VAL;
>   	return msg_id;
> @@ -185,25 +184,17 @@ static int mailbox_acquire_msgid(struct mailbox_channel *mb_chann, struct mailbo
>   
>   static void mailbox_release_msgid(struct mailbox_channel *mb_chann, int msg_id)
>   {
> -	unsigned long flags;
> -
>   	msg_id &= ~MAGIC_VAL_MASK;
> -	spin_lock_irqsave(&mb_chann->chan_idr_lock, flags);
> -	idr_remove(&mb_chann->chan_idr, msg_id);
> -	spin_unlock_irqrestore(&mb_chann->chan_idr_lock, flags);
> +	xa_erase_irq(&mb_chann->chan_xa, msg_id);
>   }
>   
> -static int mailbox_release_msg(int id, void *p, void *data)
> +static void mailbox_release_msg(struct mailbox_channel *mb_chann,
> +				struct mailbox_msg *mb_msg)
>   {
> -	struct mailbox_channel *mb_chann = data;
> -	struct mailbox_msg *mb_msg = p;
> -
>   	MB_DBG(mb_chann, "msg_id 0x%x msg opcode 0x%x",
>   	       mb_msg->pkg.header.id, mb_msg->pkg.header.opcode);
>   	mb_msg->notify_cb(mb_msg->handle, NULL, 0);
>   	kfree(mb_msg);
> -
> -	return 0;
>   }
>   
>   static int
> @@ -255,7 +246,6 @@ mailbox_get_resp(struct mailbox_channel *mb_chann, struct xdna_msg_header *heade
>   		 void *data)
>   {
>   	struct mailbox_msg *mb_msg;
> -	unsigned long flags;
>   	int msg_id;
>   	int ret;
>   
> @@ -266,15 +256,11 @@ mailbox_get_resp(struct mailbox_channel *mb_chann, struct xdna_msg_header *heade
>   	}
>   
>   	msg_id &= ~MAGIC_VAL_MASK;
> -	spin_lock_irqsave(&mb_chann->chan_idr_lock, flags);
> -	mb_msg = idr_find(&mb_chann->chan_idr, msg_id);
> +	mb_msg = xa_erase_irq(&mb_chann->chan_xa, msg_id);
>   	if (!mb_msg) {
>   		MB_ERR(mb_chann, "Cannot find msg 0x%x", msg_id);
> -		spin_unlock_irqrestore(&mb_chann->chan_idr_lock, flags);
>   		return -EINVAL;
>   	}
> -	idr_remove(&mb_chann->chan_idr, msg_id);
> -	spin_unlock_irqrestore(&mb_chann->chan_idr_lock, flags);
>   
>   	MB_DBG(mb_chann, "opcode 0x%x size %d id 0x%x",
>   	       header->opcode, header->total_size, header->id);
> @@ -498,8 +484,7 @@ xdna_mailbox_create_channel(struct mailbox *mb,
>   	memcpy(&mb_chann->res[CHAN_RES_X2I], x2i, sizeof(*x2i));
>   	memcpy(&mb_chann->res[CHAN_RES_I2X], i2x, sizeof(*i2x));
>   
> -	spin_lock_init(&mb_chann->chan_idr_lock);
> -	idr_init(&mb_chann->chan_idr);
> +	xa_init_flags(&mb_chann->chan_xa, XA_FLAGS_ALLOC | XA_FLAGS_LOCK_IRQ);
>   	mb_chann->x2i_tail = mailbox_get_tailptr(mb_chann, CHAN_RES_X2I);
>   	mb_chann->i2x_head = mailbox_get_headptr(mb_chann, CHAN_RES_I2X);
>   
> @@ -531,13 +516,18 @@ xdna_mailbox_create_channel(struct mailbox *mb,
>   
>   int xdna_mailbox_destroy_channel(struct mailbox_channel *mb_chann)
>   {
> +	struct mailbox_msg *mb_msg;
> +	unsigned long msg_id;
> +
>   	MB_DBG(mb_chann, "IRQ disabled and RX work cancelled");
>   	free_irq(mb_chann->msix_irq, mb_chann);
>   	destroy_workqueue(mb_chann->work_q);
>   	/* We can clean up and release resources */
>   
> -	idr_for_each(&mb_chann->chan_idr, mailbox_release_msg, mb_chann);
> -	idr_destroy(&mb_chann->chan_idr);
> +	xa_for_each(&mb_chann->chan_xa, msg_id, mb_msg)
> +		mailbox_release_msg(mb_chann, mb_msg);
> +
> +	xa_destroy(&mb_chann->chan_xa);
>   
>   	MB_DBG(mb_chann, "Mailbox channel destroyed, irq: %d", mb_chann->msix_irq);
>   	kfree(mb_chann);
> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
> index 0ba2af987837..c00ca314d033 100644
> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
> @@ -78,7 +78,7 @@ static int amdxdna_drm_open(struct drm_device *ddev, struct drm_file *filp)
>   	}
>   	mutex_init(&client->hwctx_lock);
>   	init_srcu_struct(&client->hwctx_srcu);
> -	idr_init_base(&client->hwctx_idr, AMDXDNA_INVALID_CTX_HANDLE + 1);
> +	xa_init_flags(&client->hwctx_xa, XA_FLAGS_ALLOC);
>   	mutex_init(&client->mm_lock);
>   
>   	mutex_lock(&xdna->dev_lock);
> @@ -109,7 +109,7 @@ static void amdxdna_drm_close(struct drm_device *ddev, struct drm_file *filp)
>   
>   	XDNA_DBG(xdna, "closing pid %d", client->pid);
>   
> -	idr_destroy(&client->hwctx_idr);
> +	xa_destroy(&client->hwctx_xa);
>   	cleanup_srcu_struct(&client->hwctx_srcu);
>   	mutex_destroy(&client->hwctx_lock);
>   	mutex_destroy(&client->mm_lock);
> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.h b/drivers/accel/amdxdna/amdxdna_pci_drv.h
> index 0c2e31c05d3e..b62b63a66098 100644
> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.h
> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.h
> @@ -6,6 +6,8 @@
>   #ifndef _AMDXDNA_PCI_DRV_H_
>   #define _AMDXDNA_PCI_DRV_H_
>   
> +#include <linux/xarray.h>
> +
>   #define XDNA_INFO(xdna, fmt, args...)	drm_info(&(xdna)->ddev, fmt, ##args)
>   #define XDNA_WARN(xdna, fmt, args...)	drm_warn(&(xdna)->ddev, "%s: "fmt, __func__, ##args)
>   #define XDNA_ERR(xdna, fmt, args...)	drm_err(&(xdna)->ddev, "%s: "fmt, __func__, ##args)
> @@ -100,7 +102,8 @@ struct amdxdna_client {
>   	struct mutex			hwctx_lock; /* protect hwctx */
>   	/* do NOT wait this srcu when hwctx_lock is held */
>   	struct srcu_struct		hwctx_srcu;
> -	struct idr			hwctx_idr;
> +	struct xarray			hwctx_xa;
> +	u32				next_hwctxid;
>   	struct amdxdna_dev		*xdna;
>   	struct drm_file			*filp;
>   
> @@ -111,6 +114,9 @@ struct amdxdna_client {
>   	int				pasid;
>   };
>   
> +#define amdxdna_for_each_hwctx(client, hwctx_id, entry)		\
> +	xa_for_each(&(client)->hwctx_xa, hwctx_id, entry)
> +
>   /* Add device info below */
>   extern const struct amdxdna_dev_info dev_npu1_info;
>   extern const struct amdxdna_dev_info dev_npu2_info;

