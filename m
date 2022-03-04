Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0544CD3C9
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 12:52:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE73810F15F;
	Fri,  4 Mar 2022 11:52:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E125710F15F
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 11:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646394722; x=1677930722;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=8qonJSlfQ2SH4N0PAPavG8blHvf2Yzd8yazg7xcB6rs=;
 b=SeORZTKkLh5g+ur3PinurIwlqvJ4NkBxEmEwYz/JHrCLjIM2PqkmJ+a0
 puMUv2VH8RZVjhKy5VKEetsOGzcJKIfZFDuEEyiYMkJT2bGMXo/it1g84
 CmNrZuWXMnKjRSPQzaY+x5/NJqRbbw6uAN4L20147+L2elb/amVeGpt1w
 +FGoYUbVPLEnTnQAm1jnG1/ByMvuCgRKuPMnhmoEwwxOL9a7DY5ie8gJR
 Xo7bh022g52Q3cT7a2EH22VZTnA90N+4uqf7o2THmK5/lBmbImO96/yOF
 dZcp+z5aoXXhU5YPiPZ26ECsxRpVs9Adps3JnneZuAerlE0eP7fgNDvOf Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10275"; a="340391149"
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="340391149"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 03:52:02 -0800
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="511827595"
Received: from pruilobx-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.28.174])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 03:51:57 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: xinlei.lee@mediatek.com, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch,
 matthias.bgg@gmail.com
Subject: Re: [PATCH v2, 0/4] Cooperate with DSI RX devices to modify dsi
 funcs and delay mipi high to cooperate with panel sequence
In-Reply-To: <1646388956-8033-1-git-send-email-xinlei.lee@mediatek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <1646388956-8033-1-git-send-email-xinlei.lee@mediatek.com>
Date: Fri, 04 Mar 2022 13:51:55 +0200
Message-ID: <87lexq2aw4.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: jitao.shi@mediatek.com, allen-kh.cheng@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, rex-bc.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org, Xinlei Lee <xinlei.lee@mediatek.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Please also prefix cover letters with drm/mediatek if that's the only
place you're touching.

BR,
Jani.


On Fri, 04 Mar 2022, <xinlei.lee@mediatek.com> wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
>
> In upstream-v5.8, dsi_enable will operate panel_enable, but this
> modification has been moved in v5.9. In order to ensure the timing of
> dsi_power_on/off and the timing of pulling up/down the MIPI signal,
> the modification of v5.9 is synchronized in this series of patches.
>
> Changes since v1:
> 1. Dsi sequence marked with patch adjustment
> 2. Fixes: mtk_dsi: Use the drm_panel_bridge
>
> Jitao Shi (3):
>   drm/mediatek: Adjust the timing of mipi signal from LP00 to LP11
>   drm/mediatek: Separate poweron/poweroff from enable/disable and define
>     new funcs
>   drm/mediatek: keep dsi as LP00 before dcs cmds transfer
>
> Xinlei Lee (1):
>   drm/mediatek: Add pull-down MIPI operation in mtk_dsi_poweroff
>     function
>
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 73 ++++++++++++++++++++----------
>  1 file changed, 49 insertions(+), 24 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
