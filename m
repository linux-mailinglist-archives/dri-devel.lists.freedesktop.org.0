Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CED494D65F
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 20:38:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD84B10E9D2;
	Fri,  9 Aug 2024 18:38:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="Td6V1FO9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com
 [209.85.221.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8D4410E9D2
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 18:38:21 +0000 (UTC)
Received: by mail-vk1-f172.google.com with SMTP id
 71dfb90a1353d-4f6bd3a7bbdso931521e0c.3
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Aug 2024 11:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1723228699; x=1723833499;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1hvEHHDE5XBXD0uX2qdEdsVYLJ7WbB93WL608w3I2Jw=;
 b=Td6V1FO92pUesBVXjXbdv33S8l/+SIV7ZtBMzDYhc7K8bOng1LmaURRitZbph+E14S
 M3mxkqjWfGRiFC18BMK9AgN2EWTfhFb7CiknfthoweCs+QF07WfVTN1qaDgveIRhjpNJ
 oyLrb3BIJhm0zRFEMTMdSgD2fD3ROzMKq/5+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723228699; x=1723833499;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1hvEHHDE5XBXD0uX2qdEdsVYLJ7WbB93WL608w3I2Jw=;
 b=KAxD+ECMXk4RQxpX0iGwFwcKW6zmh4ys0GS7i4locOwxTdAnhuFtmE5exeisUt11k1
 Z5EDlwtatRgM9LPB/1MeKEWLLlT/rLP14xiWYbQMi3WD7pjDBncv2oDzRcsbbWBAuqbN
 HnVCbY0PJjVAUdGZVuHxnAcMMDBhFSq5VT+8QnsDle6+qThHp6oMtJw9MFO7266PF6HH
 yPNqjYZM7/5fQNZJR7jzOqZDaNCLbkTiOkZlWQCAnpKTFfI4UqARZzaJeVyYeI9H+tPe
 B0yqEQzqQtJTntCTuPpKYGJV1Jt3ASJSVBLuUrkqp7LBSEaxZQha4//l9vN+FeBeXFFL
 bgZQ==
X-Gm-Message-State: AOJu0YzY4wbVaEtLsmeVSV76LEKVzUnm8fr5l9TCH2IMRl9iLBQm2ZOk
 8irX1yeQQceN9GJjqfkj//mh97faljGXO5uH1DfQRnMA/XaCBW24xBRm+uqS+xFF53cWITT1BHx
 wm5OADVZGEnAPfPHlDskEAFHr1gFtpRDvZfUE//yFqnpS06oOzORc2i8Vi8JBOHCFqOiez/syAA
 c8nbhKiux+m6P7NXZKqr7PQAh2Zx+HTWO42XPuytppmtUvkXIHHg==
X-Google-Smtp-Source: AGHT+IERNO2uWZbsJC+JGg0FlMwNw79+Y3Sa7t70Ktnvjg6GO2ODeoDCd3HKuj05tOSNofqKSFDbzg==
X-Received: by 2002:a05:6122:1d8c:b0:4f5:1978:d226 with SMTP id
 71dfb90a1353d-4f912bd338bmr3142773e0c.3.1723228699378; 
 Fri, 09 Aug 2024 11:38:19 -0700 (PDT)
Received: from localhost ([192.19.144.250]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a4c7df55d7sm3430685a.74.2024.08.09.11.38.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Aug 2024 11:38:18 -0700 (PDT)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, zack.rusin@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Ian Forbes <ian.forbes@broadcom.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH] drm/vmwgfx: Handle possible ENOMEM in
 vmw_stdu_connector_atomic_check
Date: Fri,  9 Aug 2024 13:37:56 -0500
Message-Id: <20240809183756.27283-1-ian.forbes@broadcom.com>
X-Mailer: git-send-email 2.34.1
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

Handle unlikely ENOMEN condition and other errors in
vmw_stdu_connector_atomic_check.

Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Fixes: 75c3e8a26a35 ("drm/vmwgfx: Trigger a modeset when the screen moves")
---
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
index 571e157fe22e9..3223fd278a598 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
@@ -886,6 +886,10 @@ static int vmw_stdu_connector_atomic_check(struct drm_connector *conn,
 	struct drm_crtc_state *new_crtc_state;
 
 	conn_state = drm_atomic_get_connector_state(state, conn);
+
+	if (IS_ERR(conn_state))
+		return PTR_ERR(conn_state);
+
 	du = vmw_connector_to_stdu(conn);
 
 	if (!conn_state->crtc)
-- 
2.34.1

