Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 456BF9DED01
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2024 22:44:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F333E10E358;
	Fri, 29 Nov 2024 21:44:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=derek.foreman@collabora.com header.b="Acz7UcyQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C7F10E358
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 21:44:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1732916677; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=m4XVPzjU4cXzlZDHvYbWcsBAcHrkwKeFOPQlzxta/z20vjBDlRuAjjWmhnR180JSf9iqVfsTspei3v246ZNdaSV9gYMdGbbIAreavRJLEkZZk/Pz6gLdc4CdBgvp/TrfyruUTUXb4weHnTp/wI4EJhHxdI0QBXNN4tP0NIepLJY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1732916677;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Xsw4bh8PMFznn6F6qu3Dih39da2oNzNdYQmTQZY9vaQ=; 
 b=Vm9BJtl1dvzQyL7FZvGiXvsQqdmXmIMJyusQZJECB41e+NM8/JflFcLJe1vLeK1MVVWJM1s/dlkkrTU6MKzfaHa+xUBcBi2yhAVvLYpLO3PbUckATrDNigehAjzuKWMT/8C0aWPwy0rxJHJLBCxu2zUuKfeXn3BXifkSHG9egYY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=derek.foreman@collabora.com;
 dmarc=pass header.from=<derek.foreman@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732916677; 
 s=zohomail; d=collabora.com; i=derek.foreman@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=Xsw4bh8PMFznn6F6qu3Dih39da2oNzNdYQmTQZY9vaQ=;
 b=Acz7UcyQj0cF/Y/knIyhlTWYR1hMs1HHgJJwDS5USLSDp678edrKQyc8WZyduVg0
 hDzRm8IsT6ruBFfvf8QHHnjwDYv1mE75idWGKo+/7Klkz2fUaqAybM2C7YsXLqx4D/y
 S5sTJ109Gkt7uBm9QN1am/7RijCEqAh78FTIqa6U=
Received: by mx.zohomail.com with SMTPS id 1732916676181235.41714579008203;
 Fri, 29 Nov 2024 13:44:36 -0800 (PST)
From: Derek Foreman <derek.foreman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: mripard@kernel.org, kernel@collabora.com,
 Derek Foreman <derek.foreman@collabora.com>
Subject: [PATCH] drm/connector: Allow clearing hdr infoframe
Date: Fri, 29 Nov 2024 15:38:01 -0600
Message-ID: <20241129213801.617864-1-derek.foreman@collabora.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

When a display isn't presenting HDR content, the infoframe shouldn't be
present at all. Currently if we set the HDR_OUTPUT_METADATA blob, we'll
set a Dynamic Range and Mastering (DRM) infoframe. If we remove that
blob later, the DRM infoframe will linger in its previous state, when
we expect it to clear.

Disable the infoframe when no output metadata is present to prevent
this from happening.

Fixes: f378b77227bc4 ("drm/connector: hdmi: Add Infoframes generation")
Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index feb7a3a75981..1cc4b49b1013 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -398,6 +398,8 @@ static int hdmi_generate_hdr_infoframe(const struct drm_connector *connector,
 		&infoframe->data.drm;
 	int ret;
 
+	infoframe->set = false;
+
 	if (connector->max_bpc < 10)
 		return 0;
 
-- 
2.45.2

