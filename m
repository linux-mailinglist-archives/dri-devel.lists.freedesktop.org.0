Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D257E2D2B
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 20:47:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 442D810E3ED;
	Mon,  6 Nov 2023 19:47:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01E2F10E3ED
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 19:47:55 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3A6JlM5R060343;
 Mon, 6 Nov 2023 13:47:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1699300042;
 bh=+HEBZEmwqWXwwim2AP8dyF8xCUmJaEi9Wbfg++614Iw=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=kLAM0gbX53yzYuh0ezW1Amru9Y9A46Xg44VL7oMNQPgEOlKtPbFQg2bSsvXDAkbFL
 qK0z0iT9hTjzGoH2CCb96W2xMbNO3Gen98KjFRGqbYlN7E+4FCcur2/CIC9IZsbKXl
 6q0H+T08yDX3WwBJcc3izZEwb8pdC3cMlai45KYA=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3A6JlMKL027642
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 6 Nov 2023 13:47:22 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 6
 Nov 2023 13:47:22 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 6 Nov 2023 13:47:22 -0600
Received: from [10.249.132.69] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3A6Jl4Gg098807;
 Mon, 6 Nov 2023 13:47:05 -0600
Message-ID: <7ddf0edb-2925-4b7c-ad07-27c030dd0232@ti.com>
Date: Tue, 7 Nov 2023 01:17:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: tc358767: Support input format negotiation
 hook
Content-Language: en-US
To: Sam Ravnborg <sam@ravnborg.org>
References: <20231030192846.27934-1-a-bhatia1@ti.com>
 <20231106123800.GC47195@ravnborg.org>
From: Aradhya Bhatia <a-bhatia1@ti.com>
In-Reply-To: <20231106123800.GC47195@ravnborg.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>, Jan Kiszka <jan.kiszka@siemens.com>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Francesco Dolcini <francesco@dolcini.it>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jayesh Choudhary <j-choudhary@ti.com>, Tomi Valkeinen <tomba@kernel.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Jyri Sarha <jyri.sarha@iki.fi>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Thank you for the suggestion!

On 06-Nov-23 18:08, Sam Ravnborg wrote:
> Hi Aradhya,
> 
> On Tue, Oct 31, 2023 at 12:58:46AM +0530, Aradhya Bhatia wrote:
>> With new connector model, tc358767 will not create the connector, when
>> DRM_BRIDGE_ATTACH_NO_CONNECTOR is set and display-controller driver will
>> rely on format negotiation to setup the encoder format.
>>
>> Add the missing input-format negotiation hook in the
>> drm_bridge_funcs to complete DRM_BRIDGE_ATTACH_NO_CONNECTOR support.
>>
>> Input format is selected to MEDIA_BUS_FMT_RGB888_1X24 as default, as is
>> the case with older model.
>>
>> Reported-by: Jan Kiszka <jan.kiszka@siemens.com>
>> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
>> ---
>>
>> Notes:
>>
>>   * Since I do not have hardware with me, this was just build tested. I would
>>     appreciate it if someone could test and review it, especically somebody, who
>>     uses the bridge for DPI/DSI to eDP format conversion.
>>
>>   * The Toshiba TC358767 bridge is not enabled in arm64 defconfig by default,
>>     when it should be. Hence, I sent a quick patch[0] earlier.
>>
>> [0]: https://lore.kernel.org/all/20231030152834.18450-1-a-bhatia1@ti.com/
>>
>>  drivers/gpu/drm/bridge/tc358767.c | 25 +++++++++++++++++++++++++
>>  1 file changed, 25 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
>> index ef2e373606ba..0affcefdeb1c 100644
>> --- a/drivers/gpu/drm/bridge/tc358767.c
>> +++ b/drivers/gpu/drm/bridge/tc358767.c
>> @@ -1751,6 +1751,30 @@ tc_dpi_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
>>  	return input_fmts;
>>  }
>>  
>> +static u32 *
>> +tc_edp_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
>> +				 struct drm_bridge_state *bridge_state,
>> +				 struct drm_crtc_state *crtc_state,
>> +				 struct drm_connector_state *conn_state,
>> +				 u32 output_fmt,
>> +				 unsigned int *num_input_fmts)
>> +{
>> +	u32 *input_fmts;
>> +
>> +	*num_input_fmts = 0;
>> +
>> +	input_fmts = kcalloc(MAX_INPUT_SEL_FORMATS, sizeof(*input_fmts),
>> +			     GFP_KERNEL);
>> +	if (!input_fmts)
>> +		return NULL;
>> +
>> +	/* This is the DSI/DPI-end bus format */
>> +	input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
>> +	*num_input_fmts = 1;
>> +
>> +	return input_fmts;
>> +}
> 
> You could benefit from using the helper:
> drm_atomic_helper_bridge_propagate_bus_fmt()

You are right!

Upon taking a second look, I realize that the bridge chain works with
MEDIA_BUS_FMT_FIXED bus format, when tc358767 is being used in DPI/DSI
to eDP mode (because the panel-bridge does not have a get_output_bus_fmt
hook, and uses the same helper for its get_input_bus_fmt hook). My patch
creates a deviation from that, by forcing MEDIA_BUS_FMT_RGB888_1X24 even
when eDP is involved.

Using the helper here, will certainly address this deviation.

However, for the DPI/DSI to DP mode, MEDIA_BUS_FMT_RGB888_1X24 bus
format is required, and *just* using the helper as its get_input_bus_fmt
hook, might not be enough.

Since tc358767 is the last bridge in DPI/DSI to DP mode, the
output_fmt parameter get defaulted to MEDIA_BUS_FMT_FIXED too, as there
is no get_output_bus_fmt hook present in the driver. If we simply us
the helper here, the input_fmt will also get set to MEDIA_BUS_FMT_FIXED.
This too is an unwanted deviation.

It seems like the right way to address both the cases, would be by
adding the get_output_bus_fmt hook that sets output_fmt to
MEDIA_BUS_FMT_RGB888_1X24, as well as using the helper as the
get_input_bus_fmt hook.

If this seems good to you too, I will send a new version of Tomi's
series[0] which incorporates this patch.


Regards
Aradhya

[0]:
https://lore.kernel.org/all/20231031-tc358767-v1-0-392081ad9f4b@ideasonboard.com/
