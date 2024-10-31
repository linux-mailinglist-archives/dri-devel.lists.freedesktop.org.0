Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E00829B7D23
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 15:42:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6F5A10E8B0;
	Thu, 31 Oct 2024 14:42:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="S7mBTRpr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2043.outbound.protection.outlook.com [40.107.212.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67AAA10E8AF;
 Thu, 31 Oct 2024 14:42:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zOORrC3xb1kYJH5UxVj2AahHEIqk2oPp3LCgkcGOFhFO94U/amAI5MVEg8PwVtqcxgvy+c0KKq6C9KdS69AH0fRJO1eRBGNrcl07eCEmxEbKMtgFjNXz8w9w232tNbY6iKwnE8DWyylOvtPtQ9PLT8e7GvtxYIj4aEzvEMhJC7m7PP4UKKIvukCg6rDGju66TTQUcN0uQlqQaxi58IqYRALEUmwh8xVN9uGlKtTCd6wIsZ5PbaPfkJsqfnhmjj0B80RcLOISYdELd0SS+e+9dmk2+G7gVL4tTSOb3Ex6pOuv4do4p2Fme2uViFJqolSuN83rUAZfIedDlMcr8IFB6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=woKEP+nf1YVqK7n/VIQ4uurt0r/HG9gNsZ1eHAddlgw=;
 b=QdmW8X0c7HCMpjHlv6dx3K931+I4sW9Usq7u5G5omkcHLqauEOsx08n3m5KMOTBAJOZjAKBcyQL6td/OpVkQLyAyybOHuf6J04vhTsWuOk5mOwbr31MUc8dmVxSvCUmq0r7giPCgK+j0eJon7MhvRiONjI6MVIQ9ZXPfeqJay8SS3IjLb8zOpLtRPiZjbHQuh3RV0XWvZ2zu9+MaDYpGO6St44vNyp0il70aHkuLLJrk9jVMaPChaoKgHWwKkRxcFWuCZ4PdIs2x+rcV/yZfo0ffEjkAGAIoYSx9XCU31+JLPsGmfr66cR2Lb1RPojFNgdW/5Hn/QtExNLTiGKC/zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=woKEP+nf1YVqK7n/VIQ4uurt0r/HG9gNsZ1eHAddlgw=;
 b=S7mBTRprnKEOfWLp3nOUrmNsOH19OKffMSTXASov7+341IVPUdYtY5NZvLx1TClqOl+gzJd+LxkjfNI9Q7QDxh4MP59iB7oZ1S7HgZFJTYJkRODaeelMIaTbjyRVW8meujkbVYzmLelLY+OBbuxX1m1kKgNZQb2K9DKvX9EhkLE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS0PR12MB6464.namprd12.prod.outlook.com (2603:10b6:8:c4::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.32; Thu, 31 Oct 2024 14:42:00 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8114.015; Thu, 31 Oct 2024
 14:42:00 +0000
Message-ID: <32298ecd-7b7c-4e19-8481-f35249d6e076@amd.com>
Date: Thu, 31 Oct 2024 09:41:57 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] amdgpu: prevent NULL pointer dereference if ATIF is not
 supported
To: Antonio Quartulli <antonio@mandelbit.com>
Cc: amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241029233232.27692-1-antonio@mandelbit.com>
 <08add1ec-ceae-4f74-83b0-72d0df510950@amd.com>
 <77ba52f4-dcdc-4fdd-97b7-0163e54e8836@mandelbit.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <77ba52f4-dcdc-4fdd-97b7-0163e54e8836@mandelbit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR03CA0018.namprd03.prod.outlook.com
 (2603:10b6:806:20::23) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DS0PR12MB6464:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f5b8727-1aa9-4da1-cc5f-08dcf9ba2d4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Zm9XeXRhWlNRT1ROdUVTbndFUGlKY2xmczlGN1JZaWFXZk1LWTE2QU9rOUZq?=
 =?utf-8?B?T2I5NEJlNDJJOE0weFljcTQ0bGxwbThrZU9jdkxXOFRYdEd6YVNYbysrY2hz?=
 =?utf-8?B?MVY2c09md3ZJRTZSNGpHdjNkV0ZIZnY0ZU4xNWwrYXRKTlNzeXgzTWpJdkd1?=
 =?utf-8?B?S09taW9UbGg5Tm5UYTFOZkhxYS9FTFVkb0crcnZ5MU9yUjB3MXFwZ1Y1VjNa?=
 =?utf-8?B?d2dYd01YUUFqVHVSaTNBOU5FYkhzcWNQa3BHQVl3aU9VU1YyeXFrcWdnTm5u?=
 =?utf-8?B?R1ZIbUN3YmdmY2hlNjJYcnQzTi9oZnFTQjhBZVhvK1FLSTh2Q1FRVVZENWpP?=
 =?utf-8?B?OWwzcUpEN0w2emp4WjBKQ1JLa0NKZ21xOXZyeVpSaU14TkVTWmp4Y3BNUVRQ?=
 =?utf-8?B?YzBteTg3N1VvcmxkaGlVTmI0dnRIUGJ6Q3kwVEErNUE0MjFTWlZLM0lGcnI1?=
 =?utf-8?B?QjRpajFrelpna1E3QTh2NlgxeTdBNFRZZGtKQkNxSnB6MVBxVXBYNzRZS294?=
 =?utf-8?B?ajU1OHhYdEl0UnhPRVVwekIwcWRScnN0R2VEZ3F2NUowSU56RllEN3JzUHFE?=
 =?utf-8?B?UTd2akYyZnlYcnY2NzdjcGpaUkY2WXpJZE9jYmNCcUorczRscnpWT200V1dX?=
 =?utf-8?B?bk9WemVTdEhVT2RPT0U4aHN6UXBoNUVONlc5TnBjd3V4aHhYMzFiVTgwWjNW?=
 =?utf-8?B?T0VkenlNNHIyWHhhQkpmRGI3K0tkRjZrY1dnRldqTHZtaW5kUXU2OE5pb3U1?=
 =?utf-8?B?ejBENXB2TERIdlJQSDJwcnpSRXk2VFllaHJFTXdyT0VxL1RENDllMWxXN0dR?=
 =?utf-8?B?Tnh6TEtqSnk0V1FDTzJKK2E3a1hZZ0FEVFF4RkwwK2dyVXdDdzQ2dXFNTFNU?=
 =?utf-8?B?Qi9sREFPdWNMekhmYVYxRE9qUzFFa0M3VGdtS3FpSnFVZXU3RGxmNWNhZEFF?=
 =?utf-8?B?K2NLejRLTWd4SG9QUVZlODBGUmw5elNNcDZLOSt5T0EzQ0VoOGxTSEhrWHM5?=
 =?utf-8?B?bVBaN09IOWROdlpFcVhoQzdOSWVhbWRtbHh4MG9TbEg2cThpL0xmbG5qWm4w?=
 =?utf-8?B?aHNkUk54NVdEWmJzY3M0MzFtcHcxQWs1bFJKWndvQjhwZmJBLzAwY3EvVnIz?=
 =?utf-8?B?MkdtSDN2U3dlK2s3MWpDcmhtWUFBeFF3TWlZVTRjM2JOYlhKTlJ4OUlwSEZ2?=
 =?utf-8?B?dnRrbTZJSEQ4SmNlNVpQYlhqMEsySWRXcTI3d2drSTEyNk9RVlNPZDZaTkxi?=
 =?utf-8?B?ZFdGRzR2eVgrQkgzWW1lb3VrYU1IcUQwSGhiZWUwaDhFUEpmQnZ6VEIrUm03?=
 =?utf-8?B?Tk85UnM5aFQxY2JQVEpoNk9QdmZBZ1RMNjQ2OThwbDl1dndvamRuajh5dUlE?=
 =?utf-8?B?MWRXQU5JZ2ZvT1lqNmhsMzNOa2E0VzIyeDRhUmdTdS81Smh6N2FqT29pNktZ?=
 =?utf-8?B?bDhRYkFsb29ueXhqOEt6eVhWL25vZW9EV1g1UjlMbS9MVjZvNGZtejF1bjhQ?=
 =?utf-8?B?NXJHVjNZcHBZODI0UmdJam1HU1JTeTE2dEZRTVBDV2UrRFN2N2svcnB4dUxY?=
 =?utf-8?B?Tm5yTDJTb05RVzhCTXIxaE05S0FsQzg0SWJRUXlITU1HQ2hlUitxYUpvNFBV?=
 =?utf-8?B?Lzd4RUJXYUZFWmdDZllSdThWcHpULzlOT2xIQWdWb0lUUWI1b1dOR2NqNHdh?=
 =?utf-8?B?NFpVNnowS2hVaXEzd01nSWFOekJiSGd0REdqL05WQWhvYjBYNVJieEgvS25r?=
 =?utf-8?Q?4HHpoBq3RpDut7yYsw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUllR0g5M0VIWG9reDdoMTkzU25IYjhsZWMyOWZsanN2RW9oRlNwQ3VNcFNi?=
 =?utf-8?B?eGx2RDRCOHl5SzVKUE56OEVMRjN2TElLMFVDUEJGZGppZmJ2bHBCYTVudm84?=
 =?utf-8?B?ZDdmUlRCUFF1YUZHSlZmMUd4QzdGaUFvSTRNMzZuVWtBQ2xTUnpKckNKckFZ?=
 =?utf-8?B?Uys5OTgwNjdsb0RoNFNYS3c4TXZlREdxQXROMXRBRUx1YkFWTXJ6NE5hWGZs?=
 =?utf-8?B?R0pIL1JlQVFzemdIbmtPWGJQUVNIdU42NStBOWU3akp3VHFndVhPNTRVRE1q?=
 =?utf-8?B?MUdrWUhYY01FNWx4ZFdjbXRvTUtHN2JXYW9EbE1NUE9ZVkxtOHJnallydnJH?=
 =?utf-8?B?U1MxWDdaSUJFNjNXU1R5TzQ1SW9wWXoyeUNYenk3RVRIT0o0Q21ZU2VQalUz?=
 =?utf-8?B?OHdNcWhUS1hQZDRCSUNwMmdBOG5DWkRQR0FqVVdhYnZQb2xWSGlubG5XcEpG?=
 =?utf-8?B?VmJ1OEE4dSt5QlVlZEg4UlVtS0ZWbXAycHZvQWdlOGdia21ORHlRbU5ubzFJ?=
 =?utf-8?B?anFKZ1dyZjh2dVg2OWNoUG1HNG9BdXFlNExZZGtlS3F1TFczNVNDNGRSRkZp?=
 =?utf-8?B?M0xuMTQ0TVB4dXR1UDdiS1BPRUcxUUJKQkhYbzhVckdkNndPSTZjTjA2cVV6?=
 =?utf-8?B?cFZMQWJ2OFpHeGFUQWNIbHhPZDlLdHlEM3gzNnF3MTJkakVPYlhVeUZTVXQx?=
 =?utf-8?B?Ymp0SWJVMlUrUE5zeTUydm5ldGJGbE9uMWozamU3UlU0L1Nmay9Ub3ptb0Np?=
 =?utf-8?B?Qm83akswaEZ4bHBKeE1DMmlCY2Z2aGEyNisyVFZFblZOdW9EekhiLzJKUUZ4?=
 =?utf-8?B?RHRYZVQ2dnkyd0FITUowSklmTEI3aXhERHRGcUtJOEdmZ0U5a2E0YVF4R1h6?=
 =?utf-8?B?QlBJNGZNODRIb244VHVzQ2dRY21DZEZESWhJUldpd0E1RVhRVXhQZlpZMTRy?=
 =?utf-8?B?b1BEbklhNU9wZGR3VmppWklxS1hxeVlZS1dWbFBEZ296K3VCN2FNV20zM0dJ?=
 =?utf-8?B?TmR0TXZuQ2dCZms0WWdhVUd0c0xvN3pUQmlrbVhxYWY4OGFLRW05SjRDRGZL?=
 =?utf-8?B?Z0MrSkRsNWprczc2MzFqU2tmUVlnQnV3ejJVRCthT2FvNXg1NXNDVjB3cGlu?=
 =?utf-8?B?Uy9wYllIS0kyaUx6V21XeVhpWFVaWjFYWVVBZ25MeEpHNnVBbTd4YUVGNWQ3?=
 =?utf-8?B?bTR5QVpRTnN2QWZWU2kwUXQ2SDZiSDBPbWJZanVSb0lRTFZ6eE55TCsrRXpV?=
 =?utf-8?B?VlZKZjBVWDlTWW9EY0xPU1gyblQ4dVdwRHNVMVpBcGlyQlU4VW1LcFd5ZElV?=
 =?utf-8?B?b2ZvMEVMSkNvd05HelMwTW96S0o1RzJ4R1NyZnc0T0hrTUF1RDJWL0JGZ1FE?=
 =?utf-8?B?bDB1ZmRGUGVCV3p5T1lZS0YxY28xWTZoLzYxbHhib2hIMEhNSVVhK0o1RzQy?=
 =?utf-8?B?b0F6WXBiQUtMM2JiQ0tjeTlHM00yYTlPWDFiVGFwbmI0R3F6UElXaytwalBK?=
 =?utf-8?B?QTNYdjhPU1lrSmxFRjY0MHpQWXREb3VwcS9qa0VrNWI0OFRHRW40NUludTRU?=
 =?utf-8?B?dzNwSExHM2t0alAyK1dJVkZDeEFFbnpRRGxUNHI4N1dVL1RQaG5HWFljTjlT?=
 =?utf-8?B?QmswTE1mOGpuZjRIajZiRi9mRzk4alN2dFRTWndncFhGUFoyMzRuU3k3WnVW?=
 =?utf-8?B?Vm1RMTVCT2F3cEY3YmpTN21qTG9WbEJqUlpLa3V4dTgrSWN1Z3dZbTQrSmhq?=
 =?utf-8?B?WERtdE4rOXJpUkhzTFNvMUE5OWpvT1lJQnJ3SHBkZUJTTUJNSEtoUTd3ZURT?=
 =?utf-8?B?a2poZnVkTG5ZRFZFWTF5S1B1ZFlNWit2ZDZGa1hmd0J2YzEyM2JMVXF3MTNo?=
 =?utf-8?B?UFk0enoxZzdCaFBjendUSUljZm1yM2xyQno3UFh1RWEvaXVvTjJlS3pHQVJl?=
 =?utf-8?B?VVl3enN4U0FaR3g3cGZlcENIZ2plYXhKSElPNGNuckVFeWt4bURqSmJpRzF3?=
 =?utf-8?B?a0IyWjFHOGw0d2pLTzVLdVdpbHBzLzRhYTdpVFk0bUsyWUpoNVhxaHhDSm1U?=
 =?utf-8?B?NWZiTEgwYkhadDhXS1UvRHJnTVJ6LzBuTE03cGpGaEExb2RvQk1QZVdINk41?=
 =?utf-8?Q?411X6zP8FLdiN3g69ODMJjgWj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f5b8727-1aa9-4da1-cc5f-08dcf9ba2d4e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 14:42:00.0896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dbsq9x4hgjnkT0z+aB53rMbDQPbm1ttqzEOKvF0pPcsj1QSO7CyGf19KCbPVlEN4OvcLA4+26I0dy/pPoF6zTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6464
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

On 10/30/2024 16:06, Antonio Quartulli wrote:
> Hi Mario,
> 
> On 30/10/2024 02:41, Mario Limonciello wrote:
>> On 10/29/2024 18:32, Antonio Quartulli wrote:
>>> acpi_evaluate_object() may return AE_NOT_FOUND (failure), which
>>> would result in dereferencing buffer.pointer (obj) while being NULL.
>>>
>>> Bail out also when status is AE_NOT_FOUND with a proper error message.
>>>
>>> This fixes 1 FORWARD_NULL issue reported by Coverity
>>> Report: CID 1600951:  Null pointer dereferences  (FORWARD_NULL)
>>>
>>> Signed-off-by: Antonio Quartulli <antonio@mandelbit.com>
>>
>> I'm not really sure how realistic this failure is.  Can you share the 
>> full call trace that Coverity identified?
> 
> I just checked Coverity Scan and it only says:
> 
>      5. Condition status, taking true branch.
>      6. Condition status != 5U /* (acpi_status)(5 | 0) */, taking false 
> branch.
> 
> The above points are related to:
> 
>      if (ACPI_FAILURE(status) && status != AE_NOT_FOUND)
> 
> It doesn't show how acpi_evaluate_object() is expected to return 
> AE_NOT_FOUND.
> 
> This said, if you think this case is unrealistic, why do you check for 
> "status != AE_NOT_FOUND" at all?
> 
> At this point maybe it would make more sense to simply drop this check 
> and always bail out with the current error message.
> 
> Basically a patch with the following only:
> 
> -       /* Fail if calling the method fails and ATIF is supported */
> -       if (ACPI_FAILURE(status) && status != AE_NOT_FOUND) {
> +       /* Fail if calling the method fails */
> +       if (ACPI_FAILURE(status)) {
> 
> This way we don't make a fuzz for a possibly unrealistic case, while 
> still protecting against bugs and null-dereferences.

Yeah I think that's a good idea.  Can you respin it as a v2?

> 
> 
> Regards,
> 
>>
>> amdgpu_atif_pci_probe_handle() will check whether the handle is 
>> available in the first place.  We'll never this this far if that failed.
>>
>> Because of that I don't follow how this could return AE_NOT_FOUND.
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c | 11 +++++++----
>>>   1 file changed, 7 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/ 
>>> drm/amd/amdgpu/amdgpu_acpi.c
>>> index cce85389427f..f10c3261a4ab 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
>>> @@ -172,10 +172,13 @@ static union acpi_object 
>>> *amdgpu_atif_call(struct amdgpu_atif *atif,
>>>                         &buffer);
>>>       obj = (union acpi_object *)buffer.pointer;
>>> -    /* Fail if calling the method fails and ATIF is supported */
>>> -    if (ACPI_FAILURE(status) && status != AE_NOT_FOUND) {
>>> -        DRM_DEBUG_DRIVER("failed to evaluate ATIF got %s\n",
>>> -                 acpi_format_exception(status));
>>> +    /* Fail if calling the method fails */
>>> +    if (ACPI_FAILURE(status)) {
>>> +        if (status != AE_NOT_FOUND)
>>> +            DRM_DEBUG_DRIVER("failed to evaluate ATIF got %s\n",
>>> +                     acpi_format_exception(status));
>>> +        else
>>> +            DRM_DEBUG_DRIVER("ATIF not supported\n");
>>>           kfree(obj);
>>>           return NULL;
>>>       }
>>
> 

