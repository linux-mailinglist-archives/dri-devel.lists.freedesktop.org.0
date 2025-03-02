Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4B6A4B50C
	for <lists+dri-devel@lfdr.de>; Sun,  2 Mar 2025 22:50:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3984410E061;
	Sun,  2 Mar 2025 21:50:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=seltendoof.de header.i=@seltendoof.de header.b="L00+6xuu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 452 seconds by postgrey-1.36 at gabe;
 Sun, 02 Mar 2025 16:14:49 UTC
Received: from server02.seltendoof.de (server02.seltendoof.de [168.119.48.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F4DC10E144
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Mar 2025 16:14:49 +0000 (UTC)
From: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgoettsche@seltendoof.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seltendoof.de;
 s=2023072701; t=1740931630;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m7tEjDSgKvohdvK6pTN+ndS8THOOnhPlPkLJOHpGmuo=;
 b=L00+6xuuwiWduCv+ixkmgNqzMue8FepzjU+fPTpLl3F5QZOO27bk7M9wmhhWU8jT4crfSL
 M/7o09GRptVOm+HsIO9YOzFhbaHCvz9w2ZOEuXxwGv+gKYE2NJQPPMme+A8tlGmNwEs9Hc
 zPxhTr1xrvSbV+1FwKr4ooR3KG+Nuqah7c8wXDMWW23rsD/wuGMhE+XSSuxU6acEaBKxjU
 SMoreM+GacqhtPwtqg8XONVAirj0PqdKl+b+IaRgbRc9E8o6K0amJ1WFuaGVHcfzBkbpnz
 CSZFhosDGBLKiF2l0uokkI6/gp4rmRVY4ARa7sYCKIATyzRBtNmg19WhoyltuQ==
To: 
Cc: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>,
 Serge Hallyn <serge@hallyn.com>, Jan Kara <jack@suse.com>,
 Julia Lawall <Julia.Lawall@inria.fr>,
 Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, cocci@inria.fr,
 Liviu Dudau <liviu.dudau@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 07/11] drm/panthor: reorder capability check last
Date: Sun,  2 Mar 2025 17:06:43 +0100
Message-ID: <20250302160657.127253-6-cgoettsche@seltendoof.de>
In-Reply-To: <20250302160657.127253-1-cgoettsche@seltendoof.de>
References: <20250302160657.127253-1-cgoettsche@seltendoof.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 02 Mar 2025 21:50:23 +0000
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
Reply-To: cgzones@googlemail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Christian Göttsche <cgzones@googlemail.com>

capable() calls refer to enabled LSMs whether to permit or deny the
request.  This is relevant in connection with SELinux, where a
capability check results in a policy decision and by default a denial
message on insufficient permission is issued.
It can lead to three undesired cases:
  1. A denial message is generated, even in case the operation was an
     unprivileged one and thus the syscall succeeded, creating noise.
  2. To avoid the noise from 1. the policy writer adds a rule to ignore
     those denial messages, hiding future syscalls, where the task
     performs an actual privileged operation, leading to hidden limited
     functionality of that task.
  3. To avoid the noise from 1. the policy writer adds a rule to permit
     the task the requested capability, while it does not need it,
     violating the principle of least privilege.

Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
Reviewed-by: Serge Hallyn <serge@hallyn.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
---
v2: split from previous patch with unrelated subsystem
---
 drivers/gpu/drm/panthor/panthor_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 08136e790ca0..76a10121f8a8 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -791,7 +791,7 @@ static int group_priority_permit(struct drm_file *file,
 		return 0;
 
 	/* Higher priorities require CAP_SYS_NICE or DRM_MASTER */
-	if (capable(CAP_SYS_NICE) || drm_is_current_master(file))
+	if (drm_is_current_master(file) || capable(CAP_SYS_NICE))
 		return 0;
 
 	return -EACCES;
-- 
2.47.2

