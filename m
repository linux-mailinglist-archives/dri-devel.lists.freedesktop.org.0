Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA942B8D7E
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 09:34:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E45E26E581;
	Thu, 19 Nov 2020 08:34:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m17618.mail.qiye.163.com (m17618.mail.qiye.163.com
 [59.111.176.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B9F46E3F7
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 11:40:29 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [157.0.31.125])
 by m17618.mail.qiye.163.com (Hmail) with ESMTPA id 4AB874E237B;
 Wed, 18 Nov 2020 19:40:27 +0800 (CST)
From: Bernard Zhao <bernard@vivo.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Bernard Zhao <bernard@vivo.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/via: fix assignment in if condition
Date: Wed, 18 Nov 2020 03:40:19 -0800
Message-Id: <20201118114021.105502-1-bernard@vivo.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZHkpOHxpIShoZGUNCVkpNS05NQkJNSUxPSk9VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PAw6Lww*GT8eIw4KEUwuME9L
 EToKCUJVSlVKTUtOTUJCTUlMTEJPVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlKTkxV
 S1VISlVKSU5ZV1kIAVlBSUhKSDcG
X-HM-Tid: 0a75db27e9779376kuws4ab874e237b
X-Mailman-Approved-At: Thu, 19 Nov 2020 08:31:38 +0000
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
Cc: opensource.kernel@vivo.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix check_patch.pl warning:
ERROR: do not use assignment in if condition
+                       if ((HALCYON_HEADER2 == (cmd = *buf)) &&

ERROR: do not use assignment in if condition
+                       if (HALCYON_HEADER2 == (cmd = *buf))

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/via/via_verifier.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/via/via_verifier.c b/drivers/gpu/drm/via/via_verifier.c
index 8d8135f424ef..3d6e3a70f318 100644
--- a/drivers/gpu/drm/via/via_verifier.c
+++ b/drivers/gpu/drm/via/via_verifier.c
@@ -1001,8 +1001,8 @@ via_verify_command_stream(const uint32_t * buf, unsigned int size,
 			state = via_check_vheader6(&buf, buf_end);
 			break;
 		case state_command:
-			if ((HALCYON_HEADER2 == (cmd = *buf)) &&
-			    supported_3d)
+			cmd = *buf;
+			if ((cmd == HALCYON_HEADER2) && supported_3d)
 				state = state_header2;
 			else if ((cmd & HALCYON_HEADER1MASK) == HALCYON_HEADER1)
 				state = state_header1;
@@ -1064,7 +1064,8 @@ via_parse_command_stream(struct drm_device *dev, const uint32_t *buf,
 			state = via_parse_vheader6(dev_priv, &buf, buf_end);
 			break;
 		case state_command:
-			if (HALCYON_HEADER2 == (cmd = *buf))
+			cmd = *buf;
+			if (cmd == HALCYON_HEADER2)
 				state = state_header2;
 			else if ((cmd & HALCYON_HEADER1MASK) == HALCYON_HEADER1)
 				state = state_header1;
-- 
2.29.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
