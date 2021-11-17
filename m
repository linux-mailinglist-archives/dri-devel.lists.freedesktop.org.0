Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 214BD4542EE
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 09:48:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CB116E43D;
	Wed, 17 Nov 2021 08:48:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2058.outbound.protection.outlook.com [40.107.237.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 293CB6E446
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 08:48:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WvXlLBSks1lMrMZd8/CXAdIoA3hUYagqKO7NU2eHjqezX21T1HHlZ5Z3AtzVYCOg511hCWZaqA45NgzIM8DO3FfT8wbABImhaKzsiGNULjtkXIrNks8u0YCvD9SyOMMr2psO9cq4Vu/IpwKC2LX6JnuQmHFKfIltjSMDE6dfq1B3DZ6ILnCsCfM7OByibTrvoFbh/fkMqM1uSyuhKjnOGlIpXl/zSNhNA1rXlCKN4a8HZy5XoqCO06QzvW0GJIX0qHLuxUNjaKSHFBI2lncmg63p8U+rH73vMhc2hiZSqFjWagTB1kLG3NwEDYTGLuEo5lUXWIyHx/FqNbJrLBx8oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IO0w2EvVI85jmKe2NPiMIyLRvdvbCaLaALoGHUgWY9E=;
 b=Ssw42izo5m3bn2iHkKuIhbA8r7ow/UKbZXR62Sqqsf94+Orr8ryNVaLfPGbtYNRXD8le5gUAJn2vdvdo/SgKGEDgyZ2sFLHQ9D9mmv6ezL4NLNMQRkicF5yL6Scl+c3lSnde9wrBJqRXDt9Wp2rdrQrw0IZ/x1LNiHTsdVCyclTVGRbHlAucxMRWldjvACKh6CIUReqBKkJjW+SgpRdHxdcyylA5XUKCBKq2i+oCnZueRROfImjnAf+/nswmh/y3MWrs9KMlpmyPqJYA6KTDWnA//fwjXiVYk5WOR6YfXAXFfkqSyOYeTiEuXYeuPIe5whfU9dVdoMXQ/EPwruFHsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IO0w2EvVI85jmKe2NPiMIyLRvdvbCaLaALoGHUgWY9E=;
 b=i+IiIYDAtkIKg+rRiBwOjib6n2kL4LgENfJl2slzdYDo7Oeq62BCdYzQY43sqkhb5r0XrdQi2kp+ZEVQsPprULwLfhrj6xit8EixtnUjDJFhyOI1dOO9JHmPvUJJSwmCk8sLWR53AGx2/sw1KoHMHzVFEcQwfcMGZ6LdoB4Vbg4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR1201MB2478.namprd12.prod.outlook.com
 (2603:10b6:300:e5::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Wed, 17 Nov
 2021 08:48:46 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769%5]) with mapi id 15.20.4690.027; Wed, 17 Nov 2021
 08:48:46 +0000
Subject: Re: [PATCH 00/15] iio: buffer-dma: write() and new DMABUF based API
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20211115141925.60164-1-paul@crapouillou.net>
 <YZJwnPbgCOdeKq6S@phenom.ffwll.local> <18CM2R.6UYFWJDX5UQD@crapouillou.net>
 <YZPWEU2zRCY0En4l@phenom.ffwll.local>
 <YZPc6HNOe6YOLE9k@pendragon.ideasonboard.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <60b51cd7-7d18-b037-c77e-b2548d2f94c3@amd.com>
Date: Wed, 17 Nov 2021 09:48:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <YZPc6HNOe6YOLE9k@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AS8PR04CA0120.eurprd04.prod.outlook.com
 (2603:10a6:20b:31e::35) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:f3bc:62c7:d104:fb77]
 (2a02:908:1252:fb60:f3bc:62c7:d104:fb77) by
 AS8PR04CA0120.eurprd04.prod.outlook.com (2603:10a6:20b:31e::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Wed, 17 Nov 2021 08:48:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f2aeb16-bd27-4ec5-6889-08d9a9a710cc
X-MS-TrafficTypeDiagnostic: MWHPR1201MB2478:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB24787AE4A201AA4510DB1865839A9@MWHPR1201MB2478.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zXtUjraxiEXYgoK+4LWL6iQwcgk2PKDKM7eyR3EsIbbWcqXl4EfOc1GR6LWnfKfGSpPTADv6dZI2C1YqIwtBzXH8NoNmBdTIK94aaHs/yxM2PKun1Fdd0YEQGKTjQxCmYz3+nfOlWjfoaRtEoiOFXWsgDsZzyxNetKKyK9+ShPq1RwAWHjZjTL9i4g5yTsmR97rtdroxNUi3oRKWDIyYEwtI5c+s8LlrvzJlm6u8F01LFqyCwlIXJ13NtiM/2tfuqmf8qPICaUuC3QS1QdhsxtS1L6PyY/oZg8FTGzlHTZpsOIxg8zUP+6QhOKLEa36TC0PtlgK2TMhUvBWL+Bxpq49is+dHP+frInLRlqu3k7yxHPgRzK8HaShS5PIUJ8DU1o5yzmc9cfVUnkrchqxnwyx+cfHWZFf8NRkIvozK2WhCqFZIdCuZH/pOxvFrZBjdWuJl6z6aZE051HLsBJMEUAUL3oWnoeRUzWbVgUqWqu+0E81QMKoZlT0zlULgM3/3srERHLTgDg9RFmGnUFRIgWAYcF1Cqon6a6sPc6fWdHEbk9mpRhb0+TZsQuyytZEMKTrYk9R7L1Hqu5RE0/4JJhALR/kZD6v9q5tLP4zRUd0R3DdUcA6m3dG50UEsFqRtZ9IvLbRXpuv3HCTGhl9IUz7liaU3BQ0BUnkeDMcc9pSUa5bxD2aQhzjfVxbw3axG2NM4jLgPWZYVFkdvf9JHZFtyisXHM8wAUiVGblZpQGfCkvVtcKfCxU+3suDYqmET45c27Yl2dM0tTasRJIsVf1ux0ZOzKHsa7ArCxqQKjP2pLr1+hsl2zP3n73a2XJjIZbf0IP6dzSzm1JbWCcKu5g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(110136005)(54906003)(2906002)(83380400001)(4326008)(316002)(45080400002)(6666004)(66946007)(66476007)(66556008)(7416002)(186003)(2616005)(31686004)(508600001)(6486002)(966005)(8676002)(5660300002)(36756003)(38100700002)(8936002)(31696002)(66574015)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkhnaTg5dkY3OFo0U1Q2bEQrbTV2YlpSZW5YYngyeTg5bE1QdkoyQXZkeVRo?=
 =?utf-8?B?NUtoZzJxR1FDUksxTnBURzlFUUFmeVlXeXdsVHBiVS9DalN1K3ZkbXZPZ0x6?=
 =?utf-8?B?Y2xtYWxVbEdtNDE1TTUvcGRXdjgvM3NWMmovRnhjeldQTWJ1U2ZPamFzWmtV?=
 =?utf-8?B?UHJXeHB4ajNwNlEvVlQrYXZyUjBsYzd5aFE1cnhZdUMxRHp2c1hmaWFNV2lp?=
 =?utf-8?B?YS94VytWeGdxUzNSYldHb0IyV1RaS005VXNvSjRmT3h6WmkwNFhOS1lBSzNT?=
 =?utf-8?B?SENpMS9NNCtWU1VFWnRKd251aFZYNlFPck1hcUJwWDZQSnZZQ1haYis4MDVC?=
 =?utf-8?B?Y1h6V1NCUm5jbHEvZ2lXb0lsNktHVGFOakFpOTZNY0JUUUt1cmUxTmp1cjV5?=
 =?utf-8?B?NXcxVU5CT1Vrd0wyMDV1L2E0NHYybmxFR1BaNUFPekU1b2owSVVBcGU0WndC?=
 =?utf-8?B?RVJjRnowb0tmcnc2Y0h5Z2JnV20wbHNESC9PRmVCb0pmMjFNQnNsSEV2TkZx?=
 =?utf-8?B?Yk5TSkhBYVhNSGJFakNWK085b3UzMVJQUGgzS1YrOXEyOHE4RWwraTVDajNj?=
 =?utf-8?B?dlhNQzUrQkpqQW56Mzg5Q3MwSnVCQWNmb1RmZWZ6VXhmYk00ekFtYVg2S0Fi?=
 =?utf-8?B?MlJxZmdVQU5vOGt1MFlOSlpoYVZDcDhjc1d2ZEFyM0lNR2Y1SjE1dUNTbHhj?=
 =?utf-8?B?aGdWdkovWVN5cnJETkZjRkcvMlRINmVOb0pEa1hBbkJrcVQ0dXpZeG80bXAx?=
 =?utf-8?B?VHhEeDFyR3BXQ0hESS80cWdwSXRYMHUvKzNXM2N5REh3cmY5YnZablduUk5P?=
 =?utf-8?B?YUFuQ05lRWFoTkdHdkJEN2VQQlhMbHR6UTg5cW5seWFIVE9NQTMxaFp0a1Vp?=
 =?utf-8?B?ME8vOThmcU9IQU5FNThTMC8zVVg5UVpoZlhkTGxRT0ZlczB6a2ZtRjNmSHY3?=
 =?utf-8?B?U0JQWk5ZWmxSQ2JDTGFETmhJTDJmV205blQ0czRublNjY0VqN2RhUkwrd0hX?=
 =?utf-8?B?UllqZVlsZGx4TmdWcTdTQjJ3N2lvWVJSQnZXNWtjY1NHYmFaT0Q5R0VZNmZo?=
 =?utf-8?B?cXR6bzhNaldiQUo0ZXl2VkVhVGVsWTE1eWtzdEloNkdBYUlzRVhxcnRmK2Uy?=
 =?utf-8?B?c3pSdWdWL1FwKzhzczJBWm5DOVk2YlROT2tKTUxqcHdkbEVwR2JCRG85MG5G?=
 =?utf-8?B?NmY1d0FraER3ajFJbExQcStaT3FaNzVOYitzaWtuSW05T3lwbDJVc2ltNjMy?=
 =?utf-8?B?NzNsVzdrNW9kd2tEeHpSS1BRQ3JHR1g5NGZySUo2cmlpVTlEanRCaTBuakh3?=
 =?utf-8?B?REVGbDZJTHlybG43cjRyTDI1c3NraWI4QUJ2aWhabTFoNlE2QXEyRzhiTTBO?=
 =?utf-8?B?Y2krUFhsMjhsRExUa3RYNjliODk2dzBFVUVia29Id1J1MUFzam9Ua3R0RHpQ?=
 =?utf-8?B?c2kwWTVUVlF1MDFCd0ttdE5LVFd4eGJWVGQ5c291TTkxWWZUbEdvQVhDcEhw?=
 =?utf-8?B?V2c5QWp6bmJvSGlrcW0xeHFxc3lsam5KWDNXcE1Jc3d3TVhMdW9FOVNWdUdM?=
 =?utf-8?B?TzVvcmliaURKTjE4RnpveStXeGgxQWY2eXF4SEdORi9KZzdHWlQ2STl4WDd3?=
 =?utf-8?B?bGhFVUdtUm1TQTQ1Uy9HNEFvWUZoblNLeXlTblBzZmxOOFpocUk4VFBjcmNV?=
 =?utf-8?B?UWdtS29vZnBqaUYwVjloSXVNMVRNMnU1MXdXUXBHWll3Uk84QVd6VHVsRDFD?=
 =?utf-8?B?dlMvN0IwQ1FxdVJLVlhpZ1pnd2tsZUV4S3hRSk1hdjF6a1pOYmtjdVQ4RU1y?=
 =?utf-8?B?Tys3WnlVMUU5NFozOGlkYVdBUjVqOUpCOVBtVDRaYjJaOXNmY1pCZWVtOUJZ?=
 =?utf-8?B?MFpLY1NDdDZZRUdxMi9Pd01TVlNBLytCUUVsZFBhQVB4SmpzK29UZXVLbHQ0?=
 =?utf-8?B?T3VYc2JDT0Z3a3NHQ2oxaTcyVFQ1cURCR3dVUDZvVmpkNlhObENHdmpyNkY5?=
 =?utf-8?B?Nk53UkhPYkV3M3F4akdPY3NuVzdOajY2MlBTVVJTQk91TFh4TjNLdUNQY2F5?=
 =?utf-8?B?b1g3aDBVcythVW1mMHZ2R2txMDFUdkxZWnk1aG13RDh2OU5McVc2Z2gzZjZ3?=
 =?utf-8?B?dHdJRGNLSjlDYThMYzRCRzViYTdpY1I1d004VkdxWStlVlJSYlBNRGIveGV6?=
 =?utf-8?Q?3asFsWEmE611oKD+EONyt3s=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f2aeb16-bd27-4ec5-6889-08d9a9a710cc
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 08:48:46.2097 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cUzN3yL5KUm5GRZ+xefR994OqSGAOpkp2XC8+luQK3MvdwVOb7P8yuFrY/DvNECR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB2478
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
Cc: linaro-mm-sig@lists.linaro.org,
 Michael Hennerich <Michael.Hennerich@analog.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Paul Cercueil <paul@crapouillou.net>,
 Alexandru Ardelean <ardeleanalex@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 16.11.21 um 17:31 schrieb Laurent Pinchart:
> On Tue, Nov 16, 2021 at 05:02:25PM +0100, Daniel Vetter wrote:
>> On Mon, Nov 15, 2021 at 02:57:37PM +0000, Paul Cercueil wrote:
>>> Le lun., nov. 15 2021 at 15:37:16 +0100, Daniel Vetter a écrit :
>>>> On Mon, Nov 15, 2021 at 02:19:10PM +0000, Paul Cercueil wrote:
>>>>>   Hi Jonathan,
>>>>>
>>>>>   This patchset introduces a new userspace interface based on DMABUF
>>>>>   objects, to complement the existing fileio based API.
>>>>>
>>>>>   The advantage of this DMABUF based interface vs. the fileio
>>>>>   interface, is that it avoids an extra copy of the data between the
>>>>>   kernel and userspace. This is particularly userful for high-speed
>>>>>   devices which produce several megabytes or even gigabytes of data per
>>>>>   second.
>>>>>
>>>>>   The first few patches [01/15] to [03/15] are not really related, but
>>>>>   allow to reduce the size of the patches that introduce the new API.
>>>>>
>>>>>   Patch [04/15] to [06/15] enables write() support to the buffer-dma
>>>>>   implementation of the buffer API, to continue the work done by
>>>>>   Mihail Chindris.
>>>>>
>>>>>   Patches [07/15] to [12/15] introduce the new DMABUF based API.
>>>>>
>>>>>   Patches [13/15] and [14/15] add support for cyclic buffers, only through
>>>>>   the new API. A cyclic buffer will be repeated on the output until the
>>>>>   buffer is disabled.
>>>>>
>>>>>   Patch [15/15] adds documentation about the new API.
>>>>>
>>>>>   For now, the API allows you to alloc DMABUF objects and mmap() them
>>>>> to
>>>>>   read or write the samples. It does not yet allow to import DMABUFs
>>>>>   parented to other subsystems, but that should eventually be possible
>>>>>   once it's wired.
>>>>>
>>>>>   This patchset is inspired by the "mmap interface" that was previously
>>>>>   submitted by Alexandru Ardelean and Lars-Peter Clausen, so it would be
>>>>>   great if I could get a review from you guys. Alexandru's commit was
>>>>>   signed with his @analog.com address but he doesn't work at ADI anymore,
>>>>>   so I believe I'll need him to sign with a new email.
>>>> Why dma-buf? dma-buf looks like something super generic and useful, until
>>>> you realize that there's a metric ton of gpu/accelerator bagage piled in.
>>>> So unless buffer sharing with a gpu/video/accel/whatever device is the
> And cameras (maybe they're included in "whatever" ?).
>
>>>> goal here, and it's just for a convenient way to get at buffer handles,
>>>> this doesn't sound like a good idea.
>>> Good question. The first reason is that a somewhat similar API was intented
>>> before[1], but refused upstream as it was kind of re-inventing the wheel.
>>>
>>> The second reason, is that we want to be able to share buffers too, not with
>>> gpu/video but with the network (zctap) and in the future with USB
>>> (functionFS) too.
>>>
>>> [1]: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Flinux-iio%2F20210217073638.21681-1-alexandru.ardelean%40analog.com%2FT%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C7fffe09e82514577747808d9a91e9dd9%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637726772007336951%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=w1vD8IKz5G7ut%2FlsOyuYXKKQRBV1s8dN7qJBUwo8x9g%3D&amp;reserved=0
>> Hm is that code merged already in upstream already?
>>
>> I know that dma-buf looks really generic, but like I said if there's no
>> need ever to interface with any of the gpu buffer sharing it might be
>> better to use something else (like get_user_pages maybe, would that work?).
> Not GUP please. That brings another set of issues, especially when
> dealing with DMA, we've suffered enough from the USERPTR support in V4L2
> to avoid repeating this. Let's make dma-buf better instead.

Yeah, when comparing GUP and DMA-buf the later is clearly the lesser evil.

DMA-buf indeed has some design issues we need to work on, especially 
around the async operations and synchronization. But I still think those 
are solvable.

GUP on the other hand has some hard fundamental problems which you can 
only solved completely if the hardware is capable of fast and reliable 
recoverable page faults.

Regards,
Christian.
