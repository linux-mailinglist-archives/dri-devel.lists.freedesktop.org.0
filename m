Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E59CC813519
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 16:45:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4985B10E9E0;
	Thu, 14 Dec 2023 15:45:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1FCB10E92D
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 15:45:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BLwvNU25XkNcUHMc/pgJT+ITVSsmG2D2ra09OsM+LAb5XG+sk/RPZEi8UkAuyCkPQTKlFPTUBtWVdT7VIwvMdUQ2ATZnvF7q6MBGkoThEBteRN2GuXQMOYzunVOQy7BitCXvYkNXOxn6L8AB4BVGv9vK0M+En7IKsTTVicij0/H2cEUUcR6zfQDfhb/qNeqm9Rw2/+yIVkRTv0VnoJrIj0oIyLwV6aZ35hyrSahf7gw8iMqIer1JDh/3MTax+U1y30xd3v+sEeXL6XQ2CUTIjBHeDTMCz8nxqtndf0+/xIpqLRRbD6tQl+6Ec6sMhIRbPKFTUI8A0eluwCHcexvyDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5dOyEGbACx093MOh90I7ghYFDSLjo5CFGhKlUadrzd4=;
 b=N6PwRvct0sC9wlzAyCZc1Xwu56A5zQljHvY0MHA4GMgkMdYznjTR6sI1yClUgMIrCbkWtMjCio8sy7CQIJataUGd1SoUvdvcOHwVW598t8gaigxPcSFnBF2loer4wZFo9lRD3Uq6ChkUYIMAZ7pwQIMGaNIVTGNbQuBVlPGCemZDq4GvwIjdZqMecK/9ePEfM+x0U7VyafaoXJR472i6Yajl3P1Jh5NaDfk1FY0quuILEFdObiZhKGbVe+2DSACByc7tU1CbJLexUPLyAOv3BiZhOZAFIuCrhXJKwRqiAZynFa8mJqpfG7UPyzEq0cjwfWX9Y6deuWA91Pnq4k8jag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5dOyEGbACx093MOh90I7ghYFDSLjo5CFGhKlUadrzd4=;
 b=YraqXRSpe5D8UooeFgaKQZ2+CvZUoLAK2UQ/ctcr3oda6RxiE1wXeicRCmhK2z7u9/QeiKamNswTOFZ7uI2er1DiCKyanNUG06KPfKIjZ9gZ6wVTAbrZtREKvsvhGF/ojD1pvMFE6w0DTQ+NWe6UJfSQ8Y546lniUqApbaMaLKY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH8PR12MB6794.namprd12.prod.outlook.com (2603:10b6:510:1c5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.29; Thu, 14 Dec
 2023 15:44:59 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%7]) with mapi id 15.20.7091.029; Thu, 14 Dec 2023
 15:44:59 +0000
Message-ID: <3a47cd8d-fc54-44b0-98ae-e90e81d53f91@amd.com>
Date: Thu, 14 Dec 2023 16:44:53 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] dma-buf: Fix dma reservation with zero fences
Content-Language: en-US
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20231214120824.655946-1-mika.kuoppala@linux.intel.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20231214120824.655946-1-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR5P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f1::18) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH8PR12MB6794:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dd45faf-665e-4b33-9114-08dbfcbba0a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R+UBWeuf5BNTJpXlCZsSoESPz4mByAAKNaepo32N9CA+5EbuBb9El81KfWtXvXHrU0smw+swwYe1lozqBR8GU9Qom6ntpWAXe1AWwn9d1zSrrZYaWUcsfgkjiPnt8R5LyOqnCh9fWNQsBIjO5cxEAl2GyMdbMuaFYfRXfY0RurWU79SQVZ282gKS8hoTLmp9E5cYqAUOnHvWDHU1yDxR3V9ttFXVqxQLwyOWGgWuvt0dIYwd2EkeJHvAuW8bBuBT00ZmTsDM9q9VLNq9WC6fFtA7QBrjhc1aKKCuOXSYOxiS5qrswd/0avz3XPUwjJ17pQblxwZ4KI/aHrYbzbbEg0sHUDWPQere0iSsLwz0shnmkSCp6NQmanUo6dC0jdy9qxuPdcR4titsu/T+LyNPbqJ9gKz/5nifiVmqzcxILgG2A6j3h7QUl0cPxbWdCps6b2aq8rgpyLGws1NalcBPYqlhnUS7N+P+KcnR19G/bQesyTOCVaQNPGYVqCmR8zYZ4hjdQkNQqpKHmhHwh637Sio+gApXo/EI00mBIOXcFhZiZ9Z4XS0DQyIcifK2NY0DSwRtxcsa6G6llRydNeT+Xxx5A+NCVRS5JOdjMnUb7KXdvkRCTyY8/bVPJoP8eqQO/B6ZXXIQVK8kt6Hp+9y3LA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(396003)(376002)(39860400002)(366004)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(31686004)(66574015)(26005)(6506007)(2616005)(36756003)(86362001)(31696002)(38100700002)(5660300002)(83380400001)(4326008)(6512007)(6666004)(316002)(66946007)(8676002)(6486002)(8936002)(66556008)(66476007)(41300700001)(2906002)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2s1RVBpY3M0aHlvK04wYmJrbWczSEwzN3RBajF3WU94L3U0WUdXUytESXZr?=
 =?utf-8?B?bDhlYi95bmJNMEJVbk9ML25ubGhnUkYzcytBMnF6U1BOaTMrcDFpQ1JWRjlB?=
 =?utf-8?B?TkRkQzdKaDR6a05sQk9MdlVBd2cycndqU2xmN2dEK3hFWkpCVVBlTWVXQWFj?=
 =?utf-8?B?b0dndndQanpIdnN5T3puNnRaRHhsS2p5T0hYcm1TVGUzZEdaNXY4MUtyRFo5?=
 =?utf-8?B?M04zWlRsNXNnY3ErZU0vR3NyTGU4VWhmeHdXZWpWSTJvMmZpa1Fob2tSa3NH?=
 =?utf-8?B?Z2pVQmVDWHpoR2d1Y0trS3ZYTWlDNTV5eFZNaWd3cE9iVndURGpRK2JSVCtJ?=
 =?utf-8?B?d0Y4L2tvVkJrK0FmaThCWEVjcXFkcnI1RC9VNmlILyttNzM0S3cxNW15eDE3?=
 =?utf-8?B?YytOU3V4RDQxNVE1TDQycTVaRG00VTR3QlRKakZDTmp0dk9SNG1WWVAyVWFI?=
 =?utf-8?B?UWJRUkREVlpIWWh2aFFKMk55QjRrRW1NN2xZMVRZbnBQQWJBWXpOYlEzb0F6?=
 =?utf-8?B?d1RLV0NaRFl6SHhCL3BISUd0UDc0YjNReEd2TXVUYlJNekptZmFWOHBFMEZT?=
 =?utf-8?B?VzYxLy91anpuaFNONDJtTVdSdUV5cnJYMG1kcnIxMGQ5dlpncE1WWklzWStL?=
 =?utf-8?B?bzF2dHEzOG5hZVlEQTNSSTVtTHFzYTEyWFRpK2lzZ3BmamY0bHU3UDV5TGdv?=
 =?utf-8?B?OVh1RFVKWURaV01xZVFDWklTNUk5azhEMFJiWVBKMVRRVUdvejBzQXk4L1Vw?=
 =?utf-8?B?R1NxUjlIVkJXTStJbWxseTh5Z3FoTlpBK0ZyZEdwQytPellGaTNNdjd3SCtm?=
 =?utf-8?B?dnp5ZzZsOVpEbVJVVzNrbnBKOUU4eG1YVy9HUFVPS0FZa2FOanpMeGZBYmIw?=
 =?utf-8?B?R0pyekNYbjUzTUU1M2tuc0pHeVJpb1VPVWhHK2MyL1F3bXJaWVVaZVFpa05E?=
 =?utf-8?B?WnAyd293VVNtQVZOaW45VkQzVmtHZTkySUFPdk91WWxDcDVOWUpYRmRqbVhT?=
 =?utf-8?B?UTRtajdGeVFRVEkwMDQvRDJsdWpmSy9XSmRPMFR5Q3RuSFpwQkN0enFla1hi?=
 =?utf-8?B?TFI5R0pDQXRNMStTd29kRTF1RS9kY2ZWSG85cldJWmdWTkxFTmpneWQyZVFm?=
 =?utf-8?B?aWZwYzRCYjlzWDVwRzI1ZWFYeEozVER5aVR6SGxGQVBCZkRpWWVjRUt1RXhr?=
 =?utf-8?B?dzJjb0llR0hGNE1TNmF4b0xsNGtWK0NmVDRSOElWMFA4Rnp4aXl2cVFHeXFT?=
 =?utf-8?B?ZjU3NG5Xc3dLYnhZMzFiZVdlWm1tZFJqcCszK1k4Y2MyYnlKd3BhQUJweE9N?=
 =?utf-8?B?dld3K2NIZm1WWVY1WHZzK0lLVUdTNkN2bVF1NXFjbHVwODBVZGVrZHFCVWtm?=
 =?utf-8?B?VElTSW1mdmhqVE5LZ2xWUGFHN3lGdkpmMjlrY3JrZ3V5QmJyMzk3dzhjRlhp?=
 =?utf-8?B?ZGJ6dThVY0Y0eWJKRy93cldVUEE3ekpkWEJxYTR2UE45U2YralpPN0JENnNF?=
 =?utf-8?B?MTBtRjloeVNsZ01MTTREKzhuTkVGRWFoSGx2Z21EUGM0ejByU0NtOUdJSTly?=
 =?utf-8?B?ak1ONnlCK0VxYndBcU5mYlZpRTVaTUNFMkpoZm5kZk9PaTlwSG9pUDY2WmlW?=
 =?utf-8?B?UE1lNUdDNU9YK2hJQVRZejdjZTdVYTI5WG5xWGl1TDhVWXluckszcGVaZUVP?=
 =?utf-8?B?bzUzODU2MUpxdnZtYUR6MCtQRFNGdU9nc2NkTDFXK0IybmtseHE3NXNuVFlE?=
 =?utf-8?B?WFpEZ1FSNXUxUEJpK013ejZ6N1VGR25LeE5lM3NFMVc2ZFp2ZWt5VkFrdU1N?=
 =?utf-8?B?aGdwaUxxelg0NEVITjVXSFB5OGxiUkVJVHZaT0JkMERyRCt0cVFoQzR2M0Fy?=
 =?utf-8?B?YzJjL2JTd0FDbW5reDhzeHRjTHYza0dQdFpxa0xsVGVaUFQyZUlQeVZZNlBC?=
 =?utf-8?B?UG9kNEY5SDd6MUNxcEU1cThPSENqWTR6R0E3VmxsZi9iYi9xZytWK0l1Uzcr?=
 =?utf-8?B?N3cvSkJGUUxmcWltdzJKSDlxQXB5SXVOVmM4U1V2Q2treTdvbWt3ZnMwWEtz?=
 =?utf-8?B?NkJQanBrWUtZUnRkeVUyaUIyY011T3ZibmhkeEg4U09vWjhtRXdBRzYrcFpQ?=
 =?utf-8?Q?oIvo=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dd45faf-665e-4b33-9114-08dbfcbba0a2
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2023 15:44:59.1808 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: opfoCIUMpR1gCueFybB+G75lSWNXcWfRT7h8Zn2APcCDK3WpoH4EjNK+ZYUB8Fk+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6794
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
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 14.12.23 um 13:08 schrieb Mika Kuoppala:
> Driver can initialize without any fences. If so
> roundup_power_of_two will overflow as it will try to
> subtract one from initial value before shift,
> (1 << fls_long(-1)).

Ah, yes that reminds me that I wanted to take care of this as well.

But solving it like this is the wrong approach. A couple of driver 
calculate the number of fences needed based on userspace input. If that 
results in zero then you certainly have a bug in your driver.

Since calling dma_resv_reserve_fences() with num_fences==0 does make 
much sense we should really just warn about it and just return early 
from the function.

Regards,
Christian.


>
> Fix this using default (4) if num_fences is zero.
>
> Another more radical option would be to return error on
> zero but that would need a callsite comb.
>
> Caught-by: UBSAN
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> ---
>   drivers/dma-buf/dma-resv.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 38b4110378de..f5ad3ecd0d4f 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -192,7 +192,10 @@ int dma_resv_reserve_fences(struct dma_resv *obj, unsigned int num_fences)
>   			return 0;
>   		max = max(old->num_fences + num_fences, old->max_fences * 2);
>   	} else {
> -		max = max(4ul, roundup_pow_of_two(num_fences));
> +		if (num_fences)
> +			max = max(4ul, roundup_pow_of_two(num_fences));
> +		else
> +			max = 4ul;
>   	}
>   
>   	new = dma_resv_list_alloc(max);

