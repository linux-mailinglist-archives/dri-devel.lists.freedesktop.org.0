Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DC3AE9ECA
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 15:31:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 964E910E855;
	Thu, 26 Jun 2025 13:31:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="U4t5WAmd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2049.outbound.protection.outlook.com [40.107.223.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 872FF10E2C7;
 Thu, 26 Jun 2025 13:31:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BY0wJ8bJWsas77EDcYVgKhje6rEvcVCXQ3hJ7E75vEE0vKAIWGCN2qXvndS+qEH2cR+lAJrIosvI+tXU3tD0F+qIX19ESXpzwAbzQecCk1lb3Jl8WbMpnWNZ0+o9TBpUUgP/p1rUGK68Wow6NnqV92A6nAgRtgEGEdYCBHVq72tjzJnfWh4dMYdg49kgnSsXC1OaObHv3aiY7EQ3XnKXt8QnnCMWwU1EoV1TQkTMzdcOQobnXN3WcsvNHfBCGaWWnUFg8UZ1qRBuk4hzlDDYduOKvtms65KXT8UuKR9lrbcgiphDHhcSyn2obeFwZ8NfX7jYnrXJJdO0+7wjcnH6Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SkdmJLY6kKKvl0DisV9R8gzCy2uAx6MrIOVn2RmUGto=;
 b=bStfpz17t9ZSTWpRBbPlumDNIyTnX0Uv8gD9uOTWoYNbcQ4rn8lX5ifbNUofBQEqX92DGh8bSavJHmhU4XWAhS1P3Fexc6RjeTp8snLGN+UWWphcQhNJffH/N8EVvhOaHvOnECjeGDpkTMQ4NJRVbutnSD/jDNgq90wZpF693XO0Z2iiUczFtGtGZjeonmlPAnaBtnn4adn21EkQlRV3oWSFVtw1U/naQt8YU+cYV0qIZYvK0E0UPFZtP2pyWkdZmy2Ty+mcVPg/+opDMvVRCLK5jmZxB2AE0/C+m46HYxqGVbEIP5bNy460Bog8FzVN/z3jQfkkwq7No1DLwc30OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SkdmJLY6kKKvl0DisV9R8gzCy2uAx6MrIOVn2RmUGto=;
 b=U4t5WAmdC2uKqoJ+0i6LWFD80d9iQOtOzcrwvHjTQ+eqEcWBuZRGR7TmK4nRRAkWSBonhw6Lems+Y8GNekSSHq8s9nNAPopxhiEWKArk1hWaliCYS1/gLx+jFeoU2qJ5HkzPe6yZWnk5plazIlFQzakBTWe/2Zqo5xPCWjJ4EwA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV2PR12MB5776.namprd12.prod.outlook.com (2603:10b6:408:178::10)
 by IA0PPFAF4999BF6.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::be0) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Thu, 26 Jun
 2025 13:30:58 +0000
Received: from LV2PR12MB5776.namprd12.prod.outlook.com
 ([fe80::6628:31a5:4bbe:ffec]) by LV2PR12MB5776.namprd12.prod.outlook.com
 ([fe80::6628:31a5:4bbe:ffec%5]) with mapi id 15.20.8857.019; Thu, 26 Jun 2025
 13:30:58 +0000
Message-ID: <8c9e6f28-7f2d-4b0a-b4a7-6fd1d3aae2a2@amd.com>
Date: Thu, 26 Jun 2025 19:00:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] drm: move the debugfs accel driver code to drm
 layer
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, simona@ffwll.ch, tzimmermann@suse.de,
 tursulin@ursulin.net, phasta@kernel.org, dakr@kernel.org
References: <20250624113454.2322935-1-sunil.khatri@amd.com>
 <dd2e96de-d5da-4b12-b65c-13152f07393b@amd.com>
Content-Language: en-US
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <dd2e96de-d5da-4b12-b65c-13152f07393b@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0233.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::12) To LV2PR12MB5776.namprd12.prod.outlook.com
 (2603:10b6:408:178::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5776:EE_|IA0PPFAF4999BF6:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ee63f6b-1b5e-4ce4-59ea-08ddb4b5af49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MlNoTE5nYjhhWHF2M1JYTkVLODl5MUlINlNmVklBNm5rYXJlQWFxTVlmenM1?=
 =?utf-8?B?UUZ0QmhHOHpmMS9kU3V0WTdHTTdubWtnWW53cVRpZnZrOE42NUZJWXkvY3hJ?=
 =?utf-8?B?OG11bUdzOWYrazJGUHVoZE9nUkxiL0ZnNXJORWFwV3JlNGltcVV4WjlyODFM?=
 =?utf-8?B?K3l1dTFzM3JWMWxDZHpndUdHOU9COVdzTDZNNXZLeEZaVVMxempvbHlxbUJz?=
 =?utf-8?B?eWl5WHA3alBiM21ENnQ1bkdKaStFYlZ6YndMUUlaM2pJN3ZyL0RiYXhseVgv?=
 =?utf-8?B?TE8ySWFFVmZXeUtCYjVDOTBlamx4RzNaLzc3UjRRa0N1Tk9la3pXanNlVGc2?=
 =?utf-8?B?TzVQYkwvWVNYeitpd1oyR2ttTW1oWVlQSzZFeGhNV0hmUUtQeUZhVFdMT1BV?=
 =?utf-8?B?cXRWTVZkL3Y3dkxtR3NTRDU1N3djZjRZQ3U3WUN4VHBSUGpUbTlIRkxFSHdB?=
 =?utf-8?B?ZmhCQWpqRVU3V0xXblR4SjhBNWo3UDlTWXZHUktPK0o0K1FpT3RzVmNaNFRn?=
 =?utf-8?B?SkZsRHlNeGwxL29RWEVrbm5EWUhhd1JSQndSNXltNXRoRXlxRlYvbWkyL1li?=
 =?utf-8?B?MDlERE9RQVBRRituMjJjUEo2OTRhWlpWVG9lenY3Q1dVNEQweUpiQi9jR2pa?=
 =?utf-8?B?SnV0b3FkZUpZcDJscDBUSTlaaXBsUFRTUUVCakptaURPYUhIS1NuY2x5dDdD?=
 =?utf-8?B?cHZNcVBlemNKdmljaFpuZXB0YkdnOFowQ2xyUmduc0VRS3o4UGEzWEtuZVdN?=
 =?utf-8?B?YjNhVWwvUmFEQXl4WnNEa1F5NDNjZ3FIWE9BQnFMOGMxUUlKanVWUnR3TUxY?=
 =?utf-8?B?SjlwdXUzK21tMGl3WUEzcE5WWWVPdCs4L2IzVDFVeThET2EwQldNQ0xnZjlT?=
 =?utf-8?B?TGxNejA1RWlXb1R1WWJyc1Y0WHc5YkxjSitnN3Z2d1hsdmxINDRRcVQ5UHVk?=
 =?utf-8?B?eFJ3R21pRzJneE5SWjNlUEZJcURCY3MzekNkWTZRajhWcGRBZDgzaWVCWitq?=
 =?utf-8?B?SzNtMFdIc0tsWjBFWTlHMmpEMzIzTHUrMGZzWStIalN1V0lkQUtMY3BzQ2cx?=
 =?utf-8?B?Z1R0dW5TOVN5TDhkMDUwTUt6OHcydS9La09Odnp0TCtWODVxQXBZWlg4Z1NY?=
 =?utf-8?B?SVR3QVVTd1p6UUZ5OWx1Sk1HQ3RxVDNseXVBK0crekJSaENLNGNpeVVydG5R?=
 =?utf-8?B?MUVrdDBqZ0lZdnVsRGx6anpqcUVZOFVOK1lUdWNoZzNweEdPSUtsamNiUEdH?=
 =?utf-8?B?bFJucWxTejd2S3pxOEJkN3gwTDVzRWJIemxpMk40TUhiZDhhTHZKR1JTUENB?=
 =?utf-8?B?dTUveUJhSlhNd1NuOEdHcGJlcnRseldXUi9Tcy9BZ0huTzlnS3RsWEJ4Q2w2?=
 =?utf-8?B?MVJOSG82OVRCZ0VaenF3TkVCc25EajBTdmJhemxHYU9FTEZNNWM4TThlVWp4?=
 =?utf-8?B?Wm1MR3J4ZVYrTUlFVkZSamhjaTJGRCtLQWF6SVpRUkNYZml2YnBCbTlyVG8r?=
 =?utf-8?B?Wkx3ZXk3d0Ztc0ljM2lwa0dWeHlsWG5ONHpWeWhTYm5BSUIzZ1FOSjFNTW15?=
 =?utf-8?B?N1gyOGFrZU92eHhPNndzT1lmdklFSXZVSEw5cnpUd3JQZVhhaFBLemVqbU15?=
 =?utf-8?B?WmtseVQ3Y0tCckJSS0o2ODNIRjE4OUNkYTJ2bTdWNUFtcnRlWTMzWk5lZXBq?=
 =?utf-8?B?R29JTGR5MWsrc2hPSUx5QTIwcGJ5M3lCYkR5di9aQktBbTV4cGVCTWRUWEZZ?=
 =?utf-8?B?a1huVUxFM2ZQUExhVUxaTWNkZTZya2xZenlKQlRiQ0djS1hPcGFmL0xqb0RP?=
 =?utf-8?B?ZTFTOVF5aTgyNmxpM3lIb2FXQ21Rb20rR1RlQndqOHVUYU9Fa0FZNTJuYit4?=
 =?utf-8?B?WmpDaWVEWThPbFZIa05JeXM3ZjV0YWlKNXpWVEtMUTVjVENOQzJZU3NLUWg2?=
 =?utf-8?Q?c3SmsyqW6z4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5776.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0F0ekl4UVdLZHlkRWVxWWg3MUdXVXB6STdOYnVUTDlBN0hXNkdEMnhEd2JF?=
 =?utf-8?B?Vml0dWcrVmR2UkFodnFiaDVTYmR5UmVTaW1CcEVMUlRmL2IwUExKTTBQa1RE?=
 =?utf-8?B?Rm9TaDhRSnV4enExNTFmb3hFK05uS08wVVJsbjBnakMzbkFwMDRoZWpnVUlM?=
 =?utf-8?B?MWVySUY4bjFqa1NwMWx6QUZUYjJIOE9ub1pSQStCUVRNTnV1M0dudVorUCtV?=
 =?utf-8?B?bVdNY3l2OU5GQ0lBVFpXWStqSXRlWHo5TmVYUjc5eGZVYnFUV25udkllcHZm?=
 =?utf-8?B?RE53TG1SblZPbWZGaXYxQWQ1WG1MTDBKdm5COWgzT3lXNjZnNGU0RkFuck1p?=
 =?utf-8?B?bU5qdDNrQkdtUk5tN016THhNRUY5YW1CYnA1ZnpxeDZwNzcxR1lFWFNncUZ5?=
 =?utf-8?B?VGREVE5RTWhTWDRMRkVPRzBwSi9kQkQ3bEI1Q2pONGQyQ3lYSG5UTUhQdTJB?=
 =?utf-8?B?QnlFVVpmVzJld3FrclFMVWY4RXJyZzdVbmZIa0Y4N0Q5VUFxK1cvMkRacjAv?=
 =?utf-8?B?b3A0WE1rS0oyTXl1ZzFHK2FiOWkzZVJmQTc3dVJDZEwwNWJ2WUdpR3pKbEF6?=
 =?utf-8?B?cGVMNzE3MXFHdG4wUzB3L1RTamtQY0E3NGozZ2xnMDBTaTFUVWRjZUFGQ3Bp?=
 =?utf-8?B?NEs2bjlkendPcW5QR1Bzc2ZsdXNDVE9BME1GVWxxb0hIcGxoMGEyL0YwdndV?=
 =?utf-8?B?cUhyWmN4M1M5b2pDelVqUlhXTDhvZTE0YUZMK3dpRjFNRjlHeW5rNWNUeHdi?=
 =?utf-8?B?NjVtZklaOVN0OVN1c0h2ekwzWUZuaGMrSldqYUNUeHB3dnNSNVpGRG9hUUI1?=
 =?utf-8?B?T1ZWa3E2SnJWQThiOC9HMTcxOWYxZGNSSUpMUXRRRXUxQnBMandkMVVUYmlE?=
 =?utf-8?B?SGxaQXlXRjhGUHliZ296VHBQMldVV3FIRGgvdVZFTXFGSHZXcEdaQU1sUU9B?=
 =?utf-8?B?bE5semdvWHRlV1B6ekNFajJvU0FWSHZMWXdpWS93MFgvSVVkZlhPV0NPS1U2?=
 =?utf-8?B?OGlaVEE0bUxCa1FVN2RUSmhyeGJjK0MxcDlQcnZTZ1MvZElDTFp6Y0hVUUx0?=
 =?utf-8?B?Q2pxckRTUVo2SUlIT3l3bzFKaktqQUNXZFY4dFRxR0E3RDUweUpZOXlPbll0?=
 =?utf-8?B?SnlNdnNvY213V2dpcGFLWlBtT3RUQWtWUW5wRVpRUnF5VVdYdGErWENLRWs0?=
 =?utf-8?B?Sk1nVUdsd0hQZkJyL29HTVVjeUprV0dCZ0YraTg3VklHWDl2WHo1RFVlQS8y?=
 =?utf-8?B?TUdVaTZWM3lDRllxYUhITWVHajBFME5Gdm92cFJKTG9NZ0ljVUkwd1ZTdlBP?=
 =?utf-8?B?cW5BcVUyTjN0cEpWbTNhVkU5djN4Ymo1S0Yza3g1MHcyazltYldZR3V1MDlu?=
 =?utf-8?B?c2dBVmh6ZU5CQjFBODQyL2E5c2QzczNZV2hMU1o3U0F0eWwzelBEeklRS2di?=
 =?utf-8?B?V0xBaXJTcWRUR1ZmdW1jcExySE5TekIyQ2J2MTVPc3NSU3hvRm5TK0tHeFdz?=
 =?utf-8?B?QTU5UC9NK0YxTEtqcW5YdjkvbURWUXduMUdMZk5jZjBPNWJWTE9EaG9oaGIr?=
 =?utf-8?B?clB0WFV5ZHBxdi9ibEpUSTEyejE3VzZnZmtIc1lXOTYzeGdNSndaYkpNbzUr?=
 =?utf-8?B?Q0V3N2MydTRtQUdubVphTEszajhHL1gvcCtzZE9FNmtJN1BBM2s4VUJiR0ll?=
 =?utf-8?B?eTA2KzlDT2dsdEtDTWtlbjJpWHZ6THdEdnhLTytBTDBCZnBvWmRRdzF4cjFZ?=
 =?utf-8?B?T2dZRWk5VW9FdU00SEg4U3J4UTh4Y3dSdEQ0K1hDM2NCK25sa2dlMmRob2J4?=
 =?utf-8?B?TllUL09YYmVqWFNyKzZvUkZUckJVOWY4dy9MaVAzTUhzOGN5aFROWno0SnhH?=
 =?utf-8?B?a3JDM2xTaHZxYzlkTWh2UDRiUXIyTXY5Uk9iM2d5WUxlQXNsQ0F4YkdvUHlB?=
 =?utf-8?B?NForeDRmYk1ZWkRFRnFLYXk3enZ2djZVczdRczBjcFBsYmZKb3JDYTB0Y00y?=
 =?utf-8?B?SjJvTkg4NlZrUlZmL0YvWmRaeVVxeXNjam9pWlJRNDdvUVY3M1Nmby9NMlp1?=
 =?utf-8?B?L1k3MVR2OHJpZm9mUDhZdW5TbFFrNFBkNnhHYnpzNmJBRlhBWUlrMDc5YjBM?=
 =?utf-8?Q?1kt3pCCrqO5nSVt08PGJgAZ1N?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ee63f6b-1b5e-4ce4-59ea-08ddb4b5af49
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5776.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 13:30:58.2342 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sGrjOukL0uiEYqOfe6/unk6e98M+DoiqN2MB0p1um4K5tii5BS5CSTNm4IXBpBvl2m45AmICF5d319UrynfMpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFAF4999BF6
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


On 6/26/2025 5:26 PM, Christian König wrote:
> On 24.06.25 13:34, Sunil Khatri wrote:
>> move the debugfs accel driver code to the drm layer.
>> This is first inline change to move the debugfs
>> related changes for drm to drm_debugfs.c
> Maybe write something like this:

Noted

Regards
Sunil

>
> "And intermediate step to move all debugfs related handling into drm_debugfs.c".
>
> Apart from that looks good to me.
>
> Regards,
> Christian.
>
>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>> ---
>>   drivers/accel/drm_accel.c | 16 ----------------
>>   drivers/gpu/drm/drm_drv.c |  6 +++++-
>>   include/drm/drm_accel.h   |  5 -----
>>   3 files changed, 5 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/accel/drm_accel.c b/drivers/accel/drm_accel.c
>> index aa826033b0ce..ca3357acd127 100644
>> --- a/drivers/accel/drm_accel.c
>> +++ b/drivers/accel/drm_accel.c
>> @@ -20,8 +20,6 @@
>>   
>>   DEFINE_XARRAY_ALLOC(accel_minors_xa);
>>   
>> -static struct dentry *accel_debugfs_root;
>> -
>>   static const struct device_type accel_sysfs_device_minor = {
>>   	.name = "accel_minor"
>>   };
>> @@ -73,17 +71,6 @@ static const struct drm_info_list accel_debugfs_list[] = {
>>   };
>>   #define ACCEL_DEBUGFS_ENTRIES ARRAY_SIZE(accel_debugfs_list)
>>   
>> -/**
>> - * accel_debugfs_init() - Initialize debugfs for device
>> - * @dev: Pointer to the device instance.
>> - *
>> - * This function creates a root directory for the device in debugfs.
>> - */
>> -void accel_debugfs_init(struct drm_device *dev)
>> -{
>> -	drm_debugfs_dev_init(dev, accel_debugfs_root);
>> -}
>> -
>>   /**
>>    * accel_debugfs_register() - Register debugfs for device
>>    * @dev: Pointer to the device instance.
>> @@ -194,7 +181,6 @@ static const struct file_operations accel_stub_fops = {
>>   void accel_core_exit(void)
>>   {
>>   	unregister_chrdev(ACCEL_MAJOR, "accel");
>> -	debugfs_remove(accel_debugfs_root);
>>   	accel_sysfs_destroy();
>>   	WARN_ON(!xa_empty(&accel_minors_xa));
>>   }
>> @@ -209,8 +195,6 @@ int __init accel_core_init(void)
>>   		goto error;
>>   	}
>>   
>> -	accel_debugfs_root = debugfs_create_dir("accel", NULL);
>> -
>>   	ret = register_chrdev(ACCEL_MAJOR, "accel", &accel_stub_fops);
>>   	if (ret < 0)
>>   		DRM_ERROR("Cannot register ACCEL major: %d\n", ret);
>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>> index 17fc5dc708f4..5d57b622f9aa 100644
>> --- a/drivers/gpu/drm/drm_drv.c
>> +++ b/drivers/gpu/drm/drm_drv.c
>> @@ -70,6 +70,7 @@ DEFINE_XARRAY_ALLOC(drm_minors_xa);
>>   static bool drm_core_init_complete;
>>   
>>   static struct dentry *drm_debugfs_root;
>> +static struct dentry *accel_debugfs_root;
>>   
>>   DEFINE_STATIC_SRCU(drm_unplug_srcu);
>>   
>> @@ -752,7 +753,7 @@ static int drm_dev_init(struct drm_device *dev,
>>   	}
>>   
>>   	if (drm_core_check_feature(dev, DRIVER_COMPUTE_ACCEL))
>> -		accel_debugfs_init(dev);
>> +		drm_debugfs_dev_init(dev, accel_debugfs_root);
>>   	else
>>   		drm_debugfs_dev_init(dev, drm_debugfs_root);
>>   
>> @@ -1166,6 +1167,7 @@ static void drm_core_exit(void)
>>   {
>>   	drm_privacy_screen_lookup_exit();
>>   	drm_panic_exit();
>> +	debugfs_remove(accel_debugfs_root);
>>   	accel_core_exit();
>>   	unregister_chrdev(DRM_MAJOR, "drm");
>>   	debugfs_remove(drm_debugfs_root);
>> @@ -1193,6 +1195,8 @@ static int __init drm_core_init(void)
>>   	if (ret < 0)
>>   		goto error;
>>   
>> +	accel_debugfs_root = debugfs_create_dir("accel", NULL);
>> +
>>   	ret = accel_core_init();
>>   	if (ret < 0)
>>   		goto error;
>> diff --git a/include/drm/drm_accel.h b/include/drm/drm_accel.h
>> index 038ccb02f9a3..20a665ec6f16 100644
>> --- a/include/drm/drm_accel.h
>> +++ b/include/drm/drm_accel.h
>> @@ -58,7 +58,6 @@ void accel_core_exit(void);
>>   int accel_core_init(void);
>>   void accel_set_device_instance_params(struct device *kdev, int index);
>>   int accel_open(struct inode *inode, struct file *filp);
>> -void accel_debugfs_init(struct drm_device *dev);
>>   void accel_debugfs_register(struct drm_device *dev);
>>   
>>   #else
>> @@ -77,10 +76,6 @@ static inline void accel_set_device_instance_params(struct device *kdev, int ind
>>   {
>>   }
>>   
>> -static inline void accel_debugfs_init(struct drm_device *dev)
>> -{
>> -}
>> -
>>   static inline void accel_debugfs_register(struct drm_device *dev)
>>   {
>>   }
