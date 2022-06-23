Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F94855756A
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 10:27:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CDDF11A22C;
	Thu, 23 Jun 2022 08:26:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2080.outbound.protection.outlook.com [40.107.212.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD4F511A232
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 08:26:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oe5K6WiRbg/2usFqvO3cxKGtFuf3bNmhTMpXBoUQomDeXJFs8DyfpFCdfC3F5hFQO3lpGJd7WbWKiSPL1zJtCtCRP6UEx88XTGR/XSSMXlo0FfXSO2X73UXWhcynlOuOiiRbTImJF6tUzSxSrykYAAvrQTYr9j+R7pmXEiwSIkW3M6+/J/kaIsRwyY0tyY9F3rWGlNGfqSj5Hia+I9bXwye1mFnpW9XxwXhmaACgOVvMbOz1Xa1OxA6aJAShq7idODLPrxCAwLMNyHPKH2B8IfDR6tYM26Z9SyjS+FZmp0gqZScqCE+41TTHKTJCZc5edr9UuYasbBqvb0ZS7/LbEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1cDbVoyuIkUexteR48Ue/tGMML8XocbS4FmnCEbt44o=;
 b=DCfQLrEUK7u362FlQKv/vAX1K+EY84Ve6uhf7PYX2j8Wdb+7HXH40t8fsz/esJG3ciBBLP7WAt/CyVp1fYTgmV8L42x8YwOsY1dwgrPfGAGwiNae67UhNlhCcLXCww2ufyukLjWKIJPvrvWhYcJEIeNMqsr/hNdmxOAQqJX1IGtm6RDC4OZrU4CBEgmP2k1fU6v0jDIqS7RJaTuMqoRkDqYBbc4BsVKp3D5vSQVcnyrkFim7z+tFhFeqnYVuFA9aZr9lkWjfgC4znbv2BPqcbFooZcA+cX6sZo9hh8puB9sKb0NXQuLcuFqrHRuq2uz8AwVXn/ItvVN/WjMvlWFCHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1cDbVoyuIkUexteR48Ue/tGMML8XocbS4FmnCEbt44o=;
 b=tq1YOZkLkEmP8/VPmjcdNyfJtyNb6WlxJbWgC3jNhAKhtTrLyZNNpfuuG4z5gUv26NY3SKPh/L+rJsrPmWxSw4l8hcZv9zBF6p+takjiu6Qbm6J67UQqyCoB5XnxQ8d/q8WVrCtMtXP8tmzXyOcLM0yJa4hyiQSKqGeYqG22aCE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BY5PR12MB4324.namprd12.prod.outlook.com (2603:10b6:a03:209::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Thu, 23 Jun
 2022 08:26:54 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e0fd:45cf:c701:2731]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e0fd:45cf:c701:2731%6]) with mapi id 15.20.5373.015; Thu, 23 Jun 2022
 08:26:53 +0000
Message-ID: <dbf87831-1b14-d18f-f8ca-b5fe1f850190@amd.com>
Date: Thu, 23 Jun 2022 10:26:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: DMA-buf and uncached system memory
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>,
 linux-media <linux-media@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org,
 lkml <linux-kernel@vger.kernel.org>
References: <91ff0bbb-ea3a-2663-3453-dea96ccd6dd8@amd.com>
 <58e11013-01ab-8a2c-732e-860ae83a3df6@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <58e11013-01ab-8a2c-732e-860ae83a3df6@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9P250CA0013.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:532::24) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15ee4006-c820-4c1c-2062-08da54f220db
X-MS-TrafficTypeDiagnostic: BY5PR12MB4324:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB43246384C2D210DF740F06DD83B59@BY5PR12MB4324.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ara8IX/8BnF3Y+c2F46BwRmWhvPry9NdTBJFgHFSrGvCs0cjyRKx9bRY7hsWXyj5YtzUEtiiZlZ0WG8Lpb/aw+oNteYYQwApiiA5ZhzuSEsqtQSru0pdNxEptMqJ+sWVAqp88cgEAeRkTInidcHf+AcqwlUjnyxobTIcZ1e+rl7ErRnsW3rriIW8897m9VMx/kpdf70oHUrmwVUDufX3clLcSoixSr5Jg28GbQKHMegJk2+A/6hb9eoKidBPdAzU8JjCYC/hPbkU7LxhGbp9DakjEijQuMY5PtcQDqhWZYMYSvozQDqiLQ5upy8NC+t7thhjWTnq4fq5Omwd2zZpBxCetpX74teXCJNYoQtiM80BVMsCkjz4krZBiI1tE9x62kwora2nT6uLA7nj2kvRi4AxJp9dbbWrsTk6H95AvRMV58CbsBerFl+veB6QLI3BkkEMR8BHiRatNQD+K9FLqtCiJOsaybhse2a+WPeelVgmSZdCTOu7G6Y1wjz0SVyy1uWvrUvFJvgMXaLXIkCPZ2OFeNp7rBKNY3ISr82Pdx5HmjcFcB7m5RRaNB0EstbNda9GW1snvG9O2rkwZXVVd/5q2wExTZx+usL8hnb8cgmiIjmXHNeDIs+ptPXU0I63BAPLDcb/rCcxdrbiTTW46+ePsQJbDNtnvfCM8BtT7CHCNCraMz+tnBd4g9TiGsnPrvkqWpEmnYOsMrAol5u/hpUZhTdkoNAaoahZNMWJTJY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(376002)(346002)(366004)(396003)(39860400002)(66476007)(66556008)(478600001)(966005)(6486002)(86362001)(66946007)(31696002)(36756003)(6512007)(41300700001)(66574015)(38100700002)(6506007)(31686004)(6666004)(26005)(2616005)(110136005)(186003)(2906002)(8676002)(4326008)(5660300002)(8936002)(83380400001)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Sm1BK1hNWFdvQ1JoU0JkQ2VldTcrdmZMbWowMVh2UnZnWUx3MlBGWHAwN2sx?=
 =?utf-8?B?UkpGTkdlbHdpRnI4aXVXRnN6Y2hqT1FQendNbk1mN3RaY0NIQW9MRVlpdzNQ?=
 =?utf-8?B?b3ZXMklHNUliZTZLUUxqakNHc1BLZk5WWjlheDQyRkFxL1RUNVJMUURPdjMw?=
 =?utf-8?B?ZEZ2UkxtMTZkYkVtcGJKNlN6U1h5M3VENmtoMjV3cVI4aWt5czhnNy9TMldO?=
 =?utf-8?B?RVhoOWx4MFdQVFUyOEZ3a2QyWEZEZlRRMFI3Z2dPL29KUGlKWlN2YlYrcWpK?=
 =?utf-8?B?SUdhQWd3SDNSV1B2RnVZVUVXT1RncjBHZlQyTmYyMXlzakwrczg1L2R1TzV5?=
 =?utf-8?B?dFZMMTVYVUF3QndnM1ZuSHlkM0UwZnFveHZ6b3d0Q3REOFc2dm9FM1VZTnUw?=
 =?utf-8?B?OHNPOWJqVENSbzVWUWhwVlIySFU4anhjOU41Nm5hL1ZUMjYzelFUOEppenZj?=
 =?utf-8?B?TEkxenZEelNKZUtqei8vR25sNGN0QWlJV2UvQ1VBRTZpc2NCVjd4RjNCUjRz?=
 =?utf-8?B?a2VZcHdKNUhuTGVhUDQrL1NENmRZWFp6UWFheFNOQjZ1WmdsaGN1QVlRMlJ0?=
 =?utf-8?B?alYxLzMrNUJ4ZVlBSmdPMXFVNE0yOTEwQmJBaXAvUmk5amU2SDB2MkoxazZN?=
 =?utf-8?B?cm1vWVR1S2tUSTJRZlovU2JsNnJnSUxSdVNnRmp3dmpKVzFPc3JiMmdDV1lP?=
 =?utf-8?B?ZVVzVDNMQng0TVQwOHBvNWtXKzhvUHVleEhBOVQ4QXl3a2tNazN4QW5hamZy?=
 =?utf-8?B?T01pRlQ0a29yOVViak1aUEZVOFhOaTlBTm9SYVkwa0kwbFFvVFJyNFZ5SEVh?=
 =?utf-8?B?VkNjOStKRWsycmpZMXgxUFc2ZlNHaVFOOFJwZ3pmVEdmZWhtVUFzdlVZc2NH?=
 =?utf-8?B?MkNQbytPWFNGYTFpVGJ6ZzRPRlVsalcxZ1NTSDdEMVUvTnR3b0pkS1ZFZ0th?=
 =?utf-8?B?N2tGekNKZlpZQk9FRFBKSXZuU1UxM3F6NjhQZFgxazV3b1BpU1VlSUVUQXJv?=
 =?utf-8?B?bWowT2hCZE5RZ0pFdzhLejh5a3l4a05mSytWcElrdjRyTUVGL0JJWHFVU1VV?=
 =?utf-8?B?VXFFVDFjTFh0cllxdy9DV0llQnQwUFdPVXRWUkJLRXR2TnZGNGFOcjdJV2xz?=
 =?utf-8?B?clFtNTkzSjFzVXR1Q3dCYTVXWVdqNUhsSkJYRVh0bmRrWXRBOFMwM1A5OGY1?=
 =?utf-8?B?cWZPQ2gyMU9pdnJqSmhkbW1ubWtnWThmY0tic3RuOEZKaXRWSVFpZVZtVFBz?=
 =?utf-8?B?V0tma2dOdlpETkUraytOdEpNelZwTDNJdEk0azdQVEFOcnNPYk40RmRHdVFO?=
 =?utf-8?B?Qk0yK2pjUDVyVk83T3BPeWZNTVpZaHp4QWxDVmRxdjBJUWV1K016ZEFmUzJB?=
 =?utf-8?B?OVpzVWt0dWtjNlN0dkdEWDRER1oxOUVwOFBYaTZISlo1QmJjWng2YnpZZnI1?=
 =?utf-8?B?TVN4ZHhJVFI5cUJsUm5tcXVKLzBKMVBncmdxbXVpaFNNbHNDTDBCd0FCb1lT?=
 =?utf-8?B?cWF2ZXI2OXZ5SXZmWWVwQ3VsSzVxN0FUVUhoaCsxVFV2NVlhVUtJNVpYNkda?=
 =?utf-8?B?RVlrZ0JmclNRakhocWlZd1J0Tm45TVlvdytPVkJLQ2gzbTlreWlYRDl4L2ZL?=
 =?utf-8?B?eXJZamdZOVd3VVVZeW1kU3ZZTHQwMEZtY0pHazIzZGFTdGlscUV4RjVYaEVC?=
 =?utf-8?B?a0pyelNjVmRIcUU4SW5Db2M0Y0hrLzhEK3NwWHNQVzhwbkdKaEFzQ212R2pE?=
 =?utf-8?B?N3ZHQVl6M1RhWnFsN0kxQkcrWkZZUWRTQnFLNTdBMFl3VGJMUnJOT1FraHZI?=
 =?utf-8?B?d0tEVGRpVnFhRktvb3RpZlR2bkd2WlFsbGxWVDR2TXdQc2N1Tm1HNStRUjAw?=
 =?utf-8?B?cEQ2Mkg2VWQwSW1wOTc2ODU1TDh6NzNJVnd2a2pHc2FrZE91N3NIczVuR2ho?=
 =?utf-8?B?MXR3dFdROTEzSGIxSVpKbmYyc3h2Y1laOWJHNUpSSnU0bmc2OHV6Wmc5aHFE?=
 =?utf-8?B?ajFnckFkaHpibjBOUG1qbWFNSzBxRm8zckQ4OHByTy90RVYrRU44UjN2SEI2?=
 =?utf-8?B?Q2swaEJMWG9waWhhdHptUlBwcitzVXlLMGkvTEJMbHVabUZuMVNSSXpRNjFy?=
 =?utf-8?Q?6P5q4V4xlHrWdFce8V048TVik?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15ee4006-c820-4c1c-2062-08da54f220db
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 08:26:53.8584 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: if1ZZH0+hvF6aVMQowp64KHct8ahuNDKIGwa6vncbedG5xYsWobEqKrD7/Nf7TIL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4324
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
Cc: "Sharma, Shashank" <Shashank.Sharma@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 23.06.22 um 10:13 schrieb Thomas Zimmermann:
> Hi Christian
>
> Am 15.02.21 um 09:58 schrieb Christian König:
>> Hi guys,
>>
>> we are currently working an Freesync and direct scan out from system 
>> memory on AMD APUs in A+A laptops.
>>
>> On problem we stumbled over is that our display hardware needs to 
>> scan out from uncached system memory and we currently don't have a 
>> way to communicate that through DMA-buf.
>>
>> For our specific use case at hand we are going to implement something 
>> driver specific, but the question is should we have something more 
>> generic for this?
>
> I had a patchset here that extends iosys-map (former dma-buf-map) with 
> caching information. I'll post a copy.

Oh, nice. But why on iosys-map? We need that per DMA-buf.

Thanks,
Christian.

>
> Sorry for being late to reply.
>
> Best regards
> Thomas
>
>>
>> After all the system memory access pattern is a PCIe extension and as 
>> such something generic.
>>
>> Regards,
>> Christian.
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>

