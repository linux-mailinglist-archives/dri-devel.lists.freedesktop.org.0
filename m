Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9276A6D55E4
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 03:28:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40E0E10E258;
	Tue,  4 Apr 2023 01:28:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AD1810E1BD
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 01:28:08 +0000 (UTC)
Received: from [127.0.0.1] (unknown [62.91.23.180])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id DA67185845;
 Tue,  4 Apr 2023 03:28:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1680571685;
 bh=x32yYJFvbxRm91oAwn0GIDCaguRd9ohMkYso/AFJYD8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=J7n52nxmtiFY65dq5arEvECpelhbd2oXBz34Q1W6BrboQXF0qWEWdc4YXRUqo7FZ2
 rLCnLTDRikwpTa3urNttLf+Q3vRWLgpp9ei0k/mnxdTkA0gYelNlszTFr9OTAHpym9
 wG8CK9eSEu7zt6eHy1bBWmIWb+WkurkuWjeYojzDqoVBTDFbfwuWnHNYUFZ9A6xfrf
 RIbBeMoMESccg1GAGlIhQpzmen7dDTXs/NlP3zXxWqT4rre9nDiCiV8gKLMSRgorpP
 f/L/gx/6RxCHCMD7K2apUFDaoHCT0TSUu077rraglF8VQLAoh/9kT581qDt7k6D6RX
 +KTpgD0ykhueg==
Message-ID: <47251659-c31c-2d71-48ee-59b3611b8e16@denx.de>
Date: Tue, 4 Apr 2023 03:28:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 2/2] drm/bridge: fsl-ldb: Add i.MX6SX support
To: Fabio Estevam <festevam@gmail.com>, neil.armstrong@linaro.org
References: <20230330104233.785097-1-festevam@gmail.com>
 <20230330104233.785097-2-festevam@gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230330104233.785097-2-festevam@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Fabio Estevam <festevam@denx.de>, devicetree@vger.kernel.org,
 robh+dt@kernel.org, dri-devel@lists.freedesktop.org,
 krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/30/23 12:42, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> i.MX6SX has a single LVDS port and share a similar LDB_CTRL register layout
> with i.MX8MP and i.MX93.
> 
> There is no LVDS CTRL register on the i.MX6SX, so only write to
> this register on the appropriate SoCs.
> 
> Add support for the i.MX6SX LDB.
> 
> Tested on a imx6sx-sdb board with a Hannstar HSD100PXN1 LVDS panel
> and also on a custom i.MX6SX-based board.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
> Changes since v1:
> - None
> 
>   drivers/gpu/drm/bridge/fsl-ldb.c | 14 +++++++++++++-
>   1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
> index 450b352914f4..f8e5d8ab98e3 100644
> --- a/drivers/gpu/drm/bridge/fsl-ldb.c
> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
> @@ -56,6 +56,7 @@
>   #define LVDS_CTRL_VBG_ADJ_MASK			GENMASK(19, 17)
>   
>   enum fsl_ldb_devtype {
> +	IMX6SX_LDB,
>   	IMX8MP_LDB,
>   	IMX93_LDB,
>   };
> @@ -64,9 +65,14 @@ struct fsl_ldb_devdata {
>   	u32 ldb_ctrl;
>   	u32 lvds_ctrl;
>   	bool lvds_en_bit;
> +	bool not_lvds_ctrl;

You might want to rename this one to something like 
"composite_control_reg" since the MX6SX only has one LDB control 
register instead of two like the newer SoCs. But that's optional change.

Reviewed-by: Marek Vasut <marex@denx.de>
