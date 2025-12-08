Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0668BCAD00F
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 12:30:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EB1B10E434;
	Mon,  8 Dec 2025 11:30:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="K+3Q+f4w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com
 [91.218.175.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D86D410E434
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 11:30:32 +0000 (UTC)
Message-ID: <e245ff67-1d71-48a0-bec4-f30056ef2e19@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1765193098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7xNh2IrUQfFXer4apy1LW0wPRCYKX8Op57bOTtZRB8k=;
 b=K+3Q+f4wXwHAnSqWeD8Zht4KMjLopVIgM4PK7rSR+Hinpl7RTbJvRrBBabkCUQhDD5x4/Z
 4pxwRlrEFBvcM1zNBGsUvfNVpd7O/Mm7AzAfbDuNH34KRj5DegQWb91SVsBmiqKd8im331
 NeOxbkTG/SqtW2oGCbu4kfXm6n1R7Mo=
Date: Mon, 8 Dec 2025 11:24:51 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 3/4] drm/atomic-helper: Export and namespace some functions
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jyri Sarha <jyri.sarha@iki.fi>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Linus Walleij <linusw@kernel.org>, Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Vicente Bergas <vicencb@gmail.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, stable@vger.kernel.org
References: <20251205-drm-seq-fix-v1-0-fda68fa1b3de@ideasonboard.com>
 <20251205-drm-seq-fix-v1-3-fda68fa1b3de@ideasonboard.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
In-Reply-To: <20251205-drm-seq-fix-v1-3-fda68fa1b3de@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
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



On 05/12/2025 09:51, Tomi Valkeinen wrote:
> From: Linus Walleij <linusw@kernel.org>
> 
> Export and namespace those not prefixed with drm_* so
> it becomes possible to write custom commit tail functions
> in individual drivers using the helper infrastructure.
> 
> Tested-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> [Tomi: Resolved conflicts, fixed indentation]
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Cc: stable@vger.kernel.org # v6.17+
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 122 +++++++++++++++++++++++++++++-------
>  include/drm/drm_atomic_helper.h     |  22 +++++++
>  2 files changed, 121 insertions(+), 23 deletions(-)
> 

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>

