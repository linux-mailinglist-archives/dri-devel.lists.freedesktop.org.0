Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC1869524D
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 21:50:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4EE510E09B;
	Mon, 13 Feb 2023 20:50:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9208510E729;
 Mon, 13 Feb 2023 20:50:41 +0000 (UTC)
Received: from fews2.riseup.net (fews2-pn.riseup.net [10.0.1.84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4PFxLm73KNzDr25;
 Mon, 13 Feb 2023 20:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1676321441; bh=t/KHpvmCNlsioYhIlwQkLMpY6auxLkpUVWdb/HvPRT0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gK3vcWdbpHDoAgmzfhX9VzDAx/pXoLvj+9++6NSXRIC7VFHxzoTn8l7DQbgmaAPQD
 c4mYUN8WdfuS8vj9SvVbQ7+nnRrxJX0f5tW9S6OBE7TO73x6REaXP2b2LaVxqr7dwQ
 n49D4f2rJBqprvXjip4hjQ49VlcLoxTs1KugH3qw=
X-Riseup-User-ID: B23843E1BD50D156E8356E5A46BFE18D0D0483A7E662E37E54D7E4C02F77A46A
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews2.riseup.net (Postfix) with ESMTPSA id 4PFxLj0nTCz1y8Z;
 Mon, 13 Feb 2023 20:50:36 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 09/10] drm/amd/display: Make variables declaration inside
 ifdef guard
Date: Mon, 13 Feb 2023 17:49:22 -0300
Message-Id: <20230213204923.111948-10-arthurgrillo@riseup.net>
In-Reply-To: <20230213204923.111948-1-arthurgrillo@riseup.net>
References: <20230213204923.111948-1-arthurgrillo@riseup.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: sunpeng.li@amd.com, tales.aparecida@gmail.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, Arthur Grillo <arthurgrillo@riseup.net>,
 mairacanal@riseup.net, alexander.deucher@amd.com, andrealmeid@riseup.net,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make variables declaration inside ifdef guard, as they are only used
inside the same ifdef guard. This remove some of the
-Wunused-but-set-variable warning.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 .../gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c    | 4 ++++
 .../gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c  | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
index ec351c8418cb..27f488405335 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
@@ -878,7 +878,9 @@ static bool CalculatePrefetchSchedule(
 	double DSTTotalPixelsAfterScaler;
 	double LineTime;
 	double dst_y_prefetch_equ;
+#ifdef __DML_VBA_DEBUG__
 	double Tsw_oto;
+#endif
 	double prefetch_bw_oto;
 	double prefetch_bw_pr;
 	double Tvm_oto;
@@ -1060,7 +1062,9 @@ static bool CalculatePrefetchSchedule(
 
 	min_Lsw = dml_max(1, dml_max(PrefetchSourceLinesY, PrefetchSourceLinesC) / max_vratio_pre);
 	Lsw_oto = dml_ceil(4 * dml_max(prefetch_sw_bytes / prefetch_bw_oto / LineTime, min_Lsw), 1) / 4;
+#ifdef __DML_VBA_DEBUG__
 	Tsw_oto = Lsw_oto * LineTime;
+#endif
 
 
 #ifdef __DML_VBA_DEBUG__
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
index 950669f2c10d..0fd3889c2061 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
@@ -900,7 +900,9 @@ static bool CalculatePrefetchSchedule(
 	double DSTTotalPixelsAfterScaler;
 	double LineTime;
 	double dst_y_prefetch_equ;
+#ifdef __DML_VBA_DEBUG__
 	double Tsw_oto;
+#endif
 	double prefetch_bw_oto;
 	double prefetch_bw_pr;
 	double Tvm_oto;
@@ -1082,7 +1084,9 @@ static bool CalculatePrefetchSchedule(
 
 	min_Lsw = dml_max(1, dml_max(PrefetchSourceLinesY, PrefetchSourceLinesC) / max_vratio_pre);
 	Lsw_oto = dml_ceil(4 * dml_max(prefetch_sw_bytes / prefetch_bw_oto / LineTime, min_Lsw), 1) / 4;
+#ifdef __DML_VBA_DEBUG__
 	Tsw_oto = Lsw_oto * LineTime;
+#endif
 
 
 #ifdef __DML_VBA_DEBUG__
-- 
2.39.1

