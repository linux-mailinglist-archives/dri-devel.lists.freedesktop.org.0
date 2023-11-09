Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8370D7E647C
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 08:39:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 919B110E1D0;
	Thu,  9 Nov 2023 07:39:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6327810E1CA
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 07:38:52 +0000 (UTC)
Received: from [127.0.1.1] (91-158-149-209.elisa-laajakaista.fi
 [91.158.149.209])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A50561BB1;
 Thu,  9 Nov 2023 08:38:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1699515509;
 bh=bQWW0pZKCuRvL4IYy0nb/sJkN3i+ZB5gIxx8kN/IznA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=l0LuD9VGb7eGrWm9XEivrXjRtUJffMyYuUz8AQ6e05CYLu00NmxUHnvlSb+FQgE+y
 zsRrT1lF6oCv6DOcX/wzDPsJ4CED71YeadhcEuDEd0bPG2ZFIljZSqKT3LjR9ohx/J
 ins6WciQkLFs+8jHswhDa6gmUT0DT23Oyp+fHJWE=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 09 Nov 2023 09:38:03 +0200
Subject: [PATCH v2 10/11] drm/tidss: Fix atomic_flush check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231109-tidss-probe-v2-10-ac91b5ea35c0@ideasonboard.com>
References: <20231109-tidss-probe-v2-0-ac91b5ea35c0@ideasonboard.com>
In-Reply-To: <20231109-tidss-probe-v2-0-ac91b5ea35c0@ideasonboard.com>
To: Aradhya Bhatia <a-bhatia1@ti.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1862;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=bQWW0pZKCuRvL4IYy0nb/sJkN3i+ZB5gIxx8kN/IznA=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBlTIyAJ1HO4rcoZbtH19be+oc3Ci8occSFZkPT1
 5g9ExgrbdSJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZUyMgAAKCRD6PaqMvJYe
 9aK4D/9TZFHEorS4CIO2opcLsKveOvHzSNF7GVjMUdyC2+VwtHV9aOK9w/GH+Fg1ulHRhV0who3
 wzU5oEyy03kPxpgx+6ZqG4/GOCOGCSzZecZsxxWInNhKE+PwhwUuZgZFRWf+TDN4buVb8uuzKkL
 HPYOUwzGzLeOK4L+6cA9nyCg7xSJf9XpEchNWbPk63ZXTdld0G72d51K6OYL5Awu8L0D0ALwrHo
 yHYyiv2lqSkY/jtElucHxmYqocQS2rhJ6mSCyJXOrPQkpqYyI/Jg3EtV51w7QjE+c7M3ANBdAk4
 CBxPZSYB3fwR3lHjYU2XFxF64H+lR+hW9gZq/+49RHo5c3yUNwKjl+reS1jp7BZk3XHm1H7IXiv
 Sda2sKpeDnduAIjtJLmyxo9ouB7VY4l3G8A/ZJad3w20DhrO0E2by5+fcCg0Q0LImTPkLK/ZbT/
 hFX6yIQmJE8pAFyJcRnUalWwQ6NfPuGBu5bqlGfjkNoosx76nfD3/2VKn9ehFwaBf2EUhu1Nhaa
 UAG0If8UvUjSSfwm/YphrmKHrUfK+r24knzPvZ/zloNF7FT77oElqqi5vHopO55ysk5lhlqaOnw
 a87SxnFzLV1lkW8zg5/rsp7EMO4W0RgTS5bypPky4PnIwafKPwUCqSRhhVdwJ9yMjNEH5i6B9Xm
 dLMJIvlAcjXrK8w==
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
Cc: Francesco Dolcini <francesco@dolcini.it>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
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

Cc: stable@vger.kernel.org
Fixes: 32a1795f57ee ("drm/tidss: New driver for TI Keystone platform Display SubSystem")
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_crtc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_crtc.c b/drivers/gpu/drm/tidss/tidss_crtc.c
index 5e5e466f35d1..7c78c074e3a2 100644
--- a/drivers/gpu/drm/tidss/tidss_crtc.c
+++ b/drivers/gpu/drm/tidss/tidss_crtc.c
@@ -169,13 +169,13 @@ static void tidss_crtc_atomic_flush(struct drm_crtc *crtc,
 	struct tidss_device *tidss = to_tidss(ddev);
 	unsigned long flags;
 
-	dev_dbg(ddev->dev,
-		"%s: %s enabled %d, needs modeset %d, event %p\n", __func__,
-		crtc->name, drm_atomic_crtc_needs_modeset(crtc->state),
-		crtc->state->enable, crtc->state->event);
+	dev_dbg(ddev->dev, "%s: %s is %sactive, %s modeset, event %p\n",
+		__func__, crtc->name, crtc->state->active ? "" : "not ",
+		drm_atomic_crtc_needs_modeset(crtc->state) ? "needs" : "doesn't need",
+		crtc->state->event);
 
 	/* There is nothing to do if CRTC is not going to be enabled. */
-	if (!crtc->state->enable)
+	if (!crtc->state->active)
 		return;
 
 	/*

-- 
2.34.1

