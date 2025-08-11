Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB04B21F93
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 09:33:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 173D710E5A6;
	Tue, 12 Aug 2025 07:33:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=listout.xyz header.i=@listout.xyz header.b="nuxsY5Op";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38A3E10E10E;
 Mon, 11 Aug 2025 13:17:23 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4c0wCg6KGhz9sTZ;
 Mon, 11 Aug 2025 15:17:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=listout.xyz; s=MBO0001;
 t=1754918239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D/60RwIO/b0dOS1Vd6kdShsnw/FwFxOCsLj3X7+hP30=;
 b=nuxsY5Op4iWaKO+yRzT+kGXjHj0yqMjwne3ySyzP+imQ7KxlAVsxElvXV+Rj8VYXN4xhjM
 MxqRpz0EHO0wy7yUEn/iHAjQLxSUV0th70FxyH0KWg64+7gxJ40n450RFR6c7Ml/3+8qt9
 +WgLj55TKU2ECyKStpISYCA88PB26fT6ZC/9JU+QDxOROI19/mG7G9eJvqhLDHlDUbRmKb
 ZMuQWJDnE3OqvXqtVD08VYlKDan0Ik5i9jxEIZ8m6k5AFTC3OkQgiUHHtk7ePMJmBo44pH
 DqlrtaXgD6wdy7VTUEJA5JSkbjzhG+G1KOCEGBsbYi0a7AIOwFpkllwV2NqfAw==
Authentication-Results: outgoing_mbo_mout; dkim=none;
 spf=pass (outgoing_mbo_mout: domain of listout@listout.xyz designates
 2001:67c:2050:b231:465::1 as permitted sender)
 smtp.mailfrom=listout@listout.xyz
From: Brahmajit Das <listout@listout.xyz>
To: jani.nikula@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, joonas.lahtinen@linux.intel.com,
 linux-next@vger.kernel.org, listout@listout.xyz, rodrigo.vivi@intel.com,
 simona@ffwll.ch, tursulin@ursulin.net
Subject: [RFC PATCH 0/2] use new debugfs device-centered functions
Date: Mon, 11 Aug 2025 18:47:06 +0530
Message-ID: <20250811131708.82865-1-listout@listout.xyz>
In-Reply-To: <32c55ab0b1452a1fd8ef49e8a1ca640ad5bd9d76@intel.com>
References: <32c55ab0b1452a1fd8ef49e8a1ca640ad5bd9d76@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4c0wCg6KGhz9sTZ
X-Mailman-Approved-At: Tue, 12 Aug 2025 07:33:33 +0000
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

Replace the use of drm_debugfs_create_files() with the new
drm_debugfs_add_files() function, which centers the debugfs files
management on the drm_device.

V2 changes: based on drm-tip.

Refer:
https://docs.kernel.org/gpu/todo.html#clean-up-the-debugfs-support

Brahmajit Das (2):
  drm/i915/debugfs: use new debugfs device-centered functions
  drm/i915: use new debugfs device-centered functions

 drivers/gpu/drm/i915/display/intel_display_debugfs.c | 7 +++----
 drivers/gpu/drm/i915/i915_debugfs.c                  | 7 +++----
 2 files changed, 6 insertions(+), 8 deletions(-)

-- 
2.50.1

