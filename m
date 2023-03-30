Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E7A6CFCE9
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 09:36:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD8E310ECFB;
	Thu, 30 Mar 2023 07:36:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57AC910ED0D
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 07:36:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 181151FE89;
 Thu, 30 Mar 2023 07:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680161799; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ySFeAxMChdgqaB3/9bDz46byvGcT0yeTQSoZkBui9wU=;
 b=FvrvL5z0mnIjpgArU4BFEdsFV4jbyS/TK8ZGDY4KcpI4aLRYBN4c+XeOGE6gO/q5z8y3oo
 jljMrR3Q++VJ0s9Fytjt3YPFXwd6JRcM7TK60lUqdPbcenLZDBcFoBSeyedpFfD84YeEUS
 WolmAjn4ViOmUSfuPL5No63UfoWcOK4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680161799;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ySFeAxMChdgqaB3/9bDz46byvGcT0yeTQSoZkBui9wU=;
 b=1lBGykyg02W1gFkoLQxWY2NnSgr1STiliDM2I1QtcX7A0rvi9E6r0e8EVjk9fT9Jr6F20x
 30VzUzu2yDf8e8AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CE09E1348E;
 Thu, 30 Mar 2023 07:36:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hitaMQY8JWQJewAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 30 Mar 2023 07:36:38 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: inki.dae@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com,
 javierm@redhat.com, airlied@gmail.com, daniel@ffwll.ch,
 krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com
Subject: [PATCH 0/5] drm/exynos: Convert fbdev to DRM client
Date: Thu, 30 Mar 2023 09:36:30 +0200
Message-Id: <20230330073635.7409-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert exynos' fbdev code to struct drm_client. Replaces the current
ad-hoc integration. The conversion includes a number of cleanups. As
with most other drivers' fbdev emulation, fbdev in exynos is now just
another DRM client that runs after the DRM device has been registered.

Once all drivers' fbdev emulation has been converted to struct drm_client,
we can attempt to add additional in-kernel clients. A DRM-based dmesg
log or a bootsplash are commonly mentioned. DRM can then switch easily
among the existing clients if/when required.

I did the conversion from similar experience with other drivers. But I
don't have the hardware to test this. Any testing is welcome.

Thomas Zimmermann (5):
  drm/exynos: Remove exynos_gem from struct exynos_drm_fbdev
  drm/exynos: Remove struct exynos_drm_fbdev
  drm/exynos: Remove fb_helper from struct exynos_drm_private
  drm/exynos: Initialize fbdev DRM client
  drm/exynos: Implement fbdev emulation as in-kernel client

 drivers/gpu/drm/exynos/exynos_drm_drv.c   |  13 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.h   |   2 -
 drivers/gpu/drm/exynos/exynos_drm_fb.c    |   2 -
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c | 174 +++++++++++-----------
 drivers/gpu/drm/exynos/exynos_drm_fbdev.h |  20 +--
 5 files changed, 94 insertions(+), 117 deletions(-)

-- 
2.40.0

