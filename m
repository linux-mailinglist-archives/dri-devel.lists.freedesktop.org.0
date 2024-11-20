Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C96F09D38BD
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 11:51:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BE5110E6F6;
	Wed, 20 Nov 2024 10:51:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="kx0OKOf/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2084.outbound.protection.outlook.com [40.107.236.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9186E10E6F6;
 Wed, 20 Nov 2024 10:51:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yr2UI+OgeOvai40RX4H8Cljs8DtHhGnMStlMlQTN5pY8f/1svOgBqFAgrswhtcm09rozXvCKkTcairquz75KLvZmge165tMHwJn3ENEh3oKlJX3pPmzK+tq75u2aNLWVL9uD2uUD5qbqC0swRaUQAL3CfibOAx4Hb7+/RdXrY1wlFqcH+zbum67wkbaNHhUIAda6KVJHfK0CCi8D2cwfxySrkc9Ka72R1WKKxrsCYiXfU1Pak5edLplMqxC60TUawrsD7C5xsZXi18+khInYmdbMQR7CDIMq9DH/LEgEWBo/yyJyYBPkqXs/byHRPLBTo9LknbB1HO2dBz1JktYwFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WYYy6sqG6HuamG9EQmehQfQr1VydR2DdfJmXYfRwIn0=;
 b=YWVC0elxCFvalUaUdKVc6eBKecrQFhkQxZyP/+td1to9ndqjVhPhT3w63Bv1Y+2yqz5NJBZ2yB9l7EiTFrObjMjfZMlzYhFjH17TakjaEkY7U3ixk6BkyPXk9x513+vvluwJKgrdN9G2Agh4HVkA+brN2O3Ak9FGVeMjjUpk5GSGptWmu7KWAQQqgorhmqiU/jsSBbIBwkQeqRZki7tol73WOBFbobvhK3bb7Iaomlksvre9hTF1HSHZJ/V4SrCv4trFpMXOHCmnM06m+QMG+e0+nAoer+NXgJD8JqzX3VSeOvpEbJQJD9+TKPsWQkr39VbqqPNBnzzS3a+K45mBng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WYYy6sqG6HuamG9EQmehQfQr1VydR2DdfJmXYfRwIn0=;
 b=kx0OKOf/pKQoNvKismznOYsiHD9HO6KuvaZGVJ/OrM3CoJu11Q9DsdnsPvAr+ocCqnVwc1cQ3ry4pGcw5XL1mZ9Sz7I/RSlvvL8bKcuf11MFQxWqXsborle/dqrc7x3zXolOsQRh1NvbTG1bMclSJXqsTdeq1CFg7LHDMwoEgAE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM6PR12MB4385.namprd12.prod.outlook.com (2603:10b6:5:2a6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Wed, 20 Nov
 2024 10:51:27 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8158.019; Wed, 20 Nov 2024
 10:51:27 +0000
Message-ID: <8709c4a6-549b-4e19-8bb7-f0d4740ff57d@amd.com>
Date: Wed, 20 Nov 2024 11:51:21 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 1/8] drm/ttm: Balance ttm_resource_cursor_init() and
 ttm_resource_cursor_fini()
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Paulo Zanoni <paulo.r.zanoni@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
References: <20241115150120.3280-1-thomas.hellstrom@linux.intel.com>
 <20241115150120.3280-2-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20241115150120.3280-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0240.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM6PR12MB4385:EE_
X-MS-Office365-Filtering-Correlation-Id: a770ab51-4123-48f8-db8d-08dd095148af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NHdGWWI3amVEM1prYy9YUnRnNlVUZHluMnJRVHQ2OTArNEM1a25Fcjd0VVNh?=
 =?utf-8?B?a0Y0bjBjSzAyQ3JubVAvSkFhQk9KMHljNmt5eExvRkhYQ1dBakZWNnZWeWpJ?=
 =?utf-8?B?WUI5blg4MWpVZ0FQeTlBNzJCNGVDZ29JUmp0TnNpNnN6cFI2T01HOXJJVUZo?=
 =?utf-8?B?YVlFQ2JTdVVlU2pQVXB1NWlhSitsL1AxNUNSYmgyTUJpSW5Ja3ZsNFJnbWpW?=
 =?utf-8?B?dkQ1YmRudWdYQk51NlJFY1dmc1FpL3IwYjhlTVVNcW1qQ2gxYmVuVUUvanFv?=
 =?utf-8?B?KzZGS3d2TkdJWnllajg0WnN6Uk1KR3BZbWxBUlJjTjNtNTYzbmc4dExBNk9r?=
 =?utf-8?B?SC9BUUx5bi9ub3ZjU0ZoRm5za21XNklqTWhvL0ZKYnVwTEk3N0sySzUwQzlN?=
 =?utf-8?B?d1B4Zk1UaXp6REhjRFMrSjVqUVl3cjN2QW5FbjRDLytxMlBXUENacjFPcURP?=
 =?utf-8?B?Zm5seVBsOXFwdEVpVHM1YjFrL0dWYlNmWFRTcnNHeVZwZ3UydVFJOHNvRTNO?=
 =?utf-8?B?V0kvMVVGUUV1bUcwaXlTRHJLaHphT3RjSndQWU1QOUE3WEs5dkcwMTU0OW5w?=
 =?utf-8?B?UTM2TFdrODFoZnY2RmF2eUU4NEduZDczRDA5aDZUZ0hLZlpnNERTWUVOVytG?=
 =?utf-8?B?dFhRbTJZbkx5V05kcmRUbUQxU1Z2cDEvdmhsd2hCQy9adC9RN2d4KzhhakZP?=
 =?utf-8?B?NlFjR2p0bFNjMGo0QmxjNSs0cm1sUkZoeEhxVFdNaFNZWE8zZFdXWThSSVVp?=
 =?utf-8?B?bTEwdVlIWnUxN3JwYlAvcUdTWDJ6MHdIemdMWEwyZzN4anNHNFNHTGhQWVJL?=
 =?utf-8?B?Uk9mL2ZzcE01Sk1XNkFxSFEyV2JUcTZpNUtjUmV1RkdXQ2FNMC8vdGZoTFE5?=
 =?utf-8?B?V0dIYzdxTnhZUm5XVi8yU0g4RTBtaEdxa2p0dVF6TVIwTkdaWUhJcVZzemtj?=
 =?utf-8?B?MFBkVEZ0MS9TQXM5SFpOeU1STDBEQUFnZVBPbkZVbGFsVG83S21rUUNrbUho?=
 =?utf-8?B?WHVucWJ4dWdrWTdYQzJJcmo5cnVPUDhqRk8xMXVCL0JiWTNVZnNobUY0cTdC?=
 =?utf-8?B?c2pTNmdmdUV6VFE3L0NLNG9PMzlQU0dDNlJ5SkNtSGpFSjh1c2VINjV1RStN?=
 =?utf-8?B?RUxtTXo3OWV3bExpdWZ1M0NjeVUwOTdmbHd5WURSbjRyYzlZZGYyNHcwRDlD?=
 =?utf-8?B?RFFkYWVvRFRGcDBiQXhJa0hCMCt4bG1UVDlRVFlDMTErUVBrVWE1YnNnMTZ6?=
 =?utf-8?B?L3dqQnBvcHBsRUpKQy9ETjh4Y2ltVzVEVmtEa2pJVUQyamZVSjJaeGxKUHhE?=
 =?utf-8?B?YTJLNzAzdE4zVUVMT3NxUWdUQWptNjJrQkF5RCsvUVNydG5kYUUzZVM0MDI0?=
 =?utf-8?B?VUxFQmFPTWs4bnQ3c2VFV1R5VVBoVTJTeVVRK2RabzR6bHd4SmFpeThTTkRu?=
 =?utf-8?B?NVhGZ3c5cGVEQ2NBa3RyYU01b0JPSVlYdUsreEsvZDFvQWovVXpCaGVXVmdR?=
 =?utf-8?B?LytMMm9YTEUzMFJacFRodlhwbzdEQnliRTdmUTJ4Kzl6bjk4RStmS0lIbnh3?=
 =?utf-8?B?eVlZQmtqSTIrMk9CTG9EVC9ScktkT3JlM0thNllYcTUwemdCWkJmUG50L0FS?=
 =?utf-8?B?OXNRT0YxT3d3Y01aQmhvR2xITnUvL1duY0g5VmFoT3JCL0MzbDYvU2EyZ28z?=
 =?utf-8?B?cWlrUHVXZ1pROHF3RGx2NjV5MXFhVGlJOHQxNTg0SnNqWW9iQXNSQnNxdS8w?=
 =?utf-8?Q?vX+JlYALy/Oi64hfL1VGhaCfJKUMRCmKUi5k9+4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZnJhZnJOZkhncUdtU01SZ3p0cEoyT2o1MDlTNVNmanNKb3JpWkdSTzdFYjVD?=
 =?utf-8?B?QmlNRnd6dzBqOWU1TzE4SWVjZ01lM0VEdkVaYXl0V3I5ZkhCT0lBcE1USzgz?=
 =?utf-8?B?R3E2VHk5TXpCY2Jic0t6RW5FUi8rd2VQRm9pM1ZDQmhkaWw1cGFaZHBPL1Ar?=
 =?utf-8?B?UHZsTzZLUnVseGdua2lCRldaSjdSUlZtTjhyZHgwTmNXeHhrNW1nZjJKNENY?=
 =?utf-8?B?ekVaU0IyR2RCd05kOTJMNWdzVU92c1ZCclNUbldoalZpUmVta2JmOENhQmF0?=
 =?utf-8?B?ZXhjK0pjWDZlMEN2L3Z0NjMzMnNnUlFWSTR0QldtNVhvRkFXbEdnMGFIU29i?=
 =?utf-8?B?WldnZ2dpQkVCaU5TRDRDZE9SdXlqUkhVTHE3Q0JrT20yaTBEWmsrclllTnRK?=
 =?utf-8?B?YTZuOHpNU2E3MC9yR1Z3Ny84c2djb0tHRkhtblExSXhRenNJWTdZaTdjUjRz?=
 =?utf-8?B?V3J0WEpoMnFGejhveVpSbDJqTWZXRmFNZzNzVXVhSzZQVzNZa0xVVjErdG5J?=
 =?utf-8?B?aUFzNlcyM1BNU0w4cEZ6bHlzckRFNm1vaHhkM2F4QUVRVnhSN292Nk42aFAv?=
 =?utf-8?B?MEowS2FIZ2R5RnVHcUJycFJXNEhLdngxS2Q2TXVPV1crRS9Lc0tqQXNFNkVu?=
 =?utf-8?B?SFpTS2wrTGNOR2lRTHpQY3Jmdk5Ob1VMQWwzNXVxQUNxbUkzeDIrUXdueHhV?=
 =?utf-8?B?akUzbXYrVjRsdC9HQzdjaXA5VjFEV1JJQUdyNUZtOFZLb1RxRUtCL1Vrd3NH?=
 =?utf-8?B?SGI5U3l1Rjh2L0ZDSTRqWGIrVk00Y2Z5ZmtvaEs1VXJ5MjNUSTFsd2o5V005?=
 =?utf-8?B?bzBNS3FOSXVoMnVDcGhGZnplem9PNUdidWpjMGV2QS9uNEZlMktYMjB4cTdH?=
 =?utf-8?B?bFJseldPUXo2RmFpbDUxNHQxSzhyRzlWcjFFRlRRUFJPY1VxUUFnYTRNbHBi?=
 =?utf-8?B?OVVzQ2FrR2paZzYwR3VnSXUwVkhyZzFia25mQUZ2eHpYOGk1R3p0NmhFYkVL?=
 =?utf-8?B?SlVYbE5tZlZ0VnVTc2JuV253bzFHT2VZOUlVci85OHl1WXduUkJTcWh3RzNk?=
 =?utf-8?B?UmlMVnY1L25MQzFLNmhnNVF4QWx2d1d4NGNHQmsxVzFONjN4NjNEN2NrT1pW?=
 =?utf-8?B?d3RFVFlXeUhRVEFnVjk1TEs2b2haM0hVNjcyajArSUdUdnkzU3l2RHNxL3Bx?=
 =?utf-8?B?TWZRa3NhaUFFZWZaRVk2SzNHTmo4V0FXZDFYM0VSQlBRcFBpNHVkZ3RzNmZH?=
 =?utf-8?B?dEcyRnJPdTZCVGNMVW1lOG00RGFqeHMrT2hWakhnNlhUT0ZDajBkc2p0MmxV?=
 =?utf-8?B?cjNaK0oxTCtnakpYbFFsLzBscFVMOG1MKzZxM3MrYnJ6OXRLWUsvQ1lPOGY0?=
 =?utf-8?B?SE9kNTZSb1RsYVVreS9zWUtscmMvWXhsamJYMlgxZVR3bFd5em1ZNktqbmdR?=
 =?utf-8?B?WjFVL0luaERRczJ0c3pMS1puKzAvSlAweGtSYWIxK1E0aHgxSnpkTDRiTUpX?=
 =?utf-8?B?d3phRFdIeHRYYzJzY1lyREVqTlZCNTBVVmZFSzRjdUhiNzExRzNHTDdibkFm?=
 =?utf-8?B?R0ZlK0lZQ3VBMUJuTDJhZXZHOVJ0d3JUeXRHTDdSOVRUV0tjNmlXYVVVcE10?=
 =?utf-8?B?bUNPY1E5ajBDaDVzelB5TTBSbFdxb0tUYzdzalE5TE5NS0FmaHYvZVdNOHZX?=
 =?utf-8?B?SWxDbHFITzhaSXpVSmczMkNhV2Y3c05ZV3BmMlNucnpSNkpRQmpTcUMrUzVq?=
 =?utf-8?B?UDdZRmM0KzdVTklNc3FodFljQkdlcVRlV1diOVlRb05uc2lyN0U5SU5aQkNi?=
 =?utf-8?B?b2gzY0VrTmRXZ3NsMXQvZUVLRjJidDFSRTA3Rjk2ck0zd2hrZXo3d1Q1S0Rq?=
 =?utf-8?B?cTlIWklqRnorWEhZVWlwZ1N0eUcrRnA2WUJISytlZ1JCU2UxWlY0a3J1bW5N?=
 =?utf-8?B?SE9BRHQ1bWgwZmRITnNFYjczemRUa2REUHFldk1HZm8zYndIRXFCeWVzTWEw?=
 =?utf-8?B?OUcrOHRrZW9tM0xNaGV4S1JNQmppV0cxS1pYNEhlYTJrMkxNZ3JIamdYV2xN?=
 =?utf-8?B?dFFpNzFHZHFuTnloNG1aeTYrbHlBek1zRG56RkxQQ3VrOUx3RU1RZVRGZWFs?=
 =?utf-8?Q?FZqX6MH8H49beTGFTCbPPW7oN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a770ab51-4123-48f8-db8d-08dd095148af
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2024 10:51:27.5820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fcmleyBJuWK7OzOZzguewbyHoozwwP7kBHuak/KUZxyS67pISPW0X4j3g/hE0F/Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4385
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

Am 15.11.24 um 16:01 schrieb Thomas Hellström:
> Make the interface more symmetric by providing and using a
> ttm_resource_cursor_init().
>
> v10:
> - Fix a stray newline (Matthew Brost)
> - Update kerneldoc (Matthew Brost)
>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Christian König <christian.koenig@amd.com>

Did you plan to merge this through drm-misc-next or the XE branch?

If through drm-misc-next then I would go ahead and push this patch since 
that is really a stand alone cleanup.

Regards,
Christian.

> ---
>   drivers/gpu/drm/ttm/ttm_bo.c       |  3 ++-
>   drivers/gpu/drm/ttm/ttm_bo_util.c  |  3 ++-
>   drivers/gpu/drm/ttm/ttm_resource.c | 35 ++++++++++++++++++++----------
>   include/drm/ttm/ttm_resource.h     | 11 +++++-----
>   4 files changed, 34 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 48c5365efca1..06d6a452c4f4 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -450,7 +450,8 @@ int ttm_bo_evict_first(struct ttm_device *bdev, struct ttm_resource_manager *man
>   	int ret = 0;
>   
>   	spin_lock(&bdev->lru_lock);
> -	res = ttm_resource_manager_first(man, &cursor);
> +	ttm_resource_cursor_init(&cursor, man);
> +	res = ttm_resource_manager_first(&cursor);
>   	ttm_resource_cursor_fini(&cursor);
>   	if (!res) {
>   		ret = -ENOENT;
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index d939925efa81..917096bd5f68 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -865,7 +865,8 @@ s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
>   	s64 lret;
>   
>   	spin_lock(&bdev->lru_lock);
> -	ttm_resource_manager_for_each_res(man, &cursor, res) {
> +	ttm_resource_cursor_init(&cursor, man);
> +	ttm_resource_manager_for_each_res(&cursor, res) {
>   		struct ttm_buffer_object *bo = res->bo;
>   		bool bo_needs_unlock = false;
>   		bool bo_locked = false;
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index a87665eb28a6..e19360cc7930 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -81,6 +81,23 @@ static void ttm_bulk_move_drop_cursors(struct ttm_lru_bulk_move *bulk)
>   		ttm_resource_cursor_clear_bulk(cursor);
>   }
>   
> +/**
> + * ttm_resource_cursor_init() - Initialize a struct ttm_resource_cursor
> + * @cursor: The cursor to initialize.
> + * @man: The resource manager.
> + *
> + * Initialize the cursor before using it for iteration.
> + */
> +void ttm_resource_cursor_init(struct ttm_resource_cursor *cursor,
> +			      struct ttm_resource_manager *man)
> +{
> +	cursor->priority = 0;
> +	cursor->man = man;
> +	ttm_lru_item_init(&cursor->hitch, TTM_LRU_HITCH);
> +	INIT_LIST_HEAD(&cursor->bulk_link);
> +	INIT_LIST_HEAD(&cursor->hitch.link);
> +}
> +
>   /**
>    * ttm_resource_cursor_fini() - Finalize the LRU list cursor usage
>    * @cursor: The struct ttm_resource_cursor to finalize.
> @@ -593,7 +610,6 @@ ttm_resource_cursor_check_bulk(struct ttm_resource_cursor *cursor,
>   /**
>    * ttm_resource_manager_first() - Start iterating over the resources
>    * of a resource manager
> - * @man: resource manager to iterate over
>    * @cursor: cursor to record the position
>    *
>    * Initializes the cursor and starts iterating. When done iterating,
> @@ -602,17 +618,16 @@ ttm_resource_cursor_check_bulk(struct ttm_resource_cursor *cursor,
>    * Return: The first resource from the resource manager.
>    */
>   struct ttm_resource *
> -ttm_resource_manager_first(struct ttm_resource_manager *man,
> -			   struct ttm_resource_cursor *cursor)
> +ttm_resource_manager_first(struct ttm_resource_cursor *cursor)
>   {
> -	lockdep_assert_held(&man->bdev->lru_lock);
> +	struct ttm_resource_manager *man = cursor->man;
>   
> -	cursor->priority = 0;
> -	cursor->man = man;
> -	ttm_lru_item_init(&cursor->hitch, TTM_LRU_HITCH);
> -	INIT_LIST_HEAD(&cursor->bulk_link);
> -	list_add(&cursor->hitch.link, &man->lru[cursor->priority]);
> +	if (WARN_ON_ONCE(!man))
> +		return NULL;
> +
> +	lockdep_assert_held(&man->bdev->lru_lock);
>   
> +	list_move(&cursor->hitch.link, &man->lru[cursor->priority]);
>   	return ttm_resource_manager_next(cursor);
>   }
>   
> @@ -648,8 +663,6 @@ ttm_resource_manager_next(struct ttm_resource_cursor *cursor)
>   		ttm_resource_cursor_clear_bulk(cursor);
>   	}
>   
> -	ttm_resource_cursor_fini(cursor);
> -
>   	return NULL;
>   }
>   
> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
> index be034be56ba1..e1f3b95d73b6 100644
> --- a/include/drm/ttm/ttm_resource.h
> +++ b/include/drm/ttm/ttm_resource.h
> @@ -325,6 +325,9 @@ struct ttm_resource_cursor {
>   	unsigned int priority;
>   };
>   
> +void ttm_resource_cursor_init(struct ttm_resource_cursor *cursor,
> +			      struct ttm_resource_manager *man);
> +
>   void ttm_resource_cursor_fini(struct ttm_resource_cursor *cursor);
>   
>   /**
> @@ -456,8 +459,7 @@ void ttm_resource_manager_debug(struct ttm_resource_manager *man,
>   				struct drm_printer *p);
>   
>   struct ttm_resource *
> -ttm_resource_manager_first(struct ttm_resource_manager *man,
> -			   struct ttm_resource_cursor *cursor);
> +ttm_resource_manager_first(struct ttm_resource_cursor *cursor);
>   struct ttm_resource *
>   ttm_resource_manager_next(struct ttm_resource_cursor *cursor);
>   
> @@ -466,14 +468,13 @@ ttm_lru_first_res_or_null(struct list_head *head);
>   
>   /**
>    * ttm_resource_manager_for_each_res - iterate over all resources
> - * @man: the resource manager
>    * @cursor: struct ttm_resource_cursor for the current position
>    * @res: the current resource
>    *
>    * Iterate over all the evictable resources in a resource manager.
>    */
> -#define ttm_resource_manager_for_each_res(man, cursor, res)		\
> -	for (res = ttm_resource_manager_first(man, cursor); res;	\
> +#define ttm_resource_manager_for_each_res(cursor, res)	\
> +	for (res = ttm_resource_manager_first(cursor); res;	\
>   	     res = ttm_resource_manager_next(cursor))
>   
>   struct ttm_kmap_iter *

