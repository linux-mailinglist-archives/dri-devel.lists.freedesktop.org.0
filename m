Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D93A0AA6B4A
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 09:07:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B39410E8B3;
	Fri,  2 May 2025 07:07:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="C5Rth0gY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1DA810E8B3
 for <dri-devel@lists.freedesktop.org>; Fri,  2 May 2025 07:07:41 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5427719p3808923
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 2 May 2025 02:07:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1746169621;
 bh=5lPdpWg8+WzMVw9zUJXF6y/4UeJT5ewBY7WGRIOZsbI=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=C5Rth0gY4R6uMVj5PKW0G/IlRjfly+q4I+p1NZYj2sYGRAqUhNr2KNl1+HDmTDUjk
 EJXYzmbX2ntSleW8F5oGzS5p9ZfDEWq5Ph6vU5I26w0I9i1BCFXWnRZvTzniiwezG6
 9mVTiMf/slEpE2UPvoYHw5Sy5yLq98M3rLXyKHEM=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 542771We047774
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 2 May 2025 02:07:01 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 May 2025 02:07:01 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 May 2025 02:07:01 -0500
Received: from [172.24.227.193] (devarsh-precision-tower-3620.dhcp.ti.com
 [172.24.227.193])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54276tvr034332;
 Fri, 2 May 2025 02:06:55 -0500
Message-ID: <466254e9-145f-4839-9451-a5f282ff02e9@ti.com>
Date: Fri, 2 May 2025 12:36:54 +0530
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
Content-Language: en-US
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <88993439-bfdc-418c-95c6-d6d8bdb5b87f@ideasonboard.com>
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

Hi Tomi

Thanks for quick comments.

On 30/04/25 23:12, Tomi Valkeinen wrote:
> On 30/04/2025 19:37, Devarsh Thakkar wrote:
>> Hi Tomi
>>
>> Thanks for the review.
>>
>> <snip>
>>>>    @@ -2025,7 +2101,7 @@ int dispc_plane_check(struct dispc_device
>>>> *dispc, u32 hw_plane,
>>>>                  const struct drm_plane_state *state,
>>>>                  u32 hw_videoport)
>>>>    {
>>>> -    bool lite = dispc->feat->vid_lite[hw_plane];
>>>> +    bool lite = dispc->feat->vid_info[hw_plane].is_lite;
>>>
>>> I don't think this is correct. You can't access the vid_info[] with the
>>> hw-id.
>>
>> I don't think hw_id is getting passed to hw_plane here. The
>> dispc_plane_check is called from tidss_plane_atomic_check which passes
>> hw_plane as tplane->hw_plane_id and this index starts from actually
>> instantiated planes i.e. from 0 and are contiguous as these are
> 
> Well, if tplane->hw_plane_id is not the HW plane id (i.e. it's misnamed
> now), and tidss_plane.c calls dispc_plane_enable() with tplane-
>>hw_plane_id as the hw_plane parameter, which is used as a HW plane
> ID... Then... One of these is wrong, no?
> 

As mentioned here [1], dispc_plane_enable acts on VID_* registers which
are only mapped per the instantiated/actual pipes present in the SoC, so
the indexing always starts from 0 and we need not worry about skipping
un-instantiated planes.

So hw_plane_id -> Index of only instantiated planes starting from 0
hw_id -> Hardware Index taking into account instantiated +
un-instantiated/skipped planes main used for common0/1 region registers
dealing with VID planes.


For e.g. for AM62L which includes VIDL pipe
hw_plane_id -> 0
hw_id -> 1


>> populated from vid_order array (hw_plane_id =
>> feat->vid_order[tidss->num_planes];) and not the hw_id index.
>>
>> So for e.g. for AM62L even though hw_id is 1 for VIDL hw_plane is
>> getting passed as 0 and that's how it is able to access the first and
>> only member of vid_info struct and read the properties correctly and
>> function properly as seen in test logs [1].
> 
> If for AM62L the tplane->hw_plane_id is 0, the the dispc_plane_enable()
> call would enable the wrong plane, wouldn't it?
> 
> But even if it all works, I think this highlights how confusing it is...
> 
>>
>>>
>>>>        u32 fourcc = state->fb->format->format;
>>>>        bool need_scaling = state->src_w >> 16 != state->crtc_w ||
>>>>            state->src_h >> 16 != state->crtc_h;
>>>> @@ -2096,7 +2172,7 @@ void dispc_plane_setup(struct dispc_device
>>>> *dispc, u32 hw_plane,
>>>>                   const struct drm_plane_state *state,
>>>>                   u32 hw_videoport)
>>>>    {
>>>> -    bool lite = dispc->feat->vid_lite[hw_plane];
>>>> +    bool lite = dispc->feat->vid_info[hw_plane].is_lite;
>>>
>>> Here too.
>>
>> Here also hw_plane is getting passed as 0 and not the hw_id which is 1
>> for AM62L.
>>
>>>
>>>>        u32 fourcc = state->fb->format->format;
>>>>        u16 cpp = state->fb->format->cpp[0];
>>>>        u32 fb_width = state->fb->pitches[0] / cpp;
>>>> @@ -2210,7 +2286,7 @@ static void dispc_k2g_plane_init(struct
>>>> dispc_device *dispc)
>>>>        /* MFLAG_START = MFLAGNORMALSTARTMODE */
>>>>        REG_FLD_MOD(dispc, DISPC_GLOBAL_MFLAG_ATTRIBUTE, 0, 6, 6);
>>>>    -    for (hw_plane = 0; hw_plane < dispc->feat->num_planes;
>>>> hw_plane++) {
>>>> +    for (hw_plane = 0; hw_plane < dispc->feat->num_vids; hw_plane++) {
>>>>            u32 size = dispc_vid_get_fifo_size(dispc, hw_plane);
>>>>            u32 thr_low, thr_high;
>>>>            u32 mflag_low, mflag_high;
>>>> @@ -2226,7 +2302,7 @@ static void dispc_k2g_plane_init(struct
>>>> dispc_device *dispc)
>>>>              dev_dbg(dispc->dev,
>>>>                "%s: bufsize %u, buf_threshold %u/%u, mflag threshold
>>>> %u/%u preload %u\n",
>>>> -            dispc->feat->vid_name[hw_plane],
>>>> +            dispc->feat->vid_info[hw_plane].name,
>>>
>>> Here hw_plane is not actually the hw-id (anymore), but elsewhere in this
>>> function it is used as a hw-id, which is no longer correct.
>>
>> For accessing vid_info hw_plane needs to be used which is the index of
>> actually instantiated planes and I see it as correctly being passed for
>> AM62L too. hw_id is only for dispc_k3_vid* functions where we need to
>> skip the not-instantiated vid regions by adding the offset per the hw_id
>> index.
> 
> Hmm, sorry, I don't follow. If we use the same variable, hw_plane, to
> access the vid_info[], and as a parameter to functions that take
> hw_plane, e.g., dispc_vid_set_buf_threshold(), isn't one of those uses
> wrong?
> 
> Oh, wait... I think I see it now. For some functions using the hw_id as
> the hw_plane parameter is fine, as they access the VID's registers by
> just using, e.g. dispc_vid_write(), which gets the address correctly
> from dispc->base_vid[hw_plane], as that one is indexed from 0 to num_vids.
> 

Yes exactly.

> But some functions use registers that have bits based on the hw_id (like
> dispc_k3_vid_write_irqstatus), and then we use the hw_id for the
> hw_plane parameter. If that function were to also write a vid register,
> using the passed hw_plane, it wouldn't work, but I guess we don't do that.
> 

Yes, hw_id is only for dispc_k3_vid* functions dealing with common
region registers that play with VID pipes.

> It feels broken... We can't have 'hw_plane' that's sometimes the HW id
> (i.e. 1 for AM62L), and sometimes the driver's index (i.e. 0 for AM62L).
> 

Sorry I don't follow, what exactly is broken here. hw_plane is for
instantiated planes present in SoC used in context of VID* register
space while doing reg writess and hw_id is the plane hardware index
w.r.t larger K3 family i.e used in context for common register space.

>>>
>>>>                size,
>>>>                thr_high, thr_low,
>>>>                mflag_high, mflag_low,
>>>> @@ -2265,7 +2341,7 @@ static void dispc_k3_plane_init(struct
>>>> dispc_device *dispc)
>>>>        /* MFLAG_START = MFLAGNORMALSTARTMODE */
>>>>        REG_FLD_MOD(dispc, DISPC_GLOBAL_MFLAG_ATTRIBUTE, 0, 6, 6);
>>>>    -    for (hw_plane = 0; hw_plane < dispc->feat->num_planes;
>>>> hw_plane++) {
>>>> +    for (hw_plane = 0; hw_plane < dispc->feat->num_vids; hw_plane++) {
>>>>            u32 size = dispc_vid_get_fifo_size(dispc, hw_plane);
>>>>            u32 thr_low, thr_high;
>>>>            u32 mflag_low, mflag_high;
>>>> @@ -2281,7 +2357,7 @@ static void dispc_k3_plane_init(struct
>>>> dispc_device *dispc)
>>>>              dev_dbg(dispc->dev,
>>>>                "%s: bufsize %u, buf_threshold %u/%u, mflag threshold
>>>> %u/%u preload %u\n",
>>>> -            dispc->feat->vid_name[hw_plane],
>>>> +            dispc->feat->vid_info[hw_plane].name,
>>>
>>> And here.
>>>
>>> All these issues make me wonder whether we have the right model. It's
>>> just too easy to get the usage wrong.
>>>
>>> I'm not sure which way to go here.
>>>
>>> Fix the current issues? It's a bit cumbersome to go from hw-id to the
>>> index (needs a search), just to get some hw properties.
>>>
>>> Or go back to the earlier one, with a vid array containing unused slots?
>>> That makes the for loops a bit harder.
>>>
>>> I need to think about it...
>>>
>>
>> Hmm, I don't think so, it seems to look fine to me and work fine too. I
>> have tested thoroughly for AM62L (which has uninstantiated vid region)
>> along with AM62x and AM62A with all planes displayed simultaneously. If
>> you want I can put on some test logs, create some dummy holes for VID
>> regions in AM62 and AM62A to put this on to some further negative tests.
>>
>> Also if naming convention is confusing (hw_id vs hw_plane) then maybe we
>> can use something else like vid_idx ??
> 
> It is confusing. But I think it's also broken, in the sense that e.g.
> dispc_k3_vid_write_irqstatus() has hw_plane parameter. But it's actually
> hw_id.
> 
> I'm not sure if naming them differently helps here. It's super
> confusing. What indices do we have?
> 
> - The lowest level HW IDs, e.g. for DISPC_VID_IRQSTATUS()
> - The index for the dispc->vid_info[]
> - The index to tidss->planes[]
> - drm_plane->index
> 

All above are for the instantiated ones so they start from 0.
Since we decide to use "common region" of AM65x family as you suggested
in V1 review comments [2] we need to handle the caveats associated with
VID and VIDL register bits for this common region only w.r.t SoCs which
don't include both of them.

So for e.g. am65x common region include both VID (idx0) and VIDL (idx1)
but am62L does not have VID, but the offset and bit indexing for VIDL in
both  AM65X and AM62L is still the same i.e. idx VIDL.


> Originally I kept the drm_plane and the HW index separate, so that the
> dispc.c doesn't really deal with the drm_plane at all. But I wonder if
> we need to change that, as drm_plane pointer can't really be
> "understood" wrong, whereas an two indices are easy to mix.
> 

Sorry I don't follow exactly on concern above and I am not able to catch
any bugs either in the testing done so far in multiple SoCs. If you see
any potential issue or a negative scenario I can help put debug logs or
provide a register dump.


For the naming if this is confusing, is cmn_vid_idx a better name to
highlight that it only deals with vid/vidl specific indexing and
register/bit writes for common region ?

[1] https://lore.kernel.org/all/096ff788-7a25-47a3-ad13-caff971cf0bc@ti.com/
[2]
https://lore.kernel.org/all/f6b20a29-1205-4f5e-87b6-fec58bd43545@ideasonboard.com/

Regards
Devarsh

>  Tomi
> 

