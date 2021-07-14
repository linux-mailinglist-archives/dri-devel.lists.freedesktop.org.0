Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 604983C8875
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 18:14:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BEC189EFF;
	Wed, 14 Jul 2021 16:14:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2063.outbound.protection.outlook.com [40.107.237.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CDF06E3FE
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 16:14:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iyoHi1dBUKRVidp152BY+dtCXefs6Z1uqJXMxnSErYFTcPhSkKz20c1FFPoF/gLBH7CQG7umWCQ+77Mq8J6S+7KG8f8NYaq3uHDTjmJtqQ6jLPeGLGYUzSmar0tY7U+R2ZEVl59Bv4ys0aCpnFJqsJMRRTPQ23hC8JQdJsh2DiM1fpsziyxhljEIpesw3lwbKpES5u7EAmTxcZUJTq5ezEeEW17CniyliKS6ue4UhJZkp0QfKgNvPaOhP57+laNdUOCmXlfhafOGXHe9qd7iY6Qq7FKT1bOityux96sq2y5i3WlbYyzhRur66IIuLLqtGsMNwmA8xYpsVJc5rEwI5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mPOHyZdA23k0NXcTxNH/eI9cZWmY42Ga568h7yna1EA=;
 b=F+if+qmWseLttjHaCcjpj+tZIqMOpzgx3CVWW0JvqQxJKkIYkyZYOahHMzO0O4d9uFHM7JU2g4c2+piL3hbHELl5aqQ1hhlb1edF+4xxHQx3gXHMvONt8ahgwvbfUWaDmXdstOYlWP0asVwGqc2fWjvONQ2oOEYDhDTe0R54seGsQSL//bB+AWmwoDh0KYHNA686vVcPcjAFFFUICwHO3DZ9+4vyVcX6F2z3baQ8ejVAQQxgvjvYL0mss4eD2Woi/kPMV2w8G9MF7PNNli3p6BiP81iun1ooXKzJlW+Z067GIrQ9Pgcey8sdrfSRTyfEeqjB4FsComZ3dZZOnH/42w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mPOHyZdA23k0NXcTxNH/eI9cZWmY42Ga568h7yna1EA=;
 b=Cz7N9q4tg1SnuJYk2jl/jOmv+BlikL32TWrR4r5NFP1dsLbukG2SIuogjnVfg8BJjfVRl76dVFVnmqZrU2898F6al1eIVw9Bx6fOQRnF48DF6bdQwR0wFr5W+X9FHpqwZJO2R0Am8lh14CkIz2boSLIyxhWUL1iicFlSj5YgxCI=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5459.namprd12.prod.outlook.com (2603:10b6:303:13b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Wed, 14 Jul
 2021 16:14:03 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::39db:7a51:9e0d:9b19]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::39db:7a51:9e0d:9b19%4]) with mapi id 15.20.4308.027; Wed, 14 Jul 2021
 16:14:03 +0000
Subject: Re: [PATCH 1/2] drm: add crtc background color property
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20210707084557.22443-1-raphael.gallais-pou@foss.st.com>
 <20210707084557.22443-2-raphael.gallais-pou@foss.st.com>
 <20210709110459.79ca406a@eldfell>
 <3c8331cf-fded-b6e6-3e25-666634f4b87a@foss.st.com>
 <20210712110310.540df27d@eldfell>
 <f8e7db99-a4e4-c4d7-5d6a-67950184701c@amd.com>
 <20210713105214.5730c959@eldfell>
 <70c8467c-560d-517d-63a0-97763803b06d@amd.com>
 <20210714103518.578e70aa@eldfell>
From: Harry Wentland <harry.wentland@amd.com>
Message-ID: <7682e4c6-a040-a2b6-915d-b99ad3ddd53e@amd.com>
Date: Wed, 14 Jul 2021 12:13:58 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210714103518.578e70aa@eldfell>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQXPR0101CA0026.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:15::39) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.50.3] (198.200.67.154) by
 YQXPR0101CA0026.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00:15::39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22 via Frontend
 Transport; Wed, 14 Jul 2021 16:14:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aeb0cf71-843f-492e-2e57-08d946e265a7
X-MS-TrafficTypeDiagnostic: CO6PR12MB5459:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR12MB5459BF89EF93210E651A9AB58C139@CO6PR12MB5459.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E1REDMt1/hbkv0JyDoZVAqy6OmlGErr6zGcinC+A+BxmZGhp8RFdPDNi1dlniBRJxvkqy4jsSGYog7I2gi3LGXyle8AQUoL/DIACcOx42aqG+qZ14Gq8NKe4Occ6XiE8xmJPG99bQn56Y8s/6fmt+8vcpfPN9moH5u04xWljRJKsp1ZW6cpccb2rkrwNTQ7d7ppmQn+2XLS6ZU9ez+6q0P/NCulWuMaLWj1eRTB5qjPcTdV/RCvlgvANjO4Bkbya63bgM/hwR4rvQxu9jknRwXGvJAnjE7/8smC6bXz+BZ8wUpQu5iTJRe1qYBm7xUNtYV1Y51FQRfkp0KyF+LWywBzarE563DCdfBA5hJB4t37Qi73lxwNc4kvGMT8x+SYWdXPMz0xbcV/PgNbDPhEh+Etu3dzQKoUC3bbQAyqOJ5Ldd1PjHbjkSoSpCw9QCh3nXBc+2ZOzPhC18iziKU0zo1QE/e+lC/2Lu6nDpYRvIpaj0EgaiWQWFBjU6kO/vTMIjwLxmQSsUugHN3uiGVgeLc11yXa1PgnvgxmUXAoV/rLjmFQiAlJ1Gd4oY7F9UBVF0hYlRRuR4txKGggGbDzephERQzoac5Hv/M2uyWrRyd4kJDAWcEw2/54UeK047ZT9l8DkX59zaneaNvQWk7ZeUrAOUF+wvjGPNgILipOwUuAzg5S+x+06Oka51TQ3LSgPnd/z83cld292xqBkG33tJhBlxLioRQiR4BN+fAttLTPcR+GF4i60neKQv+inwRDz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(136003)(376002)(366004)(346002)(186003)(44832011)(2906002)(6666004)(316002)(86362001)(8936002)(36756003)(54906003)(38100700002)(2616005)(66476007)(66946007)(6916009)(66556008)(956004)(8676002)(53546011)(6486002)(26005)(478600001)(4326008)(83380400001)(16576012)(5660300002)(31696002)(7416002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?Y9MMqLNILmMOZ8B5kaqpLuZy2a/Fdjdzx9I21SJIUNt2MEBIyjLnGcCa?=
 =?Windows-1252?Q?SsE+wjW/+7J/irXjNG71fBYUJQody8SSjxUfhYYSGUgDP/VuqJX14sAs?=
 =?Windows-1252?Q?u3iMKbHaR5WoD5ObebLAAAe63HQ1hvuDtjUnF5pD8ndUKjci3Uwe+b85?=
 =?Windows-1252?Q?z5G/gVZauDI30L+gmv55jwH/XWYjhGrWlgF1P5JvSTxP0KJ9amSJZLc0?=
 =?Windows-1252?Q?i3ikQlth+MGjBgLWTLbQ3UbT08O5JJr1+y1+ggTszyXPqMahflueLWxg?=
 =?Windows-1252?Q?Mi7Gr6PnscIyupKIymI4SAIwtnORJt5FivrGV6SO33oSFMSF7vJ4hdwK?=
 =?Windows-1252?Q?N1yRwtAHJMQsKjjGQPoFU3x8eAjE0kRr8twIJQvf1BONs4KXeLe8GJQb?=
 =?Windows-1252?Q?a80cpjWV4pt9PC61rSTkkvHlYEF208OcpF+wBVfbYG3C4pC8Mia0XmtQ?=
 =?Windows-1252?Q?HpoKCfb5k2NKvp9A5FDBQtgUZr0tbULnP7kQMQm2GhfJ/BvEbDpK4Cs+?=
 =?Windows-1252?Q?09mFQOgoIE70QwcCTgyymnUGokEbGX6IzBLsCp4z3hjvcz0RfGeSvKJe?=
 =?Windows-1252?Q?ybn9yzJANxb9Xme95ZGmDM9K7LEipcWU8XdSHMiYZ2PUi/U/AcYhAeZ0?=
 =?Windows-1252?Q?3Kbza9vrVRa72WHkdcDF+EB6htPyBrvCcnFf2FK6clxumPc1rJuuxXkk?=
 =?Windows-1252?Q?aR3PDWKn8A8ifrLa46go3tq5+55oYXi0tyJidNmg57ZKzu2w9F0n7c6+?=
 =?Windows-1252?Q?V7PcUAYPvKsxl5XwY8nlbLjXtySwXukPvcHiZkSa0T8Y/f4UocSBbDzD?=
 =?Windows-1252?Q?dMVMTycKFLTgVNxnvZZGiUWAF0FxCfzQdne+A6UgX57PDd+AsZcGn0t2?=
 =?Windows-1252?Q?k7jwqS3ekVQw5TBT/uAB0+rmTk9K+EfliDcLyUqlO1KZlK8mr5sonpLI?=
 =?Windows-1252?Q?iDXn/CebriUY7JxDxoq8jmZyaRzn/mTD67HCJr8o00jAK8FEshmvPVI/?=
 =?Windows-1252?Q?CaLin+jWpxCpDS7kBaB1ARtfaDDMW00s1S5ykJ3l8abefQn7LZxXxohc?=
 =?Windows-1252?Q?N/zAddrCnDynVcH4U6NkahDmDPFKYs7XxQuxTBSTkKBlKOxv6ZsDbnNq?=
 =?Windows-1252?Q?HEeU60h2cr5Z4c7B7aHI1kj+3/69O+5fh5Q7qfkFXk//PO+9i1DJiRcE?=
 =?Windows-1252?Q?yKNiaHEaMeYNhABw3ivT+c+DgI/h0740uQpCzxVj5TNNLGU9jOb7QyZv?=
 =?Windows-1252?Q?jyqIs/ILbwgJgHGgWGrwxFO8ZiupDevxa419lE7rGYTNKx83RI/bPltw?=
 =?Windows-1252?Q?JBIgeywiGnlvGpqQcNZcU8e+rM0WeX9UDJr7vB69eqX1RSgksZZLS5du?=
 =?Windows-1252?Q?oygzVM6LF1vmPamZbOU8a0KjUgmkIxF1j8GyXhbk2NxuFT5Uhx0nbjqp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aeb0cf71-843f-492e-2e57-08d946e265a7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2021 16:14:03.5168 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SWzHu0NKyGq/675+LX99YoXrim3/xcbXGGFkvbPHxBEsDZHBVzuspfBGfWGeSEuJ6tHD6kHjo5IYdfQ6xQYqAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5459
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
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Raphael GALLAIS-POU <raphael.gallais-pou@st.com>,
 David Airlie <airlied@linux.ie>,
 Yannick FERTRE - foss <yannick.fertre@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Alexandre TORGUE - foss <alexandre.torgue@foss.st.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yannick FERTRE <yannick.fertre@st.com>,
 Sebastian Wick <sebastian@sebastianwick.net>,
 Philippe CORNU - foss <philippe.cornu@foss.st.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Philippe CORNU <philippe.cornu@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2021-07-14 3:35 a.m., Pekka Paalanen wrote:
> On Tue, 13 Jul 2021 09:54:35 -0400
> Harry Wentland <harry.wentland@amd.com> wrote:
> 
>> On 2021-07-13 3:52 a.m., Pekka Paalanen wrote:
>>> On Mon, 12 Jul 2021 12:15:59 -0400
>>> Harry Wentland <harry.wentland@amd.com> wrote:
>>>   
>>>> On 2021-07-12 4:03 a.m., Pekka Paalanen wrote:  
>>>>> On Fri, 9 Jul 2021 18:23:26 +0200
>>>>> Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com> wrote:
>>>>>     
>>>>>> On 7/9/21 10:04 AM, Pekka Paalanen wrote:    
>>>>>>> On Wed, 7 Jul 2021 08:48:47 +0000
>>>>>>> Raphael GALLAIS-POU - foss <raphael.gallais-pou@foss.st.com> wrote:
>>>>>>>      
>>>>>>>> Some display controllers can be programmed to present non-black colors
>>>>>>>> for pixels not covered by any plane (or pixels covered by the
>>>>>>>> transparent regions of higher planes).  Compositors that want a UI with
>>>>>>>> a solid color background can potentially save memory bandwidth by
>>>>>>>> setting the CRTC background property and using smaller planes to display
>>>>>>>> the rest of the content.
>>>>>>>>
>>>>>>>> To avoid confusion between different ways of encoding RGB data, we
>>>>>>>> define a standard 64-bit format that should be used for this property's
>>>>>>>> value.  Helper functions and macros are provided to generate and dissect
>>>>>>>> values in this standard format with varying component precision values.
>>>>>>>>
>>>>>>>> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
>>>>>>>> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>>>>>>>> ---
>>>>>>>>   drivers/gpu/drm/drm_atomic_state_helper.c |  1 +
>>>>>>>>   drivers/gpu/drm/drm_atomic_uapi.c         |  4 +++
>>>>>>>>   drivers/gpu/drm/drm_blend.c               | 34 +++++++++++++++++++++--
>>>>>>>>   drivers/gpu/drm/drm_mode_config.c         |  6 ++++
>>>>>>>>   include/drm/drm_blend.h                   |  1 +
>>>>>>>>   include/drm/drm_crtc.h                    | 12 ++++++++
>>>>>>>>   include/drm/drm_mode_config.h             |  5 ++++
>>>>>>>>   include/uapi/drm/drm_mode.h               | 28 +++++++++++++++++++
>>>>>>>>   8 files changed, 89 insertions(+), 2 deletions(-)  
>>>
>>> ...
>>>   
>>>>>>> The question about full vs. limited range seems unnecessary to me, as
>>>>>>> the background color will be used as-is in the blending stage, so
>>>>>>> userspace can just program the correct value that fits the pipeline it
>>>>>>> is setting up.
>>>>>>>
>>>>>>> One more question is, as HDR exists, could we need background colors
>>>>>>> with component values greater than 1.0?      
>>>>>>
>>>>>> AR4H color format should cover that case, isn't it ?    
>>>>>
>>>>> Yes, but with the inconvenience I mentioned.
>>>>>
>>>>> This is a genuine question though, would anyone actually need
>>>>> background color values > 1.0. I don't know of any case yet where it
>>>>> would be required. It would imply that plane blending happens in a
>>>>> color space where >1.0 values are meaningful. I'm not even sure if any
>>>>> hardware supporting that exists.
>>>>>
>>>>> Maybe it would be best to assume that only [0.0, 1.0] pixel value range
>>>>> is useful, and mention in the commit message that if someone really
>>>>> needs values outside of that, they should create another background
>>>>> color property. Then, you can pick a simple unsigned integer pixel
>>>>> format, too. (I didn't see any 16 bit-per-channel formats like that in
>>>>> drm_fourcc.h though.)
>>>>>     
>>>>
>>>> I don't think we should artificially limit this to [0.0, 1.0]. As you
>>>> mentioned above when talking about full vs limited, the userspace
>>>> understands what's the correct value that fits the pipeline. If that
>>>> pipeline is FP16 with > 1.0 values then it would make sense that the
>>>> background color can be > 1.0.  
>>>
>>> Ok. The standard FP32 format then for ease of use and guaranteed enough
>>> range and precision for far into the future?
>>>   
>>
>> I don't have a strong preference for FP16 vs FP32. My understanding is
>> that FP16 is enough to represent linearly encoded data in a way that
>> looks smooth to humans.
>>
>> scRGB uses FP16 with linear encoding in a range of [-0.5, 7.4999].
>>
>>> Or do you want to keep it in 64 bits total, so the UABI can pack
>>> everything into a u64 instead of needing to create a blob?
>>>
>>> I don't mind as long as it's clearly documented what it is and how it
>>> works, and it carries enough precision.
>>>
>>> But FP16 with its 10 bits of precision might be too little for integer
>>> 12-16 bpc pipelines and sinks?
> 
> The 10 bits worries me still.
> 
> If you have a pipeline that works in [0.0, 1.0] range only, then FP16
> limits precision to 10 bits (in the upper half of the range?).
> 
>>>
>>> If the values can go beyond [0.0, 1.0] range, then does the blending
>>> hardware and the degamma/ctm/gamma coming afterwards cope with them, or
>>> do they get clamped anyway?
>>>   
>>
>> That probably depends on the HW and how it's configured. AMD HW can handle
>> values above and below [0.0, 1.0].
> 
> Right, so how would userspace know what will happen?
> 
> Or do we need to specify that while values outside that unit range are
> expressable, it is hardware-specific on how they will behave, so
> generic userspace should not attempt to use values outside of the unit
> range?
> 
> I guess this caveat should be documented for everything, not just for
> background color? LUT inputs and outputs, CTM input and output ranges,
> FB formats...
> 

I'm not sure we should artificially limit the interface at this point, or
document hypotheticals. At this point I don't even know whether going beyond
[0.0, 1.0] would be a challenge for any HW that supports floating point
formats.

Harry

> 
> Thanks,
> pq
> 

