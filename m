Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F46A4DF0D
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 14:19:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67D0110E382;
	Tue,  4 Mar 2025 13:19:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DW/VXPNU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3AD010E5D5
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 13:19:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 49223A45482;
 Tue,  4 Mar 2025 13:14:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8058C4CEE5;
 Tue,  4 Mar 2025 13:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741094376;
 bh=D9U5wSLXcGoXFicNQjhFQpJvDTOL9WtTvIIjU/ZDEfk=;
 h=From:Date:Subject:To:Cc:From;
 b=DW/VXPNUpSwsAOd4EvyEBTE4zbF1xH6ykt0jsnAt8TNngYAFP82iF7TF0wT2vQVFt
 Gg2G1LJEwJgbBrG5AzEiC5h2V6UQs82q3mZ73c1ab/CJASOXtZUJjLt8zmJTDBbH4a
 nuOSe+pUrh3qmr9Gu4wvAXoJWSIQ6qxqeaRL54DKCeRgLeFlBNYtvNe0QtTMQs6Cdt
 aRKnw+ypEWn86Jv/DrRpq+dOsrAUU5FK2xcg/ifj8fG5dl2W1Z0cVyOq9QsT75y/PR
 SDs5bqaggjcuV3G3oNBctOzaAcosXlSEsI4kPU1MgUWVVVrVSe+8Qm7fT+XxDUwUMN
 24xSnBEBXJqsg==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 04 Mar 2025 14:19:21 +0100
Subject: [PATCH] drm/appletbdrm: Fix format specifier for size_t variables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-appletbdrm-fix-size_t-specifier-v1-1-94fe1d2c91f8@kernel.org>
X-B4-Tracking: v=1; b=H4sIANj9xmcC/x2NUQrCMBAFr1L224WYNJR6FRFpk1e7oDXsFhFL7
 97g58Aws5FBBUaXZiPFR0zeS4XzqaE0D8sDLLkyeeejC67loZQn1jHriyf5sskP95WtIMkkUM4
 hxbaL3oeup1opiur9D9fbvh91zE23cQAAAA==
X-Change-ID: 20250304-appletbdrm-fix-size_t-specifier-d3c547522379
To: Aun-Ali Zaidi <admin@kodeit.net>, Aditya Garg <gargaditya08@live.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Atharva Tiwari <evepolonium@gmail.com>, 
 Kerem Karabay <kekrby@gmail.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2653; i=nathan@kernel.org;
 h=from:subject:message-id; bh=D9U5wSLXcGoXFicNQjhFQpJvDTOL9WtTvIIjU/ZDEfk=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDOnH/j7TmSfmtTWD3Th3pu5Nz5fzg3dWFuhGf5mTF7gmR
 d9feZVuRykLgxgXg6yYIkv1Y9XjhoZzzjLeODUJZg4rE8gQBi5OAZjIT2OG/15pJ1YwOyyZeKiT
 /b5r8eqAB+ea/u2a/9cnUfvcpFwVAweG/2XuHfV8V6NmvPr2R25C3r5Tm3LnPNhyQObi1INvF+l
 M5+IHAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
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

When building for a 32-bit platform, there are some warnings (or errors
with CONFIG_WERROR=y) due to an incorrect specifier for 'size_t'
variables, which is typedef'd as 'unsigned int' for these architectures:

  drivers/gpu/drm/tiny/appletbdrm.c:171:17: error: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Werror,-Wformat]
    170 |                 drm_err(drm, "Actual size (%d) doesn't match expected size (%lu)\n",
        |                                                                             ~~~
        |                                                                             %zu
    171 |                         actual_size, size);
        |                                      ^~~~
  ...
  drivers/gpu/drm/tiny/appletbdrm.c:212:17: error: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Werror,-Wformat]
    211 |                 drm_err(drm, "Actual size (%d) doesn't match expected size (%lu)\n",
        |                                                                             ~~~
        |                                                                             %zu
    212 |                         actual_size, size);
        |                                      ^~~~

Use '%zu' as suggested, clearing up the warnings.

Fixes: 0670c2f56e45 ("drm/tiny: add driver for Apple Touch Bars in x86 Macs")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/tiny/appletbdrm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tiny/appletbdrm.c b/drivers/gpu/drm/tiny/appletbdrm.c
index f5d177e234e4..394c8f9bd41a 100644
--- a/drivers/gpu/drm/tiny/appletbdrm.c
+++ b/drivers/gpu/drm/tiny/appletbdrm.c
@@ -167,7 +167,7 @@ static int appletbdrm_send_request(struct appletbdrm_device *adev,
 	}
 
 	if (actual_size != size) {
-		drm_err(drm, "Actual size (%d) doesn't match expected size (%lu)\n",
+		drm_err(drm, "Actual size (%d) doesn't match expected size (%zu)\n",
 			actual_size, size);
 		return -EIO;
 	}
@@ -208,7 +208,7 @@ static int appletbdrm_read_response(struct appletbdrm_device *adev,
 	}
 
 	if (actual_size != size) {
-		drm_err(drm, "Actual size (%d) doesn't match expected size (%lu)\n",
+		drm_err(drm, "Actual size (%d) doesn't match expected size (%zu)\n",
 			actual_size, size);
 		return -EBADMSG;
 	}

---
base-commit: 95a5c9d197bb22a506913acb330a926d4e51aa95
change-id: 20250304-appletbdrm-fix-size_t-specifier-d3c547522379

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>

