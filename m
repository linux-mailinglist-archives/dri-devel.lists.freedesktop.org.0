Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83341972CB7
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 11:01:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44F7D10E6F0;
	Tue, 10 Sep 2024 09:01:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="K0GrPB/y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2080.outbound.protection.outlook.com [40.107.237.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B97A10E6F0;
 Tue, 10 Sep 2024 09:01:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mz28cHjUDtg4ancAogTAqiOKmG3BzN6ZFMiMY15fNFHXm+YgRqb6EjhCMVFmlpBmacwTPYtS8MtV03U5R8wU6ikeBK2cpE9pcSzom28vnAQ4ifbFFvtqxoui3GKzvDPqwom//0sOOmGaJQJzzcPZ/sVqbLZCwtoyS2zzTbdMNwQuzFWmocb0rRLUjctp2ngScn7Ftv8MpP1lGm6ekKMu6j15WEDlEJzA965YfpD2Tk22g6EIPvIFgvQJMNiAoukpeEPjBu0VsBaRpK/0eWQG0wczuca+1eBmf9mhe+rS/3zJlUavj1ufvMwaruGGGDtguMlZG87wA5s3AG2DzrzumA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IIiH6Z0pM8PejCc7VBchQpTjKNp4YfgnnWeh2GDUnGQ=;
 b=li6uzy9ELE6T68WyC6I8qSUndm2PTblsPGGof6Vaq3w9yKqX09wppJ6kCRxb+VZe/BZ15YCGLOtPdF26nK2+2bRGtAHahQ3JalbYakEf4ujCXlCetjH/Oqks3Y+/QqAutAZ4ht0LewYiPGKTp4Z8hPiocZyjF1PE4AQ0u9vnZkJo/+SgNOYy45J6Oy2LwgnK9GlnZ8w4dZ04f4ZzNsxjBIwG9XkAK7ypsdRKxhs1bkVOwFpOiLWUnVxvF5gkVxSVxY0h1vn+e9sBmQ9bjdAmmjrc8gjqwKqbHvIqNnioMfwOls+0VrzFCOlj6n7yJOmWNewB+cZTlJ3h4ia+xcBTSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IIiH6Z0pM8PejCc7VBchQpTjKNp4YfgnnWeh2GDUnGQ=;
 b=K0GrPB/yRl6zapK682gUzRBwYwtrummwsEzZfEzz2Ssc4aWpB4Zl0MPzOOVnyAmmxIQdKNVTRc0dJYLMCIxzVD9TTJ6hsXoXlEAbN0y7e0g91oTDuRwtw0TwC9cg9MaNL5FZ1nfz/DE7xNBMqLQthCEkzykWWpRHJa3JkicON8w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA0PR12MB8085.namprd12.prod.outlook.com (2603:10b6:208:400::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.20; Tue, 10 Sep
 2024 09:01:24 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 09:01:24 +0000
Message-ID: <fd6845f0-f709-441d-a77f-d8a6766ba828@amd.com>
Date: Tue, 10 Sep 2024 11:01:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] drm/sched: Re-group and rename the entity run-queue
 lock
To: Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, Luben Tuikov
 <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
References: <20240909171937.51550-1-tursulin@igalia.com>
 <20240909171937.51550-8-tursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240909171937.51550-8-tursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA0PR12MB8085:EE_
X-MS-Office365-Filtering-Correlation-Id: 031a9b27-ff34-4c0f-f103-08dcd1772571
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WnhpK0hqN2NsLzBBaTVETG5OZlprVS9UR3dRTnpKNS9KVEd2VGlFVk9SMzJ0?=
 =?utf-8?B?dXIwd3dpK05jSm8zNmlIK0MvSThQTktzdG42bE8zRWJWR1pTbGVUTUZUVTFn?=
 =?utf-8?B?cE02bC9tRElqVW5HNnJQRzk4Rndpb0FiUjZ2ZTJuWDd2azlqL1dZLy96MHZK?=
 =?utf-8?B?Y2Fnd0RPSDZqZHprQ084MEE5eG1OaWV3b2g2d0Q2NlJyTXJidmFrRExuVS83?=
 =?utf-8?B?cW5wR3BoaHRDWkJWM0R1aU91N1l6cVRTdXJVUlNPUlRhTDdxdHhIY1dyV1di?=
 =?utf-8?B?UmM5QjZGUE8ydWo3N0ovd1NJZW1CMnlJc0NTcmVwYTYrTnhQVVMvdCsyb1Bv?=
 =?utf-8?B?ZE52ZDVhMGZuc1BRM1BkUG4yUWJLV2RFUzVwb0xtTk52VVVZYllmT2ZPQVdS?=
 =?utf-8?B?QlB6UW9pcHdPd2lFbTlhMUNialZKd0F1M0RmY1ZQZXU5c1dFNnVsdDRZbEtB?=
 =?utf-8?B?REJ1TElnaUNjMWZ3cnIrM0NHRkYwc0FtbUdGN0prMUtGV3ZobU04akxLaDUx?=
 =?utf-8?B?NElPNUFkaFQ4K2lBU3hWc2o0ZzlzcDdFdk5HTUlhN2d2Vm5OZUNNM3FkcDFZ?=
 =?utf-8?B?bENCWk9zdmExY3VJU2JuV3ZwbGhWVkM1dUkzbHBvWTZDVThqdEtRQTR4Wkxn?=
 =?utf-8?B?WlpBeUE5YURuaGhpMlpGRUJEVkFYejhPajJZWksxb1dTUUQ4OE1vUkxCcjhm?=
 =?utf-8?B?Z1pqY2gzM09mcHhNNk9iYWZweTRpK1pZQ3FvT2llUE9mdXZlOFI2b0xVTkkv?=
 =?utf-8?B?LzlPQkRFNXBoVEhEelJnVXVwQjZPY0VGWnNUTXY3M0xHU2VjS1ZINkJ2SmVt?=
 =?utf-8?B?VThiNDVxYmhlTndGOGpaM0lwYThqd3BHZGhIbHJDRnFnS3Z6QTJRekVyM1Rp?=
 =?utf-8?B?MzBxUk82TlVDYkVVcVdEQmNEenIxa2hRY0xscnptL1lBU1RSVlRIK3lVeTRF?=
 =?utf-8?B?R1ZDaTEzMnFqeTBIRzR6bE9RQUlYenVFUFpiZmxvejFwdDZSV0t4Q0tKVVJO?=
 =?utf-8?B?MjhZbWVGQWNsMHVGUk9nNjZ6MW5yUjkxVkd6WGRrdmRSTWxwVHJJRVpuV2Qy?=
 =?utf-8?B?NWRmYXlWNTRDYWxPZmQvQmN3UXE5SDk5SUxtNXl3MWtpQXFkbUtMVGZVTmZG?=
 =?utf-8?B?elg0M3pwN3B3cjdRci9hd3N3L3hZYjNQSXVvd1FJaXJiZEhWZ2IwWVpOd0FX?=
 =?utf-8?B?a25TWTY4QlVrUHJ4UUFDTTlGb21IZWxLdkRiRDBxelRlTXlaSzNSeFZiZWc1?=
 =?utf-8?B?NUxOYy9mUi9hYjg3RTBGd1M2YnNoQ2hyU2FTbGE1MDk2LzBxMnkybktySEZh?=
 =?utf-8?B?aHdnZDhXaHUvOTRndmg3czRwUGtJd2hnM0EwTkMyMjczNWk0a1NXNit0cktn?=
 =?utf-8?B?dDNEUDJhb2FwNkNMQWpMb2xwYmpkbjFZRFNXbUp5RkpEZTk0V3VyOURxbjFQ?=
 =?utf-8?B?TDlFQTZyUFJ1YXozc0k5NUx1NDRGUDBNSFlpc1hKdXhEZGhjLzMvdlRxZ2Z6?=
 =?utf-8?B?YWhpTndtSy9YOFd4Y3NraGhNNUlWa200M3BubjNqV1RCWm5xa01DK3FYWjdU?=
 =?utf-8?B?VElpVjVhRDNFT3BXOVQ3UnNGRHdCWnlWSDV2dHVneHNuOWViK1FieExFSFpL?=
 =?utf-8?B?emJwaEFCcUFUb1VmWFBzdnpXMndYaDdBUjFCZGYwR0FlODRGZEFtVUlUTnpG?=
 =?utf-8?B?VXRDZHdoNHBxVUNJK25FcG5wYVBvNmJjaVBzN0xKY2xxYlNiZ0lrc1ZPdVBG?=
 =?utf-8?B?K0g1amZFaVJJNmQxRDJnMmxMQlczSElMcFNyL1hROWNHeGNBZGRlQ0cwUkhv?=
 =?utf-8?B?UC91bjNKUStVc0FTcjFKUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTlvMEVsVERyT2E3UmRmM2M0MklveUdKWUFpazNDVzhRajE3OUc1SGZkWW81?=
 =?utf-8?B?YVV4SFNpRytBdW9vcXhsZUNXQy9mdlB5aVl3cVdTV00vbGNIeXpRUGdVblBa?=
 =?utf-8?B?VmZnWWJEMkljTFB3c2RQWUFOcCs5eVIvTERqejNNbWs5TjFVajdlTmt6cjV5?=
 =?utf-8?B?dGJPL1U5SWlZeGNPa0lDN1I5Nkw0RFpIcDA2YnlkYkdEZzI4cENML0hRL01y?=
 =?utf-8?B?VWFmeDZDTTIyWUlVTXZ6YWhmMytSc3p1QTJTb0QwbnJaRlBjVDFIRUNJUWlU?=
 =?utf-8?B?NTFsOEZGZSs5akNwWDRCY0I5dzRLUFhjUHRZTG4vWFBOdmdEMU5EbUp3ajNN?=
 =?utf-8?B?cFZIdXB1bGh1bHJ4VjhLMFBGRzNSUW8ybExLNkdHSUxEQjZJaGxSZ1lnMlVq?=
 =?utf-8?B?Ty9TSE90OXNySUlwMjRwS3Jhb09lb2o2Q0Y1cDdCT0pPd09oK1h3eFludVFa?=
 =?utf-8?B?MVVwZUhFUTI2V2xqazJKa2JWemtrN3pyT3JGRVFrSnF4d29jTUw1Y1ZmZWFG?=
 =?utf-8?B?T1E3NCsxb1ZXTjBlcExMclVqcitteVFUSHFCeEx3S1NUSFg4ZmdaL1NpS1BQ?=
 =?utf-8?B?RldqQXg2LzlMdHNlWWRWR2ZkcFllQmJiOVhXTXhpWTJZb0xmNGs3QzZtNjA2?=
 =?utf-8?B?bSttdXpETUxvbFlTTERWbmJjb1lETTZrWWZxSDVBaVpVbnlCR0hTR1dQY28r?=
 =?utf-8?B?elNUejE0S25YM2dEeklBczByVHpUbEluSDRFK0RiVFdoaW85VXJJTDBCRDFG?=
 =?utf-8?B?UlgrZWR5UHZ3QVBNR3JwcEtxbzNYNzhYTEpVRU1zNzFYSGMySGQyR2pwNUFp?=
 =?utf-8?B?enBLSU1mMG5MSDIxc1R0YVFISTRpdytIZm0zdDAwTmc2YWptL25UR3B4U2Yy?=
 =?utf-8?B?VEtPd1VTY2oxOXF5ODI2WktOTlFlTWVxZXVUVTlQZ0lHeitGcnYxR3prbjlv?=
 =?utf-8?B?SkhHT0k2WWp2bXM0L2dwbTE3WVdVa3dHbDNoQ1VBeG1PZ1RVbU1kMXVCdFZq?=
 =?utf-8?B?UEhMUHNRUlIzQzkxc2lDbUdKRXNBdU5EcUJzRldsWnY2TkN0S0xIWUsvSVpz?=
 =?utf-8?B?STQvZDlkcWQ4Z0liQUlZY3VBL0p5SnFseVNFZWpmeTFEL1ovRCtmWWtDM1U5?=
 =?utf-8?B?V2dnYTYzOC9kR0NMeVYzN3FiSXQ0ay9wUVRPVkZqeHBSVm90Sy9GQnF3NXZo?=
 =?utf-8?B?aHZNdnRzTEpBMTUwYW9obDNyQUZUaWllTXBJZ2IrQ0NxVFdhNHNrUmw3VVJn?=
 =?utf-8?B?TWFCQ2piVkNkWTZGUm4yY0xTYzlIdTF6RStIMEdzU3BSTkI0ekNuU0RBWjY2?=
 =?utf-8?B?a3ozVTFjZ3drc0Nac3dBTlRDZXZwalNKRkdwR3l6dWRHeW5VcnMzd3c4VDlW?=
 =?utf-8?B?YVBJNkFCSmdmdHMzSGtQTm8xcHIvVGxqdjhYUmdnYjU3c0hod205VGwrZDJE?=
 =?utf-8?B?bUh4Q2VjUGRzSlJVdi9rem5ScHdld2srUUtNNGJSYUxnUG8xNi81cVZVNmlX?=
 =?utf-8?B?YXdIdEVMaStwaFFXdHVKaEV5bmtvdWlqaU1JRlE0WWZBalJlQUljSVpyYytG?=
 =?utf-8?B?cWQ4WTEyQVVBakRseGg4QTlxS2tyZlg5UWQwZStsbGpVODZTcXFHM1BZZjlR?=
 =?utf-8?B?MXRzUlp1c1BzM0diTjEzQnJUUXhjS3hQcjdMeDUrakxZcHJtY1Z2Rjh3d2Rk?=
 =?utf-8?B?dVdVYXJwVmpiTGJsRWdiL2hieDJrMTRMSDlOSWtQdzJDYld0WVh1Q25TSEd6?=
 =?utf-8?B?WmpZRURzcjd2Vk4wdnJJK1JTRUxVbUEvRER6N3RFZkYvei9KMXFGVE52MFA0?=
 =?utf-8?B?VGdnbExTZXM3YnlPYk9zelFocVVSMHljQVovVzk0eDhrME1Bbm4yRDI4UlJ1?=
 =?utf-8?B?aFJrTmdWazIzZXBlRm1yQ1RjcDVwdnREOUlZdCtJWDBWOEIzUjFpQVFMMG0r?=
 =?utf-8?B?NFlCV1ZiTEF3Q294a3oxc2JPbTBxQmpUUVdmT1F6MGttNC9OOUE5R3lXZ1Jr?=
 =?utf-8?B?UWhXMDMyalZ6K2FQbm8wUkV0clFMS1BNb2xrVnpmMTlDY2J0TEU5SW4rOFZM?=
 =?utf-8?B?ZTRXUy81RXltQ1pPSkZOa2tkUVpKa0FTdk43U2VQeEUyclVFRlBlUXB6c2pn?=
 =?utf-8?Q?E4SCFufhvPJTIlVDmfklA6p1S?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 031a9b27-ff34-4c0f-f103-08dcd1772571
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 09:01:24.0718 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PIyL7sF462qp+vRRQa/gtMfVBVU9pLlbAJ+kgeGHu0+2ejNlsQ9rNEYxaipouYMl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8085
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

Am 09.09.24 um 19:19 schrieb Tvrtko Ursulin:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>
> Christian suggested to rename the lock and improve the documentation of
> what it protects. And to also re-order the structure members so all
> protected by the lock are together in a block.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Luben Tuikov <ltuikov89@gmail.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <pstanner@redhat.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/scheduler/sched_entity.c | 24 ++++++++++++------------
>   drivers/gpu/drm/scheduler/sched_main.c   |  6 +++---
>   include/drm/gpu_scheduler.h              | 15 ++++++++-------
>   3 files changed, 23 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 2da677681291..b4c4f9923e0b 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -105,7 +105,7 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>   	/* We start in an idle state. */
>   	complete_all(&entity->entity_idle);
>   
> -	spin_lock_init(&entity->rq_lock);
> +	spin_lock_init(&entity->lock);
>   	spsc_queue_init(&entity->job_queue);
>   
>   	atomic_set(&entity->fence_seq, 0);
> @@ -133,10 +133,10 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>   {
>   	WARN_ON(!num_sched_list || !sched_list);
>   
> -	spin_lock(&entity->rq_lock);
> +	spin_lock(&entity->lock);
>   	entity->sched_list = sched_list;
>   	entity->num_sched_list = num_sched_list;
> -	spin_unlock(&entity->rq_lock);
> +	spin_unlock(&entity->lock);
>   }
>   EXPORT_SYMBOL(drm_sched_entity_modify_sched);
>   
> @@ -244,10 +244,10 @@ static void drm_sched_entity_kill(struct drm_sched_entity *entity)
>   	if (!entity->rq)
>   		return;
>   
> -	spin_lock(&entity->rq_lock);
> +	spin_lock(&entity->lock);
>   	entity->stopped = true;
>   	drm_sched_rq_remove_entity(entity->rq, entity);
> -	spin_unlock(&entity->rq_lock);
> +	spin_unlock(&entity->lock);
>   
>   	/* Make sure this entity is not used by the scheduler at the moment */
>   	wait_for_completion(&entity->entity_idle);
> @@ -396,9 +396,9 @@ static void drm_sched_entity_wakeup(struct dma_fence *f,
>   void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
>   				   enum drm_sched_priority priority)
>   {
> -	spin_lock(&entity->rq_lock);
> +	spin_lock(&entity->lock);
>   	entity->priority = priority;
> -	spin_unlock(&entity->rq_lock);
> +	spin_unlock(&entity->lock);
>   }
>   EXPORT_SYMBOL(drm_sched_entity_set_priority);
>   
> @@ -555,14 +555,14 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
>   	if (fence && !dma_fence_is_signaled(fence))
>   		return;
>   
> -	spin_lock(&entity->rq_lock);
> +	spin_lock(&entity->lock);
>   	sched = drm_sched_pick_best(entity->sched_list, entity->num_sched_list);
>   	rq = sched ? sched->sched_rq[entity->priority] : NULL;
>   	if (rq != entity->rq) {
>   		drm_sched_rq_remove_entity(entity->rq, entity);
>   		entity->rq = rq;
>   	}
> -	spin_unlock(&entity->rq_lock);
> +	spin_unlock(&entity->lock);
>   
>   	if (entity->num_sched_list == 1)
>   		entity->sched_list = NULL;
> @@ -602,9 +602,9 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>   		struct drm_sched_rq *rq;
>   
>   		/* Add the entity to the run queue */
> -		spin_lock(&entity->rq_lock);
> +		spin_lock(&entity->lock);
>   		if (entity->stopped) {
> -			spin_unlock(&entity->rq_lock);
> +			spin_unlock(&entity->lock);
>   
>   			DRM_ERROR("Trying to push to a killed entity\n");
>   			return;
> @@ -619,7 +619,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>   		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>   			drm_sched_rq_update_fifo_locked(entity, submit_ts);
>   
> -		spin_unlock(&entity->rq_lock);
> +		spin_unlock(&entity->lock);
>   
>   		drm_sched_wakeup(sched, entity);
>   	}
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 54c5fe7a7d1d..937e7d1cfc49 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -165,7 +165,7 @@ static inline void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *enti
>   
>   void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity, ktime_t ts)
>   {
> -	lockdep_assert_held(&entity->rq_lock);
> +	lockdep_assert_held(&entity->lock);
>   
>   	spin_lock(&entity->rq->lock);
>   
> @@ -186,9 +186,9 @@ void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts)
>   	 * for entity from within concurrent drm_sched_entity_select_rq and the
>   	 * other to update the rb tree structure.
>   	 */
> -	spin_lock(&entity->rq_lock);
> +	spin_lock(&entity->lock);
>   	drm_sched_rq_update_fifo_locked(entity, ts);
> -	spin_unlock(&entity->rq_lock);
> +	spin_unlock(&entity->lock);
>   }
>   
>   /**
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index d4a3ba333568..5a1e4c803b90 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -96,6 +96,14 @@ struct drm_sched_entity {
>   	 */
>   	struct list_head		list;
>   
> +	/**
> +	 * @lock:
> +	 *
> +	 * Lock protecting the run-queue (@rq) to which this entity belongs,
> +	 * @priority and the list of schedulers (@sched_list, @num_sched_list).
> +	 */
> +	spinlock_t			lock;
> +
>   	/**
>   	 * @rq:
>   	 *
> @@ -140,13 +148,6 @@ struct drm_sched_entity {
>   	 */
>   	enum drm_sched_priority         priority;
>   
> -	/**
> -	 * @rq_lock:
> -	 *
> -	 * Lock to modify the runqueue to which this entity belongs.
> -	 */
> -	spinlock_t			rq_lock;
> -
>   	/**
>   	 * @job_queue: the list of jobs of this entity.
>   	 */

