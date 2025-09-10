Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C7EB51DFE
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 18:40:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A1DF10E970;
	Wed, 10 Sep 2025 16:40:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sigxcpu.org header.i=@sigxcpu.org header.b="KVg4UAqh";
	dkim=pass (2048-bit key) header.d=sigxcpu.org header.i=@sigxcpu.org header.b="ASTI7upd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F14D10E970
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 16:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
 t=1757522445; bh=gGA8cxzPPsutuIQEV9d2uVQQve6kWVH4sV8F3OXwkNw=;
 h=From:Subject:Date:To:Cc:From;
 b=KVg4UAqhExq5W4BPJ0AUN6X9ac+QyfeuqfcqPeEvbpOCTDV/f1H16raNanB2zNg5d
 oBSLw+IOuHRRxvJRBwzfKoHPaPEkccmPDyQH7ohamoLcmjKWPSVbqHuwTGvEIhtJ2E
 Pb1NJcpw4Qx0lH+j9cDiquvlVpj8DkIV9ezoZmqOacvoIEECRWZbZMAG6dyL7IRAm8
 eAC2mNl7zqeY/yevbW3wHQRBMPGmPLG5V1H2yQ9h+wS1caCw/PyRn2TQhHkV7Mu53M
 scz7Xp3wjOYs22nTBMo6ewVntSKKXZZDewgQSbn6ujdojRShh/5kwrnGCCXlUBBGtr
 pzUGnHw6QjlAQ==
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id C7C77FB08;
 Wed, 10 Sep 2025 18:40:45 +0200 (CEST)
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jZ6L5AInDSPs; Wed, 10 Sep 2025 18:40:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
 t=1757522442; bh=gGA8cxzPPsutuIQEV9d2uVQQve6kWVH4sV8F3OXwkNw=;
 h=From:Subject:Date:To:Cc:From;
 b=ASTI7updRCjTGFaeNzPiRlJfEeiO76QbNEdX5hJmAQ70gkshVAG3HHrJc6yvopGC/
 9h2jNEnAUay1NilDt3rBCDB/kKOmQyvmx3a/Sky7QcvGSqw9QfRK8ObCXn4SKX4gvI
 welO+SWrl+11RioqOgC66OZr/hVebasnDRWN4C+TAhOFwR5pXHksyQYB0/PEZ+LG12
 M4EDVr61o14M+FcJO32BttYVbgR0FbwWqr318YQ9UhNJYuJdg+RR9QPbUOqt5UwAUD
 2Now39vf+vibjTE2nSZTRj3X/4rcs2mVuqpOlGEyB2jQxbSjwGGdxj4tDKhMn+eUlE
 wD7USndeOFcTA==
From: =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
Subject: [PATCH v3 0/3] drm/panel: visionox-rm69299: Add backlight support
 and small fixes
Date: Wed, 10 Sep 2025 18:39:55 +0200
Message-Id: <20250910-shift6mq-panel-v3-0-a7729911afb9@sigxcpu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIANupwWgC/3XMSw6CMBSF4a2QO7amLS0PR+7DOGjhAjdRwBYbD
 GHvFkYa4/A/yfkW8OgIPZySBRwG8jT0MdJDAlVn+hYZ1bFBcql5yQXzHTVTdn+w0fR4Y6Uubcq
 LHKtaQjyNDhuad/Byjd2Rnwb32v0gtvUvFQTjTClllbG2MWjOntq5Gp/HwbWwYUF+AtkPICNgj
 EZd6LrIRf4NrOv6BncWShDvAAAA
X-Change-ID: 20250901-shift6mq-panel-959b3087ecd2
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Matthias Kaehlcke <mka@chromium.org>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1308; i=agx@sigxcpu.org;
 h=from:subject:message-id; bh=gGA8cxzPPsutuIQEV9d2uVQQve6kWVH4sV8F3OXwkNw=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FJQVNXL2hsSksvT
 UhqQWNzbVlnQm93YW56NUczUjJTZHRRLzFMbHZUell0UFZPanRWCjd1ellWY0V0ZGdJcjFBd2xZ
 UkdKQWpNRUFBRUlBQjBXSVFSajlzemZsaUtkQ1NocktzTWx2NFpTU3Z6QjR3VUMKYU1HcDh3QUt
 DUkFsdjRaU1N2ekI0eUQyRC80ekV2Q3dKS1lsS0hEcDJGSWVmb3h4bHVkZHl3bDNGdjFOWVd0TA
 pWT3p0QTFHempHSVpGRW1EZlBjSUdJUXdqbnExMkd5UjA4UXJSUDE0VXFEQ2dCT2JreCtVbGpsY
 29KdVhrOHcrClNVM0N5TjFyWFFWdnlQQ2hmWkxiSmFWUUlrL0RRRm1pMVpDUWJ5RHRlc2lnUFlD
 K2NZNkViN0Y1R0p6ZTN4VzEKeHU1RHFyOVVtVWYvaUNzVzZucmN2WngvWUdYcXd5eVdoVm44OUJ
 QRzEvbUJhZjhTRTkvcFJXakYxUHFza2plcwo3dXYvNGFwL3VYcnpHc3lpRVNkZDlOMmcxVjhEZV
 VGdHQwSG8xVk9WeVdWZDZZTW1IK0RzZ25WZmM0Zit1S3drCkxTazc1VjlTZHQwejhWMW5sYjdlK
 zRPaXpUT2IyN0VtMCsrTXkzWkgvcEtOc2REUUwrZndrR3hhN2g1OHdpZFkKaVRjbjA0SXZBbVhC
 NHpkYTJVUklaQjVFQ1hqaUdxd3V5dlR1YVlyYzhERVRkNkp1bktUSUVpRjdaLzRLSGdWZwpBSmZ
 MZnFxcnhFNGhZcUxBM21TanN0eENHVHN5ZTl4WUFjY05YSW1lZmZ2aTBXdFg0cFFXWjAxSzB5SV
 I3a1UwCk1mYlZJMVRWN1gxMlhPZ0llbTFZVjFuOEFQckNUakVFc1grMHNYTnY2dGNvdllVeU5HT
 2g3cEdjS1ViTTF0alcKRFg1ZDZVQ25KTlB1VERHSXltQzhvNWdoQm5TcWluYldaRXptd3gwWDl4
 UnRnZHkyQXN5YUhCRmNseGFGOHdsWAo3Z25CQTJ1WnpmUjdEVVpPdEdVbExtMmdxemhDN0dOcmt
 Fa1BxSld1MTBYaHE2ZlhnaDdoRTZ2ZmJCb1pBZnZiCmJCYzdUdz09Cj1ZK0NlCi0tLS0tRU5EIF
 BHUCBNRVNTQUdFLS0tLS0K
X-Developer-Key: i=agx@sigxcpu.org; a=openpgp;
 fpr=0DB3932762F78E592F6522AFBB5A2C77584122D3
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

This adds optional backlight support via DSI commands. If
a max_brightness is set in the panel description the backlight
is created.

While at that we fold in the already sent out clock fix and
a fix that prevents us from clearing all mode flags when we
only want HS mode.

Signed-off-by: Guido Günther <agx@sigxcpu.org>
---
Changes in v3:
- Use clock formula in `visionox_rm69299_1080x2160_60hz` rather than the
  calculated value, thanks Dmitry Baryshkov
- Link to v2: https://lore.kernel.org/r/20250906-shift6mq-panel-v2-0-aa5e585d8717@sigxcpu.org

Changes in v2:
- Add Fixes: to the first two commits to make backports simpler
- Collect Reviewed-by:, thanks Neil Armstrong
- Link to v1: https://lore.kernel.org/r/20250901-shift6mq-panel-v1-0-444b4abbfaea@sigxcpu.org

---
Guido Günther (3):
      drm/panel: visionox-rm69299: Fix clock frequency for SHIFT6mq
      drm/panel: visionox-rm69299: Don't clear all mode flags
      drm/panel: visionox-rm69299: Add backlight support

 drivers/gpu/drm/panel/panel-visionox-rm69299.c | 71 +++++++++++++++++++++++++-
 1 file changed, 69 insertions(+), 2 deletions(-)
---
base-commit: b320789d6883cc00ac78ce83bccbfe7ed58afcf0
change-id: 20250901-shift6mq-panel-959b3087ecd2

Best regards,
-- 
Guido Günther <agx@sigxcpu.org>

