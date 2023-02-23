Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4186A28CA
	for <lists+dri-devel@lfdr.de>; Sat, 25 Feb 2023 11:10:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6441310E497;
	Sat, 25 Feb 2023 10:10:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 485 seconds by postgrey-1.36 at gabe;
 Thu, 23 Feb 2023 07:15:22 UTC
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C85710EACB
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 07:15:21 +0000 (UTC)
X-QQ-mid: bizesmtp75t1677135567t3kjq54g
Received: from localhost.localdomain ( [58.240.82.166])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 23 Feb 2023 14:59:20 +0800 (CST)
X-QQ-SSF: 01400000002000I0Z000B00A0000000
X-QQ-FEAT: +ynUkgUhZJkR9eQJ/nI+SMX4brfSTlyTxBOx61PeeOB0U47PjI8FKsWbVuDlL
 vFlTnbMWRIjBsweExC4iGsfJC6eo+WGMhnRo8uI/EZm/OaE2sv9b9rI9dUnPzo7A8+vkwHL
 EmSsV6p2O/MfIr8ZA4loWwHSenXZs//hvHKf8s1rIqS5Qqbqvg+M+fZlmVX1VvlrYSJoIZJ
 h+a2O0okQXoMTdrBtH6WoYrvGtLKiURV+eFxgvGkzp9/6nmuiFQt92vyhP/H7ug+6PdMKKq
 nWlF9ITVcWVOVyOryddPaO+YfHYqWFw5OFYXgSsXyHzyg4lRSNJMvLnaCfJgkrkOlhh/X8A
 Aj3SodCETO0iEucjHFHISIKisidiAYGFZL9NNtyb9CeEyB125cR+yKOr1gALG8CHTrHcHqd
X-QQ-GoodBg: 2
From: Meng Tang <tangmeng@uniontech.com>
To: zackr@vmware.com, linux-graphics-maintainer@vmware.com, airlied@gmail.com,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/vmwgfx: Work around VMW_ALLOC_DMABUF
Date: Thu, 23 Feb 2023 14:59:18 +0800
Message-Id: <20230223065918.19644-1-tangmeng@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvr:qybglogicsvr7
X-Mailman-Approved-At: Sat, 25 Feb 2023 10:10:08 +0000
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
Cc: Meng Tang <tangmeng@uniontech.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A privilege escalation vulnerability was found in vmwgfx driver
in drivers/gpu/drm/vmwgfx/vmwgfx_drv.c in GPU component of Linux
kernel with device file '/dev/dri/renderD128 (or Dxxx)'. This flaw
allows a local attacker with a user account on the system to gain
privilege, causing a denial of service(DoS).

This vulnerability can be quickly verified by the following code
logic:
...
dri_fd = open("/dev/dri/renderD128", O_RDWR);
ret = ioctl(dri_fd, 0xC0186441, &arg);
if (ret == 0) {
	printf("[*] VMW_ALLOC_DMABUF Success!\n");
}
...

Submit this commit to fix it.

Signed-off-by: Meng Tang <tangmeng@uniontech.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index bd02cb0e6837..0166f98be9df 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -1244,6 +1244,7 @@ static long vmw_generic_ioctl(struct file *filp, unsigned int cmd,
 						 unsigned long))
 {
 	struct drm_file *file_priv = filp->private_data;
+
 	struct drm_device *dev = file_priv->minor->dev;
 	unsigned int nr = DRM_IOCTL_NR(cmd);
 	unsigned int flags;
@@ -1263,6 +1264,10 @@ static long vmw_generic_ioctl(struct file *filp, unsigned int cmd,
 			if (!drm_is_current_master(file_priv) &&
 			    !capable(CAP_SYS_ADMIN))
 				return -EACCES;
+		} else if (nr == DRM_COMMAND_BASE + DRM_VMW_ALLOC_DMABUF) {
+			if (!drm_is_current_master(file_priv) &&
+			    !capable(CAP_SYS_ADMIN))
+				return -EPERM;
 		}
 
 		if (unlikely(ioctl->cmd != cmd))
-- 
2.20.1

