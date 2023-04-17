Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B80F6E4BBA
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 16:42:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6645E10E55D;
	Mon, 17 Apr 2023 14:42:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2087.outbound.protection.outlook.com [40.107.95.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 671AA10E55D;
 Mon, 17 Apr 2023 14:42:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ktyzn7hePPy21pga68eTL/BqtCJBsFGYQQ57aJru5J7RCDMrHMj/hppz6XDcm6Nr2XMlXBgx5j3p8MR27UsVvPv4fPA2IXNbYmTy8QrqkIkwGMDiZpCsyMHJnAN98cHEKn2BZjyLjE252TpFz/PSTUWi5vANKChUY5eN3i+OnfmCPtzH65ID8rtatn4sYDPkH0X2v8Q7KYMQNIC5E4f3Fr1AFKObCPhL1G757xNqDdpN0/c9tHw11AXzJF30SAUgW52TcTw4Fn/6D6ullc0wW9QHduVhAjfFH2e2z7LJaq6qgY+SEDm7Cp7bxTl4km1ysWFMYInivMakKU0BGP5uOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ub5xf+DUboa33pYwIzibqqjYxx4JemUZdjFnXPeUQDs=;
 b=eIsmLkhxcKJY/Et9RgHLbgpNpGmsrIB7jlqeFoYCAl3B+tD+18q0+J+9k5Z57ghG5/t5ZtYfLJIg8jysTqKdlUHyez3QW9Oxocsun2lO9G/Dj10hPtre1rM0oKMjOTe8NGkvwCWspPud/lctmm4iR3r3Ec4jXDe/0VyAGPLXHUIJcqR5wj6M5WnnApZr6daac/8vpHlvKS3DdnxrzBGZvW6tJhZBxBCDvQ1REh8taCMpgeKdOztn2UtEBJFMjk+GrBfIDmxM83KtRXhsR22bdOch2CxttqV/seWh1QXOyeZn2L9mnoc4EIAutST1E1lK8CGhTOzD0o2Y03fu2B611A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ub5xf+DUboa33pYwIzibqqjYxx4JemUZdjFnXPeUQDs=;
 b=JxQXPCAJk66YApSbLdOR96uQEoKom4hAl+aFjy3hm+h5aTokRPZUoCQG9a8H0drXxb6g3g4ddDCt0HPnpdRA6b1/+a6ChO4Dnubnojoz+TP9aosV/cRFQhXDCAvZx+Px8G3zczgsKEZ4kD4uQWTGvHVa/5PrL96cNsKm+IjVGps=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MW6PR12MB8759.namprd12.prod.outlook.com (2603:10b6:303:243::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 14:42:35 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d2f8:7388:39c1:bbed]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d2f8:7388:39c1:bbed%3]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 14:42:35 +0000
Message-ID: <fc9d282d-e1ac-b99f-7ba0-77bb9c52cca4@amd.com>
Date: Mon, 17 Apr 2023 16:42:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] drm/ttm: fix null-ptr-deref in radeon_ttm_tt_populate()
Content-Language: en-US
To: Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
 Alex Deucher <alexander.deucher@amd.com>
References: <20230417143431.58858-1-n.zhandarovich@fintech.ru>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230417143431.58858-1-n.zhandarovich@fintech.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MW6PR12MB8759:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b302cf7-91ee-4fa0-610c-08db3f51fbeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZPsJzoYCMGtpc4NWIq0Cg9B2XB3jQBXVf/ooKJjJfkiIXHYs0L88T7FHz262t8HxslPdMz1VS+YOHrd7/PjLuYa/ENammbd/1ji6hm8xFqRfAuqg1UIwfgdX65FR6xlCKDHiV9b4pgVWUZ6Mkl9X34rpGqqIrNPDkJy+5Iqb4VcsG4nOcs4xOTcTewh+tUYRRgOpRhwhY6FxFl8fcgxwaO8ARmPXHl/v3hRhCGu9p3VKzbRtoydIEfBDAwTa/p92az6kEu4N9Fm76GrMAZ2YsQJlUKcFn8Rag/jHo53rjw45Y8BAvoSaAZ7yB7ElYbouY9vu2NohSlfhuaHXq8YJkRocsO/XtMF75AOjUnXAqNOcOVtIRB9WUK8DfPYRDUWWKt8fwOAeFYu4ccVqVSv6qDonodGIIAfeg5C2FZXWxA4ruELp/WU6FmnpwrWTpf/4UXDh+TX8CXgPa1ZsFFYtc4uCeJOZ/LxtVGa7if+Drd4RKv/2rswcrH719pBN4NfX7/1s1lyzzyj4Z84WENCiDSihodH/2jCUpXZyRGc9BrNHil/xGne+KvIsLY6p1Ih2eIrgITMrsfX3tXXLIzSJB42mJ348k5QYoEtUfW/l46/DlOqT35TLfVBEDqMV4SEuHfc5/yi1bH7Hn92TwLZHhQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(346002)(376002)(39860400002)(366004)(451199021)(5660300002)(2616005)(86362001)(31696002)(83380400001)(186003)(6506007)(6512007)(38100700002)(8676002)(6636002)(8936002)(54906003)(110136005)(478600001)(6666004)(6486002)(316002)(41300700001)(36756003)(66476007)(66556008)(4326008)(66946007)(31686004)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mzl4c1NYYm16cVJXMHdiWmdXUisrMllURHc2MlNGcTA3UWpXb1Zkd2VuVVVY?=
 =?utf-8?B?bmdCb0JDQmF0YmlTd3NWdUNWNjlrTWNUTlhVTzFteGplc0VwVmtqNUs4QlVk?=
 =?utf-8?B?bGJseWVQTlNUZGF3c3VvWlYrWW9HV3hZcW1QY001NUUwUDNWY1VUajBUUXhO?=
 =?utf-8?B?UWYwR0ZiYXM1TVl4N256YXJSZTNLMzV2a1NlSTRtUHA0WHFzMHRicjlTTTNx?=
 =?utf-8?B?TDEraTUxanRMYUpOT3dJVnpBUVd1NUw0SWtsYzI4ZEwwcjNSQnp5aXVBTG5M?=
 =?utf-8?B?VEVDc0FFZnNnamlFY1dIcWU2Rm9ERk90TTRTM0NtM05zNW1CNGVvZkl3UnFE?=
 =?utf-8?B?OFd4eStpellnRjVsQmQ1bnpKaDdFU0U2RXZlMzkvRXRCamlFdEw5eUg3NUFw?=
 =?utf-8?B?NjF6a2djT2oxVjkxWXAzdnVyd0NKVEFxY3YveTJwVEkvalMvUjVCRnJNeGEr?=
 =?utf-8?B?aXBLcFZIemRBWXNpcVJHTUFMa3RBNHZzSU9aMy9PZXM1dFJjNEttQVg0bTV1?=
 =?utf-8?B?VnE0VzhnQnFJdVF2ZzdpV1ZQMHZwa1BTNVNxNzJXVkNJUHpQWjZPTy8vMGgz?=
 =?utf-8?B?NW9sU2twUGUvZVVsZHRuOCtkZm9UMFR2MGYzYk0rK01JYm1LaTc0SUJXbTlF?=
 =?utf-8?B?WUN4czYrbEM4ZUxqdVFETU14K2Fna2czQUFIOEI2V2JNTDVZYW9ya2ovVDhQ?=
 =?utf-8?B?TTdJUUZ3aEU2SEFRa0hnU2kzMTF0anpzL2ppYktpdnRFZUdIK0dXOWlDanBP?=
 =?utf-8?B?eXcvSXhIYWNEMGxIRTlOYi9vTkltVXB4bGExcHFFMlZaT3lEN2F4TlhhdGZ3?=
 =?utf-8?B?ekRWTEx0cXJFQ082UWVDbG42djR6V0lKZUJOcHNrSEN5Q0dpZDBLWFBBM0tD?=
 =?utf-8?B?OGU2eHVPTGxKL0dJT3liMWdqM0FUOTZjZ291Vjd5UWtUQmtScW5NSHRoSVFI?=
 =?utf-8?B?cnJRWXNITlJyckp0UmhhTWp6T1NVYW4rSmdub211YjZLN01MNW80b1JBdWlZ?=
 =?utf-8?B?Vzh4b1RxMjhXY09peW11N0NYcDB1cHFuUHM5YkZNYXFaajFMNWVCSWlsM01G?=
 =?utf-8?B?V1MzMDYyRUdoUm9YZlNiT1g2M1BKVmdUM0RxVkZ4QjJnTXNVU3IzVWVkZVZ4?=
 =?utf-8?B?bWM0RFhsMm52elkrTm41aHZkTHpnbHBxWmlkS1FRQytFdi9sSjZZVlNIbUpY?=
 =?utf-8?B?VEQyK3JkMWlKQVdBSGhzVVZibTlrcUZFcG85YVpvTjE0Qmp1NHc2akl4U29l?=
 =?utf-8?B?YlQxVFJPcmg1NlA0VFJwbHhDSVY3TWpRVE1FN1U4dFJ5LzcvTW5aaHNUeXBt?=
 =?utf-8?B?eTVEd09ETzdPK0JMUTJadDIzL1VncjRzNW1IYWVIWmE0WkVaSzBPUFZDRkN5?=
 =?utf-8?B?UVpISDRSWHZPYVJqRS9UazlYRW51Tml0d0xpbXVqRWdzN3RtZk11YzlZYmo2?=
 =?utf-8?B?RUtrdlRObEZDZmQ3YU1TVHowT3gwWG9jdFAwa3VWR0FnL3FPVVFVL3kycHdX?=
 =?utf-8?B?K0QyMExhdXBnUk9rQ1dhR1lRQnZnVjMyaGR1dGhMcy9kUVBaWkpDMmJiOEt1?=
 =?utf-8?B?Unk3VHRDNC9pUzk5T3FOVWpqdlV5YzRmY1FEZndQTU9mU29NLzNVMXRLUG9k?=
 =?utf-8?B?V3VKYXBBZTRsbzhxYzdFK2pKS29OUzVVTDJCMTFvSitsWkNuamRVLzNRT0NJ?=
 =?utf-8?B?R1Noa3BmandTMUNQWERYK0JwVy9ENjY5d2NabTI0VG0zeXhNdVJMaW1zaTd3?=
 =?utf-8?B?UFlGeFZLN3hxLzAzMWRjdmIzMVJzcmpIc2lYbERMME1ydmdsMDAzYlJSWTZW?=
 =?utf-8?B?eEo0RXU4UVBzcWIxMGw1QXlOaDEyNUt6NnluVXNMTFRCd1RKYjAzUDJoeUJn?=
 =?utf-8?B?dnBxRWdMMDRQWGtJYkp0VUUzdnJMcEkwbG5ZU09wTHZQdHZ0NVk2ZFE5T1FU?=
 =?utf-8?B?M1NxK2laRmRDcTRBUzVDbVF2SFZJeldsVlFNNk9WMkZISTN2K1lkRi95SEFj?=
 =?utf-8?B?SVVTUTBMdWRoSndSN0QwKzRNbE5SYVAwY2xEQzdBL3NDeVk3UmtGZkQxdE11?=
 =?utf-8?B?YUVyZkFJZUwyK1FESyszU21hZHhBQU1aaGZxa3huVEtJVUV0cGpBT2h0cklB?=
 =?utf-8?B?dFBrWisxWGUwLzNwZm1xUXJVZ1ZGekM5ZEo1Z3hEVTRxWDdmY2hUQzlXVjRa?=
 =?utf-8?Q?V7/f2Ac+mGBtsFzqJXyQnp95vue0W18Z8xenXX515M27?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b302cf7-91ee-4fa0-610c-08db3f51fbeb
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 14:42:35.7317 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h8fFrRSxmH2JMhVyaaMGZrkWG4q4BX+xNlncbkfybA1FHlmFmW5GUE+7K45jCx4/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8759
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
Cc: lvc-project@linuxtesting.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jerome Glisse <jglisse@redhat.com>, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 17.04.23 um 16:34 schrieb Nikita Zhandarovich:
> Currently, drm_prime_sg_to_page_addr_arrays() dereferences 'gtt->ttm'
> without ensuring that 'gtt' (and therefore 'gtt->tmm') is not NULL.
>
> Fix this by testing 'gtt' for NULL value before dereferencing.
>
> Found by Linux Verification Center (linuxtesting.org) with static
> analysis tool SVACE.
>
> Fixes: 40f5cf996991 ("drm/radeon: add PRIME support (v2)")
> Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
> ---
>   drivers/gpu/drm/radeon/radeon_ttm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
> index 1e8e287e113c..33d01c3bdee4 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -553,7 +553,7 @@ static int radeon_ttm_tt_populate(struct ttm_device *bdev,
>   		return 0;
>   	}
>   
> -	if (slave && ttm->sg) {
> +	if (gtt && slave && ttm->sg) {

The gtt variable is derived from the ttm variable and so never NULL 
here. The only case when this can be NULL is for AGP and IIRC we don't 
support DMA-buf in this case.

>   		drm_prime_sg_to_dma_addr_array(ttm->sg, gtt->ttm.dma_address,

Just use ttm->dma_addresses instead of gtt->ttm.dma_address here to make 
your automated checker happy.

Regards,
Christian.

>   					       ttm->num_pages);
>   		return 0;

