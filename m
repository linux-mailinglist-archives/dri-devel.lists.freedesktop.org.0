Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 399542A8B0F
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 00:57:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9816F6E876;
	Thu,  5 Nov 2020 23:57:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA4596E876
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 23:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604620636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=i5YTCTculn7wAu7o7uqKEzANd6RxkS1YgfVbSqCO/rQ=;
 b=ioMXuHkbSlNvGxUp7cvaGbP7t7RvfAUcPF/e0Xr7jSwsK6saJ2+3OCElcLC2MnxDeB+asA
 QnA/xw01VTuiuYRSLFjyklOGav4WALlVpGAOMA4POcs4f8Y4MRX3nOxbNwdFXCUFg5Qduh
 lApQ9l+CBRc39e1knagIn2jBksFMZWI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-X6GcLpfGNvCcG-T7R_okhg-1; Thu, 05 Nov 2020 18:57:12 -0500
X-MC-Unique: X6GcLpfGNvCcG-T7R_okhg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9DC521006C83;
 Thu,  5 Nov 2020 23:57:09 +0000 (UTC)
Received: from Whitewolf.lyude.net (ovpn-112-124.rdu2.redhat.com
 [10.10.112.124])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 244E65B4B8;
 Thu,  5 Nov 2020 23:57:07 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3] drm/edid: Fix uninitialized variable in drm_cvt_modes()
Date: Thu,  5 Nov 2020 18:57:02 -0500
Message-Id: <20201105235703.1328115-1-lyude@redhat.com>
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
Changes since v2:
* Remove now unused variable

Signed-off-by: Lyude Paul <lyude@redhat.com>

Cc: <stable@vger.kernel.org> # v5.9+
Fixes: 3f649ab728cd ("treewide: Remove uninitialized_var() usage")
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/drm_edid.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 631125b46e04..b84efd538a70 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -3114,6 +3114,8 @@ static int drm_cvt_modes(struct drm_connector *connector,
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
