Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4962D6FDA17
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 10:55:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D63A610E466;
	Wed, 10 May 2023 08:55:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5758410E466
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 08:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683708913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=HCG1W7/c7Lgz8PoTuKyRX8o/yyWCNKZTf6kZON4C85I=;
 b=FUV7eh65tKPXqJxQnJTKBfbKJw/dOoSdpBis/zGTHbzsyjKfsJeMMnZon4r3F/PF+PHsFc
 VGr3uyf1aD9qKiOqwHuzqozPbhfDupwhKfkioFQtCyTbsTt2yGAQ3Odqit9EgG3B3fwdDd
 o3Nv6DoSasO9EtRS14JYcWrg2dECLUk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-495-RPSucRMDPE-yIll5M7TzOw-1; Wed, 10 May 2023 04:55:09 -0400
X-MC-Unique: RPSucRMDPE-yIll5M7TzOw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 25595868C96;
 Wed, 10 May 2023 08:55:09 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B1554C15BA0;
 Wed, 10 May 2023 08:55:07 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 javierm@redhat.com, lyude@redhat.com
Subject: [PATCH] drm/mgag200: Fix gamma lut not initialized.
Date: Wed, 10 May 2023 10:54:51 +0200
Message-Id: <20230510085451.226546-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
Cc: Phil Oester <kernel@linuxace.com>, Jocelyn Falempe <jfalempe@redhat.com>,
 stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When mgag200 switched from simple KMS to regular atomic helpers,
the initialization of the gamma settings was lost.
This leads to a black screen, if the bios/uefi doesn't use the same
pixel color depth.

Link: https://bugzilla.redhat.com/show_bug.cgi?id=2171155
Fixes: 1baf9127c482 ("drm/mgag200: Replace simple-KMS with regular atomic helpers")
Tested-by: Phil Oester <kernel@linuxace.com>
Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 461da1409fdf..911d46741e40 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -819,6 +819,11 @@ static void mgag200_crtc_helper_atomic_enable(struct drm_crtc *crtc,
 	else if (mdev->type == G200_EV)
 		mgag200_g200ev_set_hiprilvl(mdev);
 
+	if (crtc_state->gamma_lut)
+		mgag200_crtc_set_gamma(mdev, format, crtc_state->gamma_lut->data);
+	else
+		mgag200_crtc_set_gamma_linear(mdev, format);
+
 	mgag200_enable_display(mdev);
 
 	if (mdev->type == G200_WB || mdev->type == G200_EW3)

base-commit: 1baf9127c482a3a58aef81d92ae751798e2db202
-- 
2.39.2

