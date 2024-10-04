Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4171990AF9
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 20:20:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E295D10EA5C;
	Fri,  4 Oct 2024 18:20:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RMU3oGa0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 873EC10EA5A;
 Fri,  4 Oct 2024 18:20:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2C03CA44266;
 Fri,  4 Oct 2024 18:20:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A08C9C4CECE;
 Fri,  4 Oct 2024 18:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728066043;
 bh=qCUkdYZFENPx3eZTiw+UAraDYp+IYqhWq1wkRorpgGY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RMU3oGa0KwsARgkSpaqjVdPLvhDS5EkpPYJaJvoO3xj2LKqPs08rx+TpwSiHD89xC
 agVCtln4lPqTO5eYKUlBY2Tn5leqZoT2rh+/kcC4kn3e81FVAV28huXL6ovVo0U6Su
 YKhWIGdI686BvOVbtbB5jr+dGk2E7gQi5edsEtlJG1+R2ekTG6xifTanlZdKjqeOy+
 gM/NH1xeCFCrKghkaWekBF4Q6pP2w1RGNYU6D0SsPGhHRqeqKnk7b4tOCwKfuOHpfh
 ZUhrNZf4sznq7PglcDA3qo5fCSdVFnmseOrcXtBmKmhEWx1q2CHxFwtVVt4/dBRv49
 2FhHtni7TAraQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Sasha Levin <sashal@kernel.org>, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.11 71/76] drm/xe/oa: Fix overflow in oa batch buffer
Date: Fri,  4 Oct 2024 14:17:28 -0400
Message-ID: <20241004181828.3669209-71-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241004181828.3669209-1-sashal@kernel.org>
References: <20241004181828.3669209-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.2
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

From: José Roberto de Souza <jose.souza@intel.com>

[ Upstream commit 6c10ba06bb1b48acce6d4d9c1e33beb9954f1788 ]

By default xe_bb_create_job() appends a MI_BATCH_BUFFER_END to batch
buffer, this is not a problem if batch buffer is only used once but
oa reuses the batch buffer for the same metric and at each call
it appends a MI_BATCH_BUFFER_END, printing the warning below and then
overflowing.

[  381.072016] ------------[ cut here ]------------
[  381.072019] xe 0000:00:02.0: [drm] Assertion `bb->len * 4 + bb_prefetch(q->gt) <= size` failed!
               platform: LUNARLAKE subplatform: 1
               graphics: Xe2_LPG / Xe2_HPG 20.04 step B0
               media: Xe2_LPM / Xe2_HPM 20.00 step B0
               tile: 0 VRAM 0 B
               GT: 0 type 1

So here checking if batch buffer already have MI_BATCH_BUFFER_END if
not append it.

v2:
- simply fix, suggestion from Ashutosh

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240912153842.35813-1-jose.souza@intel.com
(cherry picked from commit 9ba0e0f30ca42a98af3689460063edfb6315718a)
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/xe/xe_bb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
index a13e0b3a169ed..ef777dbdf4ecc 100644
--- a/drivers/gpu/drm/xe/xe_bb.c
+++ b/drivers/gpu/drm/xe/xe_bb.c
@@ -65,7 +65,8 @@ __xe_bb_create_job(struct xe_exec_queue *q, struct xe_bb *bb, u64 *addr)
 {
 	u32 size = drm_suballoc_size(bb->bo);
 
-	bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
+	if (bb->len == 0 || bb->cs[bb->len - 1] != MI_BATCH_BUFFER_END)
+		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
 
 	xe_gt_assert(q->gt, bb->len * 4 + bb_prefetch(q->gt) <= size);
 
-- 
2.43.0

