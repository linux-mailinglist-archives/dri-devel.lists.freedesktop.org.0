Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B70505ED262
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 03:01:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA03910E205;
	Wed, 28 Sep 2022 01:01:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED69810E205
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 01:01:41 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id DFB9E84DE0;
 Wed, 28 Sep 2022 03:01:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1664326900;
 bh=57fK+SkitxAM6vMITO8gTrNPj7WJHgpEgL6RP7AM41k=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=G+ufZug/aKKwbbPMUf/uIKTHtI00L24trz2lsqEaWjj+ixKiK2P8edjSNAfcZRrbh
 lIWlWexCq5FSy/5+htSzoiQE3bKym0DIqxRJSEoXhvidNOf9e2/3VQoJwYBoh7v/6T
 IZm90uVrolKbSL4BJRlJG9FZdZqljEqeGDZ2fb6UhmwYTkX4a4ZNQ+zGc5XPUV0zNS
 pQ2FlVacP36mZbnz9L0LOWcvB1MtA40RPvwJ41myyZRnPd3uoGQH5RBiym79xAjN9E
 Bq0B5tBZj4rLY7u33SxCIXKfD86s4+4iVEcnHdO9ae9DxOPoL2E6DhbPOvhfXdCj2c
 jtJYCEF1U1Umg==
Message-ID: <70fc8d73-9feb-9f9f-ac8e-50d69d4bc547@denx.de>
Date: Wed, 28 Sep 2022 03:01:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 3/4] drm: lcdif: Switch to limited range for RGB to YUV
 conversion
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
References: <20220928005812.21060-1-laurent.pinchart@ideasonboard.com>
 <20220928005812.21060-4-laurent.pinchart@ideasonboard.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220928005812.21060-4-laurent.pinchart@ideasonboard.com>
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

On 9/28/22 02:58, Laurent Pinchart wrote:
> Up to and including v1.3, HDMI supported limited quantization range only
> for YCbCr. HDMI v1.4 introduced selectable quantization ranges, but this
> features isn't supported in the dw-hdmi driver that is used in
> conjunction with the LCDIF in the i.MX8MP. The HDMI YCbCr output is thus
> always advertised in the AVI infoframe as limited range.
> 
> The LCDIF driver, on the other hand, configures the CSC to produce full
> range YCbCr. This mismatch results in loss of details and incorrect
> colours. Fix it by switching to limited range YCbCr.
> 
> The coefficients are copied from drivers/media/platforms/nxp/imx-pxp.c
> for coherency, as the hardware is most likely identical.
> 
> Fixes: 9db35bb349a0 ("drm: lcdif: Add support for i.MX8MP LCDIF variant")
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Marek Vasut <marex@denx.de>
