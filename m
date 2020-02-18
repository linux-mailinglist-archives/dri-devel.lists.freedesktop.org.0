Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E71B163ECD
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 09:20:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEB1E6E550;
	Wed, 19 Feb 2020 08:20:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F9106EA5D;
 Tue, 18 Feb 2020 18:02:30 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id c84so3931611wme.4;
 Tue, 18 Feb 2020 10:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8Quwm0G/LPRvhYcMVajShysZzepUfBcFiZH554x5CIA=;
 b=tM3WflyfO1AOBtZNSjEyx/dsVwVuhzOMGD4DIu5nTwVoejfeG2iWNuSqnzG4XV2vvE
 gNtomM42wSb1zzuFbjC3TE4nDNuqc+c8C0tu+PSPZmoxD1czfYOR3cRN+4gLkwXYui1M
 E7Yet00n61WB+25oAoCIZnMEpl0Dj8BVmAjq45TtGPY7lOJmYf8wnRDkpedYIUe6dirh
 leBQKAy77pXOHeNTMmUJH6dpUIgzzKQ7Y70DmpOrK6ml0Q7O/Lf6obJlr0Y7wETfa8Ic
 wIsfxONExpoiWDjpkVwrXYDHVMENGW/Ui8vI3Rgr2zmEhC7VAUTO/nyh3Yf2Wzk3uaZt
 QOOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8Quwm0G/LPRvhYcMVajShysZzepUfBcFiZH554x5CIA=;
 b=Y1DOB4xHwvSf01N4Yp5Kb2IZJ0mH61vYFBx4RJ8IJPQM38l2OusjNZtxnDKJVUkBTW
 c12heAUt7ug7KFWYs6Vd4D3ABdqXXVF3rHoli+9gxXDeuhL6SXZatNqyqInDRfE0rXFj
 qQfVTFLrr+AWruVoFJG00l32TeFRXPBo9TDmUai2r/NF9cjb3+RUqLjxexMXx1JCDbr/
 oB1y3BjqZ0wxhKJUsbZKT61zX6ZJ2dJVHfChJndSBUSQl1ouKORbyy+O2OqGPIZSxVyq
 sNHEViAfu3oIPsGfKcuqBNticlDrSsn4gNijxutzWZWQ4MNweVcsyvRo7qFzzZfQckJn
 f6nw==
X-Gm-Message-State: APjAAAXcudCsyxqg4K+/jzduoYTGtz5wVqXGbNoiFLpgJT7iXcjBN5mN
 GJMr+0l9HAlEvui7ES8bzazLZaP3LKcupQ==
X-Google-Smtp-Source: APXvYqxvRYo5byNDUtgm9lH/+r4VWC6pfz7sqljs7F9dA+qOtmsIuuJqAj15cdyrGynuJ+rodjGQRA==
X-Received: by 2002:a7b:c249:: with SMTP id b9mr2150559wmj.61.1582048948725;
 Tue, 18 Feb 2020 10:02:28 -0800 (PST)
Received: from brihaspati.fritz.box
 (p200300C58F2CE900751228326401B174.dip0.t-ipconnect.de.
 [2003:c5:8f2c:e900:7512:2832:6401:b174])
 by smtp.gmail.com with ESMTPSA id d16sm7872733wrg.27.2020.02.18.10.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 10:02:28 -0800 (PST)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 6/8] drm/vram-helper: don't use ttm bo->offset
Date: Tue, 18 Feb 2020 19:04:52 +0100
Message-Id: <20200218180454.81866-7-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200218180454.81866-1-nirmoy.das@amd.com>
References: <20200218180454.81866-1-nirmoy.das@amd.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 19 Feb 2020 08:19:59 +0000
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
Cc: thellstrom@vmware.com, airlied@linux.ie, kenny.ho@amd.com,
 brian.welty@intel.com, amd-gfx@lists.freedesktop.org, nirmoy.das@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com,
 alexander.deucher@amd.com, sean@poorly.run, christian.koenig@amd.com,
 kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Calculate GPU offset within vram-helper without depending on
bo->offset

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 92a11bb42365..e7ef4cd8116d 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -214,7 +214,7 @@ s64 drm_gem_vram_offset(struct drm_gem_vram_object *gbo)
 {
 	if (WARN_ON_ONCE(!gbo->pin_count))
 		return (s64)-ENODEV;
-	return gbo->bo.offset;
+	return gbo->bo.mem.start << PAGE_SHIFT;
 }
 EXPORT_SYMBOL(drm_gem_vram_offset);
 
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
