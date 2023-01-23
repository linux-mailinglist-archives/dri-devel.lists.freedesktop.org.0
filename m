Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B516780A4
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 16:57:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97DF38912D;
	Mon, 23 Jan 2023 15:57:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31AEA8912D
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 15:57:29 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 79DBA82F69;
 Mon, 23 Jan 2023 16:57:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1674489447;
 bh=SLvgU234z0Ib/utCI2P4W9G7P3rxOL12bQuTeAqy2xA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GWytINUuM1EgKe60xxlQeAYWkEweDE263zdfENbvRlrjuAKeHSWGOcWc1EOhtce7L
 6nQxr4vRC3hG5xvJxoKVXLbvrEZchnTmKclVmd7Dqh9JbuMdF26F2Yfvh8WSlFfr/k
 QFprH1IV+HJIrAZ13QbZOYUtU3Mt6Pa7VMXof9o1oafvI6J0clSlqriyfKXD2ixv21
 yOoikQP8df8+4M4uIlE2vDHXaSz2i9qbTu7dh/w+5+r+vhqqSAVyGEX4X/TMslf0JT
 dKUCUR070WXpt5Udr8qqMmXI4kjY7hc7grw381kpWN7d1Kl1vnoBRuHxPDNAf0Wt84
 qmvJ/nftu4fNg==
Message-ID: <ace76615-533a-9295-8271-95262859d287@denx.de>
Date: Mon, 23 Jan 2023 16:57:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/2] drm: lcdif: Add i.MX93 LCDIF support
Content-Language: en-US
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20230123072358.1060670-1-victor.liu@nxp.com>
 <20230123072358.1060670-3-victor.liu@nxp.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230123072358.1060670-3-victor.liu@nxp.com>
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
Cc: s.hauer@pengutronix.de, robh+dt@kernel.org, linux-imx@nxp.com,
 krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/23/23 08:23, Liu Ying wrote:
> The LCDIF embedded in i.MX93 SoC is essentially the same to those
> in i.MX8mp SoC.  However, i.MX93 LCDIF may connect with MIPI DSI
> controller through LCDIF cross line pattern(controlled by mediamix
> blk-ctrl) or connect with LVDS display bridge(LDB) directly or a
> parallel display(also through mediamix blk-ctrl), so add multiple
> encoders(with DRM_MODE_ENCODER_NONE encoder type) support in the
> LCDIF DRM driver and find a bridge to attach the relevant encoder's
> chain when needed.  While at it, derive lcdif_crtc_state structure
> from drm_crtc_state structure to introduce bus_format and bus_flags
> states so that the next downstream bridges may use consistent bus
> format and bus flags.

Would it be possible to split this patch into preparatory clean up and 
i.MX93 addition ? It seems like the patch is doing two things according 
to the commit message.
