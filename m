Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66756CD7183
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 21:38:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A8EF10E12B;
	Mon, 22 Dec 2025 20:38:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AN0i/Hpm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CF5910E12B
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 20:38:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6B4166014C;
 Mon, 22 Dec 2025 20:38:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AD83C116D0;
 Mon, 22 Dec 2025 20:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766435888;
 bh=13hBlmRovUFLHkB/2BS2es/VlKAxV4dLlwSJdmWTynA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AN0i/HpmuD/Jf7sepT/EB1J0aEbxYzfFOgvxDBCXcyCMonBcZsnE66RXGR6nXs8FT
 TTkhMNX+x6GlnAHRjEHxC1yq6MygZiTr33FMHiD1yb2SsvLeJ4GNkNfloilYIfaQz5
 yqx7VQ7JZZ7UubHoN0dHP9AQ60Fehi0FYMHjDBoZgHT1dtn+nWnPdZirc0iDxjJUDm
 Mbnw+dPODufyIvyq13T1BhE4IXGKvL2cIfswoklFSYHvF8QHQg6bXUBn0VeYh7NtNW
 XrBSCIlJd5kNYt77MssH6x70P4zb2ZOxYqqW6CaUKlBrN3OS9XQ/kphyN0wWwVfvM2
 BymnM7/lfZAgA==
From: "Rafael J. Wysocki" <rafael@kernel.org>
To: Linux PM <linux-pm@vger.kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Brian Norris <briannorris@chromium.org>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v1 04/23] drm/imagination: Discard pm_runtime_put() return
 value
Date: Mon, 22 Dec 2025 20:59:58 +0100
Message-ID: <8642685.T7Z3S40VBb@rafael.j.wysocki>
Organization: Linux Kernel Development
In-Reply-To: <6245770.lOV4Wx5bFT@rafael.j.wysocki>
References: <6245770.lOV4Wx5bFT@rafael.j.wysocki>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"
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

From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

The Imagination DRM driver defines pvr_power_put() to pass the return
value of pm_runtime_put() to the caller, but then it never uses the
return value of pvr_power_put().

Modify pvr_power_put() to discard the pm_runtime_put() return value and
change its return type to void.

No intentional functional impact.

This will facilitate a planned change of the pm_runtime_put() return
type to void in the future.

Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---

This patch is part of a series, but it doesn't depend on anything else
in that series.  The last patch in the series depends on it.

It can be applied by itself and if you decide to do so, please let me
know.

Otherwise, an ACK or equivalent will be appreciated, but also the lack
of specific criticism will be eventually regarded as consent.

---
 drivers/gpu/drm/imagination/pvr_power.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- a/drivers/gpu/drm/imagination/pvr_power.h
+++ b/drivers/gpu/drm/imagination/pvr_power.h
@@ -30,12 +30,12 @@ pvr_power_get(struct pvr_device *pvr_dev
 	return pm_runtime_resume_and_get(drm_dev->dev);
 }
 
-static __always_inline int
+static __always_inline void
 pvr_power_put(struct pvr_device *pvr_dev)
 {
 	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
 
-	return pm_runtime_put(drm_dev->dev);
+	pm_runtime_put(drm_dev->dev);
 }
 
 int pvr_power_domains_init(struct pvr_device *pvr_dev);



