Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F85091B10F
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 22:54:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CEE510EB44;
	Thu, 27 Jun 2024 20:54:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gwmail.gwu.edu header.i=@gwmail.gwu.edu header.b="UmY7qnG6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com
 [209.85.161.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04C7B10EB24
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 20:31:37 +0000 (UTC)
Received: by mail-oo1-f51.google.com with SMTP id
 006d021491bc7-5c2253cb606so1051807eaf.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 13:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gwmail.gwu.edu; s=google; t=1719520297; x=1720125097;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IORRBfp0Ewdr4NJXGZVsVL9mCEVSyuiUr27OIsqu6N0=;
 b=UmY7qnG6gdKh34JavlwNB2dn5k/DwVRliDSiEEc2drdi+lyE2BmR7LQg8KXYyf7VXh
 Ut3euDcSMoqFlxYIMm/4xI9lNxIg6fjFqkfqZss2wiiSOeAdpxAIJy5x9dbU+oSKQ4lM
 lJYXs7KD8N9KkiU0k9fFX3/pn6ThrLWCt/TUyEQav4739fXGhMCtfDz1CK3UZd7nSw7A
 1bDtBqGQbJFI26wDEDLszwYXiK5imIB8MKgBwKXULTPuKLQC4/XtaIKquZBkVhutGmBe
 uuCzq64W+Q+XWvK/wCyInN/Do06WJnHpEOPJcQnZLeiI5udDZ5yfEmlacwe4llQbcI+q
 E57g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719520297; x=1720125097;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IORRBfp0Ewdr4NJXGZVsVL9mCEVSyuiUr27OIsqu6N0=;
 b=UgLYkejKHe9zp+NFAJJeOvPx9UC4CHY0JhDUjyRQvkt83wTaw8PR1npe9wNdRKvJFD
 q7dCYO6zwhKyLfMk3mHgNapFpV9W6cGQAe/kQOGdK3bCC/TQ+aUdzhXJViTm2htelXRa
 6vwYcYb38ZCxUn/Tw9kMFK8XjgUrCbmlJwe3kVgk1Jnnh1aQ8931UQvSB3g12gcs7efb
 k2Aw0o37A9EMrGP+Qkud+XedyQirsv0IuiENMAzKbQhJLUzDREjJth95WzsRYUVq6q8R
 RGB/BiPbZi0asM2qE7W25AsA7x6cSCG1m/paQxUFTRTE3/l082M4Sklurqkv17UPZpWU
 J0oQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqC5upy1fo43rhhneAZieqqsLO62Hk8ixLnpGwggB5JIGM30NsZJyhTCiJqsucEqYviqauDjecf7iGVsKWkknwSLHyC5DTP6lAbyuKfWNO
X-Gm-Message-State: AOJu0YxYMul14sDOfXa5p2kC5ex8vjaCjgEG5gZernmazx48G1DFBMuT
 q2G4gn1SM22ZPqFZi7qjELY2x2C9P7l6/ZccNg+r9VinGB0+3Uu05UqHx1futg==
X-Google-Smtp-Source: AGHT+IEBJYSCM9h1b35iPFvP+zkfebU7K58zBaeRlZZJLp0lbUnbdhB4vQ78TWCJKZsLanCWzd/izw==
X-Received: by 2002:a05:6870:71d4:b0:258:3455:4b37 with SMTP id
 586e51a60fabf-25d06eff0e4mr15152508fac.59.1719520296945; 
 Thu, 27 Jun 2024 13:31:36 -0700 (PDT)
Received: from aw-m18-r1.. (syn-023-241-237-137.res.spectrum.com.
 [23.241.237.137]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70801e63250sm140514b3a.29.2024.06.27.13.31.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jun 2024 13:31:36 -0700 (PDT)
From: Matthew Schwartz <mattschwartz@gwmail.gwu.edu>
X-Google-Original-From: Matthew Schwartz <mattschwartz@gwu.edu>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Schoenick <johns@valvesoftware.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Kyle Gospodnetich <me@kylegospodneti.ch>,
 Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Matthew Schwartz <mattschwartz@gwu.edu>
Subject: [PATCH v3 2/2] drm: panel-orientation-quirks: Add labels for both
 Valve Steam Deck revisions
Date: Thu, 27 Jun 2024 13:30:57 -0700
Message-ID: <20240627203057.127034-3-mattschwartz@gwu.edu>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240627203057.127034-1-mattschwartz@gwu.edu>
References: <20240627203057.127034-1-mattschwartz@gwu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 27 Jun 2024 20:53:57 +0000
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

This accounts for the existence of two Steam Deck revisions 
instead of a single revision

Signed-off-by: Matthew Schwartz <mattschwartz@gwu.edu>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index ac8319d38e37..3f84d7527793 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -420,14 +420,14 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Galaxy Book 10.6"),
 		},
 		.driver_data = (void *)&lcd1280x1920_rightside_up,
-	}, {	/* Valve Steam Deck */
+	}, {	/* Valve Steam Deck (Jupiter) */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Valve"),
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Jupiter"),
 		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "1"),
 		},
 		.driver_data = (void *)&lcd800x1280_rightside_up,
-	}, {	/* Valve Steam Deck */
+	}, {	/* Valve Steam Deck (Galileo) */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Valve"),
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Galileo"),
-- 
2.45.2

