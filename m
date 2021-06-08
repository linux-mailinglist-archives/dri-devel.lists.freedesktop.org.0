Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E21739FDFC
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 19:43:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFFF46EA8F;
	Tue,  8 Jun 2021 17:43:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from srv6.fidu.org (srv6.fidu.org [IPv6:2a01:4f8:231:de0::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38ED26E0CE;
 Tue,  8 Jun 2021 17:43:28 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id E4703C800E3;
 Tue,  8 Jun 2021 19:43:26 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10026)
 with LMTP id DB6ltjYKXzYp; Tue,  8 Jun 2021 19:43:26 +0200 (CEST)
Received: from wsembach-tuxedo.fritz.box
 (p200300E37f4F60006a44b0068bFE089d.dip0.t-ipconnect.de
 [IPv6:2003:e3:7f4f:6000:6a44:b006:8bfe:89d])
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPA id 515C1C800C8;
 Tue,  8 Jun 2021 19:43:26 +0200 (CEST)
From: Werner Sembach <wse@tuxedocomputers.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 1/7] drm/amd/display: Add missing cases
 convert_dc_color_depth_into_bpc
Date: Tue,  8 Jun 2021 19:43:14 +0200
Message-Id: <20210608174320.37429-2-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210608174320.37429-1-wse@tuxedocomputers.com>
References: <20210608174320.37429-1-wse@tuxedocomputers.com>
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
Cc: Werner Sembach <wse@tuxedocomputers.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

convert_dc_color_depth_into_bpc() that converts the enum dc_color_depth to an
integer had the casses for COLOR_DEPTH_999 and COLOR_DEPTH_111111 missing.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 652cc1a0e450..dbbccbed7b20 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6515,6 +6515,10 @@ static int convert_dc_color_depth_into_bpc (enum dc_color_depth display_color_de
 			return 14;
 		case COLOR_DEPTH_161616:
 			return 16;
+		case COLOR_DEPTH_999:
+			return 9;
+		case COLOR_DEPTH_111111:
+			return 11;
 		default:
 			break;
 		}
-- 
2.25.1

