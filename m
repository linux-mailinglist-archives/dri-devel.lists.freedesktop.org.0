Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BB8A7654F
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 14:03:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4336E10E3E3;
	Mon, 31 Mar 2025 12:02:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ku4JzA0m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2055.outbound.protection.outlook.com [40.107.102.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7565C10E3E4
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 12:02:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LaRX/Ep2lh7oTrocyjyO/rdsNgrRvLxxFGyruUAJPxtaReqRAu7TIMZI+Rh+GhmZtMqiIe8dPXlH11BZEvo+6Y0Nmdf6GuZDXXnSJ+rcag0YMcUDLU5dj0JjdMEQIPzAbQdj4H/yUN4sA3loH+AT+od3ZnCbmrhHJJ38pKqHtXHAHHZC9GB7SqfNQStwwPryVpjVpbJLKVc2FDc65XazYkIPjRgebtguJEGQ/ud+hLGOTqtpAvRV3WrJeBVVR6BaRPpWJIokuqnpdLpNrnpISNGNqWSSfVgV9HQCZxIbPnYhAuEmvIKMYi7kLRFzMTc9ZTGUYGZEbNVFjN2U60Ujig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nWKAulidP2arLfx1NJfuRCf+GhG/M58AoJI5HLZZh+I=;
 b=P41GYhiy1vCnejeBoXF5ak2eww43BcFW+xZCqj5nKI2v4XyNYP1o9qs++pvrmpKdL7spH+NNQ1DtOLQhDUroSkuZC0RO5vQIBwhuc1y3Hv9aW1iBg95hJ5sfPVUFIUNFaODq55Crko7quvKUJIuPrHqHRUagXhguZiMn3lB8CXCUIgRfzUONhFS2DTjMnq4VQttQ7KBqizJiG1rL+km7feV0EYEgy2gd7lufEZARL2UjjsGUQPOY2NX1vfi5Tqu2Pnugv3f9YF5UyEhfrBr+1sCoDmnanLIw6H3IBGoaOsFISJnoZHvH/iu4n9Rb9E2emLdH90gFprSKvcNt9+Herg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nWKAulidP2arLfx1NJfuRCf+GhG/M58AoJI5HLZZh+I=;
 b=ku4JzA0mlS3odECRFEBL3AE/3g2kRcr7mVRZISfQ3MUKDvFMzu+QBD0f8Fs20Aw+gH4Ep1xXgAVXLP+3Ku8Jfx0vUyIYNrnGIQorYSjNZEmH4WfqOS8cuHDX9ycVpQLIVyC7JgCxv7gM/0udsCYE36XbVWkxj9ByHprHzTrxDBg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ0PR12MB7081.namprd12.prod.outlook.com (2603:10b6:a03:4ae::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 12:02:51 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 12:02:51 +0000
Message-ID: <0e832ed8-9692-43ba-869d-8db3b419f3a9@amd.com>
Date: Mon, 31 Mar 2025 14:02:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf/sw_sync: Decrement refcount on error in
 sw_sync_ioctl_get_deadline()
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Rob Clark <robdclark@chromium.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <5dbd6105-3acf-47ad-84d6-2920171916ac@stanley.mountain>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <5dbd6105-3acf-47ad-84d6-2920171916ac@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ0PR12MB7081:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e32cdac-7bc3-4086-5da1-08dd704bf5ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RDVWa0xtcnVySk1QOTl4RXRacmtOYVFlZW9TYUpzWGUxT3JjS2dnVVZRenZo?=
 =?utf-8?B?aWFrWDZhcm8vN2hvaG81d3hYdEkrL3dQMG5HTklNZkwvdUJMdW9iQ0hObnhQ?=
 =?utf-8?B?Zm91S0dUcW11c01GK3hMRFpFa0o3cTMvN3ZObjJxUFN3N3NqWXF6TGNJS2Nl?=
 =?utf-8?B?Wjg1bmgvYmhqRlFqREhlOHVtOXZTSkM0ZjdNMTczSDNzc2xBT2ttSC9lZlAx?=
 =?utf-8?B?MFJXU3MxdW1WRE5PeTdwLzVVYUxVQ1N3dlExOXJqbTRodGVKNk9DQmJCdFh6?=
 =?utf-8?B?N3RkVHRUVWlDWjlBNG1HYmU2aDN5d3FhbDV3eGVzNWZ3VGd5dDVQT2Y5RThH?=
 =?utf-8?B?UzBXNDFEYWtlZExZRTNqVlA3R0pRN3kvYzk3b1dzRTFjUTdlUkpKYnFTNkhn?=
 =?utf-8?B?T3EwVnRYTHhLZHI4YUtZOUF2OG45REFKRnRmVEkyamIwUWVTTVE0dWVTdVkx?=
 =?utf-8?B?dEFGU1pFWWJGVTg3ZCtnQVdtYVoyK01ETjBLbCs2UjQxUzZqNG43MHpRcFRY?=
 =?utf-8?B?eXpRRE5TbU5Wb2ZKOEZRcjVQVEYxQ25rNjBrVDNqK2F4YTBCRTdpZExmZ29r?=
 =?utf-8?B?eENDSHRJVjJpT0VqblgvdE9pMEQxUFhaQXp4alNjdklrREVUcTNxTzllM2FH?=
 =?utf-8?B?TUs1UytVallncHJkSkx0ZmpqWFZhM1V6bGsxOVd4REY2K1BmTnFPYTMzTGhs?=
 =?utf-8?B?alRwV0hneEw3bWd2TExQWDJ1aXR2eXQ2bVhNb1l3Q2ZlbVZPOFVjR0MwdUgz?=
 =?utf-8?B?QjRramt5YlA0dnJla09UNmJXb0hEbjFrVEJNUUY3dWlTK1ZrVVVWcEpzbjRy?=
 =?utf-8?B?M3YvMmFxMDBOSXdnSjV6YlkydVQ0aHV2REVpRjA0Ui9oUzdQZURqeXY2c0I2?=
 =?utf-8?B?bFJhaUl5YUVwbzdKMTNiZnR4ZXp2cXJmWGZSaWxTM3FWM2xUSUJsYVN5bDAw?=
 =?utf-8?B?VWVuR3BxalcyYko4Yy82aFpiZ0xRVDc4WVFpUVN1NkVrRUxtWTMyM2Y1OW5X?=
 =?utf-8?B?d2VPcXhvU2gwdVcyMVU3eExTRWhsWjV0UkhkZU5PK1gzYjZoOE00NHo2Vzlm?=
 =?utf-8?B?UXVyalFiMStkUUJGNmJPTTlPRWtkUVd4TGxrdCtNdmdmZE9GcE10Vy90cG56?=
 =?utf-8?B?VVlKZlZ0RThvSm9ocTVDTkZHODhMUENoMTVTSTF1aWkvM2NEYWZLY2ZjWkFh?=
 =?utf-8?B?NGlXbGY1c2Y0Ukc4VlkrWkxQbjN4dy9VY01oejhBd1RjNGs3dU8xTkRJdVpY?=
 =?utf-8?B?RCtmOE4yMzlVYnpqMWpycUtpNmpueTRXQmVZTWFBOG5zOGh2YnplQnJONXNC?=
 =?utf-8?B?Q3dOUFFxckdCT3QrTWtSdTNYbzdGM09ackJiaUdPdnA2MDV1MVhFcmJrRnhB?=
 =?utf-8?B?SkN1N2g2UFdablpOVEMrMWhVUUpESDl5dVI5OFFHU3Zoa0FEbVkyOU9xazFC?=
 =?utf-8?B?TFpxbXRXbzU2VitoREp0bmRJMk9oczE1a2J6dE94dDhFMVpURUovaVFBa0NY?=
 =?utf-8?B?UFpJZWh5VVU5M2UzM2drWHdXT3BkZWUrbS9hYlByNmFuOFcwVW9Nb0l5OGhK?=
 =?utf-8?B?dUZHbWJnT0s4ZExXYk44NlNqbTBRZkttbzB1WjBHT2FraWNsemNaTmladDU5?=
 =?utf-8?B?VjVWVUc2NElaV0pKcWV5Sk5jc01DRjhldDZ2dUY0K0hZTkF4K0t2aFlkc0dB?=
 =?utf-8?B?RlNHOXdZaWw0Zmg3RWVVQlNpeFBpZlpNRGNnKzhzckN1c0hjSHQ1dSt6a1Ix?=
 =?utf-8?B?bXNzTTA5dWU1bVdMZi9OVm9JYmx3M0R2QzB1OTM0WEU4NDREeDd3M2grcE1p?=
 =?utf-8?B?KzZZcmwyeS9COWRadGxUdHRXL3JqQ25JNGxWZjJRb0JsVzBVKzN2bFBoUW84?=
 =?utf-8?Q?9fItco3WwKRqw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXNzYzRXS1g3UVBqcFJ1bm9odlhzVGtOcTlxMDY5SkpRTjhqY3BiRVVzSEo1?=
 =?utf-8?B?SDFZNVpsM3JzNGthbEd1aHR4WEFLcTg2bVErTW00cHAwN2dsd1JJNEN3OWRy?=
 =?utf-8?B?UHRwOTNON2dLZitnWHZRTlRETGxTUVFIazU4Tmczbk1DeWNYNjJicE0rQzRR?=
 =?utf-8?B?cmJFYkw0WnBza0tJSnFQVlVEY0p0TGdZMUpWQ1N4S0Rwb1Y5cXBoM2FQYzQ4?=
 =?utf-8?B?WkNGbkdNeVNlUjhScFJkYlFXMDFZcE9wajJ5Y2Iyai85SGdiM0NRd3NZdzBS?=
 =?utf-8?B?ZlFKSjJBaHVGWEpKY0phRkNOSEZZam44TjZtd0NTUFBCVmdvc1pvN24yRjFL?=
 =?utf-8?B?UDlla3d1QnpCdWE0WVZDTDVCOXNNM2tvd2lRRWl6NmRzQmhiVThhVnkxdFZX?=
 =?utf-8?B?MTZjelVtNmJab3E3WmJCL1dJMnE0eXJwQmJkcEc1amxxVlZHTzhCOEU2M2JQ?=
 =?utf-8?B?ZmhmdmFIRUYxTUhqLzZmSGE3TlBTcGhSem84djRhbS8yUFdLUXhIcUJJZHg0?=
 =?utf-8?B?Vm5kbUxFQmZHcWtnSlBTdlEyS211c0pCUmtZeHlMMENsVUVleXR6Z0J1RW4y?=
 =?utf-8?B?OWxMSnhMVXJjYk5WT2ZlRG9Ud2oxQmk0Y3pTOWNWZWVuUlNRNzhBeDFDUG93?=
 =?utf-8?B?MVpaaEhuMHBoaGJaOTVaME4wZnNsN1ZJR1creTRJd05jdUpjUzFSWGdXV1gr?=
 =?utf-8?B?dTFRanhNanhUMjNKbnl4TEpyR1l5TmZ1STFzUGE2aXRlZ0laMDlvWVM2VW44?=
 =?utf-8?B?SXdtUytjSGJxMWJsRE1uWG1YWHpqTFZVQk9CeXlqMUhZbXJraWZneGFDYzF3?=
 =?utf-8?B?R2g3TzB5UCtXQTNPNDBQazZlKy9FZEc5TGZtZnFUTVFNSmNBU0ZYWUV1SC84?=
 =?utf-8?B?T0UvdnFMcXJVL25iU2JaQ0ZrbHdJdHNBT01MY1k3OTdlNDRVQlBtSnR3eDhC?=
 =?utf-8?B?eElTS24xb2VOb3RZZmNwd0ZwQklqdVJUZWw0Y1BORVozRlNUR1FXNENRaStJ?=
 =?utf-8?B?Z2MydmE1TC9XbWEvZVJhRkNQSnBMVDVxbHU4dHYxRUMzWWxKK29XZCs0NFdr?=
 =?utf-8?B?bndkd2F0OENnTk5GTnluSitpK0Z1amtyTGhSaUYzQkl2bHRtZ2VLYmZNR1Rl?=
 =?utf-8?B?aStYOWRXMWhydWJTN0ZFem55UE5xTlZwUXFuUExFR3NJYXhGNkZaUE12cHNl?=
 =?utf-8?B?S2FaVHg3ekUyRFQ4RnRWdVNrK1Fham5aTGFaSlhjZitTNjdYU2l3OTJvSWx1?=
 =?utf-8?B?OHZIZTNYeWl1LytCaGMvSXYvSG11ZUFqN0daUkNJdE5QV0FISXkrYjBhbURL?=
 =?utf-8?B?OGNkbmtJS20rUnhCN0RrR2JzOEJlVG5USGJHZzVwNlZjbEFGYTZKYUxQQmlR?=
 =?utf-8?B?WUpSNWxqQjNBdlhDWFk0TUhtQ1hIR1BSSzhoSUFJRTdDdjJMVHFIak44ZTIv?=
 =?utf-8?B?aDYrZTQ2R0pMZXBxQW1Yc3l6aGhxSWdFRlE1OWhma0pDMERrcUhXZDJZN2tO?=
 =?utf-8?B?ZHY2Q0EwNVR3YkF6eDcvNWhXWmpUclp1U2psOHhVNEl0a0QrbjV6QjNQS05w?=
 =?utf-8?B?V1VMWWY5NTlaODdLUDFidDAwUDM2WDZsNm1qb1NKQ2NaejZHL3YyVlB1K0cz?=
 =?utf-8?B?UGQ3dVFUYnpod0g0cUFVWUNoaDRpYmt2RklvTExtSEY3bTFQQVZSV0NQS2JD?=
 =?utf-8?B?clUzM3JSMzV6ZTNPdENWK01jVUR0d3lBa0tlem9NeVovb2ZTU2lCMllZV0VR?=
 =?utf-8?B?SWVEOEJrZDVzdVByWnFFQUtmaWdyUm11dTBrVFpDcWw4QUp1MmVVZ0F1am9Z?=
 =?utf-8?B?cnhEc3Y2cDJRZzAzSnhvT1dqckE4aWNiOFFxcFdjV0RHY2hIRGVEUUNKakdE?=
 =?utf-8?B?N09KWmtIdEViTEpSL1o1d2RHMzYwMElka1pKd0pjOXBEcFBCVHhWMDFWcFBK?=
 =?utf-8?B?WXc5azcxdDVuOWhhT3lzd29KVmdFWVpEalBPbkU1T29CaU05Nk9jSzJtVi84?=
 =?utf-8?B?YmNPdlN1SzZ3clNhOHh5UkRrVHcyZy9DaGExem96bk8yTzlKNUphSUF2N2w3?=
 =?utf-8?B?WTMzVFpGd0VoeTB3c1NjUzkzTmtvMXNrR2RPYnFwR1JpbHFrbjdaQzVJeGlB?=
 =?utf-8?Q?9pRnJaui056PunrQznUHEhX6f?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e32cdac-7bc3-4086-5da1-08dd704bf5ee
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 12:02:50.9909 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +0W5aNRcMBnwNzwCtWmacOVvz37zGvFDwqCgqzgkHOqnHkTjhGcAsKXdrAfo/cK2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7081
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

Am 31.03.25 um 11:45 schrieb Dan Carpenter:
> Call dma_fence_put(fence) before returning an error on this error path.
>
> Fixes: 70e67aaec2f4 ("dma-buf/sw_sync: Add fence deadline support")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/dma-buf/sw_sync.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
> index f5905d67dedb..b7615c5c6cac 100644
> --- a/drivers/dma-buf/sw_sync.c
> +++ b/drivers/dma-buf/sw_sync.c
> @@ -438,8 +438,10 @@ static int sw_sync_ioctl_get_deadline(struct sync_timeline *obj, unsigned long a
>  		return -EINVAL;
>  
>  	pt = dma_fence_to_sync_pt(fence);
> -	if (!pt)
> +	if (!pt) {
> +		dma_fence_put(fence);
>  		return -EINVAL;
> +	}

Good catch.

I think it would be cleaner if we add an error label and then use "ret = -EINVAL; goto error;" here as well as a few lines below when ret is set to -ENOENT.

This way we can also avoid the ret = 0 in the declaration and let the compiler actually check the lifetime of the assignment.

Regards,
Christian.

>  
>  	spin_lock_irqsave(fence->lock, flags);
>  	if (test_bit(SW_SYNC_HAS_DEADLINE_BIT, &fence->flags)) {

