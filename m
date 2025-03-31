Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC293A76BC2
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 18:17:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E585210E14D;
	Mon, 31 Mar 2025 16:17:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="NoYmZDMO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7373710E14D
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 16:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743437819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qNIFuWAVVY5MdpvZ+wT0vBuHY2Nn/EWRcs2vVYB5g6k=;
 b=NoYmZDMOFbrg7icDWJY1GTizM6zOas7fUoulb299pKwTB1tDiT9Fn6mdRopgnXvTmzLmrW
 47HL1GEIAXGl9wT2K7SZwxh44kjqCwHtRYH7vDbiyweoTJFOmMNSCi/MZ3c6YzQTdt6xjr
 cniSvfE0gQT9l1PvI9+Be6AR+Cb1Xw4=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-643-WUxdeIj8Pi69WALUlgP4Pg-1; Mon,
 31 Mar 2025 12:16:56 -0400
X-MC-Unique: WUxdeIj8Pi69WALUlgP4Pg-1
X-Mimecast-MFC-AGG-ID: WUxdeIj8Pi69WALUlgP4Pg_1743437814
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 51BFD180AB16; Mon, 31 Mar 2025 16:16:54 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 102A419560AD; Mon, 31 Mar 2025 16:16:51 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Subject: [PATCH v4 0/4] drm/panel: Panel Refcounting infrastructure
Date: Mon, 31 Mar 2025 11:15:24 -0400
Message-Id: <20250331-b4-panel-refcounting-v4-0-dad50c60c6c9@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIyx6mcC/3XNSwrCMBCA4atI1kbymFHqynuIizwmNqBpSWtRp
 Hc3FoSKdvnPMN88WUc5Usf2qyfLNMQuNqkErFfM1SadiUdfmimhUGgF3AJvTaILzxRcc0t9TGc
 OwljcGqMh7Fg5bcsy3if2eCpdx65v8mP6Msj39APif3CQXHAgZQN6WTn0h0y+Nv3GNVf2Fgc1V
 3YLiiqKxYDOIMpQ4Y+iZ4oWC4ouiiDhgWALkuyXMo7jCwLvwWVFAQAA
X-Change-ID: 20250324-b4-panel-refcounting-40ab56aa34f7
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743434129; l=2504;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=MRdcYUkF4Pe4Wr0aSbQoo3p6MhneDKW8+5FisJSdyXo=;
 b=pUAnnm/mVOXK5jpk0gamctKrxamaXOg3KZpcdfYaGn9OWz3cfTNND+8HRYUKKjkMTAc9PaTwQ
 LUmfh+Sk5GJCeaoQS7r/jqFc3d8BEEKtjJdz26WV4b82wu5NEaL/Q3o
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
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

This series adds the infrastructure needed for the refcounting
allocations for panels similar to Luca's efforts with bridges.
Underlying intention and idea is the same - avoid use-after-free
situations in panels. Get reference to panel when in use and put
the reference back (down) when not in use.
Once this gets approved, rest of the drivers will have to be
mass converted to use this API.  All the callers of of_drm_find_panel()
will have to be converted too.

Tried to split the patches as suggested in the RFC series[1].
Also fixed the connector used during panel_init to be the one
passed by driver.

Patch 4 was not suggested or part of my initial work. Added it
after looking at the comments Luca's v8 of the bridge series
received.[2]

[1] -> https://patchwork.freedesktop.org/series/146236/
[2] -> https://patchwork.freedesktop.org/series/146306/#rev2

Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
Changes in v4:
- Move refcounting documentation from Patch 1 to Patch 2 
- Link to v3: https://lore.kernel.org/r/20250330-b4-panel-refcounting-v3-0-0e0d4e4641eb@redhat.com

Changes in v3:
- Move the include from patch 1 to patch 2 where it is actually used
- Move the refcounting documentation out from the returns section to the
  actual helper socumentation.
- Code style changes. Move the version changes after the s-o-b.
- Link to v2: https://lore.kernel.org/r/20250327-b4-panel-refcounting-v2-0-b5f5ca551f95@redhat.com

Changes in v2:
- Change drm_panel_put() to return void.
- Export drm_panel_get()/put()
- Code cleanups: add missing return documentation, improve documentation
  in commit logs. 
- Link to v1: https://lore.kernel.org/r/20250325-b4-panel-refcounting-v1-0-4e2bf5d19c5d@redhat.com

---
Anusha Srivatsa (4):
      drm/panel: Add new helpers for refcounted panel allocatons
      drm/panel: Add refcount support
      drm/panel: deprecate old-style panel allocation
      drm/panel/panel-simple: Use the new allocation in place of devm_kzalloc()

 drivers/gpu/drm/drm_panel.c          | 92 +++++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/panel/panel-simple.c |  9 ++--
 include/drm/drm_panel.h              | 41 ++++++++++++++++
 3 files changed, 135 insertions(+), 7 deletions(-)
---
base-commit: 372a9ca3c1f2ea10dd05a5d5008d055bc9536ced
change-id: 20250324-b4-panel-refcounting-40ab56aa34f7

Best regards,
-- 
Anusha Srivatsa <asrivats@redhat.com>

