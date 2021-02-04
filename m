Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDC130EE2B
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 09:16:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 379B06ECEF;
	Thu,  4 Feb 2021 08:16:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2074.outbound.protection.outlook.com [40.107.236.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F78C6ECEF
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 08:16:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Km+BV/Vd48YdES4Dr0B6atESWXrpDxxqrPkuqlOAonMSsYiNZjTVm4w5PvOoEC1urZZYtuSm/rCxpQaqkjiDBzDXtLvN4845ut6dvmcjGDxhVJZkvrdTa/ZOUntx+soC8ToIYy2sFskFcCmm8+ZCI/acrMry00SUodfBP79BQ0mN22Xe0iYm6spqAr+eHxydESENJZXpv82H7ggBNfC1/zM9ONjsV6kk7SRd167rs4zaTgKp1ZT8LvIHXs3JKxH3AMWFyyL9+Qf3nASV21tnn35Yo5xh2W80R77cV4owzBZ/DABkN8v5SP6YDCizrJwceqCstFZxx0xots+0sNflIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5YA8rfWzdX4Xqt2zKyCwtuidKecY3Wi3nxre6h7sYMc=;
 b=bV6GNRJ2Sx8qGRaIO7Re28CMoF1Ods9Mpou7E3HMTfU7hp3dBfxasDHqPgvnjGqa9PRQnWBA8goCwSXtyehhhmfeNktfgoTbgxI4ekL5eOSakFOSWaFApgrVP997i6u+12zZRvp/Uhsq01nn4oJmwKXTtHHYQ3+uh21oPz4bwq2ng/PyYrUSv0h35kUBAFWgg8vcheWJyPeIz3DnS6AUjq0iUmV8ImJvNxYLFTb5MKoKGvTQyn7QBx96Hv2iuXDTL+cfNpbRkQWqCkl3kIAVJZOspAXr8Fe+EVahkGWEmS6O6S2e1g+VjkyNwJPFUhBmQ3mqCRBgPdPjH9EWKRB6DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5YA8rfWzdX4Xqt2zKyCwtuidKecY3Wi3nxre6h7sYMc=;
 b=Ss0XaBoDm1pF/exGWAIri268HEYnSibFjSm6X3O8kvuxsmCjywxLry5+5z5Sx7LcHr4H4/JnTLeYqO8BxwVM2LPFbtKeQa3M70YCAP8BbwpgFvCYpWtynAoqrkXHJZ4lxMM2luCu+E8nbQnW5/de0NTUtbPCcDLTlmxNIPw3tac=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4520.namprd12.prod.outlook.com (2603:10b6:208:26f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16; Thu, 4 Feb
 2021 08:16:39 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3805.024; Thu, 4 Feb 2021
 08:16:39 +0000
Subject: Re: [Linaro-mm-sig] [PATCH 1/2] mm: replace BUG_ON in vm_insert_page
 with a return of an error
To: Suren Baghdasaryan <surenb@google.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20210203003134.2422308-1-surenb@google.com>
 <20210203015553.GX308988@casper.infradead.org>
 <CAKMK7uHnNdjOYX5Rhj=uGMz7hSz12JhgkZJCfiqgkpjXnMfL4A@mail.gmail.com>
 <CAJuCfpG4GkVbeW=bB+Qrm5GPrZAwg0_rmyG05iwQmL7GrWAYHw@mail.gmail.com>
 <CAKMK7uHi+mG0z0HUmNt13QCCvutuRVjpcR0NjRL12k-WbWzkRg@mail.gmail.com>
 <CAKMK7uETu_m+=MHyPmqBbEP__qjMF_wmr4c2BiVTPcwE8c+5Mg@mail.gmail.com>
 <CAJuCfpHC6P5cJh-1hv=vjGHCCkM6mA_p19H6tCZmCDxhTuASkQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <ced1c1be-e731-946e-e9ce-919520fe935a@amd.com>
Date: Thu, 4 Feb 2021 09:16:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAJuCfpHC6P5cJh-1hv=vjGHCCkM6mA_p19H6tCZmCDxhTuASkQ@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR10CA0130.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::47) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR10CA0130.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::47) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.17 via Frontend Transport; Thu, 4 Feb 2021 08:16:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: da2081e2-9b20-400b-4e6b-08d8c8e53295
X-MS-TrafficTypeDiagnostic: MN2PR12MB4520:
X-Microsoft-Antispam-PRVS: <MN2PR12MB45204D167705331452E2FAE283B39@MN2PR12MB4520.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 36/egyZdwo7iUIUvAt5F/1TS0k1hDVQqUP9xDFgEgNZbx4+EitjVU/b0xCg+uhItlgckzzT1dj+ckkOnJj1xveeHuW21EjWbtSLZlJU/ZHeAfZ0cTz9mDg0b74wNM4LE+LBU9xGGlRKn2uqlTQZie+Ujzytu0HbyHD5AMa8FbFJHOSFCOLQ7ah9MM9gEieG1+v/YHvvk1f7QutWrUkUyE7c5SLRKtncYSkofEHhaEYiVI1hW9hX7XWhOEF8gyGpSJGaO8xWA+OAHfxHubN+sJC5L2EClbPxS3f13tKmWMj1bXtF+gl3F0j3mgu18S7ukorhbdsM+obPVVU+Ule3V8OC7T9Rht5gedIV84G4fAt9b4pkA1IR726TdNmBuD0o0o7GP1fxLNUhAF5zy0kW57FyOsSHB72lzDrLrFmNlIxEyN7Gi77CKGr4/vKq/8+GxP1I4sXhnRV4nz+7Ed3rbamAMCwfPTNBPbNePBwT8/pUa1YRkA2S3Tx5G0LzKckWV6yxMEsIsR5SzFVumLz/fbBTeK1iZHY9D/Ae9FSrry11m/tIaSbQWz9jnGjYIwG/Gou4ubgaZzPb8TsThkmJ+YvUvUk43dmfjQAtRGF4dwBs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(396003)(136003)(366004)(346002)(31696002)(186003)(6666004)(5660300002)(52116002)(66476007)(86362001)(36756003)(478600001)(2616005)(16526019)(4326008)(6486002)(316002)(83380400001)(8936002)(31686004)(8676002)(110136005)(66946007)(7416002)(2906002)(54906003)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NDdsT2ZvVS9MaTNhZ0o1UndzZUZjRW5rZ3JXb2xFYXZ6NFRVanJNM3d2MUNL?=
 =?utf-8?B?Sys0MGtCOW1tTW9hZTNXT0d4Vm52TWpjdlZoNzdNUkw4dmFSdWJ3MUREUnMv?=
 =?utf-8?B?N0VpbElRbXRDQUtpNGJ6QUtWWHh0VEl4cURlS3BoWXM1SW44T0VONVNJVm1w?=
 =?utf-8?B?NEJtaWExdnZjMGY1R014YUxUQXNKbW8vWFlOYWR3dkdkREVVTTZaMHlnWVlv?=
 =?utf-8?B?UG51bE9XU2tscWtPV3lKTk0yRjNocHROdWRrTUY4c1NNTmUwb0F6Q0I3YnJ0?=
 =?utf-8?B?UDl3bFQ1L2JrUUR6WkZFaDRGanRRVEorcDFhaDlGUS9qSlVoMFpmVmdmK2Zs?=
 =?utf-8?B?NVpyRU5pK3FyUlZXeHJhcVVEczUxaXEzYlBZaG1nUmFTcytpbVA4OFA5d1Ra?=
 =?utf-8?B?OERybEpIbzczVVUvNHVnQmVnWXE0NEc1aEFVcVdPMDEvZG0yRURBQkMvclJn?=
 =?utf-8?B?OTQxQjNMN1ZXeXRRWWJtQ3hzNU56R1lVdHpyeFVySVZmMEkvbnFZKzg0bkFz?=
 =?utf-8?B?T0VSK1NuRnBzSjYrcktRUTFkNVE1Q1NRWHREZk1wdzF5U1dWMVFxQkdmVEdp?=
 =?utf-8?B?b1haUWJ1Z0ZiTnRNZnZuU0kvaUl5aTI3TWxMa0hPZGQ2ZkVxMi9mT3EyVlBn?=
 =?utf-8?B?eCs5cDdabjRHOE0wTVFXVlpqbjVPSlZGeS9HWFZ0UjAzcWJkak5jVlFISTVz?=
 =?utf-8?B?dHgyZnExNC9IKzFiT3laZ3dNSzRxSWJFOWdLdFJIT200ZHhqRmdvVnBYQS82?=
 =?utf-8?B?Q1ErVkpTeDV4Y0dKT2M1S2FlL3hpR1dRT29XWWU1MmlBRTJXbTB5dHA4NGxF?=
 =?utf-8?B?OGo3QWVJSFpvVi9kY0ZhTzJELzFCRTF2MER5SnFoVFhaUE1tcmtieHRuaE1V?=
 =?utf-8?B?OThIM1JJcW1TRHQ1RDJZakFVSWtqdzhqZG5EaFcrbldUakgxa21WZ3AxYmJT?=
 =?utf-8?B?NnZFRlg4VTJBUGFpZ0xEd1E1WkdXVEtTQ2hac01vblRXTXU4eEwrTFo2c0ZU?=
 =?utf-8?B?QmJWa0xoWFRtYnIwc3dYckw3WGlxajl1M1FQbXEvaHBLYWwwUCtkNDIydFJk?=
 =?utf-8?B?aFkzZm1KM2ZVRytPSE5JcG11b1J0dkN3WFNpOHZZZWdyTm1EcnJUMWxXRmI2?=
 =?utf-8?B?TnR0elJ4dHAyVFA4UnFVWXJYVFdtbFVpR01RL3B3d1VSOUhwd0ptMVpzcFJ0?=
 =?utf-8?B?d3NyblpnUlBFSDhHT3RuV1ZFME1wZllVTFRWdFVYeWtqQ0h5RHhxZHpVWHI3?=
 =?utf-8?B?RU14enZTZVFMMld6OWdKUWJEY2hNamxOUk11eG5OQnJzTXQ2b2JhL0E4Tk1y?=
 =?utf-8?B?NmkwV1VTS1B6OXM5TWF6QmwzT1l4bXlVSEpGekNFcmhadDluNk9lSFRPeXBi?=
 =?utf-8?B?a09zZVZGRFprTGZUWXVoZUtSMFBYMTZwQ0tQaHlMS24rRHRLbDlqQllPZjRH?=
 =?utf-8?B?UUlnL3FubzVQY2hKWTNnRWJkRjZkalBqUGZkc0ZwQ0dLRFRsM2k5SktiYXlI?=
 =?utf-8?B?ajR2MVFvQS9xc2VZL2RCTEUzSEN4dm13TmlNSzZGNU51Y3BRdHYxZkxQd0lx?=
 =?utf-8?B?aWErUFlOUngrYzhoSHBwck9tTk5UR3Y0cG96NVU4VElBaHY4VnAzU2lOUTJR?=
 =?utf-8?B?RENmL1JQUWYybWVtUHhZK3F1VXN4UmRuK0kwaGhvV1JYYVNoWGU4Z3FyeWlC?=
 =?utf-8?B?V2d4Ukg3ZG5Xdi9NVmxCSjk4czhuU2poUVVLeThvT0xjRFJTdzVvUDVyTGJh?=
 =?utf-8?B?WEVJTGNlUitKNWJkNEsyZGR6aXNHMlorN0JYaFZsbE1rMzE0VDdZNTFkbzNY?=
 =?utf-8?B?VmYyd0ZsZFlBd3VCOUJuOE52dW5jQ2p2b1pIOEZmSk54Qlp2VlREU0dsbFBt?=
 =?utf-8?Q?YaBIQBh9Tk5Fc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da2081e2-9b20-400b-4e6b-08d8c8e53295
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2021 08:16:39.6905 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bV2aDlLF80vyeCOLaMX9iN2vT70tGipmbr2ZN6sztIt/4dqEGhN8gnnaUmrI4JeE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4520
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
Cc: Christoph Hellwig <hch@infradead.org>, Sandeep Patil <sspatil@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Linux MM <linux-mm@kvack.org>,
 Robin Murphy <robin.murphy@arm.com>, James Jones <jajones@nvidia.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Matthew Wilcox <willy@infradead.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Minchan Kim <minchan@kernel.org>, Liam Mark <lmark@codeaurora.org>,
 Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Android Kernel Team <kernel-team@android.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 03.02.21 um 22:41 schrieb Suren Baghdasaryan:
> [SNIP]
>>> How many semi-unrelated buffer accounting schemes does google come up with?
>>>
>>> We're at three with this one.
>>>
>>> And also we _cannot_ required that all dma-bufs are backed by struct
>>> page, so requiring struct page to make this work is a no-go.
>>>
>>> Second, we do not want to all get_user_pages and friends to work on
>>> dma-buf, it causes all kinds of pain. Yes on SoC where dma-buf are
>>> exclusively in system memory you can maybe get away with this, but
>>> dma-buf is supposed to work in more places than just Android SoCs.
>> I just realized that vm_inser_page doesn't even work for CMA, it would
>> upset get_user_pages pretty badly - you're trying to pin a page in
>> ZONE_MOVEABLE but you can't move it because it's rather special.
>> VM_SPECIAL is exactly meant to catch this stuff.
> Thanks for the input, Daniel! Let me think about the cases you pointed out.
>
> IMHO, the issue with PSS is the difficulty of calculating this metric
> without struct page usage. I don't think that problem becomes easier
> if we use cgroups or any other API. I wanted to enable existing PSS
> calculation mechanisms for the dmabufs known to be backed by struct
> pages (since we know how the heap allocated that memory), but sounds
> like this would lead to problems that I did not consider.

Yeah, using struct page indeed won't work. We discussed that multiple 
times now and Daniel even has a patch to mangle the struct page pointers 
inside the sg_table object to prevent abuse in that direction.

On the other hand I totally agree that we need to do something on this 
side which goes beyong what cgroups provide.

A few years ago I came up with patches to improve the OOM killer to 
include resources bound to the processes through file descriptors. I 
unfortunately can't find them of hand any more and I'm currently to busy 
to dig them up.

In general I think we need to make it possible that both the in kernel 
OOM killer as well as userspace processes and handlers have access to 
that kind of data.

The fdinfo approach as suggested in the other thread sounds like the 
easiest solution to me.

Regards,
Christian.

> Thanks,
> Suren.
>
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
