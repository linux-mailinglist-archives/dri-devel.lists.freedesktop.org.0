Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD4872280E
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 16:02:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC77710E2B4;
	Mon,  5 Jun 2023 14:01:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB46310E06F
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jun 2023 14:01:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9BFD56148D;
 Mon,  5 Jun 2023 14:01:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80E84C433D2;
 Mon,  5 Jun 2023 14:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685973716;
 bh=fM/dkrSRD7/GVqUEkCT3DJ78pRRjkLSS3NGE52m4So0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nLIT+NRa6oO4LUWduQsq29/1p9VLtdYIDFqvtwN7SouW50eNBIDCdXuJUOT77t+p9
 XS8AQfLrTuQZNYRhoBd+Xzzdro9EDQCr663/bgyTunCpLO3pVdNS4nZmbW1GlN9b6B
 cFrVTmh/SAGAX/iz37rYUrg5emNsot2xaA2A7Jfy16x4r8jLcM15sXRc3OonaR5/WQ
 nRPRA+Q460+4tPz2k1Qkwq3CiPHS8kbT7GKAhG/3AlgmGc0wsvyuRrRWYoAoruFwz9
 DekIDhQUmh8QW8+yM6RQ3+R8R6UmmWWZGz3dhh+uIj66CmPqFagGMNN+7yC0Ylx9LQ
 I7xiqo+Rg5Chw==
From: rfoss@kernel.org
To: Masahiro Yamada <masahiroy@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Andrzej Hajda <andrzej.hajda@intel.com>,
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 1/2] drm/bridge: imx: fix mixed module-builtin object
Date: Mon,  5 Jun 2023 16:01:46 +0200
Message-Id: <168597369975.1230687.5029067502371454652.b4-ty@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230605120021.1774711-1-masahiroy@kernel.org>
References: <20230605120021.1774711-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: Robert Foss <rfoss@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Liu Ying <victor.liu@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 Nick Terrell <terrelln@fb.com>, NXP Linux Team <linux-imx@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Robert Foss <rfoss@kernel.org>

On Mon, 5 Jun 2023 21:00:20 +0900, Masahiro Yamada wrote:
> With CONFIG_DRM_IMX8QM_LDB=m and CONFIG_DRM_IMX8QXP_LDB=y (or vice
> versa), imx-ldb-helper.o is linked to a module and also to vmlinux
> even though the expected CFLAGS are different between builtins and
> modules.
> 
> This is the same situation as fixed by commit 637a642f5ca5 ("zstd:
> Fixing mixed module-builtin objects").
> 
> [...]

Applied, thanks!

[1/2] drm/bridge: imx: fix mixed module-builtin object
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=a272cadbd883
[2/2] drm/bridge: imx: turn imx8{qm,qxp}-ldb into single-object modules
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=013413cdfeec



Rob

