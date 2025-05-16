Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F28DAB9785
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 10:27:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FFB510E9E5;
	Fri, 16 May 2025 08:26:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=uniontech.com header.i=@uniontech.com header.b="KKMfGHsI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 460 seconds by postgrey-1.36 at gabe;
 Fri, 16 May 2025 08:26:55 UTC
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.79.153])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B2AB10E2E0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 08:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
 s=onoh2408; t=1747384009;
 bh=S0PrBBNUmPF0/VUKoPDwa6DRC4/MgFY2Rud98UsTCS0=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=KKMfGHsIsgk/rjb95n9WguV6GVpSXKXtNeWPNrg0ofUdIFTkw4rpd8atmFfx9d+PY
 OR2ePRIS2pXcsfTzOnGAbAMoRMtYIVr2iHOlOljqzWINyVP22IKiQcNpY1vacisSDX
 4PBHcCut3HibsdWO37z3qcZUwJVJ8SHwOWQOIEGM=
X-QQ-mid: zesmtpip2t1747383497tebe5a470
X-QQ-Originating-IP: oVR+fB3ysdBKMb25LfrLr81tepBsowisO14Xq4W9Tmw=
Received: from localhost.localdomain ( [localhost])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Fri, 16 May 2025 16:18:15 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17368668951825700443
EX-QQ-RecipientCnt: 7
From: hongao <hongao@uniontech.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	hongao <hongao@uniontech.com>
Subject: [PATCH] drm: sysfs: Replace magic number with DRM_FORCE_UNSPECIFIED
 macro
Date: Fri, 16 May 2025 16:18:13 +0800
Message-Id: <20250516081813.3241129-1-hongao@uniontech.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: N7zE+17nr98TTN1EwvBSNgVkC6RU6vQSvd2XZkYMii8N3/zCjK200udh
 64OEifZmnKFOhZ811J3Jeoj3iH4z4ZeM0LWe8SqGlyl8Z/EOhcvrZujNQnrNHmV4odrZyQ0
 E1igbPARQPiZZXOCoyYekh6bbifc/OpCX0ecy6lD3vsdCvb8g3u2M8ntOco3CQboq/b+MYq
 Yd+xnQSDi0si6s0ya1OlMR4nx7SlSK2PHEQpc4E8HYnieYdJQPNKVyglcuH3CMhTs1Ajr9i
 tH6MhJG1ZNWuM0HpR2i4JP3YTnDDk35OkGEOCdNa6iT/2jzEy0G6Gkftdk6xOOHMCIMxZAr
 eO6rTpQq6KvPFjuciiTeHYFV2RKMe63Gpuwr0sSkqn0t6uJSv2Pkf8/y3xlShewahjgJLOs
 44ev7+NF+Qfk0kD+vqtTWSohtBvaDaw4mzjnlyWCI4lsoUSaAwrYRAYLJLxfTJl1V1xp4sl
 9KoiIObOzEKsfTpRgyoeS/ZNZRZK/Z49pIVu1/Kgof9+D1TDkh4M4AnrxcMWHr0cf4/t0dC
 pXWnnpNGs+SnZjpqGI+PjF7859oL2Sgq6FL9eMvT6XL/nmBJTKL8RG04S+5uctosMIAEhe+
 cjiL1XkT7C+7GrsIyjFt8eOB1/xy1Aem79pVkbFMlpwaHcLmx3X/47EZplir0CAIibGbtOy
 BFdR4hbVmKqdgQ70PA/sI4KVh9/86wtP60TYdJcOMYAsnvnKpkAxE/c8Fk6w0RSbTyjyi7l
 EUWKz1SQGSTqjX6cx1hcMl2ZSqRiyUossB34fdMBeLXLiiEG3dh8GNeTRJt9wUY16+gwCOv
 +DRpPVCCeOwWaUW/6ZMkDkNE2U9dRD9HuiG/ABNQEqS/9j/mLGs8+thpb4J+LLBUFszWiVP
 uLjj5PuqjSOqI8DtVa/rAK3GXC4S9wOCg4YVfAGKWpAeBHQhryxj3IzxQ83WHqNaEU/ugvR
 3Gm84/c3po8wJv6WS1H8p1Aui/2xHjOWnvkAST2Md3VpjL91k9gkm6P0UZeVgtjnbWZK9wF
 T7IotuQpE5dVJZhjzo
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0
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

Replace the direct use of magic number '0' with the DRM_FORCE_UNSPECIFIED
macro to improve code readability.

Signed-off-by: hongao <hongao@uniontech.com>

diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
index 60c1f26edb6f..e9e67ef0904d 100644
--- a/drivers/gpu/drm/drm_sysfs.c
+++ b/drivers/gpu/drm/drm_sysfs.c
@@ -198,7 +198,7 @@ static ssize_t status_store(struct device *device,
 	old_force = connector->force;
 
 	if (sysfs_streq(buf, "detect"))
-		connector->force = 0;
+		connector->force = DRM_FORCE_UNSPECIFIED;
 	else if (sysfs_streq(buf, "on"))
 		connector->force = DRM_FORCE_ON;
 	else if (sysfs_streq(buf, "on-digital"))
-- 
2.33.1

