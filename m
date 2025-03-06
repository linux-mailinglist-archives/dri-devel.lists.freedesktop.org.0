Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2ED9A54873
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 11:54:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B5C910E198;
	Thu,  6 Mar 2025 10:54:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Adxdai4B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0AA010E198
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 10:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1741258434;
 bh=mlfJGkDy4TYPN23XQOALun4gCtktQqPl5OUILFcu94g=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Adxdai4BHQ0nrk+Y8TguTPs3jteQqha22poRWLoQgrvVF+zA3MyEMhAgziIOIy+2y
 OjHxAw4IRwy/8GS9KDxEmtD1zT8HvYL/FgVIGbjfuYQ/x6WrDiLPMSXffgT/+oLvCn
 ldiABCy7QePDBPP3N77tk/wEL2QI5UDBKC9y4tbGsCf1AdZ/ttOYfaX2DTtEcFql0R
 R5KLzKh8zzlBWO1L+/6verr1o91S4KpSsMRqf83LsDREgjMLRGi1Zq4JEFifA9YL8C
 nAFJTxWfJmIchSeZFDGM5oQPnzBLPEXGEzLC+hu16nS+sOOi9war6JjdgCsKnlqAVJ
 f2Tyj6DiY7lhg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 1037F17E0599;
 Thu,  6 Mar 2025 11:53:54 +0100 (CET)
Message-ID: <7af26747-34cd-4088-a6b5-865de9e87fba@collabora.com>
Date: Thu, 6 Mar 2025 11:53:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mailbox: mtk-cmdq: Refine GCE_GCTL_VALUE setting
To: Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Nancy Lin <nancy.lin@mediatek.com>, Singo Chang
 <singo.chang@mediatek.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Sirius Wang <sirius.wang@mediatek.com>,
 Xavier Chang <xavier.chang@mediatek.com>, Fei Shao <fshao@chromium.org>,
 Chen-yu Tsai <wenst@chromium.org>, Pin-yen Lin <treapking@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20250224105414.3576243-1-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250224105414.3576243-1-jason-jh.lin@mediatek.com>
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

Il 24/02/25 11:50, Jason-JH Lin ha scritto:
> Add cmdq_gctl_value_toggle() to configure GCE_CTRL_BY_SW and GCE_DDR_EN
> together in the same GCE_GCTL_VALUE register.
> 
> For the SoCs whose GCE is located in MMINFRA and uses MMINFRA_AO power,
> this allows it to be written without enabling the clocks. Otherwise, all
> GCE registers should be written after the GCE clocks are enabled.
> Move this function into cmdq_runtime_resume() and cmdq_runtime_suspend()
> to ensure it is called when the GCE clock is enabled.
> 
> Fixes: 7abd037aa581 ("mailbox: mtk-cmdq: add gce ddr enable support flow")
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>

I have erroneously picked this patch in the MediaTek tree, as I had misread the
changed file, thought that it was mtk-cmdq-helper.c.

This patch also has the wrong recipients, as this should not go through the
MediaTek trees, but through the mailbox one.

Therefore, I dropped this patch from the MediaTek tree - sorry for the confusion.

Regards,
Angelo
