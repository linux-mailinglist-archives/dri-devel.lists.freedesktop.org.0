Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFCD29632A
	for <lists+dri-devel@lfdr.de>; Thu, 22 Oct 2020 18:55:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71FDE6F5F6;
	Thu, 22 Oct 2020 16:55:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8689A6F5F6
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Oct 2020 16:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603385699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=RfHt33Q6QNtNcq19XL3ZUvkrRWcWtQabIE1/VWN80vo=;
 b=Weiamt+FMbVp/xABWDqN4o7eFWZSfk18zf9I/266aOgqwdT9dXEMK5X3qfpe8qn7fJpu62
 xCzNwm1IIizgsSKYBLCE3udAT8TF80oNB/DY5CTxuLBgUjMUAUVBExqQMGiYaLJqxwSzv+
 wpK1GjgcMTjUSHgT/WsBKKTFoRkThXQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-zpMY86BrN9W1ovi7Ol_--w-1; Thu, 22 Oct 2020 12:54:56 -0400
X-MC-Unique: zpMY86BrN9W1ovi7Ol_--w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64D15804B69;
 Thu, 22 Oct 2020 16:54:54 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-114-121.rdu2.redhat.com
 [10.10.114.121])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 83FF35B4BA;
 Thu, 22 Oct 2020 16:54:52 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/edid: Fix uninitialized variable in drm_cvt_modes()
Date: Thu, 22 Oct 2020 12:54:50 -0400
Message-Id: <20201022165450.682571-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
 Jason Gunthorpe <jgg@ziepe.ca>, stable@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Kalle Valo <kvalo@codeaurora.org>,
 Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Noticed this when trying to compile with -Wall on a kernel fork. We potentially
don't set width here, which causes the compiler to complain about width
potentially being uninitialized in drm_cvt_modes(). So, let's fix that.

Signed-off-by: Lyude Paul <lyude@redhat.com>

Cc: <stable@vger.kernel.org> # v5.9+
Fixes: 3f649ab728cd ("treewide: Remove uninitialized_var() usage")
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/drm_edid.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 631125b46e04..2da158ffed8e 100644
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
@@ -3114,6 +3116,10 @@ static int drm_cvt_modes(struct drm_connector *connector,
 		case 0x0c:
 			width = height * 15 / 9;
 			break;
+		default:
+			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] unknown CVT aspect ratio %x\n",
+				    connector->base.id, connector->name, cvt_aspect_ratio);
+			continue;
 		}
 
 		for (j = 1; j < 5; j++) {
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
