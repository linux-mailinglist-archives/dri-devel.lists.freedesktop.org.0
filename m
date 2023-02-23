Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A686A28C1
	for <lists+dri-devel@lfdr.de>; Sat, 25 Feb 2023 11:10:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BF2610E11F;
	Sat, 25 Feb 2023 10:10:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 730 seconds by postgrey-1.36 at gabe;
 Thu, 23 Feb 2023 07:20:49 UTC
Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD23310EACB
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 07:20:49 +0000 (UTC)
X-QQ-mid: bizesmtp84t1677135853tqyp6rcl
Received: from localhost.localdomain ( [58.240.82.166])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 23 Feb 2023 15:04:08 +0800 (CST)
X-QQ-SSF: 01400000002000I0Z000B00A0000000
X-QQ-FEAT: QityeSR92A2+ZDiL078F7dx9NzgCrHZf3hKY4jiHovEDkRbY5wSRSIpUcYd8e
 h9RJvN2p4uegxhSrC89atZeSSkHIpJxRFNcob+iNie78BnTsRYPNiuMi+c4dp/icfL1mta+
 OLjXgubLx90fyWUCsjue/SswG+D64XrLaS76WE+S6Jn5lUtxHmttJpn96K8nXixdEmO00ho
 aTjE0eH49/u7DKqoaG/4R50ChZinchhQpdw3E/LqDPbQ3evXhNpZ8VpLurso/5C7nfjAfLy
 yUjPoWk0AFdY8vn0CY5ZT+yBG658tRHvn4sJR1gJMFRY2KuXVj54kDYmSP3gJmiOHIoVmCY
 1Cl4dQn1T4LYpqAoRRweLHH97+Vn/J+kyds27ANTNQhuziGk4zk4/1wXw46av2xTtB+QFAB
 R3FB0iOfFqs=
X-QQ-GoodBg: 2
From: Meng Tang <tangmeng@uniontech.com>
To: zackr@vmware.com, linux-graphics-maintainer@vmware.com, airlied@gmail.com,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/vmwgfx: Work around VMW_ALLOC_DMABUF
Date: Thu, 23 Feb 2023 15:04:05 +0800
Message-Id: <20230223070405.20228-1-tangmeng@uniontech.com>
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
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index bd02cb0e6837..115787697957 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -1263,6 +1263,10 @@ static long vmw_generic_ioctl(struct file *filp, unsigned int cmd,
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

