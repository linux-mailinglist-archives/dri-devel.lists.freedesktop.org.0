Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF8B52E5FB
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 09:13:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6489911AE45;
	Fri, 20 May 2022 07:13:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2085.outbound.protection.outlook.com [40.107.243.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AF5211AE47;
 Fri, 20 May 2022 07:13:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uo76y9slk+GLyCwjD15KXkSwCZNiJ4lNy/i5BDdSmptFq/fanJEuv63pSqL5AYzHUJICYjSdlTzmceH3m+c9diyylsJi+uNJFhackqNxyXiywmB7CgpViWrlku58Zjru0jvebv0Z0oljDPoU91Y8KXVsVOTpA8KP4dmSZW8yWTRW/fuUfrxkjFhI0AbmTuWL2JmDZ8WHm+RLE5XEUGBf5/GNwwzEUsw4WfBLFPC9Wkf5WpksIN0D76Cy1yEaKA1dWE7P+CXlVLUjnGzNWMyIRKHg035gjYqMKk7B0jtSD6XldbW5rDNWet36pTBGwTdl5Bwq9988wJtewtW8xKmJGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IZCtsR7YN9ybQPejcmLIXBGIQAUdgQMWjXh9NLZuwTI=;
 b=VL/ckAuSvQEix4ip3UY/a/FGpObOQYpgWvB+vWOmzP6szS+8fOR7pBukIldgL0ATxQy330wg4FI0KILbUoztk9VhnAK9g7hoN+PrGTbNEES6I91F4KPnUGz2TS+nYaa0ld0TgzMsfU5fyY4775yWtbUgDDDrugNLO/9rSlT9NVQyAmnE7o8onb8grPlrsHBKQLd7mJLINFrqjhZArMwpn5RX9fXTRuSVjQbV6gcRDZoQ65/CICRqB3UNJhaX6U4yx+fJc7GKL0tR8A6gF8sdbKkrXtGmvAIx68lpI0gRrmZjzLsRRRIBkYa1evUVZyO5CFtNHP0JK8x2/vdY7YSRaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IZCtsR7YN9ybQPejcmLIXBGIQAUdgQMWjXh9NLZuwTI=;
 b=eAG0qBxssZqJUzv+7xCaX+ao0Do/wstW8F79JThqSHkL4GHvHATQNyQa2GFHcGTa+pkuy8L20+VJEvxL3Z/ZFWM53pltIMOc/jTaKlL22B3iOjN8cD9zKbAZrfrHMw2CSSQB8JNUkyJroxMztEpE+rucC8+mJefJ3Ixl6kMs2RI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SN6PR12MB2670.namprd12.prod.outlook.com (2603:10b6:805:6b::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.16; Fri, 20 May
 2022 07:13:22 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03%4]) with mapi id 15.20.5273.017; Fri, 20 May 2022
 07:13:22 +0000
Message-ID: <728b74ae-90a3-f78e-232f-f359876d99f4@amd.com>
Date: Fri, 20 May 2022 09:13:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 02/11] drm/nouveau: switch over to ttm_bo_init_reserved
Content-Language: en-US
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20220519095508.115203-1-christian.koenig@amd.com>
 <20220519095508.115203-3-christian.koenig@amd.com>
 <DM5PR11MB132436B29B27E633F54C3454C1D09@DM5PR11MB1324.namprd11.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <DM5PR11MB132436B29B27E633F54C3454C1D09@DM5PR11MB1324.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0020.eurprd06.prod.outlook.com
 (2603:10a6:20b:462::24) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a35e4da6-d8f2-4798-8476-08da3a303944
X-MS-TrafficTypeDiagnostic: SN6PR12MB2670:EE_
X-Microsoft-Antispam-PRVS: <SN6PR12MB2670F7EB14DA17E65B43336783D39@SN6PR12MB2670.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7LEsaZoor9raXEXFJdHiXooXIUHStkKPMQJUzL6dXFWIunBWDnvlX8/Y2H2lYQQ+7cKzcKgksNDdg+e/YLvCHyxCAQvI0aUUQagtU2V6p6v/3b+F6S4gCp6qvxReLXb498Suhe5+YgqgONN1SAsSLdDlqyv6AwRFFWIq5YruMc/fFRtgYhMMMGwYTUyheUeQLc9nuR/ft+5EnBeKGKy4HR+e1l2strffWVDSNAAjepdVAktNtGW5/ZTUPb2125cstigjeci/c6U2+GqKPy9JAOxXPH+IBNs6wcLOWMcErdOpDY01/bJF7WcyZUX5TJJzcOzfMIvBwf9aV/ai0XvKjfwYR9s142/Z/P0ZVwCDLZ92jfbmAFSc9Z/5Npf5q2F++W5TEQNkfVIQMcZvakIPOaUZ4MFpq9EePiysNHZu4ZVpR5SPFwas4SBGpqEyBiaNXU1oNJ/dlhpI36aIDWWadDEYamqWiOya13eGBlHoj8AVgKC/B0nnBAuq0fkBrbUoJO7NuSGo4DhuaTM/rOKPu3ED2pbMy/DCpNbjVoAn+KkhgjqZnlseMOq4bheKfy34P7nmiAjVRs+RQy8MR2FEGT3PrkhG+dod91E0f/tPrvgsMJTtbObfuwE7xpkjKktjsE8JEOjOFnDgeh2KzDvgkKZR1VeQh758XXW3Bbmyx1mDKjW8+M6WHq4lE3j8Kc9jBiC1aM6fEE6P/+PqWoQr92Pl35sI7wIa6JsC5asYYKbcItN2NLGzQqje2C7Bqc3p
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(53546011)(6666004)(31696002)(8936002)(5660300002)(38100700002)(2906002)(83380400001)(66476007)(66556008)(66946007)(8676002)(4326008)(86362001)(6512007)(110136005)(36756003)(2616005)(31686004)(186003)(6486002)(508600001)(54906003)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTFKQjRaTVJUc0FjT296bWFVcHhSMmFGUTBrUXJ3TXRvTFpUUzZpZTFXbGVM?=
 =?utf-8?B?WUM4N2M5TmR3VzlHZ2NKTnR4blFkUXVXZFJCRnlxenRRa2orYVdxMGhoYi9G?=
 =?utf-8?B?Z0RYZjNQNFRncjRrdG5ZbTJHZTlkTmFQdVQvNm50MXk5V0RRUGQ3dlVYU1I3?=
 =?utf-8?B?NGlWVEdPNjhKaUlvMXB5czFKbnlDSWpTZEZQK0l3SityaHI4RUR4U244bGxz?=
 =?utf-8?B?bVJwRTljblZVaWkrK3JoY3RrczdxUVlMeEtrUnQzZjBEYXJVeWVRUjJNVGFo?=
 =?utf-8?B?MUFuRWZTU0pQNW5haFAwbnN5dXFOMnpYVUx5WU9aeFE3WmhiWkp1M1hRckpB?=
 =?utf-8?B?R3BIUzkzV3JuWlI5K1pNSmV1ZTJHamhjTk9KSUJiMzFyeFp6OFZnNmJwZE81?=
 =?utf-8?B?VW1RZkxTOHltK2tYeWgwOVZmdXVUZ1FDaTduTVg3VWVSRjAxUVdqNU0zOWNH?=
 =?utf-8?B?NkZEMmI0djQ5YkVpd2NEZXhRejM2UmVFdmxoVkJIdW1hS0FJUVJ5MEpQbWc0?=
 =?utf-8?B?WFB3OGJMeTNTUU9URUhtcURSSWkwQnRyMzFmaTVXSStKR0Qrd2xNOXdPN3Fv?=
 =?utf-8?B?MlNYeUxRc3BBNWk3cnIwYjhtRnRGdk8vWEd5c0haQVZ5aUJyYS9HSnM1NU5r?=
 =?utf-8?B?NUt2b1dOZU1tdWJCWldOdVVvODhBSTd4RlJFRjZCdWFuUXpBT01LZjVVanM3?=
 =?utf-8?B?dWRlTjBVVUVSN00yeUpyMTM0ZHhpTDd1YXIxTHppTzFNSkxBM2gzaTdjR2hH?=
 =?utf-8?B?bjFncEpEWDlWaVl5ZlBqTmNkRlFIVnFiWXArbkdYWEhuUEx6cnpPd3g2VmFh?=
 =?utf-8?B?OTI0cUMxRDErSm51QmtwSlVvVzgzWE1mMmV4K1BkNkNCODJTZVhidVhSSFl4?=
 =?utf-8?B?SS9mcmNLTnhGLzhlaDQ5cUdiZ1ZuVlhVOXFvdjV2bzBTZEswKzFFMGUzMllx?=
 =?utf-8?B?YWFieVJua0FtZzc5d1RGNkVXVTFmdW9VeDJVQ2ZMT3FUMW1VMkcycHNrcGk4?=
 =?utf-8?B?RnZDTlhGQWlzRDkzSDk3dU16LzR4dncrbWYvaWhhMEg2YnlVVkMrNHdYNXND?=
 =?utf-8?B?R0Q4QWcySkt4akdnZG9CM1psNmM5WEh5c3czT2RIM0I5QVVIZjN1NTdLMXMr?=
 =?utf-8?B?bEx4cUYxT3RjSkZsNHFveG5KUFVaMlI2VWxyR25uRFErVnJJbFFFb3VRVTV0?=
 =?utf-8?B?RXNGcitORlNsUmQ0U2RnL2xja0U3SHR5b1VJQ3lnc0xDV1ZKQlUxVUVIa2dw?=
 =?utf-8?B?U2tqdCtSdEZmZUkzcFQ0YnBaYWQ4a3FSK2phZG8vTEhvaCsvL3l3VFlFalZM?=
 =?utf-8?B?dktrSllkcXJSWGJOei9IYmlMa242Vlc4a2Z5ZEw2RGo0RjZXaFRDM0k0MHNM?=
 =?utf-8?B?VUtMc1FnVlRLYmk5azBaUEJoMVRuR1Y0OUtsamZpdHNaVHhnalczNFZuRW5Y?=
 =?utf-8?B?ZU4xd3hDc2Znand6SHF3UEMwdzNMTm5yRSthQ2U4czJUZTlLdVU1aWhKUldI?=
 =?utf-8?B?dG0vNCtzbm9veENXWkdIWDJsRGF0eHF1czZiKzFyUXRlbXFWOTBsMm1YRHBL?=
 =?utf-8?B?dDh4NWJJVTQ0eldwYXF3RjFtOGg4eXhDdTRRcWVhWXd3VTFPLzI0U0VzUTZC?=
 =?utf-8?B?OHRxOFlManZHYWNYdmJKWU1ud1BEdjhib2ZscW1Sb1dBeWM4OGZ3b2dnbDJu?=
 =?utf-8?B?dSt5a2Vya29NWHhWMmRDODBNcWNHZ1QrR3RodC8ydHQreVc0RUdZdVlKSUF0?=
 =?utf-8?B?ZFF4Zlk0S2pxcTNVQ216S0VzcDZxSUh0R0NOMGJaYmRvOHV6V1JvR0wvdlVI?=
 =?utf-8?B?K3l1Mzg3Q3h6d25FM3VwWUppeUJUVkpDaE4xdXFFdmpKZlM2YVJsb3h6SXdR?=
 =?utf-8?B?OTdPaG5hQktUMHpudXlnQ29nczJNL3k3enZkNklUZm1qemdZOENLbk9aNm8v?=
 =?utf-8?B?cXhpZXVZdEdkTnpiejhYQzZXTHZFVDZPNmxiNGRwZmdtalJrTCsrR01tOEJN?=
 =?utf-8?B?NVRPZWNZWTZnempoOVRwZXZJOHBsazV1dk5ycGN0RTM2eEZsbHJqRjBrc2ph?=
 =?utf-8?B?ZEJ1OGdTeWlIWlVmM3F5amlZc1NkUU1ydTQyQVJrSy9zeFZWSkxhVy9LMXM3?=
 =?utf-8?B?Rko5WnlibS81bStmQXBUUWpMWlNwWWJpS3lUNnBHZkgvS1J4WEh1aml0YkxT?=
 =?utf-8?B?M2lieGtXRTFWMDVFdnhsREVDZE5rWVdUZm1zaDBHb0NVQUtYS3Rla2xvcm9G?=
 =?utf-8?B?L3RvcklqNVJWeTlMaEQrdTZCdGpIVDFGYytiaE01VE9FMzcyYmQ1TTg2RlRj?=
 =?utf-8?B?Ynk5cGplem5pd1RXdmdubHFnYW94cXdwZld6NW5iSnhvM0p0OHZsMjNzZEFr?=
 =?utf-8?Q?NawBauCU6DW0eUqj/jWcXnumiTbqw77EVDS3jBDzZV+ph?=
X-MS-Exchange-AntiSpam-MessageData-1: S8xJAxjRdLldVg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a35e4da6-d8f2-4798-8476-08da3a303944
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 07:13:22.2479 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2yX/qjnQhw7q3E6VxJC3Dwo0E107THn6zce5jrgXSbL6VRtoFV1Oomk5RKiVOv2k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2670
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
Cc: "matthew.william.auld@gmail.com" <matthew.william.auld@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 19.05.22 um 15:19 schrieb Ruhl, Michael J:
>> -----Original Message-----
>> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
>> Christian König
>> Sent: Thursday, May 19, 2022 5:55 AM
>> To: intel-gfx@lists.freedesktop.org
>> Cc: matthew.william.auld@gmail.com; Christian König
>> <christian.koenig@amd.com>; dri-devel@lists.freedesktop.org
>> Subject: [PATCH 02/11] drm/nouveau: switch over to ttm_bo_init_reserved
>>
>> Use the new interface instead.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>> drivers/gpu/drm/nouveau/nouveau_bo.c | 10 +++++++---
>> 1 file changed, 7 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c
>> b/drivers/gpu/drm/nouveau/nouveau_bo.c
>> index 05076e530e7d..858b9382036c 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
>> @@ -302,19 +302,23 @@ nouveau_bo_init(struct nouveau_bo *nvbo, u64
>> size, int align, u32 domain,
>> 		struct sg_table *sg, struct dma_resv *robj)
>> {
>> 	int type = sg ? ttm_bo_type_sg : ttm_bo_type_device;
>> +	struct ttm_operation_ctx ctx = { false, false };
>> 	int ret;
>>
>> 	nouveau_bo_placement_set(nvbo, domain, 0);
>> 	INIT_LIST_HEAD(&nvbo->io_reserve_lru);
>>
>> -	ret = ttm_bo_init(nvbo->bo.bdev, &nvbo->bo, size, type,
>> -			  &nvbo->placement, align >> PAGE_SHIFT, false, sg,
>> -			  robj, nouveau_bo_del_ttm);
>> +	ret = ttm_bo_init_reserved(nvbo->bo.bdev, &nvbo->bo, size, type,
>> +				   &nvbo->placement, align >> PAGE_SHIFT,
>> &ctx,
>> +				   sg, robj, nouveau_bo_del_ttm);
>> 	if (ret) {
>> 		/* ttm will call nouveau_bo_del_ttm if it fails.. */
>> 		return ret;
>> 	}
>>
>> +	if (!robj)
>> +		ttm_bo_unreserve(&nvbo->bo);
>> +
> Ok, this implies that patch 1 does have an issue.
>
> I see this usage in patch 1, 2, and 3.  Would it make sense to move this
> _unreserve to ttm_bo_init_reserved?

Well the whole point of ttm_bo_init_reserved is that you need to do the 
un-reserve manually.

But yeah, you are right. It would just make much more sense to rename 
ttm_bo_init() instead of adjusting all of it's users.

Thanks,
Christian.

>
> Mike
>
>> 	return 0;
>> }
>>
>> --
>> 2.25.1

