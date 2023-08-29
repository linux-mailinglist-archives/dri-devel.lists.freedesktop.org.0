Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D997978C93E
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 18:01:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22E4B10E434;
	Tue, 29 Aug 2023 16:00:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1BF610E434
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 16:00:36 +0000 (UTC)
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 5F4A56607236;
 Tue, 29 Aug 2023 17:00:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693324835;
 bh=JCfP29V3g/z06V7q+2qRQmI7uI0SGWM3SW0Z6ZJgNl4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XMDriXCzwSEEe30YsG8nKNO4L66h3QBquvxvUS7YQbKvfTaF/v4utnOUazsTmr3WI
 lOuX4955i/ct+lSgyN8T28c+Uksuu7ZLqwdpKl1bddyet1Hd2ngafJSKOHfBs/Qzsz
 TjxkJd6B9rgqrVTItQ5VNlQT/pf67jTAw8pQt6SWSUUHnQgIWiptYtwDgayqVZFPb6
 lqf8AeL8rg7Bh5V3jiYG8JUBb0YRZslko9/bJ0H7G+m/686w+vB3vrHdx+otVlcdU6
 Dzis5e0zZSOPJQeM4KQrLXCSjMdbuP0p15LAsnNgpy4u36X9HWzboVHrqxbMhOiX4h
 FKQ5M19VLxWaw==
Date: Tue, 29 Aug 2023 12:00:29 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Michael Walle <mwalle@kernel.org>
Subject: Re: [PATCH 1/2] drm/mediathek: fix kernel oops if no crtc is found
Message-ID: <16f85ad3-57f4-4cde-88fc-b9d0b763f9e2@notapiano>
References: <20230829131941.3353439-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230829131941.3353439-1-mwalle@kernel.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>, Stu Hsieh <stu.hsieh@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 29, 2023 at 03:19:40PM +0200, Michael Walle wrote:
> drm_crtc_from_index(0) might return NULL if there are not CRTCs

Typo: not -> no

> registered at all which will lead to a kernel oops in
> mtk_drm_crtc_dma_dev_get(). Add the missing return value check.
> 
> Fixes: 0d9eee9118b7 ("drm/mediatek: Add drm ovl_adaptor sub driver for MT8195")
> Signed-off-by: Michael Walle <mwalle@kernel.org>

There's also a typo in the commit subject: mediathek -> mediatek. But
regardless,

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

(tested that the patch fixes the oops on mt8195-cherry-tomato when no display
pipeline is available)

Thanks,
Nícolas
