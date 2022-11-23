Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC97636E5B
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 00:27:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F19510E65D;
	Wed, 23 Nov 2022 23:27:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FA0310E653;
 Wed, 23 Nov 2022 23:27:22 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2ANLw8Bd012358; Wed, 23 Nov 2022 23:27:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=UiHNcOmoMphTTi3nQUV3Z38plohqL6G7XBcr6w9GfY8=;
 b=S5eu34NxyP2wDLpSJ+pR76vWEj39OGq2QZjaePcAkqqccHYzORIhiwyw07kNMfUxZrCD
 CS7gg9OsiBpd7VNW9UgY2IEpzyR5UDohXdjuo886xADEWMT3GuGwn5019JvCJd77Engg
 zFTzKe0lBMxZmErWbyUyo/aB+dC/Z5QnPB2L4/a0Te9MZoKM/WLnm1Ynlqlrhbd0K+Hz
 p+imS1Ms5idB/HRhiOgwhm0FrJR/PxtA7090yhNTf5FDqK1jKmn6bFgB7bmQ0VvJzj2i
 7zHlHmGGVE+1AtNsjAOX5yshvmLv/eFSdbXts4blGJFjJX5C9WeXaDPkDEVkfR+DQrY3 tw== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3m1favjwab-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Nov 2022 23:27:07 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2ANNR6FO023129
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Nov 2022 23:27:06 GMT
Received: from [10.71.111.47] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 23 Nov
 2022 15:27:05 -0800
Message-ID: <0eb6155d-7b70-fc4b-97dd-7c5caea330ac@quicinc.com>
Date: Wed, 23 Nov 2022 15:27:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [RFC PATCH 1/3] drm: Introduce color fill properties for drm plane
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20221028225952.160-1-quic_jesszhan@quicinc.com>
 <20221028225952.160-2-quic_jesszhan@quicinc.com>
 <712a9a25-4c38-9da5-b1a6-39e4665b4d31@linaro.org>
 <U3Koc0-B-7C7sbIpcRWokBHPOQdrQl7azJxAUWFJ4nmsk5nPf9NnUgBr9HOFUZ9YLJOKREN878fXv_BeIc15Kh_jVAFCFbYr8XfS3s0Os_M=@emersion.fr>
 <CA+hFU4wrDtSpU5owaNVP=8F3bQCnFCaJ7RmGOS0y4cooKQ5+CQ@mail.gmail.com>
 <20221109111857.36486d8d@eldfell>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20221109111857.36486d8d@eldfell>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: PY2VFpIhJkN_bx0LBUPVkDby6eRaYeeV
X-Proofpoint-GUID: PY2VFpIhJkN_bx0LBUPVkDby6eRaYeeV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-23_13,2022-11-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1011 mlxscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211230173
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, laurent.pinchart@ideasonboard.com,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 wayland-devel <wayland-devel@lists.freedesktop.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/9/2022 1:18 AM, Pekka Paalanen wrote:
> On Tue, 8 Nov 2022 23:01:47 +0100
> Sebastian Wick <sebastian.wick@redhat.com> wrote:
> 
>> On Tue, Nov 8, 2022 at 7:51 PM Simon Ser <contact@emersion.fr> wrote:
>>>
>>> cc'ing Pekka and wayland-devel for userspace devs feedback on the new uAPI.
> 
> Hi all,
> 
> thanks! Comments below.

Thanks for the feedback!

> 
>>>
>>> On Saturday, October 29th, 2022 at 14:08, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
>>>   
>>>> On 29/10/2022 01:59, Jessica Zhang wrote:
>>>>> Add support for COLOR_FILL and COLOR_FILL_FORMAT properties for
>>>>> drm_plane. In addition, add support for setting and getting the values
>>>>> of these properties.
>>>>>
>>>>> COLOR_FILL represents the color fill of a plane while COLOR_FILL_FORMAT
>>>>> represents the format of the color fill. Userspace can set enable solid
>>>>> fill on a plane by assigning COLOR_FILL to a uint64_t value, assigning
>>>>> the COLOR_FILL_FORMAT property to a uint32_t value, and setting the
>>>>> framebuffer to NULL.
>>>>>
>>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>>>
>>>> Planes report supported formats using the drm_mode_getplane(). You'd
>>>> also need to tell userspace, which formats are supported for color fill.
>>>> I don't think one supports e.g. YV12.
>>>>
>>>> A bit of generic comment for the discussion (this is an RFC anyway).
>>>> Using color_fill/color_fill_format properties sounds simple, but this
>>>> might be not generic enough. Limiting color_fill to 32 bits would
>>>> prevent anybody from using floating point formats (e.g.
>>>> DRM_FORMAT_XRGB16161616F, 64-bit value). Yes, this can be solved with
>>>> e.g. using 64-bit for the color_fill value, but then this doesn't sound
>>>> extensible too much.
>>>>
>>>> So, a question for other hardware maintainers. Do we have hardware that
>>>> supports such 'color filled' planes? Do we want to support format
>>>> modifiers for filling color/data? Because what I have in mind is closer
>>>> to the blob structure, which can then be used for filling the plane:
>>>>
>>>> struct color_fill_blob {
>>>>       u32 pixel_format;
>>>>       u64 modifiers4];
>>>>       u32 pixel_data_size; // fixme: is this necessary?
>>>>       u8 pixel_data[];
>>>> };
>>>>
>>>> And then... This sounds a lot like a custom framebuffer.
>>>>
>>>> So, maybe what should we do instead is to add new DRM_MODE_FB_COLOR_FILL
>>>> flag to the framebuffers, which would e.g. mean that the FB gets stamped
>>>> all over the plane. This would also save us from changing if (!fb)
>>>> checks all over the drm core.
>>>>
>>>> Another approach might be using a format modifier instead of the FB flag.
>>>>
>>>> What do you think?
>>>
>>> First off, we only need to represent the value of a single pixel here. So I'm
>>> not quite following why we need format modifiers. Format modifiers describe how
>>> pixels are laid out in memory. Since there's a single pixel described, this
>>> is non-sensical to me, the format modifier is always LINEAR.
> 
> Agreed.
> 
>>>
>>> Then, I can understand why putting the pixel_format in there is tempting to
>>> guarantee future extensibility, but it also adds complexity. For instance, how
>>> does user-space figure out which formats can be used for COLOR_FILL? Can
>>> user-space use any format supported by the plane? What does it mean for
>>> multi-planar formats? Do we really want the kernel to have conversion logic for
>>> all existing formats? Do we need to also add a new read-only blob prop to
>>> indicate supported COLOR_FILL formats?

FWIW the formats supported by solid_fill wouldn't necessarily be all the 
formats supported by the plane (ex. for msm/dpu, solid_fill only 
supports all RGB color variants, though planes can normally support YUV 
formats too).

That being said, I'm ok with having the solid_fill take in only 
RGBA32323232 format based on the comments below.

> 
> Right. This does not seem to require pixel formats at all.
> 
> The point of pixel formats is to be able to feed large amounts of data
> as-is into hardware and avoid the CPU ever touching it. You do that
> with DRM FBs pointing to suitably allocated hardware buffers. But here
> we have exactly one pixel, which I imagine will always be read by the
> CPU so the driver will convert it into a hardware-specific format and
> program it; probably the driver will not create an internal DRM FB for
> it. >
> The above might also be a reason to not model this as a special-case
> DRM FB in UAPI. Or, at least you need a whole new ioctl to create such
> DRM FB to avoid the need to allocate e.g. a dumb buffer or a
> GPU-specific buffer. >
> What one does need is what Sebastian brought up: does it support alpha
> or not?
Hmm, the drm_plane struct already supports an alpha property so it seems 
a bit redundant to also have a separate alpha value in the solid fill color.

That being said, we could have it so that setting the alpha for the 
solid_fill property will also change the value of the plane's alpha 
property too.

> 
> Userspace would also be interested in the supported precision of the
> values, but the hardware pixel component order is irrelevant because the
> driver will always convert the one pixel with CPU anyway.
> 
> YUV vs. RGB is a another question. The KMS color pipeline is defined in
> terms of RGBA as far as I know, and alpha-blending YUV values makes no
> sense. So will there ever be any need to set an YUV fill? I have a hard
> time imagining it.
> 
> If you do set an YUV fill, the KMS color pipeline most likely needs to
> convert it to RGBA for blending, and then you need the plane properties
> COLOR_ENCODING and COLOR_RANGE.
> 
> But why bother when userspace can convert that one pixel to RGBA itself
> anyway?

Noted, I think this is reasonable.

> 
>>> We've recently-ish standardized a new Wayland protocol [1] which has the same
>>> purpose as this new kernel uAPI. The conclusion there was that using 32-bit
>>> values for each channel (R, G, B, A) would be enough for almost all use-cases.
>>> The driver can convert these high-precision values to what the hardware expects.
>>> The only concern was about sending values outside of the [0.0, 1.0] range,
>>> which may have HDR use-cases.
> 
> This is what I would suggest, yes. This representation has enough
> precision to be future-proof, and the driver will be converting the
> value anyway.
> 
> The question about values outside of the unit range is a good one, too.
> With Wayland, we can simply add another request to set a value in
> floating-point if that turns up necessary.
> 
> Whether that will ever be necessary is connected to how the DRM KMS
> abstract color pipeline is modelled, and that you must define from the
> beginning:
> 
> If DRM KMS gets color processing related plane properties like CTM,
> GAMMA or DEGAMMA (they already exist for CRTC, and these have been
> proposed for planes quite some time ago), does the fill color go
> through all these operations, or will the fill color skip all these
> operations and go straight to plane blending?

The fill color would still go through color processing operations, 
though FWIW the MSM driver doesn't support GAMMA/DEGAMMA.

> 
> Whether values outside of the unit range will ever be needed depends
> also on the userspace design. Userspace could choose the value range
> freely if the KMS color pipeline elements happen to support that range.
> However things like LUTs are naturally limited to unit range input, so
> using values outside of the unit range might be difficult if not
> impossible. Therefore I'm not concerned about this question much.
> 
>>> So, there are multiple ways to go about this. I can think of:
>>>
>>> - Put "RGBA32" in the name of the prop, and if we ever need a different
>>>    color format, pick a different name.
> 
> I could see problems with that if the same device supports more than
> one kind. How to turn off all but one color fill property?
> 
> What if userspace understands an old color fill property but not the
> new one, and the new one happens to be set for some reason? Userspace
> will attempt to use the old property without setting the new property
> to nil, and fail.
> 
>>> - Define a struct with an enum of possible fill kinds:
>>>    #define FILL_COLOR_RGBA32 1
>>>    #define FILL_COLOR_F32 2
>>>    struct color_fill_blob { u32 kind; u8 data[]; };
> 
> This could work.
> 
> Btw. maybe call it RGBA32323232 to make it follow the drm_fourcc naming
> convention. Some userspace libraries already use RGBA32 to mean 32 bit
> per pixel instead of per channel.
> 
> How will userspace know what kinds are supported?
> 
>>> - Define a struct with a version and RGBA values:
>>>    struct color_fill_blob { u32 version; u32 rgba[4]; };
>>>    If we need to add more formats later, or new metadata:
>>>    struct color_fill_blob2 { u32 version; /* new fields */ };
>>>    where version must be set to 2.
> 
> This could work.

Leaning towards this option.

Thanks,

Jessica Zhang

> 
>>> - Define a struct with a "pixel_format" prop, but force user-space to use a
>>>    fixed format for now. Later, if we need another format, add a new prop to
>>>    advertise supported formats.
>>> - More complicated solutions, e.g. advertise the list of supported formats from
>>>    the start.
> 
> Feels more complicated than necessary.
> 
> Anyway, the idea of creating a blob and then setting that into some KMS
> plane property sounds a very good mechanism.
> 
>>>
>>> [1]: https://gitlab.freedesktop.org/wayland/wayland-protocols/-/merge_requests/104
>>>   
>>
>> Agreeing with most of what you said here. However, what's the idea
>> behind a format anyway? The 4 values provided here are fed directly
>> into the color pipeline which seems to define the color channels it's
>> working on as RGBA (or doesn't define anything at all). The only
>> reason I can think of is that hardware might support only ingesting
>> values either in a format with high bit depth color channels and no
>> alpha or a format with low bit depth color but with alpha, so choosing
>> between the formats provides a real trade-off. Is that actually
>> something hardware might be restricted to or do they all just support
>> ingesting the color data with enough precision on every channel? >
> Right.
> 
> 
> Thanks,
> pq
