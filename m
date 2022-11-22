Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5036348DB
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 21:59:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E126910E482;
	Tue, 22 Nov 2022 20:59:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 261DC888D9
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 20:59:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3C49AB81D90;
 Tue, 22 Nov 2022 20:59:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 02F47C433C1;
 Tue, 22 Nov 2022 20:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669150745;
 bh=2kUsMoip/I5L/jzYvNVVzZt0HNhhu6fE/IWnGiuAneI=;
 h=Subject:From:Date:To:Reply-To:From;
 b=TA5K8rng/8HcoJXmPw68zVO+Exj+0BT1Uxl76gX3VcAByfDittpt8q8muYgQmgSh7
 rUbFQM7e7peRvNILlr3mIS3DjIMZoYyHGRU6ADc99lWKpdaqLPYmukchdoZvDsl57M
 4QFLrPOUKQ8502OBaVRN2LVD9iy7iXXIYd2vLyGSYG+7u3aOp7eIC0GBiuV5ME8FjJ
 yML0cdZSBpHBEO7XZ+XtA35wdkVQAY2XM5trczaZwKUMnpBy7TkJKxGOrFLm0KiM8+
 1p803dNTHvpfyTXSuctvX2teLlfl2i4v5at7B8qwfZF6pUnhMM5gSSWGheFex/8pxJ
 rQtlZBz266Hug==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id D85D2C4332F;
 Tue, 22 Nov 2022 20:59:04 +0000 (UTC)
Subject: [PATCH 0/6] drm/gud: Use the shadow plane helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-b4-tracking: H4sIAP43fWMC/w3LQQqEMAwAwK9IzgZsVHT3N6kJtlDi0uB6EP9uj3OYG1xrVodvd0PVf/Z8WEPoO9
 gS266YpRloIAqBCPdT0BPLceGvsCmyjgt/ZplkFWgtsivGyralFu0s5Xle8Sy6k2cAAAA=
From: Noralf Trønnes via B4 Submission Endpoint <devnull@kernel.org>
Date: Tue, 22 Nov 2022 21:58:38 +0100
Message-Id: <20221122-gud-shadow-plane-v1-0-9de3afa3383e@tronnes.org>
To: Thomas Zimmermann <tzimmermann@suse.de>, stable@kernel.org,
	Dave Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org,
	Hans de Goede <hdegoede@redhat.com>,
	Noralf Trønnes <noralf@tronnes.org>,
	Maxime Ripard <mripard@kernel.org>,
	Javier Martinez Canillas <javierm@redhat.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1669150743; l=2009;
 i=noralf@tronnes.org; s=20221122; h=from:subject:message-id;
 bh=fCEYnc7B5DuEdhoxMG3nvbfjTrsi43MKH/fHuTVo2Cg=;
 b=S4MQUVlCFozcBiYzqLeEtQxpd6QgwEOFhm01orUEdoenvVcAGTmPyIvQzVqC5n/r47YX34kA1iYi
 NWCxXEdJBiY6TOH8DvU+6fhLDE83ap6xus2F8gokHh05wWhtKFrs
X-Developer-Key: i=noralf@tronnes.org; a=ed25519;
 pk=0o9is4iddvvlrY3yON5SVtAbgPnVs0LfQsjfqR2Hvz8=
X-Endpoint-Received: by B4 Submission Endpoint for noralf@tronnes.org/20221122
 with auth_id=8
X-Original-From: Noralf Trønnes <noralf@tronnes.org>
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

From: Noralf Trønnes <noralf@tronnes.org>

Hi,

I have started to look at igt for testing and want to use CRC tests. To
implement support for this I need to move away from the simple kms
helper.

When looking around for examples I came across Thomas' nice shadow
helper and thought, yes this is perfect for drm/gud. So I'll switch to
that before I move away from the simple kms helper.

The async framebuffer flushing code path now uses a shadow buffer and
doesn't touch the framebuffer when it shouldn't. I have also taken the
opportunity to inline the synchronous flush code path since this will be
the future default when userspace predominently don't run all displays
in the same rendering loop. A shared rendering loop slows down all
displays to run at the speed of the slowest one.

Noralf.

Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Noralf Trønnes <noralf@tronnes.org>

---
Noralf Trønnes (6):
      drm/gem: shadow_fb_access: Prepare imported buffers for CPU access
      drm/gud: Fix UBSAN warning
      drm/gud: Don't retry a failed framebuffer flush
      drm/gud: Split up gud_flush_work()
      drm/gud: Prepare buffer for CPU access in gud_flush_work()
      drm/gud: Use the shadow plane helper

 drivers/gpu/drm/drm_gem_atomic_helper.c |  13 ++-
 drivers/gpu/drm/gud/gud_drv.c           |   1 +
 drivers/gpu/drm/gud/gud_internal.h      |   1 +
 drivers/gpu/drm/gud/gud_pipe.c          | 198 +++++++++++++++-----------------
 drivers/gpu/drm/solomon/ssd130x.c       |  10 +-
 drivers/gpu/drm/tiny/gm12u320.c         |  10 +-
 drivers/gpu/drm/tiny/ofdrm.c            |  10 +-
 drivers/gpu/drm/tiny/simpledrm.c        |  10 +-
 drivers/gpu/drm/udl/udl_modeset.c       |  11 +-
 9 files changed, 117 insertions(+), 147 deletions(-)
---
base-commit: 7257702951305b1f0259c3468c39fc59d1ad4d8b
change-id: 20221122-gud-shadow-plane-ae37a95d4d8d

Best regards,
-- 
Noralf Trønnes <noralf@tronnes.org>

