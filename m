Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC8E4CC340
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 17:51:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 450E110E2DB;
	Thu,  3 Mar 2022 16:51:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C18BA10E2DB
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 16:51:45 +0000 (UTC)
Date: Thu, 03 Mar 2022 16:51:28 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [Letux-kernel] [PATCH v16 1/4] drm/bridge: dw-hdmi: introduce
 dw_hdmi_enable_poll()
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Message-Id: <SHH68R.Z3J9KSY0GQVA2@crapouillou.net>
In-Reply-To: <3E620AF4-402E-45EA-9D92-92EAEA9647F5@goldelico.com>
References: <cover.1645895582.git.hns@goldelico.com>
 <e54838849f80454b863f9f5634dd10f79ef7bb8f.1645895582.git.hns@goldelico.com>
 <983e9064-17ad-e646-f37d-ca9173ba0967@baylibre.com>
 <C8AE9A7A-E288-4637-ACAD-40CD33CD5F8C@goldelico.com>
 <3E620AF4-402E-45EA-9D92-92EAEA9647F5@goldelico.com>
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
Cc: Paul Boddie <paul@boddie.org.uk>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-mips <linux-mips@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Maxime Ripard <maxime@cerno.tech>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nikolaus,

Le jeu., mars 3 2022 at 17:43:05 +0100, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> Hi Neil,
>=20
>>  Am 03.03.2022 um 17:30 schrieb H. Nikolaus Schaller=20
>> <hns@goldelico.com>:
>>=20
>>  Hi Neil,
>>=20
>>>  Am 03.03.2022 um 17:23 schrieb Neil Armstrong=20
>>> <narmstrong@baylibre.com>:
>>>=20
>>>  Hi,
>>>=20
>>>  On 26/02/2022 18:12, H. Nikolaus Schaller wrote:
>>>>  so that specialization drivers like ingenic-dw-hdmi can enable=20
>>>> polling.
>>>>  Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>>>>  ---
>>>>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 9 +++++++++
>>>>  include/drm/bridge/dw_hdmi.h              | 1 +
>>>>  2 files changed, 10 insertions(+)
>>>>  diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c=20
>>>> b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>>>>  index 4befc104d2200..43e375da131e8 100644
>>>>  --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>>>>  +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>>>>  @@ -3217,6 +3217,15 @@ static int dw_hdmi_parse_dt(struct dw_hdmi=20
>>>> *hdmi)
>>>>  	return 0;
>>>>  }
>>>>  +void dw_hdmi_enable_poll(struct dw_hdmi *hdmi, bool enable)
>>>>  +{
>>>>  +	if (hdmi->bridge.dev)
>>>>  +		hdmi->bridge.dev->mode_config.poll_enabled =3D enable;
>>>>  +	else
>>>>  +		dev_warn(hdmi->dev, "no hdmi->bridge.dev");
>>>>  +}
>>>>  +EXPORT_SYMBOL_GPL(dw_hdmi_enable_poll);
>>>>  +
>>>>  struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
>>>>  			      const struct dw_hdmi_plat_data *plat_data)
>>>>  {
>>>>  diff --git a/include/drm/bridge/dw_hdmi.h=20
>>>> b/include/drm/bridge/dw_hdmi.h
>>>>  index 2a1f85f9a8a3f..963960794b40e 100644
>>>>  --- a/include/drm/bridge/dw_hdmi.h
>>>>  +++ b/include/drm/bridge/dw_hdmi.h
>>>>  @@ -196,5 +196,6 @@ enum drm_connector_status=20
>>>> dw_hdmi_phy_read_hpd(struct dw_hdmi *hdmi,
>>>>  void dw_hdmi_phy_update_hpd(struct dw_hdmi *hdmi, void *data,
>>>>  			    bool force, bool disabled, bool rxsense);
>>>>  void dw_hdmi_phy_setup_hpd(struct dw_hdmi *hdmi, void *data);
>>>>  +void dw_hdmi_enable_poll(struct dw_hdmi *hdmi, bool enable);
>>>>    #endif /* __IMX_HDMI_H__ */
>>>=20
>>>  As I understand, this is because the IRQ line of the dw-hdmi IP=20
>>> isn't connected right ? and you use the display-connector ddc gpio=20
>>> instead ?
>>=20
>>  Yes. The IRQ line is not connected on all boards as far as I can=20
>> see.
>>=20
>>>=20
>>>  In this case I think the Ingenic DRM core should call=20
>>> drm_kms_helper_poll_init(drm) instead.
>>=20
>>  Ah, that is good. it seems to do "dw_hdmi_enable_poll()" in a more=20
>> generic way.
>=20
> Well, I looked through source code and it is defined as
>=20
> 	void drm_kms_helper_poll_init(struct drm_device *dev)
>=20
> But there is no direct pointer to some drm_device available.
> Neither in dw-hdmi nor ingenic-dw-hdmi.

Well he said "the Ingenic DRM core" aka ingenic-drm-drv.c. You do have=20
access to the main drm_device in the ingenic_drm_bind() function, so=20
you can add it there (with a cleanup function calling=20
drm_kms_helper_poll_fini() registered with drmm_add_action_or_reset()).

Cheers,
-Paul

> What should the parameter to drm_kms_helper_poll_init(drm) be?
>=20
> From comparing code to be able to set mode_config.poll_enabled =3D=20
> enable it should be
>=20
> 	&hdmi->bridge.dev
>=20
> but the struct dw_hdmi *hdmi is an opaque type for the=20
> ingenic-dw-hdmi driver.
> So it can't access the hdmi-bridge directly.
>=20
> What we can do is to make dw_hdmi_enable_poll() call=20
> drm_kms_helper_poll_init()
> or drm_kms_helper_poll_fini().
>=20
> BR and thanks,
> Nikolaus
>=20
>=20


