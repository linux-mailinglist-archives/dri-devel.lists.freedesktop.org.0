Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0958B5559
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 12:29:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6928D10E4E8;
	Mon, 29 Apr 2024 10:29:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sY1jqojp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75A2410E4E8
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2024 10:29:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 68BD1CE0ACF;
 Mon, 29 Apr 2024 10:28:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 622B0C113CD;
 Mon, 29 Apr 2024 10:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714386538;
 bh=2IDhjsMhb5aYhiqCE9TtV8L5uKIoVLzCbnj3R6GZewg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=sY1jqojp/kNqy2FM9Lm1z573PZOVnyeHLmzSq7ogYyxtBy0m5ixrh6NysQ1yFBrUB
 /jdEGixdLOyQWB7C9Do0QQm7v56/9D+yZdwKEmu4C4uvou35VlRccRXsd3QlEqY7Ml
 aBT5zlzXIJZUFwQd2WAT3dl3778e1U9/W5oc7KiiCML25nYNtp1RRxK/0vbzFk+RFA
 GNeNXwqK+7lGdRIMCf10rbq0goSC1K1awPNqDdE3qojDmPzm5oGARRWS1yYCLWdGFh
 OHlSD7m2WsbeEU9lDex4S2zEoZi209QeB9EBSp5/3HRrlLZpEjU4Iv37TO5ZQ7SJsA
 L/k9+oZIm4ezw==
From: Robert Foss <rfoss@kernel.org>
To: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Daniel Vetter <daniel@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20240426122259.46808-1-luca.ceresoli@bootlin.com>
References: <20240426122259.46808-1-luca.ceresoli@bootlin.com>
Subject: Re: [PATCH RESEND] Revert "drm/bridge: ti-sn65dsi83: Fix enable error
 path"
Message-Id: <171438653511.2566805.2252397252665472830.b4-ty@kernel.org>
Date: Mon, 29 Apr 2024 12:28:55 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.1
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

On Fri, 26 Apr 2024 14:22:59 +0200, Luca Ceresoli wrote:
> This reverts commit 8a91b29f1f50ce7742cdbe5cf11d17f128511f3f.
> 
> The regulator_disable() added by the original commit solves one kind of
> regulator imbalance but adds another one as it allows the regulator to be
> disabled one more time than it is enabled in the following scenario:
> 
>  1. Start video pipeline -> sn65dsi83_atomic_pre_enable -> regulator_enable
>  2. PLL lock fails -> regulator_disable
>  3. Stop video pipeline -> sn65dsi83_atomic_disable -> regulator_disable
> 
> [...]

Applied, thanks!

[1/1] Revert "drm/bridge: ti-sn65dsi83: Fix enable error path"
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=2940ee03b232



Rob

