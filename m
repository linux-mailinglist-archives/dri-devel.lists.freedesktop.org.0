Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 571C94084A1
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 08:23:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3EE889A77;
	Mon, 13 Sep 2021 06:23:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2055.outbound.protection.outlook.com [40.107.92.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD49189A77;
 Mon, 13 Sep 2021 06:23:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PM+cgaG7G3kjgkHmCs3HDKKPeHQ70v6nAfryQaLYouJvKJdkLKt2/8cQZiuRYuBHlfGc1k3wTcnKl9oGum56mWmTtm0W8i29wl/+2JUYo9TCKJb8PGrEGDvYYRH8MLo2rrl8Ms41H4h3btnAPHDEqdR4skaio2CxnIP/5WJvVok3ZjUtXUlpqMeSFkqy/X7Vos+apgmBxZw/9lsrDNSTQWb2JFgqhVbBmN5kuHnkfGlqDbj9swME4tQhk7oQSEi0v8G7pBle7XF44uTDQgjoqKR13sHi/DHqFa9uO5mo7V9QPqZEHow4lrN9TXm0icwr3sEJ0NjAiT5CEvUpRGnK8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=ggXUynFeIt+v2TK/+/7UFFfntjtBG1cXI8w/lY3cxVE=;
 b=V5sqfVqqJ3piVEmw6S+VM1aKipjPe/KIibVG48FgL2OrfMqgq120swEOzpxueIT1XgPlL57RTEROdBE6CPb1mBk2nbNpXkZZTuzVDoxWT8E8GZPKPs+WscGFTJctTT1emcBi9ZqJ25rcs1zSl0er0rXx65x6SzbTD5GaLKtz7gR/PqEC0xHBaX1I27vQ+k7TlDerKLDdrxJMgpV/NI4kl/+xx91dATOYn9yoTt5dNcq4RbCEB3CtJa/ikrOw8B6ogY/otTxew+pW4O9MRh44Yo4dbFiyMF4/rKscv33o++k2E0D74ca8Eo6JpThb2anx2RsVc6K3LPijJ2K3y+Ljxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ggXUynFeIt+v2TK/+/7UFFfntjtBG1cXI8w/lY3cxVE=;
 b=UfZGeVluhoqwEqLvI4vqQAiHgM4ej+yyef16/hGVOqyVV3yL+ph+qO0a5FGNLc+PnO9IBm6N0SQAfCaDQRm6l+xfxXnk6CUzE19k0iDbk+grO2XR6d/Y7+l/PiPQ5lYhHEOf9o5V3rgwuxtL7IwK4pDaEcYf3bA5ud0vCLB+lkQ=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4916.namprd12.prod.outlook.com (2603:10b6:208:1ce::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Mon, 13 Sep
 2021 06:23:26 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4500.018; Mon, 13 Sep 2021
 06:23:26 +0000
Subject: Re: [PATCH] drm/ttm: add a WARN_ON in ttm_set_driver_manager when
 array bounds (v2)
To: "Chen, Guchun" <Guchun.Chen@amd.com>, Robin Murphy <robin.murphy@arm.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
Cc: "Shi, Leslie" <Yuliang.Shi@amd.com>
References: <20210910100922.12097-1-guchun.chen@amd.com>
 <868cab56-607b-bcc8-e358-b2475315f862@arm.com>
 <DM5PR12MB2469C78183CEFEF7FDBE7B72F1D99@DM5PR12MB2469.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <86f93595-6b78-d596-6197-660fb24f9188@amd.com>
Date: Mon, 13 Sep 2021 08:23:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <DM5PR12MB2469C78183CEFEF7FDBE7B72F1D99@DM5PR12MB2469.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR04CA0106.eurprd04.prod.outlook.com
 (2603:10a6:208:be::47) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
Received: from [192.168.178.21] (91.14.161.181) by
 AM0PR04CA0106.eurprd04.prod.outlook.com (2603:10a6:208:be::47) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Mon, 13 Sep 2021 06:23:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28ba876a-c779-4567-5da1-08d9767efe91
X-MS-TrafficTypeDiagnostic: BL0PR12MB4916:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB4916C684E382125A4FCC6DC983D99@BL0PR12MB4916.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BM3+5np0jTS03rc7vBFa/11x4hjXFBGp48vaGVzc2JCGl+xfdVXVxyQ0vXFNJ+jHBimCeeDACgI+l8V8eeIpoeHswqj+0AAd41xKbVRmpiBQJXyqnGDjyWdUkKqs/D044YBgrwB3Upe7+p0I/j2nmLZxelq3nRQmN9sHK/7DuJ3OKK7nHZBvFcz0BBKOfRU90BAvQZiOIYpwR9Hm2vhAJa1EQi1oADbbYv/ZNQWA87BnNJvVT22hYAf7zK7IByn7FXiN1ee+f6PNHeAKQVZC0UxyHOFTGZBod+ukvgxK92YVzIt8GO3vgCryKm0vD05P+m5inlKTjsiIoSy0dKJzRJBrUGqVq67kLvVqqhjqE5A2P2EBrGzv9B9la6ZEylynY2kH+MbYcuI6XTUhlRbU/MJcELSeQtXrUIZ0j15kCqgvTpDocG4BeLMHOOM4bfhZ7vT9/reRd94PRF+HJaIUBj1W3XJpM+7RIZroV9IlTCh0RmqhEJe5PwwBUh8WYg/8pxEcDB2RFGhRn8g1QlFUrR8r/nILHi8TzJGHBjhSUFyQDfkInZOV5Glkea7vDjRA2P5P4nbQqdFgBwZtG47CaShkM+BMxlMHQINDWDDtZk9C9iElCvtJf8POe0wwP7iMFZI3+MJCEQydfVqiy6ECPjUQ6ON0+SZ3pMhXY/H+ADBrwVFomjvvsraGle5BWVBgNRGX5AaVpeJKrWcCwaVg9nELfwC9CYJqjp73qG4n/wvRTRA1KaWlIStuKKX6agAe
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(396003)(376002)(366004)(39860400002)(6666004)(66946007)(66476007)(6636002)(8936002)(956004)(66556008)(31686004)(2906002)(86362001)(53546011)(110136005)(38100700002)(186003)(316002)(6486002)(8676002)(2616005)(31696002)(478600001)(16576012)(26005)(4326008)(5660300002)(36756003)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Uk1qcWFTL1hNZW4xMEhtWi9OMlovWU9OU3RpeHlOVUdmbENaa0dNc21iWjhE?=
 =?utf-8?B?cGtSUm1zblkvQUlxM2pHWW5LcEI4YTJDV2hJT3IwMU1GYWtiMWpIVFlISEdD?=
 =?utf-8?B?SUw4NFlFUFFYQjQ5bFpOblFzN01neTBUWGV3bWVpbm5mVzVXaTE4NzJzb0x3?=
 =?utf-8?B?cjhMVVNOSkVQM0lWMmpkN0FYK2lMT1pmcEFuZE9OdzNZc2ovWTBLc1kwd1Yr?=
 =?utf-8?B?WWRNOUg3a2dYNzZlQnU3OEU4V0owallEeEExNFJPekFsRzRXMTFGUWR5Z3B4?=
 =?utf-8?B?dU5CL3JLV0xIOEs5U2tzQXd3bWVBRVRoZGZTMmNRMmhwdGp4N1RKR0VkdVA0?=
 =?utf-8?B?YjdKN1IrTHZkWlpWZS93d1QzWkNLeWw5OTQ1SFZyTzVrcHY4TjhWOTJSR2Np?=
 =?utf-8?B?RmU0NDdBbCt2eWQ3Q0hMSHNUQVZuRGlhNDhzK2luTWcvTDJHVFpzMFJ1aG8w?=
 =?utf-8?B?UE5zTUtXL2o1TDZXbE5oZ21CeWtFVHJNTG04dDNuUVM4aEpjUXB1OGNDNVND?=
 =?utf-8?B?VlNDSGNXMGxpekpxcm1jNUN1ZWZsOUJEL1NCY3YveU5xbXpFVDFNL3JuMFY4?=
 =?utf-8?B?WVJXeEJXY0lNckpwblVVcjV6dFB2QzVoaHkybUZMcFBXcGhtcWg2L0VjK0di?=
 =?utf-8?B?TUttcUtPUnE0RndnQWhEZUQvK1NrUU1uSEMrelhjMUtLb0hXNlgzM3BVWmx3?=
 =?utf-8?B?dTZhMVkvOENJL3RiK256aTRSdldVMU41TmQ1anB6Vm9mUWR0c3BudnE4MG9Y?=
 =?utf-8?B?YVFId1R0Ylh0eDRuK3dkYnByQTM4YTl4Y2F1VVZNNjZSS2YrWWt0NndmZzhs?=
 =?utf-8?B?MTJTbFRjR09FTG9wZ3d0cnNFV1ZKMFV6bmlsN2pYTC9obVcyaHB4SlpsVC9J?=
 =?utf-8?B?NGVUL09pUmViM2lsSEZXZEVwWU44eTl3MzVCM29taTMzV0ZPRzA0dDVVZ0xs?=
 =?utf-8?B?aDR2dnFzeERDWXVKUlFKbHBkTkp4aFBZd1FJVEJpNTVvK3VPQUIrTlU2SFVZ?=
 =?utf-8?B?OUppTEVlajNOZG84L2R5eFVjYkM1dkRvVUl1c0JrWTQ5ck5MaDV5M1JocHQy?=
 =?utf-8?B?emt1YkVEcHVmbmtKVDhBVitsSXA5d2pDZlZOSTJDcXlicVZjbUhIZ2F5Yk1C?=
 =?utf-8?B?QmR5d3V3b0dHd0poWjBwSUhhNG1oVEErc29HQnhiQlMwRmhIbE5UNnBpRXJj?=
 =?utf-8?B?NTRGMGdmTlBZbkxDbjlsNGtlVkRWaHE0VlFNak5EZnFWeTJabCtVSStQb1FU?=
 =?utf-8?B?VklIUEVEVUxVZUZSZE9tM1YxTk5RWEUrYWRGU1k4YlE2cEtmeDliYjhsTWFl?=
 =?utf-8?B?TS9Yd3pqUkllUEtSSkFneUNvRWNTcGFtTTlHOGEwUzI0bGdTOHIzdGVIK3Vz?=
 =?utf-8?B?MHBycklWNlhndGNxMUFNcWwyZk1XbS8xV29Gd3dQRml0cXRWbFVJNGp5N01m?=
 =?utf-8?B?dzZHZDhSUXFwNmF0Q3dlWWZLQnhXeWd2Ynp4MERWOU9DTlNtMTVhK1EvK1B6?=
 =?utf-8?B?YzRMK0NSSU00ZmlJU01rSnpGdzF5blZvR1ljaVY4STkrOHJnbFpGTThrOVh3?=
 =?utf-8?B?YkJrMDNZakhJa2RQMVUvYXpDTjNiaG1ha0plcDNDZjE1cHd3RExDMlkyOHZt?=
 =?utf-8?B?K0ZRaWNVUUtJcnhsSkdHdFV1QnpwcDVrYjc0RGl2byt6THJmM0h2cnR3YldW?=
 =?utf-8?B?aVgyUmZMcENNdXZhbjJ4dzJqM3BCVTF3VnAvNi83THRseklIeENaWHJvSFdO?=
 =?utf-8?Q?xG9Yce+I49TcS5uGUZnVKlqt62feFpZYadgaSW5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28ba876a-c779-4567-5da1-08d9767efe91
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 06:23:25.9851 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rUmrmIHeTLqJK531+I2o1bE7eUE68ilRNE4OzmZrF/CmnlPFJ4C+nTTpndcrKeAk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4916
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

Well it will crash later on when accessing the invalid offset, so not 
much gained.

But either way works for me.

Christian.

Am 13.09.21 um 04:35 schrieb Chen, Guchun:
> [Public]
>
> Thanks for your suggestion, Robin. Do you agree with this as well, Christian and Xinhui?
>
> Regards,
> Guchun
>
> -----Original Message-----
> From: Robin Murphy <robin.murphy@arm.com>
> Sent: Saturday, September 11, 2021 2:25 AM
> To: Chen, Guchun <Guchun.Chen@amd.com>; amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; Koenig, Christian <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>
> Cc: Shi, Leslie <Yuliang.Shi@amd.com>
> Subject: Re: [PATCH] drm/ttm: add a WARN_ON in ttm_set_driver_manager when array bounds (v2)
>
> On 2021-09-10 11:09, Guchun Chen wrote:
>> Vendor will define their own memory types on top of TTM_PL_PRIV, but
>> call ttm_set_driver_manager directly without checking mem_type value
>> when setting up memory manager. So add such check to aware the case
>> when array bounds.
>>
>> v2: lower check level to WARN_ON
>>
>> Signed-off-by: Leslie Shi <Yuliang.Shi@amd.com>
>> Signed-off-by: Guchun Chen <guchun.chen@amd.com>
>> ---
>>    include/drm/ttm/ttm_device.h | 1 +
>>    1 file changed, 1 insertion(+)
>>
>> diff --git a/include/drm/ttm/ttm_device.h
>> b/include/drm/ttm/ttm_device.h index 07d722950d5b..aa79953c807c 100644
>> --- a/include/drm/ttm/ttm_device.h
>> +++ b/include/drm/ttm/ttm_device.h
>> @@ -291,6 +291,7 @@ ttm_manager_type(struct ttm_device *bdev, int mem_type)
>>    static inline void ttm_set_driver_manager(struct ttm_device *bdev, int type,
>>    					  struct ttm_resource_manager *manager)
>>    {
>> +	WARN_ON(type >= TTM_NUM_MEM_TYPES);
> Nit: I know nothing about this code, but from the context alone it would seem sensible to do
>
> 	if (WARN_ON(type >= TTM_NUM_MEM_TYPES))
> 		return;
>
> to avoid making the subsequent assignment when we *know* it's invalid and likely to corrupt memory.
>
> Robin.
>
>>    	bdev->man_drv[type] = manager;
>>    }
>>    
>>

