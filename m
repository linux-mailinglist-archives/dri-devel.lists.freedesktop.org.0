Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1DBA813DF
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 19:41:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C756410E719;
	Tue,  8 Apr 2025 17:41:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VaP2JuOe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2046.outbound.protection.outlook.com [40.107.243.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E82F510E26D;
 Tue,  8 Apr 2025 17:40:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C1eUGhy4Z4VLkck9KDuMQH9BrlCo6xeXeGxVnTBLWRLolVJuHoUjr2amuAkKWCTDg3OGKbSk185Aizdp8d9pvHpP2DH7fmjv4GVS8qKRk5LF8CwGJsH0tNyPgWWFEZD8rwHAU1JndxAwHvWjl/EFqnCFFQwZDzDRk/qW7qF6G4vMLs0BWfyEsMfer/VMdWNIc96R9HnQs7L6vI17aOBpKmsYhmJpjdhozICfcnmuOYdz54Cb1qfuKhXldV6adi7CAepgEv12iIUqwDvdTrbcyGiz67YnBSe02KQDCMgHUMAe0Omgae4yzusHOd3KoGzLYG4vzieZMAaDEV7bye+aFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Nk1L3Y2goRdmiCku4fnJQsEWNr/pTmZXEXsbv14i30=;
 b=nl5d2r+XzJgJksf+b74hH9UoKHwQIaWlM+xOdkM475MM56fRe9pm4YPlJNmVbE3pfdqip+xwgHRhYp8gyd+S6nn4WjDyAVEmyFxCzwUV1bbhjxsiwmEql7f1OVdvvkqDy1K5mqlw3/S6gZuJpqvvFnX5gFI/DVkk9L8wErovMqDNvvXJoclUKF/NL/d0BMwYrQKzrGGLCDcnni8PnTgV5f1KCBi89CPZpIkyTHGOHa6T1omcaJQhlvmwrkpj2YQTBlpYC9puvJ+dtm3Q3X2+LvdwiUtuvJHc+RWzpvY73a3oQ2xriAUCWCn4ReaL1QbPo+z86NOG2vZWjLvxiJgiyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Nk1L3Y2goRdmiCku4fnJQsEWNr/pTmZXEXsbv14i30=;
 b=VaP2JuOeoEtQRqx9NqUfQoV+sEhptIzbUqRxGfWzHYFK4PFXvvAFWzZC1+6L+8yxrx2Q47pSQrarrTm+3u7k+IP9Kp9MHU6ASbmswZGZZJgZ8eyYSnIDIgMNacZ0+ddRFR49pYQ/uadMkrXO+b8KkEgBE794FGlPa15osfrjF+4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY5PR12MB6575.namprd12.prod.outlook.com (2603:10b6:930:41::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Tue, 8 Apr
 2025 17:40:55 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8583.045; Tue, 8 Apr 2025
 17:40:55 +0000
Message-ID: <5ab0ff01-6d26-4e52-b8b9-215b1304b6a5@amd.com>
Date: Tue, 8 Apr 2025 19:40:49 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/lima: implement the file flush callback
To: Erico Nunes <nunes.erico@gmail.com>, Qiang Yu <yuq825@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, "Yang, Philip" <Philip.Yang@amd.com>,
 Danilo Krummrich <dakr@redhat.com>
References: <20250408154637.1637082-1-nunes.erico@gmail.com>
 <20250408154637.1637082-2-nunes.erico@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250408154637.1637082-2-nunes.erico@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0156.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY5PR12MB6575:EE_
X-MS-Office365-Filtering-Correlation-Id: 2eb617a1-fa19-4efe-a182-08dd76c483bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SVgyVjQ4UXo5ZXVNUC9CWk5yajNhL1RFcEJKWlhMT2RMckVidUhINC9qcVF1?=
 =?utf-8?B?QTE4YkFWZHdDSjZkTGhrSDlTZ0h0SzdWMG1VQWU2ekkxSmprU0x0SzY2eE5j?=
 =?utf-8?B?akRIUWY4b1V1R040S3p5UXFUanpCRER3TnJpNDVTaU9YL3FSaTFOSU5Xem1W?=
 =?utf-8?B?S3h4Q05VNnFWRzNraDQwWmdselZ2MVZSaXlNOXNDWGpHZitXckw3Smx3b3lj?=
 =?utf-8?B?aGdEWk93N0U4TTVGMktmZHpVU2d0aVlBYVNmeEdDMGNKQnRkTEo1SUFFbEwx?=
 =?utf-8?B?bmxTaVJVYnFKS05mbWNhTHRXK3NlaWR0T0tHSFc5NXBjZlZoYTNHcG1Nd3E0?=
 =?utf-8?B?bjVjTGIvZ3BMZ1NVMnBtelAyd1VKTU0rLy9PVklENSt6WmJGUkpTQzVMVGJm?=
 =?utf-8?B?Y3JzNStoZ2pDY25sRm0xMVlUdFZNM3hOVmFhdDlpdGlIWW1TLy84S1hIdUxl?=
 =?utf-8?B?UENqTnh1L0pKM3l2eUx2R1RKZWh2SnFLQzlyNjg3MHBVQ25hc1JwUURZNVU2?=
 =?utf-8?B?MXJDSkJ0djRZWTlGK2g0UjZVbFM0UjNERVBzd1ZGYlNrdWFMcXpQRDRNU3NM?=
 =?utf-8?B?S0dIdExpbHFVVVZ4OGo4VUkrZjJ5aUNrS3QySU9mWkJ5VWJGQy9pUUhTQ1Zt?=
 =?utf-8?B?dmJZQTZOenVuMXoxT0ZjUklFKzluZ0ZXK0czNW4zNWlCZ0hENDF4ZWljNDF4?=
 =?utf-8?B?ekRTTlNqV1FOZ2F1NW9VZ0wxMlpsYlh1b0NNR056dGZHRmYrQVNTVUxhK0U5?=
 =?utf-8?B?UmRBemxaSGdkWGw4ZGFyVHhLUHBmOEtoWXhTRDVML0lvNWRtbjZyeU1VRjA5?=
 =?utf-8?B?ajVOWmxFYlJXNUNQTUdkSXRscElFR3BtSFhxc1U3WG1DZEc4eUhOdGhGd0N2?=
 =?utf-8?B?M3N4M2w5a1VBaERJTWRqdXVmaGVUV2JaUDZ2WTQ5Um5DNENJODVXY3l2MlQ2?=
 =?utf-8?B?MHFaM1pKUjRWQ1dUWVd1NXZhK2JDM1oxKzZqanlkNXhPaGF1VEJhMkhvcHd1?=
 =?utf-8?B?ZkFlVU1KQ3VQcFlvOVFFb21VNTllcEx4MjRwOVJKS2hWMmhURUdLZGdBN3gy?=
 =?utf-8?B?dHpIbnc1aFExdDVlQU1teitER1Bsd1huWEQ5UlRDb3hpQ2pGUDVYVHlMbHdF?=
 =?utf-8?B?M0FNdGowRkNCeWV3aFd6ZkRuL0pTUG14S0xjeDNaMEU0MWxpTmVqL1FYZW9C?=
 =?utf-8?B?ZGZtaEVxTEYzdmVjL045MTlOV3FUZVNxYUl4bit3a0hqSzJRR0VxbmVNaFgr?=
 =?utf-8?B?N3R5TTVLdTdHV2pCZGQvb3V3YUhPLysrbGpSNDFxVHd4V1pXN1dkUXZsaHBL?=
 =?utf-8?B?Q2hXYWNFY25iOUxLQjNqdVJ6T0ZPRWtxRGRiOFZiZi9FOENOQVZhYnhaSGZH?=
 =?utf-8?B?alpzZ2pxMWtSNWpoMlhSZjJpM3MwVnFQczZTQkp3eDNjU2w1aVlwUkhyZmlo?=
 =?utf-8?B?M0pHWTV0S1N6VHpsZUtNRkpobEFqVGRWNXFsYVdDQVpwOStaMlZCdzFiZlVy?=
 =?utf-8?B?b1gxZitRUG0zMU50K2hIYzA5RjZUOHV3RC9PZDZSZHZSUzg4RnI5L0ZjeU5Z?=
 =?utf-8?B?SHVaVTBmNWdYcVNJOWhzZ1Q3L0dWbnhJQTU2a3VBWk5hbmgyZzlFUGVsL2lq?=
 =?utf-8?B?TEc2WmRFMmd5VjVDMGZJVVEvbWFtOG83REFuTzdHbk9FeFBORWVhaHZPWlQ4?=
 =?utf-8?B?ck5QcTRKUjhpVy9idkJCV1lyTk9LdU1WMkw4TWZUZFVJNkZsQ3daQnF0VXA5?=
 =?utf-8?B?eElhV0hYREE2Rjd6eUt4bDR4dkdGOThtSys1Zk42Z09KWkNNbzBCSjVOTTl3?=
 =?utf-8?B?VnVBM2E5OXRDYXdEbWZTdGlHWWZGendDaGwyckFaUlgwMXk1R2lyV0lmQkNo?=
 =?utf-8?Q?z6UCelevyHXqr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHFpMWQveEsyWnQ3RnNYcjAyejVZRU9sSnZyVll1K09KWXNWYk1SZEFVTHZi?=
 =?utf-8?B?WXVDNzI1bjBVYnJXMEUwZHJRcVp1eGJnbXhtM3ZBMlU3OG9ONlZxQnJ2VEdR?=
 =?utf-8?B?SUdIVFdhSU9oNXpqckw1U2NwSzJRbndkZ3ErT2M2MUhyaGhSR3dxTHNPT1Zx?=
 =?utf-8?B?NE5RWTBDYWplNmN5VXg5U3I0cVRjMVN2OHJydTFaZXFnMFlzb2RzRmNGQW56?=
 =?utf-8?B?VWxIbFlWc2lMN1M5ZGxqQUxHZTBBa0syMHRFUERTMVJ0bi9iSzVXd1Z3bWxI?=
 =?utf-8?B?VW9zYTJrVkhlOVVad2dqNHJvUDAzNW9zZ2dUcEthL291Qm9nZjl0RWNYbnFl?=
 =?utf-8?B?Q05CZngwOXhHTmFlK2FHRXJTN3RpNUZQNmV0SVZoYWJVL2U4UjZzblBoUHM0?=
 =?utf-8?B?TURMajd5NGM1Q2tValZMVEZvd3RlWmZjQThtTFhLbkZ1ZGZmdTJZZkhFc0Ir?=
 =?utf-8?B?V3hET3A4NHZVdXN3dkNRSDRiM052cU1VTDkyS0MyTTFITEN2VVFEbWVQY1c2?=
 =?utf-8?B?MlU4ZXpSQmxsSE12TkUrb3NMSS84ek0ySFJacmRuSFM0MzdaVGpxQ3o4aXd1?=
 =?utf-8?B?bGg1dHQ0cWVlTS9ZL2hGc21jSFVZYTBkQmRTa1JUUmJST3RucHAvSGZoL1BK?=
 =?utf-8?B?UnMzVnNrVnFhOStRVUt5SFpxZURaMVZGT0lhSUNjNjBROUZJOUplVThvM1BH?=
 =?utf-8?B?QlVUaDJxS3RucmorZHlNd0JuU0NRcUFpR2tNakdUQVJyY1RCcUdLRkJVZ2t0?=
 =?utf-8?B?M1JSNkFKVjJ5RGpqZjZ6dHJ2MmpLZ2VZanpwSmVrODB1YmhQMnRRSXVKWnRh?=
 =?utf-8?B?ZmZTTTN0U1lDaXVMOFBOTUIzVzRtd3lvZEJnTm9FVldnTWlNZ2NVQnNLZ2tL?=
 =?utf-8?B?MVYzcWFEbVBLdzdOZ3NEek5sOWNvTkRldGNXeE55eUVGd0ppeWs0Q1hPZy9v?=
 =?utf-8?B?b1FDS1JBcklDTDIrbHRlYVFKdzBhYWRiWEgxZ2JWck41WERDQkpiWGpJc014?=
 =?utf-8?B?MWNOOE9sRDNEa001L2R1WkFqeTdzWUIrcFFSMG1QTmp6ODN3S1ZTV1hIVGc5?=
 =?utf-8?B?dDl6ZzRaSVRSVDZaYmdhR3grVGllSGRUN0FZc3ZpS1o3WUFNN1RPcGFCbE5X?=
 =?utf-8?B?R0dydFRDcDZzK0tkSUlad1JobjZndkZZVlRsRDF5Y0dVZE8vUzd1eXB3djNT?=
 =?utf-8?B?RmIzWGZ1cTFwYWNCOWNCUklxT2hhV0M1NTZEY0doKzl2bkRNQVhuRXAydXpI?=
 =?utf-8?B?aXh0LzZFRmNqbXIwS2pHVjN3bkJwb205STlMT3FpZkVtNkJadWs5QjVxbGhx?=
 =?utf-8?B?ZkoyOGQ5SUZKYkdlOEJxdXpBZ0RacnNwNk13clNHLzJvVUoxT2FwcE1PaW84?=
 =?utf-8?B?RmpHcm9ZaHpzQ0R6aHR6eVAyajJHaTBoYXNiT3RKeVl2MElwaE5lNFJVMVpN?=
 =?utf-8?B?Y2ZybTF3Qzc5d2xRbWhMc2RNVk5INVlJa2JoeitVWHgxSUpENU9iWWFURkxR?=
 =?utf-8?B?MWtXUC8yNXRrUE1FVGpVbDJZQzRuZTJEeTNEV1Y4SDUvN0NnWXFrd2tkUVRC?=
 =?utf-8?B?Y3ZDd3RvaFlBTHA2Q2FIS1BIRytqOERXL2F6WmtiSG5zVHhpSzAwc1NnSG9B?=
 =?utf-8?B?N0srOVV2NXY4U1VHa2ZzeERyb2NhMHU4OCsycTVUOXZvd1Bsd1NYZFRNUWhn?=
 =?utf-8?B?emxnWWtJdnVLZ3R5cXd2MmcvSW5MckhyUkJtcnRTYkw4WWZxMnRjVUNxcG51?=
 =?utf-8?B?Z1BjeWRoVFlPOE5EaE5WVXNrQUh4V0JueUdlSXhCbG1EM0lpL3lnaDNoWEkz?=
 =?utf-8?B?a20yTGw3cUtvQjFBODR1SHZ6NXNHS3c5RE9DdjlkbWk4RWZsQlpWbmFNbE1y?=
 =?utf-8?B?amNsWUdyZXNTK0hsUzhKMlBIN1ZqamgwLzJWbjZlTGpYMy9meVJpVzJ2RXFn?=
 =?utf-8?B?anB0VGMybG9GRTFYMWorbVJ4RW95SjFnK2QrL0Z4ZC9vRUZEUW44N0paZ2VN?=
 =?utf-8?B?bm1YWERxRnFrYU5PcCtWUFl6YmZTZ3M1aFpTUzhkMEZFMG5lellXMlRjVklB?=
 =?utf-8?B?WjhWOUVUOHUvYWMxRThUSjgyaFZTY2xVdEdyYkJ2K0JGcnFnN2hta2tFSGkz?=
 =?utf-8?Q?6a6I5jQ9X/LiEImXZK9tbYthi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eb617a1-fa19-4efe-a182-08dd76c483bf
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 17:40:55.4508 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o2bc08h7A1qXoa/5pjkRmU3qM4V0Sx8dYzt/HecZ2w4RIrGDsGRJUe78gxjqvcG0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6575
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

Am 08.04.25 um 17:46 schrieb Erico Nunes:
> With this callback implemented, a terminating application will wait for
> the sched entity to be flushed out to the hardware and cancel all other
> pending jobs before destroying its context.
> This prevents applications with multiple contexts from running into a
> race condition between running tasks and context destroy when
> terminating.
>
> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>

Looks perfectly valid to me and is most likely the right thing to do for other drivers as well.

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/lima/lima_ctx.c | 18 ++++++++++++++++++
>  drivers/gpu/drm/lima/lima_ctx.h |  1 +
>  drivers/gpu/drm/lima/lima_drv.c | 17 ++++++++++++++++-
>  3 files changed, 35 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/lima/lima_ctx.c b/drivers/gpu/drm/lima/lima_ctx.c
> index 0e668fc1e0f9..e8fb5788ca69 100644
> --- a/drivers/gpu/drm/lima/lima_ctx.c
> +++ b/drivers/gpu/drm/lima/lima_ctx.c
> @@ -100,3 +100,21 @@ void lima_ctx_mgr_fini(struct lima_ctx_mgr *mgr)
>  	xa_destroy(&mgr->handles);
>  	mutex_destroy(&mgr->lock);
>  }
> +
> +long lima_ctx_mgr_flush(struct lima_ctx_mgr *mgr, long timeout)
> +{
> +	struct lima_ctx *ctx;
> +	unsigned long id;
> +
> +	mutex_lock(&mgr->lock);
> +	xa_for_each(&mgr->handles, id, ctx) {
> +		for (int i = 0; i < lima_pipe_num; i++) {
> +			struct lima_sched_context *context = &ctx->context[i];
> +			struct drm_sched_entity *entity = &context->base;
> +
> +			timeout = drm_sched_entity_flush(entity, timeout);
> +		}
> +	}
> +	mutex_unlock(&mgr->lock);
> +	return timeout;
> +}
> diff --git a/drivers/gpu/drm/lima/lima_ctx.h b/drivers/gpu/drm/lima/lima_ctx.h
> index 5b1063ce968b..ff133db6ae4c 100644
> --- a/drivers/gpu/drm/lima/lima_ctx.h
> +++ b/drivers/gpu/drm/lima/lima_ctx.h
> @@ -30,5 +30,6 @@ struct lima_ctx *lima_ctx_get(struct lima_ctx_mgr *mgr, u32 id);
>  void lima_ctx_put(struct lima_ctx *ctx);
>  void lima_ctx_mgr_init(struct lima_ctx_mgr *mgr);
>  void lima_ctx_mgr_fini(struct lima_ctx_mgr *mgr);
> +long lima_ctx_mgr_flush(struct lima_ctx_mgr *mgr, long timeout);
>  
>  #endif
> diff --git a/drivers/gpu/drm/lima/lima_drv.c b/drivers/gpu/drm/lima/lima_drv.c
> index 11ace5cebf4c..08169b0d9c28 100644
> --- a/drivers/gpu/drm/lima/lima_drv.c
> +++ b/drivers/gpu/drm/lima/lima_drv.c
> @@ -254,7 +254,22 @@ static const struct drm_ioctl_desc lima_drm_driver_ioctls[] = {
>  	DRM_IOCTL_DEF_DRV(LIMA_CTX_FREE, lima_ioctl_ctx_free, DRM_RENDER_ALLOW),
>  };
>  
> -DEFINE_DRM_GEM_FOPS(lima_drm_driver_fops);
> +static int lima_drm_driver_flush(struct file *filp, fl_owner_t id)
> +{
> +	struct drm_file *file = filp->private_data;
> +	struct lima_drm_priv *priv = file->driver_priv;
> +	long timeout = MAX_WAIT_SCHED_ENTITY_Q_EMPTY;
> +
> +	timeout = lima_ctx_mgr_flush(&priv->ctx_mgr, timeout);
> +
> +	return timeout >= 0 ? 0 : timeout;
> +}
> +
> +static const struct file_operations lima_drm_driver_fops = {
> +	.owner = THIS_MODULE,
> +	.flush = lima_drm_driver_flush,
> +	DRM_GEM_FOPS,
> +};
>  
>  /*
>   * Changelog:

