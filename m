Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE89490CB23
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 14:08:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0596D10E661;
	Tue, 18 Jun 2024 12:08:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="j/rTMOoD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com
 [91.218.175.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 752E610E661
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 12:08:39 +0000 (UTC)
X-Envelope-To: angelogioacchino.delregno@collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1718712516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yaKJZwFY6wd1XllaZI8jJVrOqSqeE2cUrM2G+oq1sR8=;
 b=j/rTMOoDPWYTSlPp2VdJOuT37Q5uAFN8Tsg2EsV4sQIiUaqK5GIq+iAvEYNMRfLEBFuDbP
 LlqVT/U0m+nFky/pdYKC+SbgxAKwWl3f41XmPGY67FTxWMB4Lu+6+7yUqjrK8WTXY4OUj3
 UpgZf3YfifUlrEGqe1S6OLCQ/0McQeM=
X-Envelope-To: chunkuang.hu@kernel.org
X-Envelope-To: robh@kernel.org
X-Envelope-To: krzysztof.kozlowski+dt@linaro.org
X-Envelope-To: conor+dt@kernel.org
X-Envelope-To: p.zabel@pengutronix.de
X-Envelope-To: airlied@gmail.com
X-Envelope-To: daniel@ffwll.ch
X-Envelope-To: maarten.lankhorst@linux.intel.com
X-Envelope-To: mripard@kernel.org
X-Envelope-To: tzimmermann@suse.de
X-Envelope-To: matthias.bgg@gmail.com
X-Envelope-To: shawn.sung@mediatek.com
X-Envelope-To: yu-chang.lee@mediatek.com
X-Envelope-To: ck.hu@mediatek.com
X-Envelope-To: jitao.shi@mediatek.com
X-Envelope-To: devicetree@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: linux-mediatek@lists.infradead.org
X-Envelope-To: linux-arm-kernel@lists.infradead.org
X-Envelope-To: wenst@chromium.org
X-Envelope-To: kernel@collabora.com
X-Envelope-To: michael@walle.cc
X-Envelope-To: amergnat@baylibre.com
Message-ID: <dc1b40ed-0f8f-40c9-8c32-e35e296b37da@linux.dev>
Date: Tue, 18 Jun 2024 20:08:25 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v8 3/3] drm/mediatek: Implement OF graphs support for
 display paths
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
Cc: robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 matthias.bgg@gmail.com, shawn.sung@mediatek.com, yu-chang.lee@mediatek.com,
 ck.hu@mediatek.com, jitao.shi@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 wenst@chromium.org, kernel@collabora.com, michael@walle.cc,
 Alexandre Mergnat <amergnat@baylibre.com>
References: <20240618101726.110416-1-angelogioacchino.delregno@collabora.com>
 <20240618101726.110416-4-angelogioacchino.delregno@collabora.com>
Content-Language: en-US, en-AU
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20240618101726.110416-4-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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

Hi,


On 6/18/24 18:17, AngeloGioacchino Del Regno wrote:
> It is impossible to add each and every possible DDP path combination
> for each and every possible combination of SoC and board: right now,
> this driver hardcodes configuration for 10 SoCs and this is going to
> grow larger and larger, and with new hacks like the introduction of
> mtk_drm_route which is anyway not enough for all final routes as the
> DSI cannot be connected to MERGE if it's not a dual-DSI, or enabling
> DSC preventively doesn't work if the display doesn't support it, or
> others.
> 
> Since practically all display IPs in MediaTek SoCs support being
> interconnected with different instances of other, or the same, IPs
> or with different IPs and in different combinations, the final DDP
> pipeline is effectively a board specific configuration.
> 
> Implement OF graphs support to the mediatek-drm drivers, allowing to
> stop hardcoding the paths, and preventing this driver to get a huge
> amount of arrays for each board and SoC combination, also paving the
> way to share the same mtk_mmsys_driver_data between multiple SoCs,
> making it more straightforward to add support for new chips.
> 
> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
> Tested-by: Alexandre Mergnat <amergnat@baylibre.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Acked-by: Sui Jingfeng <sui.jingfeng@linux.dev>
