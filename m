Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C9F3A4EF5
	for <lists+dri-devel@lfdr.de>; Sat, 12 Jun 2021 14:55:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBC3F6E11A;
	Sat, 12 Jun 2021 12:55:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66AAC6E11A
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jun 2021 12:55:22 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id k15so6750082pfp.6
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jun 2021 05:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1hTuY7U1R+ySW1pBhYnqPXW/iY7lo4A0jpCZdHDRERo=;
 b=OHqcytAxEtLThghXPcTSEi53Ohzx6AgIjzBIhVcGvJReCNgvxY9AnjobCmUU4mdJVE
 pcf9tVP9Asz4EH9lh1l/mD9UX6t4unHIs7mNX8y1wB86fbPwEdHMgemFtR/9JMoiPMmZ
 yQZbYibwsJ7Odwcabf7KfwmtpkKfIBHc5Rf0bjJJh5IpVuJ3kTuQsB2wC2hGCjm7tmE5
 FPNtVx05YnNjDVpggnYZFjbNf6qIK0/TE+M8q4YnBH2d1apsP3eNXz91KCbCcqcwhfgO
 ANJDl5bowY1QyLXlUUtglUgkJWC4qlhFDE/8c3nngAUv5rwZMiIYRLi53Q+PT0hxQTTS
 y+IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1hTuY7U1R+ySW1pBhYnqPXW/iY7lo4A0jpCZdHDRERo=;
 b=RkZLxS2Ulj4Y5BcPMTsp3fRpDgw1wyCo99ANUUN+TRo8MRCuwJ0nAYImiOXbM22lwD
 koSHJ7++vvqTDsrNUB5GW9vhknTFQCNEqqN90Vj/TcFRekLox+LlBz++O7fapBfSeT0D
 0kEKt+G07TkPpzymmsBicMO8LishbbfWORBeoFCsb7eYzZfTLZX5r1gRBOo3uQiTWWFb
 z7AWyLmp/FLurHFitzOpwMQURImMctCowhPXEvFDTyGPyXXnR4UspRemQHCFPNoEcYqU
 Epr4GMkIfAKDsRODKyg/1gDj/G2eBFO53zaq+j6Nd2h2xHufnTod308Y0Ik+QxqbRPL3
 3DTA==
X-Gm-Message-State: AOAM530bhhhI2G8Z+di8cYm8TS0YMi6wYrKhBkkwURShL/0QT52l8LG9
 Od1jDkeaHDprQuTxIR/GXU0=
X-Google-Smtp-Source: ABdhPJxcPLkxJPfGeQDXgL6AeZKlPhDG/fM9lxRpRH8ptyrfytCsDXnGBvQV2fQLW2IWza2dLfQUug==
X-Received: by 2002:a62:7705:0:b029:2f0:94d6:78c9 with SMTP id
 s5-20020a6277050000b02902f094d678c9mr10155406pfc.25.1623502522053; 
 Sat, 12 Jun 2021 05:55:22 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id c7sm8015498pgh.72.2021.06.12.05.55.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Jun 2021 05:55:21 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 1/2] drm: Add a locked version of drm_is_current_master
Date: Sat, 12 Jun 2021 20:54:25 +0800
Message-Id: <20210612125426.6451-2-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210612125426.6451-1-desmondcheongzx@gmail.com>
References: <20210612125426.6451-1-desmondcheongzx@gmail.com>
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
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 skhan@linuxfoundation.org, Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While checking the master status of the DRM file in
drm_is_current_master(), the device's master mutex should be
held. Without the mutex, the pointer fpriv->master may be freed
concurrently by another process calling drm_setmaster_ioctl(). This
could lead to use-after-free errors when the pointer is subsequently
dereferenced in drm_lease_owner().

The callers of drm_is_current_master() from drm_auth.c hold the
device's master mutex, but external callers do not. Hence, we implement
drm_is_current_master_locked() to be used within drm_auth.c, and
modify drm_is_current_master() to grab the device's master mutex
before checking the master status.

Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 drivers/gpu/drm/drm_auth.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index 232abbba3686..c6bf52c310a9 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -61,6 +61,8 @@
  * trusted clients.
  */
 
+static bool drm_is_current_master_locked(struct drm_file *fpriv);
+
 int drm_getmagic(struct drm_device *dev, void *data, struct drm_file *file_priv)
 {
 	struct drm_auth *auth = data;
@@ -223,7 +225,7 @@ int drm_setmaster_ioctl(struct drm_device *dev, void *data,
 	if (ret)
 		goto out_unlock;
 
-	if (drm_is_current_master(file_priv))
+	if (drm_is_current_master_locked(file_priv))
 		goto out_unlock;
 
 	if (dev->master) {
@@ -272,7 +274,7 @@ int drm_dropmaster_ioctl(struct drm_device *dev, void *data,
 	if (ret)
 		goto out_unlock;
 
-	if (!drm_is_current_master(file_priv)) {
+	if (!drm_is_current_master_locked(file_priv)) {
 		ret = -EINVAL;
 		goto out_unlock;
 	}
@@ -321,7 +323,7 @@ void drm_master_release(struct drm_file *file_priv)
 	if (file_priv->magic)
 		idr_remove(&file_priv->master->magic_map, file_priv->magic);
 
-	if (!drm_is_current_master(file_priv))
+	if (!drm_is_current_master_locked(file_priv))
 		goto out;
 
 	drm_legacy_lock_master_cleanup(dev, master);
@@ -342,6 +344,13 @@ void drm_master_release(struct drm_file *file_priv)
 	mutex_unlock(&dev->master_mutex);
 }
 
+static bool drm_is_current_master_locked(struct drm_file *fpriv)
+{
+	lockdep_assert_held_once(&fpriv->master->dev->master_mutex);
+
+	return fpriv->is_master && drm_lease_owner(fpriv->master) == fpriv->minor->dev->master;
+}
+
 /**
  * drm_is_current_master - checks whether @priv is the current master
  * @fpriv: DRM file private
@@ -354,7 +363,13 @@ void drm_master_release(struct drm_file *file_priv)
  */
 bool drm_is_current_master(struct drm_file *fpriv)
 {
-	return fpriv->is_master && drm_lease_owner(fpriv->master) == fpriv->minor->dev->master;
+	bool ret;
+
+	mutex_lock(&fpriv->master->dev->master_mutex);
+	ret = drm_is_current_master_locked(fpriv);
+	mutex_unlock(&fpriv->master->dev->master_mutex);
+
+	return ret;
 }
 EXPORT_SYMBOL(drm_is_current_master);
 
-- 
2.25.1

