Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E8B63E0C2
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 20:27:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1B3310E4BF;
	Wed, 30 Nov 2022 19:27:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F1D910E4C1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 19:26:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 90A3460A29;
 Wed, 30 Nov 2022 19:26:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EEEF7C433C1;
 Wed, 30 Nov 2022 19:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669836417;
 bh=XGONUzrpJG3cabIJ/iio3JwrsnBPyUBQgL4MPUuLEjM=;
 h=Subject:From:Date:To:Reply-To:From;
 b=oW3mzvuxTKuhtGFtIoQTB6ko/FuuVahX5R+uP3a/DdMrFJxTtEsTQGdgPNF4wyawz
 7DHkhB9su5uR5WQs1a1Chf20gmn8nlBlDJsT6sofhNpQel9WZBTAqiL+sFglPMyfcG
 rNpEfADY67l5Z4iX9IfwfDjtiERjNApChnnAb2QImoJz+lr0aZDRMsnQJd/q60KmO6
 /m8kkXPhhfzwQyy2drm0P2ACUSvaPHgde9XyIarEueWjuXA+jlhfCU3NZqehTd+ulL
 mEQRV5Lqq+C3J5lAA2drbcwS1vbNE2GfPPI9Pt+U26NU9klChpSnYU4nofozpvnWTp
 QJwIyCY2Sj6BQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id C7183C4321E;
 Wed, 30 Nov 2022 19:26:56 +0000 (UTC)
Subject: [PATCH v2 0/6] drm/gud: Use the shadow plane helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHiuh2MC/32NQQrCMBBFr1KydqRJFFtX3kNcTDtjEygTybQVKb
 m7wQO4+rwP7//dKOfIaq7NbjJvUWOSCu7QmDGgTAyRKhvXOmetczCtBBqQ0hteMwoDsr9gf6YTdW
 SqNqAyDBllDFWUdZ5rGaIuKX9+N5utcf+zuFlooSf2+ETvO8+3JScR1mPKk3mUUr5o3D6rtwAAAA
 ==
From: Noralf =?utf-8?q?Tr=C3=B8nnes?= via B4 Submission Endpoint
 <devnull+noralf.tronnes.org@kernel.org>
Date: Wed, 30 Nov 2022 20:26:48 +0100
Message-Id: <20221122-gud-shadow-plane-v2-0-435037990a83@tronnes.org>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 stable@kernel.org,
 Noralf =?unknown-8bit?q?Tr=C3=B8nnes?= <noralf@tronnes.org>
X-Mailer: b4 0.11.0-dev-cc6f6
X-Developer-Signature: v=1; a=ed25519-sha256; t=1669836415; l=1893;
 i=noralf@tronnes.org; s=20221122; h=from:subject:message-id;
 bh=XGONUzrpJG3cabIJ/iio3JwrsnBPyUBQgL4MPUuLEjM=; =?utf-8?q?b=3DFRbiv6TSsd50?=
 =?utf-8?q?0P09sjCmwqMbHCOsKrgz9/z4n4GqaYQE3AMTyQrRKQMDVtu9yrR5ui5TM31Y3xmo?=
 +ZVxG5AAA/1CnNUYmEeGBFbo8SZdJ3q2OxVAv0vG+j5Y2Ezshxh/
X-Developer-Key: i=noralf@tronnes.org; a=ed25519;
 pk=0o9is4iddvvlrY3yON5SVtAbgPnVs0LfQsjfqR2Hvz8=
X-Endpoint-Received: by B4 Submission Endpoint for noralf@tronnes.org/20221122
 with auth_id=8
X-Original-From: Noralf =?utf-8?q?Tr=C3=B8nnes?= <noralf@tronnes.org>
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
Reply-To: noralf@tronnes.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

I have started to look at igt for testing and want to use CRC tests. To
implement support for this I need to move away from the simple kms
helper.

When looking around for examples I came across Thomas' nice shadow
helper and thought, yes this is perfect for drm/gud. So I'll switch to
that before I move away from the simple kms helper.

The async framebuffer flushing code path now uses a shadow buffer and
doesn't touch the framebuffer when it shouldn't. I have also taken the
opportunity to inline the synchronous flush code path and make this the
default flushing stategy.

Noralf.

Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Noralf Trønnes <noralf@tronnes.org>

---
Changes in v2:
- Drop patch (Thomas):
  drm/gem: shadow_fb_access: Prepare imported buffers for CPU access
- Use src as variable name for iosys_map (Thomas)
- Prepare imported buffer for CPU access in the driver (Thomas)
- New patch: make sync flushing the default (Thomas)
- Link to v1: https://lore.kernel.org/r/20221122-gud-shadow-plane-v1-0-9de3afa3383e@tronnes.org

---
Noralf Trønnes (6):
      drm/gud: Fix UBSAN warning
      drm/gud: Don't retry a failed framebuffer flush
      drm/gud: Split up gud_flush_work()
      drm/gud: Prepare buffer for CPU access in gud_flush_work()
      drm/gud: Use the shadow plane helper
      drm/gud: Enable synchronous flushing by default

 drivers/gpu/drm/gud/gud_drv.c      |   1 +
 drivers/gpu/drm/gud/gud_internal.h |   1 +
 drivers/gpu/drm/gud/gud_pipe.c     | 222 ++++++++++++++++++-------------------
 3 files changed, 112 insertions(+), 112 deletions(-)
---
base-commit: 7257702951305b1f0259c3468c39fc59d1ad4d8b
change-id: 20221122-gud-shadow-plane-ae37a95d4d8d

Best regards,
-- 
Noralf Trønnes <noralf@tronnes.org>
