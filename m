Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E867370EB20
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 04:11:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15D6110E02D;
	Wed, 24 May 2023 02:11:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C684B10E027
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 02:11:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 13FFE637E9;
 Wed, 24 May 2023 02:11:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB104C4339B;
 Wed, 24 May 2023 02:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684894284;
 bh=kniNgZVPplXlMH2opmkUc/AvVlH7GGFlY5Hs9Bg07hA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iDdAUsc9NkNemL4s4tKZ5sJf84h5iEC1qpm7ZkLg+kuzpynj87mLY6juS0TFXB++F
 6emUiHXYY0lIhYQYyHLwTjd/wfF/F/gK/d0PFTXIh9TVouCfhG5+IvpYGzVLRKmGcN
 mTPQjQOZT8Lqca+5axder6TV/Bggx7jOynp/mbb8Lhjpeuc0DDv8vcyliff3cc/aTV
 68q/FZckV1KB39vwe7NsO+lfioR74pXfDYWcxv4Ux1JCbv8s7u9Y3uIqlCRvvum/ay
 l9uvhJ62GGxl5scGrE5qvizwTJwNqqqDLJwELRwqHVF4sS5j+1400LdY0MTFwe8d8v
 Vh/aHz1DFqoXw==
Date: Wed, 24 May 2023 10:11:19 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Subject: Re: [PATCH] drm/bridge: anx7625: Prevent endless probe loop
Message-ID: <ZG1yR9CYXzEPg5TJ@google.com>
References: <20230518193902.891121-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230518193902.891121-1-nfraprado@collabora.com>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, tzungbi@kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Hsin-Yi Wang <hsinyi@chromium.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Pin-yen Lin <treapking@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 kernel@collabora.com, owen <qwt9588@gmail.com>, Xin Ji <xji@analogixsemi.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 18, 2023 at 03:39:02PM -0400, Nícolas F. R. A. Prado wrote:
> Fixes: adca62ec370c ("drm/bridge: anx7625: Support reading edid through aux channel")
> Fixes: 269332997a16 ("drm/bridge: anx7625: Return -EPROBE_DEFER if the dsi host was not found")
> Reported-by: "kernelci.org bot" <bot@kernelci.org>
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Tested-by: Tzung-Bi Shih <tzungbi@kernel.org>

The patch can fix the "login" test failures observed on
mt8183-kukui-jacuzzi-juniper-sku16 and mt8192-asurada-spherion-r0 in
kernelci[1].

[1]: https://linux.kernelci.org/test/job/chrome-platform/branch/for-kernelci/kernel/v6.4-rc1-3-g4b9abbc132b86/plan/cros-ec/
