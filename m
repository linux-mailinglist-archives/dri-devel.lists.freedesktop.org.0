Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE4B7A1BD3
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 12:11:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2105410E16C;
	Fri, 15 Sep 2023 10:11:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E17E10E16C
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 10:11:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7D925B82B7B;
 Fri, 15 Sep 2023 10:11:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A6E2C433C8;
 Fri, 15 Sep 2023 10:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694772707;
 bh=K0S1/7rjMJZap+e2ud7JWlak5LJu8FuoEdX+Kx2fq1k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Hwc3sq4NUs6XsWymG3LHd+7pjFr2rCrrVAW6fRTVYsXCUWZihNz2fagsUbBPPR6+r
 xmnsnL+uXsGhZ5DhWv4A+bQKBmgwOjOnZtof3qNqZsVe/GPBWAuD2O5bZ67v9mnA3s
 S10h0DVF6lLG4l0wWOfq43wu9Zi7Ybsdtgpcrahe71URAqCvr8QlYfGKyFs+LlH88M
 z8q/MTuLNGhy66aNB7vp/Fd3l6XiV3zAqcTpeg0rH7TTcyoM9Hv39wHMQM5+Vegz98
 2FJHbYcS7KjNcMglWhNKyeSMspE5PZyw3UNxQm770ZuL/j6c6kGha3nxRQ7Dp1PUTK
 +zjI85AJuHWFA==
From: Michael Walle <mwalle@kernel.org>
To: angelogioacchino.delregno@collabora.com
Subject: Re: [PATCH] drm: mediatek: mtk_dsi: Fix NO_EOT_PACKET
 settings/handling
Date: Fri, 15 Sep 2023 12:11:24 +0200
Message-Id: <20230915101124.283232-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230523104234.7849-1-angelogioacchino.delregno@collabora.com>
References: <20230523104234.7849-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: chunkuang.hu@kernel.org, jitao.shi@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 Michael Walle <mwalle@kernel.org>, shaoming.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Due to the initial confusion about MIPI_DSI_MODE_EOT_PACKET, properly
> renamed to MIPI_DSI_MODE_NO_EOT_PACKET, reflecting its actual meaning,
> both the DSI_TXRX_CON register setting for bit (HSTX_)DIS_EOT and the
> later calculation for horizontal sync-active (HSA), back (HBP) and
> front (HFP) porches got incorrect due to the logic being inverted.
> 
> This means that a number of settings were wrong because....:
>  - DSI_TXRX_CON register setting: bit (HSTX_)DIS_EOT should be
>    set in order to disable the End of Transmission packet;
>  - Horizontal Sync and Back/Front porches: The delta used to
>    calculate all of HSA, HBP and HFP should account for the
>    additional EOT packet.
> 
> Before this change...
>  - Bit (HSTX_)DIS_EOT was being set when EOT packet was enabled;
>  - For HSA/HBP/HFP delta... all three were wrong, as words were
>    added when EOT disabled, instead of when EOT packet enabled!
> 
> Invert the logic around flag MIPI_DSI_MODE_NO_EOT_PACKET in the
> MediaTek DSI driver to fix the aforementioned issues.
> 
> Fixes: 8b2b99fd7931 ("drm/mediatek: dsi: Fine tune the line time caused by EOTp")
> Fixes: 2d52bfba09d1 ("drm/mediatek: add non-continuous clock mode and EOT packet control")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Tested-by: Michael Walle <mwalle@kernel.org>

Thanks,
-michael
