Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4B0225309
	for <lists+dri-devel@lfdr.de>; Sun, 19 Jul 2020 19:18:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5F096E152;
	Sun, 19 Jul 2020 17:18:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27E326E152
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jul 2020 17:18:12 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id CE31220026;
 Sun, 19 Jul 2020 19:18:07 +0200 (CEST)
Date: Sun, 19 Jul 2020 19:18:06 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v5 3/4] drm/bridge: Introduce LT9611 DSI to HDMI bridge
Message-ID: <20200719171806.GA55541@ravnborg.org>
References: <20200708103559.132300-1-vkoul@kernel.org>
 <20200708103559.132300-4-vkoul@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200708103559.132300-4-vkoul@kernel.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8
 a=fbRPyE8KL9-ZYcdT3u0A:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=cvBusfyB2V15izCimMoJ:22 a=AjGcO6oz07-iQ99wixmX:22
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Emil Velikov <emil.l.velikov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Vinod.

Three trivial points below.
The rest looks good.

With these fixed you can add:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

	Sam

On Wed, Jul 08, 2020 at 04:05:58PM +0530, Vinod Koul wrote:
> Lontium Lt9611 is a DSI to HDMI bridge which supports two DSI ports and
> I2S port as an input and HDMI port as output
> 
> Co-developed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Tested-by: John Stultz <john.stultz@linaro.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  drivers/gpu/drm/bridge/Kconfig          |   13 +
>  drivers/gpu/drm/bridge/Makefile         |    1 +
>  drivers/gpu/drm/bridge/lontium-lt9611.c | 1142 +++++++++++++++++++++++
>  3 files changed, 1156 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/lontium-lt9611.c
> 
> +
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_print.h>

In alphabetical order. drm_probe_helper needs to be moved.

> +
> +#define EDID_SEG_SIZE	256
> +#define EDID_LEN	32
> +#define EDID_LOOP	8
> +#define KEY_DDC_ACCS_DONE 0x02
> +#define DDC_NO_ACK	0x50
> +


> +static void lt9611_pcr_setup(struct lt9611 *lt9611, const struct drm_display_mode *mode)
> +{
> +	const struct reg_sequence reg_cfg[] = {
> +		{ 0x830b, 0x01 },
> +		{ 0x830c, 0x10 },
> +		{ 0x8348, 0x00 },
> +		{ 0x8349, 0x81 },
> +
> +		/* stage 1 */
> +		{ 0x8321, 0x4a },
> +		{ 0x8324, 0x71 },
> +		{ 0x8325, 0x30 },
> +		{ 0x832a, 0x01 },
> +
> +		/* stage 2 */
> +		{ 0x834a, 0x40 },
> +		{ 0x831d, 0x10 },
> +
> +		/* MK limit */
> +		{ 0x832d, 0x38 },
> +		{ 0x8331, 0x08 },
> +	};
> +	const struct reg_sequence reg_cfg2[] = {
> +			{ 0x830b, 0x03 },
> +			{ 0x830c, 0xd0 },
> +			{ 0x8348, 0x03 },
> +			{ 0x8349, 0xe0 },
> +			{ 0x8324, 0x72 },
> +			{ 0x8325, 0x00 },
> +			{ 0x832a, 0x01 },
> +			{ 0x834a, 0x10 },
> +			{ 0x831d, 0x10 },
> +			{ 0x8326, 0x37 },
Block above is indented one tab too much.

> +static int lt9611_bridge_attach(struct drm_bridge *bridge,
> +				enum drm_bridge_attach_flags flags)
> +{
> +	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
> +	int ret;
> +
> +	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> +		dev_err(lt9611->dev, "Fix bridge driver to make connector optional!");
> +		return -EINVAL;
> +	}
This should say that the display driver should be fixed.
If a display driver expects this bridge to create the connector
it would not work.


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
