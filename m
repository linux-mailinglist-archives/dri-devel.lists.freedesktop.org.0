Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC819C3324D
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 23:16:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A8D410E674;
	Tue,  4 Nov 2025 22:16:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LyZncVkn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB56E10E674
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 22:16:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A6B9243C95;
 Tue,  4 Nov 2025 22:16:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 77641C4CEF8;
 Tue,  4 Nov 2025 22:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762294574;
 bh=PMJI57pPFLnWADx4D5rtUwHi6yehpBQw9oto6JRqah0=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=LyZncVknhUCw0m4emfG5lprqrjnnWjuY6IjiAT1bJgihIgb7UYvGp9C+9l3viV2qn
 e+RQMt2OgBEanH93WYOjvkTXJaWiibaPRMFr07BaQZ8ZhlR94YQZTu767LYfG1QrK0
 Tk0CB8SpK5c4vxOnDvTbgsr+hKBa1YrFX2nqOcQw//RlzKjxQZY2eeTFl9mgfDqfCk
 aGUY7r2c5yVeQXgnHOUbW8ftO2z20z05fCDP0DN+mn1oB7zhk6lwe8VyH4bIu87VJV
 9Em1QmxDC4yYEjuIs8WZw5M2CubC9D/ysoJ4t0kaAm8apRIGKCG9mLVCq5JiI/Uymj
 WFR9pkrafjTeQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 5CD39CCFA07;
 Tue,  4 Nov 2025 22:16:14 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH 00/12] Make Samsung SOFEF00 DDIC and panel work
Date: Tue, 04 Nov 2025 23:16:08 +0100
Message-Id: <20251104-sofef00-rebuild-v1-0-dfcfa17eb176@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACh7CmkC/22Oy4oCMRBFf6Wp9QQq76R/ZXCRTqo0oPZM0oog/
 rtBNy5cngvncO/QqVXqME93aHStva7nAfJngnxI5z2JWgaDQmWlRCP6ysSIotFyqcci0GTOjlw
 gL2FYf4243l7F392bG/1fRnh7j7CkTiKvp1Pd5kk5FWxAHxMXckU7n0mXRQadvSkhGZ2Qgmb4P
 DS0cQej8qIfa6E2cq1R3kTRxkQMxpdo56v8bmnRHWnO6oZScLQWl6AU0zAc7B6PJ2+1YGAVAQA
 A
X-Change-ID: 20251104-sofef00-rebuild-04cfc6e68e71
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
 Casey Connolly <casey.connolly@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2701; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=PMJI57pPFLnWADx4D5rtUwHi6yehpBQw9oto6JRqah0=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpCnsrxoAimsOkpxj4oSSZ6MFZZOoxCgpdgJRR4
 M5DBQ9mDOGJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaQp7KwAKCRBgAj/E00kg
 cqbkD/4zeuTVk0oTgR7ncgLAK4OcDWd+0qy4jEBq/xz83o4LxkkXSFp/PJX8WsA6z2//9PK87Zw
 gLUT1inO7eXQGtvxU/Oq+1lu3GqMn1NmfKlmAOvJEanzR/jAF1mJYHshlp/oDOoYmuRvYxkkxQD
 zOKjgMIC4OldFy0e+6PPvWTwIZbP5Q+CRxfoqmlB3GxeC07JbuMudoby3Cy5QETK8c3S4H7L0Bu
 M86AxsfeurNoiR7MGr3Z4/U6rsiHmbwXd+L7cnuSBh4wWmEKE012WQTtlD3yKmZvlYzNu8ikeb0
 U5S078YoGEf6JKZBtT4auYoq5wpV7OmUskB76AnEGq4RizDGieRyqd5jJyOSOnypGivlwlNoQep
 TivgQpupnoBoDj+OD+u6V8tFAsdxFTJ05Rmb0Wnoq/zQUkiE62P8nDuMJanYGw6JpnjofQDhwEX
 0M21ZNRixERwbtQBReCq7jDXGxoJpGJbg+r2jWnt78MTJPUDqZiMFtO4UPfc7w7kw/njWUU9aN9
 8M7hXMiE/4Ul7cXm46ZQhI339P5Yn8T63TZu9+25J2V9S6Oi3qdVJuJiQIYbg1bluGAqgABHYNL
 /pCVDEh2jTlIkpoZm7wwQqZxLCsu3L0l9MWjG0xFijqXfh6DxZQ82pq6LglmsgjtJkFfgVXxOmr
 6hmn0fDMGPBNGJA==
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

This DDIC is essential for panels used in OnePlus 6 and Pixel 3a XL
(SDC variant). With proper support, all downstream patches in
sdm845-mainline and sdm670-mainline can be dropped.

The mainline driver was broken so far, and with my recent introduction
of S6E3FC2X01 driver, I had to "break it even more" due to OnePlus 6
common device-tree changes which defined all the regulators and
corrected properties.

At this moment the first version of the patchset will not include
Pixel 3a XL (SDC) as no testers yet volunteered.

The code, including the Pixel 3a XL enhancement can be found at
  https://gitlab.com/dhxx/linux/-/tree/b4/sofef00-rebuild

Due to some unknown issues with -next-20251103 - 04, the code is based
on few previous patchsets and v6.18-rc4 (or later).

Signed-off-by: David Heidelberg <david@ixit.cz>
---
Casey Connolly (2):
      drm/panel: sofef00: Add prepare_prev_first flag to drm_panel
      drm/panel: sofef00: Initialise at 50% brightness

David Heidelberg (10):
      dt-bindings: panel: Add Samsung SOFEF00 DDIC with panel
      arch: arm64: qcom: sdm845-enchilada: Specify panel name within the compatible
      drm/panel: sofef00: Clean up panel description after s6e3fc2x01 removal
      drm/panel: sofef00: Handle all regulators
      drm/panel: sofef00: Split sending commands to the enable/disable functions
      drm/panel: sofef00: Introduce page macro
      drm/panel: sofef00: Name of compatible should correspond to the panel used
      drm/panel: sofef00: Simplify get_modes
      drm/panel: sofef00: Mark the LPM mode always-on
      drm/panel: sofef00: Non-continuous mode and video burst are supported

 .../bindings/display/panel/panel-simple-dsi.yaml   |  25 +----
 .../bindings/display/panel/samsung,sofef00.yaml    |  83 ++++++++++++++++
 .../boot/dts/qcom/sdm845-oneplus-enchilada.dts     |   4 +-
 drivers/gpu/drm/panel/Kconfig                      |   7 +-
 drivers/gpu/drm/panel/panel-samsung-sofef00.c      | 104 +++++++++++++--------
 5 files changed, 160 insertions(+), 63 deletions(-)
---
base-commit: 262858079afde6d367ce3db183c74d8a43a0e83f
change-id: 20251104-sofef00-rebuild-04cfc6e68e71
prerequisite-change-id: 20250927-slider-correct-d34490847d95:v1
prerequisite-patch-id: 5584af5fec387ca2bf83150e39199d93b2af6f41
prerequisite-change-id: 20250923-s6e3fc2x01-f9550b822fe5:v6
prerequisite-patch-id: 042e90baee2aea539d39b398ff8a9c9a73a5a248
prerequisite-patch-id: 0da92dde66527977eb82c542c2b5e0478e011f16
prerequisite-patch-id: 8ba3d908464e146d4db16b3a562481928753c9b2
prerequisite-patch-id: 0945cccdc88d640192cf56148e9b661657e11e45

Best regards,
-- 
David Heidelberg <david@ixit.cz>


