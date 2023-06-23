Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C9373BB6D
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 17:19:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 623AA10E653;
	Fri, 23 Jun 2023 15:19:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 341E110E653
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 15:19:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B55D661A90;
 Fri, 23 Jun 2023 15:19:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85396C433C8;
 Fri, 23 Jun 2023 15:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687533582;
 bh=DKp5/78a6MDj0gp2n8rZQ8Kpq++PAr8Z9nTfWBqDhQ0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TPibgxKVFG5zFRKHsjKo1iCmOysa2QIKO28RArp6cabNYboiHhLoulzKJFa1de/xW
 tpiPw72xaaMOu53efVNwMqlkhpsSBDcfAiKOw5s6TLicUKEEcsbOrBTdeli0poaFai
 u8g0syXz1ELxOyYUzjyn3dELpCg/P/P4/i/nETx33N5uuc6k/nbbbGqu6U2nb9W9jf
 zaROPqjbKRmatQChkVsfRjp2NGm36xNqO+f/mKFztAoeoc0x7+/UD80hrI9JAUV7ux
 x2W4/Rd4I/qiB5KWE+GG9rr6unuwX3WJ7+VY17z4rffXFGSo19YNjvsdmv/LBPih0X
 WClL5Z97LCo1Q==
From: Robert Foss <rfoss@kernel.org>
To: dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2] drm/bridge: ps8640: Drop the ability of ps8640 to
 fetch the EDID
Date: Fri, 23 Jun 2023 17:19:33 +0200
Message-ID: <168753355470.231132.10951468877350580125.b4-ty@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230616165517.v2.1.I7b8f60b3fbfda068f9bf452d584dc934494bfbfa@changeid>
References: <20230616165517.v2.1.I7b8f60b3fbfda068f9bf452d584dc934494bfbfa@changeid>
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Icenowy Zheng <uwu@icenowy.me>, Jonas Karlman <jonas@kwiboo.se>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Pin-yen Lin <treapking@chromium.org>, linux-mediatek@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 16 Jun 2023 16:55:17 -0700, Douglas Anderson wrote:
> In order to read the EDID from an eDP panel, you not only need to
> power on the bridge chip itself but also the panel. In the ps8640
> driver, this was made to work by having the bridge chip manually power
> the panel on by calling pre_enable() on everything connectorward on
> the bridge chain. This worked OK, but...
> 
> ...when trying to do the same thing on ti-sn65dsi86, feedback was that
> this wasn't a great idea. As a result, we designed the "DP AUX"
> bus. With the design we ended up with the panel driver itself was in
> charge of reading the EDID. The panel driver could power itself on and
> the bridge chip was able to power itself on because it implemented the
> DP AUX bus.
> 
> [...]

Applied, thanks!

[1/1] drm/bridge: ps8640: Drop the ability of ps8640 to fetch the EDID
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=26195af57798



Rob

