Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 072AF47642A
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 22:04:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B399C10E964;
	Wed, 15 Dec 2021 21:04:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp10.smtpout.orange.fr
 [80.12.242.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 708E010E964
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 21:04:26 +0000 (UTC)
Received: from pop-os.home ([86.243.171.122]) by smtp.orange.fr with ESMTPA
 id xbRmmUOmyw2XxxbRmmRN4I; Wed, 15 Dec 2021 22:04:23 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Wed, 15 Dec 2021 22:04:23 +0100
X-ME-IP: 86.243.171.122
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: tomba@kernel.org,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drm/omapdrm: Remove a useless bitmap_clear() call
Date: Wed, 15 Dec 2021 22:04:20 +0100
Message-Id: <df026c2dfeb096dbf551025bae2a4da395dad38e.1639602203.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The 'tcm->bitmap' is kzalloc'ed just a few lines above, at the same time as
'tcm'. There is no need to initialize it another time here.

Remove the useless bitmap_clear() call.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/omapdrm/tcm-sita.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/omapdrm/tcm-sita.c b/drivers/gpu/drm/omapdrm/tcm-sita.c
index fde0208ec01e..e2c7340c5ac4 100644
--- a/drivers/gpu/drm/omapdrm/tcm-sita.c
+++ b/drivers/gpu/drm/omapdrm/tcm-sita.c
@@ -239,7 +239,6 @@ struct tcm *sita_init(u16 width, u16 height)
 
 	spin_lock_init(&tcm->lock);
 	tcm->bitmap = (unsigned long *)(tcm + 1);
-	bitmap_clear(tcm->bitmap, 0, width*height);
 
 	tcm->map_size = width*height;
 
-- 
2.30.2

