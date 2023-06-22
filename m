Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F17D739E0C
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 12:10:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FF0A10E52C;
	Thu, 22 Jun 2023 10:10:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1894210E52C
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 10:10:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 18C14616CB;
 Thu, 22 Jun 2023 10:10:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5214FC433C8;
 Thu, 22 Jun 2023 10:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687428607;
 bh=Vgm2vfQY8ScQBqR6MR9gXoD2XBHxa6+CWUh8TLHxrxI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pOB8mxRxrQJUL/xLg9zI4+jF0iGyp20HzuYyIAddD9symbWFlLPVAZ4MpYQ9R2MKZ
 F2Br/oLrMOWVASZFBtrHqRjlwY9QO3BH0JRvt/xhLKR2XtHZTnTPlLeqeSvhToJhCf
 mw7HgAyuPBDHRFGjXhVV+evo1qDgIfwfI8YEcUBYsfhTosBitX3ut8r5L1DL0I1X82
 EISz0cNvv4aeIx91DF50fj1Jeglh/elikSNNhSXumI02oI4BpS5EmH7xM7t8keTmYk
 4beitWKZ85FMhd7+MTCTbiO3Jx1psFVVNrydyehM/rLHxUQZJB8b60Iqqo0/4941xo
 xGKf+npeFAQmA==
From: rfoss@kernel.org
To: dri-devel@lists.freedesktop.org,
	Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 1/5] drm/bridge: tc358762: Split register programming from
 pre-enable to enable
Date: Thu, 22 Jun 2023 12:10:02 +0200
Message-Id: <168742858185.815589.11133644200152827652.b4-ty@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230615201902.566182-1-marex@denx.de>
References: <20230615201902.566182-1-marex@denx.de>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Robert Foss <rfoss@kernel.org>

On Thu, 15 Jun 2023 22:18:58 +0200, Marek Vasut wrote:
> Move the register programming part, which actually enables the bridge and
> makes it push data out of its DPI side, into the enable callback. The DSI
> host like DSIM may not be able to transmit commands in pre_enable, moving
> the register programming into enable assures it can transmit commands.
> 
> 

Applied, thanks!

[1/5] drm/bridge: tc358762: Split register programming from pre-enable to enable
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=8a4b2fc9c91a
[2/5] drm/bridge: tc358762: Switch to atomic ops
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=404643859a4f
[3/5] drm/bridge: tc358762: Instruct DSI host to generate HSE packets
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=362fa8f6e6a0
[4/5] drm/bridge: tc358762: Guess the meaning of LCDCTRL bits
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=80382226ef6f
[5/5] drm/bridge: tc358762: Handle HS/VS polarity
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=7f4e171f9d05



Rob

