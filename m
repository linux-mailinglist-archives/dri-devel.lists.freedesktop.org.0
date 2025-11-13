Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2F8C594B8
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 18:57:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39DD710E1DF;
	Thu, 13 Nov 2025 17:57:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dJBFf65V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94CE110E10A
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 17:57:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 50AE0403F4;
 Thu, 13 Nov 2025 17:57:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 22363C4CEF5;
 Thu, 13 Nov 2025 17:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763056663;
 bh=vgzmso7a8Y8t5RJ9ImlUQnWFBosuuGamKlYy2aDvNqk=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=dJBFf65V6xf092PTLrTR0jqE35vrSe3InxtQrAIQ/fsrzmBRilcEUllbi1zBOahIY
 7EFtbHk4Euo6VrBis/hbtJCKJZLbk6EYQrvOu/v15ic6ZI4JmUXkI5Fu/T7XjAj5qg
 Kxc0WeZTXujQrNLno+bnnidU+wbBMf2LoXZXfIRGq/gXsABtfg16s72+VHuwbbEQNt
 iN4vZK9W2CqPzrqSq1VaworrkMzp8uM3HuhPf4BvN9ZtmTfLuJsxsSn9iysAFWJ+0F
 /5vL649zGDSQL/6GFueSomJcp0xQUYr1oAUaFG0AX+YBZB7cMlpw7RBolGqNYKR3Ow
 /iAnB6ktyJ0PQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 14B28CD8C9B;
 Thu, 13 Nov 2025 17:57:43 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH v2 00/12] Make Samsung SOFEF00 DDIC and panel work
Date: Thu, 13 Nov 2025 18:57:34 +0100
Message-Id: <20251113-sofef00-rebuild-v2-0-e175053061ec@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA8cFmkC/3WNQQ6CMBBFr0Jmbc1Mg8W48h6GBbRTmcSAtoWgh
 LtbceHK5XvJf3+ByEE4wqlYIPAkUYY+g94VYLumv7ISlxk06gMRlioOnj2iCtyOcnMKS+utYXP
 kiiCv7oG9zFvxUn858GPM4fSTncQ0hOf2OtHH/j+YSKFy3vqGKm6pMmeZJe3tC+p1Xd9ajmIGw
 QAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2543; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=vgzmso7a8Y8t5RJ9ImlUQnWFBosuuGamKlYy2aDvNqk=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpFhwUpLovHkS4Wk+TvhDkWFSO6YdoFELC9NIfw
 X/f4peBP9eJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaRYcFAAKCRBgAj/E00kg
 clvvEADM9AA6L1Uc0zOH7Xy9Lg+VvtzTdgFMcacL8oqV0Jxc4xA7uwMogRWbbT6AfveF0nYSWJJ
 +RIpkBqvZ69T6klh61F3hrzhXZqOzy1kKtB65Qnp1ESAJkV1RxjLtV3G+xog7LjtK5roItWeBH6
 SyB6/2PVRijQyrHWy0IEhKjqm0gUy2VmcgX4gecnfKFyBO07+PvNr6AkIDj0cIY550VezG5OjxD
 3zrqxMGKvE/+d79+pekZqZsK7hjHLW1FIPNu2GfAH8qQBuWTFsEgecLdJWCz+PdFZwan2JaNDa0
 BE8XIw6GgXrPm2p+LyapG2h2rOj1JTm+GGs0L6GgcILpNoS1jym8eHxvErn1Lmu1ZpFgXsWRMIN
 1hPjN3F6feAMRmfce/iuJ3Pl1EI9trHYqtVfpy+T0IRCdkNyZ11oo4jcwPL02Dbj0z14vJYWzPb
 vLMrqmme9zrCal67ZrmZpux/vY27ZTjls+k5YCBM9F6ZefEzs/vS43O+Mg8ayntl+Sw59bbsiNX
 AG94WO0ZaBOMM/iE/wcb7puT1l8OSr1zu6NpOBArQidVFaOMjAjokTjJA+58uSYFvGG6ingKAaA
 KJhrkSKaLJECwKAYNIZMRlLyiXmFEFhJhC3gfVRDjRdF4h0dXQi11/+w3RIHrrk8raKhb9ZJOfh
 8A9sYHFcvnHLQFw==
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

There are some unknown issues with -next-20251103 - 11, so won't likely
work there, recommend linus 6.18-rc4 and later.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
Changes in v2:
- General fixes to device-tree binding (Krzysztof)
- Add myself as a maintainer
- Updated commits wording
- Link to v1: https://lore.kernel.org/r/20251104-sofef00-rebuild-v1-0-dfcfa17eb176@ixit.cz

---
Casey Connolly (2):
      drm/panel: sofef00: Add prepare_prev_first flag to drm_panel
      drm/panel: sofef00: Initialise at 50% brightness

David Heidelberg (10):
      dt-bindings: panel: Convert Samsung SOFEF00 DDIC into standalone yaml
      arch: arm64: qcom: sdm845-enchilada: Specify panel name within the compatible
      drm/panel: sofef00: Clean up panel description after s6e3fc2x01 removal
      drm/panel: sofef00: Handle all regulators
      drm/panel: sofef00: Split sending commands to the enable/disable functions
      drm/panel: sofef00: Introduce page macro
      drm/panel: sofef00: Introduce compatible which includes the panel name
      drm/panel: sofef00: Simplify get_modes
      drm/panel: sofef00: Mark the LPM mode always-on
      drm/panel: sofef00: Non-continuous mode and video burst are supported

 .../bindings/display/panel/panel-simple-dsi.yaml   |  25 +----
 .../bindings/display/panel/samsung,sofef00.yaml    |  79 ++++++++++++++++
 MAINTAINERS                                        |   6 ++
 .../boot/dts/qcom/sdm845-oneplus-enchilada.dts     |   4 +-
 drivers/gpu/drm/panel/Kconfig                      |   7 +-
 drivers/gpu/drm/panel/panel-samsung-sofef00.c      | 104 +++++++++++++--------
 6 files changed, 162 insertions(+), 63 deletions(-)
---
base-commit: 6d7e7251d03f98f26f2ee0dfd21bb0a0480a2178
change-id: 20251104-sofef00-rebuild-04cfc6e68e71

Best regards,
-- 
David Heidelberg <david@ixit.cz>


