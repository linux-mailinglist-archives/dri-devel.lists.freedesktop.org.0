Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC92AA9FE3
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:29:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C70310E492;
	Mon,  5 May 2025 22:29:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="G4DVXrb8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DDC310E48C;
 Mon,  5 May 2025 22:29:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3C47C43F0F;
 Mon,  5 May 2025 22:29:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CA31C4CEEE;
 Mon,  5 May 2025 22:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746484158;
 bh=0rY6USwdH/BbMFJeP4DFM3Cbs9aUeKCtF98Za21TGq8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=G4DVXrb8fMMegn6uH7SzHtL4s6Qnmcr34TTV2YwOnUWsSmR4RhW8dcM1d6JkBYXm7
 nTgpas9KwBMPbduU/57VjjO/1eQvExgAw0Xx0pzLxTM+CqJW7MXKRV5kEwMjampcqD
 KgcMFJVqyV7rqAovmUC8Tx5+D3MgpOvYhsxS3h3LxXFfUWw3Hdmx+siq+sWkjDay6F
 +gaenyNTTGjQBqR2evYwNAOYpVOntJ8v9j8jWgzeksFIoxv1rdfGiH0uSCWMfMdMFr
 N9gy6d63xjIvBAiBp6JJr+PZSR5mPya/BTykZR+fSVdlPHn8TNfi7h9ZvM1tXq3zp3
 kA9EotkVpwznA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Sasha Levin <sashal@kernel.org>, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@gmail.com, simona@ffwll.ch,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 381/642] drm/xe/client: Skip show_run_ticks if
 unable to read timestamp
Date: Mon,  5 May 2025 18:09:57 -0400
Message-Id: <20250505221419.2672473-381-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
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

From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

[ Upstream commit 94030a1d3283251778411cf74553607a65260f78 ]

RING_TIMESTAMP registers are inaccessible in VF mode.
Without drm-total-cycles-*, other keys provide little value.
Skip all optional "run_ticks" keys in this case.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20250205191644.2550879-3-marcin.bernatowicz@linux.intel.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/xe/xe_drm_client.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 2d4874d2b9225..31f688e953d7b 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -324,6 +324,14 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
 	u64 gpu_timestamp;
 	unsigned int fw_ref;
 
+	/*
+	 * RING_TIMESTAMP registers are inaccessible in VF mode.
+	 * Without drm-total-cycles-*, other keys provide little value.
+	 * Show all or none of the optional "run_ticks" keys in this case.
+	 */
+	if (IS_SRIOV_VF(xe))
+		return;
+
 	/*
 	 * Wait for any exec queue going away: their cycles will get updated on
 	 * context switch out, so wait for that to happen
-- 
2.39.5

