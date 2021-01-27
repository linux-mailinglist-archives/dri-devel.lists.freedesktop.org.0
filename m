Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5AD3055C6
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 09:30:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CA116E7F1;
	Wed, 27 Jan 2021 08:29:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85B036E4C9
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 01:51:30 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id d4so162543plh.5
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 17:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3yvptWfKORCEVwYy1ACTtiGifr+3cTipupRyRjthl2g=;
 b=W3oELcA9iI1ZLJQf2lRy3K5z1tVR/fGJ6GASMr9lo87icBB8J8WcIyHnigXabQnMTh
 DNe9drkZ9T1P6DYkqvsF5kMQiNMmtRRfhKvjBuWfLJA7AgdoohRPZNW4zzJy47IUOiyc
 SJqXZ2bQeybF2XHiEGZuFC7+WP1PrEJpRLPCJNIRgBQQqxLD9QVJAfbKGDuD5h1f7G8r
 Q1XSQg2XbwMUauHVq+K2soVh6soXod/I3NTwh6OObO0KO6TxqpsZeywgmV4nNiFrtKPH
 5UC+VdH00MsFTGst9EwWAroDJX41Sxmb9S6fm/0wweL0gdLoIyANlEsuA8iGHawAbDoK
 Hf9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3yvptWfKORCEVwYy1ACTtiGifr+3cTipupRyRjthl2g=;
 b=XekVIGJdvo3w1XzuqV7ipyRkdL7EnbTzUr+TaL/dznVZyN6zab6NoBY+WNG0OyCvhE
 n4830HpnpwM2E8jgR8J2tj+ScJMAQHn81aSmPZhnb5bVEWvaiJoHJgI4TKJLEVYttiOl
 fl9Focl/5m+QdHKCWPxI2hYfpTOfTwk/N9asQZHN6VVVFGsVRXfgcYeQzgXGwx8qxQG4
 dz4MImpDnkZ0HPFPyqmJYiRpyvQKV1LtVwB2+w3HRXLnGeP91Mz/QqEnlVqUnnqcJ6vJ
 QZCCziRldn463MUQmU0Fo6s1Cijd1rOYhRA6sYG8Cl5RePSlK6B8jXZuXJZw1iIBewOe
 mwGA==
X-Gm-Message-State: AOAM5306UriReLGJJTGdmlHZQDlxW3i5n0Urpy+b7hwSTHvcpzlBIfo4
 uwfEmEYrGOs7XZAMevQTnkI=
X-Google-Smtp-Source: ABdhPJytgnP3XVHxsTdmA0Cu8bWPloY+2QADc/bc0RiANnTwjheceTjWakSGLieRfhC/iuWuQkgHEA==
X-Received: by 2002:a17:902:8ec7:b029:e0:a02:3d26 with SMTP id
 x7-20020a1709028ec7b02900e00a023d26mr8724235plo.24.1611712290234; 
 Tue, 26 Jan 2021 17:51:30 -0800 (PST)
Received: from localhost ([178.236.46.205])
 by smtp.gmail.com with ESMTPSA id p7sm325105pfn.52.2021.01.26.17.51.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 17:51:29 -0800 (PST)
From: menglong8.dong@gmail.com
X-Google-Original-From: dong.menglong@zte.com.cn
To: tomba@kernel.org,
	sebastian.reichel@collabora.com
Subject: [PATCH v2] drm/omap: dsi: fix unreachable code in dsi_vc_send_short()
Date: Tue, 26 Jan 2021 17:51:17 -0800
Message-Id: <20210127015117.23267-1-dong.menglong@zte.com.cn>
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
 laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Menglong Dong <dong.menglong@zte.com.cn>

The 'r' in dsi_vc_send_short() is of type 'unsigned int', so the
'r < 0' can't be true.

Fix this by introducing a 'err' of type 'int' insteaded.

Fixes: 1ed6253856cb ("drm/omap: dsi: switch dsi_vc_send_long/short to mipi_dsi_msg")

Signed-off-by: Menglong Dong <dong.menglong@zte.com.cn>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
v2:
- remove word wrap in 'Fixes' tag
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
