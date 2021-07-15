Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0B53CA4FD
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 20:10:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 646896E892;
	Thu, 15 Jul 2021 18:10:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2042.outbound.protection.outlook.com [40.107.236.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CEBE6E892
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 18:10:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dRYFihqJoy/CGSFLLa1IzsNICf/KPyBCb+m4NkQDMklwM7RNobaUxHgQYrasiiC3Y3pUih+khvJQLCjl4xNp/Ztcfu2JdYHlVzx0vc9l/oSgKoSPl9Rsl7/1qrBRvgmwCVco/EfDXTmY6TVeVOLvvAUSM6gOxxXLc7xcHhpXY5V/7rjaIlNfr3QOwZNl2DYTPrtxeIh6ZuYGuz/9MCz/tFiFN8cyLj+CVWjANJEXb3IgJbqEtw3ccHLA6KPYPCOlQEsrcAziBvRuaWax352QzsiCVO+v6hRYvUBozYQ4h/F0vRoiEgUzefNWCBfwnWORWiBvnYwr2axu/z9Usta2rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OdV9/Met8lHIcm+Zl2HRL3vFwfRrjLb5puIrorbPmqc=;
 b=fNwwl2eVJf8jIzmrUWrBuGPyORETYwWN5O00Gd2ECx1RrFGlbySON4pN2ME6s7PfKKqbgHEN4GQ5k5ETMka3QfFMG1eJDlGWmey9axWPDn9FLyScbNX7kY4JwuEwBXwHn+gEoOYIwFrRDUH5YZ2C2YsjMd3SnG/b7fpRj6XREt2+ohUiKc9LL/kD9qN+7NNlmPJhPVSr1jLQcQBfPn6iiSGyBZXeE/WVAZaXtx1XGIClaX87uYp4nmcM7a7auloWGlZ16HqQkXgtUjM8mRbaU+i0hRof5e3KBfTI5PU54vb8ndHAleFCqY4aF4tYS8EJw51ad8W8zdW2mW3/OwnKLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OdV9/Met8lHIcm+Zl2HRL3vFwfRrjLb5puIrorbPmqc=;
 b=mGOgVo95XeKe6ASXrFrwc+IqOiRsi4bv0WV8Cg0YOnjCX0QdxuacoVbfP+ooiSFyjAFmm54k4kOVdNRSLx9cA86AG3+uIe8+zDZp159zKnpgBQ+2WJ5KbOvyvNZ2uJbaLec1Z06Mem7l5WGyJEfLgAhVaWGhZJsDgt5w/hFojZE=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5492.namprd12.prod.outlook.com (2603:10b6:5:35d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22; Thu, 15 Jul
 2021 18:10:19 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::39db:7a51:9e0d:9b19]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::39db:7a51:9e0d:9b19%5]) with mapi id 15.20.4331.023; Thu, 15 Jul 2021
 18:10:19 +0000
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
 <7682e4c6-a040-a2b6-915d-b99ad3ddd53e@amd.com>
 <20210715123431.48770751@eldfell>
From: Harry Wentland <harry.wentland@amd.com>
Message-ID: <5a9cc3ee-340e-1fad-9124-82bd68d49bb2@amd.com>
Date: Thu, 15 Jul 2021 14:10:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210715123431.48770751@eldfell>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0012.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01::20)
 To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.50.3] (198.200.67.154) by
 YQBPR01CA0012.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Thu, 15 Jul 2021 18:10:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eec9a8a0-559f-4503-27c4-08d947bbce11
X-MS-TrafficTypeDiagnostic: CO6PR12MB5492:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR12MB54929F16FF6AEA6CA3E0CE3B8C129@CO6PR12MB5492.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ynclyp7b0YdWo55NLVDNQysRKQWGpiWFsYgLKt7AsCdFuqH71beN1W6xcG6HKPHqHhmoto886YU9KteyE1+Ofsg104qMzVaaQzWvu6tdfMaMoGKMCw7WFbuKo+u7adgNDkD8N5UnSQpORU0wWSVk2QHYzvYPL1BFmXAfRCMYp3eTCVaPD1CFMq7o/s/aWrLk5pwAh//UjDY1rTTTaa0Bt+XBrg7E/3NVIVnekUFAoCKW0Wv1NnYHFv0GkyWLXfCNSgvF+CHzQRV+vBn+HJC8gf629eEufAIIkny8TseVZTHSvTK8Xc5FqxS0rkf/EUT4oKbYcdrW2hoxgujQKmZEBHuYK7hclnUHPCPmckmq54Q2zeY/0ycVOJFWZEyCToH7kDSiE+/Ck4JcMm1pL9nMLQtDui6kWiJuXHIRyD37/jH/iEgN9Vl22pr+RqK2tQBUilJkvCQXEnwqxsgcyiMkt1HFkKiMpbTBjZQrAp7br1FscNtsnJqOtpEWc5j9NFw32Q8goNag+KceDR3bs+eT6N6cJiY0SaFIzIz6YBYh/AcaaksM9DcFMr23neQ/h5J9lhT0We3sDr/bkIUAVjsUguWsAyfX1WC7fHTzYj6HsDv7fVcBXckjK3CCO+RvMrbx+IkuHjrH0ARHJ7L56FXqDxKWrdKLyC6/HMdW67W2q2TtadIAupnpfVRCm5rhr61kSzgv1WT4hjHfvhGOsmGuLRhv/R3HJ4gM/6QDqEvDAFSN9DpC4Kx1iEG7QRwLdDdk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(16576012)(8676002)(86362001)(7416002)(6666004)(2906002)(8936002)(31686004)(66556008)(66476007)(66946007)(5660300002)(6486002)(316002)(83380400001)(53546011)(4326008)(26005)(6916009)(186003)(2616005)(54906003)(44832011)(478600001)(956004)(31696002)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?vTxkjKWyIbaBvmEbi8vaSnw4AsrMJ0pJzn4iQe+6nMF4hSwe6cF6JoJa?=
 =?Windows-1252?Q?OzTNv/GDV6Cl93BbYXIEvueKcnwOrDm1eUsVi5wsCHLkBxdMewh4uAq0?=
 =?Windows-1252?Q?770kFyF8GZws62A0bnwrHVWFx6oP9p3BsMrZS+9tBRyo5HdGsv+Qwsnp?=
 =?Windows-1252?Q?skJnfkk4qvkEqaVuG1dmLSIQCUwACgrAgP2stQZbA1W9cm0yrW/vbd+8?=
 =?Windows-1252?Q?h0RdfYxcHiwWJtoYaqQ4ZZQ60faowlvayMgafx6doqduLPhGTgxn+7Im?=
 =?Windows-1252?Q?aVydwlYJP/aU6AbHpk9aMyk4J5e3jvUW6F+CLFWFBCb8QzeQ9KmruOB2?=
 =?Windows-1252?Q?7/JQ+f0s5t0F0RHvmx65Z2GcduShu4jeNOWAau74eEVsG6sCM16mMOrY?=
 =?Windows-1252?Q?/xrYfuBut6IvA2EMGvs070osiTOR6Rk7C7PXk843TywFN7HCIn32pET9?=
 =?Windows-1252?Q?p+HS9UFAg2jPbtafg7NKu4uK3Oi3ZBfRJ5XDX3zv0rETW5feVuloaLvN?=
 =?Windows-1252?Q?0b9bWTvpdMv8yFIOcExaY1pK8yns7t8G5YlVxTQEH1tWuvZ8uh/6/5YD?=
 =?Windows-1252?Q?fZFl2OLjkcGvfZMzVoyNnuUs/vKs9VH+493zHtFdwHiL6h+N4XTNUI/Z?=
 =?Windows-1252?Q?U5hMD7T0cFaT5uROyfthF4GSL51OWM+SAqJyNxZjmUdpsEx+bJ294pJC?=
 =?Windows-1252?Q?kgsjQs9YdMtgzyvgcnV1kulJVbx3t4z9TLGPqbLD8ngmQA0xsXsl5IL8?=
 =?Windows-1252?Q?n3Go1IRVGoCT0S5hhzmKHeYtt48CY1GyeNVqiN+eZIFa8byLmycjU2ji?=
 =?Windows-1252?Q?XaCUy//16QVy0FFwbHk3FDCMK20kziQFw0OexUm3Nt88hBoPIL0dAfzR?=
 =?Windows-1252?Q?Dko3q7jrG0eqXpq7rb/Y0C+0GmBdcqry8aol+6GxV+j1yxjjrXqQTI3b?=
 =?Windows-1252?Q?i7M7maPErYkpTodbEX+LsGdGGQleHgzvlsmGgwVQ7+1pxBFgsUus6s2n?=
 =?Windows-1252?Q?s92LQrCKcT0PdbC0KgdpZQhWgg3/IsUOTqK3iV7+sFyTsxxzGhDyzFjN?=
 =?Windows-1252?Q?mv+A3fmiwEn16ZwEGuqywdGvR05gXWu1io3CE1pe7Xf7UAxsZexiy3Qh?=
 =?Windows-1252?Q?traz7H3KYEngoP6e4XzVIBMYgo+fTk83rmaRNnG1lXuUbIwK5aiulzFs?=
 =?Windows-1252?Q?OGntjRYuodzJEIffmFOkiAAol5GNqApAahNA7cM2JHrwQZ/Vr1C8R9Pz?=
 =?Windows-1252?Q?KNzle+o8utco/AV4ArkGkVzqM/UkX3AvRcq9+6/KUR+cLax9eCDdmWHZ?=
 =?Windows-1252?Q?jcvDHNxfXGtn85FYlZW743RdbOvgmzuqpCL6Wyd77TQRTDabPzDJCreu?=
 =?Windows-1252?Q?BJVfijbs2GfGgT3U0c/5WCzaHqZWY2ok8XstioaoaLM+/vIWEW2IRnu/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eec9a8a0-559f-4503-27c4-08d947bbce11
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 18:10:19.4583 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aqmqvYU4/6nYfksjI6JfDvxYRxQ3M3HeuMC5LFQbJ1lMQg/qyUJjgME0ojD4+7MWRFhx9y00pyiLWA88CLVIjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5492
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



On 2021-07-15 5:34 a.m., Pekka Paalanen wrote:
> On Wed, 14 Jul 2021 12:13:58 -0400
> Harry Wentland <harry.wentland@amd.com> wrote:
> 
>> On 2021-07-14 3:35 a.m., Pekka Paalanen wrote:
>>> On Tue, 13 Jul 2021 09:54:35 -0400
>>> Harry Wentland <harry.wentland@amd.com> wrote:
>>>   
>>>> On 2021-07-13 3:52 a.m., Pekka Paalanen wrote:  
>>>>> On Mon, 12 Jul 2021 12:15:59 -0400
>>>>> Harry Wentland <harry.wentland@amd.com> wrote:
>>>>>     
>>>>>> On 2021-07-12 4:03 a.m., Pekka Paalanen wrote:    
>>>>>>> On Fri, 9 Jul 2021 18:23:26 +0200
>>>>>>> Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com> wrote:
>>>>>>>       
>>>>>>>> On 7/9/21 10:04 AM, Pekka Paalanen wrote:      
>>>>>>>>> On Wed, 7 Jul 2021 08:48:47 +0000
>>>>>>>>> Raphael GALLAIS-POU - foss <raphael.gallais-pou@foss.st.com> wrote:
>>>>>>>>>        
>>>>>>>>>> Some display controllers can be programmed to present non-black colors
>>>>>>>>>> for pixels not covered by any plane (or pixels covered by the
>>>>>>>>>> transparent regions of higher planes).  Compositors that want a UI with
>>>>>>>>>> a solid color background can potentially save memory bandwidth by
>>>>>>>>>> setting the CRTC background property and using smaller planes to display
>>>>>>>>>> the rest of the content.
>>>>>>>>>>
>>>>>>>>>> To avoid confusion between different ways of encoding RGB data, we
>>>>>>>>>> define a standard 64-bit format that should be used for this property's
>>>>>>>>>> value.  Helper functions and macros are provided to generate and dissect
>>>>>>>>>> values in this standard format with varying component precision values.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
>>>>>>>>>> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>>>>>>>>>> ---
>>>>>>>>>>   drivers/gpu/drm/drm_atomic_state_helper.c |  1 +
>>>>>>>>>>   drivers/gpu/drm/drm_atomic_uapi.c         |  4 +++
>>>>>>>>>>   drivers/gpu/drm/drm_blend.c               | 34 +++++++++++++++++++++--
>>>>>>>>>>   drivers/gpu/drm/drm_mode_config.c         |  6 ++++
>>>>>>>>>>   include/drm/drm_blend.h                   |  1 +
>>>>>>>>>>   include/drm/drm_crtc.h                    | 12 ++++++++
>>>>>>>>>>   include/drm/drm_mode_config.h             |  5 ++++
>>>>>>>>>>   include/uapi/drm/drm_mode.h               | 28 +++++++++++++++++++
>>>>>>>>>>   8 files changed, 89 insertions(+), 2 deletions(-)    
>>>>>
>>>>> ...
>>>>>     
>>>>>>>>> The question about full vs. limited range seems unnecessary to me, as
>>>>>>>>> the background color will be used as-is in the blending stage, so
>>>>>>>>> userspace can just program the correct value that fits the pipeline it
>>>>>>>>> is setting up.
>>>>>>>>>
>>>>>>>>> One more question is, as HDR exists, could we need background colors
>>>>>>>>> with component values greater than 1.0?        
>>>>>>>>
>>>>>>>> AR4H color format should cover that case, isn't it ?      
>>>>>>>
>>>>>>> Yes, but with the inconvenience I mentioned.
>>>>>>>
>>>>>>> This is a genuine question though, would anyone actually need
>>>>>>> background color values > 1.0. I don't know of any case yet where it
>>>>>>> would be required. It would imply that plane blending happens in a
>>>>>>> color space where >1.0 values are meaningful. I'm not even sure if any
>>>>>>> hardware supporting that exists.
>>>>>>>
>>>>>>> Maybe it would be best to assume that only [0.0, 1.0] pixel value range
>>>>>>> is useful, and mention in the commit message that if someone really
>>>>>>> needs values outside of that, they should create another background
>>>>>>> color property. Then, you can pick a simple unsigned integer pixel
>>>>>>> format, too. (I didn't see any 16 bit-per-channel formats like that in
>>>>>>> drm_fourcc.h though.)
>>>>>>>       
>>>>>>
>>>>>> I don't think we should artificially limit this to [0.0, 1.0]. As you
>>>>>> mentioned above when talking about full vs limited, the userspace
>>>>>> understands what's the correct value that fits the pipeline. If that
>>>>>> pipeline is FP16 with > 1.0 values then it would make sense that the
>>>>>> background color can be > 1.0.    
>>>>>
>>>>> Ok. The standard FP32 format then for ease of use and guaranteed enough
>>>>> range and precision for far into the future?
>>>>>     
>>>>
>>>> I don't have a strong preference for FP16 vs FP32. My understanding is
>>>> that FP16 is enough to represent linearly encoded data in a way that
>>>> looks smooth to humans.
>>>>
>>>> scRGB uses FP16 with linear encoding in a range of [-0.5, 7.4999].
>>>>  
>>>>> Or do you want to keep it in 64 bits total, so the UABI can pack
>>>>> everything into a u64 instead of needing to create a blob?
>>>>>
>>>>> I don't mind as long as it's clearly documented what it is and how it
>>>>> works, and it carries enough precision.
>>>>>
>>>>> But FP16 with its 10 bits of precision might be too little for integer
>>>>> 12-16 bpc pipelines and sinks?  
>>>
>>> The 10 bits worries me still.
>>>
>>> If you have a pipeline that works in [0.0, 1.0] range only, then FP16
>>> limits precision to 10 bits (in the upper half of the range?).
>>>   
>>>>>
>>>>> If the values can go beyond [0.0, 1.0] range, then does the blending
>>>>> hardware and the degamma/ctm/gamma coming afterwards cope with them, or
>>>>> do they get clamped anyway?
>>>>>     
>>>>
>>>> That probably depends on the HW and how it's configured. AMD HW can handle
>>>> values above and below [0.0, 1.0].  
>>>
>>> Right, so how would userspace know what will happen?
>>>
>>> Or do we need to specify that while values outside that unit range are
>>> expressable, it is hardware-specific on how they will behave, so
>>> generic userspace should not attempt to use values outside of the unit
>>> range?
>>>
>>> I guess this caveat should be documented for everything, not just for
>>> background color? LUT inputs and outputs, CTM input and output ranges,
>>> FB formats...
>>>   
>>
>> I'm not sure we should artificially limit the interface at this point, or
>> document hypotheticals. At this point I don't even know whether going beyond
>> [0.0, 1.0] would be a challenge for any HW that supports floating point
>> formats.
> 
> Exactly, we don't know. Yet we have to document how background color
> works. If background color can express values outside of [0.0, 1.0],
> the documentation must say something about it.
> 
> If there is no way to know, then documentation must say you don't know
> (or that it is hardware-specific, which to generic userspace is the
> same thing).
> 
> If userspace does not know what happens, then obviously it will avoid
> using values it does not know what happens with.
> 
> For example, let's say that blending can produce values outside of
> [0.0, 1.0]. The next step in the pipeline is DEGAMMA, which is a 1D
> LUT. How do you sample a 1D LUT with input values beyond [0.0, 1.0]? Do
> you clamp them to the unit range? Does the clamping still happen even
> when the LUT is in pass-through mode?
> 
> And in general, how big or how negative values will actually go through
> the pipeline?
> 
> Of course the background color property should not document everything
> above, but it must say something, like "The handling of values outside
> of [0.0, 1.0] depends on the capabilities of the hardware blending
> engine." That makes the handling unknown to generic userspace, but
> userspace drivers could make use of it.
> 
> The important bit is to understand that the background color values may
> sometimes (when?) not reach the sink unmodified even if userspace has
> configured the KMS pipeline to not modify them.
> 
> I would expect that values in [0.0, 1.0] have no problem passing
> through the KMS pipeline unharmed, and there are obvious expectations
> about how a LUT or a CTM processes them. But as soon as values outside
> of that range are possible, a whole slew of questions arises. The
> documentation must not be silent, it must set expectations like "it's
> hardware specific" if that's what it is.
> 

Agreed. I think ultimately we don't know because we haven't gotten to
use-cases like that.

I'm fine with documentation stating "The handling of values outside
of [0.0, 1.0] depends on the capabilities of the hardware blending
engine." or "Handling of values outside [0.0, 1.0] is currently
undefined."

Harry

> 
> Thanks,
> pq
> 

