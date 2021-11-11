Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FFD44D2B3
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 08:50:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C3266EA28;
	Thu, 11 Nov 2021 07:50:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 429 seconds by postgrey-1.36 at gabe;
 Thu, 11 Nov 2021 03:40:32 UTC
Received: from qq.com (smtpbg465.qq.com [59.36.132.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CD3D6E85C;
 Thu, 11 Nov 2021 03:40:31 +0000 (UTC)
X-QQ-mid: bizesmtp54t1636601555t45jsico
Received: from localhost.localdomain (unknown [113.57.152.160])
 by esmtp6.qq.com (ESMTP) with 
 id ; Thu, 11 Nov 2021 11:32:28 +0800 (CST)
X-QQ-SSF: 01400000002000B0E000B00B0000000
X-QQ-FEAT: 0Eq+cbWb7RxGihMVh/8acEZ0o4ZW2aFncchquYndHLD9hp+YJ3afPEWy1mqcW
 4YflMIpR0C2NGQ30aoXyAn8jPofjp8EJ9tmYl6nwy7UauNbg7WvcwIud6AXaPW4J5q2rwk6
 v5h9I4qrwn7CW35o9iP2vzXRwfWqmlTtepHUnvmHg3HEyecCR0o8/ZSV07zUzvv++ho1EeE
 0N7g3UcnWJhy4czFUSqMTszRqhusbDyk5DVU7Y9bDF7MaKXTGEAMaR1jzHtnPBxHn0K1Koe
 3ZIDs/s7c8SCtGokzxmgGjktihcx5mHLdhRceq5Z3u+IRqDscx/AkZFZMsGhg4j5Y7S8UwG
 DV57HBt1vXDPlqcQxolsJDZ3gqbzw==
X-QQ-GoodBg: 2
From: hongao <hongao@uniontech.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/amdgpu: fix set scaling mode Full/Full aspect/Center not
 works on vga and dvi connectors
Date: Thu, 11 Nov 2021 11:32:07 +0800
Message-Id: <20211111033207.28565-1-hongao@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign1
X-QQ-Bgrelay: 1
X-Mailman-Approved-At: Thu, 11 Nov 2021 07:50:31 +0000
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
Cc: hongao <hongao@uniontech.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

amdgpu_connector_vga_get_modes missed function amdgpu_get_native_mode
which assign amdgpu_encoder->native_mode with *preferred_mode result in
amdgpu_encoder->native_mode.clock always be 0. That will cause
amdgpu_connector_set_property returned early on:
if ((rmx_type != DRM_MODE_SCALE_NONE) &&
	(amdgpu_encoder->native_mode.clock == 0))
when we try to set scaling mode Full/Full aspect/Center.
Add the missing function to amdgpu_connector_vga_get_mode can fix this.
It also works on dvi connectors because
amdgpu_connector_dvi_helper_funcs.get_mode use the same method.

Signed-off-by: hongao <hongao@uniontech.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
index b9c11c2b2885..0de66f59adb8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
@@ -827,6 +827,7 @@ static int amdgpu_connector_vga_get_modes(struct drm_connector *connector)
 
 	amdgpu_connector_get_edid(connector);
 	ret = amdgpu_connector_ddc_get_modes(connector);
+	amdgpu_get_native_mode(connector);
 
 	return ret;
 }
-- 
2.20.1



