Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F78AEDB6F
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 13:42:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9897910E20A;
	Mon, 30 Jun 2025 11:42:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UAqQ/ZBK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2079.outbound.protection.outlook.com [40.107.244.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BA3910E20A;
 Mon, 30 Jun 2025 11:42:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B0/PBIy8ACw3EE19TOXm0a4FpyEQ+3pJwOssoICu/qhRhqzWLTyobAN4CPBLt0399q6WPtQsMtOrhJfT3J9rMBZjC/KQuJuyCzoxuZWIWiRmruCJ+m7/oCVdfhcQ74cd6+tjGvOLjILlVnYwfTHP51mE8YPo7tAJWd8pgCMfCQjgldWu1/diqtHro+zDUM+seCb3jAfFDy+Iv0XgEivhEdROtXqPAlGoQ5xNH7Q83aIBCtSqw2AldndBfzPWBJTnh1gDxYm54ECE9w5dKx/MLb4QCZxHc5aAz19QGqTZWS+/ha7Revr3SUrqOwHcNs1NUN7y4D0CHRFBpibDABZe3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cy3ZyRjIew1l/wRnVL3TYzw78h5tSlhr4lvEuZ4ykkE=;
 b=ZMQ7usBrHtsJ8pTC46024yGHLN6oxqL8nr1Kuu4JdYXAYsXBA51KuY6RSwXw//7puJ7KeDPepef8MEcmLM2ihuuYOywgxKpuhBfOhgAjUBKjuryRzFG3f22Xv/VI1cN9wPMUU+Id3rrRoom4zRMbCutR4ptACbDgM+SqGVvYPiL0MjrBd/AzBZtqutkYjy8H8CL04uzpCYHJasLTV4E+EIf+IsXm0E5UcDNoH5j7s3HO5sezZHwto9xJKyfn5Fr1akFjjqE91fLBQqn7lVvM6yYaOKkOnGP0yK+SUFNs0MnIjBNLdWsIjuTjk2XEUyeWZsLI6USb1UA7b6DT9JFqsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cy3ZyRjIew1l/wRnVL3TYzw78h5tSlhr4lvEuZ4ykkE=;
 b=UAqQ/ZBK7nwOypOAB3YybMGYx8DpzzLiFtxTPob53BpE6b3M+uhI0bKJFrSCAabSMlFWoUZHmg2PGqOu+094k7SUZOL1rMXttcMIg1Wr94LNv7q/dgjICc2UPK/rf3uPpdoMFxJi2K6sRvKBuKpLzxEjoQ3o8Cphw90ovo1++gk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB6614.namprd12.prod.outlook.com (2603:10b6:8:bb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Mon, 30 Jun
 2025 11:42:49 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 11:42:49 +0000
Message-ID: <de09fae3-449c-45c5-879e-ccc11a5d4c08@amd.com>
Date: Mon, 30 Jun 2025 13:42:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] drm: move the debugfs accel driver code to drm
 layer
To: Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, simona@ffwll.ch, tzimmermann@suse.de,
 tursulin@ursulin.net, phasta@kernel.org, dakr@kernel.org
References: <20250627094921.911009-1-sunil.khatri@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250627094921.911009-1-sunil.khatri@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0047.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB6614:EE_
X-MS-Office365-Filtering-Correlation-Id: b1cad136-f994-4702-2546-08ddb7cb3d05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?alZYbnltRVBmVUlVQjdTQ3ZOUUtuak90OElBTWJRbnB2QWxlT3VmTXlKMmdQ?=
 =?utf-8?B?N1pXVUxaRS9YQjU2Z0JITVp2TEg1YzlVamZ6R0RrTTYzbUtOOEwyV1dtQXpr?=
 =?utf-8?B?U09KaENXSS9WK0t6NWV2NWNnajdzM29HK2Y0RXE2aWNicmJnb1dQNHF4N0hP?=
 =?utf-8?B?OVJWVlY3L016eEZOY1NxTFlXRnkwYVhvSkp4UytLWEVYYlpQMDlNS0ZzK2lm?=
 =?utf-8?B?MUZaVHJxQnRBeVhTcGxKR01FV3lOSC9iS2w3K3ZBdFkzeVRBSHd6REVCcjM2?=
 =?utf-8?B?alJCcUFOcHRRQWZKbWorelpZbWZUcGY0MDVkM1dBTVUxSWpjUytIMUx0S1hk?=
 =?utf-8?B?WFV4TmVGUEc4RVRmVGliNGF5T2xMV3IvRWhDWDdUWkx1UGNFbGZUS0pUeXJn?=
 =?utf-8?B?R0pSVDhUYm1JNDZvRmUrM053QkZMTm9YeHRSUmk3UVZXaXhXb2JHeFZpZ3Fm?=
 =?utf-8?B?azZKcTFld2M2Y3JVd0NvR0FPbnJUNGl2czB4WHZPZjE1cGYySW5qYlNGbHZE?=
 =?utf-8?B?VDBZRlF4RUVHWFdCY3RLSUJNVHVaVkJDKy9uRmhGOVNOM2MwZTRmR3Foc2Yy?=
 =?utf-8?B?VTNMczhSOFplV1BTdGZZZnlURVZZeWo1WGRBU1A3N3NTR2p4cnVkdWU5T1pa?=
 =?utf-8?B?S2JzWTl2dDlYaXJ3ZXR0OVhzSi9GSkpkNmtYVWszYU04RHBLdU5qbnhkNm1L?=
 =?utf-8?B?RE9xV0plUEgzSkZ1UkpVcWNDaUk5N2ZTTklqMFZncGc2TUIrdVVpV0llbTZh?=
 =?utf-8?B?aHk4YmYwZ0dTc1dYQW1jRDFFc2pqRlY5ZlpVOFMvdWhmeE1McUx5LzlBWk1w?=
 =?utf-8?B?b0xMYjdvTDV4eGZvWkpSVHFvVGRWSCtiUW9Vb2tIRlRhbFlLK0ErNjdMTENB?=
 =?utf-8?B?N3paZ0swd1hEdENDZDZVYnp3R1RqejAraEVIcktGOEVXMjEvSUphY1gxQk9K?=
 =?utf-8?B?WXYvRERWcjVYNjV6dXdSdkNQRFI2R0U5Qm5wRCt5d0N4MU9qaUhQZnJUR05Y?=
 =?utf-8?B?T3prcENFS0xuVFp4ZlN5SHNxTEtmQllINzV0SlRTL2Q1ZDQrV3ZRVzQ4M3Yy?=
 =?utf-8?B?Wm9pSEpyMjBsK2Y0djJsTEEzMmtjZE11emN0Kytqa0p0VE00Y0M5SkxwdHJu?=
 =?utf-8?B?TkN2eGFGRnFETldNeGFGN1BPekZHTWN3RlZhNmdINDBWcm9VTForK3RXVkpz?=
 =?utf-8?B?QTltemtXb0VhRGVIdEpXOXgvUWg2UGNYN1h3U2ZTUEs3RUdzS3dCWWlDK1hm?=
 =?utf-8?B?Rm5sVWtTa0NtQnpOaDROM2NrVDZBb3QrOTNuNFhYVnQvVnJXcyttSm41cW9m?=
 =?utf-8?B?NEdyZXBQVjBhQXN4WTBmL1FVQVNxc1FvdW1YdTEwRDM4ZEp4N1l2eDZoZHdp?=
 =?utf-8?B?emdTV1ZTMmgrUmZNcUJadG00S1dnMFowZmdEUnMwWVFZazM3V21haTN5dytH?=
 =?utf-8?B?b1RCTm9PSmRubHFCWDhpY3JDV0FLVHpxWEVSNjlISVRMVzF5L08yUVg1U2Y4?=
 =?utf-8?B?QWVCbW5vZUpPejIrR2lnMU5BeUJyR2k1b2JKUkdEQjBhSmNtZUdRazdDcFNk?=
 =?utf-8?B?RG83Vkt6aUJ6dktUakdrRnN3bnNlWFQ3QUFVRnVxNFpkWk5lRklVajJWN0ZS?=
 =?utf-8?B?ZHNZMlpLQlhTbGRGc2NuRVhtUlFOR3FUbTBSSHhtWHR0RU9zd1kwUmd6dVBw?=
 =?utf-8?B?SFVPbC9nWkxoR0ZNNy9EbHZuUC81RTNoV2NLRnRQMTVvQktDTW42Y3JQbThR?=
 =?utf-8?B?OUQxUXFOUW0xcFFqVjdXODhvajl0NE52N2ZFM0IraENvQ0tXUzczN2tTc09a?=
 =?utf-8?B?VmdXS2k3TXhJS0hBRGYxVEpObC94SzN4OWQ2eGtpMmNGRlAreU1HV2Nvb0dy?=
 =?utf-8?B?eVhNcFdkcjNaRHJod2ppcnFIcFozM1hBSEc0K3BxQTE3T2VKdFBZc1krV3dh?=
 =?utf-8?Q?1rob+YZMfnw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rkx6U2pEUDhZSjFyUmVqZGRRVityYWNJd0Y5MmJ4eU1FeUM1cTBORUNsanZY?=
 =?utf-8?B?QWxKUzA1bmFLTGVMTjNqKzRVMkRNZTJkbEJpL2xVbDFGTHdsS2tIWkk0Yy9D?=
 =?utf-8?B?cmhqY0pIUVJuV3VGRnIvV2pncGdVT21WR2ZQMnpGeVpJZ2tSQi9yOTBBTjRr?=
 =?utf-8?B?OFJIVmNGWm04eSt1SG1QbzZES2ExK0dXU1BneUFlaWhRQnBpbC9jSzFwTm1L?=
 =?utf-8?B?aUlHeWlJUFhyWE5SK0IvSXdLOUxUWXJSS1N4KytVR2x3OWRaNlc5ZFdPT0dh?=
 =?utf-8?B?OVI0bjMrU0R5V29sWlhvN3Y4akluVWNTM3ltRmpQVnZpOFNubWZ1MytCYkNR?=
 =?utf-8?B?MnRZSmErYnk2KzlkQTBVVExvY21YMnhMQUQ5eWZWYlE4WEZlSUpiTUR1V1pC?=
 =?utf-8?B?WTJCa2djSWZva2xqQy91dHJwOEVVKzVyUHg4bVluRVg3SW5FNERoYmF5UkZJ?=
 =?utf-8?B?K0g3MFRNQ1psb3Y4UmdBMnhwZ2FmaGZBZnFNU3l4Zk53UHh2Zk1XZStXVGh6?=
 =?utf-8?B?VExPakVTWVR5ZDVkOWpXU09KbFJtU2RqWUlYUllKb3BBb1RpMlRJNlpyQWlL?=
 =?utf-8?B?V29vZlBIRC9pcTJSVStJSlY5OUUxcUZMREpSbTc3NEFUNW1SWWJFVmhGVzd4?=
 =?utf-8?B?SFNFcDFSaUpZWmlLZU1YSlJkN1ZFcXVLbG12RklySjFoL2RyclRGcTJLVDBs?=
 =?utf-8?B?UTg5Q0NESmY1SzhLYjFpMS93WVlxR0o5THpuRFY3bDdmY3B2dmYvU0oxRitZ?=
 =?utf-8?B?eGplWUJZTkJnd3ZPeHdGQnNlMnpiV0wxTnpDMEpJekZGRGhSOVBwVW9JYzBu?=
 =?utf-8?B?ZmlYUStCUGlWRHF3YktQbnBJUFdHdWFsbkxmeGdvc2hVTFlLUkZaYS9mMWkv?=
 =?utf-8?B?TDczVEhmM0NhSWU3UG05V1FLeUp4QXNoTTNrRER6RXg2Q2pHWkx2U05zdm5S?=
 =?utf-8?B?SGdMZ2V4WFExMVFaNW1oaTI4TDdKQllxK0s0dDJHYjZ1eTVwdXREb1k2Z25R?=
 =?utf-8?B?TTllSFc0aUxRcVZwUnNUcDR2bmxOMmxOd0ZiU3Z6ZGdYOUZBQXdmcG9oRkZU?=
 =?utf-8?B?ck1CUHoxYWxJdUMydUZ1WkpSSnltaEMzQmVaaVhQOFBrODRCdFYzQnh5TXpn?=
 =?utf-8?B?STdnbXh5ZFdkK3hHdGkyeFFLb3Q4cEZXTlVKVEJoeWxRNmZuYW05dWhuZlBR?=
 =?utf-8?B?MzFHWkovSGZwNGhYN3RESm5zK2NJSUZhRHRaREtKQTk1MTVFYnY0a2V3bHJK?=
 =?utf-8?B?QUs0ZlA0TVorWGlwZXZheDJQWG9zN2ZuQndlZUtGeFV2UnY0bzhPY25Ua3lt?=
 =?utf-8?B?VnhEMlhIOWxDZWdzNzcrSjdQSWNyTHBvREFaOWQ1anVlZ1ovWC9Rd2hwTXkx?=
 =?utf-8?B?c1h1dXZTTFAzZzBTQ1l3V2lKV0s5bG9EaEM0REtjQkJqeFpld1NiQ1ROMHVQ?=
 =?utf-8?B?dndkRGZEOHRCR285K0NSTHJEL080RExOTEdiTHBRY1lYZzZBc20zZEJ5UTIx?=
 =?utf-8?B?UXBkb1diTTAyemtPK3R5ZHNBMDBEVkpJVXFOQUEvOXdFNWk4dWtKY05uc2pK?=
 =?utf-8?B?RDIrYnB3aFQ1MkF4dDN6MHBFTXNIZFRrTnRkMU8yYlZZM3RzeHkyOEFEeU4v?=
 =?utf-8?B?N2ZYSFc3dU8xdUVwREo3VjJKRHBLTWFJSE1rTGVvWjFBT3pYdXJ2WnFxTkhC?=
 =?utf-8?B?VEJocDZrZnFHWktvU1cyUE4xSDB4K1dFNjhPeUY0em9ScE1vRmxIRjFLRnlY?=
 =?utf-8?B?NkZ6SHF1OWZIc0xGVlBOL0V4cE5sZ2wrWnAvY2traFI1QzRYeFVFclVMWjIv?=
 =?utf-8?B?OWtuZUFidFhQUWVtUGpqcWxVSG9pQjlubDdjZmtYMDQwY3UxUkpGWm9Uci8y?=
 =?utf-8?B?eG1XUU9wN041SVNMUlVoa3JrUHVqSHpZblZObjVoMjhCNlFJWENWZ2VZNW9B?=
 =?utf-8?B?QmJOM2RLbVlsUnp6OEFSQnB1a1BkN2k5ZGprcWxvaXdDOXhldHZMT0t2WmhV?=
 =?utf-8?B?OXNRMlVhdkJDZnR2aVJnK0RLT09HemZLOFVMcGJ3dmhjMWlLdEpDQjA1YUFs?=
 =?utf-8?B?OEw1ZlI1bXRzdDhmdzYraHY4L3ZRMFJNUlY3NXo5L1g3OHNwZTZzNXFLSzJS?=
 =?utf-8?Q?51IDrQmQEHQJx+/mfUkSRWnOy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1cad136-f994-4702-2546-08ddb7cb3d05
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 11:42:48.9418 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TByNNw8fVAQsejwzDSaWtXTLjvWCTXzmFayTz9KVfQlw2XZaSLUvjGC607C2HBnB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6614
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

On 27.06.25 11:49, Sunil Khatri wrote:
> Move the debugfs accel driver code to the drm layer
> and it is an intermediate step to move all debugfs
> related handling into drm_debugfs.c
> 
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/accel/drm_accel.c | 16 ----------------
>  drivers/gpu/drm/drm_drv.c |  6 +++++-
>  include/drm/drm_accel.h   |  5 -----
>  3 files changed, 5 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/accel/drm_accel.c b/drivers/accel/drm_accel.c
> index aa826033b0ce..ca3357acd127 100644
> --- a/drivers/accel/drm_accel.c
> +++ b/drivers/accel/drm_accel.c
> @@ -20,8 +20,6 @@
>  
>  DEFINE_XARRAY_ALLOC(accel_minors_xa);
>  
> -static struct dentry *accel_debugfs_root;
> -
>  static const struct device_type accel_sysfs_device_minor = {
>  	.name = "accel_minor"
>  };
> @@ -73,17 +71,6 @@ static const struct drm_info_list accel_debugfs_list[] = {
>  };
>  #define ACCEL_DEBUGFS_ENTRIES ARRAY_SIZE(accel_debugfs_list)
>  
> -/**
> - * accel_debugfs_init() - Initialize debugfs for device
> - * @dev: Pointer to the device instance.
> - *
> - * This function creates a root directory for the device in debugfs.
> - */
> -void accel_debugfs_init(struct drm_device *dev)
> -{
> -	drm_debugfs_dev_init(dev, accel_debugfs_root);
> -}
> -
>  /**
>   * accel_debugfs_register() - Register debugfs for device
>   * @dev: Pointer to the device instance.
> @@ -194,7 +181,6 @@ static const struct file_operations accel_stub_fops = {
>  void accel_core_exit(void)
>  {
>  	unregister_chrdev(ACCEL_MAJOR, "accel");
> -	debugfs_remove(accel_debugfs_root);
>  	accel_sysfs_destroy();
>  	WARN_ON(!xa_empty(&accel_minors_xa));
>  }
> @@ -209,8 +195,6 @@ int __init accel_core_init(void)
>  		goto error;
>  	}
>  
> -	accel_debugfs_root = debugfs_create_dir("accel", NULL);
> -
>  	ret = register_chrdev(ACCEL_MAJOR, "accel", &accel_stub_fops);
>  	if (ret < 0)
>  		DRM_ERROR("Cannot register ACCEL major: %d\n", ret);
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 17fc5dc708f4..5d57b622f9aa 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -70,6 +70,7 @@ DEFINE_XARRAY_ALLOC(drm_minors_xa);
>  static bool drm_core_init_complete;
>  
>  static struct dentry *drm_debugfs_root;
> +static struct dentry *accel_debugfs_root;
>  
>  DEFINE_STATIC_SRCU(drm_unplug_srcu);
>  
> @@ -752,7 +753,7 @@ static int drm_dev_init(struct drm_device *dev,
>  	}
>  
>  	if (drm_core_check_feature(dev, DRIVER_COMPUTE_ACCEL))
> -		accel_debugfs_init(dev);
> +		drm_debugfs_dev_init(dev, accel_debugfs_root);
>  	else
>  		drm_debugfs_dev_init(dev, drm_debugfs_root);
>  
> @@ -1166,6 +1167,7 @@ static void drm_core_exit(void)
>  {
>  	drm_privacy_screen_lookup_exit();
>  	drm_panic_exit();
> +	debugfs_remove(accel_debugfs_root);
>  	accel_core_exit();
>  	unregister_chrdev(DRM_MAJOR, "drm");
>  	debugfs_remove(drm_debugfs_root);
> @@ -1193,6 +1195,8 @@ static int __init drm_core_init(void)
>  	if (ret < 0)
>  		goto error;
>  
> +	accel_debugfs_root = debugfs_create_dir("accel", NULL);
> +
>  	ret = accel_core_init();
>  	if (ret < 0)
>  		goto error;
> diff --git a/include/drm/drm_accel.h b/include/drm/drm_accel.h
> index 038ccb02f9a3..20a665ec6f16 100644
> --- a/include/drm/drm_accel.h
> +++ b/include/drm/drm_accel.h
> @@ -58,7 +58,6 @@ void accel_core_exit(void);
>  int accel_core_init(void);
>  void accel_set_device_instance_params(struct device *kdev, int index);
>  int accel_open(struct inode *inode, struct file *filp);
> -void accel_debugfs_init(struct drm_device *dev);
>  void accel_debugfs_register(struct drm_device *dev);
>  
>  #else
> @@ -77,10 +76,6 @@ static inline void accel_set_device_instance_params(struct device *kdev, int ind
>  {
>  }
>  
> -static inline void accel_debugfs_init(struct drm_device *dev)
> -{
> -}
> -
>  static inline void accel_debugfs_register(struct drm_device *dev)
>  {
>  }

