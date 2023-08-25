Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE4A7880DE
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 09:30:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C31BE10E61D;
	Fri, 25 Aug 2023 07:30:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2078.outbound.protection.outlook.com [40.107.212.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D667C10E61D
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 07:30:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jVKYiDQ1OYocK0R2bGE3ZWtmdIH69TkcIefeaoZtoTBU7+4p5uYLNYul5q7KPB0aoRcPg5yAuG8WPN3TLEA2PSqPhf+F9f8igZcaIX6A24tRR6ZKlL52uux21gF0QiLuo6VfIuD1G4RYa6uiCUhG1WFz1Sv8HFN0ld/RsE1p+2KDswGgJ9qxtIFJeD+op87e0qfaHAIpPcduPxIEivEk09el2RnSw8YZCeWMOLun7h/CTJy6QCJWPohOIQg+Pk81MtH5WvV0rU3vGbfH6vD98/PNnNqPtHcuK/oY39oEB545mmh1LvYVSa3fenXMU+oTLqmskNbb5iCkmiMwNB33bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sOZEuxaJxVNoWbDETUwZRpsjC9GcYN/ae0Rx5OoWhU4=;
 b=SgU2u2pY67ZQAIq/9mFFihL5JpB8+G3iWcelpEyfeomKBbYZLO0paCYwheZU7dPY8e6BozBF1swM5+Mgv9jDHSHi/YJn70GqZs+KulsiMZfdxSUl9qUqw5pwa19ZUVvm6HgyJr5GvF/n01PAWb2ZHdnOjVXgSAmd8wAoG37mZCI26LwUBubvGQLpiMye8+nZJASJEOtmIGJ3BCxqAfCVhgRcNKthMEvgzw/0eD/6bHaz/N6EK4fc4gIaOA9A3uuw2mrdixrFMIRXo78rwQMCsF3n2qcjkmqRZCEea8+ZIBxaaGbmW0rC5Hm/tmL/AhJlJXtaGMn8aH3gRNOSSVkXag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sOZEuxaJxVNoWbDETUwZRpsjC9GcYN/ae0Rx5OoWhU4=;
 b=nnepiRKwA5lLG5efSErBp/q04/LAkBWr95yg78gV40RaLRUahb7mcltyOcZRasgHhwp1m/6A5JlqqALjNHSmAYMl+bQgbQDU5qc7Urn7GYpla2COv4zETOAdwZHzHNusted3+cd/6xcgMBzDLeChEgVQcTL/uGvorPrl6voCPw8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by MN2PR03MB5360.namprd03.prod.outlook.com (2603:10b6:208:1e9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Fri, 25 Aug
 2023 07:30:33 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::411c:e486:3837:cc25]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::411c:e486:3837:cc25%3]) with mapi id 15.20.6699.027; Fri, 25 Aug 2023
 07:30:32 +0000
Message-ID: <3d0fc9c8-067f-6fdd-921e-658d5df3035a@synaptics.com>
Date: Fri, 25 Aug 2023 15:30:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC]: shmem fd for non-DMA buffer sharing cross drivers
Content-Language: en-GB
To: Tomasz Figa <tfiga@chromium.org>
References: <029b982f-da62-4fa8-66c4-ab11a515574a@synaptics.com>
 <CAAFQd5CqAvr7ZUdDSYPEOWSgvbttTBjHa0YWDomxJJSaiZxGog@mail.gmail.com>
 <f8a168e8-1a23-c6b3-0f68-baa73396d594@synaptics.com>
 <CAAFQd5A3YKjt03zLQBRvw1QNNqbCyhVzHNo+2mG6uhXJvGv-Wg@mail.gmail.com>
From: Hsia-Jun Li <Randy.Li@synaptics.com>
In-Reply-To: <CAAFQd5A3YKjt03zLQBRvw1QNNqbCyhVzHNo+2mG6uhXJvGv-Wg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0211.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::6) To DM6PR03MB5196.namprd03.prod.outlook.com
 (2603:10b6:5:24a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5196:EE_|MN2PR03MB5360:EE_
X-MS-Office365-Filtering-Correlation-Id: cc87182b-cf4f-401e-dbca-08dba53d2a44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /SX6umRv28mFNSzrJf0fXiIMyJnXMvu2XntvCY/bByp/Q6zBD+g4vWmT+V4LKgNxsRIc0PNtBLuIi38pBNyDVVy75VkGhCCGgKN1T8XuZylHdc40RtiAZtaAO9IH5r6Ln0mE8yJkYBv75xYDLCBxXUMWQ8WGy511FB6tKtZFkSAhbHDNnTv3ui6rK/w1+9W2fOYFxZbavgTSVLRe+0QupFEI+ej07EZfSF5a0WfSsd42M+JxpbjIrOiOkPVwg/CAEAHLPkUh362s1JgtpiXy9imdZO/VEUW86vvQ5xJbNw93UfsaQrH5phrhtPBc5kKdyIvJjbl3GQCX5IUnvhkJoJQfQ4dzjSuYrOP2KIdhpADn+tDYIibKRrvEMrRl+tJn/akIAFT3qdyEkPTArZjvqCPjhY2cWt+OzHxEcZiZCjMYjf3m2wz+WCsvLQ0qpozVn7UNkj+m9w/6/z3WuSmip6crrVgabEIIoL575jNULsqooUGXxuYSoFKg1OiXfpUsH2SkEvywoxe0uUS5wopLrfzKfM51qlJyyMdh8u5fYX2wmoemSXAWRKS7/SCAFNGxTvydsKw+LZtz7Ou9z2sCgIWao+43iI1a8YyikU0snwRp6DeDENqo3IQ2oroOimuwHgodzub2RULkbgeL5wTCrF87lGr2K1cCrun07WqNh+k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB5196.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(346002)(376002)(396003)(136003)(186009)(1800799009)(451199024)(66476007)(54906003)(66946007)(66556008)(316002)(6916009)(478600001)(26005)(38100700002)(38350700002)(6666004)(41300700001)(53546011)(31696002)(6506007)(52116002)(6486002)(86362001)(6512007)(2906002)(966005)(31686004)(4326008)(8676002)(8936002)(83380400001)(2616005)(5660300002)(7416002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NC80WUhOYUpkTHJIWWExbkh4YnJPeUdxaHZPTTE0RU9oOHFHQVJEd3pmVnk0?=
 =?utf-8?B?NnplZnZLVExxaEh6MkpYdEN0K05SRDZRNU5QY3NWU2NONEJsckFubWRQcnF6?=
 =?utf-8?B?S3hBV21icm55RWxBdEhkUHJWRVJnMTlNSHkxK2ZQZE0yRDZ0L20yNmhNN0xy?=
 =?utf-8?B?TE5UZWlnZW9BMzdPRkFpSGdHbE93KzRRUUV2V2gySkhHMSsxdWtzUTZCUE9Y?=
 =?utf-8?B?dG84Y3pZT2FHcXQrVEl3ZVhzci9qZDB0WU9xekp5dWpSVjRFUnRjUzc4cFZq?=
 =?utf-8?B?cUdmRFh2RkNuSlYvNTB2ekJNRGVTUzlOTXl4TVd4TVJ3SlB5RjZVWEtnTkZX?=
 =?utf-8?B?Tmd6U01ZalM5VjVBRkN5ZjJjeUdXV3pidUNmaTZRK2MwWStkSnZhOE90Zk00?=
 =?utf-8?B?ZysreEZVN0F4YUdCUXNheUcwYUJ3WnQzdjFNZnFob1R6aHNYaFltaSt2NitB?=
 =?utf-8?B?d05sOGIzMklzeHYySUZJbW5ScTVOTS91YWNTSmpJb1JLWU0vVWs2Zloxa1p5?=
 =?utf-8?B?ZlJRZURCanBZUDhaNDg2ZlpyZm5FclZLYkQ0S3ZNdXdhMG9ENVZhQUZ6YzFS?=
 =?utf-8?B?RFBhZktwWmNJY3VuVHVPeVpCMDRlcmFUcFQ5MGlLejlrNlZOZUVUU1R0KzQ3?=
 =?utf-8?B?VzVwbmxuQ2J0aGw3Q2JuRm1ESUZrTTJJR29RVDZKTlZPbnorZXpJN1Y2dVpV?=
 =?utf-8?B?UWhwc2ZhSitYaU9iOGtyS2ZrM0ZzcFBhdGRQczRwdWMycnREcTl5dzFQQ1JR?=
 =?utf-8?B?aEI4QVhack1Oekc3L2RUVjJMQ1hUQmRtanJvaWVNYmFBTVZGWlUxdUtiQXBp?=
 =?utf-8?B?NWRsNUhXVFdVVXluYVcwSjRrZVJoa2dsV21rOHdCcmF1aDE5SnRkTlNEVHRI?=
 =?utf-8?B?VmkxOFlGYmhEeENBOVRmSGx6Zy9lNkgxYVZpYXdkUUtQTGRGbkp5MDV3dDJC?=
 =?utf-8?B?ZGJjNmdLVEJkL3JramI4eXg3eWlmdGQ4YisveTJPMGhoQU5pNWhLYXhsSUZk?=
 =?utf-8?B?RS84aUpteGl2czRHLzBTYkpEeUFNVHFmUEh6TVNCRVJZakxvT2xqcDVCQmVR?=
 =?utf-8?B?QkZudlF5ZXM2dEVRdkp1UE90TkJaZCtmUDUzVENFK3p6SXd6MHhBdzhzT2Vo?=
 =?utf-8?B?dGVid0FGL0tlQXM0QUdTT2tNZ0Y4dVVCRmxmdXR5SzhOaDJ2V1RqWGZnd2pz?=
 =?utf-8?B?N1o0ZFdKaVMyVjh1RWgxUThmMEdrRGw2QmZ0eVRSNGdTZXJSRlFkSmdQTkFS?=
 =?utf-8?B?YkdGMW16RmdQS1lQazAzWmQ0clJTRCtHSkp3TVIwU1hzdkRRZ3MvR0VzUGZw?=
 =?utf-8?B?eVB5MlVMdnBYKzdpUXMveTJqTGoycmxWTk1oQWtQZHdFNXR6VklqcE1vWGZE?=
 =?utf-8?B?KzRVZUpqc2d1dTlWWUVMb0tPbE5WdWhJamRYT091MGNiYm9VRW52ZVd6TDdi?=
 =?utf-8?B?c3VkYnN4RnBsUFF4NWs0SjlrczJwdDhXdGIrTEIwUWRsWW5saVFvSWdTTWlZ?=
 =?utf-8?B?MGYxb0pYODZTb0gxdjV0ZXR0SEx6b096ekJ2MWNpNG9IYmM2Mm50R3J6S01C?=
 =?utf-8?B?WWd4ak12YmthTGxFNHZRYUpheDY1UWlRVmJPb3R5YlFKTmRrS1FnTS9NeUFi?=
 =?utf-8?B?Y2J0ZG1TK3ZDMkhuSTZpam5ucGEwU0g2NVEvM1k0a2FCdWJHYnE5UmtNVVlS?=
 =?utf-8?B?Z2JtR2NnVTl5Ui8vV1lQcUpOVVhnQ1RvTUYwUWxLenNFWEwrSWZNN01DdzVJ?=
 =?utf-8?B?bzVzWCtQbGdCTldFU0tQeFdLWDY5bXVIR1NKcytJUUY3Ym03dVBXRUEwVmwr?=
 =?utf-8?B?NmdVMWpEZm1kcFR4MzU5RElOK3BiTk1VL21semZ1VjV0MWxnNnRQSHAvSExm?=
 =?utf-8?B?K0RVY2I2Q0RvbTVtK0hJNTQyaGVCRk51SG43Mk0zL09PNTJJMklYZUlkUEdH?=
 =?utf-8?B?dStmeXk1dXBldkVmZStyaTlaNGJhTTlPZkVnbVRoOUp2TjdKK0lydlk5MnVP?=
 =?utf-8?B?WFYrZ1V5N2hkMUVMNzlNTzNGa0wwWmNLakRzTEJnRWt4cXo5NEtlNm5Bd2dr?=
 =?utf-8?B?UDhmOExjdEZIUmllbmJYcXFZaUxUUWdTNmRqaGVHZzdVUDFGTGVENVhXcEQ1?=
 =?utf-8?Q?7Rva4nraGvaXMrP+lCKSnkLO6?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc87182b-cf4f-401e-dbca-08dba53d2a44
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 07:30:32.5294 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c0XvhHxda3J/Fjnt+XqJ2Iq5rmmEGiLkrAHDDAnWoSWJt4meB0daTIjUoMP6UhGwZGWmGFpS1QlgMX43mdy7Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5360
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
Cc: daniels@collabora.com, ayaka <ayaka@soulik.info>, hughd@google.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Nicolas Dufresne <nicolas@ndufresne.ca>, linux-mm@kvack.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, akpm@linux-foundation.org,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/23/23 21:15, Tomasz Figa wrote:
> CAUTION: Email originated externally, do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> 
> On Wed, Aug 23, 2023 at 4:11 PM Hsia-Jun Li <Randy.Li@synaptics.com> wrote:
>>
>>
>>
>> On 8/23/23 12:46, Tomasz Figa wrote:
>>> CAUTION: Email originated externally, do not click links or open attachments unless you recognize the sender and know the content is safe.
>>>
>>>
>>> Hi Hsia-Jun,
>>>
>>> On Tue, Aug 22, 2023 at 8:14 PM Hsia-Jun Li <Randy.Li@synaptics.com> wrote:
>>>>
>>>> Hello
>>>>
>>>> I would like to introduce a usage of SHMEM slimier to DMA-buf, the major
>>>> purpose of that is sharing metadata or just a pure container for cross
>>>> drivers.
>>>>
>>>> We need to exchange some sort of metadata between drivers, likes dynamic
>>>> HDR data between video4linux2 and DRM.
>>>
>>> If the metadata isn't too big, would it be enough to just have the
>>> kernel copy_from_user() to a kernel buffer in the ioctl code?
>>>
>>>> Or the graphics frame buffer is
>>>> too complex to be described with plain plane's DMA-buf fd.
>>>> An issue between DRM and V4L2 is that DRM could only support 4 planes
>>>> while it is 8 for V4L2. It would be pretty hard for DRM to expend its
>>>> interface to support that 4 more planes which would lead to revision of
>>>> many standard likes Vulkan, EGL.
>>>
>>> Could you explain how a shmem buffer could be used to support frame
>>> buffers with more than 4 planes?
>>> If you are asking why we need this:
> 
> I'm asking how your proposal to use shmem FD solves the problem for those cases.
> 
The shmem fd is the reference to a metadata container(A C struct in 
kernel). Then drivers(V4L2 and DRM) could read this metadata when it 
processes the major buffer(SHMEM buf is the buffer assigned with a major 
buffer like the graphics buffer).
>> 1. metadata likes dynamic HDR tone data
>> 2. DRM also challenges with this problem, let me quote what sima said:
>> "another trick that we iirc used for afbc is that sometimes the planes
>> have a fixed layout
>> like nv12
>> and so logically it's multiple planes, but you only need one plane slot
>> to describe the buffer
>> since I think afbc had the "we need more than 4 planes" issue too"
>>
>> Unfortunately, there are vendor pixel formats are not fixed layout.
>>
>> 3. Secure(REE, trusted video piepline) info.
>>
>> For how to assign such metadata data.
>> In case with a drm fb_id, it is simple, we just add a drm plane property
>> for it. The V4L2 interface is not flexible, we could only leave into
>> CAPTURE request_fd as a control.
>>>>
>>>> Also, there is no reason to consume a device's memory for the content
>>>> that device can't read it, or wasting an entry of IOMMU for such data.
>>>
>>> That's right, but DMA-buf doesn't really imply any of those. DMA-buf
>>> is just a kernel object with some backing memory. It's up to the
>>> allocator to decide how the backing memory is allocated and up to the
>>> importer on whether it would be mapped into an IOMMU.
>>>
>> I just want to say it can't be allocated at the same place which was for
>> those DMA bufs(graphics or compressed bitstream).
>> This also could be answer for your first question, if we place this kind
>> of buffer in a plane for DMABUF(importing) in V4L2, V4L2 core would try
>> to prepare it, which could map it into IOMMU.
>>
> 
> V4L2 core will prepare it according to the struct device that is given
> to it. For the planes that don't have to go to the hardware a struct
> device could be given that doesn't require any DMA mapping. Also you
> can check how the uvcvideo driver handles it. It doesn't use the vb2
Because it uses vb2_vmalloc_memops?
That vb2_vmalloc_attach_dmabuf() won't work anything.
> buffers directly, but always writes to them using CPU (due to how the
Yes I noticed it would copy UBR buffer to vb2 buffer.
> UVC protocol is designed).
I don't know what stops that, because we can't assume xHCI or EHCI have 
the IOMMU?
> 
I think that is not I want. If you were not talking about META_CAPTURE, 
which would be a ioslated dev node.
For example, we have a NV15(2 planes) buffer with its HDR data.
We need its NV15 planes be accessed by DMA directly or it would be a 
performance issue(so UVC memcpy is not acceptable), while its HDR data, 
we just read it from the devices' registers or somewhere, should be ship 
with the exactly buffer.

Even we could expand the vb2_mem_ops interfaces, making it know which 
plane(ex. plane 0, 1 are graphics plane 2 is the metadata). The purpose 
here it not invoke the metadata buffer with any DMA buffer procedure.
>>>> Usually, such a metadata would be the value should be written to a
>>>> hardware's registers, a 4KiB page would be 1024 items of 32 bits registers.
>>>>
>>>> Still, I have some problems with SHMEM:
>>>> 1. I don't want the userspace modify the context of the SHMEM allocated
>>>> by the kernel, is there a way to do so?
>>>
>>> This is generally impossible without doing any of the two:
>>> 1) copying the contents to an internal buffer not accessible to the
>>> userspace, OR
>>> 2) modifying any of the buffer mappings to read-only
>>>
>>> 2) can actually be more costly than 1) (depending on the architecture,
>>> data size, etc.), so we shouldn't just discard the option of a simple
>>> copy_from_user() in the ioctl.
>>>
>> I don't want the userspace access it at all. So that won't be a problem.
> 
> In this case, wouldn't it be enough to have a DMA-buf exporter that
> doesn't provide the mmap op?
> 
Also we want it allocate from vb2_mem_ops->alloc(), we could set an 
alloc_dev for a plane in queue_setup(), but where the metadata plane is 
would depends on the pixel formats.
It would be better not in vb2_planes.
>>>> 2. Should I create a helper function for installing the SHMEM file as a fd?
>>>
>>> We already have the udmabuf device [1] to turn a memfd into a DMA-buf,
>>> so maybe that would be enough?
>>>
>>> [1] https://urldefense.proofpoint.com/v2/url?u=https-3A__elixir.bootlin.com_linux_v6.5-2Drc7_source_drivers_dma-2Dbuf_udmabuf.c&d=DwIFaQ&c=7dfBJ8cXbWjhc0BhImu8wVIoUFmBzj1s88r8EGyM0UY&r=P4xb2_7biqBxD4LGGPrSV6j-jf3C3xlR7PXU-mLTeZE&m=Axkxip3NAR4d0Qb1sF508Emp922GJVs1gxv_UOP_DSxMMblD5iMl_F5-MiGyjiuZ&s=moL165MraNoXAqwiOfsw2qTeqLEzJ17Ut3J8DBx783c&e=
>>>
>> It is the kernel driver that allocate this buffer. For example, v4l2
>> CAPTURE allocate a buffer for metadata when VIDIOC_REQBUFS.
>> Or GBM give you a fd which is assigned with a surface.
>>
>> So we need a kernel interface.
> 
> Sorry, I'm confused. If we're talking about buffers allocated by the
> specific allocators like V4L2 or GBM, why do we need SHMEM at all?
> 
I would be in the IRC channel 5 hours later and this weekend, if 
anything is confusing, we could talk there.
> Best,
> Tomasz
> 
>>> Best,
>>> Tomasz
>>>
>>>>
>>>> --
>>>> Hsia-Jun(Randy) Li
>>
>> --
>> Hsia-Jun(Randy) Li

-- 
Hsia-Jun(Randy) Li
