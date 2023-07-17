Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E30EC756506
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 15:31:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2698910E255;
	Mon, 17 Jul 2023 13:31:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F44C10E255
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 13:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689600691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=etyDXPwAJat72QTvuuWsoOi3Ov6SZbfahaIKUvDUYCU=;
 b=Supl4LUSa/8OTwMsTy14oXAPhPMcuNe2fsQITcK8Y5iXdO64yLEyiFnJv5le9IWkwCve2C
 jjY24P7NQNL1pDgTIScV8YIbah5voPHmKzujzDThUcQ1rKCaePiXUmpgrJbhjMsLalFnSF
 ZM2aq9H+Z19+9sK0IWAIgnXMp+Ll62M=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-464-iuLk85xYMLCTmOjMe1YAxQ-1; Mon, 17 Jul 2023 09:31:27 -0400
X-MC-Unique: iuLk85xYMLCTmOjMe1YAxQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EA376280BC4A;
 Mon, 17 Jul 2023 13:31:24 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.194.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E05F72166B25;
 Mon, 17 Jul 2023 13:31:23 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: tzimmermann@suse.de,
	airlied@redhat.com,
	daniel@ffwll.ch
Subject: [PATCH] drm/mgag200: Increase bandwidth for G200se A rev1
Date: Mon, 17 Jul 2023 15:29:59 +0200
Message-ID: <20230717133037.25941-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Roger Sewell <roger.sewell@cantab.net>,
 Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A G200SE_A rev 1 user reported that prior to v6.0, he was able to get Xorg
working at 1440x900@60Hz. This somehow bypassed the bandwidth test in the
driver. After v6.0, and the driver refactor, it's no longer possible.
So increase the bandwidth, as the hardware is able to do it.

In mgag200_calculate_mode_bandwidth(), the bandwidth for 1440x900@60 is
30318019, while 24400 * 1024 = 24985600 and 30100 * 1024 = 30822400.
Raising the bandwidth from 24400 to 30100 is enough to allow this mode.

Reported-by: Roger Sewell <roger.sewell@cantab.net>
Tested-by: Roger Sewell <roger.sewell@cantab.net>
Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/mgag200/mgag200_g200se.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_g200se.c b/drivers/gpu/drm/mgag200/mgag200_g200se.c
index bd6e573c9a1a..3b49e30931e1 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200se.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200se.c
@@ -437,7 +437,7 @@ static int mgag200_g200se_pipeline_init(struct mga_device *mdev)
  */
 
 static const struct mgag200_device_info mgag200_g200se_a_01_device_info =
-	MGAG200_DEVICE_INFO_INIT(1600, 1200, 24400, false, 0, 1, true);
+	MGAG200_DEVICE_INFO_INIT(1600, 1200, 30100, false, 0, 1, true);
 
 static const struct mgag200_device_info mgag200_g200se_a_02_device_info =
 	MGAG200_DEVICE_INFO_INIT(1920, 1200, 30100, false, 0, 1, true);

base-commit: c2268daa65fb415cfd463016ad54c20afef8f75e
-- 
2.41.0

