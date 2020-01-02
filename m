Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E7212E545
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2020 11:59:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CBCA6E08C;
	Thu,  2 Jan 2020 10:58:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92BFC892C8
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2020 09:55:20 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id u2so5131272wmc.3
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jan 2020 01:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=5OxxgqbSH1bpU+N86be2oTUHJYZJRxIbZuHPbnm3Fbw=;
 b=tu/x2l1kltY3l/Ho0RoApMDAt/R391Ka5kJlJg6PXwy7qAgXQH6wLIfW1KvVsmQ7yk
 bLSE0MrtY1Aw6cO8hTN2Zgx5k2t9wW2cJtXY60vcAcTMrlkxrYBc7aWFlLQVhj/uKabP
 lwDpKRJ0gQ8KxwxqfuINc+B9wGv6WUCkoFEEB14tXtIsVuL0HeLvEAQDmhBjC8gRwYFV
 GNlr+yv3UdPPNEVJ/DZSAox8lDlS/FS33jjU0sC9wA6wN/V+2XwcubyVVV3vUF4hee05
 e/SeDTHCNqX55L+wJ3kAfZml00b1z2kDAdcbFHP8Gp2tR5xjWfcwsTzMZTfH+0NsJ9X2
 ctew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=5OxxgqbSH1bpU+N86be2oTUHJYZJRxIbZuHPbnm3Fbw=;
 b=fWG9h2VsyRVmdYQVYi8aeWnACtiWSE3zvoEYPZ3OmtlEA8mXAZI16KGIEbYN0Yvgco
 Xc/IA4jcTaWtx5p/6UJnwGajuRsfDoyFVTmLHVZlXEqZ4/U/Tmg/r9NzydJFofb5bwEk
 77YFyJSy6SUnHkYDCh49C8kAGa1Ri1bPVrBsBXnrfSYYi3T/HwN0yuMlNwbff+Bd9NO3
 CWKK4pyGCvvfV6otYHSKXCnxuXIhVMiDP6UsjvfocXEh0aEwyqTOVr/AeE+OMYx3KssP
 Pdu93IBfuIRKd6Ukh+todRu79zBj9LS4ZNqfT2OEnUibpuDwXYrOegDo6DsMfcGq8FFX
 JmVw==
X-Gm-Message-State: APjAAAWCwJ8czyZIWmK+6usLMquiV/m4rOjUwfMVHOoHVXWEVKs+oT8a
 7nGmM3mr2jN2VNxFxhszEQM=
X-Google-Smtp-Source: APXvYqyfwtUdMlicWKNWxM9IPcfk7qztALI/0mg1JSh8RuszTN1DQDP3EUhmM+D0vwjfyKH01pbxIQ==
X-Received: by 2002:a05:600c:2c7:: with SMTP id
 7mr13129541wmn.87.1577958919317; 
 Thu, 02 Jan 2020 01:55:19 -0800 (PST)
Received: from localhost.localdomain ([197.254.95.38])
 by smtp.googlemail.com with ESMTPSA id a1sm8131464wmj.40.2020.01.02.01.55.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2020 01:55:18 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: tomi.valkeinen@ti.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drm/omapdrm: use BUG_ON macro for error debugging.
Date: Thu,  2 Jan 2020 12:55:15 +0300
Message-Id: <20200102095515.7106-1-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Thu, 02 Jan 2020 10:58:15 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since the if statement only checks for the value of the `id` variable,
it can be replaced by the more concise BUG_ON() macro for error
reporting.
Issue found using coccinelle.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/omapdrm/dss/dispc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dispc.c b/drivers/gpu/drm/omapdrm/dss/dispc.c
index 413dbdd1771e..dbb90f2d2ccd 100644
--- a/drivers/gpu/drm/omapdrm/dss/dispc.c
+++ b/drivers/gpu/drm/omapdrm/dss/dispc.c
@@ -393,8 +393,7 @@ static void dispc_get_reg_field(struct dispc_device *dispc,
 				enum dispc_feat_reg_field id,
 				u8 *start, u8 *end)
 {
-	if (id >= dispc->feat->num_reg_fields)
-		BUG();
+	BUG_ON(id >= dispc->feat->num_reg_fields);
 
 	*start = dispc->feat->reg_fields[id].start;
 	*end = dispc->feat->reg_fields[id].end;
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
