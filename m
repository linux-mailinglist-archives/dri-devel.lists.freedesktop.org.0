Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6003055B1
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 09:30:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95BF76E5C5;
	Wed, 27 Jan 2021 08:29:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 856966E431
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 13:56:23 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id jx18so2218823pjb.5
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 05:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PLopm+nrSb+Okoh9RwkXyxLkE32CQhc9+HXJvPrxQb4=;
 b=RvJfkf28Wk5Xtg8jR3Gp8he1XgD6VQWnnVruv4X1jwyV/oNmxTH+tOQ4LlSR8C1s7B
 HvTXVV6ucfBlY5EFXzq4GVi26U9E41wcQbGtTUU31wJm4syeCVnjIBmHVRwwI/PLK/Xr
 +F9xMZP9Qw+KRwBB9AbuSOIRWmyXGCmZuW6Rq+6IQgJ5YlQzJMkKUNRK54G/x+APJC0Q
 WbgR7MRVa3qD7mgAXbm5Sc9ZbWXxc83h4IIVMk50n5is6fzo5aOBPfxkjzn1+yQje6Dc
 93LpB1ioS8i7PO7Nt/zA9ZkwvdcmIH6fvaBPIZORAfpaOt2FhJDm3Vly0U/G4FBIPOG6
 KnGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PLopm+nrSb+Okoh9RwkXyxLkE32CQhc9+HXJvPrxQb4=;
 b=apDBDuO7K0k3LvMYLmpa4Ww8KvFzV1qhc7ObSfRBKGvD0d2XZWRWlmUieFLeGlLiWd
 SbjxY7sNxgCyH2fkvc1Cqj/Ny/YeBbw3fNcdSj5AYJM3yAq++ZEj5iuPQeTw2Lb+sI7N
 NsDpmAI6aN+kwFwQfXKuKv+3ScVkoRAZt2blh5bkkH0rAYX3oGiSF3fS4+jpVpGHdwQp
 WyWjjfYlroHyj98Ac5/eEmeDAewfniDPAj6bvsrxUSIOIDmdux+OHu1r9TpLcmOGOoqk
 8Lzv+bzr/CwQPZCXNw1QNfhWc3kZdmlwjQRW0rkp7Sj0MW8g5QUSRg2+gNKHQKb01OG4
 D47Q==
X-Gm-Message-State: AOAM532VB35YaqcJuwvRhcv5qlJCVONZ1pLdJbf6mAlF5laquOrLrFqx
 6M5qjM5nBrCqcXKA1CIgR5U=
X-Google-Smtp-Source: ABdhPJwof+FC12gJZtih8+puFm8cdpF2/TVMbujKejXQOEFMUBGHhS/YQrYaGA7I/Hi1ewa3bbRFkw==
X-Received: by 2002:a17:902:6bca:b029:df:fb48:8c39 with SMTP id
 m10-20020a1709026bcab02900dffb488c39mr6084593plt.31.1611669383219; 
 Tue, 26 Jan 2021 05:56:23 -0800 (PST)
Received: from localhost ([178.236.46.205])
 by smtp.gmail.com with ESMTPSA id y21sm19446682pfp.208.2021.01.26.05.56.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 05:56:22 -0800 (PST)
From: menglong8.dong@gmail.com
X-Google-Original-From: dong.menglong@zte.com.cn
To: tomba@kernel.org
Subject: [PATCH] drm/omap: dsi: fix unreachable code in dsi_vc_send_short()
Date: Tue, 26 Jan 2021 05:55:11 -0800
Message-Id: <20210126135511.10989-1-dong.menglong@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 27 Jan 2021 08:29:46 +0000
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
Cc: Menglong Dong <dong.menglong@zte.com.cn>, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 sebastian.reichel@collabora.com, laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Menglong Dong <dong.menglong@zte.com.cn>

The 'r' in dsi_vc_send_short() is of type 'unsigned int', so the
'r < 0' can't be true.

Fix this by introducing a 'err' insteaded.

Fixes: 1ed6253856cb
("drm/omap: dsi: switch dsi_vc_send_long/short to mipi_dsi_msg")

Signed-off-by: Menglong Dong <dong.menglong@zte.com.cn>
---
 drivers/gpu/drm/omapdrm/dss/dsi.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 8e11612f5fe1..febcc87ddfe1 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -2149,11 +2149,12 @@ static int dsi_vc_send_short(struct dsi_data *dsi, int vc,
 			     const struct mipi_dsi_msg *msg)
 {
 	struct mipi_dsi_packet pkt;
+	int err;
 	u32 r;
 
-	r = mipi_dsi_create_packet(&pkt, msg);
-	if (r < 0)
-		return r;
+	err = mipi_dsi_create_packet(&pkt, msg);
+	if (err)
+		return err;
 
 	WARN_ON(!dsi_bus_is_locked(dsi));
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
