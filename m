Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A11CF5844
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 21:25:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 543CB10E415;
	Mon,  5 Jan 2026 20:25:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KfKDjkhx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28EC110E1ED
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 20:25:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4A1B06013A;
 Mon,  5 Jan 2026 20:25:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EE6A7C116D0;
 Mon,  5 Jan 2026 20:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767644705;
 bh=XY0pQefpCFKLKtWJ2mFa1wekuuL/rvFmS2uFIx/iDN4=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=KfKDjkhxw5j+7J3CG2vjFG6GeJUZzPLMsmYx3lH3JwA485h9dlGzcbO8rXsTj+Fkw
 ym92knTIrhv5Tz0FmRI3AeDjHteE7y4/FUC8vuA1TqO578ahlL6LFez1Dn1O9E8Xz9
 mbaOiwFXGdIRlK+w+GIJlC9kwRB+ep9aj0kXCncPKE4medIT1l/4nnMX6CaGjePFGR
 hEku+6nOUoCgBVhXGwUzCYtGLjuoqYZtisexUNEG7THLu3Zc9NQRs14wF+TLmQ/cqM
 oWbHjfo1pB7KrrLCWAEqDtL6v136S0a82LGINqa46KHzb/zCzVp2jHl4mFrq2VXTHk
 Epwv6TWJvCq6w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id E43D7C79F90;
 Mon,  5 Jan 2026 20:25:04 +0000 (UTC)
From: Sebastian Krzyszkowiak via B4 Relay
 <devnull+sebastian.krzyszkowiak.puri.sm@kernel.org>
Subject: [PATCH 0/5] drm/panel: mantix-mlaf057we51: Power sequence improvements
Date: Mon, 05 Jan 2026 21:24:39 +0100
Message-Id: <20260105-mantix-halo-fixes-v1-0-1ebc9b195a34@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAceXGkC/x3M0QrCMAyF4VcZuTbYFuzAVxEv0i3awJZJM2Uw9
 u5GLz8O/9nBuAkbXLsdGn/EZFFHPHUwVNIno4xuSCHlEMMFZ9JVNqw0LfiQjQ37sc8hRc6pEHj
 3avwfPLvd3YWMsTTSof6eJtG3nWeylRscxxcSnyQ9ggAAAA==
X-Change-ID: 20260105-mantix-halo-fixes-7d76021e62ba
To: =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Purism Kernel Team <kernel@puri.sm>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1495;
 i=sebastian.krzyszkowiak@puri.sm; h=from:subject:message-id;
 bh=XY0pQefpCFKLKtWJ2mFa1wekuuL/rvFmS2uFIx/iDN4=;
 b=owEBbQKS/ZANAwAKAejyNc8728P/AcsmYgBpXB4e6/Fa8ZmMg8ypQoB5dd1SNwK71wbRER7Vv
 qvmZjWLiXCJAjMEAAEKAB0WIQQi3Z+uAGoRQ1g2YXzo8jXPO9vD/wUCaVweHgAKCRDo8jXPO9vD
 /1eOEACGsoW5vjNV0FgwDdW70thj6I4KwqU+nBqq8mlKaPerKO8VoG/G3GHs0dyd/hti1Ng43hI
 BoOUWJKm0IKUXkTgY5S/MLY/z+1lfF4Eo9Ye7XwAiAqGBTY5hlXiOwbtaIJT2xc6K6Jz4z/wTrG
 ZOTnenPwjKLJp5oYY/tu6CinWjDxUXtu/AjYNW1Qes3LJ24hNz+okncBOWS8DpEZ+iAbLm2XJfj
 6eiC7o/DVcBR/3POWsxGfs3lVoywT5x9cl/VC40uF13mIp7nuAKB72JaW97xQfjNyyfXshAOrqb
 uo+rGypcbPGOZVpW4HPN33sDR7atyHcRk04lnMLAgKXmJ3Tx2RGLeBhYSQectKCvwdwWz+JTMnU
 qav2IJQOsoE5sYr5/UtlFdlsaGPB7vPtN01NNQcDYDhzLW5j3EOKByv4132wX9Pw87FcqcNXD0e
 vv2VvNlhQq5GcS70V1NG7V9jCxBjtONqaz0RcRQn8BtPfxRYVWE5mldiqoOFJeBssYZYkEYtmUj
 Vy+vG4bW8brC92rx5UcHl19cnOv8YwJcW0byhmF6Z8xRZtEL70U+uvv0dHV7k9O8stljLigi0o6
 zpATR1/nwMfJbdnkpYDC0T+cINZJi9BBTpztPCgJeDkEr7EqU1ZF4DjPVmTR5JB72wT4YgdPzyo
 iDSAZ/40nxHWOQQ==
X-Developer-Key: i=sebastian.krzyszkowiak@puri.sm; a=openpgp;
 fpr=22DD9FAE006A11435836617CE8F235CF3BDBC3FF
X-Endpoint-Received: by B4 Relay for sebastian.krzyszkowiak@puri.sm/default
 with auth_id=32
X-Original-From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
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
Reply-To: sebastian.krzyszkowiak@puri.sm
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These are the patches that fix the issues with low contrast, "halo",
temporary burn-in and occasional black screen on the Librem 5 phones,
which use Mantix MLAF057WE51-X and Yashi Changhua YS57PSS36BH5GQ panels.

They're mostly about improving the power sequences to match the ones
described in FT8006P datasheet, so the driver does not end up disturbing
the internal initialization process performed by the controller.
Aside of that, using LP mode has been found to improve the reliability of
sending DSI commands to the panel to the point where long chains
of commands can be sent without erroring out - something that, at least
on i.MX8MQ, wasn't possible without LPM.

These have been used in Purism's downstream tree for months and tested
across the variety of hardware batches.

Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
---
Sebastian Krzyszkowiak (5):
      drm/panel: mantix: Enable DSI LPM
      drm/panel: mantix: Improve power on sequence timings
      drm/panel: mantix: Improve power off sequence
      drm/panel: mantix: Drop bank 9 initialization
      drm/panel: mantix: Don't turn on MIPI peripheral

 drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c | 35 ++++++++++++------------
 1 file changed, 18 insertions(+), 17 deletions(-)
---
base-commit: 9ace4753a5202b02191d54e9fdf7f9e3d02b85eb
change-id: 20260105-mantix-halo-fixes-7d76021e62ba

Best regards,
-- 
Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>


