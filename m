Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2731F3DB229
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jul 2021 06:16:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ED1B6F3C2;
	Fri, 30 Jul 2021 04:16:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F14B6F3C2
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jul 2021 04:16:15 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id e5so9528588pld.6
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 21:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RTjOUqNyS9qJHqvoohAwX/XHxdbP/hKwu8NmsnUvkUk=;
 b=ItslYacy27SJ4b7GiYhiajuZEYDADEadcPkuVsgi5WwJUhoyfK0Fl2xViA03tu0kop
 YdJ0lTZBf+On7uMIIM+OHbuG9nZnIlLenhsE/iUM8XkK53u9wqJdWCDVg46dSeIngd1X
 RstZYnskselzkrui5eZNfmEWGgWx4WBFYPxMsXP8D4Ur1kB9Y4G7Lc277PPWCzdflaoD
 Hxhm7XmzD7MMuvNdefGKbIBEWlvC/j5kvm2e+qnktZoFc61TY5xvkU+OGjC66YyUzlC6
 VvOqZyQM0KN4tEz9HvpWC9HqPOppbLQOinWaUFMzeIAlFkgfClRV1Xnr4vTzp6r09Sap
 EOoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RTjOUqNyS9qJHqvoohAwX/XHxdbP/hKwu8NmsnUvkUk=;
 b=EfOISlxVdMV4NPYzHZxmY4HplTX783ab9JUZaosVe2xJp+9Gs6GCvmmOB5aLn6f/aU
 oiD9dbnuT1yccvIXzXXWh3HzeKmNuRcXVJxRYPP+WpmuHuyDq/1CM9jNosDkFgRbaOvL
 A629aPJ7zxwbpf6GscK4rVyikheGPzd0dNVxd0J51VgKYZWKk7zO0ORaZRUz02n+hpQa
 E6FKtONM8cJlV0z1ohC4rtf5ecVs9DDqRmiP7Yl2iswVaUhccQjLDVIQcXQulFZ2Zw8D
 YI1GWwj9LXCqt5ZxYZlnPkBDYQ7xkGBjJFSc1viRPx+QtUBgFjcqCCeQfPaNoDoDYrKh
 +rnA==
X-Gm-Message-State: AOAM532HNGHbeeeXeBrr7LZALSNy+WnbEakfVuXXtZzQfaaVfeT9zEm8
 lnE1ctYXclLRESxCFK/g1So=
X-Google-Smtp-Source: ABdhPJx1Cyvaf1G7x7xeUkAAew6ARMZZiaOrBSX3yqgurse9uuMelADmfCI/veBFqg5uqoygkaJFYg==
X-Received: by 2002:a17:90b:1645:: with SMTP id
 il5mr878098pjb.113.1627618574806; 
 Thu, 29 Jul 2021 21:16:14 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id t19sm439322pfg.216.2021.07.29.21.16.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 21:16:14 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, peterz@infradead.org, mingo@redhat.com,
 will@kernel.org, longman@redhat.com, boqun.feng@gmail.com
Subject: [PATCH 2/2] drm: add lockdep assert to drm_is_current_master_locked
Date: Fri, 30 Jul 2021 12:15:15 +0800
Message-Id: <20210730041515.1430237-3-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210730041515.1430237-1-desmondcheongzx@gmail.com>
References: <20210730041515.1430237-1-desmondcheongzx@gmail.com>
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
 dri-devel@lists.freedesktop.org, skhan@linuxfoundation.org,
 Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In drm_is_current_master_locked, accessing drm_file.master should be
protected by either drm_file.master_lookup_lock or
drm_device.master_mutex. This was previously awkward to assert with
lockdep.

Following patch ("locking/lockdep: Provide lockdep_assert{,_once}()
helpers"), this assertion is now convenient so we add it in.

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 drivers/gpu/drm/drm_auth.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

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
 
-- 
2.25.1

