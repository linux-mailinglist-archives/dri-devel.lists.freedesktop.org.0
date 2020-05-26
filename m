Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4541E2403
	for <lists+dri-devel@lfdr.de>; Tue, 26 May 2020 16:23:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A65D86E203;
	Tue, 26 May 2020 14:23:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from o1.b.az.sendgrid.net (o1.b.az.sendgrid.net [208.117.55.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CC956E203
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 14:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=subject:references:from:mime-version:in-reply-to:to:cc:content-type:
 content-transfer-encoding;
 s=001; bh=ie97RCMqs9WlH5PrH5gP6SPJ+2aqk/2htFbe3e8r2sU=;
 b=nnaifkHDU7u7OiZn2shdaetzJbo3Cz5rPyLTx3ko6nSWJkeE85tzlVo5OYo/pv1KvgRp
 iHwpysizDpV+E+cy7zv+qwpxaCmHa065KJQn9HP6U/U1qEbw2Y8TXr6+iIVPrXFmZYNmhG
 XKFGQeEZa9UdC8s27B5E8kmWTaR9/xGJs=
Received: by filterdrecv-p3mdw1-6dbfd75bfd-nqctr with SMTP id
 filterdrecv-p3mdw1-6dbfd75bfd-nqctr-17-5ECD2665-3E
 2020-05-26 14:23:33.712454802 +0000 UTC m=+2140699.008479997
Received: from [192.168.1.14] (unknown)
 by ismtpd0006p1lon1.sendgrid.net (SG) with ESMTP
 id EZEpupCJTmKe0lyPkCcqtA Tue, 26 May 2020 14:23:33.365 +0000 (UTC)
Subject: Re: [PATCH 23/27] drm: bridge: dw-hdmi: Attach to next bridge if
 available
References: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200526011505.31884-24-laurent.pinchart+renesas@ideasonboard.com>
 <f75a9b4f-a283-53b1-ecb1-2bb6c9a278d6@baylibre.com>
From: Jonas Karlman <jonas@kwiboo.se>
Message-ID: <b803dc36-f3f1-f90c-ac53-302d24397c2b@kwiboo.se>
Date: Tue, 26 May 2020 14:23:33 +0000 (UTC)
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <f75a9b4f-a283-53b1-ecb1-2bb6c9a278d6@baylibre.com>
X-SG-EID: =?us-ascii?Q?TdbjyGynYnRZWhH+7lKUQJL+ZxmxpowvO2O9SQF5CwCVrYgcwUXgU5DKUU3QxA?=
 =?us-ascii?Q?fZekEeQsTe+RrMu3cja6a0h03NQHLu7HFkXoiqq?=
 =?us-ascii?Q?cGhSu4gsDewthSmCjmgCBy04zO+sjUcH8+8tQz6?=
 =?us-ascii?Q?FEKYOzFgLEeTlFG3OfqAnHj8Ipk4AfKJULvfmKM?=
 =?us-ascii?Q?zQgGWfaN1SdXpkwf8h2Yw3ZDzaoj42h9+PlIp+Z?=
 =?us-ascii?Q?22ou=2Fg9MuHV6lYTMrqXHMT=2FDPEwO6srIzXkpkSx?=
 =?us-ascii?Q?m5a+TrSxWyh9L6wj+NXEQ=3D=3D?=
To: Neil Armstrong <narmstrong@baylibre.com>, Laurent Pinchart
 <laurent.pinchart+renesas@ideasonboard.com>, dri-devel@lists.freedesktop.org
Content-Language: sv
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
Cc: linux-renesas-soc@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Sam Ravnborg <sam@ravnborg.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-05-26 14:50, Neil Armstrong wrote:
> On 26/05/2020 03:15, Laurent Pinchart wrote:
>> On all platforms except i.MX and Rockchip, the dw-hdmi DT bindings
>> require a video output port connected to an HDMI sink (most likely an
>> HDMI connector, in rare cases another bridges converting HDMI to another
>> protocol). For those platforms, retrieve the next bridge and attach it
>> from the dw-hdmi bridge attach handler.
>>
>> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>> ---
>>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 52 ++++++++++++++++++++++-
>>  include/drm/bridge/dw_hdmi.h              |  2 +
>>  2 files changed, 53 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> index 6148a022569a..512e67bb1c32 100644
>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> @@ -143,6 +143,7 @@ struct dw_hdmi_phy_data {
>>  struct dw_hdmi {
>>  	struct drm_connector connector;
>>  	struct drm_bridge bridge;
>> +	struct drm_bridge *next_bridge;
>>  
>>  	unsigned int version;
>>  
>> @@ -2797,7 +2798,8 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge,
>>  	struct dw_hdmi *hdmi = bridge->driver_private;
>>  
>>  	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
>> -		return 0;
>> +		return drm_bridge_attach(bridge->encoder, hdmi->next_bridge,
>> +					 bridge, flags);
>>  
>>  	return dw_hdmi_connector_create(hdmi);
>>  }
>> @@ -3179,6 +3181,50 @@ static void dw_hdmi_init_hw(struct dw_hdmi *hdmi)
>>  		hdmi->phy.ops->setup_hpd(hdmi, hdmi->phy.data);
>>  }
>>  
>> +static int dw_hdmi_parse_dt(struct dw_hdmi *hdmi)
>> +{
>> +	struct device_node *endpoint;
>> +	struct device_node *remote;
>> +
>> +	if (!hdmi->plat_data->output_port)
>> +		return 0;
>> +
>> +	endpoint = of_graph_get_endpoint_by_regs(hdmi->dev->of_node,
>> +						 hdmi->plat_data->output_port,
>> +						 -1);
>> +	if (!endpoint) {
>> +		/*
>> +		 * Don't treat this as a fatal error as the Rockchip DW-HDMI
>> +		 * binding doesn't make the output port mandatory.
>> +		 */
>> +		dev_dbg(hdmi->dev, "Missing endpoint in port@%u\n",
>> +			hdmi->plat_data->output_port);
>> +		return 0;

After this series only rcar-du set output_port so this block should only
run for rcar-du, for platforms without output_port the if-statement
for !hdmi->plat_data->output_port already return success so you can
probably return fatal error here.

The comment is a little bit misleading because of the if-statement above
or am I missing something?

Regards,
Jonas

>> +	}
>> +
>> +	remote = of_graph_get_remote_port_parent(endpoint);
>> +	of_node_put(endpoint);
>> +	if (!remote) {
>> +		dev_err(hdmi->dev, "Endpoint in port@%u unconnected\n",
>> +			hdmi->plat_data->output_port);
>> +		return -ENODEV;
>> +	}
>> +
>> +	if (!of_device_is_available(remote)) {
>> +		dev_err(hdmi->dev, "port@%u remote device is disabled\n",
>> +			hdmi->plat_data->output_port);
>> +		of_node_put(remote);
>> +		return -ENODEV;
>> +	}
>> +
>> +	hdmi->next_bridge = of_drm_find_bridge(remote);
>> +	of_node_put(remote);
>> +	if (!hdmi->next_bridge)
>> +		return -EPROBE_DEFER;
> 
> I'll be safer to print a warn for now until all platforms has been tested.
> 
>> +
>> +	return 0;
>> +}
>> +
>>  static struct dw_hdmi *
>>  __dw_hdmi_probe(struct platform_device *pdev,
>>  		const struct dw_hdmi_plat_data *plat_data)
>> @@ -3216,6 +3262,10 @@ __dw_hdmi_probe(struct platform_device *pdev,
>>  	mutex_init(&hdmi->cec_notifier_mutex);
>>  	spin_lock_init(&hdmi->audio_lock);
>>  
>> +	ret = dw_hdmi_parse_dt(hdmi);
>> +	if (ret < 0)
>> +		return ERR_PTR(ret);
>> +
>>  	ddc_node = of_parse_phandle(np, "ddc-i2c-bus", 0);
>>  	if (ddc_node) {
>>  		hdmi->ddc = of_get_i2c_adapter_by_node(ddc_node);
>> diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
>> index ea34ca146b82..8ebeb65d6371 100644
>> --- a/include/drm/bridge/dw_hdmi.h
>> +++ b/include/drm/bridge/dw_hdmi.h
>> @@ -126,6 +126,8 @@ struct dw_hdmi_phy_ops {
>>  struct dw_hdmi_plat_data {
>>  	struct regmap *regm;
>>  
>> +	unsigned int output_port;
>> +
>>  	unsigned long input_bus_encoding;
>>  	bool use_drm_infoframe;
>>  	bool ycbcr_420_allowed;
>>
> 
> I must check on meson, since I'm not sure for now if the connector probes.
> 
> Anyway, this looks fine.
> 
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
