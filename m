Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F217874B2F
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 10:44:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADFE010E639;
	Thu,  7 Mar 2024 09:44:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="Vcz23lBb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4435210EF5A
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 09:44:55 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id
 41be03b00d2f7-5d42e7ab8a9so410530a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Mar 2024 01:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1709804694; x=1710409494; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Oo1HUbKQuJ0voHBjj4WM/4fo0S00UmuP10DfZ9KXDLk=;
 b=Vcz23lBbprMNeIf6/uitnjtNgpQYgwR6ZZqqokp1NpVn+KFApICbujeCavYjdldFyo
 Hg+dh0ECF9/MOT4/x/EUibci/8+wXvdDeJnAIqNQ1AxUY/eX+luE6JjpEOEGSPNSE/la
 tdUrgLRVdqOByIgEi3FNda92yUMrUstbqw8ksQoPjy7gPvkLJ1IsQMSVnoxTjanp99on
 wozEssdHvuBSjiVA989KLZOAyOhNh/sER76Xmkc9nxlCFSxdjvUY1bomfvZW284OPNyb
 2ZXqIIuy/OoPWY9DXULRDgaw9kvoLeu95yey7HaLdLEofkrvfN/+dEemNJJxbw5v3Wzp
 vArw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709804694; x=1710409494;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Oo1HUbKQuJ0voHBjj4WM/4fo0S00UmuP10DfZ9KXDLk=;
 b=RDsduuW6SI3vW9rOxtfQepxVbsDljHeLqxwiTPANsbEXY5/Eyas4HhKCYevsg88OwD
 /M+SdT94ZkvdpHkaGj+DCegaQRdgn3OD+maTgOvJBNkzyynD74hSdw99lquJqnfzUtwg
 4VD4+x388eBLGmMn6wBiGwN2Wt/dJdo794bvOOXXjasgD7+cvbl+1QWvBztqsIZgQzMl
 0KgoqnbQnrUNyO6imCCI3u6PYCucstejtgA5apDHp49th1NKkMa27jyEZD0NhVAAyZPN
 9WSk5v2yeZwrdNvWcOiOE+GelNswKpB3IzEFA6cfN12SCB12UxP7oaHIGd6FPW6rgAt1
 H2Lw==
X-Gm-Message-State: AOJu0YzyZ+sTdJgVM9XlLTzzTnVS2+U3owfuVnFcCIMrO1NjJxqd0oaF
 44n9QyoM7LA066gxsYx8RiC5I+NyKqmEowp7AnqDVgU+mUWzBdUgWpKCmvBwHgc=
X-Google-Smtp-Source: AGHT+IEL+fybhARE+7Cp+PNzK40b0NktWZ2XX8e9+dzkx1Vftd0Ty9R044Lr8GiLB9eCUGDR+2Ikdw==
X-Received: by 2002:a05:6a20:2447:b0:1a1:7787:d489 with SMTP id
 t7-20020a056a20244700b001a17787d489mr301736pzc.6.1709804694271; 
 Thu, 07 Mar 2024 01:44:54 -0800 (PST)
Received: from xu.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a170902e80a00b001dcfc6c3116sm10083353plg.65.2024.03.07.01.44.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Mar 2024 01:44:53 -0800 (PST)
From: Xuxin Xiong <xuxinxiong@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@google.com, hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Xuxin Xiong <xuxinxiong@huaqin.corp-partner.google.com>
Subject: [PATCH] drm/panel-edp: Add several generic edp panels
Date: Thu,  7 Mar 2024 17:44:33 +0800
Message-Id: <20240307094433.3440431-1-xuxinxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.40.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the following 2 panels:
1. BOE NT116WHM-N44
2. CMN N116BCA-EA1

Signed-off-by: Xuxin Xiong <xuxinxiong@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index a0b6f69b916f..e21b4bb2bb3c 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1952,6 +1952,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b43, &delay_200_500_e200, "NV140FHM-T09"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b56, &delay_200_500_e80, "NT140FHM-N47"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c20, &delay_200_500_e80, "NT140FHM-N47"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cb6, &delay_200_500_e200, "NT116WHM-N44"),
 
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1132, &delay_200_500_e80_d50, "N116BGE-EA2"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1138, &innolux_n116bca_ea1.delay, "N116BCA-EA1-RC4"),
@@ -1963,6 +1964,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1154, &delay_200_500_e80_d50, "N116BCA-EA2"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1157, &delay_200_500_e80_d50, "N116BGE-EA2"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x115b, &delay_200_500_e80_d50, "N116BCN-EB1"),
+	EDP_PANEL_ENTRY('C', 'M', 'N', 0x115e, &delay_200_500_e80_d50, "N116BCA-EA1"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1247, &delay_200_500_e80_d50, "N120ACA-EA1"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x142b, &delay_200_500_e80_d50, "N140HCA-EAC"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x144f, &delay_200_500_e80_d50, "N140HGA-EA1"),
-- 
2.40.1

