Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B069A792F2
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 18:25:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9E4410E833;
	Wed,  2 Apr 2025 16:25:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Oo3d3BGC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3483510E833
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 16:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743611137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hv98OqlzyWAKEFmwKk26bAz7BGtmidSCfpkjYEbzjgM=;
 b=Oo3d3BGCg1cXK3KhHy27qfNpk51FnZxYrWcqKyewzdcg1HrNTkHrBbnjca6g95Td06Bl1s
 r7bFwkQwKr/0I2NjIyVuOrYJdVF8TSUpDQWw0+ja9zQBBpLLw+NoXh9lGcRIznuBl6CROv
 i9MGEfobx6lxfENcpyU3bMkZ7nYnI9w=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-6-QHDe-Cx-N4OCM1V3_8nsnQ-1; Wed,
 02 Apr 2025 12:25:33 -0400
X-MC-Unique: QHDe-Cx-N4OCM1V3_8nsnQ-1
X-Mimecast-MFC-AGG-ID: QHDe-Cx-N4OCM1V3_8nsnQ_1743611131
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id DF3931955DC6; Wed,  2 Apr 2025 16:25:29 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id CA9AA195609D; Wed,  2 Apr 2025 16:25:23 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Subject: [PATCH 00/30] drm/panel: Use refcounted allocation in place of
 devm_kzalloc() - Part2
Date: Wed, 02 Apr 2025 11:23:38 -0400
Message-Id: <20250402-b4-drm_panel_mass_convert_part2-v1-0-903b70999ea6@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHpW7WcC/x2NwQqDQAwFf0Vy7sI2uCD9lVKWqM8aqKskIgXx3
 7v0OHOYOclhCqdHc5LhUNe1VLjfGhpmKW8EHSsTR06xjRz6Noy25E0KPnkR9zys5YDtVdnOIU2
 cuj4KEoRqZTNM+v0fnq/r+gHuNwYvcQAAAA==
X-Change-ID: 20250402-b4-drm_panel_mass_convert_part2-5f258b0ae5ea
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Icenowy Zheng <icenowy@aosc.io>, Jagan Teki <jagan@amarulasolutions.com>, 
 Ondrej Jirman <megi@xff.cz>, Javier Martinez Canillas <javierm@redhat.com>, 
 Michael Trimarchi <michael@amarulasolutions.com>, 
 Michael Walle <mwalle@kernel.org>, Jagan Teki <jagan@edgeble.ai>, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Purism Kernel Team <kernel@puri.sm>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Jianhua Lu <lujianhua000@gmail.com>, Stefan Mavrodiev <stefan@olimex.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743607440; l=5102;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=agu1ExwUa1F4j0y38lgWWxaw6CC71lyFxBOd0OKQdC4=;
 b=+SL/ChHmNlA86LbUvZo7DKfCjEcKMGZXP7mEtRffjzteTW1gVPPm7qV8KdyAv28tlI5/VHWv1
 VUU0t/TDgAHAaScUbeKRE/HVbebRkS7QAQF5tJodBKe9SZyctB76wc7
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
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

Start converting drivers to use the API - devm_drm_panel_alloc().

Sending next 30 drivers. Sending in batches for easier review.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
Anusha Srivatsa (30):
      panel/panel-elida-kd35t133: Refcounted allocation
      panel/elida-kd35t133: Use refcounted allocation in place of devm_kzalloc()
      panel/fy07024di26a30d: Use refcounted allocation in place of devm_kzalloc()
      panel/himax-hx83112a: Use refcounted allocation in place of devm_kzalloc()
      panel/himax-hx8394: Use refcounted allocation in place of devm_kzalloc()
      panel/ilitek-ili9322: Use refcounted allocation in place of devm_kzalloc()
      panel/ilitek-ili9341: Use refcounted allocation in place of devm_kzalloc()
      panel/panel-ili9805: Use refcounted allocation in place of devm_kzalloc()
      panel/ilitek-ili9806e: Use refcounted allocation in place of devm_kzalloc()
      panel/ilitek-ili9881c: Use refcounted allocation in place of devm_kzalloc()
      panel/innolux-ej030na: Use refcounted allocation in place of devm_kzalloc()
      panel/innolux-p079zca: Use refcounted allocation in place of devm_kzalloc()
      panel/jadard-jd9365da-h3: Use refcounted allocation in place of devm_kzalloc()
      panel/jdi-fhd-r63452: Use refcounted allocation in place of devm_kzalloc()
      panel/ltk050h3146w: Use refcounted allocation in place of devm_kzalloc()
      panel/ltk500hd1829: Use refcounted allocation in place of devm_kzalloc()
      panel/lg-lg4573: Use refcounted allocation in place of devm_kzalloc()
      panel/lincolntech-lcd197: Use refcounted allocation in place of devm_kzalloc()
      panel/magnachip-d53e6ea8966: Use refcounted allocation in place of devm_kzalloc()
      panel/mantix-mlaf057we51: Use refcounted allocation in place of devm_kzalloc()
      panel/newvision-nv3051d: Use refcounted allocation in place of devm_kzalloc()
      panel/newvision-nv3052c: Use refcounted allocation in place of devm_kzalloc()
      panel/novatek-nt35510: Use refcounted allocation in place of devm_kzalloc()
      panel/novatek-nt35560: Use refcounted allocation in place of devm_kzalloc()
      panel/novatek-nt35950: Use refcounted allocation in place of devm_kzalloc()
      panel/novatek-nt36523: Use refcounted allocation in place of devm_kzalloc()
      panel/novatek-nt36672e: Use refcounted allocation in place of devm_kzalloc()
      panel/novatek-nt39016: Use refcounted allocation in place of devm_kzalloc()
      panel/lcd-olinuxino: Use refcounted allocation in place of devm_kzalloc()
      panel/orisetech-ota5601a: Use refcounted allocation in place of devm_kzalloc()

 drivers/gpu/drm/panel/panel-elida-kd35t133.c          | 10 ++++------
 drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c     | 11 +++++------
 drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c | 10 ++++------
 drivers/gpu/drm/panel/panel-himax-hx83112a.c          | 10 +++++-----
 drivers/gpu/drm/panel/panel-himax-hx8394.c            | 11 +++++------
 drivers/gpu/drm/panel/panel-ilitek-ili9322.c          | 10 ++++------
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c          |  8 +++++---
 drivers/gpu/drm/panel/panel-ilitek-ili9805.c          | 12 ++++++------
 drivers/gpu/drm/panel/panel-ilitek-ili9806e.c         | 10 ++++------
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c         | 11 +++++------
 drivers/gpu/drm/panel/panel-innolux-ej030na.c         | 11 +++++------
 drivers/gpu/drm/panel/panel-innolux-p079zca.c         | 11 +++++------
 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c      | 10 ++++------
 drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c          | 10 +++++-----
 drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c    | 11 +++++------
 drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c    | 11 +++++------
 drivers/gpu/drm/panel/panel-lg-lg4573.c               | 11 +++++------
 drivers/gpu/drm/panel/panel-lincolntech-lcd197.c      | 11 +++++------
 drivers/gpu/drm/panel/panel-magnachip-d53e6ea8966.c   | 11 +++++------
 drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c      | 11 +++++------
 drivers/gpu/drm/panel/panel-newvision-nv3051d.c       | 11 +++++------
 drivers/gpu/drm/panel/panel-newvision-nv3052c.c       | 10 ++++------
 drivers/gpu/drm/panel/panel-novatek-nt35510.c         | 12 ++++++------
 drivers/gpu/drm/panel/panel-novatek-nt35560.c         | 12 ++++++------
 drivers/gpu/drm/panel/panel-novatek-nt35950.c         | 10 ++++------
 drivers/gpu/drm/panel/panel-novatek-nt36523.c         |  9 +++++----
 drivers/gpu/drm/panel/panel-novatek-nt36672e.c        | 10 +++++-----
 drivers/gpu/drm/panel/panel-novatek-nt39016.c         | 10 ++++------
 drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c    | 11 +++++------
 drivers/gpu/drm/panel/panel-orisetech-ota5601a.c      | 11 +++++------
 30 files changed, 145 insertions(+), 172 deletions(-)
---
base-commit: de04bb0089a96cc00d13b12cbf66a088befe3057
change-id: 20250402-b4-drm_panel_mass_convert_part2-5f258b0ae5ea

Best regards,
-- 
Anusha Srivatsa <asrivats@redhat.com>

