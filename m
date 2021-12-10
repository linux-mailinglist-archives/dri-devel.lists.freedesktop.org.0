Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EF64700FD
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 13:47:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E86810E334;
	Fri, 10 Dec 2021 12:47:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2085.outbound.protection.outlook.com [40.107.243.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0B0F10E2C6
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 12:47:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hFX1z86a6PTVLblldlRH0wMfJGPeG9uccOUcT/vmLbYJRoZA60Zw7iu/NVvP8No8qoL+nzUv2wYVjhvFV/sI1IhvPoFQLSDDVctIJDieWP9526sweBSCgXHbMOP06YJN/ZpeHkC40CAKoeQkJnbfbTWot2oVPopK8aEvmhbaaMnIedTpCeCRsPmTGd3JaHP264Y69EZOMui4zGtmCVUSjxH9QdVcu+RwAAAwD70nyrbsk/N9jsx4lDNTLIDstQMQKg9vPVd/tbvrpCwnGUO7rGhceawKacivpO5nSLVOLGgDtwsnenxwFYoiMeGQ2kQ7KM5RNl2xJ7Lxmxcy2vxP3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SqO5KBE8zl5SR+4rxcsQRVL4bcjPEqIkjw9pqWRNH9s=;
 b=E/e0W7/vs33Cp24pBJHfzTvCG+08pG6pmOIOqajOa638lXA68k+rfxYCO+MYtKSA46aU1AgR6ko/S/A8Wp/rtMFwjomqTjafxcwWyXzBN4pVU30ZeDm55O7J8L72gPOK6Flrs76yfelqV/xRmHHVpQiGmQQb8Hlt7lU7EVW3IBNHywyN+dyIE+FPi8Hj4HBdKCU9ERYob4k6JMsJXY+sFMXUvlqdzYxxn5JTysIvYNdWPrHovEwTYdv3c5rMeV4wOgR8kmYw7wZ9o4zHIzw73uKXlWzXt9XXKY2XOAyv3tZmSa2PUn/o1LlSMFxrPLOvj3e1/iqza8aZArRM84njvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SqO5KBE8zl5SR+4rxcsQRVL4bcjPEqIkjw9pqWRNH9s=;
 b=4lESrgzf9YS1paZG13zxmo3DLBgAgC+mC/HbgXvMv9M8njFV1ey5FBa+jxTS398Gt06iBya0GK8Yn/geuIyksEgNC+cb/i47kh8JdWkIaAaJ1BItH7cAoTcK8QZhZ8IdWRqnJiG1bi2S63EtfDLW67HSX+yVZnD+OrMnXE5owYU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1776.namprd12.prod.outlook.com
 (2603:10b6:300:113::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20; Fri, 10 Dec
 2021 12:47:49 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4%12]) with mapi id 15.20.4755.027; Fri, 10 Dec
 2021 12:47:49 +0000
Subject: Re: [RFC PATCH v4 0/2] RDMA/rxe: Add dma-buf support
To: Jason Gunthorpe <jgg@ziepe.ca>, Shunsuke Mie <mie@igel.co.jp>
References: <20211122110817.33319-1-mie@igel.co.jp>
 <CANXvt5oB8_2sDGccSiTMqeLYGi3Vuo-6NnHJ9PGgZZMv=fnUVw@mail.gmail.com>
 <20211207171447.GA6467@ziepe.ca>
 <CANXvt5rCayOcengPr7Z_aFmJaXwWj9VcWZbaHnuHj6=2CkPndA@mail.gmail.com>
 <20211210124204.GG6467@ziepe.ca>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <880e25ad-4fe9-eacd-a971-993eaea37fc4@amd.com>
Date: Fri, 10 Dec 2021 13:47:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211210124204.GG6467@ziepe.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM6P192CA0019.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:83::32) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [192.168.178.21] (87.176.191.248) by
 AM6P192CA0019.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Fri, 10 Dec 2021 12:47:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e2cad2fd-5bd3-4e75-1d88-08d9bbdb459c
X-MS-TrafficTypeDiagnostic: MWHPR12MB1776:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB1776EE83ED363A3373B186D783719@MWHPR12MB1776.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mhki8zptHHRm3yHZLhdcaSKAkbhEACbUPgOBuMJd4pEj/nbIFCLfy2F6jn6q8WwV7P3nY+8qArKUzAVJYPZy7RA57ZjtRgbALSSjkQrITxLNzrWiUH7izVUfW8tibiqz7ZuOKgSI8pAmn4y7WhI+gwBGa9mH2/je2gB4H/YIWGFhKLI8l+7HMlm2tXyT6mdmETepTotv4w5Igln0eTPTMl/3njO/dZSMMyMTB0rOnZQDhHQ8Ug0omxLUjDb7BF35YgqIVo0bZ/G7Rk+3nPGHltAki1zPB0vqmJ+psz7UoQ2qGRe0uYhfqrxk27msROv8aVQY5voUoeZ7MwLQsAv8AHeb9xk7seEdxgJRwKKcDIiGzhyeeFQZ9pHH47O+yIpx6kYplLtLG6C+ZviWeF3m+qfSSHzs5X+EdkjJ4cStgRjVW92a64vrTZZbT2LRvgNgzxn4L+0DltoKdmI7smCZjZWMFdqngtnTxSfbo+E3//5Vre+7TSWKGpNKtzmInYBdCx16mD9CfYS34b8uEYiy1tDgj6gEVvnnW61SB9scm97ScxAepOhzMnXy5h3qpAXr2ZM6w9gBgT7L97bPeat5kXlDDjcaxXUZmvgcCalTi8A32Q67MP14r+PONXPpSPo7DPh3T7AmMbvpIkveR4hKfK+fHkVGXQ3x48BzZyxWZFEmYGn/MdeZyqor12ONmPfav+9EDlqy3GN9/+Ryecj+iAiizb6gs2RPatHpCBF8vnWuwH/hj/pLQGtoIfXjxsX/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6486002)(110136005)(316002)(31686004)(26005)(16576012)(83380400001)(86362001)(508600001)(7416002)(8676002)(66946007)(8936002)(66556008)(6666004)(66476007)(2616005)(2906002)(36756003)(956004)(38100700002)(31696002)(4326008)(5660300002)(54906003)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGlCYzhNSUV0ejBHQWNtQUw3c2t6RXNGQ1pvb3hrM1BPekJ1cUwxQk42dTBl?=
 =?utf-8?B?NzVKelQweGhsai8xMWVvUUhMR1hCREZ2VjdIbVdLQjhHVkgxZlVsSTd6bjlM?=
 =?utf-8?B?WXNTaUltVG9tdklVTXpSeUV6UUpRTTh3QjdXNDVMbHAxTmJKeWh3WFo1V1d3?=
 =?utf-8?B?WTFSQmlhRGlDNTROS09PTjU3LzRpVG1BRlNPYklOd1o1YlVVUTh5TnpIZU1a?=
 =?utf-8?B?OSttZmtmaTdVOVVtRlhKRUU1N3NsUC8rc2J1SklkZnFvUzFsV28wZjFMOGp0?=
 =?utf-8?B?a0xBWGNKV0ttVkIyUWdhSGE4cHhMSUZJV3hCalB6ZTZCdk5nYW54Y1NDMEpR?=
 =?utf-8?B?ZDFyb21XT2d3UncxNm05UDVCNUIwOFNCQWJjVXFvQ05PNy9ZUUx4UzVmaDNP?=
 =?utf-8?B?elR3dWd6c3RFajJyaGxhZzJNeExsdEFNMEpFN3lDaFcweXRyUUVyenFhenR0?=
 =?utf-8?B?YitLRGRDbGxkTHNFcWprUVpITjJCQzdnSEduSkRtUHRHaXRBVW5BaDZyYTkr?=
 =?utf-8?B?MmNrU1phRjRYVVVTMFN1L2dYSkxuNm1heXk1cjhQcDFMWkFKTjQ0Q2h1SXhs?=
 =?utf-8?B?VU5mSW0wTGZ6Z0IyNzB0YW1rZG91VHJ4YnYwVFcwaE1Va2hjRStwUXdEb2Jr?=
 =?utf-8?B?WnRYdUZKbHI3OWFkeUFPa3YrOGgzdms4Y255Wk1KNnNFZjZFY0hMN0Z3R0ZC?=
 =?utf-8?B?V1Z2MjdpQnlmTW51UXVBNVRLczFJejB0NFFkMU1hM2llbXF4M2xqUzRmQlFG?=
 =?utf-8?B?YkYwNVRqY0RuNm9FbTdadG0yWTRvREQvM0VWQnV4WE0rZGluanV5cjdFVkcz?=
 =?utf-8?B?Ry9GNjJxYW8xZXBJckRNMUl3Mlpua2Y2aFA5Z0tGallkSzZVQkdlYzlGejFp?=
 =?utf-8?B?UDNXNmpGdDZZWk5OK1hDQ2RuQmFNbnR6cHBhNDFmbkJwRllxcUtxSGhkdmJq?=
 =?utf-8?B?MHlnV2N2dWJIZ2VvaENWN3lSQjJ2R1ZLdm1XM2NKeUZhVGNRaHN3a21hYS9R?=
 =?utf-8?B?ZUZFT21ORFhwK1FYTFQzbjJhS0gzKzUzVzdoMHROMjIyRE1ZREt1SkNWY2RV?=
 =?utf-8?B?bkd6RmhqM2pEenozV29nbGhHWWhqbDJGSm1MM3NvYWtyVG1TK3kwTXVUL0Qr?=
 =?utf-8?B?SS9OYlB2OWJwcVVtVUoybzRBZ2dEbUFoSnd5NmZMb1lmWmNiYXFiTGdJbnM0?=
 =?utf-8?B?cEVIeUdXZWt2U2Zoc1JITUtuUEg3Z283THZmZ0kvN0plTUwyaWY5cXBCanBU?=
 =?utf-8?B?Y2JZbVRnbjJ1bUlrTkFabjI1SUpiZGE3THRYb21uSTd6emtMOThjRHdpdnA3?=
 =?utf-8?B?Y1RCOWY2U0E4U1c0dWs4TnNLQTc2TEVzZHA1TWJiY2FJYUV4ZGM5YmVwWnRw?=
 =?utf-8?B?czg1NnVPMUVIWXR5c1VJNStGRTZKZVBMNlNFUkRJNG4yYm9SKzkvdXNDcVpl?=
 =?utf-8?B?WnlvL0tVYkRBa1R5RXZTWlFWWVdHUTkvcWlrY0Z5WUFyNExRRUVTSEFIb244?=
 =?utf-8?B?dVMxSGhLbU9DNDFSL1dNcytCU1IxRFVma240SmNQMmpCVmVTejJvREZ0UlFX?=
 =?utf-8?B?a0djRHlXbktPN0JmZ011WHNXUDNmZTE3b1dYTTJGOE5SZjhFOENWZHBXN1Fz?=
 =?utf-8?B?V0V5MTJNOERzc3lvUk5TZ290L294akVRU3dPQnZvTElyWURyMlNDTkF5cGxN?=
 =?utf-8?B?SmJwa005WDVzV1cybW5OVUc0UStHeFhoMGxFSmU4UnFDUDIwRkNpWGlDczFC?=
 =?utf-8?B?bmpEZHRQdnVQMmw2a1lHeFAzNW9ZcUJ1bkEwaklwc2sxNk41Z0xSelh2NFBS?=
 =?utf-8?B?ZGtrOG1oUnNnbmpBbktrTnNlVHBlK2twSDVVV2pRUWtGTjFlRlM0cVVlcVRF?=
 =?utf-8?B?YTcwWjhIWWYvRWdkWHdoeGlSOG5FaVhITmFDWStuRTZYTUJxcys5TUZQTml6?=
 =?utf-8?B?bUk0bDlPQXdmWG15WUc5ZlR1cUY5alVUWUNYRys1bUs1L0JwcndOTjZ5TzND?=
 =?utf-8?B?UVZzei9rWG5RSHU0YzNXdjIzZmJkZi9JNmhBcWloaHpOMXdpZEE2aTFDaGRs?=
 =?utf-8?B?SnNiRVVobkZDbFJOb0FBM2llL29Ha3kzV3Z4QnR0TVNCVlI5VGoreE91ek9i?=
 =?utf-8?Q?p33U=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2cad2fd-5bd3-4e75-1d88-08d9bbdb459c
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 12:47:49.2975 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YWQuidDOvIGPLeBPoh9GgBm51gaFoVk2lXUiso8e/QFU49T3CqzosjeE5tjRK4fd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1776
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
Cc: Damian Hobson-Garcia <dhobsong@igel.co.jp>,
 Takanari Hayama <taki@igel.co.jp>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Tomohito Esaki <etom@igel.co.jp>,
 linaro-mm-sig@lists.linaro.org, Doug Ledford <dledford@redhat.com>,
 Zhu Yanjun <zyjzyj2000@gmail.com>, Alex Deucher <alexander.deucher@amd.com>,
 Sean Hefty <sean.hefty@intel.com>, Maor Gottlieb <maorg@nvidia.com>,
 Jianxin Xiong <jianxin.xiong@intel.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 10.12.21 um 13:42 schrieb Jason Gunthorpe:
> On Fri, Dec 10, 2021 at 08:29:24PM +0900, Shunsuke Mie wrote:
>> Hi Jason,
>> Thank you for replying.
>>
>> 2021年12月8日(水) 2:14 Jason Gunthorpe <jgg@ziepe.ca>:
>>> On Fri, Dec 03, 2021 at 12:51:44PM +0900, Shunsuke Mie wrote:
>>>> Hi maintainers,
>>>>
>>>> Could you please review this patch series?
>>> Why is it RFC?
>>>
>>> I'm confused why this is useful?
>>>
>>> This can't do copy from MMIO memory, so it shouldn't be compatible
>>> with things like Gaudi - does something prevent this?
>> I think if an export of the dma-buf supports vmap, CPU is able to access the
>> mmio memory.
>>
>> Is it wrong? If this is wrong, there is no advantages this changes..
> I don't know what the dmabuf folks did, but yes, it is wrong.
>
> IOMEM must be touched using only special accessors, some platforms
> crash if you don't do this. Even x86 will crash if you touch it with
> something like an XMM optimized memcpy.
>
> Christian? If the vmap succeeds what rules must the caller use to
> access the memory?

See dma-buf-map.h and especially struct dma_buf_map.

MMIO memory is perfectly supported here and actually the most common case.

Christian.

>
> Jason

