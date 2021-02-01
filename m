Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F179730B9C1
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 09:28:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83AD26E91F;
	Tue,  2 Feb 2021 08:27:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7B5F6E7FE
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 15:56:44 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id x21so17845932iog.10
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Feb 2021 07:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=kcdyPTY1skmYjF1uajFrBrZyBd8/9OXciUlqQZU21U8=;
 b=uzQLEFhC1+ARNN6hqVIa3FQ1xYmbDBd6n80aAnHAx4MdYkelzPRroBA9AJQ0g6qqs3
 jk7x6Htzbv9fooOxUmbTNvcYJ0ZtW2rRH9u3Ku57aBuItx9s4yCB1N73BTJjMBRoFI1g
 kyHhgKtKJ9sTrAANLdvBJ14fZeNwXfpShWQHuWrRRHM8IDqt0s4WxV/Ta+b8NuURv5m/
 EUGt+SEJl+Sb9wBhHMed/erkr8hNm78soejwZHzeJU0CsnjSPF5swBHQI2321G1NB+sZ
 QqUpowJcAKuaW9s9XU3ZIlmWQWMbntJQGS/2PQC3+MiNNztGa0LExQuKUK8rvUPD3x5F
 gTEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=kcdyPTY1skmYjF1uajFrBrZyBd8/9OXciUlqQZU21U8=;
 b=pNzFopGBc0G45JvOIWvUk4xDabeMAV/QFc9OQ4zTgYtbtn/so0KZere6solXxskQvR
 ApxQgSXuWorv0vvu2wbhuMlib0H6nmgI8n/q9Uj7LqtQp1nyFJKcPu++uvNmML6aA3/3
 xF90wD2ONNVJE+F9koqhyyVVI78ykER4wzO/qsulkxCx22ZBfXE26KJVSU0rVfdogNcf
 qFn2mRrAzX+lHfjabDAGdkkv97ZuHUVU504tiX97qx4COIyS49B14xSNCjK9aekf6qaQ
 AyxHlx6KATBy9+FFJ6FBqROIxTOvZq6FDpeyQmaBDjqv6bdXlaFL/TblcONqoc5l5RQm
 SY8A==
X-Gm-Message-State: AOAM530k4CeNLFH/zPV2J6qM1k2tQ5KRTJjMDXP1yPLfovL8OHtmGA7X
 +Ou3xFP3DLkNPYyZ+EiMlGM=
X-Google-Smtp-Source: ABdhPJzR64pEhc1+heg0E33szWIpaM9xLSkpXN4WnftuLWxO8guiKR5uRsSuzM9125+j6Lk8IeaEgA==
X-Received: by 2002:a5d:8704:: with SMTP id u4mr12277294iom.3.1612195004270;
 Mon, 01 Feb 2021 07:56:44 -0800 (PST)
Received: from spring-Precision-5820-Tower.cs.umn.edu
 ([2607:ea00:101:3c74:b4b0:f34c:770:f33f])
 by smtp.gmail.com with ESMTPSA id t7sm9485796ilg.9.2021.02.01.07.56.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Feb 2021 07:56:43 -0800 (PST)
From: Wenjia Zhao <driverfuzzing@gmail.com>
To: 
Subject: [PATCH 3/3] video: fbdev: fix the out-of-bounds access cr_data->bak
Date: Mon,  1 Feb 2021 09:56:34 -0600
Message-Id: <1612194994-50994-1-git-send-email-driverfuzzing@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Tue, 02 Feb 2021 08:27:00 +0000
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
Cc: linux-fbdev@vger.kernel.org, driverfuzzing@gmail.com,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The size of cr_data->bak is CURSOR_SIZE/4, however the access size in
the is
CURSOR_SIZE in the loop. It causes the out-of-bounds access.

Signed-off-by: Wenjia Zhao <driverfuzzing@gmail.com>
---
 drivers/video/fbdev/via/viafbdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/via/viafbdev.c b/drivers/video/fbdev/via/viafbdev.c
index 22deb34..ef217cc 100644
--- a/drivers/video/fbdev/via/viafbdev.c
+++ b/drivers/video/fbdev/via/viafbdev.c
@@ -839,7 +839,7 @@ static int viafb_cursor(struct fb_info *info, struct fb_cursor *cursor)
 	if (cursor->set & FB_CUR_SETSHAPE) {
 		struct {
 			u8 data[CURSOR_SIZE];
-			u32 bak[CURSOR_SIZE / 4];
+			u32 bak[CURSOR_SIZE];
 		} *cr_data = kzalloc(sizeof(*cr_data), GFP_ATOMIC);
 		int size = ((cursor->image.width + 7) >> 3) *
 			cursor->image.height;
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
