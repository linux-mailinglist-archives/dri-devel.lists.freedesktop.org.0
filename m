Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 985ABC5B3DD
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 04:54:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B29810E068;
	Fri, 14 Nov 2025 03:53:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 687A210E068
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 03:53:46 +0000 (UTC)
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-53-Une5n3XhPy-XUXJTge3gmg-1; Thu,
 13 Nov 2025 22:53:43 -0500
X-MC-Unique: Une5n3XhPy-XUXJTge3gmg-1
X-Mimecast-MFC-AGG-ID: Une5n3XhPy-XUXJTge3gmg_1763092422
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 9E7481956080
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 03:53:42 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.67.32.53])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 47DE619560B9
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 03:53:40 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/scdc: add frl config/status registers to scdc header.
Date: Fri, 14 Nov 2025 13:53:37 +1000
Message-ID: <20251114035338.15144-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Pcchiica2GhTs4VLo29DGktbcUY4rUqhcZ6MkAf2ZbY_1763092422
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
content-type: text/plain; charset=WINDOWS-1252; x-default=true
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

From: Dave Airlie <airlied@redhat.com>

These are sourced from publically available presentations like
https://www.ti.com/content/dam/videos/external-videos/en-us/11/381684162600=
1/overview-ddc-bus-hdmi-systems.mp4/subassets/overview-ddc-bus-hdmi-systems=
-presentation.pdf

Document in the kernel in case they are of use to someone.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 include/drm/display/drm_scdc.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/include/drm/display/drm_scdc.h b/include/drm/display/drm_scdc.=
h
index 3d58f37e8ed8..3b6a8a4a4bca 100644
--- a/include/drm/display/drm_scdc.h
+++ b/include/drm/display/drm_scdc.h
@@ -29,6 +29,8 @@
 #define SCDC_SOURCE_VERSION 0x02
=20
 #define SCDC_UPDATE_0 0x10
+#define  SCDC_FLT_UPDATE (1 << 5)
+#define  SCDC_FRL_START (1 << 4)
 #define  SCDC_READ_REQUEST_TEST (1 << 2)
 #define  SCDC_CED_UPDATE (1 << 1)
 #define  SCDC_STATUS_UPDATE (1 << 0)
@@ -46,7 +48,20 @@
 #define SCDC_CONFIG_0 0x30
 #define  SCDC_READ_REQUEST_ENABLE (1 << 0)
=20
+#define SCDC_CONFIG_FRL 0x31
+#define  SCDC_FRL_RATE(x) (((x) & 0x7) << 0)
+#define  SCDC_FRL_RATE_DISABLE 0
+#define  SCDC_FRL_RATE_FIXED_3LANE_3GB 1
+#define  SCDC_FRL_RATE_FIXED_3LANE_6GB 2
+#define  SCDC_FRL_RATE_FIXED_4LANE_6GB 3
+#define  SCDC_FRL_RATE_FIXED_4LANE_8GB 4
+#define  SCDC_FRL_RATE_FIXED_4LANE_10GB 5
+#define  SCDC_FRL_RATE_FIXED_4LANE_12GB 6
+#define  SCDC_FRL_FFE_LEVELS(x) (((x) & 0xF) << 4)
+
 #define SCDC_STATUS_FLAGS_0 0x40
+#define  SCDC_FLT_READY (1 << 6)
+#define  SCDC_LANE3_LOCK (1 << 4)
 #define  SCDC_CH2_LOCK (1 << 3)
 #define  SCDC_CH1_LOCK (1 << 2)
 #define  SCDC_CH0_LOCK (1 << 1)
@@ -55,6 +70,9 @@
=20
 #define SCDC_STATUS_FLAGS_1 0x41
=20
+#define SCDC_LN_LTP_01 0x41
+#define SCDC_LN_LTP_23 0x42
+
 #define SCDC_ERR_DET_0_L 0x50
 #define SCDC_ERR_DET_0_H 0x51
 #define SCDC_ERR_DET_1_L 0x52
--=20
2.51.1

