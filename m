Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 266C5767D37
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jul 2023 10:41:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 522F110E032;
	Sat, 29 Jul 2023 08:40:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 667CE10E6BB
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 20:07:49 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1bb81809ca8so19338985ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 13:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20221208.gappssmtp.com; s=20221208; t=1690574869; x=1691179669;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p5RacAQ+h1XYtfSxQvgrfsN4D9QpF3jxUnp9xUi996I=;
 b=YkhOH87FDTMpw4vyh+gJwH6I/onZpCyL7sNLAIlSe4tKB3xkRChnc8vMmxWhyRiTsG
 Km+DjTD+7UfShJmvlz9FcSsP1JsmszzyO/qlcgcpV5okteh16S4/wtQlseYxcpSYHk4P
 4burqc66jjjwEfHwxVgX40s/MhprBfMyJsy7PmA1jdAizFT9ci4NH1+g731ktGLRP3rT
 ErM77mdTkDZgnAmm6NTSKzSlUcIi9h4C57oV/jSskIAQovR0Y4n2qgknPxKIoEDbg7BI
 GEgB/CMgqCBrjcQn5qvLcVVHNkKClMvnA1DbuRDuJP1uLcbHrpvDdF+rArXc23R6xIC2
 cSvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690574869; x=1691179669;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p5RacAQ+h1XYtfSxQvgrfsN4D9QpF3jxUnp9xUi996I=;
 b=Td6F6eaEo0tqCs8plWstjqnWSRBz07c4QFQ5WHWx6592lN5yO2cVNtkbpQHvNueM8i
 mkoROnA+xJ4PutbN21rwj+0OI8eOx4Nr0ODuwZtJUzYPKgoZvYqt5jaXHUtMHIaV0YFX
 OJaSquW0aTR/4Gr3xSYOMN9BzM9Ws69TYVzWqOyKGB0+Ix/Wl2Y4IHbjbkIP1vjSjVnL
 0teYF4iwFsjn/l6ouDbVMmyxQxUt4DnLWyuJL1IzamMWG8TEA3O4ePD7a8EtnmeD4+eZ
 DSwf4mvj/wgfQaO50BYXEf4g71BZDMZa7M3WTrf2KTLO/DTECOnKzV8PVPL5yfTHz8SE
 ye3Q==
X-Gm-Message-State: ABy/qLbhp+iYO5Wxi9AwOTVfJXBRF2s5iTi1pY1xiBqKxUKtpV1RlceK
 +4huF+OB/xPH4czqz9sZhpvhcw==
X-Google-Smtp-Source: APBJJlEtdm4vDsdKp1B47O1dOduvNGOdg+zVREPAkMjxO4J4CBebVHWefhQS4fjMJlvpWmimiA9Vuw==
X-Received: by 2002:a17:902:a518:b0:1b5:5052:5af7 with SMTP id
 s24-20020a170902a51800b001b550525af7mr2910838plq.8.1690574868948; 
 Fri, 28 Jul 2023 13:07:48 -0700 (PDT)
Received: from D100-Linux.hq.igel.co.jp (69-165-247-94.cable.teksavvy.com.
 [69.165.247.94]) by smtp.gmail.com with ESMTPSA id
 l5-20020a170903120500b001b830d8bc40sm3980848plh.74.2023.07.28.13.07.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jul 2023 13:07:48 -0700 (PDT)
From: Damian Hobson-Garcia <dhobsong@igel.co.jp>
To: laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com
Subject: [PATCH 2/2] drm:rcar-du: Enable ABGR and XBGR formats
Date: Fri, 28 Jul 2023 16:07:14 -0400
Message-Id: <20230728200714.2084223-2-dhobsong@igel.co.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230728200714.2084223-1-dhobsong@igel.co.jp>
References: <20230728200714.2084223-1-dhobsong@igel.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 29 Jul 2023 08:40:40 +0000
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
Cc: linux-renesas-soc@vger.kernel.org, taki@igel.co.jp,
 Damian Hobson-Garcia <dhobsong@igel.co.jp>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These formats are used by Android so having them available
allows the DU to be used for composition operations.

Signed-off-by: Damian Hobson-Garcia <dhobsong@igel.co.jp>
---
 drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
index 96241c03b60f..d61bb2e44c06 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
@@ -122,6 +122,8 @@ static const u32 rcar_du_vsp_formats[] = {
 	DRM_FORMAT_RGB888,
 	DRM_FORMAT_BGRA8888,
 	DRM_FORMAT_BGRX8888,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_XBGR8888,
 	DRM_FORMAT_ARGB8888,
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_UYVY,
@@ -154,6 +156,8 @@ static const u32 rcar_du_vsp_formats_gen4[] = {
 	DRM_FORMAT_RGB888,
 	DRM_FORMAT_BGRA8888,
 	DRM_FORMAT_BGRX8888,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_XBGR8888,
 	DRM_FORMAT_ARGB8888,
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_RGBX1010102,
@@ -194,6 +198,10 @@ static u32 rcar_du_vsp_state_get_format(struct rcar_du_vsp_plane_state *state)
 			fourcc = DRM_FORMAT_XRGB8888;
 			break;
 
+		case DRM_FORMAT_ABGR8888:
+			fourcc = DRM_FORMAT_XBGR8888;
+			break;
+
 		case DRM_FORMAT_BGRA8888:
 			fourcc = DRM_FORMAT_BGRX8888;
 			break;
-- 
2.25.1

