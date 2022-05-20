Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E689B52E2FD
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 05:17:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6A4911AE4B;
	Fri, 20 May 2022 03:17:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDB8211AE4B
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 03:17:43 +0000 (UTC)
X-UUID: 4737285e739243b3bb600eb2e528098b-20220520
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:ffea6a91-f043-40ea-9b64-507b503b30d4, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:14,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:14
X-CID-META: VersionHash:2a19b09, CLOUDID:07daf179-5ef6-470b-96c9-bdb8ced32786,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:3,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: 4737285e739243b3bb600eb2e528098b-20220520
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1504191338; Fri, 20 May 2022 11:17:39 +0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 20 May 2022 11:17:37 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 May 2022 11:17:37 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 20 May 2022 11:17:37 +0800
Message-ID: <319484715f582c210c275ef23d020e802579c738.camel@mediatek.com>
Subject: Re: [PATCH v7,3/4] drm/mediatek: keep dsi as LP00 before dcs cmds
 transfer
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <xinlei.lee@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <matthias.bgg@gmail.com>
Date: Fri, 20 May 2022 11:17:36 +0800
In-Reply-To: <1653012007-11854-4-git-send-email-xinlei.lee@mediatek.com>
References: <1653012007-11854-1-git-send-email-xinlei.lee@mediatek.com>
 <1653012007-11854-4-git-send-email-xinlei.lee@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
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
Cc: jitao.shi@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org,
 "# 5 . 10 . x : b255d51e3967 : sched : Modify dsi
 funcs to atomic	  operations" <stable@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2022-05-20 at 10:00 +0800, xinlei.lee@mediatek.com wrote:
> From: Jitao Shi <jitao.shi@mediatek.com>
> 
> To comply with the panel sequence, hold the mipi signal to LP00
> before the dcs cmds transmission,
> and pull the mipi signal high from LP00 to LP11 until the start of
> the dcs cmds transmission.
> The normal panel timing is :
> (1) pp1800 DC pull up
> (2) avdd & avee AC pull high
> (3) lcm_reset pull high -> pull low -> pull high
> (4) Pull MIPI signal high (LP11) -> initial code -> send video
> data(HS mode)
> The power-off sequence is reversed.
> If dsi is not in cmd mode, then dsi will pull the mipi signal high in
> the mtk_output_dsi_enable function.
> The delay in lane_ready func is the reaction time of dsi_rx after
> pulling up the mipi signal.
> 
> Fixes: 2dd8075d2185 ("drm/mediatek: mtk_dsi: Use the drm_panel_bridge
> API")
> 
> Cc: <stable@vger.kernel.org> # 5.10.x: b255d51e3967: sched: Modify
> dsi funcs to atomic operations
> Cc: <stable@vger.kernel.org> # 5.10.x: 72c69c977502: sched: Separate
> poweron/poweroff from enable/disable and define new funcs
> Cc: <stable@vger.kernel.org> # 5.10.x
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---

Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

