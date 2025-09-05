Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B3DB452C0
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 11:15:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B36D110E35A;
	Fri,  5 Sep 2025 09:15:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="KssQjEZD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D37410E35A
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 09:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1757063710;
 bh=33A/I19euiFo7KyPkCzzuu4tf57r3cMykqNriw0KQWI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KssQjEZDH9qu/sgjacMKg0Zz3UxIzN6z1Hvhb5Fo9k5JDDWuD+TrfyEPCYWFKEmrJ
 btk2pincIPdba6Wn/25wln5tco96FJM/f8dTQZffE8QGDFfxp2jrbVcO9wDEHh+gqk
 yTHEibEWSqqAPD2ntAHoude1EL3UdPjp4aOO41aCWzfU7L4HQ+B28rK9JNjat3vt5X
 X8JwwuxuQvV/D6NYUiKcCgLYKHSKpmZ6PEZS5gFA1HOVradnMsZ4MVTCj1A99pD6ev
 Z0BaaOfxx0ZcWJGwfUiWiEzuiyeijBEqH4pkRhGqr57Snx/5Yp8jY3sHCcZQ0zh+xR
 k4w/eCvUdARjA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id DC6EC17E0523;
 Fri,  5 Sep 2025 11:15:09 +0200 (CEST)
Message-ID: <9aa961d0-8138-4363-a606-30d879638a5b@collabora.com>
Date: Fri, 5 Sep 2025 11:15:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Fix sleeping function called from invalid context
To: Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Zhenxing Qin <zhenxing.qin@mediatek.com>,
 Xiandong Wang <xiandong.wang@mediatek.com>,
 Sirius Wang <sirius.wang@mediatek.com>,
 Xavier Chang <xavier.chang@mediatek.com>,
 Jarried Lin <jarried.lin@mediatek.com>, Fei Shao <fshao@chromium.org>,
 Chen-yu Tsai <wenst@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
References: <20250829091727.3745415-1-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250829091727.3745415-1-jason-jh.lin@mediatek.com>
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

Il 29/08/25 11:15, Jason-JH Lin ha scritto:
> We found that there is a spin_lock_irqsave protection in msg_submit()
> of mailbox.c and it is in the atomic context.
> So when the mailbox controller driver calls pm_runtime_get_sync() in
> mbox_chan_ops->send_data(), it will get this BUG report.
> "BUG: sleeping function called from invalid context at drivers/base/power/runtime.c:1164"
> 
> Additionally, pm_runtime_put_autosuspend() should be invoked from the
> GCE IRQ handler to ensure the hardware has actually completed its work.
> 
> To resolve these issues, remove the pm_runtime calls from
> cmdq_mbox_send_data() and delegate power management responsibilities
> to the client driver.
> ---
> Changes in v2:
> - Move pm_runtmie APIs from cmdq driver to client drivers.
> - Move pm_runtime_put_autosuspend to GCE irq callback function.
> - Link to v1: https://lore.kernel.org/r/20240614040133.24967-1-jason-jh.lin@mediatek.com

For the entire series:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


