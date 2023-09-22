Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB8A7AAC16
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 10:12:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4279410E631;
	Fri, 22 Sep 2023 08:12:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.219])
 by gabe.freedesktop.org (Postfix) with ESMTP id AD85A10E192
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 01:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=FLR5V
 SYqhjZdAddiOMBK6+vIndH7dJAeROYe1W7Jiyk=; b=mj327/rSd056IG8uKrsAr
 PD62SZ/MEJHgtpbHLQY/NUk2ewOMdIeFRRgSrZbjhB2R/3asyjAvuCs8SPORHz75
 vAgF9jJhS2ogiKj1ozqBv6xbRGKClx/g47kUVPC6HJGkDv7h0InQr6gZiTl7q/+d
 8nqS4zqzAN2WEFOY0fMFtU=
Received: from icess-ProLiant-DL380-Gen10.. (unknown [183.174.60.14])
 by zwqz-smtp-mta-g0-1 (Coremail) with SMTP id _____wBH6SQF7Qxlm6O9Aw--.10024S4;
 Fri, 22 Sep 2023 09:25:37 +0800 (CST)
From: Ma Ke <make_ruc2021@163.com>
To: alain.volmat@foss.st.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH] drm/gem: avoid potential dereference of error pointers
Date: Fri, 22 Sep 2023 09:25:23 +0800
Message-Id: <20230922012523.3602764-1-make_ruc2021@163.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBH6SQF7Qxlm6O9Aw--.10024S4
X-Coremail-Antispam: 1Uf129KBjvdXoWruFyUWw4rGr47XrWrtFy8Grg_yoW3trc_Wa
 1UXrnxCry7G3WjvF1jyws8AasYkrZYgF48X3W8tay3Ar40vry8X3y2gF1rGF1UWF4jqFyD
 ta1xC34YqF9akjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRM5l8UUUUUU==
X-Originating-IP: [183.174.60.14]
X-CM-SenderInfo: 5pdnvshuxfjiisr6il2tof0z/xtbBFRnyC2B9oNhVuwAAs+
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
 drivers/gpu/drm/sti/sti_gdp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/sti/sti_gdp.c b/drivers/gpu/drm/sti/sti_gdp.c
index 43c72c2604a0..054ce8455478 100644
--- a/drivers/gpu/drm/sti/sti_gdp.c
+++ b/drivers/gpu/drm/sti/sti_gdp.c
@@ -638,6 +638,8 @@ static int sti_gdp_atomic_check(struct drm_plane *drm_plane,
 
 	mixer = to_sti_mixer(crtc);
 	crtc_state = drm_atomic_get_crtc_state(state, crtc);
+	if (IS_ERR(crtc_state))
+		return PTR_ERR(crtc_state);
 	mode = &crtc_state->mode;
 	dst_x = new_plane_state->crtc_x;
 	dst_y = new_plane_state->crtc_y;
-- 
2.37.2

