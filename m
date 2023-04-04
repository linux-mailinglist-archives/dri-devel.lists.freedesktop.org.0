Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5576D5B3D
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 10:54:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 543EA10E628;
	Tue,  4 Apr 2023 08:54:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2081.outbound.protection.outlook.com [40.107.220.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EC6C10E628
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 08:54:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LAr0NqjBBUdxmcNjJaGPpw0L6ZL5F9siziHT6zJDU40buuEcHQVaLTWjA8YrDPXUasbYDTJcNtySbJsKvRhJbFIEiq6C7swwH5V1pCDyfemWjQ+h091RZff2HeKcgOvCLhKru1Bk1ea23NdTFvMvGapEMSL0mOICBAWIn8CBUYM4Gv/LTRJj3i5r/P1bB9GagUFbo/URGdQPGL0eop/tkCrSRLkyXdJZTohLLOPZmAfzgyNYftj3FRKCqJjnJYAUC5oUjBilr6ZTfMu+2T+sBnPwOoF7FuPmb9+i4v60TlzfALfOIYNGaauXofHKdWNxK8jFL31Drbdf3To08quJ3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8FAOgb0ZuQYpU1C9FVOQOQ/sS2a+fKHxaC/jUDzvyZE=;
 b=UZ9bUvZD8G+hRLH0xOcQDZDK67zwYJMsEPgnloP5CnnBxwJ54SZVvMbJm/kVgX6rdpiC8S8D0iVXynnUpJQZkiA1RC0IrZDOY6jRQR28TAisq9TsWKcB6EbaKyVmMr/HgH0GPByVavS06lik+Fm3Mr1sIY15U52loFhHGS8JcXAW+2yrEyHSujy5TSlAmW+XRR0C6/bpf13VxbYYmRkl6JTDvjJjWNdHyQ1i31gkLcfhVOWnkxK61ozBKrlIba5ZSRnEjFjjKRfJNnavj76g4dqmdtn7/teZbG/+8aJxeO3kg3ry0IaZN1kZJa22DWpZuLk457xdwzwS5NAJ3XuRaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8FAOgb0ZuQYpU1C9FVOQOQ/sS2a+fKHxaC/jUDzvyZE=;
 b=cUTxmSNdE8QpG+06zW9wf4ATjBOvwz9lctOQOH1baKwyofB9YZIVGaMeG6NWIpIpKFfhfURxDrmIPAxIT74OpRuYg2SkWoZGqBffSpUyt47/hbIFuKhyEJf9MId7Os0VLChm4Payuikz6nCAk3+8eZuCUFrb7H6G5NJvyfV3opA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM4PR12MB8521.namprd12.prod.outlook.com (2603:10b6:8:17e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Tue, 4 Apr
 2023 08:54:19 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae%5]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 08:54:19 +0000
Message-ID: <a83e960f-9a7f-95be-e00c-acd94a967e1b@amd.com>
Date: Tue, 4 Apr 2023 10:54:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 01/11] dmaengine: Add API function
 dmaengine_prep_slave_dma_array()
Content-Language: en-US
To: Paul Cercueil <paul@crapouillou.net>, Hillf Danton <hdanton@sina.com>
References: <20230403154800.215924-1-paul@crapouillou.net>
 <20230404015944.502-1-hdanton@sina.com>
 <c9c9fa881aeda36862d0ad8c5a46472e0e363531.camel@crapouillou.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <c9c9fa881aeda36862d0ad8c5a46472e0e363531.camel@crapouillou.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0072.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::9) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM4PR12MB8521:EE_
X-MS-Office365-Filtering-Correlation-Id: 59bc0b0c-c1dd-4320-9645-08db34ea2d5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mOwncSXMbBBXBVLiitG2czFxR0U6DRyO7EDrYtew12m0UzI5D0vHEqlIID8pDm+RUnXU5gNJ0sfPLNTosi9GKozos/anXovbUpk5Bm16RuanXMKWllbWclIL9qXMyACvX5354CFdS3M1vFQXAZ+atwq692KIicc5er8adubVfdiF+Ntw9ldK7LnZYg/v+iRdU1bgMDKdGS29hRs1sm/yvW0d4Bk+vWm4sSbN9a2SkG/NKXiPTGUXLAnFsTwwDDf2VPVuO6L3WMSQgCoOa1WbbgFk1BrFqmP+sqd1UMn5dZC6x1YrRu60UCIzBLiQa+xOtNksid0v5su+qMFWC70aw/JZDCZ415IaMq+7QyErek5goWRYwVYNFQ2AHWyp8JcQst9kh7c/wLJbeC0HZEfZycGTcvhwekeHzVCsZNengJ1kDkEKT/u+e2w9AyaapqhOPZjAaHceg9C9OF8zp5UkX7LdU0BISLjGhbmAw1jrBpS17Fn+CuMgzS3CBKoJd15cBoRTJp+hRrj0unWxH2M2Ks93F0MDze9Ch30HEjqPMop82KXNVc40IRcOhX+QYp4Rs6fQXhpV37tQ/iqmoqoqjeECwja42yG89Qb8l+136h42wJxpLcQRjevid4XZ/9p7MN+3R8wQQotJkVxADMom3A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(136003)(366004)(376002)(39860400002)(396003)(451199021)(38100700002)(5660300002)(7416002)(2616005)(31696002)(54906003)(6506007)(316002)(110136005)(6486002)(186003)(6666004)(478600001)(86362001)(26005)(6512007)(36756003)(4326008)(8676002)(41300700001)(8936002)(66946007)(66476007)(66556008)(31686004)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWZXYVczcXdEWmJQaFpXODhyaTFiN2VXVlRyYldiK1RNb1hpNmcxZjhrcWNG?=
 =?utf-8?B?NzVCckhzQzhjTjluQ0lOZG5takZ4b09mOVVuOG9adm8zRGxVK2ZpK0h4QUdP?=
 =?utf-8?B?UXovUVVsS1hrM3h1TW1HUFJLVzFyYlhpbHMwUUd4YWV2T3pmbVQyU00vMVQ4?=
 =?utf-8?B?aVJEa0Nkdk9ueTBORW1WNkVFMVFWbzhBYWJTdGE3cUl6b0o3Qi9oZ3J4OTBo?=
 =?utf-8?B?b016WG1hTERHZ0FrYm0vQ3VlMDNCZkRSTjhTbWwraSt2UFNnV1JLZjlaaFk1?=
 =?utf-8?B?ZTllNlNoU2VBRThZMy9oRjN2WDJmOXdDWmdBOUJPeWVrS0JhREZjUDEzRU9K?=
 =?utf-8?B?eUE4QXRoenJPOGFpTjV6Ly94MGE3RnZBdFA0dEFyRGFsN0FJT2JRLy9PaWM5?=
 =?utf-8?B?QWdBajVLWTUzR045Sk8rbVR3bVJ4eVU2dDNXaUdtaCtSRHlWRk5LR0kwMUpR?=
 =?utf-8?B?dHc1SkZORXFaS0N0SFoydU43dk1rdENEeFdRcGg5a2VqWXlpSUgvNGtpSS81?=
 =?utf-8?B?UVdyOTFUbTZ4MHRNakxseEJmdHJ4NjY1eGZiSS8xcVQvRHlydUN4QUdmSlJM?=
 =?utf-8?B?YnQreHdkQUV4ZTl1V200Zi9WcVVPN2VIYVB1TzlhZ09DSC9QdHA4WkdqYmdl?=
 =?utf-8?B?c3ZIOXZhNThOTTBSTlNBNi91Y2k0eWJZT3pJdUl5REdDcElWVHB6UlNibUlM?=
 =?utf-8?B?OGtXSFBWandDR0xLS2lROXBRckxROW1na3d1bktEOFR0RVdDWmk5aXNyVGww?=
 =?utf-8?B?dTNTanJlUUVLcmhrRzg5NEllRGQ4NHBXOERTQ2NaTFBocEFwYTU1SlVqMm5T?=
 =?utf-8?B?YVlMY1V0L2RFb1BhK2tzV1o5OE9BVWJySVlUYmVxOGVJRnF0eU9NSWRDczVN?=
 =?utf-8?B?cFV4QW5uVlF5Zis5MFFQUmM5MkdlR3R4a0N6aHJjdTJNaWJrMnAvQ0NuT2h0?=
 =?utf-8?B?QXNuWFRNeE9Nc2srT2g1cDhKcnkxcCtZUGlRbnFVWXhSOUtaeFJwSUxieVRE?=
 =?utf-8?B?TC9Nejd2Uk9Eak9QeXdaRkZ3a2tmb1UwaUlGclFvSzYvUHVDazhEY2lFa1Rr?=
 =?utf-8?B?ZzdXT1ZTd3hBcWQ4bUNhNjZmL3pQbTUySXYxK1NzK0lkTnk2cmRacG56Y0pW?=
 =?utf-8?B?cVlhWEE2VzZiL1pNN3AvUXM5NUdVUGlPeVpoQ1VCbVZxNGdTSzRGVnl5Tzhz?=
 =?utf-8?B?S0FTM1hqZmY2RnBheVczYTM0MkhOdU4wQXptQk53ZzNSMG0wTlNjUGErMzFT?=
 =?utf-8?B?cE51MXpmb0t1S2NReE44aUFGNFJWL2lvSUNGK2YwM2pmS2xaSnE1Tlg0QjZD?=
 =?utf-8?B?VkY4Vm85UVQ2dUtpRXh0d0NkTkYyZWNxYytiOGp2cXNkY0JOV2MxQXBLdGZ0?=
 =?utf-8?B?SjBXQXQveExHNnlXRFU2VmFjaHBnNkhtTGlyZnNUbzdFNUFOTjN2U2w1SXRM?=
 =?utf-8?B?YU16QjNWcS9nTzRqS0YwcEJzbXg2TDJBQnVmekdldm80QTErdnRZUE9nVnNl?=
 =?utf-8?B?dm5RbUwwemtmd1oxaUpaZkNCaVJtUC92UnJ2NTNyS3NmL0VBR0t6WDA5VmRa?=
 =?utf-8?B?WTVLN0R5UjVvNnVDdzNmRXJUNGtqY2FveW9kaU5XTGI5T1FBQ1hOeUFXcVNr?=
 =?utf-8?B?bXNQNU1zT3BiZVZUTmxpTldVOE5Ka1VWQUFvYklmZkYvdXBzaGVWYkhtdGFH?=
 =?utf-8?B?WkxzMU5ZSFgxOFpJRTZCSm5ERXJwc2pORk5iVGZSeHpZUHJhSy9JellMUW1C?=
 =?utf-8?B?T1pKcWw0Q1h0d00xWTZsZC9pai93Z1EvcjhJb3ZTaGRnQ3JJZk00c3YyWmxH?=
 =?utf-8?B?dzdNVHdENFNOQWlOTmpYZ1g3dlF6VkNIdXJJcHpUeE5TMXpTUDM4VlNNNUpU?=
 =?utf-8?B?aTVGV256OFRuOTdTUmdhQkdBSXY3d3lLNHZoYzRUYWRNVzJ4aUNMYWxldGUy?=
 =?utf-8?B?Y2xNbFhqZEowc0huVmFZUThtQmk1M3IyMGZXTlYrUnpvSkFBbXVnSmwvczI4?=
 =?utf-8?B?ZU1jNjRDWDlTNUtIYjZsSGNoYkNpTkNoeitTOXk1dm9RSy8xMTZEZUlKdm9U?=
 =?utf-8?B?Z1dKMU5iNVBGK09vdlJPMTNuaEIzTDNCWnRUQTZIZFFCb2haK1JLb1hPRFZa?=
 =?utf-8?Q?WN0c=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59bc0b0c-c1dd-4320-9645-08db34ea2d5c
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 08:54:19.3579 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EFk3236ISv2jdvj8fTS1rwMIpheEma2zmSSDnareet4EN/BYTYcb07JgR6DGYARm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8521
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
Cc: Michael Hennerich <Michael.Hennerich@analog.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Vinod Koul <vkoul@kernel.org>,
 =?UTF-8?Q?Nuno_S=c3=a1?= <noname.nuno@gmail.com>, dmaengine@vger.kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>, Jonathan Cameron <jic23@kernel.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 04.04.23 um 09:42 schrieb Paul Cercueil:
> Hi Hillf,
>
> Le mardi 04 avril 2023 à 09:59 +0800, Hillf Danton a écrit :
>> On 3 Apr 2023 17:47:50 +0200 Paul Cercueil <paul@crapouillou.net>
>>> This function can be used to initiate a scatter-gather DMA transfer
>>> where the DMA addresses and lengths are located inside arrays.
>>>
>>> The major difference with dmaengine_prep_slave_sg() is that it
>>> supports
>>> specifying the lengths of each DMA transfer; as trying to override
>>> the
>>> length of the transfer with dmaengine_prep_slave_sg() is a very
>>> tedious
>>> process. The introduction of a new API function is also justified
>>> by the
>>> fact that scatterlists are on their way out.
>> Given sg's wayout and conceptually iovec and kvec (in
>> include/linux/uio.h),
>> what you add should have been dma_vec to ease people making use of
>> it.
>>
>>          struct dma_vec {
>>                  dma_addr_t      addr;
>>                  size_t          len;
>>          };
> Well it's not too late ;)

Yeah adding that is pretty much the job I have on my TODO list for quite 
some time.

I wouldn't mind if you start adding that and provide helper functions in 
DMA-buf to convert from/to an sg_table.

This way we can migrate the interface over to a new design over time.

Regards,
Christian.

>
> Thanks for the feedback.
>
> Cheers,
> -Paul
>
>>> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>>
>>> ---
>>> v3: New patch
>>> ---
>>>   include/linux/dmaengine.h | 16 ++++++++++++++++
>>>   1 file changed, 16 insertions(+)
>>>
>>> diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
>>> index c3656e590213..62efa28c009a 100644
>>> --- a/include/linux/dmaengine.h
>>> +++ b/include/linux/dmaengine.h
>>> @@ -912,6 +912,11 @@ struct dma_device {
>>>          struct dma_async_tx_descriptor
>>> *(*device_prep_dma_interrupt)(
>>>                  struct dma_chan *chan, unsigned long flags);
>>>   
>>> +       struct dma_async_tx_descriptor
>>> *(*device_prep_slave_dma_array)(
>>> +               struct dma_chan *chan, dma_addr_t *addrs,
>>> +               size_t *lengths, size_t nb,
>>> +               enum dma_transfer_direction direction,
>>> +               unsigned long flags);
>> Then the callback looks like
>>
>>          struct dma_async_tx_descriptor *(*device_prep_slave_vec)(
>>                  struct dma_chan *chan,
>>                  struct dma_vec *vec,
>>                  int nvec,
>>                  enum dma_transfer_direction direction,
>>                  unsigned long flags);

