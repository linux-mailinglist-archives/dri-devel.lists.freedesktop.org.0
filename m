Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7DA7F9591
	for <lists+dri-devel@lfdr.de>; Sun, 26 Nov 2023 22:42:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A72CC10E141;
	Sun, 26 Nov 2023 21:42:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AB7B10E141;
 Sun, 26 Nov 2023 21:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail3; t=1701034933; x=1701294133;
 bh=dL78TmTJretyAnQzWvm7zDVHx7kCj0XwyD/7fGgw/O4=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=Qh6BtUByRqYH/QLMxTSPSyv3KeQcnaZu3ZIh4ZpOvMo92ve3As4JehNE9LoBFiBS8
 3GoMOqoKt5FwnzVG8RxOPivVBiJrPlKlF0YQf5GKJi1qyZ3RRVDwbpExmuoosId/zV
 d4hP5i4YVF8MzuWVmrJfoHEAWgP61lxLq09a1p5xhBztahZeW9SMo7HWUor91WzV0I
 dm0SIpUArNhrXyadnshOmh7vgZ865RmjvC1kn9QMjFibHlL3+fPUcnH/cc99oWYvpa
 BAjhsKzPypP24guPet3dHXgiRH1sM2RG+IIu0igFAEJ0DpF5/zsL56oRQWOGncyuFg
 nRgus22TVwBmw==
Date: Sun, 26 Nov 2023 21:42:01 +0000
To: intel-gfx@lists.freedesktop.org
From: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Subject: [PATCH v2] drm/i915/irq: Improve error logging for unexpected DE Misc
 interrupts
Message-ID: <20231126214142.102106-1-sergeantsagara@protonmail.com>
Feedback-ID: 26003777:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 dri-devel@lists.freedesktop.org,
 Rahul Rameshbabu <sergeantsagara@protonmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dump the iir value in hex when the interrupt is unexpected.

Link: https://gitlab.freedesktop.org/drm/intel/-/issues/9652#note_2178501
Cc: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---

Notes:
    Changes:
   =20
      v1->v2:
        - Change format specifier to pad minimum width
        - https://lore.kernel.org/intel-gfx/20231123175638.27650-1-sergeant=
sagara@protonmail.com/

 drivers/gpu/drm/i915/display/intel_display_irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_irq.c b/drivers/gpu=
/drm/i915/display/intel_display_irq.c
index bff4a76310c0..7c6f20cd951e 100644
--- a/drivers/gpu/drm/i915/display/intel_display_irq.c
+++ b/drivers/gpu/drm/i915/display/intel_display_irq.c
@@ -896,7 +896,7 @@ gen8_de_misc_irq_handler(struct drm_i915_private *dev_p=
riv, u32 iir)
 =09}
=20
 =09if (!found)
-=09=09drm_err(&dev_priv->drm, "Unexpected DE Misc interrupt\n");
+=09=09drm_err(&dev_priv->drm, "Unexpected DE Misc interrupt: 0x%08x\n", ii=
r);
 }
=20
 static void gen11_dsi_te_interrupt_handler(struct drm_i915_private *dev_pr=
iv,
--=20
2.40.1


