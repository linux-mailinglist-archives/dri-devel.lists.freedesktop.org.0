Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A84B2CC57
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 20:46:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC3FD10E179;
	Tue, 19 Aug 2025 18:46:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ispras.ru header.i=@ispras.ru header.b="PMm76u6X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93C8710E179;
 Tue, 19 Aug 2025 18:46:48 +0000 (UTC)
Received: from debian.intra.ispras.ru (unknown [10.10.165.10])
 by mail.ispras.ru (Postfix) with ESMTPSA id 4163640A3270;
 Tue, 19 Aug 2025 18:46:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 4163640A3270
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1755629206;
 bh=TKOX4WsFYlLOSjVO8yf5i2uZuA03p0XzpB8Q5DtAk/w=;
 h=From:To:Cc:Subject:Date:From;
 b=PMm76u6XZuiqhrWCFEpsY0v7SQnjDBl75MvvPYjmJvO7oOBoYqeA7Xcwkxn3fzG1M
 M46aD0OyFmf1NkXLXjgtVwWqCNx8xvuLxp5w3uDvp/Gq+6bONOfG1cvzWAjffszdC5
 0ITb7tmonhWjSIlMfQqZ9sguRmptv77TmDR9qmRQ=
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
Subject: [PATCH v2 0/2] a fix for connector modes leak in amdgpu driver
Date: Tue, 19 Aug 2025 21:46:33 +0300
Message-ID: <20250819184636.232641-1-pchelkin@ispras.ru>
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

v1: https://lore.kernel.org/all/20250817094346.15740-1-pchelkin@ispras.ru/

Fedor Pchelkin (2):
  drm/modes: export drm_mode_remove() helper
  drm/amd/display: fix leak of probed modes

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  3 +++
 drivers/gpu/drm/drm_connector.c                   |  8 +-------
 drivers/gpu/drm/drm_modes.c                       | 15 +++++++++++++++
 include/drm/drm_modes.h                           |  1 +
 4 files changed, 20 insertions(+), 7 deletions(-)

-- 
2.50.1

