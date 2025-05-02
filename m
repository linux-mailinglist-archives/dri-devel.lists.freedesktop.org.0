Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4187AA7008
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 12:48:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43ABF10E181;
	Fri,  2 May 2025 10:48:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="olQMVSjn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AED9710E181
 for <dri-devel@lists.freedesktop.org>; Fri,  2 May 2025 10:48:29 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 542AliHE3844812
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 2 May 2025 05:47:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1746182864;
 bh=6/abwMTHnVfIv0eF69IxCOb3iAoZ2ZaLHXIfoxgLyi0=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=olQMVSjnU9/Jg4klQwtkF2BqzifX6UsC3njLs2kzk8lONtzrIu2DaNCQq2B9FW1ly
 G+7xfMCxoHAu/ks7x0CgqkANZrgFKyB3CKiGmbq/I6pQmOU3Ymd7LajeYNR8/VhIgT
 wHo/P4BpNF7bsat0N8OwMB2yI8wgUDyFpGEWq9wU=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 542AliCV015505
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 2 May 2025 05:47:44 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 May 2025 05:47:44 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 May 2025 05:47:43 -0500
Received: from [172.24.227.193] (devarsh-precision-tower-3620.dhcp.ti.com
 [172.24.227.193])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 542AlbNI034040;
 Fri, 2 May 2025 05:47:38 -0500
Message-ID: <ca008cb0-bec6-4b10-b6b5-0f29648f76c0@ti.com>
Date: Fri, 2 May 2025 16:17:37 +0530
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH v5 2/3] drm/tidss: Update infrastructure to support K3 DSS
 cut-down versions
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
CC: <praneeth@ti.com>, <vigneshr@ti.com>, <aradhya.bhatia@linux.dev>,
 <s-jain1@ti.com>, <r-donadkar@ti.com>, <j-choudhary@ti.com>,
 <h-shenoy@ti.com>, <jyri.sarha@iki.fi>, <airlied@gmail.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <dri-devel@lists.freedesktop.org>,
 <simona@ffwll.ch>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>
References: <20250429143656.3252877-1-devarsht@ti.com>
 <20250429143656.3252877-3-devarsht@ti.com>
 <f729c0d6-45a0-4610-b22b-92c03f534bf7@ideasonboard.com>
 <1f8c43cd-8c26-4e42-b144-b91f5ffc2e2e@ti.com>
 <88993439-bfdc-418c-95c6-d6d8bdb5b87f@ideasonboard.com>
 <466254e9-145f-4839-9451-a5f282ff02e9@ti.com>
 <ce831f65-67d0-4f4c-9f08-3014b1d00dc0@ideasonboard.com>
Content-Language: en-US
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <ce831f65-67d0-4f4c-9f08-3014b1d00dc0@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Thanks for the quick revert.

On 02/05/25 13:37, Tomi Valkeinen wrote:
> Hi,
> 
> On 02/05/2025 10:06, Devarsh Thakkar wrote:
>> Hi Tomi
>>
>> Thanks for quick comments.
>>
>> On 30/04/25 23:12, Tomi Valkeinen wrote:
>>> On 30/04/2025 19:37, Devarsh Thakkar wrote:
>>>> Hi Tomi
>>>>
>>>> Thanks for the review.
>>>>
>>>> <snip>
>>>>>>     @@ -2025,7 +2101,7 @@ int dispc_plane_check(struct dispc_device
>>>>>> *dispc, u32 hw_plane,
>>>>>>                   const struct drm_plane_state *state,
>>>>>>                   u32 hw_videoport)
>>>>>>     {
>>>>>> -    bool lite = dispc->feat->vid_lite[hw_plane];
>>>>>> +    bool lite = dispc->feat->vid_info[hw_plane].is_lite;
>>>>>
>>>>> I don't think this is correct. You can't access the vid_info[] with
>>>>> the
>>>>> hw-id.
>>>>
>>>> I don't think hw_id is getting passed to hw_plane here. The
>>>> dispc_plane_check is called from tidss_plane_atomic_check which passes
>>>> hw_plane as tplane->hw_plane_id and this index starts from actually
>>>> instantiated planes i.e. from 0 and are contiguous as these are
>>>
>>> Well, if tplane->hw_plane_id is not the HW plane id (i.e. it's misnamed
>>> now), and tidss_plane.c calls dispc_plane_enable() with tplane-
>>>> hw_plane_id as the hw_plane parameter, which is used as a HW plane
>>> ID... Then... One of these is wrong, no?
>>>
>>
>> As mentioned here [1], dispc_plane_enable acts on VID_* registers which
>> are only mapped per the instantiated/actual pipes present in the SoC, so
>> the indexing always starts from 0 and we need not worry about skipping
>> un-instantiated planes.
>>
>> So hw_plane_id -> Index of only instantiated planes starting from 0
>> hw_id -> Hardware Index taking into account instantiated +
>> un-instantiated/skipped planes main used for common0/1 region registers
>> dealing with VID planes.
>>
>>
>> For e.g. for AM62L which includes VIDL pipe
>> hw_plane_id -> 0
>> hw_id -> 1
>>
>>
>>>> populated from vid_order array (hw_plane_id =
>>>> feat->vid_order[tidss->num_planes];) and not the hw_id index.
>>>>
>>>> So for e.g. for AM62L even though hw_id is 1 for VIDL hw_plane is
>>>> getting passed as 0 and that's how it is able to access the first and
>>>> only member of vid_info struct and read the properties correctly and
>>>> function properly as seen in test logs [1].
>>>
>>> If for AM62L the tplane->hw_plane_id is 0, the the dispc_plane_enable()
>>> call would enable the wrong plane, wouldn't it?
>>>
>>> But even if it all works, I think this highlights how confusing it is...
>>>
>>>>
>>>>>
>>>>>>         u32 fourcc = state->fb->format->format;
>>>>>>         bool need_scaling = state->src_w >> 16 != state->crtc_w ||
>>>>>>             state->src_h >> 16 != state->crtc_h;
>>>>>> @@ -2096,7 +2172,7 @@ void dispc_plane_setup(struct dispc_device
>>>>>> *dispc, u32 hw_plane,
>>>>>>                    const struct drm_plane_state *state,
>>>>>>                    u32 hw_videoport)
>>>>>>     {
>>>>>> -    bool lite = dispc->feat->vid_lite[hw_plane];
>>>>>> +    bool lite = dispc->feat->vid_info[hw_plane].is_lite;
>>>>>
>>>>> Here too.
>>>>
>>>> Here also hw_plane is getting passed as 0 and not the hw_id which is 1
>>>> for AM62L.
>>>>
>>>>>
>>>>>>         u32 fourcc = state->fb->format->format;
>>>>>>         u16 cpp = state->fb->format->cpp[0];
>>>>>>         u32 fb_width = state->fb->pitches[0] / cpp;
>>>>>> @@ -2210,7 +2286,7 @@ static void dispc_k2g_plane_init(struct
>>>>>> dispc_device *dispc)
>>>>>>         /* MFLAG_START = MFLAGNORMALSTARTMODE */
>>>>>>         REG_FLD_MOD(dispc, DISPC_GLOBAL_MFLAG_ATTRIBUTE, 0, 6, 6);
>>>>>>     -    for (hw_plane = 0; hw_plane < dispc->feat->num_planes;
>>>>>> hw_plane++) {
>>>>>> +    for (hw_plane = 0; hw_plane < dispc->feat->num_vids;
>>>>>> hw_plane++) {
>>>>>>             u32 size = dispc_vid_get_fifo_size(dispc, hw_plane);
>>>>>>             u32 thr_low, thr_high;
>>>>>>             u32 mflag_low, mflag_high;
>>>>>> @@ -2226,7 +2302,7 @@ static void dispc_k2g_plane_init(struct
>>>>>> dispc_device *dispc)
>>>>>>               dev_dbg(dispc->dev,
>>>>>>                 "%s: bufsize %u, buf_threshold %u/%u, mflag threshold
>>>>>> %u/%u preload %u\n",
>>>>>> -            dispc->feat->vid_name[hw_plane],
>>>>>> +            dispc->feat->vid_info[hw_plane].name,
>>>>>
>>>>> Here hw_plane is not actually the hw-id (anymore), but elsewhere in
>>>>> this
>>>>> function it is used as a hw-id, which is no longer correct.
>>>>
>>>> For accessing vid_info hw_plane needs to be used which is the index of
>>>> actually instantiated planes and I see it as correctly being passed for
>>>> AM62L too. hw_id is only for dispc_k3_vid* functions where we need to
>>>> skip the not-instantiated vid regions by adding the offset per the
>>>> hw_id
>>>> index.
>>>
>>> Hmm, sorry, I don't follow. If we use the same variable, hw_plane, to
>>> access the vid_info[], and as a parameter to functions that take
>>> hw_plane, e.g., dispc_vid_set_buf_threshold(), isn't one of those uses
>>> wrong?
>>>
>>> Oh, wait... I think I see it now. For some functions using the hw_id as
>>> the hw_plane parameter is fine, as they access the VID's registers by
>>> just using, e.g. dispc_vid_write(), which gets the address correctly
>>> from dispc->base_vid[hw_plane], as that one is indexed from 0 to
>>> num_vids.
>>>
>>
>> Yes exactly.
>>
>>> But some functions use registers that have bits based on the hw_id (like
>>> dispc_k3_vid_write_irqstatus), and then we use the hw_id for the
>>> hw_plane parameter. If that function were to also write a vid register,
>>> using the passed hw_plane, it wouldn't work, but I guess we don't do
>>> that.
>>>
>>
>> Yes, hw_id is only for dispc_k3_vid* functions dealing with common
>> region registers that play with VID pipes.
>>
>>> It feels broken... We can't have 'hw_plane' that's sometimes the HW id
>>> (i.e. 1 for AM62L), and sometimes the driver's index (i.e. 0 for AM62L).
>>>
>>
>> Sorry I don't follow, what exactly is broken here. hw_plane is for
>> instantiated planes present in SoC used in context of VID* register
>> space while doing reg writess and hw_id is the plane hardware index
>> w.r.t larger K3 family i.e used in context for common register space.
> 
> We have, as an example, these two functions:
> 
> void dispc_plane_enable(struct dispc_device *dispc, u32 hw_plane, bool
> enable)
> 
> static void dispc_k3_vid_write_irqstatus(struct dispc_device *dispc, u32
> hw_plane, dispc_irq_t vidstat)
> 
> When the caller calls these functions on AM62L, what does it provide in
> 'hw_plane' when it wants to enable the first plane of write the
> irqstatus for the first plane? 

It uses hw_id i.e. 1 for all vid irqstatus related registers since it is
accessing am65x common region register space which has vid on idx0 which
we want to skip for am62l.

For dispc_plane_enable(), the caller uses
> 0, for dispc_k3_vid_write_irqstatus(), the caller uses 1...

Yes above is correct, and I think that's how it is supposed to be.

> 
> With a quick look at the code, changing the callers to pass the "old
> style" hw_plane as the parameter to those irq functions, and the
> functions internally get the hw_id, would solve most of the problems.

I don't follow above, hw_plane has 0 so it should not be used for
programming irq related functions which expect idx 1 as explained above.

> There's still dispc_k3_set_irqenable() which manages 'main_disable' and
> needs the hw_id, but maybe that's fine, even if a bit confusing.
> 

I still feel there is no inherent bug here, but let me know if you want
me to put some debug prints or get register dump so that we can double
confirm.

Regards
Devarsh
>  Tomi
> 

