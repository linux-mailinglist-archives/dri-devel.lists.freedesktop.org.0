Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 017EB186643
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 09:21:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BD86895CA;
	Mon, 16 Mar 2020 08:21:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2B8289E3F
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 03:36:12 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id ng8so521040pjb.2
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 20:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=RN5LEm2Ln6UJgsZb2Xcgn8JEfugZQTYW/WUCQ061ChE=;
 b=fw1UmYYU9/rm9lgm2cwI72orTS1NcCsphYzCKyo3sxJoTiOH4SnhSoa8Mn+2RhdhIU
 uzx3IV/AzdVuGGJDk9sYHYz9CDfHFFGDCfPJSPlQmaCMQM089fcoklutF2gS7ji5dExk
 rCOM7D5anxq8bEMPwHiXLz7rPW6ekh5zWN110w198ZgFE6iqGsgVE9eoI+lE51xgFnfB
 WN8kvNzbfBB/Fn7ujhXOo/2bOFp5fRywaRxqOgIVUQ8die8xy1uiWYho/R2Hu2VIN22B
 rjPPtlXoQj45IXB4eL6Ya97g3ywLIqlwhH61SDjnPbozbsVIZ1Dtnob+OQNsQCkFDEXM
 /Rqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=RN5LEm2Ln6UJgsZb2Xcgn8JEfugZQTYW/WUCQ061ChE=;
 b=PJhrxr++bvMLk8c3puibhcTqdvQRTlSqTrP7RNR7KWNQm3OVYGOilWB1phNmfpI3WC
 7hX7RQ7Co0QYeySbC2YGBXapitDYdXyVIPHV4mHhKob3mjxnYUt6nzW1vIhiQGk6ngGM
 NK56h/1Cn3olY3pxjQxQRwPUDYfE8gHHUDYo4K2Mak8ocIitauzt4FwRdu9ZYWl9IAIc
 fuk+mIIPDogchY901Q0LVIbXdlrovRPvhyaptke7WVPHIr2J8dg6vC74G2OOirpmQPzG
 o6SskEieJuULg6pvTb1xufBPz2gA8/EMefdHhXc7Nub+v7E+NBGr1UDNqH/pDFoKkZIr
 HtXg==
X-Gm-Message-State: ANhLgQ0SQBpBczHZLGa0kFYUHjNteVp8Yhzx8/5OiCe783vGTCLb/igH
 IoasSkDmOcWB0c97FEQxyys=
X-Google-Smtp-Source: ADFU+vsZ//NWLkkQzxFIYJQuFmwMBRXMmi6l8kqyMnAHHWqVpYMJACZhlO6eHteKivEnhtXDqyOX1w==
X-Received: by 2002:a17:90b:8f:: with SMTP id
 bb15mr21271182pjb.186.1584329772317; 
 Sun, 15 Mar 2020 20:36:12 -0700 (PDT)
Received: from VM_0_35_centos.localdomain ([150.109.62.251])
 by smtp.gmail.com with ESMTPSA id my6sm20167168pjb.10.2020.03.15.20.36.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 15 Mar 2020 20:36:11 -0700 (PDT)
From: Qiujun Huang <hqjagain@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH] drm/lease: fix WARNING in idr_destroy
Date: Mon, 16 Mar 2020 11:36:08 +0800
Message-Id: <1584329768-16119-1-git-send-email-hqjagain@gmail.com>
X-Mailer: git-send-email 1.8.3.1
X-Mailman-Approved-At: Mon, 16 Mar 2020 08:21:33 +0000
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
Cc: Qiujun Huang <hqjagain@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

leases has been destroyed:
drm_master_put
    ->drm_master_destroy
            ->idr_destroy

so the "out_lessee" needn't to call idr_destroy again.

Reported-and-tested-by: syzbot+05835159fe322770fe3d@syzkaller.appspotmail.com
Signed-off-by: Qiujun Huang <hqjagain@gmail.com>
---
 drivers/gpu/drm/drm_lease.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
index b481caf..54506c2 100644
--- a/drivers/gpu/drm/drm_lease.c
+++ b/drivers/gpu/drm/drm_lease.c
@@ -577,11 +577,14 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
 
 out_lessee:
 	drm_master_put(&lessee);
+	goto err_exit;
 
 out_leases:
-	put_unused_fd(fd);
 	idr_destroy(&leases);
 
+err_exit:
+	put_unused_fd(fd);
+
 	DRM_DEBUG_LEASE("drm_mode_create_lease_ioctl failed: %d\n", ret);
 	return ret;
 }
-- 
1.8.3.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
