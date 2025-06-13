Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BACAD9464
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 20:27:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48B0510E8F2;
	Fri, 13 Jun 2025 18:27:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="aWmi6toE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B866810E8F2;
 Fri, 13 Jun 2025 18:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6GAStOtcbUCMdDEfldQq+1/854ZKfmrtvJL2oMoKas4=; b=aWmi6toEPg/qSu7ygt0dMn6Ytp
 ML9VgtH0uAqDlmBlq1uBgF2zsONG8yIuqU/PMAF+rDnBa+U2G8Szqt7HADzoP7gfS4vPPu6tViZTP
 O2j5fKHCA9O148mGQR5N/4C+8A6Hr4D7TEc8xSISuj7eSkhszs9KkIfdLm3yh+87PWIdNbhaN6YNb
 aTSBAOGOnAZEgIIC6jgYvj4+MZcE0wAkDR1RtCzSPqn7kU+oIg5lwL5dGc3oaY03w40MieePf/N46
 7KaOOrUa8kyZIZ1Pn+rCg9iDofMAqyEGP779k20fpbLI+xTn4tq/1G+oQwpXfnGsu3GKpd+DLdDMa
 OmzDUREg==;
Received: from [191.204.192.64] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uQ97G-0039wK-89; Fri, 13 Jun 2025 20:27:02 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: "Alex Deucher" <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH 0/2] drm: amdgpu: Fix includes of <linux/export.h>
Date: Fri, 13 Jun 2025 15:26:49 -0300
Message-ID: <20250613182651.1758760-1-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.49.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 7d95680d64ac ("scripts/misc-check: check unnecessary #include
<linux/export.h> when W=1") and commit a934a57a42f6 ("scripts/misc-check:
check missing #include <linux/export.h> when W=1") added new checks for when the
include <linux/export.h> is missued by drivers. This patchset make drm/amd code
compliant to this new commits.

See also: https://lore.kernel.org/dri-devel/20250612121633.229222-1-tzimmermann@suse.de/

André Almeida (2):
  drm/amd: Do not include <linux/export.h> when unused
  drm/amd: Include <linux/export.h> when needed

 drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c      | 1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c   | 1 +
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c     | 1 -
 drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c | 1 -
 drivers/gpu/drm/amd/amdxcp/amdgpu_xcp_drv.c  | 1 +
 5 files changed, 2 insertions(+), 3 deletions(-)

-- 
2.49.0

