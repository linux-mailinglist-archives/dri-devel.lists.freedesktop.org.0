Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4E87AAC17
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 10:12:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B32010E63E;
	Fri, 22 Sep 2023 08:12:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 355 seconds by postgrey-1.36 at gabe;
 Fri, 22 Sep 2023 01:31:47 UTC
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.219])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1EC1210E18D
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 01:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=KQLUY
 a3KKK3ZT24Fs/QQWKicsaIGPOdPCRwIWIKrD1s=; b=luycWt4Zg1BUPG+yqMYIe
 WfdPUppsH7JDy5y1wIqUg0z5/yC1zB5zfZl394OPmr8RPrvKJyewqc1BjXdl67D8
 2uMBZUu+G7wZ8AyDo/e+xZ1q01c9vK/dSU4GWTC8PUIsVnMs0pDuD8tY5RK1+Mph
 f9caR/XRExSlgt2epdqVoQ=
Received: from icess-ProLiant-DL380-Gen10.. (unknown [183.174.60.14])
 by zwqz-smtp-mta-g0-2 (Coremail) with SMTP id _____wB3fS5X7gxlowDGAw--.9931S4; 
 Fri, 22 Sep 2023 09:31:15 +0800 (CST)
From: Ma Ke <make_ruc2021@163.com>
To: alain.volmat@foss.st.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH] drm/sti: avoid potential dereference of error pointers
Date: Fri, 22 Sep 2023 09:31:01 +0800
Message-Id: <20230922013101.3603005-1-make_ruc2021@163.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wB3fS5X7gxlowDGAw--.9931S4
X-Coremail-Antispam: 1Uf129KBjvdXoWruFyUWw4rGr43ZFW7Jw13Arb_yoW3trg_G3
 WUXr1fKrWDKa1jqF4jyrn8JasY9rZ5XF48Xr1Iqas8ur4kAry8X347Wr1fWFyUWF18tFyq
 qa1xur90krn0kjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRNCzt7UUUUU==
X-Originating-IP: [183.174.60.14]
X-CM-SenderInfo: 5pdnvshuxfjiisr6il2tof0z/xtbBFQXyC2B9oNhq-QAAsb
X-Mailman-Approved-At: Fri, 22 Sep 2023 08:12:16 +0000
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

