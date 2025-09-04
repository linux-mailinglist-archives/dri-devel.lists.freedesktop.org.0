Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F53AB444BE
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 19:50:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0124B10EA9E;
	Thu,  4 Sep 2025 17:50:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=temperror (0-bit key; unprotected) header.d=antheas.dev header.i=@antheas.dev header.b="PV+m0Gva";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay10.grserver.gr (relay10.grserver.gr [37.27.248.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACF0810EA9E
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 17:50:34 +0000 (UTC)
Received: from relay10 (localhost.localdomain [127.0.0.1])
 by relay10.grserver.gr (Proxmox) with ESMTP id 8D3CA47BC1;
 Thu,  4 Sep 2025 20:50:31 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by relay10.grserver.gr (Proxmox) with ESMTPS id C7E0347A47;
 Thu,  4 Sep 2025 20:50:30 +0300 (EEST)
Received: from antheas-z13 (unknown [37.96.55.21])
 by linux3247.grserver.gr (Postfix) with ESMTPSA id 21B3B1FD0CA;
 Thu,  4 Sep 2025 20:50:29 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
 s=default; t=1757008230;
 bh=l26dr8uR62AnAhhwkHYMNUtqPhxn0Klhdmu7OKXxRBg=; h=From:To:Subject;
 b=PV+m0Gva4z8eHfoTYx04FQXRHnLgijsckdnSL0C982pqC3Q6l6Oer8NxOsCWYsiof
 PqQ567CYH6Oyx1QMzpYKlEhK3d6Ip77uKEK+xiaK4VjSvmVERKpS60tRV8+j1fpQQf
 /C7oxvaz5hRXOG0Xkw858IjHb8qJx5BqMQd54ZTGXkdI0i1qCOnmsLCO8QhSZ1dqJM
 Av/p+H9uPy/9c6WOD2EW+AxcnO5Vz6ZC7hyyxVAUZdMhz7tI5Z1bs0iniSVGLPBAoC
 FsJeJb1ZgeFc3LXf/jwl9jKVSw94LIy4X+BkIHN7UUBbxwP25+uyejQezGWJTHwXGD
 58nqmOIsuTX4w==
Authentication-Results: linux3247.grserver.gr;
 spf=pass (sender IP is 37.96.55.21) smtp.mailfrom=lkml@antheas.dev
 smtp.helo=antheas-z13
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, philm@manjaro.org,
 Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH v1 00/10] drm: panel-orientation-quirks: Add various handheld
 quirks
Date: Thu,  4 Sep 2025 19:50:15 +0200
Message-ID: <20250904175025.3249650-1-lkml@antheas.dev>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <175700823033.2008993.11033886265544383630@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean
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

Adds a bunch of handheld orientation quirks that collected in the Bazzite
kernel. I made sure they are alphabetically sorted. In addition, to keep
the series short, I grouped variants of the same device together.

Antheas Kapenekakis (10):
  drm: panel-orientation-quirks: Add AOKZOE A1 Pro
  drm: panel-orientation-quirks: add additional ID for Ayaneo 2021
  drm: panel-orientation-quirks: Add Ayaneo 3
  drm: panel-orientation-quirks: Add OneXPlayer X1 variants
  drm: panel-orientation-quirks: Add OneXPlayer X1 Mini variants
  drm: panel-orientation-quirks: Add OneXPlayer F1 variants
  drm: panel-orientation-quirks: Add OneXPlayer G1 variants
  drm: panel-orientation-quirks: Add GPD Win Max (2021)
  drm: panel-orientation-quirks: Add GPD Pocket 4
  drm: panel-orientation-quirks: Add Zeenix Lite and Pro

 .../gpu/drm/drm_panel_orientation_quirks.c    | 108 ++++++++++++++++++
 1 file changed, 108 insertions(+)


base-commit: 1b237f190eb3d36f52dffe07a40b5eb210280e00
-- 
2.51.0


