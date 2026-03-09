Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iAfACmvBrmmRIgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 13:47:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8326D239200
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 13:47:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A17210E181;
	Mon,  9 Mar 2026 12:47:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="el/ScjM4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8681210E4E7
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 12:47:34 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 03B721A2DAB;
 Mon,  9 Mar 2026 12:47:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C9B875FFB8;
 Mon,  9 Mar 2026 12:47:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 09B6810369B97; Mon,  9 Mar 2026 13:47:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773060451; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=wCTUnhuxvulHzW4p0uUdfASMjS854LLOHF+KryEvCLg=;
 b=el/ScjM4Ue552Q5u0YpglfOiNwlnWqvRvgPZRn0f2Rw9gC2K6miO3fjP58Kezv524ydiSu
 TnJe8U2jt+A1EJ6DB1yTs7y0A6UQYZvTUFLzohffbj2jx9dbDYRqYRIm/DKsAlA08WUE5o
 h+sY8NUKOa8F7OPKU7GdMADmAbHvAOWT3Xycjjt/+QEJcuQ8UijP4u56/6n693iG274Qyw
 TW2fwFCVxVMyU/LU5PH1DEo0plMmeu9xMuFSnZIDm/fLs/dYFW8oWIDiOD5qWXRnYonHxk
 qlKDmbIRISO2L4epJFOCo80mqRQNmcnKOiRv5ruerLteKpajtRCpOmq8Cv4YXQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Mar 2026 13:47:18 +0100
Message-Id: <DGY9GWWLXGNX.265MMEXXCG8YA@bootlin.com>
Subject: Re: [PATCH v7 3/8] drm: verisilicon: add a driver for Verisilicon
 display controllers
Cc: "Philipp Zabel" <p.zabel@pengutronix.de>, "Dmitry Baryshkov"
 <lumag@kernel.org>, "Michal Wilczynski" <m.wilczynski@samsung.com>, "Han
 Gao" <gaohan@iscas.ac.cn>, "Yao Zi" <ziyao@disroot.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>, "Icenowy
 Zheng" <uwu@icenowy.me>
To: "Icenowy Zheng" <zhengxingda@iscas.ac.cn>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Drew Fustini" <fustini@kernel.org>, "Guo
 Ren" <guoren@kernel.org>, "Fu Wei" <wefu@redhat.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260129023922.1527729-1-zhengxingda@iscas.ac.cn>
 <20260129023922.1527729-4-zhengxingda@iscas.ac.cn>
In-Reply-To: <20260129023922.1527729-4-zhengxingda@iscas.ac.cn>
X-Last-TLS-Session-Version: TLSv1.3
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
X-Rspamd-Queue-Id: 8326D239200
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:p.zabel@pengutronix.de,m:lumag@kernel.org,m:m.wilczynski@samsung.com,m:gaohan@iscas.ac.cn,m:ziyao@disroot.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:uwu@icenowy.me,m:zhengxingda@iscas.ac.cn,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:fustini@kernel.org,m:guoren@kernel.org,m:wefu@redhat.com,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[iscas.ac.cn,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,redhat.com];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[luca.ceresoli@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:dkim,bootlin.com:url,bootlin.com:mid,suse.de:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,samsung.com:email,iscas.ac.cn:email]
X-Rspamd-Action: no action

Hello Icenowy Zheng,

On Thu Jan 29, 2026 at 3:39 AM CET, Icenowy Zheng wrote:
> From: Icenowy Zheng <uwu@icenowy.me>
>
> This is a from-scratch driver targeting Verisilicon DC-series display
> controllers, which feature self-identification functionality like their
> GC-series GPUs.
>
> Only DC8200 is being supported now, and only the main framebuffer is set
> up (as the DRM primary plane). Support for more DC models and more
> features is my further targets.
>
> As the display controller is delivered to SoC vendors as a whole part,
> this driver does not use component framework and extra bridges inside a
> SoC is expected to be implemented as dedicated bridges (this driver
> properly supports bridge chaining).
>
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> Tested-by: Han Gao <gaohan@iscas.ac.cn>
> Tested-by: Michal Wilczynski <m.wilczynski@samsung.com>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

I have reviewed the bridge part of this patch and have a few remarks, see
below.

[...]

> +++ b/drivers/gpu/drm/verisilicon/vs_bridge.c
> @@ -0,0 +1,371 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2025 Icenowy Zheng <uwu@icenowy.me>
> + */
> +
> +#include <linux/of.h>
> +#include <linux/regmap.h>
> +
> +#include <uapi/linux/media-bus-format.h>
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_bridge_connector.h>
> +#include <drm/drm_connector.h>
> +#include <drm/drm_encoder.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_print.h>
> +#include <drm/drm_simple_kms_helper.h>
> +
> +#include "vs_bridge.h"
> +#include "vs_bridge_regs.h"
> +#include "vs_crtc.h"
> +#include "vs_dc.h"
> +
> +static int vs_bridge_attach(struct drm_bridge *bridge,
> +			    struct drm_encoder *encoder,
> +			    enum drm_bridge_attach_flags flags)
> +{
> +	struct vs_bridge *vbridge =3D drm_bridge_to_vs_bridge(bridge);
> +
> +	return drm_bridge_attach(encoder, vbridge->next_bridge,
> +				 bridge, flags);
> +}
> +
> +struct vsdc_dp_format {
> +	u32 linux_fmt;
> +	bool is_yuv;
> +	u32 vsdc_fmt;
> +};

Moving the bool after the two 'u32's would be better for packing and
spatial locality (especially in case more fields are added in the future).

> +
> +static struct vsdc_dp_format vsdc_dp_supported_fmts[] =3D {
> +	/* default to RGB888 */
> +	{ MEDIA_BUS_FMT_FIXED, false, VSDC_DISP_DP_CONFIG_FMT_RGB888 },
> +	{ MEDIA_BUS_FMT_RGB888_1X24, false, VSDC_DISP_DP_CONFIG_FMT_RGB888 },
> +	{ MEDIA_BUS_FMT_RGB565_1X16, false, VSDC_DISP_DP_CONFIG_FMT_RGB565 },
> +	{ MEDIA_BUS_FMT_RGB666_1X18, false, VSDC_DISP_DP_CONFIG_FMT_RGB666 },
> +	{ MEDIA_BUS_FMT_RGB101010_1X30,
> +	  false, VSDC_DISP_DP_CONFIG_FMT_RGB101010 },

You can put up to 100 chars per line and avoid the newline here to make
this table more readable. Same below.

> +	{ MEDIA_BUS_FMT_UYVY8_1X16, true, VSDC_DISP_DP_CONFIG_YUV_FMT_UYVY8 },
> +	{ MEDIA_BUS_FMT_UYVY10_1X20, true, VSDC_DISP_DP_CONFIG_YUV_FMT_UYVY10 }=
,
> +	{ MEDIA_BUS_FMT_YUV8_1X24, true, VSDC_DISP_DP_CONFIG_YUV_FMT_YUV8 },
> +	{ MEDIA_BUS_FMT_YUV10_1X30, true, VSDC_DISP_DP_CONFIG_YUV_FMT_YUV10 },
> +	{ MEDIA_BUS_FMT_UYYVYY8_0_5X24,
> +	  true, VSDC_DISP_DP_CONFIG_YUV_FMT_UYYVYY8 },
> +	{ MEDIA_BUS_FMT_UYYVYY10_0_5X30,
> +	  true, VSDC_DISP_DP_CONFIG_YUV_FMT_UYYVYY10 },
> +};
> +

[...]

> +struct vs_bridge *vs_bridge_init(struct drm_device *drm_dev,
> +				 struct vs_crtc *crtc)
> +{
> +	unsigned int output =3D crtc->id;
> +	struct vs_bridge *bridge;

In common practice a variable named 'bridge' is used to point to a 'struct
drm_bridge', so it feels weird when it is used for another type. Can you
rename to 'vbridge' or 'vsbridge' or similar, to clarify it's the
"Verisilicon bridge"?

This is after all what you did in vs_bridge_attach() above, where the
ambiguity of the 'bridge' name used for a driver-specific struct is
evident.

> +	struct drm_bridge *next;
> +	enum vs_bridge_output_interface intf;
> +	const struct drm_bridge_funcs *bridge_funcs;
> +	int ret, enctype;
> +
> +	intf =3D vs_bridge_detect_output_interface(drm_dev->dev->of_node,
> +						 output);
> +	if (intf =3D=3D -ENODEV) {
> +		drm_dbg(drm_dev, "Skipping output %u\n", output);
> +		return NULL;
> +	}
> +
> +	next =3D devm_drm_of_get_bridge(drm_dev->dev, drm_dev->dev->of_node,
> +				      output, intf);
> +	if (IS_ERR(next)) {
> +		ret =3D PTR_ERR(next);
> +		if (ret !=3D -EPROBE_DEFER)
> +			drm_err(drm_dev,
> +				"Cannot get downstream bridge of output %u\n",
> +				output);

100 chars per line are allowed, so this could fit on a single line being
nicer to read. This applies to a lot places in this driver, of logging
calls in particular. I understand this would be annoying to change on an
already reviewed patch and at v7 so up to you, but it would be good to keep
it in mind for the future.

> +		return ERR_PTR(ret);
> +	}
> +
> +	if (intf =3D=3D VSDC_OUTPUT_INTERFACE_DPI)
> +		bridge_funcs =3D &vs_dpi_bridge_funcs;
> +	else
> +		bridge_funcs =3D &vs_dp_bridge_funcs;
> +
> +	bridge =3D devm_drm_bridge_alloc(drm_dev->dev, struct vs_bridge, base,
> +				       bridge_funcs);

The 'struct drm_bridge' field embedded in a driver-specific struct is
conventionally called 'bridge', so renaming it from 'base' to 'bridge'
would make it more consistent with other drivers. That would go in sync
with the coding convention I mentioned above: 'bridge' for struct
drm_bridge, <XYZ>bridge or just <XYZZ> for a custom driver struct embedding
a bridge.

> +	if (IS_ERR(bridge))
> +		return ERR_PTR(PTR_ERR(bridge));
> +
> +	bridge->crtc =3D crtc;
> +	bridge->intf =3D intf;
> +	bridge->next_bridge =3D next;

There is now a next_bridge field in struct drm_bridge, which handles the
bridge lifetime in a safer way and more simply [0], so you could use it:

       bridge->base.next_bridge =3D next;

Or, after the renames I suggested above:

       vbridge->bridge.next_bridge =3D next;

[0] https://elixir.bootlin.com/linux/v7.0-rc2/source/include/drm/drm_bridge=
.h#L1269-L1278

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
