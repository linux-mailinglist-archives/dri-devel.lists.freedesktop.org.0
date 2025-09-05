Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA99B459E7
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 15:59:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F311D10E375;
	Fri,  5 Sep 2025 13:59:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GgIuW4Bu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C95D010E375
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 13:59:00 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9BF1EF09;
 Fri,  5 Sep 2025 15:57:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1757080669;
 bh=9LxxYhOkJgXUvxE2ZO4TrHjls5tQc2g6KQ5jlrd2xUk=;
 h=From:Subject:Date:To:Cc:From;
 b=GgIuW4BuEzKLQei3pMC5Edx34buE2i/iqREHUH695VXOYk7qFYxun52nPYwLbjOpW
 G/a7Su4cVbVecaQTzqvZvlSFnxlWikxrWzysuBNnWSkHt94VYhkCBC0oHSiK/4cAi4
 vf7BQtD3YpR0bSV00mEQzMClmG5ZPPl8HjzKXk+k=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 0/2] drm/tidss: Fix issue with page flip timestamp on
 enable
Date: Fri, 05 Sep 2025 16:58:05 +0300
Message-Id: <20250905-tidss-fix-timestamp-v1-0-c2aedf31e2c9@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG3sumgC/x2MSwqAMAwFryJZW4hVQb2KuChtqln4oSkiFO9uc
 DcD814BocQkMFUFEt0sfB4qTV2B39yxkuGgDhZtjyP2JnMQMZEfpZ0ku/0ysUMfBkuhxRF0eSX
 S4H+dl/f9AOCPdQ5lAAAA
X-Change-ID: 20250905-tidss-fix-timestamp-f40cd82ed309
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=765;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=9LxxYhOkJgXUvxE2ZO4TrHjls5tQc2g6KQ5jlrd2xUk=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBouuyeFWGVBsF4GOdkJTxKgD7opR6+5vfxTy+uG
 C6aG1GFol6JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaLrsngAKCRD6PaqMvJYe
 9SU2D/9RRtZ9XeXYOrDFhK5MPJ7Cdkpu0mMwNz9DaqP90uKts0AmesMe+OFZGFqN9XEj+8ACS4z
 48rqeQSi9n5q0TcLC59NLYsQXhwKkJiblKJ1HbuuSp0JEa1wQ3imkTScuqh0l43Evhl//G3Gs6D
 CXT1HuOo4OpjI0bx8zVN0zF1c/uGuLIMeGIftkg3tqPpx/YMkeDRd9NwxQWFzgSKwq/+EVuyelP
 tcUB98etNUCvSlrqMDWjGksiPSLEz6A6H8N+LLoPg/NiXAet0OCPWHjtCDVXvNL/nfuzfo5gLnY
 H2H1ThU3Vi3rwYCaxIKA/INlHwT8jC6H8x1BGTsrJkQICNEM0bSvYLCkDEqnN4OxI94Nrm/6VXx
 4zZocSDyLL3NbHqI7ZGBvZ7OIOgK1ZHFaS14emUhXr2k8YrXNqCUDrwYc3eZ5qXVAu1EuimwfBO
 MROs568TEkrWJaWvfIOtnfJu2pCMypR3R+rrg070LF9GLgXRj/B1yl0VZTBHob34H4FXjsBJspE
 cwnvT4mgrp3lPmNEXvAMvOhb3qOCDLmQSlVQ+2ry0thr39zqDT4rk+3p1/uera2arQ8TNpTaFhM
 8+mDAxd+zQ2R4HrjRbMtyp3BKqxOjoD7Tjr7FElz+edzd4kft4vAVBp9QjTRs9PWT2FYO9l9r8W
 CkNdnbSxVg1MszQ==
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This fixes an issue with the page flip timestamp being 0 on CRTC enable.
See the second patch for in depth explanation

 Tomi

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
Tomi Valkeinen (2):
      drm/tidss: Restructure dispc_vp_prepare() and dispc_vp_enable()
      drm/tidss: Set vblank (event) time at crtc_atomic_enable

 drivers/gpu/drm/tidss/tidss_crtc.c  |  9 +++++++--
 drivers/gpu/drm/tidss/tidss_dispc.c | 22 ++++++----------------
 drivers/gpu/drm/tidss/tidss_dispc.h |  3 +--
 3 files changed, 14 insertions(+), 20 deletions(-)
---
base-commit: 03e7ae93c6e32206797c13118659a966ae84a3bb
change-id: 20250905-tidss-fix-timestamp-f40cd82ed309

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

