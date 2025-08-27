Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37279B38666
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 17:21:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B88710E857;
	Wed, 27 Aug 2025 15:21:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ispras.ru header.i=@ispras.ru header.b="RtcFH+kF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E77FF10E857;
 Wed, 27 Aug 2025 15:21:18 +0000 (UTC)
Received: from debian.intra.ispras.ru (unknown [10.10.165.10])
 by mail.ispras.ru (Postfix) with ESMTPSA id 9174B406B8A5;
 Wed, 27 Aug 2025 15:21:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 9174B406B8A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1756308076;
 bh=yu0k9+2rr2NU5BBwcwAL/g6ooWau34KHsv081LC7puE=;
 h=From:To:Cc:Subject:Date:From;
 b=RtcFH+kFhdSQ/RQ4H65InHnK3puUJoCRuTewSwyQrdjHuWlATNeiul74+X1JQI9A0
 cTbP8Hnip4vkDxHAFZjV88yszHWeHX0qI4F86OhID/XbRzekrga3J3OnFoyMfafxhf
 OErrWZMT/ztGYnuCLQRwIZrYTX+0+ICS1DbWnB1c=
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Alex Deucher <alexander.deucher@amd.com>, Melissa Wen <mwen@igalia.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Cc: Fedor Pchelkin <pchelkin@ispras.ru>,
 Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Hans de Goede <hansg@kernel.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org
Subject: [PATCH v3 0/2] a fix for connector modes leak in amdgpu driver
Date: Wed, 27 Aug 2025 18:21:03 +0300
Message-ID: <20250827152107.785477-1-pchelkin@ispras.ru>
X-Mailer: git-send-email 2.50.1
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

The first patch is a prerequisite exporting a convenient helper at
include/drm/modes.h used in the second one fixing a leak in amdgpu
driver.

v2: https://lore.kernel.org/dri-devel/20250819184636.232641-1-pchelkin@ispras.ru/
v1: https://lore.kernel.org/dri-devel/20250817094346.15740-1-pchelkin@ispras.ru/

Fedor Pchelkin (2):
  drm/modes: export drm_mode_remove() helper
  drm/amd/display: fix leak of probed modes

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  6 +++++-
 drivers/gpu/drm/drm_connector.c                   |  8 +-------
 drivers/gpu/drm/drm_modes.c                       | 15 +++++++++++++++
 include/drm/drm_modes.h                           |  1 +
 4 files changed, 22 insertions(+), 8 deletions(-)

-- 
2.50.1

