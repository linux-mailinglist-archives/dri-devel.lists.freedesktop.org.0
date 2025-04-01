Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCB9A78103
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 19:05:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 755E710E11B;
	Tue,  1 Apr 2025 17:05:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="KnEZlpj5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2221610E11B
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 17:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743527122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=abRV/EEA2oX2CI+2x0ELtAyX0rvoIHlLIZhbaHI2Gd4=;
 b=KnEZlpj5dROm6CBiJphGmj/TO8VcVA3H+T/rFBdgBjWdBu9SuoZOoiTz8J7g3uBzAMvpBn
 FMJCoxtLUJSDZzjjNfVE/ZPDWzYUpsDspFVh3j1Xafu5VV7Tf3tpvvcnyvRBPnf8xGjIqg
 e+J9RvvSOFO6R5jqHLLLi3ukJcRD/UM=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-464-ZhPr-JTsOz2d05EIj3QQqQ-1; Tue,
 01 Apr 2025 13:05:19 -0400
X-MC-Unique: ZhPr-JTsOz2d05EIj3QQqQ-1
X-Mimecast-MFC-AGG-ID: ZhPr-JTsOz2d05EIj3QQqQ_1743527116
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B14EE1809CA6; Tue,  1 Apr 2025 17:05:15 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id A4554180B487; Tue,  1 Apr 2025 17:05:12 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Subject: [PATCH 00/10] drm/panel: Use refcounted allocation in place of
 devm_kzalloc()
Date: Tue, 01 Apr 2025 12:03:43 -0400
Message-Id: <20250401-b4-drm-panel-mass-driver-convert-v1-0-cdd7615e1f93@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF8O7GcC/x3NQQqDQAyF4atI1g3MTFWwVyldTCdpDegoSZGCe
 HeDq8e3ef8Oxips8Gh2UN7EZKmOeGugjLl+GYXckELqQhsivlsknXHNlSecs5lTNlYsS/X5IVH
 J98RDR7EHv1mVP/K/Es/XcZxLqBhNcgAAAA==
X-Change-ID: 20250401-b4-drm-panel-mass-driver-convert-ddca32e95d16
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Linus Walleij <linus.walleij@linaro.org>, Joel Selvaraj <jo@jsfamily.in>, 
 Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743523429; l=2176;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=gpu4RQoZ2bNMTVcYHXQz2BuKWsbqheQeg8YYLp3CVvM=;
 b=PsU+wQj+sryejgbMaFvUoAhEFpqFlg7J9sXqp9MyUOKC6Qa6HI/60/mYkNHtKNXTcNPogdSeK
 uENQNodaQS7DoePvLBrgfZ0aTpMDD49gtKxUKUrq/bpyMtnyKRGAlAc
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
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

This series addresses only 10 drivers. There are 98 more to go. Sending this
series to mostly get feedback. if any change is required, it will be
incorporated in the next version and in the next series that will
address the remaining drivers.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
Anusha Srivatsa (10):
      panel/abt-y030xx067a: Use the refcounted allocation in place of devm_kzalloc()
      panel/arm-versatile:  Use the refcounted allocation in place of devm_kzalloc()
      panel/z00t-tm5p5-n35596: Use refcounted allocation in place of devm_kzalloc()
      panel/auo-a030jtn01: Use refcounted allocation in place of devm_kzalloc()
      panel/bf060y8m-aj0: Use refcounted allocation in place of devm_kzalloc()
      panel/th101mb31ig002-28a: Use refcounted allocation in place of devm_kzalloc()
      panel/boe-tv101wum-ll2: Use refcounted allocation in place of devm_kzalloc()
      panel/dsi-cm: Use refcounted allocation in place of devm_kzalloc()
      panel/ebbg-ft8719: Use refcounted allocation in place of devm_kzalloc()
      panel/panel-edp: Use refcounted allocation in place of devm_kzalloc()

 drivers/gpu/drm/panel/panel-abt-y030xx067a.c         | 10 ++++------
 drivers/gpu/drm/panel/panel-arm-versatile.c          | 11 +++++------
 drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c | 11 +++++------
 drivers/gpu/drm/panel/panel-auo-a030jtn01.c          | 10 ++++------
 drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c       | 11 +++++------
 drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c | 11 +++++------
 drivers/gpu/drm/panel/panel-boe-tv101wum-ll2.c       | 10 +++++-----
 drivers/gpu/drm/panel/panel-dsi-cm.c                 | 10 ++++------
 drivers/gpu/drm/panel/panel-ebbg-ft8719.c            | 11 +++++------
 drivers/gpu/drm/panel/panel-edp.c                    |  9 ++++-----
 10 files changed, 46 insertions(+), 58 deletions(-)
---
base-commit: de04bb0089a96cc00d13b12cbf66a088befe3057
change-id: 20250401-b4-drm-panel-mass-driver-convert-ddca32e95d16

Best regards,
-- 
Anusha Srivatsa <asrivats@redhat.com>

