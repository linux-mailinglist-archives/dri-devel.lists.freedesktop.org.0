Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 924CE449F65
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 01:18:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 326DA89E3F;
	Tue,  9 Nov 2021 00:18:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2052.outbound.protection.outlook.com [40.107.236.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20E1B89E3F
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Nov 2021 00:18:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CqgPQeYbxprCaTAjp+PZYYcHCA0kXUTgpSJZEbz9eyFxh/tMeB9MgV2DQqRVwSoSNpAkG2AXob9dqoQnX2cvRBOMtJNIY4iTM2OhwhMfXRl9tKG5VEg4bkfhlPaTTE9eF/x0lNENe+5SBJtUglSVJKKU/DbUlhaDaii5O9ZMkSMNmF7OuWrrPeGshNOfCwZ7iuh9YuSGMEvdJXybb5IyvUz0nNRb1d8sjnAan548BCjvwdmJgTuNkVPG3Jqh1PR7AMh+o6PfM4YI0P0Ia1RyUOM+q0tJJYl/gCrx4gUYR4eZ6yH+nj2Bw/FSUdonvYhxU8a8JU3nqME7fml3k53c2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ppy2w7vNAuw2VY6fJbff6hNKN6cMJbbagQoEJrJrIw=;
 b=icZa0vlu73tY7IS+3kt0R6UXijORItcZV30kdTLz9IimAcohJHxlzZRZeIHnE019zcqm+4iQ/wRlzZ5c4HaKub2HWzwEV7qgk97ZOzYytiUWXQOPgs05nDzQ2npcuZdFblP0jZznZVb9iOykFuKEFY/J1/wLNc3vtcUCi2R/YE7TFhicoT/cgv2oVlpThoP2qAuDmNq09RdjoxHpVPoBxnBBiyEGaMxrvCcHJoDOkbCwrzK8Y2CxZhl1QaDDeWNQDboJQyV82WPAJhmOMgwgxyfiQMEOtF5XxCCnwKQblbOUzPoJSN0zsGmEvGln4LuDaYLfMx6yKKmhoX6q8tyjQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ppy2w7vNAuw2VY6fJbff6hNKN6cMJbbagQoEJrJrIw=;
 b=frlNKKi0UIu9JFYks+I+NtnitGBFBxMAwABl5h7pIvd6uuEni1Pn8jBRUG+PC/5gKnvuhPvGqRwED68w7Zo3042/tJQvDaeioxRGZBfeDGuUgnaKXh7vcl4321paSN2HhBTTSZ4jtebRMS3RQvJeZ30Eh+NelJsN5OfE+P2+G6OzvlhylKsIMxdakDmK9gjSVM9erdxzdAZn+6/AhR/klJl+TpxkKVmWBGvjO/hKbgQ2O3pht4Sf7fy96OJ22c8Iurx9cegecsZPilklazBX8+LzH1/R8vQ4KeYXnioou016xzY1TjpOKFIOQBFluRaik/PIWRmwX3nHHnuTpHZbig==
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB2935.namprd12.prod.outlook.com (2603:10b6:a03:131::12)
 by BY5PR12MB4872.namprd12.prod.outlook.com (2603:10b6:a03:1c4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Tue, 9 Nov
 2021 00:18:24 +0000
Received: from BYAPR12MB2935.namprd12.prod.outlook.com
 ([fe80::6cff:d2f5:6cd:c892]) by BYAPR12MB2935.namprd12.prod.outlook.com
 ([fe80::6cff:d2f5:6cd:c892%4]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 00:18:24 +0000
Subject: Re: [PATCH] doc: gpu: Add document describing buffer exchange
To: Simon Ser <contact@emersion.fr>, Daniel Stone <daniels@collabora.com>
References: <20210905122742.86029-1-daniels@collabora.com>
 <AqG6tXWB4u3qhQs6QV8AkOhbOhpAsenbzEKPlyG4IRBDtqevEHfx61dGX80b1U49N-nnoovcWzW1smGRlK6OhRrFkonCSFMalVxbhgdoNuE=@emersion.fr>
From: James Jones <jajones@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <f27654e4-3abb-3950-1629-c32b881332ed@nvidia.com>
Date: Mon, 8 Nov 2021 16:18:22 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <AqG6tXWB4u3qhQs6QV8AkOhbOhpAsenbzEKPlyG4IRBDtqevEHfx61dGX80b1U49N-nnoovcWzW1smGRlK6OhRrFkonCSFMalVxbhgdoNuE=@emersion.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR08CA0031.namprd08.prod.outlook.com
 (2603:10b6:a03:100::44) To BYAPR12MB2935.namprd12.prod.outlook.com
 (2603:10b6:a03:131::12)
MIME-Version: 1.0
Received: from [10.112.245.179] (216.228.112.22) by
 BYAPR08CA0031.namprd08.prod.outlook.com (2603:10b6:a03:100::44) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Tue, 9 Nov 2021 00:18:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70a578f6-b18f-48b0-b5aa-08d9a3167187
X-MS-TrafficTypeDiagnostic: BY5PR12MB4872:
X-Microsoft-Antispam-PRVS: <BY5PR12MB487234EA7FD686966CFD9063DE929@BY5PR12MB4872.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G/JTwYis8ycV4g5nxznoEpc3tAe5e2fv84nWPMk0Mx/5pHQbwbzbmSbhbUqP1/VAdn/2jeJGZcte7NTZ1P31mZKLvItiqz9jsG2o0AdVbyIdQNOqpmMPgRCMy4WW4bVtwpafgqetope6LcVCDL9OkFWiPexeE3COYhf+tk1G7tdSjkTrh2JiCTQJqEiJ6Yie+gFbTXsMl/Tr+AXv3qfo8tmmO8hbvFD+zzH5dzdewYK79sNKL/XJs6rscwhQdIKNoc3U5sBMBwmMxfnNcfAOQBbr4rHlgy+rLdf/mNSdWGvQWABkkZrYDOyn/7xwtFIyDe+09jBz0hS4zZQAZQsQSWfdpl8/h34p43Kd/uvpRlmjFofmQkxOwkTFXFlKAvk7P2qcuePwe2kg4AwvJ8cwnGCbTRzVpf2NUokrOE+OtrDWZ1W75EUHuboCQc/pqUS3/0mwc84cuQsucKJlG744caAIWm1/0hEQJjgt1YEjI3NcQe9DQ4XlCTD2itNnXe0bRugQdHDhj1RYRBiUKShBfDWBwZQP+P1brfw9yY2OO2tk+VC4yNP+YicTf6D39Lp5izg03hLoq7CLcDi4BJ67I7vxusuGoGvw7/GnOCHviG8FAhqsU0H2jm/JJWvE5hkjrShITJ+qoFr6Ads4Fq+OLF/iE2JjbHpe9xB8wO/zdo00nuNrawx4bmocL+jlyyoRr0yZeWODZMA6pfKOTHCuWjKg3KLUJcsrgzmilNTY93A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB2935.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(83380400001)(66946007)(36756003)(110136005)(186003)(6486002)(966005)(26005)(31686004)(30864003)(66556008)(66476007)(2906002)(2616005)(8676002)(8936002)(956004)(5660300002)(4326008)(31696002)(86362001)(38100700002)(508600001)(16576012)(316002)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eENnOStPT0YwdEh0VHZtU3hkdU4wN24wd0toOUxqM0JVYmJkL0N3NHp2N2VI?=
 =?utf-8?B?Qm5hSlZ4anVXKzhDTkdETzY5MWhVbHdIcXJQUlZzUEhNakg0L3V5WXJIMVhx?=
 =?utf-8?B?T28wTWF0M2FiWE9oWTczZTBOMFUxbzNRMVU5SFZBeDVadnhvUUpxSVFJcDY1?=
 =?utf-8?B?c0grVUhCVUtIYi9pSGhIKzNPc3FVd3ByR1dRZ2Ric25vVytJL2Zqc0ZlemlB?=
 =?utf-8?B?WHRlWlh6T3M2VWNyT2M5V3NxbFVYV1docGFpeWw5NlBlSE92Y1IvVzU4TDZ2?=
 =?utf-8?B?eGhCMGtDS2VNRldjR1czVnQ0R2Y4aVFuVDFIbXI5bFhENnhONXZwNHVxVjNW?=
 =?utf-8?B?b1JGSVdiZ1NYaVBON2R4eEZHUFd6MFNoTHNtYzZacTlyY0MzV0dwVDBJN3Jt?=
 =?utf-8?B?QkxWSnplYWt1bGxNSk1sVGpXTC9NaEpNOWxOSHNjMVdFWlM2ZFBXTFB5K3dS?=
 =?utf-8?B?RGl6Tk8xcWlJcjIrUE9ERnFOUVRZTmNWTS9US0JIL0xDQWRPanVBVjk2czhu?=
 =?utf-8?B?NWZRRkg4YzltenZ3WDFRdnFVczF1SEtsWStHbmEvc0dIM0ZGbnNtUHNSZVhr?=
 =?utf-8?B?OGxVdTlYdmowVVNFSlhMWFRzbzJ0aWgvNVZzZ2FuNmxPTFZ2eDc1aUpocHp5?=
 =?utf-8?B?TmhiUWdhdFhEWHdjZENXSVBrNnk0VFBzQUZiQkNWTVdmTkRQQVR0Wm5pbWxy?=
 =?utf-8?B?RHNhZHF6NEU3bzE0U1lFMExFdFM0WERlNFlPaFd2N21TemFuSkpqMlRTN1lw?=
 =?utf-8?B?ZmR2Y0VKQW9jUjB6SjI3UTdRY1dtRE9QT012TlF5NnVtZnJ6TFpCbmoxbHQz?=
 =?utf-8?B?ZHYyUjYzOTZ1MUI2MG9VUDZoTEpaMlJuVmc0cEZRRVFEZUFhdUFCZU0vY0lT?=
 =?utf-8?B?SmtKeFhlUGpvdWhjc2hmTUVQRzJ1SFFiWmZFc1E4V1drUEVRZlFCWEc0N2dr?=
 =?utf-8?B?eGdHVHBIRDVQeEl3U2ZRWm9ZalZDWkV2WS9LZTlJeERGVmE3NXZzTmRHT3lS?=
 =?utf-8?B?blhIeThXdlp0eHpDd3NZVGNla3NHTHlBdzdWL1V0NklhSXBxN3AzRkY5TVY0?=
 =?utf-8?B?azA0Y2trQzFoMTJBVDhpdmxCRG42ckVzMThadTZ1VzlaNEs2U29lb21sR3Bh?=
 =?utf-8?B?b2xqdGloZDBoVXV2bHNibVMvZDFKcXFwbWNRc1FxZGRGS2RrTVorVXpsT1JZ?=
 =?utf-8?B?QXc1Mm5MVEtSTHhIMmNJVmFncVg3UjllR1FQNnBoRW5DcUdLeEVvNi8wV1Zt?=
 =?utf-8?B?N0s2OFdvSnJpb2QvN3pXN2NUeCtUWTYrcWRPT21SRDBVcUFOY3JUTUVOSTU0?=
 =?utf-8?B?cnJLK0pJekE4ZE53NU12ZllETmVqVGsycjVHRFIxYTlTZ1U4cFdxOVVkb05U?=
 =?utf-8?B?WjdEcU9wbXc1Y00vdXZxdjkyOVlVbXFuNG1RT3JvVWp2aWtKanBFVHVycmZJ?=
 =?utf-8?B?WTFyWERLMk9WaE1ZVGUvaTkwZXdDTjB1WmYrWGFnSzdRajQ0dGJYTis0K3JU?=
 =?utf-8?B?Vml1RXQxaUtNM05IMXZoK2syYlhwaHByT0oyUnB5SUIwejA2QUMxMmYrQnc2?=
 =?utf-8?B?WThlSlB0ZWtPOGtDOERrMVdqTHh2dm1pYXBuSlRjRndNN3lkZmRsN2htK0cy?=
 =?utf-8?B?OEw1TmY2UEJGMjJ6K1NNN0NRU3k4S3E1VElXdi9YT2R1N1R0TDM2Y0JIbnJN?=
 =?utf-8?B?K0tVQXhxVXlKcnBHWkV5OE43RFN2UnB1V0xxaHh1VGF1R3plVllrSEJIN2Vv?=
 =?utf-8?B?d3RPeGFyeFYzNkd2aVV2K2JvTm16Mnc5Z0dqdU9EQ2xLRkl1bWxIQmRFZmJu?=
 =?utf-8?B?dXNNSlVJQ2svUDNtM3RBYkpyODdGa0ljOTFjMzR3a3JkT29KZmMwMFBxeDR4?=
 =?utf-8?B?bklzcjNwdWMxSElVZEdpVEw1NXMvejIzQ0ZkbzNyZVMvRm9OTmlOdk1jWFo5?=
 =?utf-8?B?MWkvVTQzRHVNUk85eFNqQTRJc1ZweWhKZm9xSUxuSytHTzFIZElZVWpmUEZK?=
 =?utf-8?B?anRhWC9iN2cyd2pjeTU4a0Z3ZGY3Q21LYmI3N0tIZEFVZWtUZTNrQUo0SHdi?=
 =?utf-8?B?OHJVajg1TExOTzJsK0c4T2RzSDdTTHNGZVNmUldNNnN3ZXB5UGVMZG9CU3dR?=
 =?utf-8?B?eWtTQUkySzA5U0VOdW1xOTV5V1dtRjFpbGU4eXlEVDJzYjMrVHJaZkkrb01M?=
 =?utf-8?Q?1Ni9tstv/OM43RzgZi0pqzM=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70a578f6-b18f-48b0-b5aa-08d9a3167187
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2935.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 00:18:24.1761 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y681Ddd7gL73jtkqUG3r+We1e5UavgPnaIcgej2ZVL+q1IrJEmlBoRnjh1C/GSmW1W2YVphEjafcZ8qcvs2TIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4872
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/6/21 5:28 AM, Simon Ser wrote:
>> Since there's a lot of confusion around this, document both the rules
>> and the best practice around negotiating, allocating, importing, and
>> using buffers when crossing context/process/device/subsystem boundaries.
>>
>> This ties up all of dmabuf, formats and modifiers, and their usage.
>>
>> Signed-off-by: Daniel Stone <daniels@collabora.com>
> 
> Thanks a lot for this write-up! This looks very good to me, a few comments
> below.

Agreed, it would be awesome if this were merged somewhere. IMHO, a lot 
of the non-trivial/typo suggestions below could be taken care of as 
follow-on patches, as the content here is better in than out, even if it 
could be clarified a bit.

Further feedback inline:

>> ---
>>
>> This is just a quick first draft, inspired by:
>>    https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/3197#note_1048637
>>
>> It's not complete or perfect, but I'm off to eat a roast then have a
>> nice walk in the sun, so figured it'd be better to dash it off rather
>> than let it rot on my hard drive.
>>
>>
>>   .../gpu/exchanging-pixel-buffers.rst          | 285 ++++++++++++++++++
>>   Documentation/gpu/index.rst                   |   1 +
>>   2 files changed, 286 insertions(+)
>>   create mode 100644 Documentation/gpu/exchanging-pixel-buffers.rst
>>
>> diff --git a/Documentation/gpu/exchanging-pixel-buffers.rst b/Documentation/gpu/exchanging-pixel-buffers.rst
>> new file mode 100644
>> index 000000000000..75c4de13d5c8
>> --- /dev/null
>> +++ b/Documentation/gpu/exchanging-pixel-buffers.rst
>> @@ -0,0 +1,285 @@
>> +.. Copyright 2021 Collabora Ltd.
>> +
>> +========================
>> +Exchanging pixel buffers
>> +========================
>> +
>> +As originally designed, the Linux graphics subsystem had extremely limited
>> +support for sharing pixel-buffer allocations between processes, devices, and
>> +subsystems. Modern systems require extensive integration between all three
>> +classes; this document details how applications and kernel subsystems should
>> +approach this sharing for two-dimensional image data.
>> +
>> +It is written with reference to the DRM subsystem for GPU and display devices,
>> +V4L2 for media devices, and also to Vulkan, EGL and Wayland, for userspace
>> +support, however any other subsystems should also follow this design and advice.
>> +
>> +
>> +Formats and modifiers
>> +=====================
>> +
>> +Each buffer must have an underlying format. This format describes the data which
>> +can be stored and loaded for each pixel. Although each subsystem has its own
>> +format descriptions (e.g. V4L2 and fbdev), the `DRM_FORMAT_*` tokens should be
> 
> RST uses double backticks for inline code blocks (applies to the whole document).
> 
>> +reused wherever possible, as they are the standard descriptions used for
>> +interchange.
> 
> Maybe mention that the canonical source of formats and modifiers can be found
> in include/uapi/drm/drm_fourcc.h.
> 
>> +Each `DRM_FORMAT_*` token describes the per-pixel data available, in terms of
>> +the translation between one or more pixels in memory, and the color data
>> +contained within that memory. The number and type of color channels are
> 
> Pekka uses the term "color value", which I find a bit better than repeating
> "data".
> 
>> +described: whether they are RGB or YUV, integer or floating-point, the size
>> +of each channel and their locations within the pixel memory, and the
>> +relationship between color planes.
>> +
>> +For example, `DRM_FORMAT_ARGB8888` describes a format in which each pixel has a
>> +single 32-bit value in memory. Alpha, red, green, and blue, color channels are
>> +available at 8-byte precision per channel, ordered respectively from most to
>> +least significant bits in little-endian storage. As a more complex example,
>> +`DRM_FORMAT_NV12` describes a format in which luma and chroma YUV samples are
>> +stored in separate memory planes, where the chroma plane is stored at half the
>> +resolution in both dimensions (i.e. one U/V chroma sample is stored for each 2x2
>> +pixel grouping).
>> +
>> +Format modifiers describe a translation mechanism between these per-pixel memory
>> +samples, and the actual memory storage for the buffer. The most straightforward
>> +modifier is `DRM_FORMAT_MOD_LINEAR`, describing a scheme in which each pixel has
>> +contiguous storage beginning at (0,0); each pixel's location in memory will be
>> +`base + (y * stride) + (x * bpp)`. This is considered the baseline interchange
>> +format, and most convenient for CPU access.
> 
> Hm, maybe in more simple terms we could explain that the pixels are stored
> sequentially row-by-row from the top-left corner to the bottom-right one?

I wouldn't mention top-left. I'm not clear DRM_FORMAT_MOD_LINEAR 
excludes GL-style bottom-left-oriented images.

> Maybe we can drop the "base" from the formula and say that each pixel's
> location in memory will be at offset `y * stride + x * bpp`? Or maybe this is
> confusing with offset being mentioned below as an additional parameter?
> 
>> +Modern hardware employs much more sophisticated access mechanisms, typically
>> +making use of tiled access and possibly also compression. For example, the
>> +`DRM_FORMAT_MOD_VIVANTE_TILED` modifier describes memory storage where pixels
>> +are stored in 4x4 blocks arranged in row-major ordering, i.e. the first tile in
>> +memory stores pixels (0,0) to (3,3) inclusive, and the second tile in memory
>> +stores pixels (4,0) to (7,3) inclusive.
>> +
>> +Some modifiers may modify the number of memory buffers required to store the
> 
> Hm. I think that mentioning a "memory buffer" here is a bit confusing. It seems
> like this document is about exchanging "pixel buffers", each being composed of
> one or more "memory buffers". Maybe we can use "image" instead of "buffer" for
> the higher-concept of "bunch of pixel values which can be displayed on screen"?
> That would align with user-space APIs like Vulkan and EGL.
> 
>> +data; for example, the `I915_FORMAT_MOD_Y_TILED_CCS` modifier adds a second
>> +memory buffer to RGB formats in which it stores data about the status of every
>> +tile, notably including whether the tile is fully populated with pixel data, or
>> +can be expanded from a single solid color.
> 
> Is it a requirement that these two memory planes must be separate memory buffers
> for I915_FORMAT_MOD_Y_TILED_CCS?

I think a few decisions need to be made here:

- Can the general statement be made that separate memory planes (term 
used above) can always be either separate allocations or offsets within 
one or more allocations?

- Can this auxiliary, modifier-specific data always be used with the 
same semantics as an image plane?

If the answer to both is yes, I think the best way to describe 
modifier-specific planes would just be to generalize the memory plane 
language above and note "some modifiers introduce additional planes," 
rather than trying to describe auxiliary data as a separate concept. 
Then, the whole discussion about plane offsets in the dimension and size 
section below will clearly apply to auxiliary planes as well.

>> +These extended layouts are highly vendor-specific, and even specific to
>> +particular generations or configurations of devices per-vendor. For this reason,
>> +support of modifiers must be explicitly enumerated and negotiated by all users
>> +in order to ensure a compatible and optimal pipeline, as discussed below.
>> +
>> +
>> +Dimensions and size
>> +===================
>> +
>> +Each pixel buffer must be accompanied by logical pixel dimensions. This refers
>> +to the number of unique samples which can be extracted from, or stored to, the
>> +underlying memory storage. For example, even though a 1920x1080
>> +`DRM_FORMAT_NV12` buffer has a luma plane containing 1920x1080 samples for the Y
>> +component, and 960x540 samples for the U and V components, the overall buffer is
>> +still described as having dimensions of 1920x1080.
>> +
>> +The in-memory storage of a buffer is not guaranteed to begin immediately at the
>> +base address of the underlying memory, nor is it guaranteed that the memory
>> +storage is tightly clipped to either dimension.
>> +
>> +Each plane must therefore be described with an `offset` in bytes, which will be
>> +added to the base address of the memory storage before performing any per-pixel
>> +calculations. This may be used to combine multiple planes into a single pixel
>> +buffer; for example, `DRM_FORMAT_NV12` may be stored in a single memory buffer
>> +where the luma plane's storage begins immediately at the start of the buffer
>> +with an offset of 0, and the chroma plane's storage begins after the offset of
>> +the luma plane as expressed through its offset.
> 
> "and the chroma plane's storage follows, with its offset set to the size of the
> preceding luma plane"
> 
> is maybe a bit clearer?
> 
>> +Each plane must also have a `stride` in bytes, expressing the offset in memory
>> +between two contiguous scanlines. For example, a `DRM_FORMAT_MOD_LINEAR` buffer
> 
> Is "scanline" a better word than "row"? I personally find "row" a bit more
> descriptive, but maybe "scanline" is technically more accurate.

scanline is a scanout-specific term IMHO.  I agree "row" is more natural 
for a generalized discussion.

>> +with dimensions of 1000x1000 may have been allocated as if it were 1024x1000, in
>> +order to allow for aligned access patterns. In this case, the buffer will still
>> +be described with a width of 1000, however the stride will be `1024 * bpp`,
>> +indicating that there are 24 pixels at the positive extreme of the x axis whose
>> +values are not significant.
>> +
>> +Buffers may also be padded further in the y dimension, simply by allocating a
>> +larger area than would ordinarily be required. For example, many media decoders
>> +are not able to natively output buffers of height 1080, but instead require an
>> +effective height of 1088 pixels. In this case, the buffer continues to be
>> +described as having a height of 1080, with the memory allocation for each buffer
>> +being increased to account for the extra padding.
>> +
>> +
>> +Enumeration
>> +===========
>> +
>> +Every user of pixel buffers must be able to enumerate a set of supported formats
>> +and modifiers, described together. Within KMS, this is achieved with the
>> +`IN_FORMATS` property on each DRM plane, listing the supported DRM formats, and
>> +the modifiers supported for each format. In userspace, this is supported through
>> +the `EGL_EXT_image_dma_buf_import_modifiers` extension entrypoints for EGL, the
>> +`VK_EXT_image_drm_format_modifier` extension for Vulkan, and the
>> +`zwp_linux_dmabuf_v1` extension for Wayland.
>> +
>> +Each of these interfaces allows users to query a set of supported
>> +format+modifier combinations.
>> +
>> +Negotiation
>> +===========
>> +
>> +It is the responsibility of userspace to negotiate an acceptable format+modifier
>> +combination for its usage. This is performed through a simple intersection of
>> +lists. For example, if a user wants to use Vulkan to render an image to be
>> +displayed on a KMS plane, it must:
>> +  - query KMS for the `IN_FORMATS` property for the given plane
>> +  - query Vulkan for the supported formats for its physical device
> 
> … with the right VkImageUsageFlagBits and VkImageCreateFlagBits set? (Just to
> make it clear the lists really depend on usage.)

Agreed. Very subtle and very easy to mess this up given the structure of 
the Vulkan API, so worth pointing out explicitly.

>> +  - intersect these formats to determine the most appropriate one
>> +  - for this format, intersect the lists of supported modifiers for both KMS and
>> +    Vulkan, to obtain a final list of acceptable modifiers for that format
>> +
>> +This intersection must be performed for all usages. For example, if the user
>> +also wishes to encode the image to a video stream, it must query the media API
>> +it intends to use for encoding for the set of modifiers it supports, and
>> +additionally intersect against this list.
>> +
>> +If the intersection of all lists is an empty list, it is not possible to share
>> +buffers in this way, and an alternate strategy must be considered (e.g. using
>> +CPU access routines to copy data between the different uses, with the
>> +corresponding performance cost).
>> +
>> +The resulting modifier list is unsorted; the order is not significant.

I think it's also worth pointing out that because the list is unsorted, 
selection of a final modifier from the resulting list is best left to 
drivers, which may have more information available than the modifier 
list represents on its own. E.g., don't pass in (&modifiers[0], 1), pass 
in (modifiers, <count>) and let the allocator pick its favorite for the 
specified local usage. This is especially true of APIs like Vulkan that 
allow you to specify the local usage in great detail.

>> +
>> +Allocation
>> +==========
>> +
>> +Once userspace has determined an appropriate format, and corresponding list of
>> +acceptable modifiers, it must allocate the buffer. As there is no universal
>> +buffer-allocation interface available at either kernel or userspace level, the
>> +client makes an arbitrary choice of allocation interface such as Vulkan, GBM, or
>> +a media API.

Extending the thought above, once some sort of constraints API is worked 
out, the advice should probably be to allocate using the API with the 
most expressive usage whenever possible, but it's premature to recommend 
that right now.

>> +
>> +Each allocation request must take, at a minimum: the pixel format, a list of
>> +acceptable modifiers, and the buffer's width and height. Each API may extend
>> +this set of properties in different ways, such as allowing allocation in more
>> +than two dimensions, intended usage patterns, etc.
>> +
>> +The component which allocates the buffer will make an arbitrary choice of what
>> +it considers the 'best' modifier within the acceptable list for the requested
>> +allocation, any padding required, and further properties of the underlying
>> +memory buffers such as whether they are stored in system or device-specific
>> +memory, whether or not they are physically contiguous, and their cache mode.
>> +These properties of the memory buffer are not visible to userspace, however the
>> +`dma-heaps` API is an effort to address this.
>> +
>> +After allocation, the client must query the allocator to determine the actual
>> +modifier selected for the buffer, as well as the per-plane offset and stride.
>> +Allocators are not permitted to vary the format in use, to select a modifier not
>> +provided within the acceptable list, nor to vary the pixel dimensions other than
>> +the padding expressed through offset, stride, and size.
>> +
>> +
>> +Import
>> +======
>> +
>> +To use a buffer within a different context, device, or subsystem, the user
>> +passes these parameters (format, modifier, width, height, and per-plane offset
>> +and stride) to an importing API.
>> +
>> +Each memory plane is referred to by a buffer handle, which may be unique or
>> +duplicated within a buffer. For example, a `DRM_FORMAT_NV12` buffer may have the
>> +luma and chroma buffers combined into a single memory buffer by use of the
>> +per-plane offset parameters, or they may be completely separate allocations in
>> +memory. For this reason, each import and allocation API must provide a separate
>> +handle for each plane.
> 
> Vulkan doesn't quite do this, by default it only allows one memory buffer per
> pixel buffer, and requires the driver to implement an additional extension when
> the image is "disjoint". Later on, should we mention the inode as a way to
> figure out whether all DMA-BUFs refer to the same memory buffer? Or maybe it's
> better to mention that in the Vulkan docs…

Examining inodes doesn't seem like a Vulkan-specific concept. However, 
it doesn't seem specific to format modifiers either. Should that be 
mentioned in the dmabuf docs?

>> +Each kernel subsystem has its own types and interfaces for buffer management.
>> +DRM uses GEM buffer objects (BOs), V4L2 has its own references, etc. These types
>> +are not portable between contexts, processes, devices, or subsystems.
>> +
>> +To address this, `dma-buf` handles are used as the universal interchange for
>> +buffers. Subsystem-specific operations are used to export native buffer handles
>> +to a `dma-buf` file descriptor, and to import those file descriptors into a
>> +native buffer handle. dma-buf file descriptors can be transferred between
>> +contexts, processes, devices, and subsystems.
>> +
>> +For example, a Wayland media player may use V4L2 to decode a video frame into
>> +a `DRM_FORMAT_NV12` buffer. This will result in two memory planes (luma and
>> +chroma) being dequeued by the user from V4L2. These planes are then exported to
>> +one dma-buf file descriptor per plane, these descriptors are then sent along
>> +with the metadata (format, modifier, width, height, per-plane offset and stride)
>> +to the Wayland server. The Wayland server will then import these file
>> +descriptors as an EGLImage for use through EGL/OpenGL (ES), a VkImage for use
>> +through Vulkan, or a `drm_fb` for use through KMS; each of these import
>> +operations will take the same metadata and convert the dma-buf file descriptors
>> +into their native buffer handles.
> 
> It would be nice to mention that even if the intersected modifier list wasn't
> empty, the import can fail if the buffer doesn't have the right constraints for
> the intended usage (e.g. bad alignment).

Agreed. In general, is there any guarantee that device A can import an 
arbitrary dma-buf FD? It seems to me it can fail for various reasons, 
and in addition, mapping it to some specific usage on that device during 
the import itself or some subsequent operation can also fail for the 
reasons mentioned above.

>> +
>> +Implicit modifiers
>> +==================
>> +
>> +The concept of modifiers post-dates all of the subsystems mentioned above. As
>> +such, it has been retrofitted into all of these APIs, and in order to ensure
>> +backwards compatibility, support is needed for drivers and userspace which do
>> +not (yet) support modifiers.
>> +
>> +As an example, GBM is used to allocate buffers to be shared between EGL for
>> +rendering and KMS for display. It has two entrypoints for allocating buffers:
>> +`gbm_bo_create` which only takes the format, width, height, and a usage token,
>> +and `gbm_bo_create_with_modifiers` which extends this with a list of modifiers.
>> +
>> +In the latter case, the allocation is as discussed above, being provided with a
>> +list of acceptable modifiers that the implementation can choose from (or fail if
>> +it is not possible to allocate within those constraints). In the former case
>> +where modifiers are not provided, the GBM implementation must make its own
>> +choice as to what is likely to be the 'best' layout. Such a choice is entirely
>> +implementation-specific: some will internally use tiled layouts which are not
>> +CPU-accessible if the implementation decides that is a good idea through
>> +whatever heuristic. It is the implementation's responsibility to ensure that
>> +this choice is appropriate.
>> +
>> +To support this case where the layout is not known because there is no awareness
>> +of modifiers, a special `DRM_FORMAT_MOD_INVALID` token has been defined. This
>> +pseudo-modifier declares that the layout is not known, and that the driver
>> +should use its own logic to determine what the underlying layout may be.
> 
> Just to drive the point home, maybe mention explicitly that INVALID != LINEAR?

Agreed. Obvious to grey beards, easy error when first approaching these 
concepts.

>> +There are four cases where this token may be used:
>> +  - during enumeration, an interface may return `DRM_FORMAT_MOD_INVALID`, either
>> +    as the sole member of a modifier list to declare that explicit modifiers are
>> +    not supported, or as part of a larger list to declare that implicit modifiers
>> +    may be used
>> +  - during allocation, a user may supply `DRM_FORMAT_MOD_INVALID`, either as the
>> +    sole member of a modifier list (equivalent to not supplying a modifier list
>> +    at all) to declare that explicit modifiers are not supported and must not be
>> +    used, or as part of a larger list to declare that an allocation using implicit
>> +    modifiers is acceptable
>> +  - in a post-allocation query, an implementation may return
>> +    `DRM_FORMAT_MOD_INVALID` as the modifier of the allocated buffer to declare
>> +    that the underlying layout is implementation-defined and that an explicit
>> +    modifier description is not available; per the above rules, this may only be
>> +    returned when the user has included `DRM_FORMAT_MOD_INVALID` as part of the
>> +    list of acceptable modifiers, or not provided a list
>> +  - when importing a buffer, the user may supply `DRM_FORMAT_MOD_INVALID` as the
>> +    buffer modifier (or not supply a modifier) to indicate that the modifier is
>> +    unknown for whatever reason; this is only acceptable when the buffer has
>> +    not been allocated with an explicit modifier
> 
> These are good rules, but only Wayland uses them. For instance GBM will ignore
> INVALID in modifier lists, and iirc KMS will error out if INVALID is supplied
> at import time?

While I've observed a few other exceptions myself, this is unfortunate, 
as inconsistency here is what prompted this work in the first place. 
Would it be possible to work towards making these rules universal, or is 
the current behavior too ingrained in the ABIs/protocols/etc.?

>> +It follows from this that a buffer chain must be either fully implicit or fully
>> +explicit. For example, if a user wishes to allocate a buffer for use between
>> +GPU, display, and media, but the media API does not support modifiers, then the
>> +user **must not** allocate the buffer with explicit modifiers and attempt to
>> +import the buffer into the media API with no modifier, but either perform the
>> +allocation using implicit modifiers, or allocate the buffer for media use
>> +separately and copy between the two buffers.
>> +
>> +As one exception to the above, allocations may be 'upgraded' from implicit
>> +to explicit modifiers. For example, if the buffer is allocated with
>> +`gbm_bo_create` (taking no modifiers), the user may then query the modifier with
>> +`gbm_bo_get_modifier` and then use this modifier as an explicit modifier token
>> +if a valid modifier is returned.
> 
> Hm, I wonder if there's a good use-case for this upgrade? I feel like things
> would be simpler without the exception.

IIRC, the Tegra Mesa driver relied on this "upgrade" to allocate buffers 
from the non-modifier-aware nouveau gallium driver it layers on top of 
and map them into the modifier-aware tegra-drm driver later, as there 
was no way to share implicit layout information between the nouveau and 
tegra-drm drivers in the kernel. However, I think trying to perform the 
same "upgrade" in the modesetting X driver caused issues with my nouveau 
format modifier patches for reasons I don't recall at the moment.

>> +When allocating buffers for exchange between different users and modifiers are
>> +not available, implementations are strongly encouraged to use
>> +`DRM_FORMAT_MOD_LINEAR` for their allocation, as this is the universal baseline
>> +for exchange.
> 
> Maybe spell out that "users" may mean different APIs or different devices.
> Sharing a pixel buffer between two separate devices via GBM will only work
> if USE_LINEAR is provided.

Yes, I always try to differentiate between actual users (people) and 
applications/components/libraries/etc. (code).

>> +Any new users - userspace programs and protocols, kernel subsystems, etc -
>> +wishing to exchange buffers must offer interoperability through dma-buf file
>> +descriptors for memory planes, DRM format tokens to describe the format, DRM
>> +format modifiers to describe the layout in memory, at least width and height for
>> +dimensions, and at least offset and stride for each memory plane.
>> diff --git a/Documentation/gpu/index.rst b/Documentation/gpu/index.rst
>> index b9c1214d8f23..cb12f2654ed7 100644
>> --- a/Documentation/gpu/index.rst
>> +++ b/Documentation/gpu/index.rst
>> @@ -10,6 +10,7 @@ Linux GPU Driver Developer's Guide
>>      drm-kms
>>      drm-kms-helpers
>>      drm-uapi
>> +   exchanging-pixel-buffers
>>      driver-uapi
>>      drm-client
>>      drivers
>> --
>> 2.31.1

Thanks again for writing this all up.

-James
