Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99490151CDE
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2020 16:02:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 157526F38C;
	Tue,  4 Feb 2020 15:01:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 481C46F38A
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2020 15:01:58 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id w15so23506455wru.4
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Feb 2020 07:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SHOlRZtFBQ5wM1g1FaAtJgUmwljd+E+iomsSReCmsIg=;
 b=RcNFhPSIHlfiVzre77FWNowEwMhWA3WsnInXU/DBxX5mqk5s04hudsVI8lGyO9Mr/+
 5NjaUIUBEH0OnF+cD/1qtX8SI6MZ7KJzupdRlK0CYA+0wl2ygQA5zkz194STmkaAicew
 kePx5RVk3c+m1uwmeR/J8dhrJ103WYq2OGWm4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SHOlRZtFBQ5wM1g1FaAtJgUmwljd+E+iomsSReCmsIg=;
 b=pIskTVC2vZpnzLQyFXKx+tr1DqNu/lJEbouIjquXRyEEK5a6ni2igPf14hYYuThPO+
 N3tLp/pyMd2tdiNI1virNavZi6gjTowoJQ2rzl+Q25gvqJNhPMBScXxUCirztLhkX4yK
 mobptuWDuBgKH2lkcysuDMRtu83AoKnsn5zxFZ1mxS6RJ0unB4/k3+dcy05xEG/GoeXk
 r24wuyyaX3YMUJZ5CMicKCpZhAXBGgMwdxVEjEjDYkRgce6UVKiWpkjunTTmWKyTp5b+
 39+DhJsfpw5+wDnSQLphSb54zewMOYlP6w6sqqpoPyA+BCUYc+y72X+VPtxVsqYlhm4L
 5ljw==
X-Gm-Message-State: APjAAAXP+W4ehOOid1baeZUYBzVS9ah3mYMwhqmlbU4lJQ4GhfYmj0uf
 fA+Q5+UjuyPhpvegzO8LjoUiCGmDWbVrUQ==
X-Google-Smtp-Source: APXvYqxSKwma/PlXyE4g1m7Bclug7VTr9fv37wBg5u0JeAOURH9sQJXGrL+8fMNlevRSC6RQyTkuZA==
X-Received: by 2002:a5d:5704:: with SMTP id a4mr24298524wrv.198.1580828516672; 
 Tue, 04 Feb 2020 07:01:56 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d9sm14428921wrx.94.2020.02.04.07.01.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2020 07:01:55 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 4/5] drm: Push drm_global_mutex locking in drm_open
Date: Tue,  4 Feb 2020 16:01:45 +0100
Message-Id: <20200204150146.2006481-5-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200204150146.2006481-1-daniel.vetter@ffwll.ch>
References: <20200204150146.2006481-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We want to only take the BKL on crap drivers, but to know whether
we have a crap driver we first need to look it up. Split this shuffle
out from the main BKL-disabling patch, for more clarity. Historical
aside: When the kernel-wide BKL was removed, it was replaced by
drm_global_mutex within the scope of the drm subsystem hence why these
two things are (almost) interchangeable as concepts here.

Since the minors are refcounted drm_minor_acquire is purely internal
and this does not have a driver visible effect.

v2: Push the locking even further into drm_open(), suggested by Chris.
This gives us more symmetry with drm_release(), and maybe a futuer
avenue where we make drm_global_mutex locking (partially) opt-in like
with drm_release_noglobal().

v3:
- Actually push this stuff correctly, don't unlock twice (Chris)
- Fix typo on commit message, plus explain why BKL = drm_global_mutex
  (Sam)

Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/drm_drv.c  | 14 +++++---------
 drivers/gpu/drm/drm_file.c |  6 ++++++
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 8deff75b484c..05bdf0b9d2b3 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -1085,17 +1085,14 @@ static int drm_stub_open(struct inode *inode, struct file *filp)
 
 	DRM_DEBUG("\n");
 
-	mutex_lock(&drm_global_mutex);
 	minor = drm_minor_acquire(iminor(inode));
-	if (IS_ERR(minor)) {
-		err = PTR_ERR(minor);
-		goto out_unlock;
-	}
+	if (IS_ERR(minor))
+		return PTR_ERR(minor);
 
 	new_fops = fops_get(minor->dev->driver->fops);
 	if (!new_fops) {
 		err = -ENODEV;
-		goto out_release;
+		goto out;
 	}
 
 	replace_fops(filp, new_fops);
@@ -1104,10 +1101,9 @@ static int drm_stub_open(struct inode *inode, struct file *filp)
 	else
 		err = 0;
 
-out_release:
+out:
 	drm_minor_release(minor);
-out_unlock:
-	mutex_unlock(&drm_global_mutex);
+
 	return err;
 }
 
diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 1075b3a8b5b1..80d556402ab4 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -378,6 +378,8 @@ int drm_open(struct inode *inode, struct file *filp)
 	if (IS_ERR(minor))
 		return PTR_ERR(minor);
 
+	mutex_lock(&drm_global_mutex);
+
 	dev = minor->dev;
 	if (!atomic_fetch_inc(&dev->open_count))
 		need_setup = 1;
@@ -395,10 +397,14 @@ int drm_open(struct inode *inode, struct file *filp)
 			goto err_undo;
 		}
 	}
+
+	mutex_unlock(&drm_global_mutex);
+
 	return 0;
 
 err_undo:
 	atomic_dec(&dev->open_count);
+	mutex_unlock(&drm_global_mutex);
 	drm_minor_release(minor);
 	return retcode;
 }
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
