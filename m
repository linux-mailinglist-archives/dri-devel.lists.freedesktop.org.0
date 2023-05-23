Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D457D70E2AF
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 19:18:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A845D10E357;
	Tue, 23 May 2023 17:18:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FAF010E357
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 17:18:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 94D51628D8;
 Tue, 23 May 2023 17:18:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4702AC433D2;
 Tue, 23 May 2023 17:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684862313;
 bh=QAmV/MySDa38HeQ4kzqqa+UgwdNEFUnttUtX/X1Giyw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WPlBr/depd8TepfUxwlsGQCIMwPFvotBMqlw6tLwHNBLAZikk1as1KFpfXgANutTm
 ymQAB6mhACNF4ENADO93aYAW1VXPN2MqSNvpRINc8C9wPQf9kuGO5d42mbppgfNiza
 rncT0B7psiSiYMwS6YKDv74JfC3bifzfni9Nc8OJngJqn8pX3R6ciFIqJyhE7SvFkT
 BfeKpF5vXOPfB70NghMNiZ0KgmDx+Ut1RiomAx5n2UWAic3FLHUFZP3FQxGGrYPolP
 4iYduFlAmjV6hMjS+mKSJjT+0KVrCZ0RcvElIiHswX/9/E/lz0Pb8NGQiiCgVQgGKp
 vORyhHZhAW4Lw==
From: rfoss@kernel.org
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>
Subject: Re: [PATCH] drm/bridge: anx7625: Prevent endless probe loop
Date: Tue, 23 May 2023 19:18:24 +0200
Message-Id: <168486229619.3612901.1076023158254701111.b4-ty@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230518193902.891121-1-nfraprado@collabora.com>
References: <20230518193902.891121-1-nfraprado@collabora.com>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Pin-yen Lin <treapking@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, kernel@collabora.com,
 owen <qwt9588@gmail.com>, Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Robert Foss <rfoss@kernel.org>

On Thu, 18 May 2023 15:39:02 -0400, Nícolas F. R. A. Prado wrote:
> During probe, the driver registers i2c dummy devices and populates the
> aux bus, which registers a device for the panel. After doing that, the
> driver can still defer probe if needed. This ordering of operations is
> troublesome however, because the deferred probe work will retry probing
> all pending devices every time a new device is registered. Therefore, if
> modules need to be loaded in order to satisfy the dependencies for this
> driver to complete probe, the kernel will stall, since it'll keep trying
> to probe the anx7625 driver, but never succeed, given that modules would
> only be loaded after the deferred probe work completes.
> 
> [...]

Applied, thanks!

[1/1] drm/bridge: anx7625: Prevent endless probe loop
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=1464e48d69ab



Rob

