Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0727DDE49
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 10:19:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C430710E67C;
	Wed,  1 Nov 2023 09:18:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D8D010E66E
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Nov 2023 09:18:43 +0000 (UTC)
Received: from [127.0.1.1] (91-158-149-209.elisa-laajakaista.fi
 [91.158.149.209])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0F6751C1D;
 Wed,  1 Nov 2023 10:18:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1698830305;
 bh=OSH8ynuiJ2YVkYrZuWQq2MVjAg+Zul2OXF3bZ5EaKoY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=dAbxEauTggKPBtvsLnTgVxvWaN51QrLuJNaTEEl3DVqw9QseUa8JBoFOKtKTJk4/B
 NKF+dbkFvR5sgddorjc/PJjo2yisNgv9W6fG56YeAYj6n7PuYRVrtOlFu5h4Yxx5pi
 wxL8hRRQqvGLAQlysHgUcHB6eIeSXf6GslDZexQ0=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 01 Nov 2023 11:17:47 +0200
Subject: [PATCH 10/10] drm/tidss: Fix atomic_flush check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231101-tidss-probe-v1-10-45149e0f9415@ideasonboard.com>
References: <20231101-tidss-probe-v1-0-45149e0f9415@ideasonboard.com>
In-Reply-To: <20231101-tidss-probe-v1-0-45149e0f9415@ideasonboard.com>
To: Aradhya Bhatia <a-bhatia1@ti.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1701;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=OSH8ynuiJ2YVkYrZuWQq2MVjAg+Zul2OXF3bZ5EaKoY=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBlQhfowmaSVl6BO4E/HgJrUUSCbYheTzOdaTI7j
 cPYBH4VqoyJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZUIX6AAKCRD6PaqMvJYe
 9eIYEACPcoPMlIy8n0o9G8hXcsLaHmiclB9/T6IHAxb7QlmvPnQG5uC4ENthjLwTslHTcm9AKI3
 cZ9lB9izizrFbL0x/lKcOPbFBScAOw1ADcOXo/4ECGzcCcZaFXMSmR0lJkd4INJ9PGnCIR9Bb99
 R55+b+J0BFFDqBd1GEMjWlrRHp7kZWFsNEm5eZgOcbSiX52yQwzF2+kam2CjGIeZ5vnuxS0wB6g
 YEm972d2h9Ffn728GLcoqlRb/r5wQmWVeHecmiKLkEmUKZOUzScS3s0XmtrfCAi64iDazfjT5/r
 F1JGSOsp6PWWoreiAhrDb77x4Y0K1B/2NAeIYeMcI8RzZw1hnnch8Il8D1pLjO9bqsbCN2WVDO+
 bf7Q0zjCCv4Xlo2/6SP+bPr15R+VZWfjDne8l22OtOc/cFXUMjh4utEtuDAu5AGWgFEJyf5oi8I
 DGPku/a64Y9TmVtYTrvK7EWrk7tD2XU0piwij6GK1sidpzk1F4mysb0O6xVl4GfIk6S5k515MrS
 ws599EtVW10LYkxigCxnBtQcETXPA1tePRLPE/oBDJHgOVBw/adQ09KpmomET4rplN7FhSCGMjM
 CHraJxTbEKvPg9JdknRS1e2MTspW5EtMUvERx/b9S0ONGSLaw1AP0sNTAcFamjFSOvAQBouPhb9
 ztjKjvBih4QbYmQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tidss_crtc_atomic_flush() checks if the crtc is enabled, and if not,
returns immediately as there's no reason to do any register changes.

However, the code checks for 'crtc->state->enable', which does not
reflect the actual HW state. We should instead look at the
'crtc->state->active' flag.

This causes the tidss_crtc_atomic_flush() to proceed with the flush even
if the active state is false, which then causes us to hit the
WARN_ON(!crtc->state->event) check.

Fix this by checking the active flag, and while at it, fix the related
debug print which had "active" and "needs modeset" wrong way.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_crtc.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_crtc.c b/drivers/gpu/drm/tidss/tidss_crtc.c
index 5e5e466f35d1..4c7009a5d643 100644
--- a/drivers/gpu/drm/tidss/tidss_crtc.c
+++ b/drivers/gpu/drm/tidss/tidss_crtc.c
@@ -169,13 +169,12 @@ static void tidss_crtc_atomic_flush(struct drm_crtc *crtc,
 	struct tidss_device *tidss = to_tidss(ddev);
 	unsigned long flags;
 
-	dev_dbg(ddev->dev,
-		"%s: %s enabled %d, needs modeset %d, event %p\n", __func__,
-		crtc->name, drm_atomic_crtc_needs_modeset(crtc->state),
-		crtc->state->enable, crtc->state->event);
+	dev_dbg(ddev->dev, "%s: %s active %d, needs modeset %d, event %p\n",
+		__func__, crtc->name, crtc->state->active,
+		drm_atomic_crtc_needs_modeset(crtc->state), crtc->state->event);
 
 	/* There is nothing to do if CRTC is not going to be enabled. */
-	if (!crtc->state->enable)
+	if (!crtc->state->active)
 		return;
 
 	/*

-- 
2.34.1

