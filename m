Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8418D1D0F
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 15:33:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30D8B10E211;
	Tue, 28 May 2024 13:33:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Tyc6h+vy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7E8310E152;
 Tue, 28 May 2024 13:32:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 14D90620B6;
 Tue, 28 May 2024 13:32:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E656C3277B;
 Tue, 28 May 2024 13:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716903177;
 bh=Dz+CC+JZWQtuG8vRgbBmaJAyi+jOVLXABQMl0q6O1kM=;
 h=From:To:Cc:Subject:Date:From;
 b=Tyc6h+vyN/0ZtgmqlBVQivGgvzaHDwhnURTNTqAzCNT1CAUF4+XoAWWP9zIVozyWh
 JaEUiYWPKRClmYh7/hg8fx0BhqsyfmzRPFKrsIlNebfX4kyQkuA7VP1suJrYUwfiuq
 FcB2RZi/cn6mo1q8HsxG5a3nOV89f6WZN6sQpi1HI2LOy+ifhc8MWSrxO/X90ljkgR
 DRKZuzwiwHV3WpPXA4HWBW720Xyhrk/4Nmw+tB/JG4BNOGbFmsuo7HSMYxoN1j3tjG
 CjQgVM3G606etOfuHQc1B+i8n96rmS5SmhLVIR596pmD4YIGfOrWwc0cUs5Y2BclbN
 ujPRZU2Cl+dEQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/xe: replace format-less snprintf() with strscpy()
Date: Tue, 28 May 2024 15:32:36 +0200
Message-Id: <20240528133251.2310868-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
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

From: Arnd Bergmann <arnd@arndb.de>

Using snprintf() with a format string from task->comm is a bit
dangerous since the string may be controlled by unprivileged
userspace:

drivers/gpu/drm/xe/xe_devcoredump.c: In function 'devcoredump_snapshot':
drivers/gpu/drm/xe/xe_devcoredump.c:184:9: error: format not a string literal and no format arguments [-Werror=format-security]
  184 |         snprintf(ss->process_name, sizeof(ss->process_name), process_name);
      |         ^~~~~~~~

In this case there is no reason for an snprintf(), so use a simpler
string copy.

Fixes: b10d0c5e9df7 ("drm/xe: Add process name to devcoredump")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 1643d44f8bc4..1973bfaece40 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -181,7 +181,7 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 		if (task)
 			process_name = task->comm;
 	}
-	snprintf(ss->process_name, sizeof(ss->process_name), process_name);
+	strscpy(ss->process_name, process_name);
 	if (task)
 		put_task_struct(task);
 
-- 
2.39.2

