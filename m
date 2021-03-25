Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF999349243
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 13:43:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E904C6EB62;
	Thu, 25 Mar 2021 12:43:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5DE76EB62
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 12:43:18 +0000 (UTC)
Received: from [IPv6:2a02:810a:880:f54:dd4e:1b63:5a5e:1980] (unknown
 [IPv6:2a02:810a:880:f54:dd4e:1b63:5a5e:1980])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 1AB741F45FAB;
 Thu, 25 Mar 2021 12:43:17 +0000 (GMT)
Subject: Re: [PATCH 1/2] drm/mediatek: Switch the hdmi bridge ops to the
 atomic versions
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20210324191241.22622-1-dafna.hirschfeld@collabora.com>
 <20210324191241.22622-2-dafna.hirschfeld@collabora.com>
 <0e2123f6-2cf1-778d-f50b-64a9c0d5984c@collabora.com>
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <c671612a-d306-4d75-dbd4-84d3b2a39218@collabora.com>
Date: Thu, 25 Mar 2021 13:43:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0e2123f6-2cf1-778d-f50b-64a9c0d5984c@collabora.com>
Content-Language: en-US
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
Cc: chunkuang.hu@kernel.org, airlied@linux.ie, dafna3@gmail.com,
 laurent.pinchart@ideasonboard.com, kernel@collabora.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 25.03.21 11:43, Enric Balletbo i Serra wrote:
> Hi Dafna,
> 
> Thank you for your patch. It'd be nice if you can cc the linux-mediatek ML for
> next version, so Mediatek people is more aware of this change. IMHO cc'ing the
> lkml is also a good practice.

ok, I added all the mails from get_maintainer.pl. linux-mediatek was not there,
I can add it.

> 
> On 24/3/21 20:12, Dafna Hirschfeld wrote:
>> The bridge operation '.enable' and the audio cb '.get_eld'
>> access hdmi->conn. In the future we will want to support
>> the flag DRM_BRIDGE_ATTACH_NO_CONNECTOR and then we will
>> not have direct access to the connector.
>> The atomic version '.atomic_enable' allows accessing the
>> current connector from the state.
>> This patch switches the bridge to the atomic version and
>> saves the current connector in a new field 'curr_conn'.
>>
>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_hdmi.c | 41 ++++++++++++++++++++---------
>>   1 file changed, 29 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
>> index 8ee55f9e2954..9f415c508b33 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
>> @@ -154,6 +154,7 @@ struct mtk_hdmi {
>>   	struct drm_bridge bridge;
>>   	struct drm_bridge *next_bridge;
>>   	struct drm_connector conn;
>> +	struct drm_connector *curr_conn;
> 
> Adding a new drm_connector (curr_conn) is something that surprised me at the
> beginning, then I saw that in the second patch you remove the first
> drm_connector (conn). I didn't test it yet, but did you test this patch alone?
> without the second one, maybe I'm missing something but looks to me that this
> patch alone breaks more functionalities of the driver? (and I know that the
> driver is broken right now)

Hi, I didn't test it alone, but indeed this patch was wirrten with the intention
that 'conn' will be removed next patch. But I don't think that patch should break
functionality.

> 
> Is really needed to create a new drm_connector to switch to the atomic versions?

No, indeed this is the wrong patch to add curr_conn, I should add curr_conn to the
second patch or maybe to a seperate last patch so not to overload the patch.

Thanks,
Dafna

> 
> 
>>   	struct device *dev;
>>   	const struct mtk_hdmi_conf *conf;
>>   	struct phy *phy;
>> @@ -974,7 +975,7 @@ static int mtk_hdmi_setup_avi_infoframe(struct mtk_hdmi *hdmi,
>>   	ssize_t err;
>>   
>>   	err = drm_hdmi_avi_infoframe_from_display_mode(&frame,
>> -						       &hdmi->conn, mode);
>> +						       hdmi->curr_conn, mode);
>>   	if (err < 0) {
>>   		dev_err(hdmi->dev,
>>   			"Failed to get AVI infoframe from mode: %zd\n", err);
>> @@ -1054,7 +1055,7 @@ static int mtk_hdmi_setup_vendor_specific_infoframe(struct mtk_hdmi *hdmi,
>>   	ssize_t err;
>>   
>>   	err = drm_hdmi_vendor_infoframe_from_display_mode(&frame,
>> -							  &hdmi->conn, mode);
>> +							  hdmi->curr_conn, mode);
>>   	if (err) {
>>   		dev_err(hdmi->dev,
>>   			"Failed to get vendor infoframe from mode: %zd\n", err);
>> @@ -1357,7 +1358,8 @@ static bool mtk_hdmi_bridge_mode_fixup(struct drm_bridge *bridge,
>>   	return true;
>>   }
>>   
>> -static void mtk_hdmi_bridge_disable(struct drm_bridge *bridge)
>> +static void mtk_hdmi_bridge_atomic_disable(struct drm_bridge *bridge,
>> +					   struct drm_bridge_state *old_bridge_state)
>>   {
>>   	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
>>   
>> @@ -1368,10 +1370,13 @@ static void mtk_hdmi_bridge_disable(struct drm_bridge *bridge)
>>   	clk_disable_unprepare(hdmi->clk[MTK_HDMI_CLK_HDMI_PIXEL]);
>>   	clk_disable_unprepare(hdmi->clk[MTK_HDMI_CLK_HDMI_PLL]);
>>   
>> +	hdmi->curr_conn = NULL;
>> +
>>   	hdmi->enabled = false;
>>   }
>>   
>> -static void mtk_hdmi_bridge_post_disable(struct drm_bridge *bridge)
>> +static void mtk_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
>> +						struct drm_bridge_state *old_state)
>>   {
>>   	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
>>   
>> @@ -1406,7 +1411,8 @@ static void mtk_hdmi_bridge_mode_set(struct drm_bridge *bridge,
>>   	drm_mode_copy(&hdmi->mode, adjusted_mode);
>>   }
>>   
>> -static void mtk_hdmi_bridge_pre_enable(struct drm_bridge *bridge)
>> +static void mtk_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
>> +					      struct drm_bridge_state *old_state)
>>   {
>>   	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
>>   
>> @@ -1426,10 +1432,16 @@ static void mtk_hdmi_send_infoframe(struct mtk_hdmi *hdmi,
>>   		mtk_hdmi_setup_vendor_specific_infoframe(hdmi, mode);
>>   }
>>   
>> -static void mtk_hdmi_bridge_enable(struct drm_bridge *bridge)
>> +static void mtk_hdmi_bridge_atomic_enable(struct drm_bridge *bridge,
>> +					  struct drm_bridge_state *old_state)
>>   {
>> +	struct drm_atomic_state *state = old_state->base.state;
>>   	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
>>   
>> +	/* Retrieve the connector through the atomic state. */
>> +	hdmi->curr_conn = drm_atomic_get_new_connector_for_encoder(state,
>> +								   bridge->encoder);
>> +
>>   	mtk_hdmi_output_set_display_mode(hdmi, &hdmi->mode);
>>   	clk_prepare_enable(hdmi->clk[MTK_HDMI_CLK_HDMI_PLL]);
>>   	clk_prepare_enable(hdmi->clk[MTK_HDMI_CLK_HDMI_PIXEL]);
>> @@ -1440,13 +1452,16 @@ static void mtk_hdmi_bridge_enable(struct drm_bridge *bridge)
>>   }
>>   
>>   static const struct drm_bridge_funcs mtk_hdmi_bridge_funcs = {
>> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
>> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
>> +	.atomic_reset = drm_atomic_helper_bridge_reset,
>>   	.attach = mtk_hdmi_bridge_attach,
>>   	.mode_fixup = mtk_hdmi_bridge_mode_fixup,
>> -	.disable = mtk_hdmi_bridge_disable,
>> -	.post_disable = mtk_hdmi_bridge_post_disable,
>> +	.atomic_disable = mtk_hdmi_bridge_atomic_disable,
>> +	.atomic_post_disable = mtk_hdmi_bridge_atomic_post_disable,
>>   	.mode_set = mtk_hdmi_bridge_mode_set,
>> -	.pre_enable = mtk_hdmi_bridge_pre_enable,
>> -	.enable = mtk_hdmi_bridge_enable,
>> +	.atomic_pre_enable = mtk_hdmi_bridge_atomic_pre_enable,
>> +	.atomic_enable = mtk_hdmi_bridge_atomic_enable,
>>   };
>>   
>>   static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
>> @@ -1662,8 +1677,10 @@ static int mtk_hdmi_audio_get_eld(struct device *dev, void *data, uint8_t *buf,
>>   {
>>   	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
>>   
>> -	memcpy(buf, hdmi->conn.eld, min(sizeof(hdmi->conn.eld), len));
>> -
>> +	if (hdmi->curr_conn)
>> +		memcpy(buf, hdmi->curr_conn->eld, min(sizeof(hdmi->curr_conn->eld), len));
>> +	else
>> +		memset(buf, 0, len);
>>   	return 0;
>>   }
>>   
>>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
