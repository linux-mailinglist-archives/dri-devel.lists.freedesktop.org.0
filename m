Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8029888D88
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 05:51:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C03F510E223;
	Mon, 25 Mar 2024 04:51:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="N65sXHly";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F8A610E223
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 04:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1711342240; x=1711947040; i=deller@gmx.de;
 bh=YWplhpM8Fa3pbw4y9TvIF8wTthCvp6mn6m4D3Ro2qGs=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=N65sXHlysQo7Nlk7li2pe4+QnBL7hKhtXr36PuEZs9hwP9ULJMfowXnDm2pOWrC0
 uzcvUjytd/UAiS75L/EPwO99XbC1PI8nWl1LCuT8hkFhMWKSbRpqBN+XKjuAjYIF6
 FDpU7J2RAHncPTap2IIl80rcoYfqUU98rbopP+svzgH4d9zrTjaAneMv/lN3gjAci
 HKytVVl7kOq0Ras8FCY0RvHF4X3kZcOCIuPyK7UWOQnS7xceDUNMkc5z+CzQzCwUd
 DkXycNhjSbSOKpkhVDSaMMNwLGrVUvkx8lq7D7WaYe+zY5VUWguIRUSgwE29Yw+oN
 5YJnuR0QG/D3/D5DNw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([89.244.186.175]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M3UZG-1rpAG20gxG-000ZxP; Mon, 25
 Mar 2024 05:50:40 +0100
Message-ID: <fb66cb66-4381-48ad-8a40-b317c5ffa4ed@gmx.de>
Date: Mon, 25 Mar 2024 05:50:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] video: fbdev: replace of_graph_get_next_endpoint()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Alexey Brodkin <abrodkin@synopsys.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org
References: <877chr6mu5.wl-kuninori.morimoto.gx@renesas.com>
 <874jcv6msn.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <874jcv6msn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:wJ7zXPDTrliMLMjo4tDZcS6Up5C23HMOJCMnPMsA1vtTj3DQJcA
 vUjypbOPGQ/jh6nPbGgk//ZtmeV0kzFklyZGaiETTWLi59W+PhPHsdLVK1yvRMyz3jOsP06
 PyLHoZgJI49p7hzesa1d6Znp+q5Qpon+YacA29L/6rxqX2QuCAljOhAM12s10VRyndwBdto
 8WFUB8F1Tst/Hx+jKKPpQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:jAdfYIBa2v8=;vB7o+63MKFbLCCmtkc4kwgTp1GE
 QlwbvQNhfDxZpJzthTZPiTObJ0GPE0HgQuKPO0Lw9cUOUR06Ox238l/2TqTzztnehZ0pTcTK2
 HmzjIbiz8bti9SitZh5AwNCO886EQSSEEGYEpLL8EzOGZGUOYtBsbG2jMgL2nsz0h5Fr2LRll
 dspgx7Y2APOCyf9vGukpGB6eKFS/zEbkAppSkc7cdXR6gKObFQC2Tm5OG0uuj8TyBmJ5QQbOm
 0mzQpeax/RVZL40twAf3+0Y+DsOM1fY1ADLntP+Qa1iWuRTVv40wKfLwZsMp4K1mWgQqRsbq3
 koCYy+rvF6obLLwxOmTsJjSemiG5vngCk3YqQjiCpM+dzvj8sIS6vTueNCnkr84J0NYf7gZPk
 1FWeExamROTDv5RDyi+kmYHOF8EP56N8zGGwzKEBgIH7DULQ1j0B6Q4sqsK8iDMgym+HsqU29
 rpg1+jckGxr2Vnb/7zwFQKnu3q/EN/BeeMtrHlRVCutuH1SaRn9cK843TcPbdBwbA1kUI559g
 KSF2m6zFhHnq91g6iBWww+0cYdFHELxWbSkfZkCCWYn93g7i+Z82sdPnYqhP8i2//aByS7Mdt
 zSPeJ7PblfMGv4puj0MdZuSMliOuJvGzzFMt/YqzkdgArFEdKLrpyC2cJMyolBivSO58KYwxf
 qoKzle8sDXXH9tTJ+4xNhYkP+J5Q0kYXDTnoh/TsSWQU4zoO7/fn6YzciqJ7z0ibipPTssEy3
 8zWedYwlKwfb9B76TNCM6KgdtoVgYGdA/FRYzAoN3bSv1kQEXPhvaUejiUNrOpj/XikzgshMu
 UFe/kEshYrlKcs9ooMAAr/+3L05CHWwwyzL83uWTToZv8=
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

On 3/25/24 03:57, Kuninori Morimoto wrote:
>  From DT point of view, in general, drivers should be asking for a
> specific port number because their function is fixed in the binding.
>
> of_graph_get_next_endpoint() doesn't match to this concept.
>
> Simply replace
>
> 	- of_graph_get_next_endpoint(xxx, NULL);
> 	+ of_graph_get_endpoint_by_regs(xxx, 0, -1);
>
> Link: https://lore.kernel.org/r/20240202174941.GA310089-robh@kernel.org
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

applied to fbdev git tree.

Thanks!
Helge


> ---
>   drivers/video/fbdev/omap2/omapfb/dss/dsi.c    |  3 ++-
>   drivers/video/fbdev/omap2/omapfb/dss/dss-of.c | 20 +------------------
>   drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c  |  3 ++-
>   drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c  |  3 ++-
>   drivers/video/fbdev/omap2/omapfb/dss/venc.c   |  3 ++-
>   drivers/video/fbdev/pxafb.c                   |  2 +-
>   include/video/omapfb_dss.h                    |  3 ---
>   7 files changed, 10 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dsi.c b/drivers/video/=
fbdev/omap2/omapfb/dss/dsi.c
> index b7eb17a16ec4..1f13bcf73da5 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
> @@ -28,6 +28,7 @@
>   #include <linux/debugfs.h>
>   #include <linux/pm_runtime.h>
>   #include <linux/of.h>
> +#include <linux/of_graph.h>
>   #include <linux/of_platform.h>
>   #include <linux/component.h>
>
> @@ -5079,7 +5080,7 @@ static int dsi_probe_of(struct platform_device *pd=
ev)
>   	struct device_node *ep;
>   	struct omap_dsi_pin_config pin_cfg;
>
> -	ep =3D omapdss_of_get_first_endpoint(node);
> +	ep =3D of_graph_get_endpoint_by_regs(node, 0, -1);
>   	if (!ep)
>   		return 0;
>
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c b/drivers/vid=
eo/fbdev/omap2/omapfb/dss/dss-of.c
> index 0282d4eef139..14965a3fd05b 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
> @@ -130,24 +130,6 @@ static struct device_node *omapdss_of_get_remote_po=
rt(const struct device_node *
>   	return np;
>   }
>
> -struct device_node *
> -omapdss_of_get_first_endpoint(const struct device_node *parent)
> -{
> -	struct device_node *port, *ep;
> -
> -	port =3D omapdss_of_get_next_port(parent, NULL);
> -
> -	if (!port)
> -		return NULL;
> -
> -	ep =3D omapdss_of_get_next_endpoint(port, NULL);
> -
> -	of_node_put(port);
> -
> -	return ep;
> -}
> -EXPORT_SYMBOL_GPL(omapdss_of_get_first_endpoint);
> -
>   struct omap_dss_device *
>   omapdss_of_find_source_for_first_ep(struct device_node *node)
>   {
> @@ -155,7 +137,7 @@ omapdss_of_find_source_for_first_ep(struct device_no=
de *node)
>   	struct device_node *src_port;
>   	struct omap_dss_device *src;
>
> -	ep =3D omapdss_of_get_first_endpoint(node);
> +	ep =3D of_graph_get_endpoint_by_regs(node, 0, -1);
>   	if (!ep)
>   		return ERR_PTR(-EINVAL);
>
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c b/drivers/vide=
o/fbdev/omap2/omapfb/dss/hdmi4.c
> index f05b4e35a842..8f407ec134dc 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c
> @@ -20,6 +20,7 @@
>   #include <linux/pm_runtime.h>
>   #include <linux/clk.h>
>   #include <linux/of.h>
> +#include <linux/of_graph.h>
>   #include <linux/regulator/consumer.h>
>   #include <linux/component.h>
>   #include <video/omapfb_dss.h>
> @@ -529,7 +530,7 @@ static int hdmi_probe_of(struct platform_device *pde=
v)
>   	struct device_node *ep;
>   	int r;
>
> -	ep =3D omapdss_of_get_first_endpoint(node);
> +	ep =3D of_graph_get_endpoint_by_regs(node, 0, -1);
>   	if (!ep)
>   		return 0;
>
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c b/drivers/vide=
o/fbdev/omap2/omapfb/dss/hdmi5.c
> index 03292945b1d4..4ad219f522b9 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c
> @@ -25,6 +25,7 @@
>   #include <linux/pm_runtime.h>
>   #include <linux/clk.h>
>   #include <linux/of.h>
> +#include <linux/of_graph.h>
>   #include <linux/regulator/consumer.h>
>   #include <linux/component.h>
>   #include <video/omapfb_dss.h>
> @@ -561,7 +562,7 @@ static int hdmi_probe_of(struct platform_device *pde=
v)
>   	struct device_node *ep;
>   	int r;
>
> -	ep =3D omapdss_of_get_first_endpoint(node);
> +	ep =3D of_graph_get_endpoint_by_regs(node, 0, -1);
>   	if (!ep)
>   		return 0;
>
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/venc.c b/drivers/video=
/fbdev/omap2/omapfb/dss/venc.c
> index c9d40e28a06f..0bd80d3b8f1b 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/venc.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/venc.c
> @@ -24,6 +24,7 @@
>   #include <linux/regulator/consumer.h>
>   #include <linux/pm_runtime.h>
>   #include <linux/of.h>
> +#include <linux/of_graph.h>
>   #include <linux/component.h>
>
>   #include <video/omapfb_dss.h>
> @@ -764,7 +765,7 @@ static int venc_probe_of(struct platform_device *pde=
v)
>   	u32 channels;
>   	int r;
>
> -	ep =3D omapdss_of_get_first_endpoint(node);
> +	ep =3D of_graph_get_endpoint_by_regs(node, 0, -1);
>   	if (!ep)
>   		return 0;
>
> diff --git a/drivers/video/fbdev/pxafb.c b/drivers/video/fbdev/pxafb.c
> index fa943612c4e2..2ef56fa28aff 100644
> --- a/drivers/video/fbdev/pxafb.c
> +++ b/drivers/video/fbdev/pxafb.c
> @@ -2171,7 +2171,7 @@ static int of_get_pxafb_mode_info(struct device *d=
ev,
>   	u32 bus_width;
>   	int ret, i;
>
> -	np =3D of_graph_get_next_endpoint(dev->of_node, NULL);
> +	np =3D of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
>   	if (!np) {
>   		dev_err(dev, "could not find endpoint\n");
>   		return -EINVAL;
> diff --git a/include/video/omapfb_dss.h b/include/video/omapfb_dss.h
> index e8eaac2cb7b8..a8c0c3eeeb5b 100644
> --- a/include/video/omapfb_dss.h
> +++ b/include/video/omapfb_dss.h
> @@ -819,9 +819,6 @@ struct device_node *
>   omapdss_of_get_next_endpoint(const struct device_node *parent,
>   			     struct device_node *prev);
>
> -struct device_node *
> -omapdss_of_get_first_endpoint(const struct device_node *parent);
> -
>   struct omap_dss_device *
>   omapdss_of_find_source_for_first_ep(struct device_node *node);
>   #else

