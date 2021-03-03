Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CEB32B5D0
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 08:47:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2A0B89C8F;
	Wed,  3 Mar 2021 07:47:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5413389C8F
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 07:47:50 +0000 (UTC)
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi
 [91.157.208.71])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 421848CA;
 Wed,  3 Mar 2021 08:47:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1614757668;
 bh=2eUYi8WkyCSR/IvUdJsbthJPtQ8SRxzb0VtzXPk/p90=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=dVcgqk6Fgs4I4LnyK+D2lONMjr5SFZ+SWIgq8d+XqaQVuko4jJblguOh7oAL78fjQ
 f9VGFYaxjN/93eV1HvVHDNZlDmUyXQTFJ1DGX798vK+BH7gD2uPrR+G7vKWQjHZTwV
 FKJjBHLWn7p/zWscwc0TJwA2bOHkGiHLs7YTPQp4=
Subject: Re: [PATCHv2 6/6] drm/omapdrm/dss/hdmi5: add CEC support
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org
References: <20210302162403.983585-1-hverkuil-cisco@xs4all.nl>
 <20210302162403.983585-7-hverkuil-cisco@xs4all.nl>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <fe8eefe2-16d0-5d15-8a88-508d71a1f505@ideasonboard.com>
Date: Wed, 3 Mar 2021 09:47:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210302162403.983585-7-hverkuil-cisco@xs4all.nl>
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
Cc: devicetree@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
 Sekhar Nori <nsekhar@ti.com>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/03/2021 18:24, Hans Verkuil wrote:
> Add HDMI CEC support for OMAP5.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>   drivers/gpu/drm/omapdrm/Kconfig          |   8 +
>   drivers/gpu/drm/omapdrm/Makefile         |   1 +
>   drivers/gpu/drm/omapdrm/dss/hdmi.h       |   1 +
>   drivers/gpu/drm/omapdrm/dss/hdmi5.c      |  63 +++++--
>   drivers/gpu/drm/omapdrm/dss/hdmi5_cec.c  | 209 +++++++++++++++++++++++
>   drivers/gpu/drm/omapdrm/dss/hdmi5_cec.h  |  42 +++++
>   drivers/gpu/drm/omapdrm/dss/hdmi5_core.c |  35 +++-
>   drivers/gpu/drm/omapdrm/dss/hdmi5_core.h |  33 +++-
>   8 files changed, 373 insertions(+), 19 deletions(-)
>   create mode 100644 drivers/gpu/drm/omapdrm/dss/hdmi5_cec.c
>   create mode 100644 drivers/gpu/drm/omapdrm/dss/hdmi5_cec.h

<snip>

> diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5_core.h b/drivers/gpu/drm/omapdrm/dss/hdmi5_core.h
> index 070cbf5fb57d..a83b634f6011 100644
> --- a/drivers/gpu/drm/omapdrm/dss/hdmi5_core.h
> +++ b/drivers/gpu/drm/omapdrm/dss/hdmi5_core.h
> @@ -30,8 +30,18 @@
>   #define HDMI_CORE_IH_PHY_STAT0			0x00410
>   #define HDMI_CORE_IH_I2CM_STAT0			0x00414
>   #define HDMI_CORE_IH_CEC_STAT0			0x00418
> +#define CEC_STAT_DONE				BIT(0)
> +#define CEC_STAT_EOM				BIT(1)
> +#define CEC_STAT_NACK				BIT(2)
> +#define CEC_STAT_ARBLOST			BIT(3)
> +#define CEC_STAT_ERROR_INIT			BIT(4)
> +#define CEC_STAT_ERROR_FOLL			BIT(5)
> +#define CEC_STAT_WAKEUP				BIT(6)
> +
>   #define HDMI_CORE_IH_VP_STAT0			0x0041C
>   #define HDMI_CORE_IH_I2CMPHY_STAT0		0x00420
> +#define HDMI_CORE_IH_MUTE_I2CM_STAT0            0x00614

The line above has indentation in spaces, but everything else uses tabs.

Other than that:

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
