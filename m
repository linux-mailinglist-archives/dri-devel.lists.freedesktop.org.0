Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0F15FC461
	for <lists+dri-devel@lfdr.de>; Wed, 12 Oct 2022 13:40:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC5F410E02A;
	Wed, 12 Oct 2022 11:40:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1EDF10E02A
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Oct 2022 11:40:46 +0000 (UTC)
Received: from [192.168.1.15] (91-158-154-79.elisa-laajakaista.fi
 [91.158.154.79])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 863614D3;
 Wed, 12 Oct 2022 13:40:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1665574845;
 bh=PoMLaUO3iyBb9Q+CXqh8cQQDeoGi91boQRGd4J0FeF4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hv8PP6D0a42nAn4AWOW4hYMJL3l4kKn9kZJAChIRsLp7xd3tCJllvTWPYgn914en5
 Dc2/p4u3ltPEM1WAF+cWplz0d1ccg99WlA73S0hnCkcFtmJqiuPJuWuWIt3VfP1LX3
 AF/VDcMAkFnFLB5o4NKDjwWSToajmoW64SFu5+EE=
Message-ID: <90ef166f-fe36-e243-6eee-516500986c6f@ideasonboard.com>
Date: Wed, 12 Oct 2022 14:40:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [RFC PATCH v5 3/6] drm/tidss: Add support for AM625 DSS
Content-Language: en-US
To: Aradhya Bhatia <a-bhatia1@ti.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220928175223.15225-1-a-bhatia1@ti.com>
 <20220928175223.15225-4-a-bhatia1@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20220928175223.15225-4-a-bhatia1@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Nishanth Menon <nm@ti.com>, Devicetree List <devicetree@vger.kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Rahul T R <r-ravikumar@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/09/2022 20:52, Aradhya Bhatia wrote:
> Add support for the DSS controller on TI's new AM625 SoC in the tidss
> driver.
> 
> The first video port (VP0) in am625-dss can output OLDI signals through
> 2 OLDI TXes. A 3rd port has been added with "DISPC_VP_OLDI" bus type.
> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> ---
>   drivers/gpu/drm/tidss/tidss_dispc.c | 61 ++++++++++++++++++++++++++++-
>   drivers/gpu/drm/tidss/tidss_dispc.h |  3 ++
>   drivers/gpu/drm/tidss/tidss_drv.c   |  1 +
>   3 files changed, 64 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
> index dd3c6a606ae2..34f0da4bb3e3 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
> @@ -93,6 +93,7 @@ const struct dispc_features dispc_k2g_feats = {
>   	.common_regs = tidss_k2g_common_regs,
>   
>   	.num_vps = 1,
> +	.num_max_ports = 1,

I would just use "num_ports" here, as it describes the HW (e.g. we have 
num_vps = 4 for J7, even if we'd only use one of the VPs).

I would also rename "TIDSS_MAX_PORTS". Maybe TIDSS_MAX_VPS. And check 
carefully that it's never used for the output ports.

Or maybe this field should be "num_output_ports", and try to use "output 
port" term in the driver for the..., well, output ports, to make the 
distinction between the videoport and output port more clear.

  Tomi

