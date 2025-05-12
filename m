Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 097F8AB3177
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 10:22:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5705910E321;
	Mon, 12 May 2025 08:22:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="dDtV5mlZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2067.outbound.protection.outlook.com [40.107.92.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3691110E31B;
 Mon, 12 May 2025 08:22:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I2Zd2uitwMBh9QBpRTEvER4hU0Llq69POEp7bxBSESTZ9DS/O3jOGmlXdovALTStUnqYomto4b7cxYLQSEN/PkBfifqsiXgY2CuoS6yXqUv8SCxbV4mTWSAIeGPQ6CXLA4baCHfGyGCkIBnqrkjfLi6AawRRyk1uw0yLjraDHvWky1HWNJSWM/XCcqUFAETGyQMSVmDDjfh8ySeWdnQXfBbGBiHYdW/xGmg597lQGCzEGK/CvEE5UKkCNIu8tiEegYmG1eEUayX/bPo4lSXjtHUXIjOImFDmSguBDrxQ4ZFbxn2wOsbtFNh8BGjeTDy8Om+JrpOGWrZbHqsuObXmQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SAiYrQl9ETbuN516KszDhoEryNtyjDAhpnEtndFDeUg=;
 b=I3CUDJzjVytWEwdjtZAirOMAa5zOKdyPxA/iAB2hDTJgKhxCKjugPEI4bn73BefbrJOUHN1VL/7bOZeDexPQx/7iXY65ze7dEIYxYpj3mKpZdxFMAW8bPgKIsVNU1hFNLwzKGMjNco6tGYdXYuHElNoKygDk/eynv7floMZUcsz2rdMM1qVurWLt84eqCnvk+egsFUZqLgVi9bMzlpm+FgLfyz5B0g78jASwQlWwknV8HUQynKyot2tsO5XRvc5MZdN82lhd418izUiDatgLTDganooY4YGqj0WucZsa145mqsT1+32cJ6T31BQunq/nFiPPaNFJUusAxQaM07EaXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SAiYrQl9ETbuN516KszDhoEryNtyjDAhpnEtndFDeUg=;
 b=dDtV5mlZiiVYNdcY3pIbo4l3a1kyXGhZVSZ+jDLkTrot/b//55VvbVHIXd0/Naw+ozz6JWCTVD6UruP8ZauHYMxdDKUUVtNkul5C9qOrwi/IxvIEPcRpGt0F7ua0MVPNLRtaj3OWGSfJC82+vZgtV9tx+NoazAqpaJkUWq9tKbo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by LV2PR12MB5751.namprd12.prod.outlook.com (2603:10b6:408:17d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 12 May
 2025 08:22:25 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 08:22:25 +0000
Message-ID: <f0e371e8-5a66-4594-9fc3-167e710017c0@amd.com>
Date: Mon, 12 May 2025 10:22:20 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 06/13] dma-fence: Use driver and timeline name helpers
 internally
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 kernel-dev@igalia.com
References: <20250509153352.7187-1-tvrtko.ursulin@igalia.com>
 <20250509153352.7187-7-tvrtko.ursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250509153352.7187-7-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0278.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|LV2PR12MB5751:EE_
X-MS-Office365-Filtering-Correlation-Id: c625c278-1a71-421d-4e30-08dd912e1fd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QWFUY1BGRUxXWkZZUnc0b3dodlRNZHVleVlJbTFtNVYzSVEzcHZZMk9JT1Nr?=
 =?utf-8?B?Vk1CR3lIcUd3RDJPZ2o1TngzOGpvNVhDYlpHZzdsTEh4MXdoSTkrNFg0RVJH?=
 =?utf-8?B?bXc3UzZzSktDZ3hlSUY1Q3EyV3gvQU93TzlHaXBlK3hDRmtWUnRYVG1OSTF1?=
 =?utf-8?B?bE9yMnRJOFc4WXYrMXIwSlg0R3k1cUQvWkNlTjd0UlZjc1VYenBXWTdRUlpR?=
 =?utf-8?B?NWFaNnpQeUZaYkVqVGZqQi9kdXd0WkdLc09URVRsaWNpNndTbVBlQ1RmdnUr?=
 =?utf-8?B?M3FxOVh3M3lqaWJMMTlBSW5FQlFKZ0llTkxBMisra3pWRDQvajZ0YjVFWHpN?=
 =?utf-8?B?TzdtSnVYMkowMzhZbDVpS3VPdUtFWVk0K2ZWYWdxb1pKc2dPUjlPMDBvNnhH?=
 =?utf-8?B?NnhIYjVLODNoZEdoZkgvc2kyOHJ5V0IvQWtveDQ4TFR6eVdoaXF4citPN3Nv?=
 =?utf-8?B?dUdiZHNQN2R3bmNvMjBMcDFmaVFHRGljT0pqTHFTc1A2UmVMTDJYWXNBeWRn?=
 =?utf-8?B?NVlyLytFVkk3c3RveUdiNG9iVjlJMUFSTEM0bnNoUGJqWVplZm8wMGwzYzBZ?=
 =?utf-8?B?WlZxQ295WlVpdDR3NFhPdUlzdG1JeFRBdDRJa2VpVDdibmFQc3BBZWF6dmpH?=
 =?utf-8?B?N2lJbTFVSEZUTm1nOWxwYk9OWEFlUVEwUGdUQ1lLbEtmeFk3UG1vS3Q1c3dW?=
 =?utf-8?B?UG81Sy9KeDVBUzFQb3liK3l4M0R6aE1yRVdRRmlNTjM5UGUrSkVZbG9jSGs3?=
 =?utf-8?B?OHpLaW5VMWo5dWhDUm5peG1tVDN1S211ckF6REtuSmdVeG5pc2hCazFOWllL?=
 =?utf-8?B?eXBWMVYra0ZtUUFDdGtiemgvZ0I3Q0JqMURLbnVOYlpUMW5XcWIrT2s1MkR3?=
 =?utf-8?B?MDNPU1RETzAxcWU1VG1ORTFZaUNUZDg0aWJkVERzUDBweUZvRE9IdzFnb0Jj?=
 =?utf-8?B?Q0p3TjJsVm9ibTF3YStld1RLLzZmbEIwQ0sxYlVpaVdXdThXU2lib3lzS2ll?=
 =?utf-8?B?T1hvNnEyZ2orMjUvZlJSMHdyWXBmTE5zdTlZdTRmRVpPd1YxbHlycVBka0J2?=
 =?utf-8?B?QldkZEVjRG1KTTA2Y05oS1pJTmIzbHY4TExDVnZRNWpyUXM3QklQWllOdDA5?=
 =?utf-8?B?MlB1bE01U2ZqalBiVll4UUxtMkRscmFtWG1BQWpXMUpQWWRUTm8xTkhzSUdH?=
 =?utf-8?B?L2hWSzJ5UW9nVFlkMW1ib2xmcFJiQ2FVTW5UK1pJd1hDUUZ4MEVWRXZyNExO?=
 =?utf-8?B?N2hoQTFSTnRZL3lwV3gwOGJUTlVoMUZRUnVLbGR0cVQ2UkJjMXNVcjJvNjBo?=
 =?utf-8?B?ZVNzMmVJazljUURoNVRwdVh1L0cxTlZXYm5nbmlrblo3QU56TWM3STFHZ0ZY?=
 =?utf-8?B?T1M4aUZ5aWQ1TGdHdnFFSDRtVExpc1hWWUVuSmViTkE3ZXlxdVJBQ2ZRZXRw?=
 =?utf-8?B?cmh6dVNWNHhMMldMbjJlR0dETk9YK1BLdSs5MzI2VXM5K3Q5THE2b0FNNU9S?=
 =?utf-8?B?WE1uc0l2QWZCd2xZOHBPQ2N2MWJ4bHRsVGF5aVp1WXVhWGJTU0lwdWQ3UnJI?=
 =?utf-8?B?YWVnbEZmWmxSRjdyUnV6Y3lPdU92ZHowUWhqSTRsaTljRjkwTG9DWGJqRFVK?=
 =?utf-8?B?cjhxNmpCcjRWUUFVNzk0V0dmNE91ckxUQWc1RzcxUjRjYjdqa1l1MXcyNzUr?=
 =?utf-8?B?K24yYnBSdHBRd2JoWGNKOXVlditEaEdjaHdSNU9TaUFWdEdwb3EzUmdIY2dC?=
 =?utf-8?B?eVFGOG9rN0lFTkJCK3RxMkd0WFRqTHMyaXVLRWVHQlhtMTFJazlQWlJsMVNW?=
 =?utf-8?B?MlB4ZGFIelZoNURaaWUvcTFmcVhLREtJSzFGTTF3d3IwSWNiZFZlMENrZFJO?=
 =?utf-8?B?SmswVUNyS0tYS2laanRqSDlnN2FpN0NvNTV5NnlTZWRHWDczUkh0ZWdQbVV6?=
 =?utf-8?Q?4Rlaj04wt6A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHlEa09ZamxaMldOTVVnWVMwaG9TdjNCVENYREQ4dURmdTVKMWZodEwzQjBq?=
 =?utf-8?B?Z2IyeDEzYTY5eFJBbjZLZzd4ekE2VFhIV2RXOXgxTjlaMEFGeUN5TTJXSmdh?=
 =?utf-8?B?Z3puSVRFYlRUb2ZTY0x6bmxEY1ZOaCtvMlVvYzBXUmNPdkI5SkpvbUNRblRX?=
 =?utf-8?B?NzY2T2V6RWJsZjc5UEtzQXR0WXVNcjFWc3lOckNRaEFqUkNkOFF0MXpWU28w?=
 =?utf-8?B?RWduZmJ1RHYzT1BMWTJUNXJTOW9NQUtqWVJVZDhsUjFDWG8wVnRDMS9FRkNI?=
 =?utf-8?B?WHgrSzhKNWc4UWMwQWFLcmxzOVIzU09zMlZ6em1pZ0l6aDRySkdWSWJyRXNS?=
 =?utf-8?B?ZG5UTlNYY3E1S1ZKOUFiREZmeXFsbWdSUHJkK202b3pKSVJsY0xqWUZoOXFL?=
 =?utf-8?B?WFJtaTY5bTFhTldRYmRkMllaRkdiLzRzTVNPaUtpNTRpQmpMWXd3enk2T3VQ?=
 =?utf-8?B?a2MyL0JPM1h0R01MTEJiSlY2VTlYVGxoc3V2aGkwaS8wSmNxclBIcGphWXgr?=
 =?utf-8?B?SkdWRFVqSWQ3RW9ERkFwK2RaY1JHMnJ6cThRRUhqaFl4Q3JYNGpPaTNXYUNk?=
 =?utf-8?B?QkNnME5CVUZQNjhod1hmU05IaWNwTklLd1BTUjl3VWxhRDk2aUY5MW9JZ0hC?=
 =?utf-8?B?dnA5bFFrU3lZQVRudit3ckVnbGw0NWxETitVTWVKLzl6cnYvd2gzNXMzUGVZ?=
 =?utf-8?B?eEZyT1NxdDdLeW5hQ3oxUkRpNjd6d1N3YnVzaTZ6M0FBZHYwb3grYVFWUlQ5?=
 =?utf-8?B?WTZkQ0JKVjNJY1ZjVTdSR0NkcGxoSnVtUTNoVU9QcjFiMVJkcWl6TldjTlp0?=
 =?utf-8?B?bjF0am16L3Bwbmx2ZWRqQzZPNFEwU2diaDBDdlVzbllTV3h1V0VUdVJRNnZT?=
 =?utf-8?B?SENwWWdPdi82MklEWmRsTzE1dlJibm04TEFYM3g5RHMrOTZLb0NYYnBqWXpo?=
 =?utf-8?B?TGx2ejc1RmRnUVc1TlE0YWthVmRwYTFBcmFQdzQ3OEN3MERMS2gwc0owelJF?=
 =?utf-8?B?Y0tXKzVyMldvRTM5bEVoQnljbW1OUjc0MFlIdTBmWmNLc1NTeDdJenBBaC9M?=
 =?utf-8?B?MTVqRVl5dlNzUlFPZTcvYUdrWk1mc2hQblFlOGlzNzVuT3hOaWZGSVlNMlU0?=
 =?utf-8?B?NWpYUW1NWXZxNGk1Y0xRWTQ4RkM4dy82eUY2RUZ2NkNCN28vWWE3TUJleTh4?=
 =?utf-8?B?dk95ZTVQV3NiMjlxaTdRTnIwQU50WGdvbE4rUm9KZlEwa21uYVpiM0VtR2Ri?=
 =?utf-8?B?V21ZR0tLYVFDNlBpUk5FRlU4SkJFV01mY2UzR2JWRTZuU3Rsdzk2dEh6WXlW?=
 =?utf-8?B?TGN4S0FsZ285MlA0U2s0N2pERGhLTTJJc1VVSHkwTXo0cGlhaEpyK1pzRE52?=
 =?utf-8?B?RFowVzdWdDRDSFIxVUFtUnRuR0N4SEJPKzJ0V2k4bHFsbGhuT2JvUFJSVGJX?=
 =?utf-8?B?SUVaM2lTc3oxdTR1Z21HS2V6TkhiOENSZkM0TkZOZ202UTRSSmphNjVxNmpQ?=
 =?utf-8?B?ckI1cjFWWkZSd0xLSlhsbDZtaUp6ZW5lZDFHTnFEWGl2Ui9aUVRxdUVtRml0?=
 =?utf-8?B?RUM4dkd5Z3hnNmY3VXRwaXVYNGU0ZzAxc2hYWlNZRjR0THNVa3NEeU9NMTFN?=
 =?utf-8?B?cTEwUFRlTkJQV3FoVEI2eEtJNEwvb0diZC8xMWF3MjFpWTZuL3o2L2JNcGZE?=
 =?utf-8?B?VG5xVndnbTZ1SnQzUjV6N2J6c2JhZTNoQ21YdXJlUzZEN0VQaXFESFNaOWJG?=
 =?utf-8?B?azhtNnVQNHZTWWd2NmVZaXluSjZRODN2ZlRpOEpBTTJxUGJqSVhudlFYT2Nv?=
 =?utf-8?B?R3M4ajBoK3VlNjZjalI5Y3ZXaGxYL1JlQlRzRDRXRXI5NGJhdzZLVVR6SDBH?=
 =?utf-8?B?QVA4L0pkaDdvZm5zVXJRbHlzV2l2N0N6aGNpYlBkdnJGeGhyUTBuRU50LzQy?=
 =?utf-8?B?ZU9QSnZ4c093bmFSTWlNeHZOTW13Tlp2Um1LRVU4azNJNGlOUVJFQ1RnU3dP?=
 =?utf-8?B?eFMwRTFDbVNZRzEwUE51czVjanVia1RFRUNacGhjVXAwR1JBcW9uTEtaajRK?=
 =?utf-8?B?d2dQb2lLWFhFUXRsa250SHR0TVh0RVg3MGUwbWlVMEd3T29mSFJvQnBISWZj?=
 =?utf-8?Q?puxU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c625c278-1a71-421d-4e30-08dd912e1fd9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 08:22:24.8075 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bDpgkdoMjE4cQc8SOY6pMU2FUM/AWDrpxrXGnhso1+V/aUOZYGbHXNfTT7ektsr5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5751
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

On 5/9/25 17:33, Tvrtko Ursulin wrote:
> Make the implementation use the previously added helper for accessing the
> driver and timeline name. This will enable more coverage later when
> asserts will be added into them.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

I would squash that together with the previous patch. Since both patches are for the same component it doesn't make much sense to separate them.

Anyway Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/dma-buf/dma-fence.c      | 9 +++++----
>  include/trace/events/dma_fence.h | 4 ++--
>  2 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 33661658f684..dc2456f68685 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -538,8 +538,8 @@ void dma_fence_release(struct kref *kref)
>  	if (WARN(!list_empty(&fence->cb_list) &&
>  		 !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags),
>  		 "Fence %s:%s:%llx:%llx released with pending signals!\n",
> -		 fence->ops->get_driver_name(fence),
> -		 fence->ops->get_timeline_name(fence),
> +		 dma_fence_driver_name(fence),
> +		 dma_fence_timeline_name(fence),
>  		 fence->context, fence->seqno)) {
>  		unsigned long flags;
>  
> @@ -983,8 +983,9 @@ EXPORT_SYMBOL(dma_fence_set_deadline);
>  void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq)
>  {
>  	seq_printf(seq, "%s %s seq %llu %ssignalled\n",
> -		   fence->ops->get_driver_name(fence),
> -		   fence->ops->get_timeline_name(fence), fence->seqno,
> +		   dma_fence_driver_name(fence),
> +		   dma_fence_timeline_name(fence),
> +		   fence->seqno,
>  		   dma_fence_is_signaled(fence) ? "" : "un");
>  }
>  EXPORT_SYMBOL(dma_fence_describe);
> diff --git a/include/trace/events/dma_fence.h b/include/trace/events/dma_fence.h
> index a4de3df8500b..84c83074ee81 100644
> --- a/include/trace/events/dma_fence.h
> +++ b/include/trace/events/dma_fence.h
> @@ -16,8 +16,8 @@ DECLARE_EVENT_CLASS(dma_fence,
>  	TP_ARGS(fence),
>  
>  	TP_STRUCT__entry(
> -		__string(driver, fence->ops->get_driver_name(fence))
> -		__string(timeline, fence->ops->get_timeline_name(fence))
> +		__string(driver, dma_fence_driver_name(fence))
> +		__string(timeline, dma_fence_timeline_name(fence))
>  		__field(unsigned int, context)
>  		__field(unsigned int, seqno)
>  	),

