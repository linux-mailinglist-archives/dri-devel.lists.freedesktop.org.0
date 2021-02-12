Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F32CF319B6C
	for <lists+dri-devel@lfdr.de>; Fri, 12 Feb 2021 09:48:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F93B6E542;
	Fri, 12 Feb 2021 08:48:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2077.outbound.protection.outlook.com [40.107.101.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 300B76E542
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Feb 2021 08:47:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VZ2whSrg69UxpzP3kX6DJcOb5ttpZzZ9YGu/YedAR3fFxtDb8hrF46Y80USMKv8vYRWeoFSPZASCZnRMCAg3M/4lpChPR0JdyVmTEshWSWIk0L0nV1xhypOpfJez4w5qUahO3G35jIzOaBIIBH+VGSTM1p+Wy7eWrYHTgHa+CrqYeqHbS22eO58TOGMBMeDphn/KT/IwH8OLgF6WmJiHFkTARJFh0KREZLho61lnGHqbMGBKmdtrI8ewN2G9N9e87gRCGe+ftylm0FV6/UO1dQEuIHkbqGN+qV5lV3NeMzarVCxx5hr1+wyTqSxgiRj+2PBdRU4P7qVxI1mbli4Vvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bKaWv2POJi4E5OlJm7vcCYOCRPml3K5oYzIOiTebirc=;
 b=E9drSFIvThmAY1FVB+X/P0YNKuywXqtDn+YOK3mrBca4ZS6gzNkHqBNEX/nOLaqaN9HhU1Xxy37UAyYjJxBnLOTNf0kmjeLipksSja5tTB7lXOHxPQBWyqLpkBzfDgod8+R6C/GK0n4nyg4XF10JXAIooSIGI9RgQ9Su9E0lIBiIRCu2Bg7JzS9CCEAzT2FsPM+BjgLBhzrY9Ei/ABb1vwg2NrmDuiTmUxd4WqEybYb+fxIrYg7evLTdvZEmq+7WIeuyEtlk5KvdEuS9SlJjJLFE07Inpjzfe7LF0AB52H9cQ23X3OeRgQP5z9jOETnWz06DNHncPrSdz2oIBN8xTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bKaWv2POJi4E5OlJm7vcCYOCRPml3K5oYzIOiTebirc=;
 b=LQbwOiUh4CwV9ut173Kf0TQRpB67D99A9xIotrw047xzG5/SwN0b85tLATnQ8eJzlv89h5Tyd1ZpBNRfoYFtuaLgwNEAdwpB9W4Ca8EfHIia4lDaTJpDCBCP8MojjXRzkIfH3IoGeKYr5EkCJ6h5SgVmSjaVHMDMGbS4ucYAuR4=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4318.namprd12.prod.outlook.com (2603:10b6:208:1d8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Fri, 12 Feb
 2021 08:47:55 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3846.027; Fri, 12 Feb 2021
 08:47:55 +0000
Subject: Re: [RFC v3 2/3] virtio: Introduce Vdmabuf driver
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20210203073517.1908882-1-vivek.kasireddy@intel.com>
 <20210203073517.1908882-3-vivek.kasireddy@intel.com>
 <YB1sRx1GrT8rATEg@phenom.ffwll.local>
 <20210208075748.xejgcb4il2egow2u@sirius.home.kraxel.org>
 <YCEGrrT0/eqqz/ok@phenom.ffwll.local>
 <8ba4ad64be3546bda9a2ed2129bf98e4@intel.com>
 <20210209084453.5oqepy7zdwtxgrpu@sirius.home.kraxel.org>
 <2ef01dc941684a15a4f30e6239ae42df@intel.com>
 <8ac10b1d-3d64-4e39-42e6-6c65b61f0794@amd.com>
 <fd23d4d08ea84ca3b8a7610a8fb866d5@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <e3222c34-31ee-b43e-65b0-6ab01423d52b@amd.com>
Date: Fri, 12 Feb 2021 09:47:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <fd23d4d08ea84ca3b8a7610a8fb866d5@intel.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:5e65:14a3:85f5:f2bf]
X-ClientProxiedBy: AM0PR02CA0210.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::17) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:5e65:14a3:85f5:f2bf]
 (2a02:908:1252:fb60:5e65:14a3:85f5:f2bf) by
 AM0PR02CA0210.eurprd02.prod.outlook.com (2603:10a6:20b:28f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25 via Frontend
 Transport; Fri, 12 Feb 2021 08:47:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ee240c9f-b585-42b3-1a2f-08d8cf32e405
X-MS-TrafficTypeDiagnostic: MN2PR12MB4318:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4318B4DF40894B5F0AC4E40E838B9@MN2PR12MB4318.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZpQklN/AkBzSB68vU5uEOr+DO8woPfY9+K22T4FHGPC80YIPTBmDg9ild/hFptwvuEfaiOpBa7EOhRwb/591VPtuMLYBAq4IfVvBB5TtrQPyA20o1XkncK3V/g2ZjAZ+0vrXDezu4y857wAFx1zPxrR12I/jAjn0Tj0sApl6e/SbL4waQ+quU7ifhLhs5eM6dlXCbYSjICEq8IePf6yjV38xZZssYA9d5h90hPOlbco2EmCVlJu2NdQDGd1oYDMl2A9tQx0aRw2AHnFOGD7z3USgIWg1Z7tIs87rmkekQXpD453VMWUXTU+Q7mwJPWIj2QJ+isN3ds9vYqdEaOA8BjTwnrQtdeG5xa1gpUfwThQHUbkob5Sao+vWfaj3VPKjReodZHUhSgHapW46kJZG6TBrrWU4gPmA4jo6kuo7Jl44bO3hqwYw9V7RUz3nUHylgR5zi+auCUfikoThIi9oQzliGZMEOR/KQ75WFVIimLJ7SjKR2hDGJKh3VrVzbV1Lxx9piakMWoNe6Z0gpF2bPbnBms/QZMPRIu29xsiLyh/zZgQlNdOGyV+tGcIVy0hSLoNO8mvMbDdu8Yhb802c1ck7EUbtecWmCJejWLZd78I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(376002)(346002)(39860400002)(2616005)(316002)(54906003)(52116002)(110136005)(86362001)(478600001)(36756003)(4326008)(16526019)(186003)(31686004)(66946007)(83380400001)(8676002)(66556008)(66476007)(8936002)(5660300002)(6486002)(2906002)(7416002)(6666004)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?T3NIWTBBVGp5WlVRSS9SOVFIZUVjOTR2WjhxMzBFWndrak5ybGNQZlFodk1z?=
 =?utf-8?B?d3EyVlc3algvcGlOMDA2ODkzNE90VCtudE4xT2g0NHlxUUdMdU8zeHEwT29l?=
 =?utf-8?B?bDVybUFIcE4xVUtjRWhIYUdCcnBscU9sMzlwUm9uOTRsYWExcUtYY2wxZERC?=
 =?utf-8?B?dUdKc01rRmxlYUovRVZOazJFMDNWOTBiY0o3L0pjMWk5MGhKZmVNR3hvRUtq?=
 =?utf-8?B?aDFnR1V0ZkNqd0hjNklPQXhKSU1YaytjNEIzSUl3V1A1MSs0WU84VjRuMWNS?=
 =?utf-8?B?Ynp5TjNBS3FmdW1NMVJVd2FwdlExSVJqNytiUGJscnBjVnZRS2ZZMFVra2wv?=
 =?utf-8?B?cytuQUFhNGFmeGpxUTBsZFhyV0MyMXNVUHhsNEx6L00zYmtjdEV5SUZkdnM3?=
 =?utf-8?B?VzF0eE1BVXczNEo0Wno3V3JpbUlORnZIZzN1bEw5RVE0YjJsNDVCdzBJWjdy?=
 =?utf-8?B?QWwrWnVBK0NGTHdlZ1F0eThacTdCa3VzUjFwZHFIdHNjN2k5VVVyM29BNk5O?=
 =?utf-8?B?cUNVUERXTitOeXFzTEo2NlVzK1hiVFZxN3JGQ2Q2NzNQRWdWNDV4bjhONENo?=
 =?utf-8?B?RjlnanhNMUJYSnJSTnJaS3JlaFIxSk5VQUh1b3ZFeTZSejJZT1RqRzFJTUxV?=
 =?utf-8?B?UVV1SjBNeW5FQWdlRlFTd3dNTEJPeG1idU9CT1pKS3NmL3ZrOE14QUdjSERh?=
 =?utf-8?B?VFowa0UxVWtwNHB3NXpRSXl3V2h2WFpwMndHdXdWR0swYkZrUU9YMythd25X?=
 =?utf-8?B?WXVJM1FJYkpQWXpEZEJWYSttVGU0MVVGNTZkWGcxNHNoRWo5UTN6TVdxMU9Q?=
 =?utf-8?B?SjZKWHZ5eXZZWENuZllQVDZBQnE2eGR4NlRMbzRNR3p3MVJDU3BBUU05aGFv?=
 =?utf-8?B?ckJ1VTF1Y1kwcWVMTExsSWtCNGYzMmNWdGs5cnJjZ0lhOHV4WFJtTmlZNmYw?=
 =?utf-8?B?ZHdIL0JJRUFNRWlOdnU1LzBNRkRwYW8vWnhvRnRZSVhlcFEzNTFUelRjZ08z?=
 =?utf-8?B?RlRGcHRncWswbzJjVEtwSjdHdy83WFcyMG0rdGdDejU2aWlYUzRleENGeFFR?=
 =?utf-8?B?dEdYVDk2NVg4WTJMMy8zbXJYOUxMa1VaQytsYytpK21vZElwRnBCNUJUSlk5?=
 =?utf-8?B?YWFIcis3dFlRUkNUMWw4cW53ZVI1UXA5QzkvamdxaElNUmtidGZRUWVHdHJU?=
 =?utf-8?B?SGViYmtGcXFnRSt3cVB6VlplekRHdEsvRVB2RVhiYlNEaE1wOVBRNW9rV1o1?=
 =?utf-8?B?S2lUZ1dvSDBkdmJHbnBTc1RQeFRhdmVLZkNDcVZHcVk1MmdwUE1pbkwxbUxY?=
 =?utf-8?B?bVJXc3JlVldwUXRqM01CMzVYUU5iMkllSmJ4NlVSaFlZYUZzbDJka2ZVc3FH?=
 =?utf-8?B?ZDBmeU8zM0NPbE1BTmZhR0RSSk4zU2NXZitEcWRaelFHZGN6WVZMc2wvc1Vj?=
 =?utf-8?B?K0ltemU1QVAwNWlBS3BKWVhBZGMrb0JoMEE4a2xjV01sUnJDOTB6ZEJGckNO?=
 =?utf-8?B?RnFPU0ltb0xGekdTandqVUp1M1JyYWYrTm9ZS3NUeFBydndIZVVrakUxR2R4?=
 =?utf-8?B?bWY1QUdDVjRJT2JIUVB6QUFIQUQyZWtOY2h1d1VkZHVRUEVBajlKWW5PWU1E?=
 =?utf-8?B?QU1UcXJWek5TVnJYUC8wRE03SnNxOWx2a0hEdWlVSlhFYTZkL3krak9zZHVE?=
 =?utf-8?B?RGVGQVpVaXR2ZXZvS0UzNFRJZlVmQ01PZS9DNHNEMngzZ3VCRFkxTnBNUzk3?=
 =?utf-8?B?R2hrTTlxSHVHdjFLai9XOTlQa2NLVWoyajNyR1R2WnpnZ1IwTHYwTDJEQ042?=
 =?utf-8?B?a2pmNHd4T0hqYlB5VGtnQStaOG5wTk5PeTR4cCtDREVJckFwdXYrdkZETFpD?=
 =?utf-8?Q?zl3W78sbd3IvS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee240c9f-b585-42b3-1a2f-08d8cf32e405
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2021 08:47:55.5168 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ERFuBY4xNulP8rQs13GXjVYd5qk6iGDNqWh1t4hPaR/AYKW5JpH83qfuvVs2OcwN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4318
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
Cc: "Kim, Dongwon" <dongwon.kim@intel.com>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, "Vetter,
 Daniel" <daniel.vetter@intel.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Vivek,

Am 12.02.21 um 09:36 schrieb Kasireddy, Vivek:
> Hi Christian,
>
>> Hi Vivek,
>>
>>> [Kasireddy, Vivek] What if I do mmap() on the fd followed by mlock()
>>> or mmap() followed by get_user_pages()? If it still fails, would
>>> ioremapping the device memory and poking at the backing storage be an
>>> option? Or, if I bind the passthrough'd GPU device to vfio-pci and tap
>>> into the memory region associated with the device memory, can it be made to work?
>> get_user_pages() is not allowed on mmaped DMA-bufs in the first place.
>>
>> Daniel is currently adding code to make sure that this is never ever used.
>>
>>> And, I noticed that for PFNs that do not have valid struct page
>>> associated with it, KVM does a memremap() to access/map them. Is this an option?
>> No, even for system memory which has a valid struct page touching it when it is part of a
>> DMA-buf is illegal since the reference count and mapping fields in struct page might be
>> used for something different.
>>
>> Keep in mind that struct page is a heavily overloaded structure for different use cases. You
>> can't just use it for a different use case than what the owner of the page has intended it.
> [Kasireddy, Vivek] What is your recommended/acceptable way for doing what I am trying to
> do?

I'm not an expert on virtualisation, but Gerd seems to have a couple of 
ideas of how to get this working.

In general I think it is pretty much impossible to export stuff from the 
guest to the host by DMA-buf.

This is because of the fundamental concept of DMA-buf that the exporter 
needs to setup mappings (both CPU page tables as well as stuff like 
IOMMU). When the guest exports something it would mean that you give the 
guest control over the IOMMU and/or host page tables. And that is not 
something you can do as far as I can see.

You can only export stuff the other way around so that the host is 
providing the memory and the guest is consuming it. If I understand it 
correctly that's exactly what Gerd is suggesting here.

Regards,
Christian.

>
> Thanks,
> Vivek
>
>> Regards,
>> Christian.
>>
>>>
>>> Thanks,
>>> Vivek
>>>> take care,
>>>>     Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
