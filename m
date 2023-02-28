Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0CB6A53F1
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 08:55:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B85E10E49B;
	Tue, 28 Feb 2023 07:55:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D49F88D18;
 Tue, 28 Feb 2023 05:11:41 +0000 (UTC)
X-QQ-mid: bizesmtp65t1677561081t0n6rofl
Received: from localhost.localdomain ( [58.240.82.166])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 28 Feb 2023 13:11:13 +0800 (CST)
X-QQ-SSF: 0040000000200080C000B00A0000000
X-QQ-FEAT: 7jw2iSiCazq7s/yFLHQYjjIiI+JaTbroy9lUTJtc5mR9gxqGwT8n1jK2q3jX+
 i+SeNDSJiEbv62nThphTbQKInjdDWitDUzvgWSa+6dCZmAThIvzbmEqt8KHdvSlMrecxi9a
 5Vw0V2FDAJCsNMzVKJjwNkKO5mwpqc4d9yBJWZixMptbZSRLSvs90QuCE7BuealyuS6T96W
 w0gxiB1zbN6kUte7Fdu2rz4PMcCZvDiDDjhIeOpdmmfCQqboJtLk6qmX65mKGvfSqaMGFXS
 J8l6Ube20624dbdD8uEGb5uksatgQkUI2CUX/MIN8bPLaQ3ZUyUSSAGZFHrAP8GT+dEStaU
 nliANT2u3AfLA2Pfd0n/QvZ4Rj8o40aJY0SXzwa0RN+kpwQjqUZeGSfIgZzcFuIXs70rgUu
 7Af9HJheuhtAu+mfNFJNHlN0KZM0E+j/
X-QQ-GoodBg: 2
From: Yuanzhi Wang <wangyuanzhi@uniontech.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, mario.limonciello@amd.com,
 Bokun.Zhang@amd.com, tzimmermann@suse.de, hdegoede@redhat.com,
 jingyuwang_vip@163.com, rafael.j.wysocki@intel.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] amdgpu: add a filter condition when set brightness
Date: Tue, 28 Feb 2023 13:11:07 +0800
Message-Id: <20230228051107.32037-1-wangyuanzhi@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvr:qybglogicsvr2
X-Mailman-Approved-At: Tue, 28 Feb 2023 07:55:12 +0000
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
Cc: Yuanzhi Wang <wangyuanzhi@uniontech.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is a lenovo ThinkBook 14 G3 ACL notebook, when
the laptop is plugged into AC power supply, the
brightness obtained ACPI may be smaller than current
brightness.As a result the screen becomes dark，this is
not what people want. So we should add So we should
filter out very small brightness values obtained from ACPI

Signed-off-by: Yuanzhi Wang <wangyuanzhi@uniontech.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
index d4196fcb85a0..20e7a178765d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
@@ -406,6 +406,7 @@ static int amdgpu_atif_handler(struct amdgpu_device *adev,
 {
 	struct amdgpu_atif *atif = &amdgpu_acpi_priv.atif;
 	int count;
+	int old_brightness;
 
 	DRM_DEBUG_DRIVER("event, device_class = %s, type = %#x\n",
 			event->device_class, event->type);
@@ -443,7 +444,14 @@ static int amdgpu_atif_handler(struct amdgpu_device *adev,
 				 * hardwired to post BACKLIGHT_UPDATE_SYSFS.
 				 * It probably should accept 'reason' parameter.
 				 */
-				backlight_device_set_brightness(atif->bd, req.backlight_level);
+				old_brightness = backlight_get_brightness(atif->bd);
+				if (old_brightness > req.backlight_level)
+					DRM_WARN(
+						"Old brightness %d is larger than ACPI brightness %d\n",
+						 old_brightness, req.backlight_level);
+				else
+					backlight_device_set_brightness(atif->bd,
+						 req.backlight_level);
 			}
 		}
 
-- 
2.20.1

