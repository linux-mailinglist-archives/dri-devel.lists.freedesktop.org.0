Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F30C72F4637
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 09:22:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F4706E12E;
	Wed, 13 Jan 2021 08:21:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48A7C89A86
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 01:42:03 +0000 (UTC)
Received: from mail-pl1-f198.google.com ([209.85.214.198])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <koba.ko@canonical.com>) id 1kzV9q-0002fH-9q
 for dri-devel@lists.freedesktop.org; Wed, 13 Jan 2021 01:41:10 +0000
Received: by mail-pl1-f198.google.com with SMTP id b2so213666pls.18
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 17:41:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VzdOF8J+GZRgyyD73mbL6B1kdprEKDDRyev/uww/1pM=;
 b=rIxcTMvdvXT7tBrRRJy+8mi8VV9gu7FGmwxk5bacyZAKqRQODAfU7jedK6iHnAx1OP
 0f68GkkSNOWNnshk5g6tdJ3yS2x2DWKzm3c6Ey216eT244RqE4LMQhcPa815OEsu3/j5
 nA29Oij65qrZbVbZbzkm81EOcLYLOhGZPwWH6ydvshHvb+cqkiluSsfWYVn5e6+/f2x5
 O3BdAUQrj1CKUmxu36n5JH/Ny7prHs+m+0W3Ul3o4Ba6H33hAlD0vXUbEOyNUBINRYL8
 qtG1E6Sh/IaGsSDNMGacMlbN6y6UxTgq33ZzTPz7dnVE6/C8QSMvko1IvHhCYMcIVSV6
 nq7A==
X-Gm-Message-State: AOAM531OsXC7S8tPDaG0JsTxRL++2rfuDY7zyyVSTAI5WHFEU8P8f8Tk
 JnekonX2wIpAS0nkR+gaSDyuryx91YxyofJvEa1DTrTucOf3BfNY7bw1xPjYFbqN96BqNcfRi78
 pP84+owF0grCEsFyCibHUPmxBvHKyZsZWHqUcJLar2DxMTw==
X-Received: by 2002:aa7:9782:0:b029:19e:b084:f0a9 with SMTP id
 o2-20020aa797820000b029019eb084f0a9mr18583pfp.28.1610502068905; 
 Tue, 12 Jan 2021 17:41:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy7piFkV3OCXWidUjdkxc1oP640g6yICBb7f9TEClAaEm7gncz9ccnwqqyMKqt/HWSmzMJvWw==
X-Received: by 2002:aa7:9782:0:b029:19e:b084:f0a9 with SMTP id
 o2-20020aa797820000b029019eb084f0a9mr18549pfp.28.1610502068269; 
 Tue, 12 Jan 2021 17:41:08 -0800 (PST)
Received: from canonical.com (36-229-237-19.dynamic-ip.hinet.net.
 [36.229.237.19])
 by smtp.gmail.com with ESMTPSA id l7sm323837pjy.29.2021.01.12.17.41.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 17:41:07 -0800 (PST)
From: Koba Ko <koba.ko@canonical.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Lyude Paul <lyude@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] drm/dp_mst: Retrieve extended DPCD caps for topology
 manager
Date: Wed, 13 Jan 2021 09:41:04 +0800
Message-Id: <20210113014105.28110-1-koba.ko@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 13 Jan 2021 08:21:20 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As per DP-1.3, First check DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT.
If DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT is 1,read the DP_DP13_DPCD_REV to
get the faster capability.
If DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT is 0,read DP_DPCD_REV.

Signed-off-by: Koba Ko <koba.ko@canonical.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
[added aux name to drm_dbg_kms() call]
Signed-off-by: Lyude Paul <lyude@redhat.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20200922065313.4794-1-koba.ko@canonical.com
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 0401b2f47500..6982ecbf30b5 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -3686,9 +3686,10 @@ int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *mgr, bool ms
 		WARN_ON(mgr->mst_primary);
 
 		/* get dpcd info */
-		ret = drm_dp_dpcd_read(mgr->aux, DP_DPCD_REV, mgr->dpcd, DP_RECEIVER_CAP_SIZE);
-		if (ret != DP_RECEIVER_CAP_SIZE) {
-			DRM_DEBUG_KMS("failed to read DPCD\n");
+		ret = drm_dp_read_dpcd_caps(mgr->aux, mgr->dpcd);
+		if (ret < 0) {
+			drm_dbg_kms(mgr->dev, "%s: failed to read DPCD, ret %d\n",
+				    mgr->aux->name, ret);
 			goto out_unlock;
 		}
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
