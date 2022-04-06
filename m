Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 045694F5A44
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 11:46:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFDB110F256;
	Wed,  6 Apr 2022 09:46:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B60610F24B
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 09:46:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BB32A6162A;
 Wed,  6 Apr 2022 09:46:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A667AC385A1;
 Wed,  6 Apr 2022 09:46:48 +0000 (UTC)
Message-ID: <cf89f24f-292a-44ae-c018-3db6081635b9@xs4all.nl>
Date: Wed, 6 Apr 2022 11:46:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v1 1/5] drm: bridge: dw_hdmi: cec: Add cec suspend/resume
 function
Content-Language: en-US
To: Sandor.yu@nxp.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, andrzej.hajda@intel.com,
 narmstrong@baylibre.com, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com
References: <cover.1649230434.git.Sandor.yu@nxp.com>
 <27380b83a1b17419a35a13e29a86a1989204d1c3.1649230434.git.Sandor.yu@nxp.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <27380b83a1b17419a35a13e29a86a1989204d1c3.1649230434.git.Sandor.yu@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: shengjiu.wang@nxp.com, cai.huoqing@linux.dev, maxime@cerno.tech,
 amuel@sholland.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sandor,

On 06/04/2022 10:48, Sandor.yu@nxp.com wrote:
> From: Sandor Yu <Sandor.yu@nxp.com>
> 
> CEC interrupt status/mask and logical address registers
> will be reset when device enter suspend.
> It will cause cec fail to work after device resume.
> Add CEC suspend/resume functions, save these registers status
> when suspend and restore them when resume.
> 
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
> index c8f44bcb298a..ceb619b32fde 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
> @@ -18,6 +18,8 @@
>  
>  #include "dw-hdmi-cec.h"
>  
> +static u8 cec_saved_regs[5];

Ewww, not a global. Just save it in struct dw_hdmi_cec.

> +
>  enum {
>  	HDMI_IH_CEC_STAT0	= 0x0106,
>  	HDMI_IH_MUTE_CEC_STAT0	= 0x0186,
> @@ -306,11 +308,44 @@ static int dw_hdmi_cec_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static int __maybe_unused dw_hdmi_cec_resume(struct device *dev)
> +{
> +	struct dw_hdmi_cec *cec = dev_get_drvdata(dev);
> +
> +	/* Restore logical address and interrupt status/mask register */
> +	dw_hdmi_write(cec, cec_saved_regs[0], HDMI_CEC_ADDR_L);
> +	dw_hdmi_write(cec, cec_saved_regs[1], HDMI_CEC_ADDR_H);

No need to store HDMI_CEC_ADDR_L/R, just use cec->addresses.

> +	dw_hdmi_write(cec, cec_saved_regs[2], HDMI_CEC_POLARITY);
> +	dw_hdmi_write(cec, cec_saved_regs[3], HDMI_CEC_MASK);
> +	dw_hdmi_write(cec, cec_saved_regs[4], HDMI_IH_MUTE_CEC_STAT0);

This doesn't call cec->ops->disable/enable. It might be better to just call
dw_hdmi_cec_enable() and store the enable state in struct dw_hdmi_cec.

Regards,

	Hans

> +
> +	return 0;
> +}
> +
> +static int __maybe_unused dw_hdmi_cec_suspend(struct device *dev)
> +{
> +	struct dw_hdmi_cec *cec = dev_get_drvdata(dev);
> +
> +	/* store logical address and interrupt status/mask register */
> +	cec_saved_regs[0] = dw_hdmi_read(cec, HDMI_CEC_ADDR_L);
> +	cec_saved_regs[1] = dw_hdmi_read(cec, HDMI_CEC_ADDR_H);
> +	cec_saved_regs[2] = dw_hdmi_read(cec, HDMI_CEC_POLARITY);
> +	cec_saved_regs[3] = dw_hdmi_read(cec, HDMI_CEC_MASK);
> +	cec_saved_regs[4] = dw_hdmi_read(cec, HDMI_IH_MUTE_CEC_STAT0);
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops dw_hdmi_cec_pm = {
> +	SET_SYSTEM_SLEEP_PM_OPS(dw_hdmi_cec_suspend, dw_hdmi_cec_resume)
> +};
> +
>  static struct platform_driver dw_hdmi_cec_driver = {
>  	.probe	= dw_hdmi_cec_probe,
>  	.remove	= dw_hdmi_cec_remove,
>  	.driver = {
>  		.name = "dw-hdmi-cec",
> +		.pm = &dw_hdmi_cec_pm,
>  	},
>  };
>  module_platform_driver(dw_hdmi_cec_driver);
