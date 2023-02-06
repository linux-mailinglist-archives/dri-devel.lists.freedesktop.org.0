Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5249F68C556
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 19:02:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2210110E42E;
	Mon,  6 Feb 2023 18:02:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E648110E42E
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Feb 2023 18:02:02 +0000 (UTC)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi
 [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 25C624DA;
 Mon,  6 Feb 2023 19:02:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1675706521;
 bh=oo6MHAcMuopZkUN1KuzkgmsAsw83OHcriy3TYLY5hKk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=RlM1d69q/koXxpXrLwwnhiRnR5SLBfLGBcSotRv19WEdmMV2O+D85kYYhoSj6BtDn
 D9Nyzaa2NxMhOTMoLMsfdqfu7MvHm0ZB2SKYt1DVrol3Iq9CSKsvj32AtOgS4C515/
 wu3UQyp8i6DOKQtiuBFrWWQC+O0joPoPhaTmhnWY=
Message-ID: <9756884e-af5a-10df-a01b-9f4752ba894c@ideasonboard.com>
Date: Mon, 6 Feb 2023 20:01:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v7 1/6] drm/tidss: Remove Video Port to Output Port
 coupling
Content-Language: en-US
To: Aradhya Bhatia <a-bhatia1@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jyri Sarha <jyri.sarha@iki.fi>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230125113529.13952-1-a-bhatia1@ti.com>
 <20230125113529.13952-2-a-bhatia1@ti.com>
 <300c0351-6ee0-d703-bd53-bc4c0fe3af0f@ideasonboard.com>
 <94cf519a-a72f-89d8-fe2a-9fa795ede6ac@ti.com>
 <c858250d-1406-dc3d-58d7-687cd891e7a5@ideasonboard.com>
 <d352043e-9101-e191-dd67-b88fb1cfdf92@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <d352043e-9101-e191-dd67-b88fb1cfdf92@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Nishanth Menon <nm@ti.com>, Devicetree List <devicetree@vger.kernel.org>,
 Jayesh Choudhary <j-choudhary@ti.com>, Jai Luthra <j-luthra@ti.com>,
 Rahul T R <r-ravikumar@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Vignesh Raghavendra <vigneshr@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/02/2023 19:34, Aradhya Bhatia wrote:
> 
> On 06-Feb-23 18:35, Tomi Valkeinen wrote:
>> On 05/02/2023 15:08, Aradhya Bhatia wrote:
>>> Hi Tomi,
>>>
>>> Thanks for the review!
>>>
>>> On 03-Feb-23 16:53, Tomi Valkeinen wrote:
>>>> On 25/01/2023 13:35, Aradhya Bhatia wrote:
>>>>> Make DSS Video Ports agnostic of output bus types.
>>>>>
>>>>> DSS controllers have had a 1-to-1 coupling between its VPs and its
>>>>> output ports. This no longer stands true for the new AM625 DSS. This
>>>>> coupling, hence, has been removed by renaming the 'vp_bus_type' to
>>>>> 'output_port_bus_type' because the VPs are essentially agnostic of the
>>>>> bus type and it is the output ports which have a bus type.
>>>>>
>>>>> The AM625 DSS has 2 VPs but requires 3 output ports to support its
>>>>> Dual-Link OLDI video output coming from a single VP.
>>>>
>>>> Not a biggie, but this sentence is a bit odd here at the end. Shouldn't
>>>> it be after the "...stands true for the new AM625 DSS."?
>>>
>>> Yes! It should be. Will make the edit.
>>>
>>>>
>>>>> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
>>>>> ---
>>>>>     drivers/gpu/drm/tidss/tidss_dispc.c | 47 +++++++++++++++++------------
>>>>>     drivers/gpu/drm/tidss/tidss_dispc.h | 21 +++++++------
>>>>>     drivers/gpu/drm/tidss/tidss_drv.h   |  5 +--
>>>>>     drivers/gpu/drm/tidss/tidss_irq.h   |  2 +-
>>>>>     drivers/gpu/drm/tidss/tidss_kms.c   | 12 ++++----
>>>>>     5 files changed, 48 insertions(+), 39 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
>>>>> index 165365b515e1..c1c4faccbddc 100644
>>>>> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
>>>>> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
>>>>> @@ -61,7 +61,7 @@ const struct dispc_features dispc_k2g_feats = {
>>>>>         .min_pclk_khz = 4375,
>>>>>           .max_pclk_khz = {
>>>>> -        [DISPC_VP_DPI] = 150000,
>>>>> +        [DISPC_PORT_DPI] = 150000,
>>>>>         },
>>>>>           /*
>>>>> @@ -96,7 +96,6 @@ const struct dispc_features dispc_k2g_feats = {
>>>>>         .vp_name = { "vp1" },
>>>>>         .ovr_name = { "ovr1" },
>>>>>         .vpclk_name =  { "vp1" },
>>>>> -    .vp_bus_type = { DISPC_VP_DPI },
>>>>>           .vp_feat = { .color = {
>>>>>                 .has_ctm = true,
>>>>> @@ -109,6 +108,9 @@ const struct dispc_features dispc_k2g_feats = {
>>>>>         .vid_name = { "vid1" },
>>>>>         .vid_lite = { false },
>>>>>         .vid_order = { 0 },
>>>>> +
>>>>> +    .num_output_ports = 1,
>>>>> +    .output_port_bus_type = { DISPC_PORT_DPI },
>>>>>     };
>>>>
>>>> Just thinking out loud, as these will get more complex in the future,
>>>> maybe we should finally group them with struct. E.g. we could define
>>>> struct array for vps, like (just hacky example):
>>>>
>>>>       struct {
>>>>           const char *name;
>>>>           const char *clkname;
>>>>           struct tidss_vp_feat feat;
>>>>       } vps[TIDSS_MAX_PORTS];
>>>>
>>>> and then use them as:
>>>>
>>>>       .vps = {
>>>>           {
>>>>               .name = "kala",
>>>>               .clkname = "kissa",
>>>>               .feat.color.has_ctm = true,
>>>>           }, {
>>>>               .name = "kala2",
>>>>               .clkname = "kissa2",
>>>>               .feat.color.has_ctm = false,
>>>>           },
>>>>       },
>>>>
>>>> Perhaps something to try in the future.
>>>>
>>>
>>> Yes, agreed! Having that structure will tidy this up.
>>> I will keep this under future work.
>>>
>>>>>     static const u16 tidss_am65x_common_regs[DISPC_COMMON_REG_TABLE_LEN] = {
>>>>> @@ -140,8 +142,8 @@ static const u16 tidss_am65x_common_regs[DISPC_COMMON_REG_TABLE_LEN] = {
>>>>>       const struct dispc_features dispc_am65x_feats = {
>>>>>         .max_pclk_khz = {
>>>>> -        [DISPC_VP_DPI] = 165000,
>>>>> -        [DISPC_VP_OLDI] = 165000,
>>>>> +        [DISPC_PORT_DPI] = 165000,
>>>>> +        [DISPC_PORT_OLDI] = 165000,
>>>>>         },
>>>>>           .scaling = {
>>>>> @@ -171,7 +173,6 @@ const struct dispc_features dispc_am65x_feats = {
>>>>>         .vp_name = { "vp1", "vp2" },
>>>>>         .ovr_name = { "ovr1", "ovr2" },
>>>>>         .vpclk_name =  { "vp1", "vp2" },
>>>>> -     .vp_bus_type = { DISPC_VP_OLDI, DISPC_VP_DPI },
>>>>>         .vp_feat = { .color = {
>>>>>                 .has_ctm = true,
>>>>> @@ -185,6 +186,9 @@ const struct dispc_features dispc_am65x_feats = {
>>>>>         .vid_name = { "vid", "vidl1" },
>>>>>         .vid_lite = { false, true, },
>>>>>         .vid_order = { 1, 0 },
>>>>> +
>>>>> +    .num_output_ports = 2,
>>>>> +    .output_port_bus_type = { DISPC_PORT_OLDI, DISPC_PORT_DPI },
>>>>>     };
>>>>>       static const u16 tidss_j721e_common_regs[DISPC_COMMON_REG_TABLE_LEN] = {
>>>>> @@ -229,8 +233,8 @@ static const u16 tidss_j721e_common_regs[DISPC_COMMON_REG_TABLE_LEN] = {
>>>>>       const struct dispc_features dispc_j721e_feats = {
>>>>>         .max_pclk_khz = {
>>>>> -        [DISPC_VP_DPI] = 170000,
>>>>> -        [DISPC_VP_INTERNAL] = 600000,
>>>>> +        [DISPC_PORT_DPI] = 170000,
>>>>> +        [DISPC_PORT_INTERNAL] = 600000,
>>>>>         },
>>>>>           .scaling = {
>>>>> @@ -260,9 +264,7 @@ const struct dispc_features dispc_j721e_feats = {
>>>>>         .vp_name = { "vp1", "vp2", "vp3", "vp4" },
>>>>>         .ovr_name = { "ovr1", "ovr2", "ovr3", "ovr4" },
>>>>>         .vpclk_name = { "vp1", "vp2", "vp3", "vp4" },
>>>>> -    /* Currently hard coded VP routing (see dispc_initial_config()) */
>>>>> -    .vp_bus_type =    { DISPC_VP_INTERNAL, DISPC_VP_DPI,
>>>>> -              DISPC_VP_INTERNAL, DISPC_VP_DPI, },
>>>>> +
>>>>
>>>> I think this line feed is extra.
>>>
>>> Okay! Will remove that from all SoC feat structs.
>>>
>>>>
>>>>>         .vp_feat = { .color = {
>>>>>                 .has_ctm = true,
>>>>>                 .gamma_size = 1024,
>>>>> @@ -273,6 +275,11 @@ const struct dispc_features dispc_j721e_feats = {
>>>>>         .vid_name = { "vid1", "vidl1", "vid2", "vidl2" },
>>>>>         .vid_lite = { 0, 1, 0, 1, },
>>>>>         .vid_order = { 1, 3, 0, 2 },
>>>>> +
>>>>> +    .num_output_ports = 4,
>>>>> +    /* Currently hard coded VP routing (see dispc_initial_config()) */
>>>>> +    .output_port_bus_type =    { DISPC_PORT_INTERNAL, DISPC_PORT_DPI,
>>>>> +              DISPC_PORT_INTERNAL, DISPC_PORT_DPI, },
>>>>
>>>> Indent doesn't look right (but it might be just because this is a diff).
>>>
>>> I may have missed indenting this.
>>>
>>>>
>>>>>     };
>>>>>       static const u16 *dispc_common_regmap;
>>>>> @@ -287,12 +294,12 @@ struct dispc_device {
>>>>>        void __iomem *base_common;
>>>>>        void __iomem *base_vid[TIDSS_MAX_PLANES];
>>>>> -    void __iomem *base_ovr[TIDSS_MAX_PORTS];
>>>>> -    void __iomem *base_vp[TIDSS_MAX_PORTS];
>>>>> +    void __iomem *base_ovr[TIDSS_MAX_VPS];
>>>>> +    void __iomem *base_vp[TIDSS_MAX_VPS];
>>>>>        struct regmap *oldi_io_ctrl;
>>>>> -    struct clk *vp_clk[TIDSS_MAX_PORTS];
>>>>> +    struct clk *vp_clk[TIDSS_MAX_VPS];
>>>>>           const struct dispc_features *feat;
>>>>>     @@ -300,7 +307,7 @@ struct dispc_device {
>>>>>           bool is_enabled;
>>>>> -    struct dss_vp_data vp_data[TIDSS_MAX_PORTS];
>>>>> +    struct dss_vp_data vp_data[TIDSS_MAX_VPS];
>>>>>           u32 *fourccs;
>>>>>         u32 num_fourccs;
>>>>> @@ -851,7 +858,7 @@ int dispc_vp_bus_check(struct dispc_device *dispc, u32 hw_videoport,
>>>>>             return -EINVAL;
>>>>>         }
>>>>> -    if (dispc->feat->vp_bus_type[hw_videoport] != DISPC_VP_OLDI &&
>>>>> +    if (dispc->feat->output_port_bus_type[hw_videoport] != DISPC_PORT_OLDI &&
>>>>
>>>> Hmm, so is the hw_videoport a vp index or an output index? Sounds like
>>>> the former, so it's not right, even if at the moment they're identical.
>>>> We need some kind of mapping between those.
>>>>
>>>
>>> It is indeed a vp index. And yes, I can come up with a mapping mechanism.
>>>
>>>> If the mapping can be changed (or just defined in the DT), I think we
>>>> need a variable in struct dispc_device, which tells the output to which
>>>> a videoport is connected to. Or vice versa, I'm not sure which direction
>>>> we need more. If the mapping is always the same on all SoC (but I don't
>>>> think so), we can have it in the feats.
>>>>
>>>
>>> As of now, the mapping is always same. But I would like to make is
>>> generalized for future. Hence, I am considering to keep the variable in
>>> struct dispc_device.
>>>
>>> My question though would be, how would one be able to find which kind
>>> of device is the port connected to, if it is connected to a bridge? For
>>> example, in case of panels, we have a "connector_type" variable in
>>> drm_panel which tells what kind of sink it is. But there is no such
>>> thing in drm_bridge.
>>>
>>> This is required because what if we can connect an videoport to either
>>> an LVDS/OLDI bridge or a DPI bridge.
>>
>> The connector type shouldn't matter.
>>
>> The DSS has VPs and outputs. The VPs are "generic" and identical to each
>> other, except in their possible connections to the outputs. The outputs,
>> at least at the moment, are DPI, LVDS and internal, where internal is
>> basically just DPI.
>>
>> Those are the three different cases we are interested in within the dss
>> driver, right? Does it matter where the DPI or LVDS output goes?
>>
> 
> I believe it does. =)
> 
> While the VPs do always transmit DPI signals, the code in tidss_dispc.c
> uses the information of the bus connected at the endpoint to configure
> the OLDI parameters, and to turn OLDI IOs on and off in
> dispc_vp_(prepare/unprepare).
> 
> Up until now, the outputs have been fixed (VP0 -> OLDI, VP1 -> DPI), and
> the code used the enum dispc_vp_bus_type to differntiate between LVDS or
> DPI requirements. But for a general case where output from VP0 could
> either use the OLDI TXes and send out LVDS signals OR bypass the OLDI
> TXes and send out DPI signals directly, we would need a mechanism to
> find out which sink is present at the end, LVDS or DPI.
> 
> I assumed, with that mechanism, we could (re)configure the vp-to-output
> mapping, which then would be used in the various places in
> tidss_dispc.c.

But we should already know all that. Say, on AM625, we have three ports 
(or "outputs") (defined in DT), OLDI1, DPI, OLDI2. If there's an 
endpoint configured for the first port, we know we need to set up OLDI, 
and we need a VP for it. If the hardware mapping between VPs and outputs 
is hardcoded, we know directly that VP0 is needed, and it's used for 
OLDI. So now we have the mapping of VP0 -> OLDI (port1).

If (say) VP0 could alternatively be used for DPI output, then we'd see 
the second port, DPI, having an endpoint configured. Having both OLDI1 
and DPI endpoints would be invalid, of course.

So "how would one be able to find which kind of device is the port 
connected to" is irrelevant, I think. We know the output port, so we 
know the bus type, and we don't really need to know anything else about 
what's there behind the bus.

Or is there some detail I'm missing here?

  Tomi

