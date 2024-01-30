Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEAC8425D4
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 14:10:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78D0010F8CA;
	Tue, 30 Jan 2024 13:09:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2047.outbound.protection.outlook.com [40.107.102.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15E5F10F8A8
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 13:09:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KfKrprOf3PaAZA4V1PfAyXaIVaH/MYvYumsBuSHCT9o3PJvzDCewsIckSelRYUhVCg/UfgyYrxuNL9wjjFGwfcj+m22an0aVUEJbide0DwjHX3AxgdIHzBlSvIVGE34moL65ssP3fCm8gw8V86YT6h+FM0p9Vu3RXzBFDzNtte8+WyLyeSIcnQ2pMwxHShid690g/G2zqntbksxd7oBb5ntZHYSSjBbfOgFjcWvkHr8fRHtO8wgYxVzFIU4iIq1xa+YDFY+o65sV/TFw5iE3G++8fqG+QNGlKljecimFti1wciCYKr+Aag9EIvDM9tkY1vEeVlQZEdtygoXIsnMbFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8YyCWdugEcbPxK31IUu4twc4iWTbXF20lRfL264iGms=;
 b=nx/FGXxxaiSKatI26s0Z8BBC3FkzFvhUpz16hccBZlwmjRUboBhZ2mmyp/BAmNBy7hutl32IcU5E2x66h0tfZTD5QXGuIbBEO04YijphUUk6e36Y3RaovazaFT2Nbo8IoDjqAksS7XiridzOSaQ+qw4YaHg0QrtMkpo7e3C7B0/RUMFwco6qH1SPtCKHFubjVkoE6MIcqxG6yi8ijutEQI1jOPrL5LZhQMWyretJQrcW0xkHkW+IMVFnAgM2G3/49TkUKTxdDRLC7zBO+CJDDvlnO6C5qZOxu+fQJK0aXNsIPDEyN5dMwVkUGUnkpYrmgUNJ/KLx+vXgS/kq3jEzZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8YyCWdugEcbPxK31IUu4twc4iWTbXF20lRfL264iGms=;
 b=yYCnlwpYtBswQbu32R+MCg1B2U7INFj0GH2Fj8rqQSo5k2dliF9K7QUvqH9Bmv64Z6oY1DaHG6mBL0V6AZVUZzWgTIrQKmd8HoshRZ8HNz5dZxWZX72JqfCKjngSUADI/CDyPMK1fnrnpDBsuedu3Fghuvp8aIqIPCDktinxNWs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY5PR12MB6528.namprd12.prod.outlook.com (2603:10b6:930:43::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Tue, 30 Jan
 2024 13:09:53 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7228.029; Tue, 30 Jan 2024
 13:09:52 +0000
Message-ID: <1d912523-b980-4386-82b2-8d79808398c1@amd.com>
Date: Tue, 30 Jan 2024 14:09:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [Linaro-mm-sig] Re: [PATCH v5 1/6] dma-buf: Add
 dma_buf_{begin,end}_access()
Content-Language: en-US
To: Paul Cercueil <paul@crapouillou.net>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <noname.nuno@gmail.com>, Michael Hennerich <Michael.Hennerich@analog.com>,
 linux-usb@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Christoph Hellwig <hch@lst.de>
References: <85a89505-edeb-4619-86c1-157f7abdd190@amd.com>
 <0fe2755fb320027234c086bcc88fd107855234c5.camel@crapouillou.net>
 <577501f9-9d1c-4f8d-9882-7c71090e5ef3@amd.com>
 <7928c0866ac5b2bfaaa56ad3422bedc9061e0f7b.camel@crapouillou.net>
 <2ac7562c-d221-409a-bfee-1b3cfcc0f1c6@amd.com>
 <ZbKiCPhRvWaz4Icn@phenom.ffwll.local>
 <c97e38ee-b860-4990-87f1-3e59d7d9c999@amd.com>
 <Zbi6zQYtnfOZu5Wh@phenom.ffwll.local>
 <a2346244-e22b-4ff6-b6cd-1da7138725ae@amd.com>
 <7eec45a95808afe94ac65a8518df853356ecf117.camel@crapouillou.net>
 <ZbjSJi07gQhZ4WMC@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZbjSJi07gQhZ4WMC@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0383.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY5PR12MB6528:EE_
X-MS-Office365-Filtering-Correlation-Id: 7585fff9-e117-467c-e830-08dc2194bf2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qcof7NtiKz2W+HNvj5RLPNzZhhTRZQffg+5djtOVtdoBmkoukeqHBY9QxGwshN27bhAHn1f8T9X9Bb7iWr5P1H7DSKnCz1QpalsGUT0GNAXKns3+2UWKS2kJmHwOEueUOrNEEib2Tq+NoVFzOJmbtzDo9wlTQNTwYF2OL3p0TCw0uEwd9vjExqFRCJ//tlkue/6HHQvpHEBhg1IXgH08W6jtqLz+NHfRz5Y2aW/qI/n9bwqjta8ZJsZ77BgN9Kf+W3wVlAMobwy7+9cmEIX8xODaXYioiEhdQOC1cd0bmb1en54RH7l8o2ooHcsrnfHrfLTi9s7N7nEyCuDtA/DjGWuk9nTalRx8TIXewjwPtyGg4AHTmAadb0xn7ZlbtHuO1J5yxMzgQUCffgyL25RiIh/qbj6opIMRcdv8kYO+PytFEdV1EXxsAciPbb/7394GRt037CeC0eF8fzAoJZk0v+qcRsQOV8MVGjf1SCUT5bxNMbhrUL8FSeByz3gswwudRL78qXTTgCaEq4J0Pl4GygMKg4/zJDxTHy2KuE+9SbW2koWiwBbKc1/Rz7qEbbB08tU/d4tuvAQ5Js46xBkskN1MfmWemUed+UaxvzjV/4+AU8bljDUW5xyldiJc+81tbQmUSw6dUe6Go6AA3UBheLsqmlTfAD51I+jhXo3tpLU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(376002)(136003)(396003)(39860400002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(41300700001)(2906002)(7416002)(5660300002)(36756003)(921011)(66556008)(86362001)(66946007)(66476007)(316002)(31696002)(83380400001)(110136005)(478600001)(6486002)(6666004)(26005)(2616005)(8936002)(6512007)(8676002)(6506007)(66574015)(31686004)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b08xM2thSWdTWVEyWEZEWFVWemdTK1BGVDdyY1JVdmRaZXo4QjUvRlF5b0Q1?=
 =?utf-8?B?eDMyZWV2QWorQXZvZzdSNUdBSnBnVXdqRWc2TEZUbWp6UnFTQVBYRS9FaVJE?=
 =?utf-8?B?alA3N21rVEhTVkN1NEdFMG83ZVFlVGZRa2l2b25vcFZSdS9naTFaZld5MGdL?=
 =?utf-8?B?cVZjbVJvTnJuY0l4OTdiQldIbWRZbDRUN2g5QVgweVgvc2ZNYjJ5NUQxL0JT?=
 =?utf-8?B?Q2tNYVhqaWc1dlNFVkNxc1BBZklSbUN0VTlFQ2pjRm5oZERTeUsvVTc2RmZh?=
 =?utf-8?B?a2NKMXd3WStCUVdaTkNUd3dwOG1HK0YvZXY3d1M1YTdUV29SZ2lPeTByanpG?=
 =?utf-8?B?SHd2aXgxOTFCTGVVajVqYm1qb0Rabzc0YzhnWVpzR01OdVBVTE1Zd2liRGZV?=
 =?utf-8?B?OUhPa3gyTWZvVU11QzEwNEt6bmJqSWtOR0tuREVNeW1Na2lTeit4a3ovZzhq?=
 =?utf-8?B?NjJLdFNjZ1lQQ0J0TGQ0OW0vdXJ2T1licXZ3M3p4dUJVdGVQeWpTQXpFa1ZB?=
 =?utf-8?B?bUVFbTV5cGg1RXd6bkxkdjhxcWRHTXp6aXhhMlVrN2VPMHozbmoyajhLUWZX?=
 =?utf-8?B?eVVhTGpJWmY2eUNjQU5GQ3E3Lzg0R1JQazZEeEthRFk2eFQ1TU1EWjh1OWZL?=
 =?utf-8?B?cEFaRWpiQk95OU1iZkpSWGhvSFY3VG5pWFZ0cnNkbFpaeHZsTFNkUnJFem9o?=
 =?utf-8?B?NHAvUVJCL1ZuUzV3TmpaWndQRC9zQVhvZU5FVlMwL3IyQkpWaU9NMzdRRHQy?=
 =?utf-8?B?Y00veXYxTjJiZnVQQVlIUm9QVUxRQ3BlSGdrYzlxRGFSYkNUcmZrL1UraHo1?=
 =?utf-8?B?SDlJTXAvT1RZdUc4MlRhazhSRVdrblpYS0VJK0hoZ0x2a0xmMGZxVkhISklz?=
 =?utf-8?B?Sm91RjhSOFdSN0owOXU0YjlpUVRMc1ROcjlOeStCZGJkOFVSaEM4bmU3MVRz?=
 =?utf-8?B?MVdnTUtEdHBjdHJISFJRMFQ0dk16NFJjN0pPc0lXTy8zMzhOc0ZEMjhwZEw2?=
 =?utf-8?B?QVZUY2U4Y25IQlM2Tm5ZVHNwUVo5d0cwZjc3bWpmaFlKamUrYWxYaGJ5S0hy?=
 =?utf-8?B?aEQ4czR4K0tFZGVVMk5hdEU1Mzg2L3lwQ1hBRGNvMFhMV3F6dHZPM0VFZU51?=
 =?utf-8?B?Z0YrYWlkT0x3L1VjKzJqTFV4ZWlrR0RuV0s0ZGFGQW54ZXhTbE8zU3ZreDRW?=
 =?utf-8?B?SlFJWTZjcUZOSFFiV2dueURLbXpzeS9yMHZwd0ZFd2o5WEt0REVJZHNSeDhs?=
 =?utf-8?B?ZmtvaUYwNFJ3UjNTZmFwUEcrSk13cHZidW12S1p1RlFMYjIyYWlnV2w1Y1NY?=
 =?utf-8?B?Mzl5QnE0UVg3aWVjZ0ErRm8xcEI3Y3BPZnpmUDNLR3U0OTRUUkVpR0Z3V3hj?=
 =?utf-8?B?TzBjc2UybUZyMkh1d3JNR09Bd0MzWjVvOHNhcDYxUklhTWhsSG85MzBwWHNJ?=
 =?utf-8?B?Nzd6dk5LQzlORGlRTlRWN3NQL2tVR1B6WlFEbEtZRXAvK0diTDFlY01OOHpI?=
 =?utf-8?B?YlZLa2ZUVlA3d2JvbEd6bEZmWSt4MkEwQzZwaWl4V1lwMDNrVTVobU5JaTBh?=
 =?utf-8?B?T1h0K05nYVNTWU5IT2x2dDQrWU1WbmZCRktCYkl6bXU0SzFyQjVsb2daOUZQ?=
 =?utf-8?B?TEFMZDRQUk9xQktVTGQ1QjRBc2ZOQlFjekhSWE04ck03ZktjaHpYZnMzSHkr?=
 =?utf-8?B?QmNhT2RiYklMZG5FclFkNkpaaTIrWUVod1ZEZlk4QmhtVGNDNTBLM0I4K3JJ?=
 =?utf-8?B?emZwa2syNjR1STdlYXpiT2VTY3dBL3NVa2FwMWZsSVFCNHJmdEJSei91ZFVX?=
 =?utf-8?B?MnVzYmpzaXJrbEdIV0U2T3lJSkQ0QTBuVkNybVNydmp1Y1YrZzViZHlQWC9P?=
 =?utf-8?B?NVpUMnpld3NwSVE2NmxYckppMjZPNzA4dkljTnBHdUs5dzlaTTRKZ1ZITkgw?=
 =?utf-8?B?dExVYTdTWUExcmU3Y3RaV05Mbk9wUDVoWkxJbjM1cVBFSzlWSzQzSm5Cazlr?=
 =?utf-8?B?MVd6T1B4aHJMazNOUUNBUWtHZmhBOUpZa2RVMDZlSW5oY0JuUlFPdnkyMkJ3?=
 =?utf-8?B?dVRQa1RwbjRvY29aMm1QL3VXR2xwa0hvR2NxQUoxZTlXaTFiNjhpZ1hpNGZa?=
 =?utf-8?Q?h5EAqCcP51ixF3oy1i7IdvimL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7585fff9-e117-467c-e830-08dc2194bf2a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 13:09:52.7870 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RiH56v4IHea2T5VGpf6DL4a9H+TpS+18JQF55hxSqBFbOilKHlTE95QmJmFogqeQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6528
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

Am 30.01.24 um 11:40 schrieb Daniel Vetter:
> On Tue, Jan 30, 2024 at 10:48:23AM +0100, Paul Cercueil wrote:
>> Le mardi 30 janvier 2024 à 10:23 +0100, Christian König a écrit :
>>>   I would say we start with the DMA-API by getting away from sg_tables
>>> to something cleaner and state oriented.
>> FYI I am already adding a 'dma_vec' object in my IIO DMABUF patchset,
>> which is just a dead simple
>>
>> struct dma_vec {
>>    dma_addr_t addr;
>>    size_t len;
>> };
>>
>> (The rationale for introducing it in the IIO DMABUF patchset was that
>> the "scatterlist" wouldn't allow me to change the transfer size.)
>>
>> So I believe a new "sg_table"-like could just be an array of struct
>> dma_vec + flags.
> Yeah that's pretty much the proposal I've seen, split the sg table into
> input data (struct page + len) and output data (which is the dma_addr_t +
> len you have above).

I would extend that a bit and say we have an array with 
dma_addr+power_of_two_order and a header structure with lower bit offset 
and some DMA transaction flags.

But this is something which can be worked as an optimization later on. 
For a start this proposal here looks good to me as well.

> The part I don't expect to ever happen, because it hasn't the past 20 or
> so years, is that the dma-api will give us information about what is
> needed to keep the buffers coherency between various devices and the cpu.

Well maybe that's what we are doing wrong.

Instead of asking the dma-api about the necessary information we should 
give the API the opportunity to work for us.

In other words we don't need the information about buffer coherency what 
we need is that the API works for as and fulfills the requirements we have.

So the question is really what should we propose to change on the 
DMA-api side to get this working as expected?

Regards,
Christian.





> -Sima

