Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5335846835
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 07:43:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5BE810E6A5;
	Fri,  2 Feb 2024 06:43:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="KmCC8OM2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1704D10E6A5
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 06:43:05 +0000 (UTC)
Received: by linux.microsoft.com (Postfix, from userid 1134)
 id C6F3F20B2000; Thu,  1 Feb 2024 22:43:04 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C6F3F20B2000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1706856184;
 bh=o0pt0AvQb9QH1NVN0Ep+6Z4WzLV/a6EZfES4iiGUlsM=;
 h=From:To:Cc:Subject:Date:From;
 b=KmCC8OM2S7hF8N3oCUViQyTPIoi55pJb5EwGKN7K4YZ47h0ZEGrNIxp/xvusZqom8
 1Lqtpe1qoUbzw5Y5PGkgmExh6VcK8kcOgymjVNH0g+/4wpgkI4SNCf/gsuLbK0Xfdq
 dZXHWtA1OOWy7ZaA4PlqFGbAw/8w8W3jRahWpn6I=
From: Shradha Gupta <shradhagupta@linux.microsoft.com>
To: linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.dev>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Saurabh Singh Sengar <ssengar@linux.microsoft.com>
Cc: Shradha Gupta <shradhagupta@linux.microsoft.com>,
 Shradha Gupta <shradhagupta@microsoft.com>
Subject: [PATCH v4 0/2] drm: Check polling initialized before
Date: Thu,  1 Feb 2024 22:42:56 -0800
Message-Id: <1706856176-9483-1-git-send-email-shradhagupta@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
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

This patchset consists of sanity checks before enabling/disabling
output polling to make sure we do not call polling enable and disable
functions when polling for the device is not initialized or is now
uninitialized(by drm_kms_helper_poll_fini() function)

The first patch consists of these checks in
drm_kms_helper_poll_disable() and drm_kms_helper_poll_enable() calls.
It further flags a warning if a caller violates this. It also adds
these checks in drm_mode_config_helper_resume() and
drm_mode_config_helper_suspend() calls to avoid this warning.

The second patch adds a similar missing check in
drm_helper_probe_single_connector_modes() function that is exposed by
the new warning introduced in the first patch.

Shradha Gupta (2):
  drm: Check output polling initialized before disabling
  drm: Check polling initialized before enabling in
    drm_helper_probe_single_connector_modes

 drivers/gpu/drm/drm_modeset_helper.c | 19 ++++++++++++++++---
 drivers/gpu/drm/drm_probe_helper.c   | 21 +++++++++++++++++----
 2 files changed, 33 insertions(+), 7 deletions(-)

-- 
2.34.1

