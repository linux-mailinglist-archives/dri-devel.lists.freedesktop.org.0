Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FB89F4E38
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 15:49:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7EE510E9A7;
	Tue, 17 Dec 2024 14:49:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="SHgrecis";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [IPv6:2a01:4f8:201:9162::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41BC710E9A7
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 14:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1734446960;
 bh=bxleyRE+0QNYUPGWu6GOO9WL8zmi27WPpMdWVX7EXaQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=SHgrecisvyvFNYJkC0sG9pe+ZHI+SU1wgFAN6QytjqZ1lScWAnvGDWOB6jwwTeoOY
 b1mEXOq6aztZ09ZzcxhUuG3Wwzv/0G21T4aw3PxuaYchovpxJD6WhQKz/vKInV7TXt
 2F9t8c0lhA09WzpPWuQtgwPdwGaOyAgN1L+AguXnrTjPEhlioHJ8U/T1N/js0b6v4H
 iDUEuJIUtXJSf4+YCLmLEF1SWO717Weax/RRKuIQ26fs0CRlo+rHTHWpp8mCDUe4+/
 lCHiJr2SCxpRf/Qa93uK7R/Fmww2DmFRMHozhV7TJgvX2j2PGmH9IORwl3A1OUh22+
 AOVOghZSTbzQA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9389517E377A;
 Tue, 17 Dec 2024 15:49:19 +0100 (CET)
Message-ID: <482ccf9c-fad5-470c-964f-a2c422f79555@collabora.com>
Date: Tue, 17 Dec 2024 15:49:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/15] drm/mediatek: Introduce HDMI/DDC v2 for
 MT8195/MT8188
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
Cc: "robh@kernel.org" <robh@kernel.org>,
 "jie.qiu@mediatek.com" <jie.qiu@mediatek.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "mripard@kernel.org"
 <mripard@kernel.org>, =?UTF-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?=
 <jitao.shi@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "junzhi.zhao@mediatek.com" <junzhi.zhao@mediatek.com>
References: <20241205114518.53527-1-angelogioacchino.delregno@collabora.com>
 <20241205114518.53527-16-angelogioacchino.delregno@collabora.com>
 <6ed3b9ee742dcf814f35e15d88db538480ba2d48.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <6ed3b9ee742dcf814f35e15d88db538480ba2d48.camel@mediatek.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 17/12/24 10:21, CK Hu (胡俊光) ha scritto:
> Hi, Angelo:
> 
> On Thu, 2024-12-05 at 12:45 +0100, AngeloGioacchino Del Regno wrote:
>> External email : Please do not click links or open attachments until you have verified the sender or the content.
>>
>>
>> Add support for the newer HDMI-TX (Encoder) v2 and DDC v2 IPs
>> found in MediaTek's MT8195, MT8188 SoC and their variants, and
>> including support for display modes up to 4k60 and for HDMI
>> Audio, as per the HDMI 2.0 spec.
>>
>> HDCP and CEC functionalities are also supported by this hardware,
>> but are not included in this commit and that also poses a slight
>> difference between the V2 and V1 controllers in how they handle
>> Hotplug Detection (HPD).
>>
>> While the v1 controller was using the CEC controller to check
>> HDMI cable connection and disconnection, in this driver the v2
>> one does not.
>>
>> This is due to the fact that on parts with v2 designs, like the
>> MT8195 SoC, there is one CEC controller shared between the HDMI
>> Transmitter (HDMI-TX) and Receiver (HDMI-RX): before eventually
>> adding support to use the CEC HW to wake up the HDMI controllers
>> it is necessary to have support for one TX, one RX *and* for both
>> at the same time.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
> 
> [snip]
> 
>> +static void mtk_hdmi_v2_bridge_pre_enable(struct drm_bridge *bridge,
>> +                                         struct drm_bridge_state *old_state)
>> +{
>> +       struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
>> +       struct drm_atomic_state *state = old_state->base.state;
>> +       struct drm_connector_state *conn_state;
>> +       union phy_configure_opts opts = {
>> +               .dp = { .link_rate = hdmi->mode.clock * KILO }
>> +       };
>> +
>> +       /* Retrieve the connector through the atomic state */
>> +       hdmi->curr_conn = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
>> +
>> +       conn_state = drm_atomic_get_new_connector_state(state, hdmi->curr_conn);
>> +       if (WARN_ON(!conn_state))
>> +               return;
>> +
>> +       /*
>> +        * Preconfigure the HDMI controller and the HDMI PHY at pre_enable
>> +        * stage to make sure that this IP is ready and clocked before the
>> +        * mtk_dpi gets powered on and before it enables the output.
> 
> In patch [6/15], you does not power on DPI power in DPI driver.
> Could you point out the code about 'mtk_dpi gets powered on'?
> 

DPI gets powered on in mtk_dpi_bridge_enable() -> mtk_dpi_power_on(dpi)

Cheers,
Angelo

> Regards,
> CK
> 
>> +        */
>> +       hdmi->dvi_mode = !hdmi->curr_conn->display_info.is_hdmi;
>> +       mtk_hdmi_v2_output_set_display_mode(hdmi, &hdmi->mode);
>> +
>> +       /* Reconfigure phy clock link with appropriate rate */
>> +       phy_configure(hdmi->phy, &opts);
>> +
>> +       /* Power on the PHY here to make sure that DPI_HDMI is clocked */
>> +       phy_power_on(hdmi->phy);
>> +
>> +       hdmi->powered = true;
>> +}
>> +
> 
> 


