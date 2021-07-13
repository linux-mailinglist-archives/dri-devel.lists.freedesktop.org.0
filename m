Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E283C7182
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 15:54:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A32336E0A8;
	Tue, 13 Jul 2021 13:54:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2045.outbound.protection.outlook.com [40.107.237.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41A606E0A8
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 13:54:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hv2TkoG7e/Lx3cfmYMm1MXVinPtplXaFY6HnDhQSVFg11fyPeZbSL9oz96hdYu8ImsQd1PQzhsojZ1c4QpLu85fCKQwUu+zZJRsWA4sjn9nAAwq+K5NIXDNFWxswzefOrbYrGNb0cJab8VG+EwRt8KwuL3PxrHgTDUtI2mI/TAphBiM2A8UGDf8wTzitK5+fBWCqoU1TLuw/Lh8kwnIpTFY/r7jUerxHl/WIE8tSWjB8Ca9kMxYzwYpS1LkT1Afs7jTjrf6ofKQHQ38RYf17RXVcS5ogB7VaPOxQnOqMyyu3aA5rMv6+Vg5v6C3cjD552JflcX7xIaYTWF5jFq/hUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3wZa1VPqKaifwFYNPMpOCRt899tTwzsWr07mH8hg4ZI=;
 b=D5vGWfXNxzK9IqIBGbDLnVOqt2uuFFxwGUj/JtgJiOANbY77ofc3bLCxjWxJC5eYk8pAwQNaj5Rk+bJbDWvljkXUMIE4sq0gEuWGmb6Sz1imlxI77WTCrCa5LxQfO7pjLzw7qXu97/PeVeJ0Abpw263Qcv3XgnVgktRYDiW5MoApCQLEU6OOFanpFoWhBMZvT+DQc/Y0IaVxVbZCTOjexcTMCiuQQtpXYE8B+N/UYG/QEWO6aAKTqZuOyotA4fdrGt6YX4Kw15EYQDnvK/bdCVdTC7GXVb0leiVw1nw1k6NgbedMJFw9GzktKpeLIo5bGW0WEDKO7zJIiRkJFdvKeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3wZa1VPqKaifwFYNPMpOCRt899tTwzsWr07mH8hg4ZI=;
 b=KHwakaup0oCLBTvjxb8SDH/YzB6NPouEn3WTq+EmnH5ESLBsfkYVRVml3WLkNsNbEtB4MgjxM7OFBT4WDr/TX7KtYy81Ad4eSJVHmdPpjg0wDDWqqpYxJGwPHfGKnntCtEtAr7sn8EUJWmv7uCKd/iVfoJZaFTYVj0ZBnoy4gdA=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5425.namprd12.prod.outlook.com (2603:10b6:303:13e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Tue, 13 Jul
 2021 13:54:40 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::39db:7a51:9e0d:9b19]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::39db:7a51:9e0d:9b19%4]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 13:54:40 +0000
Subject: Re: [PATCH 1/2] drm: add crtc background color property
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20210707084557.22443-1-raphael.gallais-pou@foss.st.com>
 <20210707084557.22443-2-raphael.gallais-pou@foss.st.com>
 <20210709110459.79ca406a@eldfell>
 <3c8331cf-fded-b6e6-3e25-666634f4b87a@foss.st.com>
 <20210712110310.540df27d@eldfell>
 <f8e7db99-a4e4-c4d7-5d6a-67950184701c@amd.com>
 <20210713105214.5730c959@eldfell>
From: Harry Wentland <harry.wentland@amd.com>
Message-ID: <70c8467c-560d-517d-63a0-97763803b06d@amd.com>
Date: Tue, 13 Jul 2021 09:54:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210713105214.5730c959@eldfell>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQXPR01CA0098.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:41::27) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.50.3] (198.200.67.154) by
 YQXPR01CA0098.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00:41::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Tue, 13 Jul 2021 13:54:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae73a536-da75-45bb-4cbb-08d94605c289
X-MS-TrafficTypeDiagnostic: CO6PR12MB5425:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR12MB542509D533E128FB02DB38448C149@CO6PR12MB5425.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fw0a3uTXU3s8Rt3Bi0LKP7PSHh8aH4cl2GQxRPuLWjTr9AHy8pEzK96jBR+UzeT5SThNhl9D95ExW1wsvtj3CF5svg3yOpKLMwDsje0vSboKRepLD1Z5KyfhLeJuNqqJoD6nVha63jF/yWvQDyWDJH5Zyo0I5nc/C+kN4EEjYGtwNB5R7mqlFsg7Gjnzg9g8ofRaJPo6nzmHhbZk6nDAIGniq5G9YJzpe+RfpLEWJ7KCi+GtrYHJdoOMfE7iNSNIaGaRXAUP64hk7+mY0RtRI+kPedqdsYKVbINzbtEwMoB6T8WPLTpzEEb2ef7Pdmce8mnud4KJMkaNjEKSfz01sbGah4Rg7I0tpIEWhyeV33Q5pK82tpB7CM9ejYMDQi960xe6hgJCdXPHWOPIw0hcsmZSozBaFTcCDD2mv/kPGgAKT27ymPgkMzgc/O3gUCrKKQEOTC+ZKPfDzmJAQQs0EAyGAz+Km5Bn1NvbPN3zA7U/X2sxxPmKZtT8E1RS+WLXPZW5LDUTSPF/5N+mCV2Rf4X0MBCh+uROKa8SpY61j5YOGDEPfnh4k8VXQcYJKXuC8iqseQElqzPJpcniA5/9hRafLdxOggmnArxbf7Gm0ag30Mql7NFicgLr4X+KTJ41Xel7+JU8u2tzfOp2hnzSUv5Bz21NdB4RkRWRjrELVtOlV1BC9ud6C3fQoB0cSIdg0ekWfcL1s2Oc2YoPJj45hbfd6PYrr2GG1vGb/5LzVY8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(136003)(396003)(39860400002)(6486002)(66556008)(26005)(31686004)(186003)(4326008)(478600001)(66946007)(66476007)(31696002)(7416002)(316002)(956004)(44832011)(86362001)(2906002)(53546011)(6916009)(16576012)(6666004)(54906003)(8936002)(8676002)(2616005)(5660300002)(83380400001)(38100700002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?1g11MJ69owzoNIoju2KxVYegqokzvZ5xHMDIKYkt5r0PSoF5vKh82Ggh?=
 =?Windows-1252?Q?s60SAgVw1fjO1IW0Bw919oyc7k0Gla3f7EqvwEeYufXTDhNrf2lWs/xh?=
 =?Windows-1252?Q?cOB01VU5VSZ/b3KvxNboh7EtSwBPIriBuwld58+BweJZEMAPUD+J5Rfn?=
 =?Windows-1252?Q?YClywSx1uXOXL/p4yKyKwN7lWu6makZPjijnzLH42NNVUsq4Q2Mv5ZWf?=
 =?Windows-1252?Q?6yErn4ZgP8eiLxBtRqzGCnUkZbctpCEhvgWlzP4ggj3FW+BgnBfBFFyf?=
 =?Windows-1252?Q?XRNl+MmkLULd9OczaUjGX8upNVYdLFr3M4nTA4izK0Mew212XV4Z2Hqb?=
 =?Windows-1252?Q?1izrUB10kJFsPTqgboMZWj4oWXaeoyH3e6zcNWScCIj7+2mxS31H4/lz?=
 =?Windows-1252?Q?FVre2xXi7zEJ19Jb2lrXjmnnCNMiskN+n2ayprI3k7ILfC+MpF1OIDn4?=
 =?Windows-1252?Q?ItWxk7HGguijXSy04NFeRuMwhX90G/dxGttzIL9GB+mzAyP9DGt/CDJU?=
 =?Windows-1252?Q?DQ/AaH4SC9aW/gcqhqdNio1biS0aRD7T1GJsouKiYK8S7Wtxk9VxXOOr?=
 =?Windows-1252?Q?4D3e4TX5dwWmNmGzTbA86YDtujrir8/YHosfIoOZusT9pcE311zzPa0A?=
 =?Windows-1252?Q?11b5AhMy5xx4WcBLmOdhe18l2RpaqEQsNlLpwYJiboPoXUQ//JDAknrr?=
 =?Windows-1252?Q?a+4d99DkB89gYOwEwjX0fQg/6XWLsuvnzWBPTEVHWE63nPJQx+nR97/l?=
 =?Windows-1252?Q?70JkA66RV2f2O5mnxqNjSysB8KwICMzuSFv3TaX9NquJJJgrmt70py91?=
 =?Windows-1252?Q?dIpxNmbwgwiM0oPZJ6zq7Js6DW/oOHdxTdgW6sYsIYkmQFuQBPlfXXrL?=
 =?Windows-1252?Q?WiIyHWST37v9dvCMfMLIyk6JDvZzXry4zC7tCHiRAuI83UQPvDcT6vRx?=
 =?Windows-1252?Q?AKcS67GnvFZ6IAPuVYF1A7mW6ZdAdrW//jRESWm73IES84FExDApGJml?=
 =?Windows-1252?Q?zEAc/OuEmfjbUBrbA6T06fG6/bnN8ToPnVt7jbI0mE7XD5WEqQUPWEE8?=
 =?Windows-1252?Q?3BM6Emidk+IA+ZB0DsS6U3e6jI0HWRF1b8s7w3+ihF+e7KyZuxFiQiCh?=
 =?Windows-1252?Q?sJGzdsY/nDP9YazSxQxjn2W0gDGmW9lYuYmwIhce/Xfdzt22ImOL3t0D?=
 =?Windows-1252?Q?5DLUgfMgdQCMAp8k4Bv3pati4yBn/IugJxOv11xIHDflRW17An1q7L0+?=
 =?Windows-1252?Q?X01J4j9x6Wui694TCQcB2W7MIfLJDr9lhu0wroF7MS0ubXS22qEu2EAH?=
 =?Windows-1252?Q?0fF6NfQB5eD4Q8YJiaTpE8cTEhg+7qUvnd5cRijwK2U0pg/T1ZZYypRT?=
 =?Windows-1252?Q?ZxS4eS4CCFKruZffGzDZYM+SNIt9tHJw8op3H/DxAYGmTulovJa61UYl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae73a536-da75-45bb-4cbb-08d94605c289
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 13:54:40.4783 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VaXjLcn5YS0iAcrsE3HlxpB/vLTLCD7r9CLjw5V92Td9l26503cyeMPMkRHgqPHLre3NwFm2ALLUdfFEKHUJWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5425
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
 Philippe CORNU - foss <philippe.cornu@foss.st.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Philippe CORNU <philippe.cornu@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2021-07-13 3:52 a.m., Pekka Paalanen wrote:
> On Mon, 12 Jul 2021 12:15:59 -0400
> Harry Wentland <harry.wentland@amd.com> wrote:
> 
>> On 2021-07-12 4:03 a.m., Pekka Paalanen wrote:
>>> On Fri, 9 Jul 2021 18:23:26 +0200
>>> Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com> wrote:
>>>   
>>>> On 7/9/21 10:04 AM, Pekka Paalanen wrote:  
>>>>> On Wed, 7 Jul 2021 08:48:47 +0000
>>>>> Raphael GALLAIS-POU - foss <raphael.gallais-pou@foss.st.com> wrote:
>>>>>    
>>>>>> Some display controllers can be programmed to present non-black colors
>>>>>> for pixels not covered by any plane (or pixels covered by the
>>>>>> transparent regions of higher planes).  Compositors that want a UI with
>>>>>> a solid color background can potentially save memory bandwidth by
>>>>>> setting the CRTC background property and using smaller planes to display
>>>>>> the rest of the content.
>>>>>>
>>>>>> To avoid confusion between different ways of encoding RGB data, we
>>>>>> define a standard 64-bit format that should be used for this property's
>>>>>> value.  Helper functions and macros are provided to generate and dissect
>>>>>> values in this standard format with varying component precision values.
>>>>>>
>>>>>> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
>>>>>> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>>>>>> ---
>>>>>>   drivers/gpu/drm/drm_atomic_state_helper.c |  1 +
>>>>>>   drivers/gpu/drm/drm_atomic_uapi.c         |  4 +++
>>>>>>   drivers/gpu/drm/drm_blend.c               | 34 +++++++++++++++++++++--
>>>>>>   drivers/gpu/drm/drm_mode_config.c         |  6 ++++
>>>>>>   include/drm/drm_blend.h                   |  1 +
>>>>>>   include/drm/drm_crtc.h                    | 12 ++++++++
>>>>>>   include/drm/drm_mode_config.h             |  5 ++++
>>>>>>   include/uapi/drm/drm_mode.h               | 28 +++++++++++++++++++
>>>>>>   8 files changed, 89 insertions(+), 2 deletions(-)
> 
> ...
> 
>>>>> The question about full vs. limited range seems unnecessary to me, as
>>>>> the background color will be used as-is in the blending stage, so
>>>>> userspace can just program the correct value that fits the pipeline it
>>>>> is setting up.
>>>>>
>>>>> One more question is, as HDR exists, could we need background colors
>>>>> with component values greater than 1.0?    
>>>>
>>>> AR4H color format should cover that case, isn't it ?  
>>>
>>> Yes, but with the inconvenience I mentioned.
>>>
>>> This is a genuine question though, would anyone actually need
>>> background color values > 1.0. I don't know of any case yet where it
>>> would be required. It would imply that plane blending happens in a
>>> color space where >1.0 values are meaningful. I'm not even sure if any
>>> hardware supporting that exists.
>>>
>>> Maybe it would be best to assume that only [0.0, 1.0] pixel value range
>>> is useful, and mention in the commit message that if someone really
>>> needs values outside of that, they should create another background
>>> color property. Then, you can pick a simple unsigned integer pixel
>>> format, too. (I didn't see any 16 bit-per-channel formats like that in
>>> drm_fourcc.h though.)
>>>   
>>
>> I don't think we should artificially limit this to [0.0, 1.0]. As you
>> mentioned above when talking about full vs limited, the userspace
>> understands what's the correct value that fits the pipeline. If that
>> pipeline is FP16 with > 1.0 values then it would make sense that the
>> background color can be > 1.0.
> 
> Ok. The standard FP32 format then for ease of use and guaranteed enough
> range and precision for far into the future?
> 

I don't have a strong preference for FP16 vs FP32. My understanding is
that FP16 is enough to represent linearly encoded data in a way that
looks smooth to humans.

scRGB uses FP16 with linear encoding in a range of [-0.5, 7.4999].

> Or do you want to keep it in 64 bits total, so the UABI can pack
> everything into a u64 instead of needing to create a blob?
> 
> I don't mind as long as it's clearly documented what it is and how it
> works, and it carries enough precision.
> 
> But FP16 with its 10 bits of precision might be too little for integer
> 12-16 bpc pipelines and sinks?
> 
> If the values can go beyond [0.0, 1.0] range, then does the blending
> hardware and the degamma/ctm/gamma coming afterwards cope with them, or
> do they get clamped anyway?
> 

That probably depends on the HW and how it's configured. AMD HW can handle
values above and below [0.0, 1.0].

Harry

> 
> Thanks,
> pq
> 

