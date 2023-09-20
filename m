Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D6C7A7525
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 10:01:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EB7D10E163;
	Wed, 20 Sep 2023 08:01:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 922 seconds by postgrey-1.36 at gabe;
 Wed, 20 Sep 2023 03:37:42 UTC
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.196])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1984110E424
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 03:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=KQLUY
 a3KKK3ZT24Fs/QQWKicsaIGPOdPCRwIWIKrD1s=; b=T1ufyU42gJYnYJshDrzsl
 o47D4KyptcT4WfcGzE/IdE/KGCCTOY+37mdOSBMk4jDC7r+VfU+jlJQ3YOVSWjIy
 UgBU9yX+qKp7YF9xym4Gf1nSmE5zyGlpSEZSMGAeW1MLBAFumXkJhmj/99KXiD5n
 FfQqqMa/1czgf0fT3+efmQ=
Received: from icess-ProLiant-DL380-Gen10.. (unknown [183.174.60.14])
 by zwqz-smtp-mta-g5-1 (Coremail) with SMTP id _____wCnKEdYZQplhLhFCg--.4484S4; 
 Wed, 20 Sep 2023 11:22:07 +0800 (CST)
From: Ma Ke <make_ruc2021@163.com>
To: alain.volmat@foss.st.com,
	airlied@gmail.com
Subject: [PATCH] drm/sti: avoid potential dereference of error pointers
Date: Wed, 20 Sep 2023 11:21:59 +0800
Message-Id: <20230920032159.3542372-1-make_ruc2021@163.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCnKEdYZQplhLhFCg--.4484S4
X-Coremail-Antispam: 1Uf129KBjvdXoWruFyUWw4rGr43ZFW7Jw13Arb_yoW3trg_G3
 WUXr1fKrWDKa1jqF4jyrn8JasY9rZ5XF48Xr1Iqas8ur4kAry8X347Wr1fWFyUWF18tFyq
 qa1xur90krn0kjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRMeHqJUUUUU==
X-Originating-IP: [183.174.60.14]
X-CM-SenderInfo: 5pdnvshuxfjiisr6il2tof0z/1tbivgDwC1ZciymIqgAAsP
X-Mailman-Approved-At: Wed, 20 Sep 2023 08:01:17 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ma Ke <make_ruc2021@163.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The return value of drm_atomic_get_crtc_state() needs to be
checked. To avoid use of error pointer 'crtc_state' in case
of the failure.

Signed-off-by: Ma Ke <make_ruc2021@163.com>
---
 drivers/gpu/drm/sti/sti_cursor.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/sti/sti_cursor.c b/drivers/gpu/drm/sti/sti_cursor.c
index db0a1eb53532..e460f5ba2d87 100644
--- a/drivers/gpu/drm/sti/sti_cursor.c
+++ b/drivers/gpu/drm/sti/sti_cursor.c
@@ -200,6 +200,8 @@ static int sti_cursor_atomic_check(struct drm_plane *drm_plane,
 		return 0;
 
 	crtc_state = drm_atomic_get_crtc_state(state, crtc);
+	if (IS_ERR(crtc_state))
+		return PTR_ERR(crtc_state);
 	mode = &crtc_state->mode;
 	dst_x = new_plane_state->crtc_x;
 	dst_y = new_plane_state->crtc_y;
-- 
2.37.2

