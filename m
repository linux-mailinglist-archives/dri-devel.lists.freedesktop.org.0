Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A54F831D414
	for <lists+dri-devel@lfdr.de>; Wed, 17 Feb 2021 03:54:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8BD589BA1;
	Wed, 17 Feb 2021 02:54:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1474E89B96
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Feb 2021 02:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613530452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pGpyvpoZaV2XZR1+BH6GoXWIxB5qeFgJto6v9O6bjeo=;
 b=Eu3GpsuMk+opfPsQ8PaPnSDgFHi07orILvqXJytC1Ri/2d8gxAxkEZA3DFqwR+Ksd303R9
 /5ygOswVmmFj99f+OrgE1DB0t7cIGMvoy0S71XyM2S99kanjRKbB0V52PxftSeINhV5SSq
 M18QAd3ZY1Bkbhg+dApGbgpX/8vDhKY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-PYuQhyyoOl6d2aqUESWFYA-1; Tue, 16 Feb 2021 21:54:10 -0500
X-MC-Unique: PYuQhyyoOl6d2aqUESWFYA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EBBEAC28A;
 Wed, 17 Feb 2021 02:54:08 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-113-106.rdu2.redhat.com
 [10.10.113.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7F1F010016F7;
 Wed, 17 Feb 2021 02:54:07 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 2/2] drm/i915/icp+: Use icp_hpd_irq_setup() instead of
 spt_hpd_irq_setup()
Date: Tue, 16 Feb 2021 21:53:37 -0500
Message-Id: <20210217025337.1929015-2-lyude@redhat.com>
In-Reply-To: <20210217025337.1929015-1-lyude@redhat.com>
References: <20210217025337.1929015-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While reviewing patches for handling workarounds related to gen9 bc, Imre
from Intel discovered that we're using spt_hpd_irq_setup() on ICP+ PCHs
despite it being almost the same as icp_hpd_irq_setup(). Since we need to
be calling icp_hpd_irq_setup() to ensure that CML-S/TGP platforms function
correctly anyway, let's move platforms using PCH_ICP which aren't handled
by gen11_hpd_irq_setup() over to icp_hpd_irq_setup().

Cc: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/i915/i915_irq.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index f86b147f588f..7ec61187a315 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -4320,6 +4320,8 @@ void intel_irq_init(struct drm_i915_private *dev_priv)
 			dev_priv->display.hpd_irq_setup = gen11_hpd_irq_setup;
 		else if (IS_GEN9_LP(dev_priv))
 			dev_priv->display.hpd_irq_setup = bxt_hpd_irq_setup;
+		else if (INTEL_PCH_TYPE(dev_priv) >= PCH_ICP)
+			dev_priv->display.hpd_irq_setup = icp_hpd_irq_setup;
 		else if (INTEL_PCH_TYPE(dev_priv) >= PCH_SPT)
 			dev_priv->display.hpd_irq_setup = spt_hpd_irq_setup;
 		else
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
