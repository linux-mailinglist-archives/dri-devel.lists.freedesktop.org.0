Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A44A37123A0
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 11:30:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9081210E1BD;
	Fri, 26 May 2023 09:30:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29DDC10E1BD
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 09:29:58 +0000 (UTC)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi
 [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id AA492844;
 Fri, 26 May 2023 11:29:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1685093378;
 bh=q+VPTk7+VffnTD8De8zvpcfJ+oYrrOvHu/Dd+/KC7NE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Sj8oOnD1HQ0H1MuyZ4XroiVW0bDTdDMGybBNitHFc0q/ULGE14VyovU82SrtxisdN
 jEjDWDiLOeBX+FhKw4CSp2pOCfWvJyHIwxh1JBOubbxu8R5Lm0xiWu/A1Ag+mJeSGc
 PgW1zwiMeoMmUboAm++BkYXgVduFjK2jhHHFuSbc=
Message-ID: <9f98fb99-eaf4-657c-fd2e-b2e81d9cb109@ideasonboard.com>
Date: Fri, 26 May 2023 12:29:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v6 3/8] drm/bridge: mhdp8546: Add minimal format
 negotiation
Content-Language: en-US
To: Aradhya Bhatia <a-bhatia1@ti.com>, neil.armstrong@linaro.org,
 Jyri Sarha <jyri.sarha@iki.fi>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rahul T R <r-ravikumar@ti.com>, Swapnil Jakhade <sjakhade@cadence.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Francesco Dolcini <francesco@dolcini.it>
References: <20230509093036.3303-1-a-bhatia1@ti.com>
 <20230509093036.3303-4-a-bhatia1@ti.com>
 <db9b4117-b030-49a7-3732-2fc39d089ee2@ideasonboard.com>
 <d2777edc-151d-7f06-30c4-4634fdb6a63d@ti.com>
 <305382fd-2312-59d9-e2d3-25a17e0a2158@linaro.org>
 <363d3089-48d4-5663-68e8-ecf0eb4e3e0e@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <363d3089-48d4-5663-68e8-ecf0eb4e3e0e@ti.com>
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
Cc: Nishanth Menon <nm@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/05/2023 17:25, Aradhya Bhatia wrote:
> Hi Neil,
> 
> Thank you for reviewing the patch.
> 
> On 16-May-23 12:51, Neil Armstrong wrote:
>> On 15/05/2023 17:59, Aradhya Bhatia wrote:
>>> Hi Tomi,
>>>
>>> On 12-May-23 14:45, Tomi Valkeinen wrote:
>>>> On 09/05/2023 12:30, Aradhya Bhatia wrote:
>>>>> From: Nikhil Devshatwar <nikhil.nd@ti.com>
>>>>>
>>>>> With new connector model, mhdp bridge will not create the connector and
>>>>> SoC driver will rely on format negotiation to setup the encoder format.
>>>>>
>>>>> Support minimal format negotiations hooks in the drm_bridge_funcs.
>>>>> Complete format negotiation can be added based on EDID data.
>>>>> This patch adds the minimal required support to avoid failure
>>>>> after moving to new connector model.
>>>>>
>>>>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>>>>> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
>>>>
>>>> You need to add your SoB to this and the other patches.
>>>
>>> Okay!
>>>
>>>>
>>>>> ---
>>>>>
>>>>> Notes:
>>>>>
>>>>>        changes from v1:
>>>>>        * cosmetic fixes, commit message update.
>>>>>
>>>>>        changes from v5:
>>>>>        * dropped the default_bus_format variable and directly assigned
>>>>>          MEDIA_BUS_FMT_RGB121212_1X36 to input_fmts.
>>>>>
>>>>>     .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 25
>>>>> +++++++++++++++++++
>>>>>     1 file changed, 25 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>>>>> b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>>>>> index f6822dfa3805..623e4235c94f 100644
>>>>> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>>>>> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>>>>> @@ -2146,6 +2146,30 @@ cdns_mhdp_bridge_atomic_reset(struct drm_bridge
>>>>> *bridge)
>>>>>         return &cdns_mhdp_state->base;
>>>>>     }
>>>>>     +static u32 *cdns_mhdp_get_input_bus_fmts(struct drm_bridge *bridge,
>>>>> +                     struct drm_bridge_state *bridge_state,
>>>>> +                     struct drm_crtc_state *crtc_state,
>>>>> +                     struct drm_connector_state *conn_state,
>>>>> +                     u32 output_fmt,
>>>>> +                     unsigned int *num_input_fmts)
>>>>> +{
>>>>> +    u32 *input_fmts;
>>>>> +
>>>>> +    *num_input_fmts = 0;
>>>>> +
>>>>> +    if (output_fmt != MEDIA_BUS_FMT_FIXED)
>>>>> +        return NULL;
>>>>
>>>> The tfp410 and sii902x drivers don't have the above check. Why does mhdp
>>>> need it? Or the other way, why don't tfp410 and sii902x need it?
>>>
>>> I had removed this condition in order to follow status quo, from the
>>> ITE-66121 HDMI bridge driver.
>>>
>>> The idea would have been to drop this for MHDP as well, but I guess I
>>> overlooked this one.
>>>
>>> However...
>>>
>>>> I guess at the moment we always do get MEDIA_BUS_FMT_FIXED as the out
>>>> fmt (in all three bridge drivers), don't we?
>>>
>>> ... I tested again to ensure that the above is indeed the case. And
>>> ended up catching some odd behavior.
>>>
>>> It turns out that for all the HDMI bridges (TFP410, SII902X, ITE-66121),
>>> the format negotiation doesn't stop at output_fmt = MEDIA_BUS_FMT_FIXED.
>>> The {bridge}_get_input_format API gets called again with the output_fmt
>>> = MEDIA_BUS_FMT_RGB24_1X24.
>>>
>>> This doesn't happen with the MHDP driver. Format negotiation with MHDP
>>> bridge stops after one round, at output_fmt = MEDIA_BUS_FMT_FIXED.
>>
>> This is because the bridge negociation logic will test with all possible
>> output formats from the chain, and won't stop at first working test.
>>
> Okay..
> 
>> If your bridge only supports a single input format, it should return the
>> same format whatever output_fmt is tried.
>>
>> So indeed remove this test on mhdp aswell, or filter out invalid output
>> formats.
> Agreed.
> 
> I have been looking into the code deeper and trying to understand the
> logic flow around the format negotiation in the framework. Here are the
> 2 points that I want to mention. Please let me know if I have missed
> something with my understanding.
> 
> 
> Firstly, the mhdp-8546 output connects to the display-connector (with
> the compatible, "dp-connector") in the devicetree.
> 
> When the negotiation begins at 'drm_atomic_bridge_chain_select_bus_fmts'
> the display-connector bridge *should* act as the 'last_bridge', and the
> atomic_get_output_bus_fmts hook of the display-connector should get
> called. However, for some reason I am not yet sure of, the condition
> 
> :: if (last_bridge->funcs->atomic_get_output_bus_fmts)
> 
> fails and the 'select_bus_fmt_recursive' function gets called instead,
> (with MEDIA_BUS_FMT_FIXED as output_fmt), which in turn calls the
> atomic_get_input_bus_fmts hook of the mhdp-8546. This entirely skips the
> display-connector out of the format negotiation.
> 
> This doesn't happen when the HDMI bridges are in concern, even though,
> they too are connected with display-connector (with compatible
> "hdmi-connector").
> 
> I looked into the display-connector driver hoping to find if the 2 types
> of connectors are being treated differently wrt format negotiation, but
> I did not find any clue.
> 
> Please let me know if you have any idea about this.

The display connector is probed, but not attached to the bridge chain, 
so the last bridge is the mdhp. You need to call drm_bridge_attach in 
the mhdp driver to attach the next bridge. See e.g. tfp410's 
tfp410_attach().

Also, I think the support in mhdp for the 
!DRM_BRIDGE_ATTACH_NO_CONNECTOR case should be dropped.

> Secondly, as mentioned in the display-connector driver, this bridge is
> essentially a pass-through. And hence to reflect that, both the format
> negotiation hooks of display-connector driver call their counter-parts
> from the previous bridge if they are available, and if not, the formats
> are assigned MEDIA_BUS_FMT_FIXED.
> 
> While this makes sense for the atomic_get_output_bus_fmts hook, it seems
> to me that, the same may not hold true for the atomic_get_input_bus_fmts
> hook.
> If the bridge is indeed a pass-through, should it not also pass the
> output_format as its input format (which it actually got from the output
> of previous bridge)?
> 
> This way all the following will remain same.
> 
> 1. output_fmt of prev_bridge,
> 2. input_fmt of display-connector, and
> 3. output_fmt of display-connector.
> 
> Currently, since the atomic_get_input_bus_fmts hook of display-connector
> calls its counter-part from the prev_bridge, the input_fmt it passes
> (for HDMI bridges) is MEDIA_BUS_FMT_RGB888_1X24. The
> atomic_get_ouput_bus_fmts hook of the HDMI bridge has to, then, set an
> input bus format considering MEDIA_BUS_FMT_RGB888_1X24 as its output
> instead of MEDIA_BUS_FMT_FIXED.
> 
> Let me know what you think!

Yes, it does sound odd to me. Returning the same from the 
display-connector's get-input-fmt and get-output-fmt makes more sense.

Btw, we seem to be missing get-output-fmt from the mdhp driver.

  Tomi

