Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5F8960506
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 11:00:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 095CE89D8D;
	Tue, 27 Aug 2024 09:00:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="nCG95Urz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2047.outbound.protection.outlook.com [40.107.100.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3B9310E2B6
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 09:00:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jwlzRj/syuMiUIedrspa/wy4315AXAEetiwiIllPpGxX3kJ+JKyIW8dh+kLbJV0VUQm4ck7vxTrSBcIrU+Y5plhgrlEQySUDNVx05izG5yIJSMs7dFErXahcE7YT36D+ifG9fVxsGCr/q4PISpWVXy/gAnojUfGy7eNER2LXwlgpXeJI+y8DVl0LB1wqx+kgoviW+fdF8IcRKKK9TCLNf96a/0TdywR6yapA8KUPnZP1FA/5tdukfS2y5cN6D2WyfEFYWm/74FxJHwOjxIqRXQlQFnivRcwO2G3VEliD5fHgq21N7tziOCEaCb6WgaSpGqNPy51gJoZRdtOSQV0ozA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MjdgceC0vYgnp7EUFKuGucQPn7F+NQjuBaz2+u5qhFw=;
 b=rpepR5mkp5RMWFBC958S+57WY9s7KhcCnoFZdwjUkCMQsHqYv0yMtDLkLbYyjM6Vmw8YuRYLIt+VtyxGYA7oqki//dtma1iqVUSoBlnLfRRyCtuOpBZs0HazcCbZgPuylKBODB/Ig9CsM2zdX+lohqOjI6d9txqZiiesBkqMpcdtoMLCA5nzXahmjLWVW1JlSvC4/Rz/q6gVhwUY5PTlWBNS6Re+1F5ge46NGqXu6xNvP8iN6QWROkMX6to7bBkwg2BDFkujXtBJZUdXfdyJi05SqWpiotBzC4+Mk2AZ88DUjU+NO02cAvkkO6zpZTJFuXqZ6xn8HsHhN8HcnwjnHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MjdgceC0vYgnp7EUFKuGucQPn7F+NQjuBaz2+u5qhFw=;
 b=nCG95UrzehUvd3jJXAsj1f8YMQPPDGO2tgrIcETFHF8tcwxacxz+yVuRwKPopTbV7ichA7kpbCTZozNmFhFaQ25CmghmKXi164nRMP7gtkj9CS4LT4RNDBXddWyW3+62knqVNWd0heqbTfdCZKnF0sED3aBiCexiqfQQSLa4NbM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB7017.namprd12.prod.outlook.com (2603:10b6:510:1b7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Tue, 27 Aug
 2024 09:00:38 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 09:00:38 +0000
Message-ID: <9ba7f944-52d1-4937-80c7-a03bc0c5b1d5@amd.com>
Date: Tue, 27 Aug 2024 11:00:32 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Fix UB pointer dereference
To: Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <pstanner@redhat.com>
Cc: Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20240827074521.12828-2-pstanner@redhat.com>
 <c443e90d-6907-4a02-bab4-c1943f021a8c@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <c443e90d-6907-4a02-bab4-c1943f021a8c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0145.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB7017:EE_
X-MS-Office365-Filtering-Correlation-Id: ab83b8bf-f446-45be-be16-08dcc676b8a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R0o4TTZkZlY2RmFmc0hwUnVPQTVaWi8ycDVGMFVXZC9UMWJ5T2VrOHJNbG1r?=
 =?utf-8?B?MFBSQ0RUeVJyS2tGTGxCeEVWakpJWWZuczc0endjb1ZhSmQ4WEdtRG9lbGc2?=
 =?utf-8?B?RHdselY3V3Fwdy9hSXhOWFFGS3NKYzY3cWg4bGpwc2ZBNERQR3N4L09iNVhu?=
 =?utf-8?B?cEYwVDg0di9ydU9rQzVMQW9xbGtWMGRvN0g3WXJFRklURUtVSE9vcHhJMXNk?=
 =?utf-8?B?bUJ6b3Q2c1B2akZPWHFBUkRxdnBFRHZYOXE1d2l6cENzNUpzdnRDdkRUV09H?=
 =?utf-8?B?Z3gwYk8weElseHQySXlGYmNvenBGM3VwQ3RSZVdIL3hCL3NPcFFUbHBaeGRJ?=
 =?utf-8?B?VFNEUGJZU3UrWkYybFJHZ1B2c0J1dWJCd3J4cW4wZmlnUzZCS3pzdUtDL1Vm?=
 =?utf-8?B?Z0M1OG5ZYUcxdCtXcmxXMDJYbzBsUDlkV0FPay93bEVBRDgwUmg1Q0orOFlB?=
 =?utf-8?B?em9UdiswU3JRMThvWldyRm1uc2E0VndOaEQyd2NuRkRYYjV4ZnEzU3k0eXRT?=
 =?utf-8?B?dmZVd3lKemViTE5NMk5zL2NTZ0hKQmRQN29CZ1h6YnV5RHZMUFg2ZVNqNkdJ?=
 =?utf-8?B?VlYzUE5FSmhqc3pCcUtudEc4UFFnUWJ4bVBxMTE3TzJ5dWdIOGp5RzY2Ylg5?=
 =?utf-8?B?RS9XVXNFZXhabnY4KytJaW05TGJhdlJndm9URUFBZnBVQVFWcS9SSTRMZTFm?=
 =?utf-8?B?QkFPM2crb1dzaEhaZHlpQy85ODI2azVJK25RUXFQbndxUHhHdkovTEZlOWdq?=
 =?utf-8?B?Y3pBSXNoMTVBc2pNYmVzelVta0lsekdVRWRBTDZsczhwdUtOaDdpc3BkODNP?=
 =?utf-8?B?c3N3dEZsTEtDY2Y4TG9LZExKRlJ1SWhrSnhBMGxYOHFhZTE0WFN2eVBVS0Rt?=
 =?utf-8?B?RGU0TEtZTGpVeVZOU01aUEVZY0JPZi9wZVVMU2J1R2NjeGRlWG9GOVdwTDBJ?=
 =?utf-8?B?ZEpvd3kvTjNreTIyaHd5d2dEb2w4ZXZLZ2NsZ1Q2ZGhHMXJmVGhxVTZXNzdH?=
 =?utf-8?B?RWY5ZVpIV3VibExTVkY1cmtTdXBQU2pSbXVsRmhna1dRcnVQR1VrSnVSVFBu?=
 =?utf-8?B?S2NJMU1nUTJwbkROei9kNjVlVFFoZm5xNmE2bEMvOHVsY2JFWXU0M242SVV6?=
 =?utf-8?B?WUYydGhBcWVtL01kbkl2Y1R5QVFZMGh0SllQUUVnUmluR0FvUTVYbDIwWlRB?=
 =?utf-8?B?M3ZBRVpNY1BJQmYxYkoyYU82a2cwR3h1Mk5STWVYYmxreUNGajE5MEM2TFRY?=
 =?utf-8?B?Q1g3SVhNYXFGV1RZSVoxMEdDMzR5Z01DZWgwYWNFOE95T1FmUHpRQmV0Ykxn?=
 =?utf-8?B?TXFzY0RaMTdVR1lqUUdmdUlxd0M1WFd6cjFmbDFLUDJKUExpaHUwSU5BeEFm?=
 =?utf-8?B?RytmMEFUOXkyMnRmYVdSK2FRcWQ2Nmw5bWN1MUgyK0VHK0gvKy9GZEVPRE02?=
 =?utf-8?B?ZThQM1BJTDl0VS80dk9VTzNrZyt5djM4L0ZtTFNjTE9YNXRTbHNtdWdocXgx?=
 =?utf-8?B?WFFWQ24zalp3eXFIVDVEa0lINzZOd1NjVmNucTh5c0theUlyc0oxSGZoWFpR?=
 =?utf-8?B?bGJvZ2JJQXNWNUxEOW93ZUVINHB4eXVQZ25LSFAyTGRWRjkwRng4Qk9sZmEv?=
 =?utf-8?B?UFcxREhNUkVEdmhxVWtUUi9UMWpQQW9XNlVjR2ZMaitVbHo0bk0yTlRtRE5u?=
 =?utf-8?B?dHpXY2Vkb2hUaGZ1OHlkbWNDTXR3d3h2ZkI0NjE4ZVcyamh6L0pSRGxXVG1y?=
 =?utf-8?B?cnlLTUFPdlhHTE1xcklaWFJrQ2JCK09VMjVwakpPU2JFOHRldUJIZXhid1Fz?=
 =?utf-8?Q?yGKY+ybzJsYJ0E66YyakYouT29tPfhAJAGsGY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVNtUEY4UUJBa2VnWlowZHNmc3ZHVDZvWGJFdy9uUS91N1hEZWJGWEtHcUNP?=
 =?utf-8?B?ZUorVzFkcld0aERramRSRGh3aERqWkR0M2NhRmN4dXJDNTM5WXhWV2FkYVBo?=
 =?utf-8?B?UVQxaGdqdlZmWGR1a0dDaFdJREpxR1lTejZuYkVheTBGemlra1l4dnJBdGY4?=
 =?utf-8?B?RUxWT2RyV0ZrQmFza29oSnRwaVkySnFta1hIU0gxYVN6OC85bkZQSnpDTW9N?=
 =?utf-8?B?STRiMUZrTm83Vy9GcCtlOVBsdDRUbVVXNGs5d0JqRVpxM1QzUHBIcGYreWY2?=
 =?utf-8?B?Ykk3NFFyWVBLMkVxcWdCM0pXZ3ZRK2ZaamFKNzlYdHR5QmwxY1ZMWUNiSDhX?=
 =?utf-8?B?d0NJdVhyQVU0UUZKSUJCTUNIeXNBZzVROUd5RXRJV3pMM2lMWkpFTzRMZllo?=
 =?utf-8?B?ODZrMzJoMTJVZHpHbW9aUVNwbEVjcUVPNU9iL25rbEh0ZlpnelFVNEV1R0VH?=
 =?utf-8?B?QzFXelFwSmI0enp1ZGdqR3Q4T3Z3UGVnZGhWTEoyQmdDSkdYS1dWeDg2M2kw?=
 =?utf-8?B?VFl3TXpGamNuUTRtS21BZ0VFVmhwK2NQRW90LzNsS2FMbndHcDBvT2hUSDA2?=
 =?utf-8?B?V0o2aDc5WXdGSnp0VFJaeERpaHkraE1CYllST3k0ZHQrL0JRVzl6aTJ2SGhD?=
 =?utf-8?B?ZjFrS0JBekFSUCtwQ011S3d6YkFnekFkTGkrcjhmRVhIdUdqM0xJN3hxQkh5?=
 =?utf-8?B?SGJ4UVNCTmU0dXRGMS84cnNyLzJVL2lDUnczcTRKSWd2bDF2SGdYeHNDRUh3?=
 =?utf-8?B?Y0FPTmpuV1VSckdXeUxMRFEybmZ0cTJXeU1GT2ROVG1LSk5zbVMrVnZUcGdL?=
 =?utf-8?B?WkdvVDhTVkQ5NjA4MVFqZmJhdHpIb0NRV3VBaGlDS0w0KzJpVVV0MlB6L2U0?=
 =?utf-8?B?SGF4Q2dLOC9sdlQvamRScGY2djNhSlBzMkRoUjI5MmdRNUlzLy9yTkdpVThJ?=
 =?utf-8?B?Smo2K3d1WDcyYWtWWHRNSGNWcmlqTFpISXVxL1k4T1FBc0ZjaWZUY1pWSkFH?=
 =?utf-8?B?Y3Q2SFF3akw2Z2ZwNVlwQ1FLTHBtR2hkSjVYVC9qUmVYb2pqTjZBaFh0ZENo?=
 =?utf-8?B?c1lreHlxemZXcXc5ZjM5NU1YNmUxQnF5ek5YcE90UDRxbXMrd3A0dXYwUFh4?=
 =?utf-8?B?WW1qUjBLWEZmRHd5Sm9jdStFUlpXb2U0dktUODg5K1c4TGU4TjVhWk16elZy?=
 =?utf-8?B?WE1mTXhMSGYwRStJenFRY1l2U2IyWXYwNTZqZEVKUDUyMHAreFMwY0g4c1E1?=
 =?utf-8?B?QjNTUW9oSkFlMFF5YUh5bWxUNG1laGcvaWNuVzFXVjdsSDU2Y20rL3RhUGtj?=
 =?utf-8?B?YmlmN0dtQkFKeG9qeWpjcjM1RU9kb2JpSjdCRFpCaFVlVDZCSzRKekZXK3F5?=
 =?utf-8?B?d0p3OVVjdXJKZkVKSVFsOEJXNHFXUGJJWE9VODRpSnNrVC9URXh5ckpTYkNN?=
 =?utf-8?B?Tkw4Wk82SHY4cVFHcVRERllaQTBicnVuc3VIanBieG1Jamt4bDNZRHc2QkI5?=
 =?utf-8?B?NHNQY0srVUwyaWY5M1RmSGNsV1FoRm5seTlhWWRiSFA2allUeEhNRkVVOHph?=
 =?utf-8?B?VVVSanlVSVE0YS82Sjc3QXVpaEVlLzNFazhwNnVFV2JNakJMa3Bkc1R5L3Z3?=
 =?utf-8?B?SzRhV1dMVTZ3MUZvczlFUzRmV3BsVTZyOTJGS2FWT3d1SmNMQnpMbkYrc21D?=
 =?utf-8?B?Z1Q3bEg5VHBpM0JFVHR5RkZoVCtQNkkwYXNZU1RoRlFoTVMySlk3U25EZDg3?=
 =?utf-8?B?eHNDNExlYk44TTBmVDhaNmZ0OXBlcVdtc0hxSVRUSDAwV2I5US85R0VmQmcw?=
 =?utf-8?B?TnZiTUNSM3U5RVY5eng3SHdiaTVmb3ZLMU1LblFUdndIWGFERXVwVHVXTGJj?=
 =?utf-8?B?Ym0wdFg1Ui9lRHgrUU9uRDBINXBiQVV2VVJFSzUwakZuSVRZeHhyUUt6VklL?=
 =?utf-8?B?eG1sYWNwVGlrRGZnRVg2SmZWWE05dXpxM25oNERuSGlaOFlLa1NJKzdZcnQ0?=
 =?utf-8?B?OFhXR1VEMSt1TW5pcWdDSFNaTVQwZHlKV3NVVk9KM3g1MmtuMlEvWVRaYXJr?=
 =?utf-8?B?U3M5NHpvcWFkb1A1L2hwdUtsN1h3UXdDdTRnQUlSenZBWHJzUjB0eUhMSDRy?=
 =?utf-8?Q?kc90=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab83b8bf-f446-45be-be16-08dcc676b8a6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 09:00:38.7071 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mY+XPnrx/fOWZyzSg+JoZzMQua3nLfss2KI6gp5/CfQaCVDKk1fBeCSBbP9QptiY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7017
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

Am 27.08.24 um 10:39 schrieb Danilo Krummrich:
> On 8/27/24 9:45 AM, Philipp Stanner wrote:
>> In drm_sched_job_init(), commit 56e449603f0a ("drm/sched: Convert the
>> GPU scheduler to variable number of run-queues") implemented a call to
>> drm_err(), which uses the job's scheduler pointer as a parameter.
>> job->sched, however, is not yet valid as it gets set by
>> drm_sched_job_arm(), which is always called after drm_sched_job_init().
>>
>> Since the scheduler code has no control over how the API-User has
>> allocated or set 'job', the pointer's dereference is undefined behavior.
>>
>> Fix the UB by replacing drm_err() with pr_err().
>>
>> Cc: <stable@vger.kernel.org>    # 6.7+
>> Fixes: 56e449603f0a ("drm/sched: Convert the GPU scheduler to 
>> variable number of run-queues")
>> Reported-by: Danilo Krummrich <dakr@redhat.com>
>> Closes: 
>> https://lore.kernel.org/lkml/20231108022716.15250-1-dakr@redhat.com/
>> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
>> ---
>>   drivers/gpu/drm/scheduler/sched_main.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c 
>> b/drivers/gpu/drm/scheduler/sched_main.c
>> index 7e90c9f95611..356c30fa24a8 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -797,7 +797,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
>>            * or worse--a blank screen--leave a trail in the
>>            * logs, so this can be debugged easier.
>>            */
>> -        drm_err(job->sched, "%s: entity has no rq!\n", __func__);
>> +        pr_err("*ERROR* %s: entity has no rq!\n", __func__);
>
> I don't think the "*ERROR*" string is necessary, it's pr_err() already.

Good point. I will remove that and also add a comment why drm_err won't 
work here before pushing it to drm-misc-fixes.

Thanks,
Christian.

>
> Otherwise,
>
> Acked-by: Danilo Krummrich <dakr@kernel.org>
>
>>           return -ENOENT;
>>       }

