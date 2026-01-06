Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 141FCCF9841
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 18:02:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C7D010E135;
	Tue,  6 Jan 2026 17:02:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="cYt+Tup1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com
 [95.215.58.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0CBB10E135
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 17:02:22 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1767718940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=KVhYOWjOy3s4cGB075nLpbGOnPZxOTkqrtEVdZbAptM=;
 b=cYt+Tup1fmcLdyyugNm+KjfWOvO3FcdwmwmhqhoaYPuKYRvYdyEkbgUCvfJOaxPA3A4mJa
 ir/Eg7puwOWIPyaO2ma+bTWYAQfsTMVfsHYU/XUJClyGEGaq+JnepqMBgljFAEWxc1fo3Q
 n/bDPv4cLbhcWFT54oRVKdyVXe5Px4o=
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@gmail.com>, Michal Simek <michal.simek@amd.com>,
 Simona Vetter <simona@ffwll.ch>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH v3 0/3] drm: zynqmp_dp: Retrain link after HPD if necessary
Date: Tue,  6 Jan 2026 12:01:33 -0500
Message-Id: <20260106170136.501044-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

I noticed that after reconnecting a mini-displayport cable, the sink
would not display an image. But if I forced the link to re-train, the
image would come back.

Some digging revealed that the DP spec requires retraining after a HPD
event if the sink syas the link has gone down. So implement that since
it fixes my problem and it's required by spec.

Changes in v3:
- Simplify HPD retrain condition

Changes in v2:
- needs_retain -> needs_retrain
- Actually retrain the loop (accidentally removed while rebasing)

Sean Anderson (3):
  drm: zynqmp_dp: Update connector state before AUX transfers
  drm: zynqmp_dp: Use smp_load/store for status
  drm: zynqmp_dp: Retrain link after HPD if necessary

 drivers/gpu/drm/xlnx/zynqmp_dp.c | 42 +++++++++++++++++++-------------
 1 file changed, 25 insertions(+), 17 deletions(-)

-- 
2.35.1.1320.gc452695387.dirty

