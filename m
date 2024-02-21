Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA4D85E13B
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 16:33:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A054110E78D;
	Wed, 21 Feb 2024 15:33:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sBL9BzIO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAF1710E78E
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 15:33:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 04A1BCE1E48;
 Wed, 21 Feb 2024 15:32:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6712EC43394;
 Wed, 21 Feb 2024 15:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708529576;
 bh=SZ5oXc5KsO4JyGV5JCH+VaWP1R79qJcpalEIfQ+AjNk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=sBL9BzIOkKacSqSZcSHOox2ACQDM8p2/p1RdDEA/ZrgxJLV+aM0KMVfq/nnkbZXqI
 CPpo1V/PzcD7/oq8KpvD9nM4sNN1BAButWpZiKiZcvPHqBz94C6/ulHUW7YMUJY1dY
 n/SieglbeUsT7PQOYcOG+L84Ar0I+RbMO4lpjMDPfrwbCMqc5vzn/RrF9A6oyOZwBa
 It9cNKgBUUAwc9sidhRyc+ebQXfiSGeiIaoaH9a+lKGcdQ5hRp4X3UTVmCxwG5Ldiu
 dBrUVBGW/xoi8murfEvIwe+DJnXKHQT3whSuFpQbC4jPGQgi62nlPBgeggrCozt5ey
 H/UbGnd2E0vJQ==
From: Robert Foss <rfoss@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>, Hans Verkuil <hans.verkuil@cisco.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>, Maxime Ripard <mripard@kernel.org>,
 Archit Taneja <architt@codeaurora.org>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Alvin Šipraga <alvin@pqrs.dk>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: linux-kernel@vger.kernel.org, Alvin Šipraga <alsi@bang-olufsen.dk>, dri-devel@lists.freedesktop.org,
 Mads Bligaard Nielsen <bli@bang-olufsen.dk>
In-Reply-To: <20240219-adv7511-cec-irq-crash-fix-v2-1-245e53c4b96f@bang-olufsen.dk>
References: <20240219-adv7511-cec-irq-crash-fix-v2-1-245e53c4b96f@bang-olufsen.dk>
Subject: Re: [PATCH v2] drm/bridge: adv7511: fix crash on irq during probe
Message-Id: <170852957313.2711855.7326941848429368841.b4-ty@kernel.org>
Date: Wed, 21 Feb 2024 16:32:53 +0100
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

On Mon, 19 Feb 2024 21:21:47 +0100, Alvin Šipraga wrote:
> From: Mads Bligaard Nielsen <bli@bang-olufsen.dk>
> 
> Moved IRQ registration down to end of adv7511_probe().
> 
> If an IRQ already is pending during adv7511_probe
> (before adv7511_cec_init) then cec_received_msg_ts
> could crash using uninitialized data:
> 
> [...]

Applied, thanks!

[1/1] drm/bridge: adv7511: fix crash on irq during probe
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=aeedaee5ef54



Rob

