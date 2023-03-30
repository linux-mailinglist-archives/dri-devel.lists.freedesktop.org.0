Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC136CFCBE
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 09:30:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C896010ED04;
	Thu, 30 Mar 2023 07:30:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A588D10ED04
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 07:30:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 67CB51FE87;
 Thu, 30 Mar 2023 07:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680161449; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=HeQGTEb2pt5VqDrA04kmo059/G6Dnb9mfZhW381GEtA=;
 b=sUAQjMKB2AmT4wLRY70tuH9ZC3K/QJjdpONFHXfiqI6dpkKS3CEUl1/v2FEkifTdF0K/g/
 4wsusHGnFmPzrZ4IhsJuzz0H+GSp/vREmfI073rDwxYV0xD0H6MyxDXfGZrJ9rM+g7XSgl
 PuN4letfaXvM1h5HXqSGrPTxQ8PbqgM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680161449;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=HeQGTEb2pt5VqDrA04kmo059/G6Dnb9mfZhW381GEtA=;
 b=POy9A8NGLwVKulDdlUNWLWZXC8f+p+xXhudQdR8mDj/62B2mK4CK0scsVarPPcCLrr4xD7
 oRz1bRsg5/NWMoAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 441361348E;
 Thu, 30 Mar 2023 07:30:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ubCcD6k6JWRNeAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 30 Mar 2023 07:30:49 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: linux@armlinux.org.uk, javierm@redhat.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH 0/4] drm/armada: Convert fbdev to DRM client
Date: Thu, 30 Mar 2023 09:30:42 +0200
Message-Id: <20230330073046.7150-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert armada's fbdev code to struct drm_client. Replaces the current
ad-hoc integration. The conversion includes a number of cleanups. As
with most other driver's fbdev emulation, fbdev in armada is now just
another DRM client that runs after the DRM device has been registered.

Once all drivers' fbdev emulation has been converted to struct drm_client,
we can attempt to add additional in-kernel clients. A DRM-based dmesg
log or a bootsplash are commonly mentioned. DRM can then switch easily
among the existing clients if/when required.

I did the conversion from similar experience with other drivers. But I
don't have the hardware to test this. Any testing is welcome.

Thomas Zimmermann (4):
  drm/armada: Include <linux/of.h>
  drm/armada: Hide fbdev support behind config option
  drm/armada: Initialize fbdev DRM client
  drm/armada: Implement fbdev emulation as in-kernel client

 drivers/gpu/drm/armada/Makefile       |   3 +-
 drivers/gpu/drm/armada/armada_drm.h   |  10 ++-
 drivers/gpu/drm/armada/armada_drv.c   |  12 +--
 drivers/gpu/drm/armada/armada_fb.c    |   1 -
 drivers/gpu/drm/armada/armada_fbdev.c | 119 +++++++++++++++++++-------
 5 files changed, 98 insertions(+), 47 deletions(-)

-- 
2.40.0

