Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CF8AA733E
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 15:19:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B45DC10E1A3;
	Fri,  2 May 2025 13:19:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zMp9Fbks";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2076.outbound.protection.outlook.com [40.107.100.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A39D510E061;
 Fri,  2 May 2025 13:18:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KBj7d91232pLYcNkCt6WQvk9Wtk91x1Hts9apCRaG2T0uNzZUop8EfkJhm8zG5EenPFYPOUQWvJ8V/FYs56uLRpk2yVGr2HnQWid3ijFCIt2ons8k9nl21OY0CubXNlDaYfJYCTp3tBnP7mIteckDJ6jZsNAkx5QyZwcYLvofKSxo8m8JA4woy5vDeR/HJ9giPw4GBAgw1VYl2tcEhtZgcNYFCIgdSckcngQ3sEk18sXWrCnG2zztELPuWi99h8Z3u7yr7uKRlebNkNIUCQBani1OlmkkHmp0e7uqayjk4HnuE6Lo1+JT4XNcHIqupuUBvRHdq0q26CoCKNpfmWj8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oAVTLyhrPz7rE1e3K3rQatkSHytdSeaqfV9GE0Z+dTc=;
 b=hezGi+nqesXvU3uV0uLE4OQgh5RlPCAXkLM+pI8eC/HcLMCJPUsA8liYH0g4AznHjcDgsOgZPGHwsJ6WysyA3k4Pg83Xi8YJ7ExgKhLn2qo574zp+7TS/AEOMfeTPf9SO2IyqQcQPU66kMuBER1K8wOidwD6kZU6X02rYKlAB3HkFS3riioy5zukwTpWHN065g8QC0PEdogIwpDuEqHBqoKPtJfK48ePu8mJU/B+JkU77aXQnrYZM0Rjv3mKD9EdMnojNGFdVh1XjvV5GGoli+uH+SSJ8myd3gmM9dGqpWf3qhmm1/HxiEwUpLbiDu1WlQDXNjSMJUWvvKOZy+ykbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oAVTLyhrPz7rE1e3K3rQatkSHytdSeaqfV9GE0Z+dTc=;
 b=zMp9FbksC/Y4ZNEIOgka5+wREduZS+QlI3QiJLuOkTXF1fC6G85mpInQBrStU+iLGUvZ4Sv0xqeXH4gmbIUTZ2GO9y+MX70XGBrSTbXY+Yt3pbTTi2J/QOP2NRUqX8lL1ZO3RLtm29FK9Bucj02vHfEceGlmaCLrdKHSDGhiBzU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB9203.namprd12.prod.outlook.com (2603:10b6:510:2f2::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.22; Fri, 2 May
 2025 13:18:55 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8678.028; Fri, 2 May 2025
 13:18:55 +0000
Message-ID: <baccc7de-9ce9-471a-93c5-319a7ed2cc57@amd.com>
Date: Fri, 2 May 2025 15:18:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm: Remove the struct ttm_backup abstraction
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>, 
 Dave Airlie <airlied@redhat.com>, Matthew Auld <matthew.auld@intel.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Kees Cook <kees@kernel.org>
References: <20250502130014.3156-1-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250502130014.3156-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN0PR04CA0005.namprd04.prod.outlook.com
 (2603:10b6:208:52d::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB9203:EE_
X-MS-Office365-Filtering-Correlation-Id: 59f0454d-266f-4054-3161-08dd897be3a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R1c3WS9EaGFmWEF0bXR4YlN6NWU3SWN1TTJMWks3N01VOEVDcnJRSlRpWGNX?=
 =?utf-8?B?MXVWMjU3N0thVi8vTk9xeG5mV2NTVE1OV3NXdURYZFFsVmVFd3orWWNEOXpE?=
 =?utf-8?B?YzFPT0JzcUMzRUw4YUZLcm5kSE92MTZUSFRDZXcvV1dBTCtjT3BqMk9yVjFl?=
 =?utf-8?B?YVdXZGVLQmRwNFV0d0pBOW0zRTFmOXozUmE0NFdjSFY2WDE4Um12bkVOYVhR?=
 =?utf-8?B?ckpzbjVIRmV4RHNkVXQ5NEFkRVRKSUZJWThiWk1IRGtLd0RoMWRvaC9leGlP?=
 =?utf-8?B?c29rSW1uNWI4S2I0cjlMTTZvUTFLYnVGQXdjS1R6SDVlSHRBSm5VVXdSNG4z?=
 =?utf-8?B?anFFcmM0emVBcFdYWVlZWE1oSzI2emlwZEovRU9DZHd1QzhkNzUrUktUSW9M?=
 =?utf-8?B?UVlBM3FJVlVjZVViVXBDRVpLSk0xSmsxLzdVTy9BemFDQmZDRkljNDdpZ1ky?=
 =?utf-8?B?Vmd6b3B4YnBxRWxGM0FUU3h2cHBRRm9UY2hhcktkdGhIbFdoMWtBcElSemE1?=
 =?utf-8?B?VzdOK3BKOS8vaE1mWTlnYmkwZDhCUTl3a25IMldYR2RQQWtJTEdib0h5bEVQ?=
 =?utf-8?B?Z0xtQlpQOEpQS2IwNEIrQy8yN0NqMFczeHY2cDFkcWZ2bjFoLzRiREZPK1NX?=
 =?utf-8?B?WjRjaDZnaGlMc3FnM2ZUSGtjeEM1dGtDV3J5LzZLbkpyMlVWbWdFNU5WWm1k?=
 =?utf-8?B?UkZUSThGQS84MUVmbUZzQmFoNjdMcUNyeTRpT0h2SFUzemxoOHZJOXhRTjJG?=
 =?utf-8?B?OWVqeGpzZG43ZUUrNDhnYzBQRWhCM3RXTEJaRDlWRFJsSzZwRDhuQmxFNGRl?=
 =?utf-8?B?aWVUaGpzYlJoNi8zS0o3MHI0UkV5cFdCWDEzblFTeFVxdlF1Zys5Y1BGbUxH?=
 =?utf-8?B?c2U5OURja3NSU1lNRThFL3RWaUJJcmlQbHl4bndxbHhtQngvRER1dmFVa3or?=
 =?utf-8?B?SFdaR1FuUlhwdVdaV1N6bXFOYkVDN3RvK0dVS2NWYlZ1S0E5c096S0dIeGhQ?=
 =?utf-8?B?Q2JySnJuS3dSekdyNThMRkFYNGxrd0RVcWpLVmkrNk55RkFhcTNzbzA2V3Q4?=
 =?utf-8?B?VnBCSDhYZXNuNmdFQ1p4WFRMNkg0RUx3ODRDL0Ztb3Zod2h6WktqenM2Q1JG?=
 =?utf-8?B?Z3VCTHBCblpNMFUxbnd2RTVUaHhZM2pieENNNERIRmNnNjE2SmI4WkhPN2k5?=
 =?utf-8?B?ZTFJZHFuSTZWVEkvR1hUZXg3Nnd2QlBwNkdPUnYxbWlXaFZUS1dEYlVDcHFQ?=
 =?utf-8?B?cGdyS0xabDBYYlhuWW1uUmpWKzdDU3lPMWVEMUFMOVBBenZvV1EraXVTTEx5?=
 =?utf-8?B?QnUwaHRtTjRXWFIvNUlQQ2lVbEZ5MnlXMHNmY1FkT1JsMTd5UUZnQ01SWCta?=
 =?utf-8?B?UE1MTjJ3cWE4L05YVTJENUJuKzFydDBSaGRZVUU5Ui9aS3ZaQ3FQSFJGR1c0?=
 =?utf-8?B?aWdFNHZhWlIwS1h4QlZhdlNZSjZHSlJPQ1NSQ2NPMnU3MlJGWHQwRDhLaS9F?=
 =?utf-8?B?Mml1US9CUkpYcFRtOGNIcWd5VTBvY0xQaDdBT1NVR3dMTVMvdEJTZHBXR3ds?=
 =?utf-8?B?QUF6ZTgxeWtRa1VtdlpWajlUb0RQZktDY1pmdDA2SGsrN0dudXlvQXBNRG1R?=
 =?utf-8?B?RDdSd1FvbWFiakxCcG9UenVJSG0yRXB6aXNtVDg4ZFprRUhOK2FQYW9UcUZG?=
 =?utf-8?B?MStSMXU4VDk1bzIxSHNnRHFuMmJ3MjNJdlpHcVFqTVJ2OHlKRHBzVm55YXNE?=
 =?utf-8?B?dWRqQVhHamMwYWNNbVlPQnlhZTd4U2QvazFJR2xxNU5qaUw1OUovYmFlRTJE?=
 =?utf-8?Q?Neok9+N8h3d8T6fDsPEQVge2PCNlG5syr31h4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2p3Zmx5enRSWUE1emFuQnJhaHQrbWlkNkViTWEvSHRrdC9SOHRvUmRSYUJ6?=
 =?utf-8?B?M29uL08vV0ZQSEdjbnVKM0JsbmdRaERLUHUxbEVRdjdtTzNlY0oybVZuazJs?=
 =?utf-8?B?QzFlWjRUUE90OG9tTjVpM3BZTUJpdGhwWWNmblhnTXdXaDBUd3BkNFVnMjVX?=
 =?utf-8?B?TmRvb2NDdDZSVisrQUxKaWt4Y0lPUk5SaVJKbDd2bGNxVXlNQWI1bFNlRndD?=
 =?utf-8?B?ak9XZnBoMkNDTzBEL0RSbFVLbUNzbkNhdDRmQXltQzMyWnlqMm1OVGt4S0RM?=
 =?utf-8?B?aUhEYVdpNFdvM0lWNHBsSnN1MUord1FHTkpObHpEM2ZvRU1GQy9jNSswNVIr?=
 =?utf-8?B?M1BnR2VZMzVCT1VTblk1MHdEdm42ZXdrVXJEUENoeVFPTFpUdzh4NS9oUGNq?=
 =?utf-8?B?dDVKNHN6NkdrOHZYZE5weTJmanRzWmJGRUFmd0lFZnc0Y05tVHZLeDBWVUdE?=
 =?utf-8?B?bXR4TElwcUlxVWp4amR4NGNNSjRFZTFEMTBnZ1F2QXQrYnVRd0tHQ29sVDF1?=
 =?utf-8?B?djRQcTB1NEdENWdYWlBPTkNmb0w2ZHdmN2NQZWxSWmhEaFhwSUxCVHEvNUUx?=
 =?utf-8?B?QjV5Y21NUTNHRmVDL2QzVmxKd3VRMHZZQklvZ3hmVzRuMm9oaWxJaElGRk5K?=
 =?utf-8?B?SjRvMDJRNGhCdFZFRllJMkIyUEZFaE90bjBPQ2FGSGN2NzRjMkkwbDFZeWhW?=
 =?utf-8?B?VGRKeUtuT1VYSHJQWUpTb29sL010SmFwdmNhY2U0Zk1YWlU3S2FKc3pCeURT?=
 =?utf-8?B?ZWJDZHhNNDQrZWVTTEtteDJXK2xyYnE4cFBFd1QzaFNDVVpxWG1wWGdVeWdR?=
 =?utf-8?B?c2hYUlVkSlZJVllERWZnZFIzLzM5ejl0YmUwY2NHVHBCRFRzcUpZTlBhTHZq?=
 =?utf-8?B?TnlCMjBDbXhRWm9ETjl4MEtIYzBoTWVGYkE3MzA0NEM1dVBGd3daeWtZQ3Rr?=
 =?utf-8?B?YVpsa1Z4VGdHTi9USWR4WEJMYkh5N21XTWhVMzFFeEhOTFprZ3lDa0loZzh5?=
 =?utf-8?B?cTl2RHNHa3Q4c1Brc2M0RzhwZTVLNmp3NDlpb1F3bDZGTGdTSWdRTlkrcnNG?=
 =?utf-8?B?bm9jOWhXY0NqUzVuS3k2MEtidTZkVzJCWGl6b3hVR1psNGMvamprWld5NGw2?=
 =?utf-8?B?TXZyaGpYTWpsTkNaRHAwUmdiOEdqdGVVSkdLTmlyUi9GWUlTV2t3YkRrb1RB?=
 =?utf-8?B?eHZyS1lEbHNhNWYyQllNc2tOVmR2c25ONVFVKy8vRThnTUtuWldmTmhLNXFL?=
 =?utf-8?B?ZnFYUC9aSWd6V1kxbllkVFRlRXBsNmkzOWROTko1YTU5TDl3WmJMZXRTMFdO?=
 =?utf-8?B?Y0NLSitZU2I1SDNGcnR0eEkzd0p5ckJ4bC9zZVFPdVFYekJPNEltenBqU0hM?=
 =?utf-8?B?TnpxcHp0T1A3Q24ya0FOZkNXdm82N3FlbHlhemtnekR2WEhQUjU3RzM4cWND?=
 =?utf-8?B?c09CaEtXUkljallvWUNjMHFvSnFmbnJER2pIempobEw1K1RsRHZtcFFHSk05?=
 =?utf-8?B?WFZuVk1wbkNkRks5WXBoTTQ2U2pTbysxa21sb3JMUk9UM05DNmQvcStjYnYw?=
 =?utf-8?B?QkdzMlkzbzNkSkFqYUlXTllpWnY3N0hVTHRCay91TjZmTFpSd3VQeEowbWIv?=
 =?utf-8?B?cStRaVJrU2M3aTBmUG5ZM1ZLVEhoVGQvNHB0NjlaalUvWGpBd2xmaFhKeFF3?=
 =?utf-8?B?Y3NDZlR1WjQ0Y2pZV24vb2RPTlhma0R1OHZxdnExUHl5ZmdtM0lrU1V6M2ZT?=
 =?utf-8?B?ckdhZWJ6UkJFUFNVQmZxZXNXcUFUTkJlRjN1Q29FOURTRVlhejNlMzhrQTJC?=
 =?utf-8?B?bWFqNEs0c0hFaW4xMWhaSjU0c2JWc0dNa1Z0aHNXcU5qU1VjaVdsMFBYaUNM?=
 =?utf-8?B?UjZCRHh2bFdvZG40T1cxZGZZY05ONnZENUJqenY1ZWpUcWhtRnIyditGTjg3?=
 =?utf-8?B?TlBXNkxQNHd3a0NRRm9BNGhXcno1Ykh0ZnE3S3JhVFRQYjVOdUZVMlp1eGVj?=
 =?utf-8?B?UGlTellmbWJ5Y1hTWGVZWk9GQVkwY2U3Q2tRQkJZT002VUpwVUY4QW1Rbnp6?=
 =?utf-8?B?d014elN2YThubS90ZXFqQnliVy9scDNlNzdoRzBmYitUY0QzZ2NmSkFEdGxW?=
 =?utf-8?Q?4M+Ymjzn22lYGrj0x0zd8IG/U?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59f0454d-266f-4054-3161-08dd897be3a4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 13:18:55.0634 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X3TxUslK7trHOjkWqmeOGjlMMmptB5GanjwybpQpMK/+5SaWfSoFlVakSXMGzq0D
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9203
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

On 5/2/25 15:00, Thomas Hellström wrote:
> The abstraction was previously added to support separate
> ttm_backup implementations.
> 
> However with the current implementation casting from a
> struct file to a struct ttm_backup, we run into trouble since
> struct file may have randomized the layout and gcc complains.
> 
> Remove the struct ttm_backup abstraction
> 
> Cc: dri-devel@lists.freedesktop.org
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Al Viro <viro@zeniv.linux.org.uk>
> Reported-by: Kees Cook <kees@kernel.org>
> Closes: https://lore.kernel.org/dri-devel/9c8dbbafdaf9f3f089da2cde5a772d69579b3795.camel@linux.intel.com/T/#mb153ab9216cb813b92bdeb36f391ad4808c2ba29
> Suggested-by: Christian König <christian.koenig@amd.com>
> Fixes: 70d645deac98 ("drm/ttm: Add helpers for shrinking")
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/ttm/ttm_backup.c | 42 +++++++++-----------------------
>  drivers/gpu/drm/ttm/ttm_pool.c   |  6 ++---
>  drivers/gpu/drm/ttm/ttm_tt.c     |  2 +-
>  include/drm/ttm/ttm_backup.h     | 12 ++++-----
>  include/drm/ttm/ttm_tt.h         |  2 +-
>  5 files changed, 21 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_backup.c b/drivers/gpu/drm/ttm/ttm_backup.c
> index 93c007f18855..9b3b5624c3eb 100644
> --- a/drivers/gpu/drm/ttm/ttm_backup.c
> +++ b/drivers/gpu/drm/ttm/ttm_backup.c
> @@ -7,20 +7,6 @@
>  #include <linux/page-flags.h>
>  #include <linux/swap.h>
>  
> -/*
> - * Casting from randomized struct file * to struct ttm_backup * is fine since
> - * struct ttm_backup is never defined nor dereferenced.
> - */
> -static struct file *ttm_backup_to_file(struct ttm_backup *backup)
> -{
> -	return (void *)backup;
> -}
> -
> -static struct ttm_backup *ttm_file_to_backup(struct file *file)
> -{
> -	return (void *)file;
> -}
> -
>  /*
>   * Need to map shmem indices to handle since a handle value
>   * of 0 means error, following the swp_entry_t convention.
> @@ -40,12 +26,12 @@ static pgoff_t ttm_backup_handle_to_shmem_idx(pgoff_t handle)
>   * @backup: The struct backup pointer used to obtain the handle
>   * @handle: The handle obtained from the @backup_page function.
>   */
> -void ttm_backup_drop(struct ttm_backup *backup, pgoff_t handle)
> +void ttm_backup_drop(struct file *backup, pgoff_t handle)
>  {
>  	loff_t start = ttm_backup_handle_to_shmem_idx(handle);
>  
>  	start <<= PAGE_SHIFT;
> -	shmem_truncate_range(file_inode(ttm_backup_to_file(backup)), start,
> +	shmem_truncate_range(file_inode(backup), start,
>  			     start + PAGE_SIZE - 1);
>  }
>  
> @@ -60,11 +46,10 @@ void ttm_backup_drop(struct ttm_backup *backup, pgoff_t handle)
>   * Return: 0 on success, Negative error code on failure, notably
>   * -EINTR if @intr was set to true and a signal is pending.
>   */
> -int ttm_backup_copy_page(struct ttm_backup *backup, struct page *dst,
> +int ttm_backup_copy_page(struct file *backup, struct page *dst,
>  			 pgoff_t handle, bool intr)
>  {
> -	struct file *filp = ttm_backup_to_file(backup);
> -	struct address_space *mapping = filp->f_mapping;
> +	struct address_space *mapping = backup->f_mapping;
>  	struct folio *from_folio;
>  	pgoff_t idx = ttm_backup_handle_to_shmem_idx(handle);
>  
> @@ -106,12 +91,11 @@ int ttm_backup_copy_page(struct ttm_backup *backup, struct page *dst,
>   * the folio size- and usage.
>   */
>  s64
> -ttm_backup_backup_page(struct ttm_backup *backup, struct page *page,
> +ttm_backup_backup_page(struct file *backup, struct page *page,
>  		       bool writeback, pgoff_t idx, gfp_t page_gfp,
>  		       gfp_t alloc_gfp)
>  {
> -	struct file *filp = ttm_backup_to_file(backup);
> -	struct address_space *mapping = filp->f_mapping;
> +	struct address_space *mapping = backup->f_mapping;
>  	unsigned long handle = 0;
>  	struct folio *to_folio;
>  	int ret;
> @@ -161,9 +145,9 @@ ttm_backup_backup_page(struct ttm_backup *backup, struct page *page,
>   *
>   * After a call to this function, it's illegal to use the @backup pointer.
>   */
> -void ttm_backup_fini(struct ttm_backup *backup)
> +void ttm_backup_fini(struct file *backup)
>  {
> -	fput(ttm_backup_to_file(backup));
> +	fput(backup);
>  }
>  
>  /**
> @@ -194,14 +178,10 @@ EXPORT_SYMBOL_GPL(ttm_backup_bytes_avail);
>   *
>   * Create a backup utilizing shmem objects.
>   *
> - * Return: A pointer to a struct ttm_backup on success,
> + * Return: A pointer to a struct file on success,
>   * an error pointer on error.
>   */
> -struct ttm_backup *ttm_backup_shmem_create(loff_t size)
> +struct file *ttm_backup_shmem_create(loff_t size)
>  {
> -	struct file *filp;
> -
> -	filp = shmem_file_setup("ttm shmem backup", size, 0);
> -
> -	return ttm_file_to_backup(filp);
> +	return shmem_file_setup("ttm shmem backup", size, 0);
>  }
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index 83b10706ba89..c2ea865be657 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -506,7 +506,7 @@ static void ttm_pool_allocated_page_commit(struct page *allocated,
>   * if successful, populate the page-table and dma-address arrays.
>   */
>  static int ttm_pool_restore_commit(struct ttm_pool_tt_restore *restore,
> -				   struct ttm_backup *backup,
> +				   struct file *backup,
>  				   const struct ttm_operation_ctx *ctx,
>  				   struct ttm_pool_alloc_state *alloc)
>  
> @@ -655,7 +655,7 @@ static void ttm_pool_free_range(struct ttm_pool *pool, struct ttm_tt *tt,
>  				pgoff_t start_page, pgoff_t end_page)
>  {
>  	struct page **pages = &tt->pages[start_page];
> -	struct ttm_backup *backup = tt->backup;
> +	struct file *backup = tt->backup;
>  	pgoff_t i, nr;
>  
>  	for (i = start_page; i < end_page; i += nr, pages += nr) {
> @@ -963,7 +963,7 @@ void ttm_pool_drop_backed_up(struct ttm_tt *tt)
>  long ttm_pool_backup(struct ttm_pool *pool, struct ttm_tt *tt,
>  		     const struct ttm_backup_flags *flags)
>  {
> -	struct ttm_backup *backup = tt->backup;
> +	struct file *backup = tt->backup;
>  	struct page *page;
>  	unsigned long handle;
>  	gfp_t alloc_gfp;
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index df0aa6c4b8b8..698cd4bf5e46 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -544,7 +544,7 @@ EXPORT_SYMBOL(ttm_tt_pages_limit);
>   */
>  int ttm_tt_setup_backup(struct ttm_tt *tt)
>  {
> -	struct ttm_backup *backup =
> +	struct file *backup =
>  		ttm_backup_shmem_create(((loff_t)tt->num_pages) << PAGE_SHIFT);
>  
>  	if (WARN_ON_ONCE(!(tt->page_flags & TTM_TT_FLAG_EXTERNAL_MAPPABLE)))
> diff --git a/include/drm/ttm/ttm_backup.h b/include/drm/ttm/ttm_backup.h
> index 24ad120b8827..4da7c825088f 100644
> --- a/include/drm/ttm/ttm_backup.h
> +++ b/include/drm/ttm/ttm_backup.h
> @@ -9,8 +9,6 @@
>  #include <linux/mm_types.h>
>  #include <linux/shmem_fs.h>
>  
> -struct ttm_backup;
> -
>  /**
>   * ttm_backup_handle_to_page_ptr() - Convert handle to struct page pointer
>   * @handle: The handle to convert.
> @@ -55,20 +53,20 @@ ttm_backup_page_ptr_to_handle(const struct page *page)
>  	return (unsigned long)page >> 1;
>  }
>  
> -void ttm_backup_drop(struct ttm_backup *backup, pgoff_t handle);
> +void ttm_backup_drop(struct file *backup, pgoff_t handle);
>  
> -int ttm_backup_copy_page(struct ttm_backup *backup, struct page *dst,
> +int ttm_backup_copy_page(struct file *backup, struct page *dst,
>  			 pgoff_t handle, bool intr);
>  
>  s64
> -ttm_backup_backup_page(struct ttm_backup *backup, struct page *page,
> +ttm_backup_backup_page(struct file *backup, struct page *page,
>  		       bool writeback, pgoff_t idx, gfp_t page_gfp,
>  		       gfp_t alloc_gfp);
>  
> -void ttm_backup_fini(struct ttm_backup *backup);
> +void ttm_backup_fini(struct file *backup);
>  
>  u64 ttm_backup_bytes_avail(void);
>  
> -struct ttm_backup *ttm_backup_shmem_create(loff_t size);
> +struct file *ttm_backup_shmem_create(loff_t size);
>  
>  #endif
> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
> index 13cf47f3322f..406437ad674b 100644
> --- a/include/drm/ttm/ttm_tt.h
> +++ b/include/drm/ttm/ttm_tt.h
> @@ -118,7 +118,7 @@ struct ttm_tt {
>  	 * ttm_tt_create() callback is responsible for assigning
>  	 * this field.
>  	 */
> -	struct ttm_backup *backup;
> +	struct file *backup;
>  	/**
>  	 * @caching: The current caching state of the pages, see enum
>  	 * ttm_caching.

