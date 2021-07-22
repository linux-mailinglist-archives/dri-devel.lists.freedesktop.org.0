Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A44A3D20E6
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 11:30:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA8806EE7C;
	Thu, 22 Jul 2021 09:30:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7A296EE7C;
 Thu, 22 Jul 2021 09:30:11 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id n11so3787738plc.2;
 Thu, 22 Jul 2021 02:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RSgVdB0+HpET8iLINuWOoeOWDDxUJjmmluxZNEz35KA=;
 b=o6LJ/myMP6JO8ChH8dYoqq21TZnuVfWqQC7aMNZVbEwvgt/wmupSJe5X7mUycZZ1OP
 wZUOpxPzR0Di4iK476owf2txOnd8aRvZIuWOSyNSQwF8qAfJx1gZjc1rqQNENDcoU4k8
 pWfm16Rm2AyVdjC+e3kTofDMg7W/f1X4eU9NPEhv7mUcvN6ebC/kCdQLgGMJIgNOCd38
 Z79Cpgk8vmBkJLmcW9tTTfCW8TJv/6nRrpzuj2HycvK3LMZlVo0xpmCpHif6k1kmeqBf
 /hzT0Pmizi11dqx4L91lE1OKq6ULDL3w/A5pjP58k83vlOPYfDR9I9UDXt06Iw0JzA4O
 hv7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RSgVdB0+HpET8iLINuWOoeOWDDxUJjmmluxZNEz35KA=;
 b=ompWVo1nAMaZPZ9ck8m/pAr5jcWYm+23OvsMO0DYy95WPdzNSWicw07M99kOXEjF4I
 8RwKS80tqXJFJFN46gg+DdVpPSqvlLOdtM0R2I7fOgiHXbMqKkKIgBRAn2UcFA1ocfj9
 aFDyy0xPSNlLV1dUt23h2ip0GsUhCKuJI/bVaBovHscBnAWJoGSlOcyQln9bcBkL5WBh
 IH070SNaVPVz/2X24dI9J9ZujqL9trlGsupK/JwPVXJsCWS3lzNKkWtqJS5IH7uwGWnx
 WXp4nE7Sq3crMRkkMxpUgDD/jHEZy1Vi6JZHAC1OIFmJ/lNK4sRgpWUfL61KOru1L6G+
 apzA==
X-Gm-Message-State: AOAM531cam2O4Ig1PV3/g2ha92gkAMxGn3Z+X55M7O3OIzMoTruvp24f
 aq3t73qyLe9VGLVTBz9cWgw=
X-Google-Smtp-Source: ABdhPJyscK7c550TzHfpDv1WRnYYvoBsSoBWYdMCW0natilUebpT1uRY7os1lbemOjfZnuzWFb0RqA==
X-Received: by 2002:a05:6a00:2306:b029:331:ebe8:a4b4 with SMTP id
 h6-20020a056a002306b0290331ebe8a4b4mr39978184pfh.15.1626946211504; 
 Thu, 22 Jul 2021 02:30:11 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id q5sm1069592pjo.7.2021.07.22.02.30.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 02:30:11 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: linux-graphics-maintainer@vmware.com, zackr@vmware.com, airlied@linux.ie,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de
Subject: [PATCH 1/3] drm: use the lookup lock in drm_is_current_master
Date: Thu, 22 Jul 2021 17:29:27 +0800
Message-Id: <20210722092929.244629-2-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210722092929.244629-1-desmondcheongzx@gmail.com>
References: <20210722092929.244629-1-desmondcheongzx@gmail.com>
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
Cc: gregkh@linuxfoundation.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, skhan@linuxfoundation.org,
 Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Inside drm_is_current_master, using the outer drm_device.master_mutex
to protect reads of drm_file.master makes the function prone to creating
lock hierarchy inversions. Instead, we can use the
drm_file.master_lookup_lock that sits at the bottom of the lock
hierarchy.

Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 drivers/gpu/drm/drm_auth.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index f00354bec3fb..9c24b8cc8e36 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -63,8 +63,9 @@
 
 static bool drm_is_current_master_locked(struct drm_file *fpriv)
 {
-	lockdep_assert_held_once(&fpriv->minor->dev->master_mutex);
-
+	/* Either drm_device.master_mutex or drm_file.master_lookup_lock
+	 * should be held here.
+	 */
 	return fpriv->is_master && drm_lease_owner(fpriv->master) == fpriv->minor->dev->master;
 }
 
@@ -82,9 +83,9 @@ bool drm_is_current_master(struct drm_file *fpriv)
 {
 	bool ret;
 
-	mutex_lock(&fpriv->minor->dev->master_mutex);
+	spin_lock(&fpriv->master_lookup_lock);
 	ret = drm_is_current_master_locked(fpriv);
-	mutex_unlock(&fpriv->minor->dev->master_mutex);
+	spin_unlock(&fpriv->master_lookup_lock);
 
 	return ret;
 }
-- 
2.25.1

