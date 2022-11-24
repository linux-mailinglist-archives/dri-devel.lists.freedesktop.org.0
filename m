Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 073F86378F8
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 13:37:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 989B310E6F3;
	Thu, 24 Nov 2022 12:37:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::61d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D7210E6F3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 12:37:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hFvhN1xHfwlvfg/JW5Jc4sHRsDe26IKJT/yBpJ/pyQei2eUdYPrVCSj/7wONKALQvQxqnOhuFMTJFkt6uDrqdIQP60T3KeuWb8o21gG0pk/R2Zh9U4YV3MYVXxJja/e9C4pVEYaYU+Gl2YOKH2wmpnvkfsRHMHv+hkYBSUj2vTpm2T0+kE1cnaHth8pmr3/Wm8nqppVdNqE8KTR50lKV/SC6IoGht0V1RbAoJntiAKTRB8ZK384KD9YXRlN2xI1brF1MCh/18SV7Zuq+3+H1/mhTi+rkdmMKYdeqA9/JxaDMnoke5dy+t7OtMnw6kKgGUSoxd4wbyjUCnIYJYo64jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kOeLNjOt/AkC1Px+fUVueqEskL2XhcFRi+cecQ4lGXI=;
 b=Q7VFwceF/qhvTFa/0kWaUmkdrCA6/ccFj00WnA6428TXpUKTu6iE2Dos09pA4bfj/gIeowqbJIL/qHVQ28ypUb8OzwB5lLSEZHVVZyPJGndtmkJW4u8DDTnSf9YBVotIYzlHroxheyqYDRf8ydjZvSKNwARCnMfaP1Ew0c4jFRQB4iavmcoxcZQK+DtZmWA9euiCeR3eAomINtCm7TCIYogoak61XH6UgJraTbDX+nm2QTJUGvTuVan1uEuwQxitxmWHnvAVap0rUIjwcjqauniw2nQ5GeLZV68P/G3XAfNwHFLZhxM6wgecCJHjfeOyF5veGw3nnzMaDtq4zReamg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kOeLNjOt/AkC1Px+fUVueqEskL2XhcFRi+cecQ4lGXI=;
 b=YcXrh5i2INpi3kOXcfrRlDGYrZgH2pdGrE1zMWTCxJoXUqNg9YKbBU9u5fotyrNfl53ci2hS39Qe/M8w9ukmQj0VWoyLBr8NnQ3vB+WUE0/x914P1fbqKz1V0PhB5azTnEgwRxq5aX1D0n9l9QoFYFHq67pWnViIfHZ8GqkuWjs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH2PR12MB4086.namprd12.prod.outlook.com (2603:10b6:610:7c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19; Thu, 24 Nov
 2022 12:37:46 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421%7]) with mapi id 15.20.5857.019; Thu, 24 Nov 2022
 12:37:46 +0000
Message-ID: <689ad89b-0e34-3743-24c9-3f92856720f8@amd.com>
Date: Thu, 24 Nov 2022 13:37:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] dma-buf: Fix possible UAF in dma_buf_export
Content-Language: en-US
To: cuigaosheng <cuigaosheng1@huawei.com>,
 Charan Teja Kalla <quic_charante@quicinc.com>,
 "T.J. Mercier" <tjmercier@google.com>
References: <20221117062152.3029018-1-cuigaosheng1@huawei.com>
 <f12a5dbe-4626-f6c7-236b-30bb16be1dd6@quicinc.com>
 <99d3aee6-ba3e-5333-6f79-ddbcfc0e8843@amd.com>
 <CABdmKX1UMB0L0PmHB59nijReZef6LUQ3XKXitHZo2YnUrJTz9Q@mail.gmail.com>
 <2c9fa595-e788-5474-4f2b-ffbd08a70d13@amd.com>
 <CABdmKX0KJJV0iQwy0aUNXcLc1DGyLjmh6_Y53asHEoh-uyHzAA@mail.gmail.com>
 <83944425-c177-7918-bcde-9cf7296a613f@amd.com>
 <e12784da-b3e3-ddec-0e84-f968d60097c4@quicinc.com>
 <b2d5d904-99f2-7974-a22d-63a6cf864973@huawei.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <b2d5d904-99f2-7974-a22d-63a6cf864973@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0022.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::9) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CH2PR12MB4086:EE_
X-MS-Office365-Filtering-Correlation-Id: e014ea8d-b097-4a64-f69b-08dace18b09b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LzV4DXbWNBXCS3dG+CoHAvW28niVUDumJBpaaiFtX7TgBFrRa//p0movGXAJ1/pbbFCzHEssCrrNX/OCY5/e60HznO8z3NhMAChElUPUhNQi6egCBZyIJeTZME5x4WsWMDsYS233RPIPLkQxrpEeOxINY7+iz/ej0bn25XRrPdki75AjnZ7D83u3Y7tl336Z8a080GA5IOnGWIDuwQkMm5zxZa2AiObbAIW02oQx1OAj9UjCCytQIxPcFBe+OCLi98SSesewu5eUhWnCm4QlpjPCT12G/Ch+FZOJPhhMJfDeYjw5RDq29XbOkYB/MtPKnPQH9sjU5UhXLTAQpW31thUTZvMKMkiVwMEAkE0ARCFn9dmFNgCTwFjKBFcFOZDkvxInxAwcRL7s0czLUsJKhgmIU9nnRmmAqK/vtcroPXLPqQhmzXEzXgXwFH5arR0u6y5VALJtjwSgy0K1+t+tzsZzKkyGFuAyys3/lsEubf0tM/aMZracg+ACdaXccUvcaPO96/LDH1+5PO+3qf6729lGBtTpfBzXnQgFP0itw5/7H5GhqqI4z3WpXIbk+KGMp4Rooe/N8I+PmF6g0T9z50e37W2NOL0Q3HRH5LyndEZPROBAYG+2hMxu7C0HqwD6se7Hq2oe1SpVMa4FzwQX1GwQiBIfKJqxK/SO75qnBky2hgjD1uq95EnXR0NAtzpJi18aHufh8fg9ETUMzfbNCZxqUkeDmixp6iwNGFBJC9M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(136003)(366004)(346002)(376002)(451199015)(5660300002)(2906002)(31686004)(83380400001)(66946007)(36756003)(4326008)(66476007)(8676002)(66556008)(110136005)(86362001)(31696002)(316002)(54906003)(8936002)(41300700001)(6486002)(478600001)(6506007)(26005)(6666004)(53546011)(6512007)(2616005)(186003)(66574015)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2tKODZHUHNhMHlVNUNHdy9JU1BwQW1KV0hBVWlzQVBiaU1uc2MxUVdHUi84?=
 =?utf-8?B?Wm4vVGhsc3BCT1BNc2tWWmo2c3V1T2pqbVk1ekE3REtUNFFQbVNPNFpHSmQy?=
 =?utf-8?B?YjdtRFJjcnprMmxTZzVZQjF4WmNpNnY2ZzVHbmlOd0RJMk80QVpVR0FmV3JE?=
 =?utf-8?B?d1MxaDAzVW5LUnRXZWR1TEJzT1UrSFRHVk9nZUp0M3VRbE1TU0t5RXdOZEI3?=
 =?utf-8?B?dFBzTEpjQkRuNVdXSFVkeFNKbnp4NWhhblJVK3NkcFN0RDdsS1RkMTJqSEJn?=
 =?utf-8?B?UHF2U0doQng3VUZIWk1waUVrd0JLYkpWMkd0dTBXK2hmR2F5V0lPY1UxREhP?=
 =?utf-8?B?NDhweVFnT1BYc0lPUSt2d3B6WHRoak0xTWdsVWhlcDFrTklTcUphcFlyT0NY?=
 =?utf-8?B?Vm1ZVThZU3BRMDdOSWhNTTY2RkNjQXlGVUpKL01wR1NoN2tYYUZOYmt5cFNx?=
 =?utf-8?B?YmMra0crYzA3MWhCN29tSVJYS2xST3lHcU12L3VEb01ndlpLN2FXdk1YZ0N1?=
 =?utf-8?B?Uy9pak03OG9nVTdVWk1xeURMQ2lNcHhTemdCRzBmSjhqd2F6Ty9USWR6Y0dz?=
 =?utf-8?B?NU9QcDZhVjMwc040Y0Y0UmJjOVh1bHpSUzduMmFlUE5KTytXTWdBRVNpSU1O?=
 =?utf-8?B?VDRFU2FPdEJvVFVmakFFQ1EwU3VENUxlR2RHMjdlbktyeFB6aGNaMDdjdHlP?=
 =?utf-8?B?RlNRM3FTY2lWakFKeEI5dTJhaDJOSktmUEpSSHpZUjExTDZNN0pIRUgzRktQ?=
 =?utf-8?B?L05Bd3M5clNrR29lVkxINDN1K1pJaDFTY21wRCsvc0hUT2JSWFBGVmV5YmJU?=
 =?utf-8?B?V0xKYW81MGR2QzdkRmpkMFlBUTUvb2JKU0M0V2xGL25IcFBDTTJXVTZHby8y?=
 =?utf-8?B?QWswQXE3elRuZmpTRFhwRXZrYWtuemxzRFRMN3Z0SFZpM3dnQ0FTZ1NwekE0?=
 =?utf-8?B?d01QRElGckVEeURTckcySk9SMkR6SVhEZHFqOFE5SDNaQndEZ0J2R1lYM2px?=
 =?utf-8?B?S05PK0ZhQXBROXhXOG5JYWhGeWEvK250Sk5EbzhDTGpCQUEwSDZrNXVRWE1Z?=
 =?utf-8?B?QUFZeldDeUtnWW9VNy9NQTBxWDNnVVU1dHVTMzZsMVhDZ1o0OU1kWnpWRkY0?=
 =?utf-8?B?ZG5nSXlZN29qbkU2VUp1d2VGbVFOREFRLzlsaXdhcVdTTjZ5azdZamlsSEtH?=
 =?utf-8?B?YlRkYkRBajhvTjErQjZRVzVEeS8wa1pGLzZXMlVSRkRZak5iRkRVOE40REN4?=
 =?utf-8?B?VmM5V3lSdXFVV1hPZHJIaGF2WUlNbk1rZ1RRRWZna2JxS2t1UkV5d3ByYTRa?=
 =?utf-8?B?b0F1Zit1Ym9nQWcydUZaRFljVXN5VnJmY25yVjZ0dGE0RHdYQkp4d0tvemNv?=
 =?utf-8?B?T05YRzVSNm1aZ0l6OEZIRnBtQkNmMDQ1bDAyM3pCdWJuOHpHb0VoWnRJOVVo?=
 =?utf-8?B?TDAwTVhsZ1lML0xLdHNhMXJkY0N2MzBENWxiV2tlSGFya1pvS3VCNW5Qd0ZE?=
 =?utf-8?B?U3dQdWVjTFU5WlM5TTVpSndtaGZDeE0vMWdKUEJ5ems3R0E1WEozMjJGZk1D?=
 =?utf-8?B?UmNUN0dsUXBBSHVQc3RSckpMejJXVWVGY1pxUVl0MWlWNVJ4cEhWNUxmeW13?=
 =?utf-8?B?K1BUTEY2a0k3bUxXUEUwSkhiV0FsVlJ6M2QrRG1sbHBtaW5HMEtNN3A1K1pZ?=
 =?utf-8?B?aEtCMWtJZm55M3FyM3Evd0V1R2Joa2hKZnBoTlEwb1pOSTlvcjBVWEw1MFdD?=
 =?utf-8?B?U0Zhdm4vNjdzV3A4T3N2Y2g1djBGRkVVSGVvbExjd1VxNFRIS25hNDh4Nktt?=
 =?utf-8?B?NWN5NVpCR3NUMVEvaVBrbFJKc3Q4SlNrOGFqN0gvODZOYVJsazVENm1iOXla?=
 =?utf-8?B?azlRcGo1VWltY2pqUDJTMkNpTnJxS2F6SGo4OHp5SUZoZHh6Q3BQeHdka3kx?=
 =?utf-8?B?c2pHQzFBTWdnK005R1FGZ21JeUI0Q1psT0xLQm1uMDk2allGMUNkcjYxbk1D?=
 =?utf-8?B?cGRkbTN0MkJLdktJVVZNeTN4bmdFeXFWZnNuWjRmVTVtRmJkM1JvdW9xYUhl?=
 =?utf-8?B?RlZxNG9HS2RmK1ZKR1dReTFzN0kvUU96NEVZOHl4aU9reXJ5alJPajlBeTRQ?=
 =?utf-8?Q?yqWM=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e014ea8d-b097-4a64-f69b-08dace18b09b
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2022 12:37:46.6394 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UoPgDK+GNvk9+N/C6XvBmDGQvJARz5k0m4hGeexzQ2F8IPraZ7XIcO/6ThzIcDZs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4086
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
Cc: Pavan Kondeti <quic_pkondeti@quicinc.com>, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 Dan Carpenter <dan.carpenter@oracle.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 24.11.22 um 13:05 schrieb cuigaosheng:
> Some tips:
>     Before we call the dma_buf_stats_setup(), we have to finish 
> creating the file,
> otherwise dma_buf_stats_setup() will return -EINVAL, maybe we need to 
> think about
> this when making a new patch.

I was already wondering why the order is this way.

Why is dma_buf_stats_setup() needing the file in the first place?

Thanks,
Christian.

>
> Hope these tips are useful, thanks!
>
> On 2022/11/24 13:56, Charan Teja Kalla wrote:
>> Thanks T.J and Christian for the inputs.
>>
>> On 11/19/2022 7:00 PM, Christian König wrote:
>>>>      Yes, exactly that's the idea.
>>>>
>>>>      The only alternatives I can see would be to either move 
>>>> allocating
>>>>      the
>>>>      file and so completing the dma_buf initialization last again 
>>>> or just
>>>>      ignore errors from sysfs.
>>>>
>>>>      > If we still want to avoid calling 
>>>> dmabuf->ops->release(dmabuf) in
>>>>      > dma_buf_release like the comment says I guess we could use
>>>>      sysfs_entry
>>>>      > and ERR_PTR to flag that, otherwise it looks like we'd need 
>>>> a bit
>>>>      > somewhere.
>>>>
>>>>      No, this should be dropped as far as I can see. The sysfs cleanup
>>>>      code
>>>>      looks like it can handle not initialized kobj pointers.
>>>>
>>>>
>>>> Yeah there is also the null check in dma_buf_stats_teardown() that
>>>> would prevent it from running, but I understood the comment to be
>>>> referring to the release() dma_buf_ops call into the exporter which
>>>> comes right after the teardown call. That looks like it's preventing
>>>> the fput task work calling back into the exporter after the exporter
>>>> already got an error from dma_buf_export(). Otherwise the exporter
>>>> sees a release() for a buffer that it doesn't know about / thinks
>>>> shouldn't exist. So I could imagine an exporter trying to double free:
>>>> once for the failed dma_buf_export() call, and again when the
>>>> release() op is called later.
>>>
>>> Oh, very good point as well. Yeah, then creating the file should
>>> probably come last.
>>>
>> @Gaosheng: Could you please make these changes or you let me to do?
>>
>>> Regards,
>>> Christian.
>> .

