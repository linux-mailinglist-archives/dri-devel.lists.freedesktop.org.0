Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C41864CC327
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 17:46:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 461B810E2C9;
	Thu,  3 Mar 2022 16:46:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DD0110E2C9
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 16:46:22 +0000 (UTC)
Date: Thu, 03 Mar 2022 16:46:08 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v16 1/4] drm/bridge: dw-hdmi: introduce
 dw_hdmi_enable_poll()
To: Neil Armstrong <narmstrong@baylibre.com>
Message-Id: <W8H68R.34YMAB8619ZY1@crapouillou.net>
In-Reply-To: <983e9064-17ad-e646-f37d-ca9173ba0967@baylibre.com>
References: <cover.1645895582.git.hns@goldelico.com>
 <e54838849f80454b863f9f5634dd10f79ef7bb8f.1645895582.git.hns@goldelico.com>
 <983e9064-17ad-e646-f37d-ca9173ba0967@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
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
Cc: Paul Boddie <paul@boddie.org.uk>, Maxime Ripard <maxime@cerno.tech>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-kernel@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 letux-kernel@openphoenux.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil,

Le jeu., mars 3 2022 at 17:23:02 +0100, Neil Armstrong=20
<narmstrong@baylibre.com> a =E9crit :
> Hi,
>=20
> On 26/02/2022 18:12, H. Nikolaus Schaller wrote:
>> so that specialization drivers like ingenic-dw-hdmi can enable=20
>> polling.
>>=20
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> ---
>>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 9 +++++++++
>>   include/drm/bridge/dw_hdmi.h              | 1 +
>>   2 files changed, 10 insertions(+)
>>=20
>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c=20
>> b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> index 4befc104d2200..43e375da131e8 100644
>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> @@ -3217,6 +3217,15 @@ static int dw_hdmi_parse_dt(struct dw_hdmi=20
>> *hdmi)
>>   	return 0;
>>   }
>>   =7F+void dw_hdmi_enable_poll(struct dw_hdmi *hdmi, bool enable)
>> +{
>> +	if (hdmi->bridge.dev)
>> +		hdmi->bridge.dev->mode_config.poll_enabled =3D enable;
>> +	else
>> +		dev_warn(hdmi->dev, "no hdmi->bridge.dev");
>> +}
>> +EXPORT_SYMBOL_GPL(dw_hdmi_enable_poll);
>> +
>>   struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
>>   			      const struct dw_hdmi_plat_data *plat_data)
>>   {
>> diff --git a/include/drm/bridge/dw_hdmi.h=20
>> b/include/drm/bridge/dw_hdmi.h
>> index 2a1f85f9a8a3f..963960794b40e 100644
>> --- a/include/drm/bridge/dw_hdmi.h
>> +++ b/include/drm/bridge/dw_hdmi.h
>> @@ -196,5 +196,6 @@ enum drm_connector_status=20
>> dw_hdmi_phy_read_hpd(struct dw_hdmi *hdmi,
>>   void dw_hdmi_phy_update_hpd(struct dw_hdmi *hdmi, void *data,
>>   			    bool force, bool disabled, bool rxsense);
>>   void dw_hdmi_phy_setup_hpd(struct dw_hdmi *hdmi, void *data);
>> +void dw_hdmi_enable_poll(struct dw_hdmi *hdmi, bool enable);
>>   =7F  #endif /* __IMX_HDMI_H__ */
>=20
> As I understand, this is because the IRQ line of the dw-hdmi IP isn't=20
> connected right ? and you use the display-connector ddc gpio instead ?

According to the CI20 schematic, it is wired properly. So that's=20
strange.

>=20
> In this case I think the Ingenic DRM core should call=20
> drm_kms_helper_poll_init(drm) instead.

Yes, the ingenic-drm driver does not poll for connectors because until=20
now it never has been needed.

Cheers,
-Paul


