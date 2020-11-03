Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B932A59DC
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 23:15:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 582FC6E904;
	Tue,  3 Nov 2020 22:15:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E1CD6E904
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 22:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604441725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=SXIMwG+24v0kPGbcpgSikfVX/4K8JgtSXH6lhtDLzEo=;
 b=VpWUt+9pjvA88nFEUqeyCF9yjZrgWqazWcIk/CBjBTXKHG4rLjwCDs5v1c8D19aWSSAhn7
 1QAB50G4z+SYI2VG5Os4BzGzwmdYrzp65AE3L9v81ydFTEkPzYYByFGJ8gcU2T605Epc6Z
 7JQYKgShRrgnmUgAsKUPP+1NlXovYkE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-UmyNEj-5PHqDzrZS2RN4Wg-1; Tue, 03 Nov 2020 17:15:22 -0500
X-MC-Unique: UmyNEj-5PHqDzrZS2RN4Wg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A11A7803F46;
 Tue,  3 Nov 2020 22:15:19 +0000 (UTC)
Received: from Whitewolf.lyude.net (ovpn-119-236.rdu2.redhat.com
 [10.10.119.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E505960BF1;
 Tue,  3 Nov 2020 22:15:14 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/edid: Fix uninitialized variable in drm_cvt_modes()
Date: Tue,  3 Nov 2020 17:15:10 -0500
Message-Id: <20201103221510.575827-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: Leon Romanovsky <leon@kernel.org>, David Airlie <airlied@linux.ie>,
 Chao Yu <chao@kernel.org>, open list <linux-kernel@vger.kernel.org>,
 Kalle Valo <kvalo@codeaurora.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 stable@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Noticed this when trying to compile with -Wall on a kernel fork. We potentially
don't set width here, which causes the compiler to complain about width
potentially being uninitialized in drm_cvt_modes(). So, let's fix that.

Changes since v1:
* Don't emit an error as this code isn't reachable, just mark it as such

Signed-off-by: Lyude Paul <lyude@redhat.com>

Cc: <stable@vger.kernel.org> # v5.9+
Fixes: 3f649ab728cd ("treewide: Remove uninitialized_var() usage")
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/drm_edid.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 631125b46e04..0643b98c6383 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -3094,6 +3094,7 @@ static int drm_cvt_modes(struct drm_connector *connector,
 
 	for (i = 0; i < 4; i++) {
 		int width, height;
+		u8 cvt_aspect_ratio;
 
 		cvt = &(timing->data.other_data.data.cvt[i]);
 
@@ -3101,7 +3102,8 @@ static int drm_cvt_modes(struct drm_connector *connector,
 			continue;
 
 		height = (cvt->code[0] + ((cvt->code[1] & 0xf0) << 4) + 1) * 2;
-		switch (cvt->code[1] & 0x0c) {
+		cvt_aspect_ratio = cvt->code[1] & 0x0c;
+		switch (cvt_aspect_ratio) {
 		case 0x00:
 			width = height * 4 / 3;
 			break;
@@ -3114,6 +3116,8 @@ static int drm_cvt_modes(struct drm_connector *connector,
 		case 0x0c:
 			width = height * 15 / 9;
 			break;
+		default:
+			unreachable();
 		}
 
 		for (j = 1; j < 5; j++) {
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
