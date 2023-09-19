Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFFA7A6F8C
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 01:36:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 939EB10E422;
	Tue, 19 Sep 2023 23:36:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 493CF10E1F6;
 Tue, 19 Sep 2023 23:36:08 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a02:8010:65b5:0:1ac0:4dff:feee:236a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id BA73966071A9;
 Wed, 20 Sep 2023 00:36:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1695166566;
 bh=fsXk4Gu75MgGG6vNMPuwnxFfx901KJO2Un2zim24NTM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Dq5b59vhlYoNpLOW5qFt0Bk73Ed7dsZ6/s8FLoFexKkdanEzvgulyJ/glb9OcZBqD
 kPG1j/DenYrFKPpxvA/O/P7UJyULnjmBQpo7GuqQ60pszHZwJ700dXUt9blsbyJG99
 HCNcd6iaCDq0g3L21X+G3lz4RfBHcO8Dycaqv4wCma4opNSboztcaI0Do/Vy2SZc1e
 AvQfaKoxU35FWQr738ZezlmdDFR5g1x2e8xC9Few10Vl4qFivODIQkFPtgJg9+ge0A
 fWqOec2wtLPCNeO2gGzr5UpdITgCq4SsqXzKrU+J1t74X0krAMoMsLZtP8dTP8ovQY
 PTw/l6lECRW8w==
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, robh@kernel.org, steven.price@arm.com
Subject: [PATCH v6 6/6] drm/drm-file: Show finer-grained BO sizes in
 drm_show_memory_stats
Date: Wed, 20 Sep 2023 00:34:54 +0100
Message-ID: <20230919233556.1458793-7-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230919233556.1458793-1-adrian.larumbe@collabora.com>
References: <20230919233556.1458793-1-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-arm-msm@vger.kernel.org, adrian.larumbe@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 healych@amazon.com, Boris Brezillon <boris.brezillon@collabora.com>,
 kernel@collabora.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current implementation will try to pick the highest available size
display unit as soon as the BO size exceeds that of the previous
multiplier. That can lead to loss of precision in contexts of low memory
usage.

The new selection criteria try to preserve precision, whilst also
increasing the display unit selection threshold to render more accurate
values.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/drm_file.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 762965e3d503..34cfa128ffe5 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -872,6 +872,8 @@ void drm_send_event(struct drm_device *dev, struct drm_pending_event *e)
 }
 EXPORT_SYMBOL(drm_send_event);
 
+#define UPPER_UNIT_THRESHOLD 100
+
 static void print_size(struct drm_printer *p, const char *stat,
 		       const char *region, u64 sz)
 {
@@ -879,7 +881,8 @@ static void print_size(struct drm_printer *p, const char *stat,
 	unsigned u;
 
 	for (u = 0; u < ARRAY_SIZE(units) - 1; u++) {
-		if (sz < SZ_1K)
+		if ((sz & (SZ_1K - 1)) &&
+		    sz < UPPER_UNIT_THRESHOLD * SZ_1K)
 			break;
 		sz = div_u64(sz, SZ_1K);
 	}
-- 
2.42.0

