Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FC37A112E
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 00:39:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65D6F10E5AD;
	Thu, 14 Sep 2023 22:39:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAE9C10E59C;
 Thu, 14 Sep 2023 22:39:39 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a02:8010:65b5:0:1ac0:4dff:feee:236a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 4F8406607356;
 Thu, 14 Sep 2023 23:39:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694731178;
 bh=o/iAnyoRLcVir53WqRf/gPFuGD/IX2JK6SO8vfDKfz0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=i2va4uwsWHN9fBDL6qqNuj/kVsL2ikwCM6q5Lr9UruIrghN9Dt/0Kzi0VWXE+Kzp5
 RifYuBnRSONBHEjiU6YLR+SVptssqyOBjeS9e5Tm2hLIVAOtHMM+3PWtQ7LY7Ot5Qg
 vN674UVRBrbbGqPX25s9I2q3opABis+IEdKSsurmqxGACR0sjvUFDZMIhyjZAk/1we
 HM43AC40Hnpjw7V43rZS7DDFqgJAK2xLGQ8qCC9AD8oJCH/2J3IGTurrBrLIvnNBG8
 G3w3dyhuCT0CgJBAy7vRqx6danx3WfK8jNSk74oW8Wt2UkTAXhwWVZ5KfQUmvbeQyD
 ZJrprymAfvRfg==
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, robh@kernel.org, steven.price@arm.com
Subject: [PATCH v5 6/6] drm/drm-file: Show finer-grained BO sizes in
 drm_show_memory_stats
Date: Thu, 14 Sep 2023 23:38:44 +0100
Message-ID: <20230914223928.2374933-7-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230914223928.2374933-1-adrian.larumbe@collabora.com>
References: <20230914223928.2374933-1-adrian.larumbe@collabora.com>
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
 healych@amazon.com, kernel@collabora.com, freedreno@lists.freedesktop.org
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

