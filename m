Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDB81A5429
	for <lists+dri-devel@lfdr.de>; Sun, 12 Apr 2020 01:04:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E33216E1F5;
	Sat, 11 Apr 2020 23:04:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3A3D6E1F5;
 Sat, 11 Apr 2020 23:04:35 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CEE7821841;
 Sat, 11 Apr 2020 23:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586646275;
 bh=Mvjhobz+DXzJktaggh18G1wXgXOKTa61f7XmrSc+Y7M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DNQPttzUC5BsWD7nImNlzHRnT7vG1fH3tDYXfUjRMpVVTCWMDKEGi1BSnKotG8bCs
 6vJSo0f8zAeNcDd67yGnnXnMkrbrrJwIQ8/2O/wCWHob6fOFuqEgcg43ibD+0tkdfs
 lSq9wPiglQU6jzoC4UqAki4Y3Wtde0nVoBgo8Aik=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.6 039/149] drm/amd/display: Fix default logger mask
 definition
Date: Sat, 11 Apr 2020 19:01:56 -0400
Message-Id: <20200411230347.22371-39-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200411230347.22371-1-sashal@kernel.org>
References: <20200411230347.22371-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Eric Bernstein <eric.bernstein@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Eric Bernstein <eric.bernstein@amd.com>

[ Upstream commit ccb6af1e25830e5601b6beacc698390f0245316f ]

[Why]
Logger mask was updated to uint64_t, however default mask definition was
not updated for unsigned long long

[How]
Update DC_DEFAULT_LOG_MASK to support uint64_t type

Signed-off-by: Eric Bernstein <eric.bernstein@amd.com>
Reviewed-by: Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>
Acked-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../drm/amd/display/include/logger_types.h    | 63 ++++++++++---------
 1 file changed, 32 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/include/logger_types.h b/drivers/gpu/drm/amd/display/include/logger_types.h
index 89a7092670193..d66f9d8eefb49 100644
--- a/drivers/gpu/drm/amd/display/include/logger_types.h
+++ b/drivers/gpu/drm/amd/display/include/logger_types.h
@@ -124,36 +124,37 @@ enum dc_log_type {
 #define DC_MIN_LOG_MASK ((1 << LOG_ERROR) | \
 		(1 << LOG_DETECTION_EDID_PARSER))
 
-#define DC_DEFAULT_LOG_MASK ((1 << LOG_ERROR) | \
-		(1 << LOG_WARNING) | \
-		(1 << LOG_EVENT_MODE_SET) | \
-		(1 << LOG_EVENT_DETECTION) | \
-		(1 << LOG_EVENT_LINK_TRAINING) | \
-		(1 << LOG_EVENT_LINK_LOSS) | \
-		(1 << LOG_EVENT_UNDERFLOW) | \
-		(1 << LOG_RESOURCE) | \
-		(1 << LOG_FEATURE_OVERRIDE) | \
-		(1 << LOG_DETECTION_EDID_PARSER) | \
-		(1 << LOG_DC) | \
-		(1 << LOG_HW_HOTPLUG) | \
-		(1 << LOG_HW_SET_MODE) | \
-		(1 << LOG_HW_RESUME_S3) | \
-		(1 << LOG_HW_HPD_IRQ) | \
-		(1 << LOG_SYNC) | \
-		(1 << LOG_BANDWIDTH_VALIDATION) | \
-		(1 << LOG_MST) | \
-		(1 << LOG_DETECTION_DP_CAPS) | \
-		(1 << LOG_BACKLIGHT)) | \
-		(1 << LOG_I2C_AUX) | \
-		(1 << LOG_IF_TRACE) | \
-		(1 << LOG_DTN) /* | \
-		(1 << LOG_DEBUG) | \
-		(1 << LOG_BIOS) | \
-		(1 << LOG_SURFACE) | \
-		(1 << LOG_SCALER) | \
-		(1 << LOG_DML) | \
-		(1 << LOG_HW_LINK_TRAINING) | \
-		(1 << LOG_HW_AUDIO)| \
-		(1 << LOG_BANDWIDTH_CALCS)*/
+#define DC_DEFAULT_LOG_MASK ((1ULL << LOG_ERROR) | \
+		(1ULL << LOG_WARNING) | \
+		(1ULL << LOG_EVENT_MODE_SET) | \
+		(1ULL << LOG_EVENT_DETECTION) | \
+		(1ULL << LOG_EVENT_LINK_TRAINING) | \
+		(1ULL << LOG_EVENT_LINK_LOSS) | \
+		(1ULL << LOG_EVENT_UNDERFLOW) | \
+		(1ULL << LOG_RESOURCE) | \
+		(1ULL << LOG_FEATURE_OVERRIDE) | \
+		(1ULL << LOG_DETECTION_EDID_PARSER) | \
+		(1ULL << LOG_DC) | \
+		(1ULL << LOG_HW_HOTPLUG) | \
+		(1ULL << LOG_HW_SET_MODE) | \
+		(1ULL << LOG_HW_RESUME_S3) | \
+		(1ULL << LOG_HW_HPD_IRQ) | \
+		(1ULL << LOG_SYNC) | \
+		(1ULL << LOG_BANDWIDTH_VALIDATION) | \
+		(1ULL << LOG_MST) | \
+		(1ULL << LOG_DETECTION_DP_CAPS) | \
+		(1ULL << LOG_BACKLIGHT)) | \
+		(1ULL << LOG_I2C_AUX) | \
+		(1ULL << LOG_IF_TRACE) | \
+		(1ULL << LOG_HDMI_FRL) | \
+		(1ULL << LOG_DTN) /* | \
+		(1ULL << LOG_DEBUG) | \
+		(1ULL << LOG_BIOS) | \
+		(1ULL << LOG_SURFACE) | \
+		(1ULL << LOG_SCALER) | \
+		(1ULL << LOG_DML) | \
+		(1ULL << LOG_HW_LINK_TRAINING) | \
+		(1ULL << LOG_HW_AUDIO)| \
+		(1ULL << LOG_BANDWIDTH_CALCS)*/
 
 #endif /* __DAL_LOGGER_TYPES_H__ */
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
