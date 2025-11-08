Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C961C42D68
	for <lists+dri-devel@lfdr.de>; Sat, 08 Nov 2025 14:44:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A02310E08D;
	Sat,  8 Nov 2025 13:44:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.b="m5hAAXLj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB5F510E08D
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Nov 2025 13:44:34 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-afcb7ae6ed0so279919366b.3
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Nov 2025 05:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1762609473; x=1763214273;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ab0dNgePo+ve9gQ9R7d2FYgAaNZrPU8kUu+qmhjPbGo=;
 b=m5hAAXLjj7D0veTSWOBJtR1SltsrpYE2n/6U1hFOoU30Cl6Lu1CoJvyXjO/0WdGVdA
 exA5jAk/K0vlbdnbixIfJl2BQ56ZBi2pQtdmNFrUyHLLvVD+gMimTtX0vUSaGumrYlfl
 ijp45yVqguXWoKHL+kxnKbHLw3CHVRuFOl/PMqOGUVI0AP37l5bO/qH7eAAbBtRwHgPh
 q3RULwgBO3hrQg3y29IDCzyJyY473gCsfQ8f5a6kXWTYFhXx/LZhjVrGyzWlBuNoN6A/
 rfcpy5X8jAWd4KH6J/iV6bD1+MgqV5Orovj+kTZziHhYmcYDc62RoamzzUSfD99TAO7y
 7Smw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762609473; x=1763214273;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ab0dNgePo+ve9gQ9R7d2FYgAaNZrPU8kUu+qmhjPbGo=;
 b=iqrKpNzpp0nSlInC2VJSbOyJDyL1NeE6lNprcCFJh9yITVVntzbjnEEPTO55MORjWb
 Eb67cZUeWjx/JgxQyFSrzXsnGAJ0g+w/GfZ/N3h4Z/PyuXgVaMattP9taziy6WXKk22y
 ocR+5Rs4OyVaLVv2yYiOCBHy0DxXcFZTqVMLaWr5ncogXrwc3HgipliMbGWXbk7mcMGy
 87n857dOyTwIbn3+syjKRcY98urLIy10q2HMS074rqTrlWDZRDmi8Cpa9HjYZtfanC3M
 TbQmv2UslLYGkp0ZHvVuOUbG7Op9qDTjRu5EvhATE8IFxwMOODyTwGbbzFse8qSmDD7e
 J9tA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXA2tfABwP8s9mvOt13VTKcAKVIcjPt8H/mu/7enMjwqAe21Ps9uLV2QKLIDGi5wvWkrKILZ2L36Z4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxjv6qgpXQfaVcw7JYgH3UAQv/voE9vQr9QrKEzsZz1WLFgiFXB
 JFXMLZhIFdCIjYJHlYO9pgtqWGByEpcpg2QfuZBPJx/qjRTPf0pcdY99
X-Gm-Gg: ASbGncuCNv04/FoD8tzkScAmIvMMzG1CrznEfRosfzXwMjvCEXK9VkwTz+WAPs7C+Li
 M/+aMVts//toYzkOkjYgxjc15DDWIl/ggTKugKTHYoyWZHZkQuuUs1L0DpD/r+R3MNy1zVheiMy
 YHUl4R5KzNKG2hP/2mTQ8JwSPYBIKLHsdv3JTsrrUA608AkV+mxMyUKFriOS/auiofWN7txb6r/
 Wlpd+0i/NrFsoSD6BRnVB8DgEoOfzHxzUogXQN9JfT0KdOX8OUq3KpBzhF+9jQg8Wt9lpbjJpOp
 dCDpKJejF86pfmTCiD81h0vFGI4daLEAnTbqR+j58gHPQCcpPnXqRg72ikSJZLw651ytZuFldzX
 U/lJyUkgQYeBzo1UiApz6Y6b97Oe9/WqX2vcf+JqK8AkQPzx2WAsjzXI/QbN3lwB983MiS/Y5hD
 pny3w7jAX7siUkVjjPAcsHAMpUH9b9Q4SHoUaqMPnjoCZGBEFH8B6w2PTFe4JaeBhFoiiv0HC1U
 kZFjwukQ7tMXY/q7xvLJWmC8uEzptjrS1VS3oKyjF2BsyoGFu2B
X-Google-Smtp-Source: AGHT+IE3t5XHoEClnas6c0fwEVjyNk2axByTaO1rMD+gsebxQxdsSRmYQhKPt6+QjmiTNvXr08iIdQ==
X-Received: by 2002:a17:907:6e8f:b0:b6f:9da9:4b46 with SMTP id
 a640c23a62f3a-b72e056cc6dmr230845266b.43.1762609472959; 
 Sat, 08 Nov 2025 05:44:32 -0800 (PST)
Received: from blackbox
 (dynamic-2a02-3100-ae88-0800-1e86-0bff-fe2f-57b7.310.pool.telefonica.de.
 [2a02:3100:ae88:800:1e86:bff:fe2f:57b7])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-b72bf97e54asm531374566b.34.2025.11.08.05.44.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Nov 2025 05:44:31 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, tobetter@gmail.com,
 christianshewitt@gmail.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH RFC v1] drm/meson: venc: add support for HDMI DMT modes up to
 3840x2160
Date: Sat,  8 Nov 2025 14:42:36 +0100
Message-ID: <20251108134236.1299630-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.51.2
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

Commit 5d0bfe448481 ("drm/meson: Add HDMI 1.4 4k modes") added support
for HDMI 1.4 4k modes, which is what TVs need. For computer monitors
the code is using the DMT code-path, which ends up in
meson_venc_hdmi_supported_mode(), which does not allow the 4k modes yet.

The datasheet for all supported SoCs mentions "4Kx2K@60". It's not
clear whether "4K" here means 3840 or 4096 pixels.

Allow resolutions up to 3840x2160 pixels (including middle steps, such
as WQHD at 2560x1440 pixels) so they can be used with computer monitors
(using the DMT code-path in the driver).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
I'm sending this as RFC as I'm hoping to get some comments on the
"4Kx2K@60" note from the datasheets.

I have tested it myself on a GXL Le Potato board using a computer
monitor at 2560x1440 pixels.

This is the spiritual successor of a patch titled "drm/meson: add
support for 2560x1440 resolution output" from [0]

[0] https://lore.kernel.org/linux-amlogic/20250927130239.825060-1-christianshewitt@gmail.com/


 drivers/gpu/drm/meson/meson_venc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_venc.c b/drivers/gpu/drm/meson/meson_venc.c
index 3bf0d6e4fc30..4abd0c09b442 100644
--- a/drivers/gpu/drm/meson/meson_venc.c
+++ b/drivers/gpu/drm/meson/meson_venc.c
@@ -868,10 +868,10 @@ meson_venc_hdmi_supported_mode(const struct drm_display_mode *mode)
 			    DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_NVSYNC))
 		return MODE_BAD;
 
-	if (mode->hdisplay < 400 || mode->hdisplay > 1920)
+	if (mode->hdisplay < 400 || mode->hdisplay > 3840)
 		return MODE_BAD_HVALUE;
 
-	if (mode->vdisplay < 480 || mode->vdisplay > 1920)
+	if (mode->vdisplay < 480 || mode->vdisplay > 2160)
 		return MODE_BAD_VVALUE;
 
 	return MODE_OK;
-- 
2.51.2

