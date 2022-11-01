Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 530806150CD
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 18:35:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB69F10E40D;
	Tue,  1 Nov 2022 17:35:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81B6310E40C;
 Tue,  1 Nov 2022 17:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1667324130; x=1698860130;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+oB3JIjCqYiroW70MVyhN2JT3APB6a6Hd9Nqqp/NLNg=;
 b=irT5BFvUVNdUcQMgGiUcoNDfDrNsoAmqQCjdnQv5uVnnUxKts09rGPY9
 osAadML13yngqwAgYK0j6QvvgKtRscbSHEEuLnEHST5+TAio3fX/9OrzQ
 Fc9ZtRLi5PN4G4/lTCNV668TR7PimUbPrdeafTwk5MKXmMOLlXuaUzvBZ M=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 01 Nov 2022 10:35:29 -0700
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2022 10:35:29 -0700
Received: from [10.71.111.47] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Tue, 1 Nov 2022
 10:35:29 -0700
Message-ID: <3f0de4cf-c38e-d4e5-6c0a-dee5667b0186@quicinc.com>
Date: Tue, 1 Nov 2022 10:35:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [RFC PATCH 1/3] drm: Introduce color fill properties for drm plane
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <freedreno@lists.freedesktop.org>
References: <20221028225952.160-1-quic_jesszhan@quicinc.com>
 <20221028225952.160-2-quic_jesszhan@quicinc.com>
 <712a9a25-4c38-9da5-b1a6-39e4665b4d31@linaro.org>
 <b890681d-9c40-32c6-061a-668dce01d89d@quicinc.com>
 <33ed79bf-3a05-0ae9-b3ef-d38608ff5c63@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <33ed79bf-3a05-0ae9-b3ef-d38608ff5c63@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/31/2022 5:11 PM, Dmitry Baryshkov wrote:
> Hi,
> 
> On 01/11/2022 01:24, Jessica Zhang wrote:
>>
>>
>> On 10/29/2022 5:08 AM, Dmitry Baryshkov wrote:
>>> On 29/10/2022 01:59, Jessica Zhang wrote:
>>>> Add support for COLOR_FILL and COLOR_FILL_FORMAT properties for
>>>> drm_plane. In addition, add support for setting and getting the values
>>>> of these properties.
>>>>
>>>> COLOR_FILL represents the color fill of a plane while COLOR_FILL_FORMAT
>>>> represents the format of the color fill. Userspace can set enable solid
>>>> fill on a plane by assigning COLOR_FILL to a uint64_t value, assigning
>>>> the COLOR_FILL_FORMAT property to a uint32_t value, and setting the
>>>> framebuffer to NULL.
>>>>
>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com> >
>>> Planes report supported formats using the drm_mode_getplane(). You'd 
>>> also need to tell userspace, which formats are supported for color 
>>> fill. I don't think one supports e.g. YV12.
>>
>> Hey Dmitry,
>>
>> Good point. Forgot to add this in the patch [3/3] commit message, but 
>> FWIW MSM DPU devices only support the RGB format variants [1].
>>
>> [1] 
>> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c#L697
> 
> Ack. So you'd need to tell this to userspace.
> 
>>
>>>
>>> A bit of generic comment for the discussion (this is an RFC anyway). 
>>> Using color_fill/color_fill_format properties sounds simple, but this 
>>> might be not generic enough. Limiting color_fill to 32 bits would 
>>> prevent anybody from using floating point formats (e.g. 
>>> DRM_FORMAT_XRGB16161616F, 64-bit value). Yes, this can be solved with 
>>> e.g. using 64-bit for the color_fill value, but then this doesn't 
>>> sound extensible too much.
>>
>> Hm... I can definitely change color_fill to use u64 instead. As for 
>> making it more extensible, do you have any suggestions?
> 
> No. Not u64. It is a blob. Basically because when designing API you can 
> not guarantee that all fill values would fit into u64. Also see below.
> 
>>
>>>
>>> So, a question for other hardware maintainers. Do we have hardware 
>>> that supports such 'color filled' planes? Do we want to support 
>>> format modifiers for filling color/data? Because what I have in mind 
>>> is closer to the blob structure, which can then be used for filling 
>>> the plane:
>>>
>>> struct color_fill_blob {
>>>      u32 pixel_format;
>>>      u64 modifiers4];
>>>      u32 pixel_data_size; // fixme: is this necessary?
>>>      u8 pixel_data[];
>>> };
>>
>> Just a question about this blob struct -- what is the purpose of 
>> pixel_data?
>>
>> At least for devices using the DPU driver, the only data needed to 
>> enable solid fill is color_fill and color_fill_format. I'd also be 
>> interested in knowing if there are other drivers support a similar 
>> feature and what is needed for them.
> 
> Yes. You are thinking from the DPU point of view. ARGB only. However as 
> we are adding generic API, we should not limit ourselves to it. Other 
> deivces might support other formats of fill data. For example using 
> YUY2/UYVY for filling the plane. And such YUV data is not a colour 
> anymore. It is a pixel data, just as I named it.
> 
> Another hardware might support some fill patterns. Or e.g. passing a 
> compressed texels/macrotiles. So, pixel data. Note, I've added format 
> modifiers. Maybe `u64 modifiers[4]` is an overkill, as we have just a 
> single data plane. Maybe just `u64 modifier` would be enough.

Got it, I think that's reasonable then.

> 
>>
>>>
>>> And then... This sounds a lot like a custom framebuffer.
>>>
>>> So, maybe what should we do instead is to add new 
>>> DRM_MODE_FB_COLOR_FILL flag to the framebuffers, which would e.g. 
>>> mean that the FB gets stamped all over the plane. This would also 
>>> save us from changing if (!fb) checks all over the drm core.
>>
>> JFYI we did originally consider using a custom 1x1 FB to for color 
>> fill [1], but decided to go with a plane property instead. IIRC the 
>> conclusion was that having color fill as a plane property is a cleaner 
>> solution.
>>
>> As for creating a new blob struct to hold all color fill info, I'm 
>> open to implementing that over having 2 separate properties.
>>
>> [1] https://oftc.irclog.whitequark.org/dri-devel/2022-09-23#31409842
> 
> Let me cite the conclusion form the IRC chat: `22:20 <robclark> 
> abhinav__: kinda.. the proposal was that userspace creates a blob 
> property with the solid fill color, and then attaches the blob-prop id 
> to the plane's FB_ID`.
> 
> It's not a pair of properties. It is a blob, because it is not that 
> limited as the pair of range properties is.
> 
> I will reread the log later, but just my 2c. Attaching the blob property 
> as the FB_ID might confuse userspace. I'd be slightly biased to being 
> more conservative here. However as the final proposal was to attach the 
> blob ID, let's do it this way.

Sounds good. Will spin up a v2 with the prop_blob implementation.

Thanks,

Jessica Zhang

> 
>>
>>>
>>> Another approach might be using a format modifier instead of the FB 
>>> flag.
>> I like the idea of having a format modifier denoting if the driver 
>> supports color_fill for that specific format. This would allow 
>> userspace to know which formats are supported by solid fill planes.
> 
> Yes, exactly. It would come in a natural way.
> 
> [Rumbling: and then it's natural to have the fill data in FB. Dull mode 
> off.]
> 
> -- 
> With best wishes
> Dmitry
> 
