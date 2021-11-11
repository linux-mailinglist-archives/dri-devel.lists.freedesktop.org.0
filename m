Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C16044D439
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 10:41:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B0B06E092;
	Thu, 11 Nov 2021 09:41:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE5426E092
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 09:41:11 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id q126so4688752pgq.13
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 01:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MLJ7btGIMbKSDG74MUavRRNSAjzlOSavbNr/B+lyI8g=;
 b=o4Eh7jUdnrZxNxyjt9u8UcyFEhKbmS7LdYjt7EVbqCqc7I6nAnJhEdOlBRV/AAosqP
 L/ZLgYq7ScbP+juKb7hYZk1NdJxSjD8SNcLQ78PR4JFWWiGheUlMHKd7KSje5JfCruTN
 ETbRKVc0pz87v6EuqS35Ao/xD3qp7xUkvSCaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MLJ7btGIMbKSDG74MUavRRNSAjzlOSavbNr/B+lyI8g=;
 b=uPSnPDPEAbjNL8c06UidVvdyOCy7D5h6dk1LECRvPHamkqavdFI0l6y93O0AbjALiQ
 k8VCICfIGIdZzlh5bQSiXglhUgtSCg67cwdv8jlxNs3Z11CJJ8cCuIXoBEv/fOc5fvD/
 bj2tIbHaFX92VnSD1gFe+Qzn1RR3OtWddVmx+x6JKROcb1lWqtHy5n5jisIM2uc0gXy+
 w6xic2VjmehzzLQNIEHcN4P1oE41/rRgdu6XywojoMyxzf/yqTpZn3IS+/eJlriUayjh
 I1YPONJvLOQPG2rj3eqGhWRKbgZ1PRYsJ0Gi/av0a12/uG14jhkNRXoAaQ/LGr7BpN98
 7JRw==
X-Gm-Message-State: AOAM530QkzTLm6zj5Vx7f8x5Hw405IbzV07Gu5zGcsvgXrl/LJGeKKIl
 dBQncdajyZEOh4xwfuWuqfw9q+dcNpEzzBi+
X-Google-Smtp-Source: ABdhPJyqnDk96urqNkVJCr+ERvThhb6Hg2nAh9ETgKzjqm2yHD3poQrjbO+XyPNG8jWnk4OIogH+5g==
X-Received: by 2002:a63:8b41:: with SMTP id j62mr3787834pge.420.1636623671430; 
 Thu, 11 Nov 2021 01:41:11 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:3041:135c:4e21:846c])
 by smtp.gmail.com with ESMTPSA id oa2sm8045851pjb.53.2021.11.11.01.41.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 01:41:10 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH] drm/panel: panel-simple: Fix proper bpc for
 AM-1280800N3TZQW-T00H
Date: Thu, 11 Nov 2021 15:11:03 +0530
Message-Id: <20211111094103.494831-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
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
Cc: linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

AM-1280800N3TZQW-T00H panel support 8 bpc not 6 bpc as per
recent testing in i.MX8MM platform.

Fix it.

Fixes: bca684e69c4c ("drm/panel: simple: Add AM-1280800N3TZQW-T00H")
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index eb475a3a774b..cf3f21f649cb 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -719,7 +719,7 @@ static const struct drm_display_mode ampire_am_1280800n3tzqw_t00h_mode = {
 static const struct panel_desc ampire_am_1280800n3tzqw_t00h = {
 	.modes = &ampire_am_1280800n3tzqw_t00h_mode,
 	.num_modes = 1,
-	.bpc = 6,
+	.bpc = 8,
 	.size = {
 		.width = 217,
 		.height = 136,
-- 
2.25.1

