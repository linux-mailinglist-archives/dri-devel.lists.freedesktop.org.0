Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D857D96BA
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 13:33:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3E4310E979;
	Fri, 27 Oct 2023 11:33:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 911 seconds by postgrey-1.36 at gabe;
 Fri, 27 Oct 2023 09:39:52 UTC
Received: from s01.bc.feishu.cn (s01.bc.feishu.cn [103.149.242.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 798B010E968
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 09:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=dingdao-com.20200927.dkim.feishu.cn; t=1698398370;
 h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=TV5y0friYH6HbXqokPo9rMztc3feSByAfx6Q6GDDtx0=;
 b=t8dCWO16iW+U4zgIxZbRsNc/FJKvjfXlglhcPPOsNMmWwH1gt92vhnMrmx34M/dG+/aQkc
 24UXLNZrFCAkNDYN8HztMQNONHPwsqrakm7Iw7tKi5bqM8fctfNFreexE/RkiBoMVNmsSJ
 2byTCFfaqiuttwn5j2bUE3o4L22Pf/1sFRwswyizetMu7/7Gjqnqb06jpk4JakaBXMzAVu
 e546m8lmJHJ225+JJTuQXX2UOvEo72wzLP0x2NmZfOOVfvhl1vEgHYjKWSEN4Sndo0B4yn
 upf0PdrYPmJtVg9BWYGJbRf+bZdha888lY/bbdSiXqj5z9yiE6x5Ok4YjZXCpg==
Message-Id: <20231027091912.1244107-1-penghao@dingdao.com>
Content-Transfer-Encoding: 7bit
From: "Peng Hao" <penghao@dingdao.com>
X-Lms-Return-Path: <lba+2653b80a1+7802ad+lists.freedesktop.org+penghao@dingdao.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>, 
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>
Subject: [PATCH] gpu/drm/drm_framebuffer.c: Add judgement for return value of
 drm_get_format_info().
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.1
X-Original-From: Peng Hao <penghao@dingdao.com>
Date: Fri, 27 Oct 2023 17:19:12 +0800
Content-Type: text/plain; charset=UTF-8
X-Mailman-Approved-At: Fri, 27 Oct 2023 11:33:40 +0000
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
Cc: penghao@dingdao.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since drm_get_format_info() may return NULL, so a judgement of return
value is needed to add.

Signed-off-by: Peng Hao <penghao@dingdao.com>
---
 drivers/gpu/drm/drm_framebuffer.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
index aff3746dedfb..be7dd1998c04 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -194,6 +194,10 @@ static int framebuffer_check(struct drm_device *dev,
 
 	/* now let the driver pick its own format info */
 	info = drm_get_format_info(dev, r);
+	if (!info) {
+		drm_dbg_kms(dev, "no matched format info\n");
+		return -EFAULT;
+	}
 
 	for (i = 0; i < info->num_planes; i++) {
 		unsigned int width = fb_plane_width(r->width, info, i);
-- 
2.37.1
