Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 372EE3DC4FD
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jul 2021 10:27:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AD9F6E7D7;
	Sat, 31 Jul 2021 08:27:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4306A6E7D7
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jul 2021 08:27:05 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 pf12-20020a17090b1d8cb0290175c085e7a5so24236546pjb.0
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jul 2021 01:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y7LF0TOJBi8g9oPoxvzY/IMHVXJRvIokqXJgW7n6wWU=;
 b=RJZ+rGSe9MjdSJpshgn6FdDtxzCLxvmvsad50TODML9WAleAKQiueuhET8/vduh88F
 S3Xqko1C4QRjj8UG4Wji5ctfC1UfiIV6IuBkUa5GVC4yIbAN60i2NkHaPW4XoZPQFS65
 4wCuYy5XdHd1w9ZYa+56L8c2ofiod/VTV1cZEhZYPokwnz/Q2slvJjtd+JnfbTNdC56v
 P9L35LIukKhPtFZLpaHXBWYCrD5hBpoQ+I7DZnlBVasE9yHb0zuJyTQeLEMrU/wbfaxy
 baMBSXRZ4aOnXooLgYsykXafJY5MUEZkh5g9EZ+m5U0yN9CCpWoRLru57HYs6wf6U7/E
 ERrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y7LF0TOJBi8g9oPoxvzY/IMHVXJRvIokqXJgW7n6wWU=;
 b=cV+3vq4xnKt/f3lt7YCohxSsflLEFRpwZGQUcypL6ANPMDBPMpx6E05mlAuopnyP+y
 4yUMmAH/13HCG8+SYdmhTloo0AqSKckGE6uZYYrU56kmRPpsQ3alsXADnKiRDkMgELdP
 DsAVqACecCujJxlfuWm0D+nopSF3Du+pGk82IFmw5pGF5r7krPWkFr8wjPoSEQ/14aSb
 bBblnUAbYUm5C3ul5QWv2+J4hfniQQH1tk47cB8m9gx9ZeLaHSUE60Qjg9D9FeuQaxEV
 0wjKzL+xZW1MTjALOJni+r0DA0V47zzURYbduXcNr63qPsoaPbMwFjgDBynqzhiiF6RM
 R8qQ==
X-Gm-Message-State: AOAM533JIwi0qb+/VadyZvo4NkxGwfphXn+jTiJth7qXsZpgiZ6Dfe/H
 kW0MtefZy18BJUVRXrnm1aQ=
X-Google-Smtp-Source: ABdhPJzd5bUpeB5fpe0qkJXVTRCMKBesE410MgSb6QJZrGqvamH8Z/gVzFKaP0OmfXbgFlYSkhMzWg==
X-Received: by 2002:a17:902:d293:b029:12c:8bb3:7997 with SMTP id
 t19-20020a170902d293b029012c8bb37997mr6015717plc.36.1627720024937; 
 Sat, 31 Jul 2021 01:27:04 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id mq7sm3182124pjb.50.2021.07.31.01.27.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Jul 2021 01:27:04 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, peterz@infradead.org, mingo@redhat.com,
 will@kernel.org, longman@redhat.com, boqun.feng@gmail.com
Cc: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v2 2/2] drm: add lockdep assert to drm_is_current_master_locked
Date: Sat, 31 Jul 2021 16:24:58 +0800
Message-Id: <20210731082458.1962043-3-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210731082458.1962043-1-desmondcheongzx@gmail.com>
References: <20210731082458.1962043-1-desmondcheongzx@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In drm_is_current_master_locked, accessing drm_file.master should be
protected by either drm_file.master_lookup_lock or
drm_device.master_mutex. This was previously awkward to assert with
lockdep.

Following patch ("locking/lockdep: Provide lockdep_assert{,_once}()
helpers"), this assertion is now convenient. So we add in the
assertion and explain this lock design in the kerneldoc.

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Acked-by: Boqun Feng <boqun.feng@gmail.com>
Acked-by: Waiman Long <longman@redhat.com>
---
 drivers/gpu/drm/drm_auth.c | 6 +++---
 include/drm/drm_file.h     | 4 ++++
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index 9c24b8cc8e36..6f4d7ff23c80 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -63,9 +63,9 @@
 
 static bool drm_is_current_master_locked(struct drm_file *fpriv)
 {
-	/* Either drm_device.master_mutex or drm_file.master_lookup_lock
-	 * should be held here.
-	 */
+	lockdep_assert_once(lockdep_is_held(&fpriv->master_lookup_lock) ||
+			    lockdep_is_held(&fpriv->minor->dev->master_mutex));
+
 	return fpriv->is_master && drm_lease_owner(fpriv->master) == fpriv->minor->dev->master;
 }
 
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index 726cfe0ff5f5..a3acb7ac3550 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -233,6 +233,10 @@ struct drm_file {
 	 * this only matches &drm_device.master if the master is the currently
 	 * active one.
 	 *
+	 * To update @master, both &drm_device.master_mutex and
+	 * @master_lookup_lock need to be held, therefore holding either of
+	 * them is safe and enough for the read side.
+	 *
 	 * When dereferencing this pointer, either hold struct
 	 * &drm_device.master_mutex for the duration of the pointer's use, or
 	 * use drm_file_get_master() if struct &drm_device.master_mutex is not
-- 
2.25.1

