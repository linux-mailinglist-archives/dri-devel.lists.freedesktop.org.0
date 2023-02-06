Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E195768BD7C
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 14:06:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DF9410E3C4;
	Mon,  6 Feb 2023 13:06:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C776F10E3C4
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Feb 2023 13:05:58 +0000 (UTC)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi
 [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 206C34DA;
 Mon,  6 Feb 2023 14:05:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1675688757;
 bh=IhSU+fSVgF1d+b2HqHDAubu4lYS9Osndjugth33p8w4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=aRofLLz+UsoWVPZARxJDiohBFJe9T3xEFdez/BIvDvBvjPuqSZ6o8CeC33HmxmMoP
 aD1pYkpdRZTELPdNdlej2aLri9GdkLfCz5b+Cucc7KJnkvF1t2Ii9farB3pbXC43Vl
 7J8yX8juutVAr2BZx0e8Y6jaSBBMD7vSyldZhdJE=
Message-ID: <c858250d-1406-dc3d-58d7-687cd891e7a5@ideasonboard.com>
Date: Mon, 6 Feb 2023 15:05:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v7 1/6] drm/tidss: Remove Video Port to Output Port
 coupling
To: Aradhya Bhatia <a-bhatia1@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jyri Sarha <jyri.sarha@iki.fi>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230125113529.13952-1-a-bhatia1@ti.com>
 <20230125113529.13952-2-a-bhatia1@ti.com>
 <300c0351-6ee0-d703-bd53-bc4c0fe3af0f@ideasonboard.com>
 <94cf519a-a72f-89d8-fe2a-9fa795ede6ac@ti.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <94cf519a-a72f-89d8-fe2a-9fa795ede6ac@ti.com>
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

On 05/02/2023 15:08, Aradhya Bhatia wrote:
> Hi Tomi,
> 
> Thanks for the review!
> 
> On 03-Feb-23 16:53, Tomi Valkeinen wrote:
>> On 25/01/2023 13:35, Aradhya Bhatia wrote:
>>> Make DSS Video Ports agnostic of output bus types.
>>>
>>> DSS controllers have had a 1-to-1 coupling between its VPs and its
>>> output ports. This no longer stands true for the new AM625 DSS. This
>>> coupling, hence, has been removed by renaming the 'vp_bus_type' to
>>> 'output_port_bus_type' because the VPs are essentially agnostic of the
>>> bus type and it is the output ports which have a bus type.
>>>
>>> The AM625 DSS has 2 VPs but requires 3 output ports to support its
>>> Dual-Link OLDI video output coming from a single VP.
>>
>> Not a biggie, but this sentence is a bit odd here at the end. Shouldn't
>> it be after the "...stands true for the new AM625 DSS."?
> 
> Yes! It should be. Will make the edit.
> 
>>
>>> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
>>> ---
>>>    drivers/gpu/drm/tidss/tidss_dispc.c | 47 +++++++++++++++++------------
>>>    drivers/gpu/drm/tidss/tidss_dispc.h | 21 +++++++------
>>>    drivers/gpu/drm/tidss/tidss_drv.h   |  5 +--
>>>    drivers/gpu/drm/tidss/tidss_irq.h   |  2 +-
>>>    drivers/gpu/drm/tidss/tidss_kms.c   | 12 ++++----
>>>    5 files changed, 48 insertions(+), 39 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
>>> index 165365b515e1..c1c4faccbddc 100644
>>> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
>>> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
>>> @@ -61,7 +61,7 @@ const struct dispc_features dispc_k2g_feats = {
>>>        .min_pclk_khz = 4375,
>>>          .max_pclk_khz = {
>>> -        [DISPC_VP_DPI] = 150000,
>>> +        [DISPC_PORT_DPI] = 150000,
>>>        },
>>>          /*
>>> @@ -96,7 +96,6 @@ const struct dispc_features dispc_k2g_feats = {
>>>        .vp_name = { "vp1" },
>>>        .ovr_name = { "ovr1" },
>>>        .vpclk_name =  { "vp1" },
>>> -    .vp_bus_type = { DISPC_VP_DPI },
>>>          .vp_feat = { .color = {
>>>                .has_ctm = true,
>>> @@ -109,6 +108,9 @@ const struct dispc_features dispc_k2g_feats = {
>>>        .vid_name = { "vid1" },
>>>        .vid_lite = { false },
>>>        .vid_order = { 0 },
>>> +
>>> +    .num_output_ports = 1,
>>> +    .output_port_bus_type = { DISPC_PORT_DPI },
>>>    };
>>
>> Just thinking out loud, as these will get more complex in the future,
>> maybe we should finally group them with struct. E.g. we could define
>> struct array for vps, like (just hacky example):
>>
>>      struct {
>>          const char *name;
>>          const char *clkname;
>>          struct tidss_vp_feat feat;
>>      } vps[TIDSS_MAX_PORTS];
>>
>> and then use them as:
>>
>>      .vps = {
>>          {
>>              .name = "kala",
>>              .clkname = "kissa",
>>              .feat.color.has_ctm = true,
>>          }, {
>>              .name = "kala2",
>>              .clkname = "kissa2",
>>              .feat.color.has_ctm = false,
>>          },
>>      },
>>
>> Perhaps something to try in the future.
>>
> 
> Yes, agreed! Having that structure will tidy this up.
> I will keep this under future work.
> 
>>>    static const u16 tidss_am65x_common_regs[DISPC_COMMON_REG_TABLE_LEN] = {
>>> @@ -140,8 +142,8 @@ static const u16 tidss_am65x_common_regs[DISPC_COMMON_REG_TABLE_LEN] = {
>>>      const struct dispc_features dispc_am65x_feats = {
>>>        .max_pclk_khz = {
>>> -        [DISPC_VP_DPI] = 165000,
>>> -        [DISPC_VP_OLDI] = 165000,
>>> +        [DISPC_PORT_DPI] = 165000,
>>> +        [DISPC_PORT_OLDI] = 165000,
>>>        },
>>>          .scaling = {
>>> @@ -171,7 +173,6 @@ const struct dispc_features dispc_am65x_feats = {
>>>        .vp_name = { "vp1", "vp2" },
>>>        .ovr_name = { "ovr1", "ovr2" },
>>>        .vpclk_name =  { "vp1", "vp2" },
>>> -     .vp_bus_type = { DISPC_VP_OLDI, DISPC_VP_DPI },
>>>        .vp_feat = { .color = {
>>>                .has_ctm = true,
>>> @@ -185,6 +186,9 @@ const struct dispc_features dispc_am65x_feats = {
>>>        .vid_name = { "vid", "vidl1" },
>>>        .vid_lite = { false, true, },
>>>        .vid_order = { 1, 0 },
>>> +
>>> +    .num_output_ports = 2,
>>> +    .output_port_bus_type = { DISPC_PORT_OLDI, DISPC_PORT_DPI },
>>>    };
>>>      static const u16 tidss_j721e_common_regs[DISPC_COMMON_REG_TABLE_LEN] = {
>>> @@ -229,8 +233,8 @@ static const u16 tidss_j721e_common_regs[DISPC_COMMON_REG_TABLE_LEN] = {
>>>      const struct dispc_features dispc_j721e_feats = {
>>>        .max_pclk_khz = {
>>> -        [DISPC_VP_DPI] = 170000,
>>> -        [DISPC_VP_INTERNAL] = 600000,
>>> +        [DISPC_PORT_DPI] = 170000,
>>> +        [DISPC_PORT_INTERNAL] = 600000,
>>>        },
>>>          .scaling = {
>>> @@ -260,9 +264,7 @@ const struct dispc_features dispc_j721e_feats = {
>>>        .vp_name = { "vp1", "vp2", "vp3", "vp4" },
>>>        .ovr_name = { "ovr1", "ovr2", "ovr3", "ovr4" },
>>>        .vpclk_name = { "vp1", "vp2", "vp3", "vp4" },
>>> -    /* Currently hard coded VP routing (see dispc_initial_config()) */
>>> -    .vp_bus_type =    { DISPC_VP_INTERNAL, DISPC_VP_DPI,
>>> -              DISPC_VP_INTERNAL, DISPC_VP_DPI, },
>>> +
>>
>> I think this line feed is extra.
> 
> Okay! Will remove that from all SoC feat structs.
> 
>>
>>>        .vp_feat = { .color = {
>>>                .has_ctm = true,
>>>                .gamma_size = 1024,
>>> @@ -273,6 +275,11 @@ const struct dispc_features dispc_j721e_feats = {
>>>        .vid_name = { "vid1", "vidl1", "vid2", "vidl2" },
>>>        .vid_lite = { 0, 1, 0, 1, },
>>>        .vid_order = { 1, 3, 0, 2 },
>>> +
>>> +    .num_output_ports = 4,
>>> +    /* Currently hard coded VP routing (see dispc_initial_config()) */
>>> +    .output_port_bus_type =    { DISPC_PORT_INTERNAL, DISPC_PORT_DPI,
>>> +              DISPC_PORT_INTERNAL, DISPC_PORT_DPI, },
>>
>> Indent doesn't look right (but it might be just because this is a diff).
> 
> I may have missed indenting this.
> 
>>
>>>    };
>>>      static const u16 *dispc_common_regmap;
>>> @@ -287,12 +294,12 @@ struct dispc_device {
>>>       void __iomem *base_common;
>>>       void __iomem *base_vid[TIDSS_MAX_PLANES];
>>> -    void __iomem *base_ovr[TIDSS_MAX_PORTS];
>>> -    void __iomem *base_vp[TIDSS_MAX_PORTS];
>>> +    void __iomem *base_ovr[TIDSS_MAX_VPS];
>>> +    void __iomem *base_vp[TIDSS_MAX_VPS];
>>>       struct regmap *oldi_io_ctrl;
>>> -    struct clk *vp_clk[TIDSS_MAX_PORTS];
>>> +    struct clk *vp_clk[TIDSS_MAX_VPS];
>>>          const struct dispc_features *feat;
>>>    @@ -300,7 +307,7 @@ struct dispc_device {
>>>          bool is_enabled;
>>> -    struct dss_vp_data vp_data[TIDSS_MAX_PORTS];
>>> +    struct dss_vp_data vp_data[TIDSS_MAX_VPS];
>>>          u32 *fourccs;
>>>        u32 num_fourccs;
>>> @@ -851,7 +858,7 @@ int dispc_vp_bus_check(struct dispc_device *dispc, u32 hw_videoport,
>>>            return -EINVAL;
>>>        }
>>> -    if (dispc->feat->vp_bus_type[hw_videoport] != DISPC_VP_OLDI &&
>>> +    if (dispc->feat->output_port_bus_type[hw_videoport] != DISPC_PORT_OLDI &&
>>
>> Hmm, so is the hw_videoport a vp index or an output index? Sounds like
>> the former, so it's not right, even if at the moment they're identical.
>> We need some kind of mapping between those.
>>
> 
> It is indeed a vp index. And yes, I can come up with a mapping mechanism.
> 
>> If the mapping can be changed (or just defined in the DT), I think we
>> need a variable in struct dispc_device, which tells the output to which
>> a videoport is connected to. Or vice versa, I'm not sure which direction
>> we need more. If the mapping is always the same on all SoC (but I don't
>> think so), we can have it in the feats.
>>
> 
> As of now, the mapping is always same. But I would like to make is
> generalized for future. Hence, I am considering to keep the variable in
> struct dispc_device.
> 
> My question though would be, how would one be able to find which kind
> of device is the port connected to, if it is connected to a bridge? For
> example, in case of panels, we have a "connector_type" variable in
> drm_panel which tells what kind of sink it is. But there is no such
> thing in drm_bridge.
> 
> This is required because what if we can connect an videoport to either
> an LVDS/OLDI bridge or a DPI bridge.

The connector type shouldn't matter.

The DSS has VPs and outputs. The VPs are "generic" and identical to each 
other, except in their possible connections to the outputs. The outputs, 
at least at the moment, are DPI, LVDS and internal, where internal is 
basically just DPI.

Those are the three different cases we are interested in within the dss 
driver, right? Does it matter where the DPI or LVDS output goes?

So what I'm saying is that the DSS device tree data should already 
define what kind of configuration we need, and there's no need to look 
further into the panel/bridge nodes.

> Also, implementing this might mean removal of the part of code which
> confirms that the panel's "connector_type" indeed expects what the VP
> can provide, unless there is a way to find out what the sink is before
> calling the drm_of_find_panel_or_bridge API.

Hmm, well, each DSS output (port in DT) is of a certain type, so we 
should be able to validate that the output and the panel's 
connector_type match.

> On the direction, the primary requirement of hw_videoport has been in
> the tidss_dispc.c file where the HW registers are getting configured.
> 'hw_videoport' is a frequently passed parameter in function calls. So,
> at a first glance the former option might makes more sense for
> direction, i.e. to have a variable which tells the output to which a
> videoport is connected to.

Makes sense.

> And while, there is also the tidss_kms.c file, which deals with
> initializing encoders and attaching bridges. This is where the
> output_port is required more often. But I am yet to think of a case
> where the above direction could be an issue.
> 
> 
>> Also, I wonder if output_port is a good name as it has "port" in it
>> (like video port), and it's a bit long-ish. Would just "output" be
>> enough? We could, of course, shorten it to OP, but that looks odd to me =).
>>
> 
>>>            fmt->is_oldi_fmt) {
>>>            dev_dbg(dispc->dev, "%s: %s is not OLDI-port\n",
>>>                __func__, dispc->feat->vp_name[hw_videoport]);
>>> @@ -955,7 +962,7 @@ void dispc_vp_prepare(struct dispc_device *dispc, u32 hw_videoport,
>>>        if (WARN_ON(!fmt))
>>>            return;
>>> -    if (dispc->feat->vp_bus_type[hw_videoport] == DISPC_VP_OLDI) {
>>> +    if (dispc->feat->output_port_bus_type[hw_videoport] == DISPC_PORT_OLDI) {
>>>            dispc_oldi_tx_power(dispc, true);
>>>              dispc_enable_oldi(dispc, hw_videoport, fmt);
>>> @@ -1014,7 +1021,7 @@ void dispc_vp_enable(struct dispc_device *dispc, u32 hw_videoport,
>>>        align = true;
>>>          /* always use DE_HIGH for OLDI */
>>> -    if (dispc->feat->vp_bus_type[hw_videoport] == DISPC_VP_OLDI)
>>> +    if (dispc->feat->output_port_bus_type[hw_videoport] == DISPC_PORT_OLDI)
>>>            ieo = false;
>>>          dispc_vp_write(dispc, hw_videoport, DISPC_VP_POL_FREQ,
>>> @@ -1040,7 +1047,7 @@ void dispc_vp_disable(struct dispc_device *dispc, u32 hw_videoport)
>>>      void dispc_vp_unprepare(struct dispc_device *dispc, u32 hw_videoport)
>>>    {
>>> -    if (dispc->feat->vp_bus_type[hw_videoport] == DISPC_VP_OLDI) {
>>> +    if (dispc->feat->output_port_bus_type[hw_videoport] == DISPC_PORT_OLDI) {
>>>            dispc_vp_write(dispc, hw_videoport, DISPC_VP_DSS_OLDI_CFG, 0);
>>>              dispc_oldi_tx_power(dispc, false);
>>> @@ -1116,10 +1123,10 @@ enum drm_mode_status dispc_vp_mode_valid(struct dispc_device *dispc,
>>>                         const struct drm_display_mode *mode)
>>>    {
>>>       u32 hsw, hfp, hbp, vsw, vfp, vbp;
>>> -    enum dispc_vp_bus_type bus_type;
>>> +    enum dispc_port_bus_type bus_type;
>>>       int max_pclk;
>>> -    bus_type = dispc->feat->vp_bus_type[hw_videoport];
>>> +    bus_type = dispc->feat->output_port_bus_type[hw_videoport];
>>>       max_pclk = dispc->feat->max_pclk_khz[bus_type];
>>> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.h b/drivers/gpu/drm/tidss/tidss_dispc.h
>>> index e49432f0abf5..30fb44158347 100644
>>> --- a/drivers/gpu/drm/tidss/tidss_dispc.h
>>> +++ b/drivers/gpu/drm/tidss/tidss_dispc.h
>>> @@ -50,11 +50,11 @@ struct dispc_errata {
>>>        bool i2000; /* DSS Does Not Support YUV Pixel Data Formats */
>>>    };
>>> -enum dispc_vp_bus_type {
>>> -    DISPC_VP_DPI,        /* DPI output */
>>> -    DISPC_VP_OLDI,        /* OLDI (LVDS) output */
>>> -    DISPC_VP_INTERNAL,    /* SoC internal routing */
>>> -    DISPC_VP_MAX_BUS_TYPE,
>>> +enum dispc_port_bus_type {
>>> +    DISPC_PORT_DPI,            /* DPI output */
>>> +    DISPC_PORT_OLDI,        /* OLDI (LVDS) output */
>>> +    DISPC_PORT_INTERNAL,        /* SoC internal routing */
>>> +    DISPC_PORT_MAX_BUS_TYPE,
>>
>> Okay, so here you have just "port", not "output_port". In the DT,
>> they're ports, so... Maybe we could use that name too, and for video
>> port always use "vp". The current "hw_videoport" could be easily
>> mistaken with "port".
> 
> I see what you are saying and how somebody could confusre hw_videoport
> for a physical connection (i.e. port). I have always understoof
> hw_videoport to be a thing of the actual VP inside the SoC, but that may
> be because I have been working on this, and not just trying to
> understand the code from a high level.
> 
> How about if I change the output_port to "out_port"? I am okay to keep
> "output" as the name to. I am saying this becuase I think, only keeping
> "port" might just confuse more, as you mentioned above.

Yes, I agree "port" is not good. Other than that, no strong opinions. 
Whatever name you pick, someone will find it confusing ;). Just keep it 
consistent, so that all enums, parameters, etc. use it a consistent 
manner. If I had to choose, I'd go with the "output", but I'm fine with 
other names too.

> And then we can change "hw_videoport" to "vp_index", perhaps, or even
> keep that as it is? Becuase if we do have a VP structure in future
> like you suggested above, "vps" and "vp" would become a close overlap.
> For eg, "vps[vp]".

That is true. I think that was the reason I chose hw_videoport instead 
of videoport or vp, although vps[hw_videoport] is only barely better.

vp_index is ok for me, or maybe vp_idx or vp_num to have it a bit shorter.

  Tomi

