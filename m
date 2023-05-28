Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C54E7139CC
	for <lists+dri-devel@lfdr.de>; Sun, 28 May 2023 16:00:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E78410E0A7;
	Sun, 28 May 2023 14:00:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03F0110E0A7
 for <dri-devel@lists.freedesktop.org>; Sun, 28 May 2023 14:00:11 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a02:8010:65b5:0:1ac0:4dff:feee:236a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 3D87966029DE;
 Sun, 28 May 2023 15:00:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1685282409;
 bh=5MUkRAo0JJuz6TjBOxCjVdLdxM6h3ukGhssysW3rVp0=;
 h=From:To:Cc:Subject:Date:From;
 b=J8350Oiraz1ZWlBHEpqpDsT2V/vXneKTOyG2ebNn5P2MiY0cdBu2DfcP7aBWOanFJ
 jGoS6Kd3VBW68/m+kmQ4zd+wulNnh5hY8WyBlBZQ4WnlnALynswPwYxqu4ajNq0Cqp
 Hk0CqJSqrPMdTu6NSempzQIvnQVkB/lAQFdT6OmVGjrF9K0kavl/VAYH2OJFjVDkEr
 iEYypBv3ma5LIdBXIPjo2pIH9pA7fZ19nJLqCsFUL1olSJvhqpj8wn+TXoM4IOzGgl
 Gfw/HabNzS+iATjqh+5PnF2oDNJZe00UqXXyCWbJRp9Y+vjItQM3oFkK1n1JxNETqM
 Wy3mSkxNLMxyw==
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: narmstrong@baylibre.com, khilman@baylibre.com,
 linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 rfoss@kernel.org, andrzej.hajda@intel.com
Subject: [PATCH 0/3] Add additional YUV420 bus format check for dw-meson's
 bridge enable
Date: Sun, 28 May 2023 14:59:58 +0100
Message-Id: <20230528140001.1057084-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: adrian.larumbe@collabora.com, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a belated follow-up on
https://lore.kernel.org/dri-devel/20220515204412.2733803-1-adrian.larumbe@collabora.com/

Commit e67f6037ae1be34b2b68 ("drm/meson: split out encoder from meson_dw_hdmi")
broke 4K display modes for me, and I discovered it was because the right pixel
clock wasn't being chosen in dw_hdmi_phy_init. I misinterpreted the reason as a
problem in figuring out whether we want to enforce YUV420 mode, but it turned
out to be a mismatch between what dw-meson code is doing and the way the bus
format is being picked by the dw-hdmi bus output format drm helper.

I fixed it by bringing back dw-hdmi bus format check in dw-meson.

The second patch makes sure YUV420 bus format is the only one being returned by
dw-hdmi's output format bridge function when that's the only drm mode allowed.

Adrián Larumbe (3):
  drm/meson: dw-hdmi: change YUV420 selection logic at clock setup
  dw-hdmi: truly enforce 420-only formats when drm mode demands it
  dw-hdmi: remove dead code and fix indentation

 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 35 +++++++++--------------
 drivers/gpu/drm/meson/meson_dw_hdmi.c     |  4 +--
 include/drm/bridge/dw_hdmi.h              |  2 ++
 3 files changed, 18 insertions(+), 23 deletions(-)

-- 
2.40.0

