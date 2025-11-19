Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E81C6F39D
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 15:21:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F05EE10E639;
	Wed, 19 Nov 2025 14:21:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YuQl08ku";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBBA710E606
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 14:21:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B089844531;
 Wed, 19 Nov 2025 14:21:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9075CC2BCF6;
 Wed, 19 Nov 2025 14:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763562102;
 bh=f6GfQjehkKWl/LGMGUh9JdpxtbOydSanZ93bKCsBU8c=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=YuQl08kulOyYsMF3NQ6YA5F/j5dVhv859AW0GgR6we5w5T8/LENuyU+EcTVklqHrL
 zQxHgcX69o/EC3QXH/wl9Cva9/o88FUL1KYEwixxmXNvpavu59b0Cq05pQNVUE7IVn
 rRVN/zFsrFyvOUuJh8uJCMV79qb+9ab1lo6h/FFl3xnW6nDeezqGWWS3lheBTziEB4
 CP86e2epTgq2smAJ5NMbEBnJYQaGMZt7puF7p3d9bNTtzoJZAmGwGoMS2rvkMT67Y7
 moTzu/lbZSmQ8KD8UeY1xuSkukU4pXvVXBikAcPfna5mmR0hC7hXzQyW21RWTPbQeu
 Wm+PfYxl9Oa9w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id E5C7BCF34C1;
 Wed, 19 Nov 2025 14:21:40 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 19 Nov 2025 15:21:33 +0100
Subject: [PATCH v3 08/12] drm/panel: sofef00: Initialise at 50% brightness
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-sofef00-rebuild-v3-8-6cd55471e84e@ixit.cz>
References: <20251119-sofef00-rebuild-v3-0-6cd55471e84e@ixit.cz>
In-Reply-To: <20251119-sofef00-rebuild-v3-0-6cd55471e84e@ixit.cz>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=858; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=vjrHJH4EY6FJhDpprnzSkcksIGyeb+RoENa3mCki5mI=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpHdJycAIUQJO6bD234ZrR/h/NB7vOojf2vplRl
 PAgiirYhvKJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaR3ScgAKCRBgAj/E00kg
 cnckD/46GCXgYsqFV8C49iM5nrbVA72lwvKuHMFuWOtab2kV8MZ5DHFUybrXDC0fAy67KE2/MzI
 pK3XNS9LUEDEgj+AeI/TLPUHJVRd6PfGgch84M8laVBvt8s0/QALq42FbLors7adT4bk0QnNbPA
 /NDC8btbDp14EQmuRQQNcEf8lhdOct/1WeDIDc2YeUkROifgGeEhcJ9Tiuq7oX5sM8eQoSHPY3q
 KM2wq/y/Ar7WeLsMPktbcHbf/5tke6vjpGmXUshezjAO/Dgh17Tw8+v/ExUCG9PGn6XMaAJhjs/
 A2Nd4NPslOPcKFNlNw/vBR/OIUzfWlazu1RaOnnBjtXYdjmQ1zTQOjZSlBch5m0xZTOQF59fK+z
 XyMJ8kUsg8e8qg46FnATAinMbeDOOMz5uyrFdKWQTOGpd9FqZSezdtl5DeZ/Zeu4s7az9q89hNP
 cuW125TtHQrFjuY/aHbj/nuOLdHyg91RLD7m97PLAMFqHCZGnfgduXE6HH6rD8VWIvx+HyObhgZ
 qhnR3f/pqRodAD7kbmpyIWutCP9m9GgDrTPkEBoJPEo0oB/IftaMnf2Mn6Ct4KAKbMWdkVSsQaR
 r7q5MUb5gW7y/F1ueOSELI7TuMINOK311TI96eV9FYtVa8xeTkOjL0blraduAvzGPGyOQeuOUae
 FTcNzym0O8kMbuQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
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
Reply-To: david@ixit.cz
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Casey Connolly <casey.connolly@linaro.org>

Initialising at max brightness is not necessary.
Half brightness is much more comfortable.

Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/gpu/drm/panel/panel-samsung-sofef00.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-sofef00.c b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
index 0d3ae0689a19b..d1e5340d7e337 100644
--- a/drivers/gpu/drm/panel/panel-samsung-sofef00.c
+++ b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
@@ -204,7 +204,7 @@ sofef00_create_backlight(struct mipi_dsi_device *dsi)
 	struct device *dev = &dsi->dev;
 	const struct backlight_properties props = {
 		.type = BACKLIGHT_PLATFORM,
-		.brightness = 1023,
+		.brightness = 512,
 		.max_brightness = 1023,
 	};
 

-- 
2.51.0


