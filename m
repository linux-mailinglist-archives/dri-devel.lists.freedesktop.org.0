Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB98CAEDCF7
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 14:36:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AD3D10E439;
	Mon, 30 Jun 2025 12:36:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="j96huOfN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2044.outbound.protection.outlook.com [40.107.94.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77B3610E431;
 Mon, 30 Jun 2025 12:36:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fg/S2+/wCVtVy5UryNDkGPZjwLi3Ddc6eJ3Qm/hBW/dtVV1SaP+QtVC0kR7QXcb78l6UK4BGH1LVRbdT5CGprtNk6l6Twyv4iTtUWq7vYqp6KRMSoB5m0Jia6E64EVmeTdDzo3Euso5lXdWJDPpHo4YwdeqAv3CDu8KFVW7L8yl9piala3vhyoAAf+8wI0jyJCCTDulOrgxgoQXdu7IF7516VrtSQy/4BM2qSvhO+ESqHL8J3dILS658nvWBe2sbncQy5C2Zdx/reV/JOKMfiBMkD+8gQOI+EGCCkopChCM2soSdjaL+YYGMv0XS+gJdkf16kHlUS6dHoNuRFSRCAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ciFh0vfETp1mB69svSPQI+PGB4h+VcN9nR4y+wZuuAo=;
 b=nzlA4CKeKuQK3f9zJFFyya9J7UvsyrkWiL3+TY8Sl73Dzc1XIUP8qt/ukXLonpSgFK/JJ6+pBDvRyCaRCOc8S22auGkHQuw4Gx5IFdXjeFBLxuq48MKMEMFk59sJIfytuO7XFgpOuwvW+A9K42WnaTtVUOw9+yAi4kbHW3xZY0kAy5J/6IX0UzYTw7spieDvTKU6JzFm9w+wX4+MIcDGmtPmcf/+AK9et7sAOh1flBKg3yw24A+GDRWwdZ1PlN++Kwm2ovliJWmMnTAwN5pr0GnPAAoxKEN6lAzgpjFYLSNiuLL0JyRyriPivQ9qwlRit+eAk4wjIKPKMNJgldB2Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ciFh0vfETp1mB69svSPQI+PGB4h+VcN9nR4y+wZuuAo=;
 b=j96huOfNXLQ78bOY4WFT/ow2JL8XQy8c2UyWZTZIcTefQW/GcjGnRKLZauuhSdLADXAH7ALbjOlKJ9yKSD+fXiUa0ZqEkWiey+ByKX13IrkiU+mtf9VYpogcgkIYydyupsBKuqA9Y28ubhYD1Pc4l9Fi3PyJcrGTm7oasctec88=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB8105.namprd12.prod.outlook.com (2603:10b6:510:2b7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Mon, 30 Jun
 2025 12:36:01 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 12:36:01 +0000
Message-ID: <bdebab4d-c7df-4bd3-a15e-6ef42690db99@amd.com>
Date: Mon, 30 Jun 2025 14:35:54 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] drm/amdgpu: add support of debugfs for mqd
 information
To: Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, simona@ffwll.ch, tzimmermann@suse.de,
 tursulin@ursulin.net, phasta@kernel.org, dakr@kernel.org
References: <20250627094921.911009-1-sunil.khatri@amd.com>
 <20250627094921.911009-5-sunil.khatri@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250627094921.911009-5-sunil.khatri@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0257.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB8105:EE_
X-MS-Office365-Filtering-Correlation-Id: 475365a4-b0c9-4ad6-cb04-08ddb7d2abe3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SVBJSnlXSHFQYmtRcTIzZjJIcGNOMW1WcXFrYWx4QnVndjhXTWpBaDYvNldY?=
 =?utf-8?B?VmFUME14dDJGQ1JKL2FqQ2hpc2w2ZEwzY0hzTFMwUFhsMGdUSlpHZDFxaGVJ?=
 =?utf-8?B?ek5VUVU3Tm10QTFwWmRJWHlaSzY5bW5EazdDbk0zV0VHaWNKbkhsOVNWRlNT?=
 =?utf-8?B?Y2hGUU9NSEpWRC9keWpUdFpkaXJrd2VKYzRpQjNRZFp6bnNLdlprRCtRc3Mv?=
 =?utf-8?B?WFZCa3lQQi94ZE02ZFZjUHllUk9SYXFHV2VjdytEcU5lMG9ubzFYT2dDR3ZZ?=
 =?utf-8?B?Nmt0M3dML0pOQm11VjJoQ20vdDFSYWErUzE0emV5aDhMNytwQkxvQ0hYU3Rl?=
 =?utf-8?B?NndZSURHckt5RW0ramNmbFBCcXNNdlhFQ1ZhTlpLWmEvaENNei9VbVVTVko4?=
 =?utf-8?B?dC85aDNKY0h3N0l4NHZyNDY4elRtZllxR1Uyckxoay8zMlhIeEtVaTkxQkRu?=
 =?utf-8?B?cU5Hcm9WUHE5L0xlL2NaRnVqUHVDN3FxeGVpMkFqUHBVK2tNSlk3bnVDTVJk?=
 =?utf-8?B?YWx6YllhZ3BEaDJsZW9FYzIvSjFDT3l2OE5IYUhGYzFaWi84SmlMa0FkNU41?=
 =?utf-8?B?dEdsczNBVWVQcE9ZN2VwSzRrUkJLejFYQ0pGNld1MUIwU3Q3WFByQXhrdHRx?=
 =?utf-8?B?S3c2emNCelQ2RWJBMWhTTEF5SFl2MUVueiszK2xrQ2tDb1RJeDgvdGoyUDF5?=
 =?utf-8?B?aWZCSThnZ2cxbkEySkJXV0dYd0lpMms1aHNyYzBKSlYramY1RUpha09qN1Fk?=
 =?utf-8?B?MFQwc1BNL29wQlFuYzg4aGdkUjJ0eUhCWTFpVHZXRlNYK2JhVTQ2ZG1ha0x5?=
 =?utf-8?B?cHVBNGJiOUNTVEY5NmRPcDc5M2NFMFlYNk5UUUE3aktqZkNNS2xpL3F5RU9J?=
 =?utf-8?B?dlRzOWpvWmsxb1hjZzhlOENBeVJ3Rk9wdUMvWmVWR0FNcnN3NnR5MUJTb1RT?=
 =?utf-8?B?RTI3WFhZbG1vRVlvWXQvRWlEUEc0YUFGY2o4WXV2eTVkUWJubjQ5OXkvbDZL?=
 =?utf-8?B?TVYzVm5ZTEU0bzdNcTVBVU5IVCtqejVOSFNPY1MxQlhtVlVram1sTHF0Mm50?=
 =?utf-8?B?YUdUdU8rdnc2Vk5ZRWNRSTFsaWxQTHd1QkpXQWp3N1V2QlMrbTVpd2w0L0NN?=
 =?utf-8?B?Y2h4am0vcEVRMVpmQ0tZOE1WNTZBdlp0UjNFbEpiN3Q5M3RCOFMyM2RjRVpK?=
 =?utf-8?B?Znl2dDJXNkpYcmtOMUFxYUFOcWcrUk1vWERYWnhTUkZVeFdIeGc0dXUzSjlu?=
 =?utf-8?B?ODdmTnBRbEhzSjZ1RjZJMDlsTXE3YkJoeDhod1JoeW1zeEdDY3RaRklPTmNI?=
 =?utf-8?B?Tm1weWNZdksvMDBUZ0l1cHQ1SXR1K0h0bmx0aWU1WmlwTElhUnRlUGtMWEpz?=
 =?utf-8?B?WTM4Uml5N3QyZVV6enFlclF0OGFTZytZLzdZVzJuaXNqbEh1VzJSc0Z2ZlNz?=
 =?utf-8?B?M1ZNb2U2ZXhUMzlVNHRkVHNnWmNVdlNsRUhhOFludHdTbkJneStxaHVEbHRU?=
 =?utf-8?B?bHFJK2U0VGFoVEFRVE0vUllkdFh4ZFFjelNaYnQrSjhxUVRPNjg5V0VJb0pi?=
 =?utf-8?B?blpwOXlPUENIS2pGanRrZlBmcTNyOUxyZWFDZ24wd3FMcSt4cVVwcjFLQm5u?=
 =?utf-8?B?aWNMQWI0c2RpQUpXQ0hQYmZtWFhqanBLa0dxY2hsNS9JN3QwVS96anhPL0Y5?=
 =?utf-8?B?K0tMWmlqeGE1MkhUVUdKdkpxeUJxcDE2SGVEQ0dYQjFrT3pmeXJCNVZ0emdl?=
 =?utf-8?B?UUZEVzlqK1RvV1FseU9xQ1VjNDFhUVhyTHBlZEU3RE5HdU9jMkhDNEpyZ0tN?=
 =?utf-8?B?dUVCNzc1TmxvbVRDYndXYzFZZzBUZ1o5Qms0MHRuczJGM1krQW4zTTRIV1ZD?=
 =?utf-8?B?T1pSNUZWWUNqSlNXSm1FUXBsbElrbUZ5SG1Vc1BPSXo2c3c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qms1VElIK0UybU9GK25Oa2NUOWRGbnNuTEVjU1huTDEzdmRNdnlkNkZHdUYv?=
 =?utf-8?B?WlRYUitwek8vY3NORVBrWjNRNy9oZUs0NmJPcURza2VGMlgwSUlZb2FYODBz?=
 =?utf-8?B?R1BVdEpZaHgvNmJxYmE0V0NnNmIrN2d4TExQMHFBYi9adlljcUd0NnFYWUtn?=
 =?utf-8?B?ZHR5RUZjSEtMZGJMQjZHYzlYRnFsK0tpdmt3a3o4bDVmT0hqL1dsUWs5dGhj?=
 =?utf-8?B?eXlEQzQyT1RaTk1kVlFLQnhpcDBpc3RSRFFhVGRzQWkvZDFjeGdhR3N0U0lJ?=
 =?utf-8?B?L09IUHIzdUxRaldxeVFLUXM4MEpQZjdyQUI2aUJ1ZDBBTG5QdUpxdi9mU1BR?=
 =?utf-8?B?WHlFaTFKS3VUZk15TXJYMGFBcitVeHR4em5WTVZYcEo2RUMyMWtnL3lCTFZp?=
 =?utf-8?B?R1Bib1YreXphbzJZZkxSc2VFUjlFcnE3eVF3enFaYmFyaVpTdEhqeGNpcGVa?=
 =?utf-8?B?U1Z0d0kxMEJacnRmanQ2VllnV1MwYkIvc1cvTU5DeU1Yci9LdTZkeklrZ1dP?=
 =?utf-8?B?RHhEQkYyWit6QVJ2cWIvRGpIRHJXRTBmc2ZsTGJLMG9ZM3NrRnYzWnhGSGlI?=
 =?utf-8?B?Q3NMYjdzZFlyUDNmTVkrKzRsS2hIRTA1c3V4WkdHM214am8vaEhSVVZ3VDZt?=
 =?utf-8?B?eDd6eHlUR1NWUkMyS0RmY0VIQVBkVCtNY2MxWmNtTnE3UXZGNnlBRTlmVURT?=
 =?utf-8?B?QTU3MjAxdnR4Q0NpdHJKOXU0ZFptUVJMZ1NRYTAvVmo5VXBqS3c1a0Q5VEFp?=
 =?utf-8?B?Sm1WcG5KMVlrNzQ4WXZuV2l2S1dJWnV0eC80UzZUMS9sdHhaZnV3THgzeXcy?=
 =?utf-8?B?T3hXZmxraHhNQ3hmTElVNXNsOGlkVHd5SERxVVVJQWM1T0xGakhKN2V0dGlT?=
 =?utf-8?B?WHhidXVoODE3MEdQUUU0YkV0SlRWblJTS1NJM0F5Vkt1MmVQN0JIWWRyWjl1?=
 =?utf-8?B?YzBuK0R6U3RIZk9VWnlYRzlXeTF0VmR3L3o5Ung4K3o3VGM0M3Vzc092YU5Z?=
 =?utf-8?B?K2ZuNXdYQzZSdUloMnkzVXZpTUtjUERLcXVML3pxTFIzWGh2Q0VGdUhVRHVl?=
 =?utf-8?B?WktRY3FGTWUxNVQvUExHMXdhUmhlSDF6cXgxTzRyWkNxa0VvU2NaM3lka1pz?=
 =?utf-8?B?ZTZyZ3A4QXhldGxwaVZIWG1pUUVUV0t4bWJFN0NKdlFVdUlrZjZrajRZcXR0?=
 =?utf-8?B?YzlEb2VTUGNoQzhOQnQ5YU9BamluWTV6WTBOdFp0c3ViWHd6SmZ1bGkvcWZY?=
 =?utf-8?B?M1dxbkNDK3BRbVI1Wk1oSUI2TzFJeGVxbDhNSFlDQXdKOGNqNWhRQkhRMzRU?=
 =?utf-8?B?alM5YjFRandtQUZHeG9PUEFFNGNTSUQ0SGVySlJ6MmdiY1lCTXhPbm83SUZP?=
 =?utf-8?B?UDFPbStsVWJUSXlCNHBoMjFuQ3FTVVFuWXhKUzJEZ1ByNUZwYW80dHNINksx?=
 =?utf-8?B?bHRSSjJlY2NiSTY4bmxPL2hNbS9aam1VWmxVc3gySjNjZnhoYWdNaiswcUFo?=
 =?utf-8?B?STM3UHpaT1BLUHhxb2t4Y1FiazZLL3RONG9MMm5IRnVvekRhSjY3U3VGd0Va?=
 =?utf-8?B?bkFwQ0F2QkxiSjh6VW5JSjd4RzJOZVkvK0V2ZzFrQzdrVytGendNVStOeEh4?=
 =?utf-8?B?NllWQXB6OFdyWVBDeFRreDJuRWZEaEZRaFVOM0RjRmNrQXpja2tFUnNIN0Zv?=
 =?utf-8?B?ZG9od1d1RjE0SzI5VE5mdnE5YTdFSHo3Y0lYV1lBbjZNSFkrRm11cDNOd0lH?=
 =?utf-8?B?QU1qV3RONXJtd0picnpLajUzS2JibzNwSmx5MDVjVXRwbytnYU9iQXI4UmxG?=
 =?utf-8?B?UXpRRkIzU3NMbEpRbWdwVmJVem9ZY25ZMXhkSGFvMmRDK3l1bzJWVkkrRVBk?=
 =?utf-8?B?QUR2cmlRNGJhbFlqSSsxZzhvNDlLTklSVGZuRnFuRzJ5NCthdHk0TjBndHZL?=
 =?utf-8?B?ejFHYjJWNTArRGtRK0ZuZXc5TlRyeFNlOHU1TnV1d24rWmZlTStucFJFMmZM?=
 =?utf-8?B?WktWaGVsMXFKY0pPT1Y4dUlpNHVDVk1kM3dRZTFRTnNDMTVSNnBORUxHR0wv?=
 =?utf-8?B?VkZMTjVCRUR4dUppdk5lQnh1QzZaK0ZNUmdOekY2M213NWE1WHpRaVBaeEVU?=
 =?utf-8?Q?wRwt+TWDCYv0OUWuM0a5+uJQR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 475365a4-b0c9-4ad6-cb04-08ddb7d2abe3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 12:36:01.3745 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 97xygy9hUtCAix3WI5h0Xo6RtDP239otkp4Ve21sVmrv4V8d/CT3gs2qtl+hvzwz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8105
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
> Add debugfs support for mqd for each queue of the client.
> 
> The address exposed to debugfs could be used to dump
> the mqd.
> 
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c | 52 +++++++++++++++++++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h |  1 +
>  2 files changed, 53 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
> index 295e7186e156..115d53bc9a8d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
> @@ -318,6 +318,9 @@ amdgpu_userq_destroy(struct drm_file *filp, int queue_id)
>  		amdgpu_bo_unreserve(queue->db_obj.obj);
>  	}
>  	amdgpu_bo_unref(&queue->db_obj.obj);
> +
> +	debugfs_remove_recursive(queue->debugfs_queue);
> +
>  	r = amdgpu_userq_unmap_helper(uq_mgr, queue);
>  	amdgpu_userq_cleanup(uq_mgr, queue, queue_id);
>  	mutex_unlock(&uq_mgr->userq_mutex);
> @@ -343,6 +346,46 @@ static int amdgpu_userq_priority_permit(struct drm_file *filp,
>  	return -EACCES;
>  }
>  
> +#if defined(CONFIG_DEBUG_FS)
> +static int amdgpu_mqd_info_read(struct seq_file *m, void *unused)
> +{
> +	struct amdgpu_usermode_queue *queue = m->private;
> +	struct amdgpu_bo *bo;
> +	int r;
> +
> +	if (!queue || !queue->mqd.obj)
> +		return -EINVAL;
> +
> +	bo = amdgpu_bo_ref(queue->mqd.obj);
> +	r = amdgpu_bo_reserve(bo, true);
> +	if (r) {
> +		amdgpu_bo_unref(&bo);
> +		return -EINVAL;
> +	}
> +
> +	seq_printf(m, "queue_type %d\n", queue->queue_type);
> +	seq_printf(m, "mqd_gpu_address: 0x%llx\n", amdgpu_bo_gpu_offset(queue->mqd.obj));
> +
> +	amdgpu_bo_unreserve(bo);
> +	amdgpu_bo_unref(&bo);
> +
> +	return 0;
> +}
> +
> +static int amdgpu_mqd_info_open(struct inode *inode, struct file *file)
> +{
> +	return single_open(file, amdgpu_mqd_info_read, inode->i_private);
> +}
> +
> +static const struct file_operations amdgpu_mqd_info_fops = {
> +	.owner = THIS_MODULE,
> +	.open = amdgpu_mqd_info_open,
> +	.read = seq_read,
> +	.llseek = seq_lseek,
> +	.release = single_release,
> +};
> +#endif

The #ifdef part is most likely better put into amdgpu_debugfs.c, but that adds more complexity. So for now that should be ok here as well.

If we get even more code here we might want to re-consider that. Feel free to add my rb.

Regards,
Christian.

> +
>  static int
>  amdgpu_userq_create(struct drm_file *filp, union drm_amdgpu_userq *args)
>  {
> @@ -352,6 +395,7 @@ amdgpu_userq_create(struct drm_file *filp, union drm_amdgpu_userq *args)
>  	const struct amdgpu_userq_funcs *uq_funcs;
>  	struct amdgpu_usermode_queue *queue;
>  	struct amdgpu_db_info db_info;
> +	char *queue_name;
>  	bool skip_map_queue;
>  	uint64_t index;
>  	int qid, r = 0;
> @@ -475,6 +519,14 @@ amdgpu_userq_create(struct drm_file *filp, union drm_amdgpu_userq *args)
>  		}
>  	}
>  
> +	queue_name = kasprintf(GFP_KERNEL, "queue-%d", qid);
> +	if (!queue_name)
> +		return -ENOMEM;
> +
> +	/* Queue dentry per client to hold MQD information   */
> +	queue->debugfs_queue = debugfs_create_dir(queue_name, filp->debugfs_client);
> +	debugfs_create_file("mqd_info", 0444, queue->debugfs_queue, queue, &amdgpu_mqd_info_fops);
> +	kfree(queue_name);
>  
>  	args->out.queue_id = qid;
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h
> index ec040c2fd6c9..b1ca91b7cda4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h
> @@ -65,6 +65,7 @@ struct amdgpu_usermode_queue {
>  	struct dma_fence	*last_fence;
>  	u32			xcp_id;
>  	int			priority;
> +	struct dentry		*debugfs_queue;
>  };
>  
>  struct amdgpu_userq_funcs {

