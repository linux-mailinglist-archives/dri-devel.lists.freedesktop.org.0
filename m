Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D1F968581
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 12:59:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAE6E10E28B;
	Mon,  2 Sep 2024 10:59:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="R9G8an07";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2073.outbound.protection.outlook.com [40.107.95.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB40110E28B
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 10:59:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GSkhylo6I6EbISzos6ceGEStgHnhGspBmb/twnOrqZ2rB2Rc2VarmN9Go8jAQj0cNM12FeWteMbo/U5HGMt+Ko305gYxhXjObzKb9C7vcQAWidwPXgxEcCXrlNVAtT5n5aghKEA6vtozYuKphFWxuJtvXwKyaeKrn/7CvWLNhoaXb6+v6XAxEu/oPvjmVcT32DXL9q50DguOrlPnA8H7iSmMRww2bkvbnP9lkQhUro3qKWrbJlT6cCKiiEA3Zm2hpX61W1aKoshjYEygWO+EFrhKuaTyv2By+PICowCscQE7iyn/YVUZg/s745Ns98b7CXILIltM3AmrLX6kotVeaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9pWR5kqpNNyIDb8q/ESY2km4aVujuNmSD+8VbDwbtEk=;
 b=tsZ6cHzxQlRccSjGoUPVlNrH2fa9e1Wdn9g+2UndslPl7ia3aMOG4hagdAFPWoA73M1JWuI9yTm2Mh5Xbk4jNh5JKRZvPwWlneuW7ZHeq2r3lsxY+/cPZiU3R8sIDvmsmhOJXIqUXrbGAz+0Ei0I5NT8Z60/+VAhYVnmQfyVXKa3/UgzZJqwsXOVjOIZiZiIXdD7lG1MlnN8gSx8l56q658U9hWCMgBXBFraWCa+yJRCN0sennVsHyNpWp1PKwgQpU8CoYBIqsyXMXKxvQe/GGly4tQZshHUoqCB1FcIyKmgCUxzcxLYDVcRA5fTPY5hNQxgchucgCiTYki335AKTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9pWR5kqpNNyIDb8q/ESY2km4aVujuNmSD+8VbDwbtEk=;
 b=R9G8an07j2oBD8U3EOeW72Iebd4huc7mkorsSIQLhNh9fXoIYv2Y9/vVbiYr6zETYh0rqUu7SkCG4daiJ3s1AwjnrnhwhkVFpRaZ6u3eG2VJF3RZFOc2HmIQsR/m3O1ixf1xMInLkGLtdPl7xHHWRUMgo39JNW7mKxMt6bxKXAg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN6PR12MB8541.namprd12.prod.outlook.com (2603:10b6:208:47a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Mon, 2 Sep
 2024 10:58:59 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7918.024; Mon, 2 Sep 2024
 10:58:59 +0000
Message-ID: <f43f8310-8e5a-48fc-af44-949a78599de9@amd.com>
Date: Mon, 2 Sep 2024 12:58:54 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] drm/sched: Make sure drm_sched_fence_ops don't vanish
To: Matthew Brost <matthew.brost@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com,
 Luben Tuikov <ltuikov89@gmail.com>, Danilo Krummrich <dakr@redhat.com>
References: <20240830104057.1479321-1-boris.brezillon@collabora.com>
 <ZtJHg8JOPi7CVme+@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZtJHg8JOPi7CVme+@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0106.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN6PR12MB8541:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e5e0260-0560-4750-a343-08dccb3e3f8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?djFUWmcrZXUxZU02OCttZ0ExM3l5blV5c29qY3NqVUFaQnB1SVZabEVGSnEv?=
 =?utf-8?B?RlFneXdiVERRWDBCZlNGT2taSUI4RHVjUkJDRkVBZVFDK3FMeWJEQXp4RWwx?=
 =?utf-8?B?YVVjNTVaUEVBcHkyeFhOdDR2aHVGUHA2Nm9UakF6MTJ4WEhobjVLdU9yS2FF?=
 =?utf-8?B?S1hTSWtrN0FiRC9hc1FORTVYaTJ2VnovdDdyUXIxbU5PYmFOSU42SGZxNjk4?=
 =?utf-8?B?R3pCckxITlRkRXd0UkpsM2UycmlEanMrTWkwNjEycjFWZkh4aWNCY0tBTTNL?=
 =?utf-8?B?YjFwZkFZVjNZTWpHcEVoU3JTN1gySWNGUW9HekhPaXVGQ0xJdi9KTUVDcFE2?=
 =?utf-8?B?bU10M3VNUmgyTWM1VGtCYW5YcWIyVHNFSGRVMDc5R1ZWUWZwazRPcWo3V0NT?=
 =?utf-8?B?WWlBaGlzblVDSGJHQndqVXQ0aFVHYjhZamJocSsyZEllUXY3ay9JTlhvY0J2?=
 =?utf-8?B?VUpyR25EVnhkVE03NVdnSmJhVWVvOFl5NWRoMlpIYUp5RkF2aHZVWmxmcDlF?=
 =?utf-8?B?SzFwTUtxK2dkbG95T1pnK3UvQzVzNWg5R1NIOFFuSVIyaFFUbXhRU0l2U1J5?=
 =?utf-8?B?cDRtK0pERGtQWDYzSkpRcEtEeTdBWHdlWE9VU016blNQZFlBekd1OWlhRlhm?=
 =?utf-8?B?TE8rM2lETkh5Y0d2YlhZQkVrL3gyYUdPajVrdkU4Y1ZuTVJPWk5xYUdQSmtU?=
 =?utf-8?B?a3ArWVBlYktoUStjMHEyd2FndWI1T0NWMVBMSDdqOEpMQm5iSGRRSExPZHFD?=
 =?utf-8?B?cFpDUzMyazVSYWQ2L250N0toNnpXd1JDN0JabHR2VXRXTUNONEN2cnJsbExp?=
 =?utf-8?B?S3RydUlHNGIvTnlEWmEvZzJKN0VZTCtTamVyZFRtc1hFZ3Fmd2R3MHpGMmFp?=
 =?utf-8?B?TTRPWDhnTG81VC81MjZPQkVHK3lHd2NmbHgremFGZFhrc3JlSFROUVdLaHk1?=
 =?utf-8?B?NGFQU2c5VFhIdmdTbHc1a09JbmU4NVI5QXI2K0VwcytpdUdBUWhKejBiOHUz?=
 =?utf-8?B?akc5Sjl4R0NZaDEycTBYOEJkMGZDS1hqQUExWmRPUmlKZlRESWdSZUZVMEd2?=
 =?utf-8?B?SDIyREZhNTZ6MHFSYmM2L1IrOEgxOUw1dmVPU0QrWGhkdmh2cFJuc1VDbzRn?=
 =?utf-8?B?QTFKOHNmZEdCZ05nT05FT2FTeVFUQnNtUG5TdTl1cTJpK3V4V25MMG5YN3VB?=
 =?utf-8?B?RVNYeHo3d1FocFJ4ZDZ4SlE2SmdDdFlkLzB6MldmTG9uZ1owWmI1WGN1VURa?=
 =?utf-8?B?WHFOUkFNTUIzTUlmaVBBTWxkL3lxQ0pmV1lybFh0c1BlMUZENFg2TGtVMDYr?=
 =?utf-8?B?OUxCS05XYTAwMDQyY0ZVWC9mVTlPd01sVGp5aWg4Nk9LZ0YxczYvS1pRWHc3?=
 =?utf-8?B?RGplMmx4UmxOdTdwd0o1QmJ2dkY0UUFrYk50T0pYTm5lYW1LdEdMd3c3ay9x?=
 =?utf-8?B?VTNoYk1MNHd4bGxnU3J0WEhqMStkeTZ1T3RVbzI2a2hzT1E4NEJTekl3WVBE?=
 =?utf-8?B?eUloMzJQMERHMFlJVExKaURQeDgxa2VIRktzWWVUaklmR0VVTm5YR2dXWWFs?=
 =?utf-8?B?SThaYW9GN0lPcXZpTUV5bmhkOFVIdjluSGhrNkhxVmJZUG56VG1GOGU1YzB0?=
 =?utf-8?B?ZzVEUnU1UVlsRC8yOEhpMDZsRHdtWlo4WG1kamJ3cVVLUzhYcXVVOTI5Q2hO?=
 =?utf-8?B?VWQ1cVBvWWF5azB2RVFVNTM4VStmNGZQZUxLYTRGSkRHMmg3T2NJZXJCajR4?=
 =?utf-8?B?UkJGeDIrdGRDTDdBTmdqdXkyMWNRYnd4U1AvSXdrMWFoSzY4RVpVYVJUUGRx?=
 =?utf-8?B?anNtU3JoMUVCYnFHcU9hZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFhzaGlUZmdTQUpFaEJLQm9pU2xpdnlsaWgvdkJ1bjBmM0FyNlJhMlFPZlhS?=
 =?utf-8?B?QS8rVWEwY21vaWdnaUE5ZU14b3RhRkpzWHRHTzEwZG1yNytEaFNqcUlScmc5?=
 =?utf-8?B?UjRCaVFMNnZQRHUrbnVjMUYrYzhJSUdvK2FOc0JyckxlT2s2MDZVUlhiVUFx?=
 =?utf-8?B?S05tQzVORFVleGl5bFYyeWRubFYzYXY5NGd2aWdEQWwyRWJPaVpBV2tMQVJF?=
 =?utf-8?B?WWRNMm80dlRBdVN3Z1prcS9UWExNZEFiK1l3YlFKQnVROC9IQkN1UkJreXZy?=
 =?utf-8?B?WVQ0eXUvMXIwVWlHZHBkc0VEamZHcW44Rk81bzlzK0JFN1JSU0ZzaDB4VFFy?=
 =?utf-8?B?bVVvMFkrWVJzRTlWWWFVL3F0SnJWZWEra20ycFlPVDIwbzNUL09RaVcyZitZ?=
 =?utf-8?B?MStsVXRaSGZhN3dtWWM5OFYxYzBiSVNSTmRMT1d1cysrNTMzMUluUEtyei9k?=
 =?utf-8?B?OWh1ZGF4RzJxb2RRZFNId0s5QWxtTGJZMmcrbXBDR2Q5dFA0NTRIWUlETWps?=
 =?utf-8?B?eFlDZWdoVFhJWHpmRXBqRkd1RFhMVHo0NVhyLzBJbGxQUnhwbUpKZ3VnazNk?=
 =?utf-8?B?eTRtTUZxNnhEMHlRNmIwUndBZ28wRDh5ZmRoZGlGZm1zVDkrWDRWQ0ZKcGdM?=
 =?utf-8?B?bkNWUm9vMlZUOWp0blpyOXZEMUdaNjJPZHRxczgzSm00V2NuOXlqSWNJTmlq?=
 =?utf-8?B?RDlaQzRwRkIvczZjWUdzbnlCdGdFd0dNNzFrNnhqRHQyUWtUMjBCRkp5UFZm?=
 =?utf-8?B?b0lTR3dBM0kvWmQycitrZnlaS3k1UW5ST3Uwd3ltQWVlUThvVHRIdjZIQnpp?=
 =?utf-8?B?UE5rQzV2SUtxTWZoMXB3V0dIYU55Myt5bWpCb0djekZhRThacnhJZ3kwVTJU?=
 =?utf-8?B?dFQ5TGlKZytHbEhoM3FtN3BIN0RMK0o5VGlpOU1Jd3JYNTJsVHRjNS9idlF4?=
 =?utf-8?B?U2hrWVNpMldJbnArOTVzRTJ4RE5saWJWdlR5eGJmbGxWUUZLdEZtZmNnbHBW?=
 =?utf-8?B?aWFPa1NMOEltcUhxK3pIaHV1dThic2dnOHloTUpqcVZ1YUV4cFdnaFhyMkJn?=
 =?utf-8?B?RUhVR0U4SDdOKzlGSngyKzVhdldrbHNRMUxRdzZqL0RxRzZVWXBNZldFbmFM?=
 =?utf-8?B?QXFvRW5MN3dmMXZjbFVsVVZ0b09sUkdiYTZnWlJ3NVpuUE56QlBiNVRrR0dq?=
 =?utf-8?B?WUp3a2lxVXRJbWpRYXBwWmxVRjU5R2RJaE5CV2xhN1RyaElEb1hjcVhQQUk4?=
 =?utf-8?B?TEI3ZEhVb2V4bnVwYVNyWGltM0RZMTltclVPRVJFcVozQWRjaENucmJiSTJ4?=
 =?utf-8?B?YXZVRUdET2NnVHdmeUpYRkdDblczZjV1UWZ1YUtRekt5b05IajVQQmM3R1Bz?=
 =?utf-8?B?cHlEWlBIZFR0RjdyQ25OUllJTU42eGExVHpvUlFYSDRJNDl2cjNvWWtiYkxS?=
 =?utf-8?B?OWk3VG9zcUdUQ0JNRlZpTEhRNjJHYzNrTE1BVG5xakJhK0FBenFCTXgzT1dT?=
 =?utf-8?B?MWp0K1N3cDZhNWJHQ0M4U3BvaHJkU0R0QmwrdGcvdW9PdUNEaGFDRGJ1UHll?=
 =?utf-8?B?WURXaTFvT2kzekgwK2VIODBIQnhSWEhmQURBN01oN0ZBMzZBc0dJMzdhOUsy?=
 =?utf-8?B?UmVyaTVMU0NBWEZHVnZhbXd5cUZSMngxclNsVE5LR21KU1hDWXBHUXliLzRt?=
 =?utf-8?B?SVVvNmxxRTg0eEpqR2x0em56L3A3TUNWR1ZzRWZHd2xLbUZVOVFGYnduVVRi?=
 =?utf-8?B?TGRVeC9HQ3dkMlJrZDdnQ2tXVzRxL2cxdjQySjRkcmEwbGVyVjRqb1BaeC9U?=
 =?utf-8?B?bFZJaXBVT3g2aG81SE9jUUR2K21FQWJlRjFBMnJJOHlHQUhmcFcvcXJKdzZB?=
 =?utf-8?B?VmFCdGJQZlM0ZTVramJ5d1k0VFluWURjSGEyTUdMSGhJd2xSK1BPTXVlcVR0?=
 =?utf-8?B?bHFOMWtEcHdzQkF2aVZRakordVBENXBYaXR4OUVCMzJRVHF1ZWV3Y0xvRk5V?=
 =?utf-8?B?T2lXYkFQVDFCWHhrM1JVTC8zN2w0ZjE2NDhkSTk2Ym1jNVJhMitQTFd6VlQ1?=
 =?utf-8?B?bXNSOWJOWHpOWnFBcVV6alhEaUpEUmphK0NGdTFNSUhpeTBESHBIQmQwN1lE?=
 =?utf-8?Q?i6HJMvlYNamKcIw0vzhZrcXhp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e5e0260-0560-4750-a343-08dccb3e3f8b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2024 10:58:59.5219 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mcqEQEwIvsGtjZih0o1jdgK/zod/an19adqBKB4OsFKwBahtdydXTGAjY6OG2Ox2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8541
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

Am 31.08.24 um 00:28 schrieb Matthew Brost:
> On Fri, Aug 30, 2024 at 12:40:57PM +0200, Boris Brezillon wrote:
>> dma_fence objects created by drm_sched might hit other subsystems, which
>> means the fence object might potentially outlive the drm_sched module
>> lifetime, and at this point the dma_fence::ops points to a memory region
>> that no longer exists.
>>
>> In order to fix that, let's make sure the drm_sched_fence code is always
>> statically linked, just like dma-fence{-chain}.c does.
>>
>> Cc: Luben Tuikov <ltuikov89@gmail.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: "Christian König" <christian.koenig@amd.com>
>> Cc: Danilo Krummrich <dakr@redhat.com>
>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>> ---
>> Just like for the other UAF fix, this is an RFC, as I'm not sure that's
>> how we want it fixed. The other option we have is to retain a module ref
>> for each initialized fence and release it when the fence is freed.
> So this is different than your other patch. From Xe PoV the other patch
> is referencing an object which is tied to an IOCTL rather than a module
> whereas this referencing a module. If a module can disappear when fence
> tied to the module, well that is a bit scary and Xe might have some
> issues there - I'd have audit our of exporting internally created
> fences.
>
> Based on Christian's feedback we really shouldn't be allowing this but
> also don't really love the idea of a fence holding a module ref either.

IIRC the initial proposal for dma_fences actually contained grabbing a 
module reference, similar to what we do for dma-bufs.

But I think that was dropped because of the circle dependency issues and 
preventing module unload. After that nobody really looked into it again.

I think using the scheduler fence to decouple the hardware fence 
lifetime should work. We would just need to drop the hardware fence 
reference after the scheduler fence signaled and not when it is destroyed.

This unfortunately also creates another problems for error recovery,  
but that is a different topic I think.

> Seems like we need a well defined + documented rule - exported fences
> need to be completely decoupled from the module upon signaling or
> exported fences must retain a module ref. I'd probably lean towards the
> former. One reason to support the former is fences can be released in
> IRQ contexts and dropping a module ref in IRQ context seems a bit
> problematic. Also because some oher part of kernel holds on to fence ref
> lazily block a module unload just seems wrong.

Modules are not auto unloaded when their reference count becomes zero. 
Only when rmmod (or the corresponding system call) is issued.

So dropping a module reference from interrupt context should be 
unproblematic I think. But we should probably double check.

Fully decoupling fence destruction from the module is most likely not 
possible since we will always need the free callback from the ops for 
some use cases.

> Sorry if above we have well defined rule and I'm just not aware.

No, it's basically just a well known mess nobody cared much about.

Regards,
Christian.

>
> Matt
>
>> ---
>>   drivers/gpu/drm/Makefile                |  2 +-
>>   drivers/gpu/drm/scheduler/Makefile      |  7 ++++++-
>>   drivers/gpu/drm/scheduler/sched_fence.c | 21 +++++++++------------
>>   drivers/gpu/drm/scheduler/sched_main.c  |  3 +++
>>   4 files changed, 19 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
>> index 68cc9258ffc4..b97127da58b7 100644
>> --- a/drivers/gpu/drm/Makefile
>> +++ b/drivers/gpu/drm/Makefile
>> @@ -158,7 +158,7 @@ obj-$(CONFIG_DRM_MIPI_DSI) += drm_mipi_dsi.o
>>   obj-y			+= arm/
>>   obj-y			+= display/
>>   obj-$(CONFIG_DRM_TTM)	+= ttm/
>> -obj-$(CONFIG_DRM_SCHED)	+= scheduler/
>> +obj-y			+= scheduler/
>>   obj-$(CONFIG_DRM_RADEON)+= radeon/
>>   obj-$(CONFIG_DRM_AMDGPU)+= amd/amdgpu/
>>   obj-$(CONFIG_DRM_AMDGPU)+= amd/amdxcp/
>> diff --git a/drivers/gpu/drm/scheduler/Makefile b/drivers/gpu/drm/scheduler/Makefile
>> index 53863621829f..bc18d26f27a1 100644
>> --- a/drivers/gpu/drm/scheduler/Makefile
>> +++ b/drivers/gpu/drm/scheduler/Makefile
>> @@ -20,6 +20,11 @@
>>   # OTHER DEALINGS IN THE SOFTWARE.
>>   #
>>   #
>> -gpu-sched-y := sched_main.o sched_fence.o sched_entity.o
>> +
>> +# sched_fence.c contains dma_fence_ops that can't go away, so make sure it's
>> +# statically linked when CONFIG_DRM_SCHED=m
>> +obj-y += $(if $(CONFIG_DRM_SCHED),sched_fence.o,)
>> +
>> +gpu-sched-y := sched_main.o sched_entity.o
>>   
>>   obj-$(CONFIG_DRM_SCHED) += gpu-sched.o
>> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
>> index efa2a71d98eb..ac65589476dd 100644
>> --- a/drivers/gpu/drm/scheduler/sched_fence.c
>> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
>> @@ -39,12 +39,7 @@ static int __init drm_sched_fence_slab_init(void)
>>   
>>   	return 0;
>>   }
>> -
>> -static void __exit drm_sched_fence_slab_fini(void)
>> -{
>> -	rcu_barrier();
>> -	kmem_cache_destroy(sched_fence_slab);
>> -}
>> +subsys_initcall(drm_sched_fence_slab_init);
>>   
>>   static void drm_sched_fence_set_parent(struct drm_sched_fence *s_fence,
>>   				       struct dma_fence *fence)
>> @@ -74,6 +69,7 @@ void drm_sched_fence_scheduled(struct drm_sched_fence *fence,
>>   
>>   	dma_fence_signal(&fence->scheduled);
>>   }
>> +EXPORT_SYMBOL(drm_sched_fence_scheduled);
>>   
>>   void drm_sched_fence_finished(struct drm_sched_fence *fence, int result)
>>   {
>> @@ -81,6 +77,7 @@ void drm_sched_fence_finished(struct drm_sched_fence *fence, int result)
>>   		dma_fence_set_error(&fence->finished, result);
>>   	dma_fence_signal(&fence->finished);
>>   }
>> +EXPORT_SYMBOL(drm_sched_fence_finished);
>>   
>>   static const char *drm_sched_fence_get_driver_name(struct dma_fence *fence)
>>   {
>> @@ -118,6 +115,7 @@ void drm_sched_fence_free(struct drm_sched_fence *fence)
>>   	if (!WARN_ON_ONCE(fence->timeline))
>>   		kmem_cache_free(sched_fence_slab, fence);
>>   }
>> +EXPORT_SYMBOL(drm_sched_fence_free);
>>   
>>   /**
>>    * drm_sched_fence_release_scheduled - callback that fence can be freed
>> @@ -210,6 +208,9 @@ struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity *entity,
>>   {
>>   	struct drm_sched_fence *fence = NULL;
>>   
>> +	if (unlikely(!sched_fence_slab))
>> +		return NULL;
>> +
>>   	fence = kmem_cache_zalloc(sched_fence_slab, GFP_KERNEL);
>>   	if (fence == NULL)
>>   		return NULL;
>> @@ -219,6 +220,7 @@ struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity *entity,
>>   
>>   	return fence;
>>   }
>> +EXPORT_SYMBOL(drm_sched_fence_alloc);
>>   
>>   void drm_sched_fence_init(struct drm_sched_fence *fence,
>>   			  struct drm_sched_entity *entity)
>> @@ -234,9 +236,4 @@ void drm_sched_fence_init(struct drm_sched_fence *fence,
>>   	dma_fence_init(&fence->finished, &drm_sched_fence_ops_finished,
>>   		       &fence->lock, entity->fence_context + 1, seq);
>>   }
>> -
>> -module_init(drm_sched_fence_slab_init);
>> -module_exit(drm_sched_fence_slab_fini);
>> -
>> -MODULE_DESCRIPTION("DRM GPU scheduler");
>> -MODULE_LICENSE("GPL and additional rights");
>> +EXPORT_SYMBOL(drm_sched_fence_init);
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>> index 1e31a9c8ce15..eaaf086eab30 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -1467,3 +1467,6 @@ void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched)
>>   	queue_work(sched->submit_wq, &sched->work_free_job);
>>   }
>>   EXPORT_SYMBOL(drm_sched_wqueue_start);
>> +
>> +MODULE_DESCRIPTION("DRM GPU scheduler");
>> +MODULE_LICENSE("GPL and additional rights");
>> -- 
>> 2.46.0
>>

