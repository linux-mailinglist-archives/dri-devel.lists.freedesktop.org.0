Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4B58C87BF
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 16:11:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E49E610EEE5;
	Fri, 17 May 2024 14:11:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=scrumplex.net header.i=@scrumplex.net header.b="iRMlOybV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F9AC10EEE5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 14:11:34 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4VgpmK5Mlhz9t3S;
 Fri, 17 May 2024 16:11:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=scrumplex.net;
 s=MBO0001; t=1715955089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1sWJ7YrtXwxPL1uPg0OKFMkavSCQwdmNQHJyzXYuGFM=;
 b=iRMlOybVq0sOJwVcUz9XmI+ENv64JpnIr86auD38lzxljzquIQVpDIyXyV3Vf7n9FbD5Js
 QL1VxC5Qk7cZxB1iiPfdDTbeku154QyjvrrQjTnF/O9qHy3cu88VFeHu8YhI9ACiyHEMzq
 hupClvn7csqPOKt1K3mDrhG2XRNZYHBhaartW3s+CzNtdKIoyFsH5lznFidiNlf1E92ZhD
 F8PtehkItPQPoRsS9lkXIrRdjZ28cGYbU4dbYbII3UC0i2AoSmmVJtSmopVLotlRvnjhXT
 8bO1LCfl0UvAZBJu1z5Vv8TmvYBOUSbQVGGrwkc7zGWf94I6K+5+9WpconeeQw==
From: Sefa Eyeoglu <contact@scrumplex.net>
To: dri-devel@lists.freedesktop.org
Cc: Sefa Eyeoglu <contact@scrumplex.net>
Subject: [PATCH] drm/edid: add non-desktop quirk to Bigscreen Beyond HMD
Date: Fri, 17 May 2024 16:09:44 +0200
Message-ID: <20240517141049.896023-3-contact@scrumplex.net>
In-Reply-To: <20240517105555.654262-1-contact@scrumplex.net>
References: <20240517105555.654262-1-contact@scrumplex.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4VgpmK5Mlhz9t3S
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

The Bigscreen Beyond VR headset is a non-desktop output and should be
marked as such using an EDID quirk.

Closes https://gitlab.freedesktop.org/drm/misc/kernel/-/issues/39

Signed-off-by: Sefa Eyeoglu <contact@scrumplex.net>
---
 drivers/gpu/drm/drm_edid.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 4f54c91b31b2..d407efc0fb55 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -200,6 +200,9 @@ static const struct edid_quirk {
 	/* Rotel RSX-1058 forwards sink's EDID but only does HDMI 1.1*/
 	EDID_QUIRK('E', 'T', 'R', 13896, EDID_QUIRK_FORCE_8BPC),
 
+	/* Bigscreen Beyond Headset */
+	EDID_QUIRK('B', 'I', 'G', 0x1234, EDID_QUIRK_NON_DESKTOP),
+
 	/* Valve Index Headset */
 	EDID_QUIRK('V', 'L', 'V', 0x91a8, EDID_QUIRK_NON_DESKTOP),
 	EDID_QUIRK('V', 'L', 'V', 0x91b0, EDID_QUIRK_NON_DESKTOP),
-- 
2.44.0

