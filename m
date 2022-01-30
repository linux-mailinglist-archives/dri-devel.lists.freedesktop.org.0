Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B654A3545
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jan 2022 09:56:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62AA510E46D;
	Sun, 30 Jan 2022 08:56:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062.outbound.protection.outlook.com [40.107.223.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACBB410E36D;
 Sun, 30 Jan 2022 08:56:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hTLOSL5NFMKxPKzag2LR6lhUIvgayHD5EoPKRrw/JQlQcZKmg5jUYlZahtT9h/hMgG+RALxz2/YwoGPhZBXWfsP0+KIBNWu9DFW5ACj5E4JqLYMubBouUjulALCFILRMzHPMtrfa81MAM5gvPZqzyic3LkxhdFtCGimuRHP9An5mm2Gr/uCvt+ltpKzDY3o2UE310hiTegVYfQFGFBfaiwePgRaILjSHqrYDm2CeaZRmRqU2nQX3AEKAdHCvU9PYadRMS0k9AFDYTKJGg+xPtSm2ZEQSSSCzaC7Jh4VA5CU3aSVN+3A4fUzpUJBnuZBvFtF/82sS9MoKukstfvruwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jinb9YxQ/evN0+1R8I6AWE6ZHuvYpbfuOSqAkbe6nc8=;
 b=KzfDnQ7fKcLIk6RZMQ1QzGzlhAP4I2zXtWoKGv8Qa98igiNqWfZhWylJXoISawh1ptuBqVUyCfjZROOs+Ul9+cgNfoEcSNAQqLZ4nfPgdNI3B091nQxHDr8dBqOpg9Io1HCZpkc3DTAf1xZt+JNFNr3Is79x4orQswI5lyZJyFln2qOr5EPuwwZt8IMj2Ya851TDkAWPMiaw18Na2g87S7GFqMW7NkjynXIxGCQ7eEQ/YZSqNzbvjScEKiBABoSqeNNyLFP2iwAXPgLHCOfSlb/pC4ECKLZXNeRH8crxk99Vln1BIvUfqQ6rnB9un5+DA/ocrDjt+4noncG/+NLrPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jinb9YxQ/evN0+1R8I6AWE6ZHuvYpbfuOSqAkbe6nc8=;
 b=3x5Uh+ezsTUQG1du/Jonz3r6emBRsvh4XiDrXjdqPxfdET6IBKU5seTt/KZXWcAoZyVTzAIPgbptk+sAfimqOfm14WwDGBcsajUZyMwLSfE84Pu75Gt4rxAbOqimT8Y9H3E8G8FGFz63iOQaEQKfnPhGZhWJu4zgT14uINI/RZQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN9PR12MB5340.namprd12.prod.outlook.com (2603:10b6:408:105::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Sun, 30 Jan
 2022 08:56:17 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d861:5699:8188:7bd3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d861:5699:8188:7bd3%3]) with mapi id 15.20.4930.020; Sun, 30 Jan 2022
 08:56:17 +0000
Message-ID: <bebb72d9-f9cc-c247-2d1c-96495aaf5f54@amd.com>
Date: Sun, 30 Jan 2022 09:56:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/2] drm/radeon/uvd: Fix forgotten unmap buffer objects
Content-Language: en-US
To: zhanglianjie <zhanglianjie@uniontech.com>,
 Alex Deucher <alexander.deucher@amd.com>
References: <20220129073524.31534-1-zhanglianjie@uniontech.com>
 <20220129073524.31534-2-zhanglianjie@uniontech.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220129073524.31534-2-zhanglianjie@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P251CA0013.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:2f2::28) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8688487-e49f-45eb-f9d4-08d9e3ce6082
X-MS-TrafficTypeDiagnostic: BN9PR12MB5340:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB534024DE094040B98EFCF12683249@BN9PR12MB5340.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DstvgWoNw3RoAcfsG07Xw26/SKV39A0MIYpMsyhR5gOZEcJ2dyF4/fSX2d9yXU7IaTLGyflsGwIjxGfzTCDrO8rEfth7l0sySD1KEHkqdDB4q7lLTJU4uRQ0BC82Zk+nYY3JVsKUwhYfAoOf/el94tlf21rY1fep+O1hLEHwiVa4pIpqbUaS1qQ28LI+BeL6/Q+v3RHTpvH0c52w5oubnIp8jUeJgn+/NGpCfI/y1Deq2mDff2iJZcvsfmFLO2vpLU9BfPF9AlR3ZOfjjJdzovzo3hfpQB3OW4GlnXviyA544Sa4tzMWN0HgJNpDStJZHo/q3cd6z34rXQV8lpCByubm6TiJV38P32kpZJAIrhlKKgD+JidxY4L7xjZDt5u7Sf7bawedQxEhlpPm/0mwXcwkiYl0XZCFVcMZziXn6g734oaXTN+gNvQAZIMcfCF/3ZAjMXv6/s59JtEsu/QRd4ZTqQyt/fGpp6Xsky3w7Os6nfVIIbPKEwqzIh1bLM/DeauPgsTpkKq5M80lWuIzIAz9B6R6S3wj0bBUAYwmiY0RNJ/MKkHPZ/vUgCLzo4g/00jZfr3ZZkLIRTk1aWjb7qW4vtImr/mEZJJlmmjoFrht6ZsbXS48JkLi+O/bRbqaDMQWAdTWfkEmBAUA/QjZZWHUcQxbGAVbRYDOTP2U0qUoyPfeb7bPQtpKdpvmBUKqaK0dOM76gvGTHpmTnKgETh57TAGdHYLBslxw8zNlD6SR0FL2YBz7BqJBOC8JbbFI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66946007)(66556008)(316002)(86362001)(5660300002)(8676002)(66476007)(8936002)(83380400001)(4326008)(2616005)(110136005)(186003)(31696002)(6636002)(6486002)(54906003)(508600001)(6506007)(31686004)(2906002)(38100700002)(36756003)(6666004)(6512007)(45980500001)(43740500002)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmg2LzBFOUc3SnJZc0E2RkVhV0VaR0hFVnhCeTNMZkRyQW83M3dnNXhCUkpZ?=
 =?utf-8?B?aGVGYnBTeHpOQnhwUkpmcEFya0R0RW8yNFFUQlJmRk1MajZYTFBTR3VqRzVj?=
 =?utf-8?B?WThaYjVjRlRRZUhYYklwaTdxREZYNmlHSDNNZCs4bUJrSkxqVlYwaFJQalF3?=
 =?utf-8?B?ZU5zOVVhM0U3L0I2bGpHemFwQjE5UVNHN2ljeWNEWVQwVFh2WXVHc2xWL09i?=
 =?utf-8?B?VURLbnZXR25mbktxK0hndHdOWmsrNHJyY0dkdVpxTmUvbHlkQ2lROXBIYkYz?=
 =?utf-8?B?bW02L3ZtMTJZMnd5bnU0QXROSG12K1hLSHp1Z2poeE9ZNkRyMVp3MFpnVUlY?=
 =?utf-8?B?Q0FmRS9rYjdkQzNYV1ozekhUL01vT0NLYTh4Ykt2alAvUkx6MEtHQjZBcVZv?=
 =?utf-8?B?UlhDWVlwK05yeHl6ekNHbWYrdVRGdWc5YjEwTVEybmhTRkhEUEhnRDNsQ2pQ?=
 =?utf-8?B?dytwalFIZEFaZnNMYzlNRFNSTnY5cExFUWErdlhQbG9GckYvS3FJNlZ4RGMx?=
 =?utf-8?B?MXVnQkFaYURTTWkxWExScC93dEs3N01MTW5ESGlJODQ5ay9VTXJicnNhamRt?=
 =?utf-8?B?c1p6ZHZpekVnTVhTMzQ2YkNUVHEwbVg0L0lMMWhvcUtZNUUwdzZCa2RiV0R2?=
 =?utf-8?B?bjZqWG5zRE1mVm1SdTRFSEIyWERIR3FLb1VXcXpIWkFGWFNvNk5mM04rK2ky?=
 =?utf-8?B?T3M0dXFWOU9UU0VKNUF1TSs5czR5c3J0by9LRXlENmhiWHgyTGduZWZ1UWpp?=
 =?utf-8?B?Vm03L1J3UmptQ3pIcDU2VmkvUktxQzVPMUZ3aVFxVUo2QVFQbzRkWklFNkZW?=
 =?utf-8?B?eDFSN0dBNDFURm43Qk9DRThsdi8yc1l2bS9Ib1JKVnFoT0gyNndERCt2V29s?=
 =?utf-8?B?M1hVSnNzY2VOZUczaVZXaUhvWE9FUGJhTVlWVEpJVjZQNllESk9GditEYWpi?=
 =?utf-8?B?a3J1TVpNbmVOT0ZDQ1UxT2ZVMXJ4b0JnUnpvdSsyRHVzeXZkeGdRTFJMY2s2?=
 =?utf-8?B?cEwxTFU0ejNzR3kxVVF1YlFEVnFkUE0wSWtFV1dBMWxESHJlNGtkV2F5dktw?=
 =?utf-8?B?VGFJanlPUGlUWDRxSytQZEN1Z2RqUlg0NG1UT3NkbGRJd0RnamJJbFRrbjhD?=
 =?utf-8?B?eDZJUHp2ZHlhWm9SbHRPbk95UTV4ME81T3hLMk1QS2hVMzVuMFVRamExVTZz?=
 =?utf-8?B?SEsyNkNmUkVsQ0pzNlB6cFE5YU1uY3M4Q0k5Rlg0Tks2eFV6eVJsVzJZMzg3?=
 =?utf-8?B?WlRiZmxzaEpwdlRKb2czU3drdSttMEFYUmdyMFpQTWIvQ1A2NmVpa0I5TFo5?=
 =?utf-8?B?djlNcndKZmMwZUdEU2hNc214bHpWczBJWlV0YndLcDZKcW45aW96cDcyTHlO?=
 =?utf-8?B?S2E0ejJKZHh5Ymg5V0pJSGRaWExpbGRFRmJhSVlmOC9iUm1TdUJweDhMRlkr?=
 =?utf-8?B?eTFid2RUR3VWMzNLd3ZWZFpmSjQ4QVI1ZEpRWjNpRytpT1hyQXE4UG9udTFw?=
 =?utf-8?B?bjRxQnF2eFZCdWRGQW5uS3BBYXhuN0FIQUVZNmdRY3ZkWTZWajlEU2pyNEs0?=
 =?utf-8?B?YjY4TnRNWXBsTmhkblo0MFpqdTdBa2VLOGIyUlN6aGdzOTE1aGtYRUJRTWFm?=
 =?utf-8?B?bTJLeWNscHc2bnRCdHVsamErZ2xKalJNTXJuTGgwNkpCUjFNVy9jQVlGZTJ2?=
 =?utf-8?B?SHl5UTlURHdMRzFlOXFVditzVStsRElyOXVtYmxXTW8wcHNDUDdLUGhQdEFJ?=
 =?utf-8?B?bWwxVjJqY3JJOWM5TEdOQUg0bzlTbVZnNDRJWEU2R1A4SXBhc21weE5hR0lJ?=
 =?utf-8?B?UUtabnI4K3hSc1pPdnJOcFVZNEpTdUdEUk5XSHRqT0VpVm1TYSsrQll3M1Vj?=
 =?utf-8?B?c0QxQXNMTHpFdi9XWFhQaFZHSm40TWV5cGk1ZURZSmpPbThzdTdZeHAvaXFF?=
 =?utf-8?B?citlNzJENmpoV2plQU5VbHpnbGhUbERjYmc3Q1prcTFHQmxhaVkzN3kxWFV2?=
 =?utf-8?B?RHNqemhETnc0MXV6SThwMDNyL3hvQXlqN1c4ZDFrVUsvSHNJWHVRRzVmc2h1?=
 =?utf-8?B?cDE3cmtuLzJzRHNQWlJ6TjFnZ1o1YUNSeHBpQ2ZML2cvZkNnVFJFcDZTUkp0?=
 =?utf-8?B?ZTdpeFIzZkVLbXo4Z0Evb094MW5KT0VTSnlFU1NwZ0tPb2FjTEpQem5PMk5o?=
 =?utf-8?Q?r/Cgm1ERrSu/+WGLCKQSKAU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8688487-e49f-45eb-f9d4-08d9e3ce6082
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2022 08:56:17.4100 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cRDzwn1WmWh9XnDjSy3z0dj8ZarUDUnUYybR5sBZ2SryZ5p4Qms/SPWoUVyXSxAT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5340
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 29.01.22 um 08:35 schrieb zhanglianjie:
> after the buffer object is successfully mapped, call radeon_bo_kunmap before the function returns.
>
> Signed-off-by: zhanglianjie <zhanglianjie@uniontech.com>
>
> diff --git a/drivers/gpu/drm/radeon/radeon_uvd.c b/drivers/gpu/drm/radeon/radeon_uvd.c
> index 377f9cdb5b53..c5482f7793db 100644
> --- a/drivers/gpu/drm/radeon/radeon_uvd.c
> +++ b/drivers/gpu/drm/radeon/radeon_uvd.c
> @@ -497,6 +497,7 @@ static int radeon_uvd_cs_msg(struct radeon_cs_parser *p, struct radeon_bo *bo,
>   	handle = msg[2];
>
>   	if (handle == 0) {
> +		radeon_bo_kunmap(bo);
>   		DRM_ERROR("Invalid UVD handle!\n");
>   		return -EINVAL;
>   	}
> @@ -559,11 +560,10 @@ static int radeon_uvd_cs_msg(struct radeon_cs_parser *p, struct radeon_bo *bo,
>   		return 0;
>
>   	default:
> -
>   		DRM_ERROR("Illegal UVD message type (%d)!\n", msg_type);
> -		return -EINVAL;
>   	}
>
> +	radeon_bo_kunmap(bo);
>   	BUG();

That looks like it will trigger this BUG() now. Please also remove that 
line.

Apart from that the patches look good to me.

Regards,
Christian.

>   	return -EINVAL;
>   }
> --
> 2.20.1
>
>
>

