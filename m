Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1820762D98
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 09:30:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0847010E425;
	Wed, 26 Jul 2023 07:30:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FF9D10E40B
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 03:30:28 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4R9fYD5p4zzBSXTd
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 11:30:24 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-transfer-encoding:content-type:message-id:user-agent
 :references:in-reply-to:subject:to:from:date:mime-version; s=
 dkim; t=1690342224; x=1692934225; bh=Kaqg3kvlUcRExSgaeAEIxsFsiDi
 pcctqy+l/tstW17M=; b=m+xj9wq244OoiCIr9poc3arBk/xDhRCM+6u/2remK+o
 wn11g7BkigrYN5m4olkiy/Qf9mOiWruCq3tSG9lQTvr7VkSX5th0uGP+IIyuaBds
 XOKUYNis0pUoVHCIm5iqUHe34tJTB7OqOoVNlb1OVKN+wQhkrGQqoMwvsB/g36wJ
 m/+1vhlleHiRxTbUOLz9w9pJAH/JOKnVJ6dKCQsJNKt0vI1qWk648t0J+yUv2MnC
 oBVyPFTfzDfN5EGob1d58udJDn2fQn88M1xzg7F4Z4AEShezxw2aUx+2GaqnWe4/
 c46zr7vhyj2GaAbjzajwOiWgGz87/FX4CTbsk+F3IHQ==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id BpTuNE6zqShl for <dri-devel@lists.freedesktop.org>;
 Wed, 26 Jul 2023 11:30:24 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4R9fYD3pWPzBJDhK;
 Wed, 26 Jul 2023 11:30:24 +0800 (CST)
MIME-Version: 1.0
Date: Wed, 26 Jul 2023 11:30:24 +0800
From: wuyonggang001@208suo.com
To: alexander.deucher@amd.com
Subject: [PATCH] drm: Fix format error
In-Reply-To: <20230726032626.51101-1-zhanglibing@cdjrlc.com>
References: <20230726032626.51101-1-zhanglibing@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <f5c1bdcdb456f524f4f5a45a7434c8a4@208suo.com>
X-Sender: wuyonggang001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 26 Jul 2023 07:30:32 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the error(s):
ERROR: "foo * bar" should be "foo *bar"

Signed-off-by: Yonggang Wu <wuyonggang001@208suo.com>
---
  drivers/gpu/drm/drm_legacy.h | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_legacy.h b/drivers/gpu/drm/drm_legacy.h
index 70c9dba114a6..f098a48cbdf4 100644
--- a/drivers/gpu/drm/drm_legacy.h
+++ b/drivers/gpu/drm/drm_legacy.h
@@ -231,7 +231,7 @@ static inline int drm_legacy_dma_setup(struct 
drm_device *dev)
  #endif

  void drm_legacy_free_buffer(struct drm_device *dev,
-			    struct drm_buf * buf);
+			    struct drm_buf *buf);
  #if IS_ENABLED(CONFIG_DRM_LEGACY)
  void drm_legacy_reclaim_buffers(struct drm_device *dev,
  				struct drm_file *filp);
@@ -253,12 +253,12 @@ int drm_legacy_sg_free(struct drm_device *dev, 
void *data,
  void drm_legacy_init_members(struct drm_device *dev);
  void drm_legacy_destroy_members(struct drm_device *dev);
  void drm_legacy_dev_reinit(struct drm_device *dev);
-int drm_legacy_setup(struct drm_device * dev);
+int drm_legacy_setup(struct drm_device *dev);
  #else
  static inline void drm_legacy_init_members(struct drm_device *dev) {}
  static inline void drm_legacy_destroy_members(struct drm_device *dev) 
{}
  static inline void drm_legacy_dev_reinit(struct drm_device *dev) {}
-static inline int drm_legacy_setup(struct drm_device * dev) { return 0; 
}
+static inline int drm_legacy_setup(struct drm_device *dev) { return 0; 
}
  #endif

  #if IS_ENABLED(CONFIG_DRM_LEGACY)
