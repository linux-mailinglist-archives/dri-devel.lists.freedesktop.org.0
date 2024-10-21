Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EEC9A709E
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 19:08:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C600B10E050;
	Mon, 21 Oct 2024 17:07:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="jVl6/xdX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com
 [91.218.175.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 328E510E050
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 17:07:56 +0000 (UTC)
Message-ID: <c8a42d96-c02e-4ce0-acd8-3fdc5eecd208@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1729530475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SrQYJCnutF/B0aizIHStBs0qq9hGntt8rX3SGM0rkm4=;
 b=jVl6/xdXgjM0teCdVytFPKO98U3Twrb2C4GfaL2e/DYJIrQK1G9uPDRo83IlzfMtKKRNeB
 CX8ClxRa7Ao5d1abXKBnwszUs0uN5EGzZs/W1On5SjnRHKHFKhjNfisJ85ijDcjJc3CbI+
 DmL6M/3jgIleui/Ge8URFzoYiwMrZGE=
Date: Mon, 21 Oct 2024 22:37:44 +0530
MIME-Version: 1.0
Subject: Re: [PATCH v5 13/13] drm/bridge: cdns-dsi: Use
 pre_enable/post_disable to enable/disable
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dominik Haller <d.haller@phytec.de>, Sam Ravnborg <sam@ravnborg.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
 Udit Kumar <u-kumar1@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>
References: <20241019195411.266860-1-aradhya.bhatia@linux.dev>
 <20241019200530.270738-1-aradhya.bhatia@linux.dev>
 <20241019200530.270738-6-aradhya.bhatia@linux.dev>
 <m7t4hsa3lcszjbipxlypf655uspoxw3xfyy5jo3n3bnmqaiqcf@6wti5f477gve>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
In-Reply-To: <m7t4hsa3lcszjbipxlypf655uspoxw3xfyy5jo3n3bnmqaiqcf@6wti5f477gve>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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

Hi Dmitry,

Thank you for reviewing the patches!

On 10/20/24 17:27, Dmitry Baryshkov wrote:
> On Sun, Oct 20, 2024 at 01:35:30AM +0530, Aradhya Bhatia wrote:
>> From: Aradhya Bhatia <a-bhatia1@ti.com>
>>
>> The cdns-dsi controller requires that it be turned on completely before
>> the input DPI's source has begun streaming[0]. Not having that, allows
>> for a small window before cdns-dsi enable and after cdns-dsi disable
>> where the previous entity (in this case tidss's videoport) to continue
>> streaming DPI video signals. This small window where cdns-dsi is
>> disabled but is still receiving signals causes the input FIFO of
>> cdns-dsi to get corrupted. This causes the colors to shift on the output
>> display. The colors can either shift by one color component (R->G, G->B,
>> B->R), or by two color components (R->B, G->R, B->G).
>>
>> Since tidss's videoport starts streaming via crtc enable hooks, we need
>> cdns-dsi to be up and running before that. Now that the bridges are
>> pre_enabled before crtc is enabled, and post_disabled after crtc is
>> disabled, use the pre_enable and post_disable hooks to get cdns-dsi
>> ready and running before the tidss videoport to get pass the color shift
>> issues.
>>
> 
> Not being an expert in the TI DSS driver, would it be more proper to
> handle that in the TI driver instead? I mean, sending out DPI signals
> isn't a part of the CRTC setup, it's a job of the encoder.

I haven't done a feasibility analysis of moving the CRTC bits of TIDSS
into the encoder, but even if it were possible, it wouldn't solve the
issue.

The bridge_enable() sequence gets called _after_ the encoder has been
enabled - causing the TIDSS's DPI (enabled from encoder) to still be
up and running before the DSI has had a chance to be ready.

Regards
Aradhya


> 
>> [0]: See section 12.6.5.7.3 "Start-up Procedure" in J721E SoC TRM
>>      TRM Link: http://www.ti.com/lit/pdf/spruil1
>>
>> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
>> Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
>> ---
>>  .../gpu/drm/bridge/cadence/cdns-dsi-core.c    | 62 ++++++++++---------
>>  1 file changed, 34 insertions(+), 28 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
>> index 79d8c2264c14..dfeb53841ebc 100644
>> --- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
>> +++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
>> @@ -658,13 +658,28 @@ cdns_dsi_bridge_mode_valid(struct drm_bridge *bridge,
>>  	return MODE_OK;
>>  }
>>  
>> -static void cdns_dsi_bridge_atomic_disable(struct drm_bridge *bridge,
>> -					   struct drm_bridge_state *old_bridge_state)
>> +static void cdns_dsi_bridge_atomic_post_disable(struct drm_bridge *bridge,
>> +						struct drm_bridge_state *old_bridge_state)
>>  {
>>  	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
>>  	struct cdns_dsi *dsi = input_to_dsi(input);
>>  	u32 val;
>>  
>> +	/*
>> +	 * The cdns-dsi controller needs to be disabled after it's DPI source
>> +	 * has stopped streaming. If this is not followed, there is a brief
>> +	 * window before DPI source is disabled and after cdns-dsi controller
>> +	 * has been disabled where the DPI stream is still on, but the cdns-dsi
>> +	 * controller is not ready anymore to accept the incoming signals. This
>> +	 * is one of the reasons why a shift in pixel colors is observed on
>> +	 * displays that have cdns-dsi as one of the bridges.
>> +	 *
>> +	 * To mitigate this, disable this bridge from the bridge post_disable()
>> +	 * hook, instead of the bridge _disable() hook. The bridge post_disable()
>> +	 * hook gets called after the CRTC disable, where often many DPI sources
>> +	 * disable their streams.
>> +	 */
>> +
>>  	val = readl(dsi->regs + MCTL_MAIN_DATA_CTL);
>>  	val &= ~(IF_VID_SELECT_MASK | IF_VID_MODE | VID_EN | HOST_EOT_GEN |
>>  		 DISP_EOT_GEN);
>> @@ -683,15 +698,6 @@ static void cdns_dsi_bridge_atomic_disable(struct drm_bridge *bridge,
>>  	pm_runtime_put(dsi->base.dev);
>>  }
>>  
>> -static void cdns_dsi_bridge_atomic_post_disable(struct drm_bridge *bridge,
>> -						struct drm_bridge_state *old_bridge_state)
>> -{
>> -	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
>> -	struct cdns_dsi *dsi = input_to_dsi(input);
>> -
>> -	pm_runtime_put(dsi->base.dev);
>> -}
>> -
>>  static void cdns_dsi_hs_init(struct cdns_dsi *dsi)
>>  {
>>  	struct cdns_dsi_output *output = &dsi->output;
>> @@ -760,8 +766,8 @@ static void cdns_dsi_init_link(struct cdns_dsi *dsi)
>>  	dsi->link_initialized = true;
>>  }
>>  
>> -static void cdns_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
>> -					  struct drm_bridge_state *old_bridge_state)
>> +static void cdns_dsi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
>> +					      struct drm_bridge_state *old_bridge_state)
>>  {
>>  	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
>>  	struct cdns_dsi *dsi = input_to_dsi(input);
>> @@ -776,6 +782,21 @@ static void cdns_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
>>  	if (WARN_ON(pm_runtime_get_sync(dsi->base.dev) < 0))
>>  		return;
>>  
>> +	/*
>> +	 * The cdns-dsi controller needs to be enabled before it's DPI source
>> +	 * has begun streaming. If this is not followed, there is a brief window
>> +	 * after DPI source enable and before cdns-dsi controller enable where
>> +	 * the DPI stream is on, but the cdns-dsi controller is not ready to
>> +	 * accept the incoming signals. This is one of the reasons why a shift
>> +	 * in pixel colors is observed on displays that have cdns-dsi as one of
>> +	 * the bridges.
>> +	 *
>> +	 * To mitigate this, enable this bridge from the bridge pre_enable()
>> +	 * hook, instead of the bridge _enable() hook. The bridge pre_enable()
>> +	 * hook gets called before the CRTC enable, where often many DPI sources
>> +	 * enable their streams.
>> +	 */
>> +
>>  	if (dsi->platform_ops && dsi->platform_ops->enable)
>>  		dsi->platform_ops->enable(dsi);
>>  
>> @@ -912,19 +933,6 @@ static void cdns_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
>>  	writel(tmp, dsi->regs + MCTL_MAIN_EN);
>>  }
>>  
>> -static void cdns_dsi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
>> -					      struct drm_bridge_state *old_bridge_state)
>> -{
>> -	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
>> -	struct cdns_dsi *dsi = input_to_dsi(input);
>> -
>> -	if (WARN_ON(pm_runtime_get_sync(dsi->base.dev) < 0))
>> -		return;
>> -
>> -	cdns_dsi_init_link(dsi);
>> -	cdns_dsi_hs_init(dsi);
>> -}
>> -
>>  static u32 *cdns_dsi_bridge_get_input_bus_fmts(struct drm_bridge *bridge,
>>  					       struct drm_bridge_state *bridge_state,
>>  					       struct drm_crtc_state *crtc_state,
>> @@ -968,9 +976,7 @@ static int cdns_dsi_bridge_atomic_check(struct drm_bridge *bridge,
>>  static const struct drm_bridge_funcs cdns_dsi_bridge_funcs = {
>>  	.attach = cdns_dsi_bridge_attach,
>>  	.mode_valid = cdns_dsi_bridge_mode_valid,
>> -	.atomic_disable = cdns_dsi_bridge_atomic_disable,
>>  	.atomic_pre_enable = cdns_dsi_bridge_atomic_pre_enable,
>> -	.atomic_enable = cdns_dsi_bridge_atomic_enable,
>>  	.atomic_post_disable = cdns_dsi_bridge_atomic_post_disable,
>>  	.atomic_check = cdns_dsi_bridge_atomic_check,
>>  	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
>> -- 
>> 2.34.1
>>
> 
