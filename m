Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FACE5ED167
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 02:10:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F6A910E1B9;
	Wed, 28 Sep 2022 00:10:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3E6F10E1B9
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 00:10:28 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 142BA84DF9;
 Wed, 28 Sep 2022 02:10:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1664323827;
 bh=c2kgLT2pf8m/qDGVt+gjAXWrMN0IX5ZWi70kNAg02kU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=zPFzDrXz/dxbKxT58OFRmg892Ko4Og6w7g0OElLODVd3pGiHAgZk+YCYJyIUqgZBx
 MQVBJCUrFHgEC/I0W1lXM5x0rg2tpCfSBCZhA5ZpPf++EgCpx/URdwG3ztroBJpZkh
 a0OVeX2HvDcXXDzKKkchlaInY5JydaQnFBy1NGrXKNIxyq3Y8egdD+GhrRn3nSpv7g
 gb6r9VvTXT49J8k1QkamKwdkmbYFQUy+5VtZuqhfgFPmfFY0ZEOBeLZfdwoWj7WPZD
 PvPo3+RNmxVMUN5OGGJPRmD5pqZrLVkThZa6rOHDo/uUyvKDrL69hU8tl1UviRillU
 wCFyW74G3KMnQ==
Message-ID: <e7dd7021-3892-298e-6c84-aaff1abfefdf@denx.de>
Date: Wed, 28 Sep 2022 02:10:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 2/4] drm: lcdif: Don't use BIT() for multi-bit register
 fields
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
References: <20220927233821.8007-1-laurent.pinchart@ideasonboard.com>
 <20220927233821.8007-3-laurent.pinchart@ideasonboard.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220927233821.8007-3-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
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
Cc: Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Daniel Scally <dan.scally@ideasonboard.com>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/28/22 01:38, Laurent Pinchart wrote:
> The BIT() macro is meant to represent a single bit. Don't use it for
> values of register fields that span multiple bits.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>   drivers/gpu/drm/mxsfb/lcdif_regs.h | 28 ++++++++++++++--------------
>   1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_regs.h b/drivers/gpu/drm/mxsfb/lcdif_regs.h
> index 013f2cace2a0..bc4d020aaa7c 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_regs.h
> +++ b/drivers/gpu/drm/mxsfb/lcdif_regs.h
> @@ -138,9 +138,9 @@
>   
>   #define DISP_PARA_DISP_ON		BIT(31)
>   #define DISP_PARA_SWAP_EN		BIT(30)
> -#define DISP_PARA_LINE_PATTERN_UYVY_H	(GENMASK(29, 28) | BIT(26))
> -#define DISP_PARA_LINE_PATTERN_RGB565	GENMASK(28, 26)
> -#define DISP_PARA_LINE_PATTERN_RGB888	0
> +#define DISP_PARA_LINE_PATTERN_UYVY_H	(13 << 26)
> +#define DISP_PARA_LINE_PATTERN_RGB565	(7 << 26)
> +#define DISP_PARA_LINE_PATTERN_RGB888	(0 << 26)

Can we use hex here for the left size of the shift operation, so it's 
subjectively easier to read ? DTTO for the other values ?

That is:
-#define DISP_PARA_LINE_PATTERN_UYVY_H	(13 << 26)
+#define DISP_PARA_LINE_PATTERN_UYVY_H	(0xd << 26)

[...]
