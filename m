Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2022B77BAA9
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 15:56:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE00810E0B9;
	Mon, 14 Aug 2023 13:56:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BD5810E0B9
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 13:56:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 723AB61A55;
 Mon, 14 Aug 2023 13:56:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60183C433C7;
 Mon, 14 Aug 2023 13:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692021385;
 bh=JQvrkvdcjT+72APqdKAF12E5jYqVDgzA9uIhLzFUaSg=;
 h=From:Subject:Date:To:Cc:From;
 b=gTedmIqzIsxwscoice2qOuAw4wCUF2X0RhgGsJ85iollJtEZP5A2ROt21WLtuNQ2R
 QUyYNbNr4kGMZRb4BUAVNRNw0Mihp3h8Y3pdNUIdShIPESx4ZqpbVnsD8sf6Kw9uG6
 iarYhAOqCQN0thxaIC4KHpp7rUxOyEelzb8rgW+HKFRN9aPWaa1TEr0aV4N+6nu9L6
 amlz3Q0n7qqXozXBKLUZEgVwRMYrEAbDKAUuCqf4waZE/Xq4f59bJrzV9zuL0xD/4Q
 aP4tRVadPdnVLpF1XtZmfhqFtZ3zYwPN7wsVGsN6YFMbkylVqS3NuE4EVLIaLO8vP9
 h7GagRvnyhVGA==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH RFC 00/13] drm/connector: Create HDMI Connector infrastructure
Date: Mon, 14 Aug 2023 15:56:12 +0200
Message-Id: <20230814-kms-hdmi-connector-state-v1-0-048054df3654@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHwy2mQC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2MDC0MT3ezcYt2MlNxM3eT8vLzU5JL8It3iksSSVF0zQzNzC/NUM3NLI3M
 loPaCotS0zAqw0dFKQW7OSrG1tQAEmt6NbwAAAA==
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2844; i=mripard@kernel.org;
 h=from:subject:message-id; bh=JQvrkvdcjT+72APqdKAF12E5jYqVDgzA9uIhLzFUaSg=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCm3jNpWxOXveGnWbyLKeWqrYVpH5JZ/V8Ueqyxi0DNqX
 Z38cMvUjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEzkcDIjw5O5dVJuiV/FCjzi
 Fm8vZEp0Feksj955v1RORuhcWYy0IyPDP/Y/7Aee76m9nvBJ48vNRQf+5K1g3rtR/t/7ZW6b7gc
 84wAA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Here's a series that creates a subclass of drm_connector specifically
targeted at HDMI controllers.

The idea behind this series came from a recent discussion on IRC during
which we discussed infoframes generation of i915 vs everything else. 

Infoframes generation code still requires some decent boilerplate, with
each driver doing some variation of it.

In parallel, while working on vc4, we ended up converting a lot of i915
logic (mostly around format / bpc selection, and scrambler setup) to
apply on top of a driver that relies only on helpers.

While currently sitting in the vc4 driver, none of that logic actually
relies on any driver or hardware-specific behaviour.

The only missing piec to make it shareable are a bunch of extra
variables stored in a state (current bpc, format, RGB range selection,
etc.).

Thus, I decided to create some generic subclass of drm_connector to
address HDMI connectors, with a bunch of helpers that will take care of
all the "HDMI Spec" related code. Scrambler setup is missing at the
moment but can easily be plugged in.

Last week, Hans Verkuil also expressed interest in retrieving the
infoframes generated from userspace to create an infoframe-decode tool.
This series thus leverages the infoframe generation code to expose it
through debugfs.

This entire series is only build-tested at the moment. Let me know what
you think,
Maxime

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Maxime Ripard (13):
      drm/connector: Introduce an HDMI connector
      drm/connector: hdmi: Create a custom state
      drm/connector: hdmi: Add Broadcast RGB property
      drm/connector: hdmi: Add helper to get the RGB range
      drm/connector: hdmi: Add output BPC to the connector state
      drm/connector: hdmi: Add support for output format
      drm/connector: hdmi: Calculate TMDS character rate
      drm/connector: hdmi: Add custom hook to filter TMDS character rate
      drm/connector: hdmi: Compute bpc and format automatically
      drm/connector: hdmi: Add Infoframes generation
      drm/connector: hdmi: Create Infoframe DebugFS entries
      drm/vc4: hdmi: Create destroy state implementation
      drm/vc4: hdmi: Switch to HDMI connector

 drivers/gpu/drm/Makefile             |    1 +
 drivers/gpu/drm/drm_hdmi_connector.c | 1112 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/vc4/vc4_hdmi.c       |  720 ++++------------------
 drivers/gpu/drm/vc4/vc4_hdmi.h       |   37 +-
 drivers/gpu/drm/vc4/vc4_hdmi_phy.c   |    4 +-
 include/drm/drm_connector.h          |  256 ++++++++
 6 files changed, 1508 insertions(+), 622 deletions(-)
---
base-commit: 5d0c230f1de8c7515b6567d9afba1f196fb4e2f4
change-id: 20230814-kms-hdmi-connector-state-616787e67927

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>

