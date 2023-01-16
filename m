Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D95DD66C0A0
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 15:03:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FB4310E40B;
	Mon, 16 Jan 2023 14:03:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A90910E142
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 14:02:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id B7454CE1170;
 Mon, 16 Jan 2023 14:02:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDFFCC433F0;
 Mon, 16 Jan 2023 14:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673877774;
 bh=PCOMQ8cyBkpfAdWRtEkxUVs1mHVGtQvzfE+wUDZzs30=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=a2qhVCVddFKH/EWFRWCDmETSlQ3EXXco+mybJ2RUUzAwRrxwQGtOcFXXA/fgcY8wN
 5ipf0ZR5fhRSlHEk7eGI2lNieFr8N/ZW/0//o6MZgXoLK/EUUOg2y2HWWNNMA5+nyx
 e3eyKc85+7AYr4gWFr4VL9xRdxV2NCMnVMah5UoMk7hIYcKkQeXHa0eZANbMU0Fvr8
 iZ18AJgmNLk4bBaZ7SfHAu5S8K2n0Fiada+NCU6eiaDoiHjby/ByOCYIaL4sw8SoAY
 Uj2j4vw2XBj9lhpDRWmGbOpcB/ulxSq2wipt9t4JqFgrM2DVIAqb2Ve8AxAM+4jEpY
 QSKz8VvWSukIA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 18/53] drm: Add orientation quirk for Lenovo
 ideapad D330-10IGL
Date: Mon, 16 Jan 2023 09:01:18 -0500
Message-Id: <20230116140154.114951-18-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230116140154.114951-1-sashal@kernel.org>
References: <20230116140154.114951-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, tzimmermann@suse.de,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Patrick Thompson <ptf@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Patrick Thompson <ptf@google.com>

[ Upstream commit 0688773f0710528e1ab302c3d6317e269f2e2e6e ]

Panel is 800x1280 but mounted on a detachable form factor sideways.

Signed-off-by: Patrick Thompson <ptf@google.com>
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Link: https://patchwork.freedesktop.org/patch/msgid/20221220205826.178008-1-ptf@google.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index 52d8800a8ab8..3659f0465a72 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -304,6 +304,12 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad D330-10IGM"),
 		},
 		.driver_data = (void *)&lcd1200x1920_rightside_up,
+	}, {	/* Lenovo Ideapad D330-10IGL (HD) */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad D330-10IGL"),
+		},
+		.driver_data = (void *)&lcd800x1280_rightside_up,
 	}, {	/* Lenovo Yoga Book X90F / X91F / X91L */
 		.matches = {
 		  /* Non exact match to match all versions */
-- 
2.35.1

