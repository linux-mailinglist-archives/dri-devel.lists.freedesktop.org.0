Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D01C5FD633
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 10:29:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58C6710E4E1;
	Thu, 13 Oct 2022 08:29:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49B6D10E4E1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 08:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665649759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=GbAPudkJN2ZfKtwFkn+RvQb0MCZbu4crNWZxr6gzXJI=;
 b=FqFV8uDS+zxn5+szFtamEhwxCYH8ZSA457DP8fP3RQ5JcA5sSbTRN2TBKDgyK9KnLmY5lY
 AxUJagNAarMCe9UguIylFA4x78mLg00JBUxyhXtVxbLA8y36plma6OUZX+xOc7twANLFOg
 2Vg06tv/I6o4tE+/r2B02gKHX1duaJE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-179-YLfXgt9VMPuCT4FXIDAHGA-1; Thu, 13 Oct 2022 04:29:16 -0400
X-MC-Unique: YLfXgt9VMPuCT4FXIDAHGA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D7C861C004F5;
 Thu, 13 Oct 2022 08:29:15 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.192.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6E14D140EBF3;
 Thu, 13 Oct 2022 08:29:14 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com
Subject: [PATCH] drm/mgag200: Fix PLL setup for G200_SE_A rev >=4
Date: Thu, 13 Oct 2022 10:29:01 +0200
Message-Id: <20221013082901.471417-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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
Cc: michel@daenzer.net, Jocelyn Falempe <jfalempe@redhat.com>,
 stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For G200_SE_A, PLL M setting is wrong, which leads to blank screen,
or "signal out of range" on VGA display.
previous code had "m |= 0x80" which was changed to
m |= ((pixpllcn & BIT(8)) >> 1);

Tested on G200_SE_A rev 42

This line of code was moved to another file with
commit 85397f6bc4ff ("drm/mgag200: Initialize each model in separate
function") but can be easily backported before this commit.

Fixes: 2dd040946ecf ("drm/mgag200: Store values (not bits) in struct mgag200_pll_values")
Cc: stable@vger.kernel.org
Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/mgag200/mgag200_g200se.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_g200se.c b/drivers/gpu/drm/mgag200/mgag200_g200se.c
index be389ed91cbd..4ec035029b8b 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200se.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200se.c
@@ -284,7 +284,7 @@ static void mgag200_g200se_04_pixpllc_atomic_update(struct drm_crtc *crtc,
 	pixpllcp = pixpllc->p - 1;
 	pixpllcs = pixpllc->s;
 
-	xpixpllcm = pixpllcm | ((pixpllcn & BIT(8)) >> 1);
+	xpixpllcm = pixpllcm | BIT(7);
 	xpixpllcn = pixpllcn;
 	xpixpllcp = (pixpllcs << 3) | pixpllcp;
 
-- 
2.37.3

