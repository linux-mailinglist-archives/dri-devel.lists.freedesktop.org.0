Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB5AA89AE2
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 12:48:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6433110E084;
	Tue, 15 Apr 2025 10:48:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Z1Z5ubms";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E669A10E084
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 10:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744714107;
 bh=CgTZtSnpeBEZpCMbBFIaZGn3QwWWlHR/mJgp6BEyfeI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Z1Z5ubmsLjUbXF45H/YDyate0WEabrgAxtWqnITNe4AZe8+b4Ke3aUNvnzNa6M+jf
 0Lr/j/xOs8miKATlJEsQCnnDINXtXLJPhvpR3iV4k2noMV7X3Ii9t0LRLZeCsenJrZ
 X0fg1LRNTAUDCzundGbkKCLQGV6lmAYvFrfvahKBiBKkfBd+Yjq3MKUsCg5oOCXAFL
 BHdDaXENi6hf1QoTYs6jtpoBO4WdPUNgN/J2G51nv8ggueii5kTBhzJKYwd5GYcBLG
 hiwjeMpuSpUgbuSnvJNrmcakF5nAoHSGwE0ovGdp2qw3UPs0YcfGIbk6LRNrj2nzI8
 spay6QgJ9m8sQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 40E9917E09B5;
 Tue, 15 Apr 2025 12:48:26 +0200 (CEST)
Message-ID: <bc094a07-2a4c-4048-8c15-b096db62f142@collabora.com>
Date: Tue, 15 Apr 2025 12:48:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 17/23] drm/mediatek: mtk_hdmi: Split driver and add
 common probe function
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, ck.hu@mediatek.com, jitao.shi@mediatek.com,
 jie.qiu@mediatek.com, junzhi.zhao@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 dmitry.baryshkov@linaro.org, lewis.liao@mediatek.com,
 ives.chenjh@mediatek.com, tommyyl.chen@mediatek.com,
 jason-jh.lin@mediatek.com
References: <20250415104321.51149-1-angelogioacchino.delregno@collabora.com>
 <20250415104321.51149-18-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250415104321.51149-18-angelogioacchino.delregno@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 15/04/25 12:43, AngeloGioacchino Del Regno ha scritto:
> In preparation for adding a new driver for the HDMI TX v2 IP,
> split out the functions that will be common between the already
> present mtk_hdmi (v1) driver and the new one.
> 
> Since the probe flow for both drivers is 90% similar, add a common
> probe function that will be called from each driver's .probe()
> callback, avoiding lots of code duplication.
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   drivers/gpu/drm/mediatek/Kconfig           |   11 +-
>   drivers/gpu/drm/mediatek/Makefile          |    1 +
>   drivers/gpu/drm/mediatek/mtk_hdmi.c        |  538 +-----
>   drivers/gpu/drm/mediatek/mtk_hdmi.c.orig   | 1769 ++++++++++++++++++++
>   drivers/gpu/drm/mediatek/mtk_hdmi_common.c |  422 +++++
>   drivers/gpu/drm/mediatek/mtk_hdmi_common.h |  188 +++
>   6 files changed, 2398 insertions(+), 531 deletions(-)
>   create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi.c.orig

CK, I just acknowledged that a .orig file slipped through and got sent out with
this patch....

Truly sorry for that, can you please fix that up while applying without having me
send another patchbomb?

Many thanks,
Angelo

>   create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_common.c
>   create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_common.h
> 
