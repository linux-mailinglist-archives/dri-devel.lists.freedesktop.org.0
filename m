Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81478327B39
	for <lists+dri-devel@lfdr.de>; Mon,  1 Mar 2021 10:53:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D01A26E560;
	Mon,  1 Mar 2021 09:53:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F05286E55C
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Mar 2021 09:53:03 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id m1so13823150wml.2
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Mar 2021 01:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EeI5BVtXyBefOOJ/+aIoV3DIZyRdktgzKXSwldp6gq0=;
 b=QXspYk7DS04z5eUBW9cQsUAIwrzMNOLHNcC+SckHflj62WDbMbFuafwPwdu5J8j8ek
 B6/2FbH0e6z/iVAwNipbgWFZzKFk2iHwHyoTvAjrY/X10dQTQAwMX4L9Iis/6LeGCXGx
 xN4KyoCcDQoyJcsvinRXAow9txmNXBA86E+1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EeI5BVtXyBefOOJ/+aIoV3DIZyRdktgzKXSwldp6gq0=;
 b=N0oB0M2ctr2MRCqiw2Asrhh1qGvJcu4T+5L3mqYFusSfMNfx2XnW7xoNj3qr8ELxUf
 exWpIMEOBOsiuRNuQq6BOwvaqMmH+ePLji0LL2tRFTnAEXeccMqHPqDA3dd1SqprwGFx
 77zcdYC7TfTkT4fQK0/lLMYcoQsPcICuchjsxdj0kVQWOarKMYhMEDMTDHpkgSXq1To8
 k8Rqf7kyfeLH0VZQVOSrV+vK5esZuoHbjJ9COU1tp0UrT/1L12/3Kr67DQBFeqQsu0Er
 vy8Jj6R2IdNuT2SbVExbymtllXaeBb40Gv5H23Ep+kBlAorKSqG1gwR+tSi27Ciaf0xS
 Pgxg==
X-Gm-Message-State: AOAM533A9RMoZcVdF3hCncgEIyaiwGmMHq4HbPwXkiWIRomvoALQx30e
 1TR+fQXkWZ1nmgh7rj72dyaPCri2CYPZDQ==
X-Google-Smtp-Source: ABdhPJzAT/HGgrD0jcr9hGqgkHEqI6mRUy3x2si+8Fm43GhWylSKXhSbuAtccfHgZVQUYP86vSCPzw==
X-Received: by 2002:a05:600c:410e:: with SMTP id
 j14mr15446043wmi.36.1614592382589; 
 Mon, 01 Mar 2021 01:53:02 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c9sm21770155wmb.33.2021.03.01.01.53.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 01:53:02 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/etnaviv: User FOLL_LONGTERM in userptr
Date: Mon,  1 Mar 2021 10:52:54 +0100
Message-Id: <20210301095254.1946084-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210301095254.1946084-1-daniel.vetter@ffwll.ch>
References: <20210301095254.1946084-1-daniel.vetter@ffwll.ch>
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
Cc: John Hubbard <jhubbard@nvidia.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 etnaviv@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There's no mmu notifier or anything like that, releasing this pin is
entirely up to userspace. Hence FOLL_LONGTERM.

No cc: stable for this patch since a lot of the infrastructure around
FOLL_LONGETRM (like not allowing it for pages currently sitting in
ZONE_MOVEABLE before they're migrated) is still being worked on. So
not big benefits yet.

Cc: John Hubbard <jhubbard@nvidia.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Russell King <linux+etnaviv@armlinux.org.uk>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: etnaviv@lists.freedesktop.org
---
 drivers/gpu/drm/etnaviv/etnaviv_gem.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index a9e696d05b33..db69f19ab5bc 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -689,7 +689,8 @@ static int etnaviv_gem_userptr_get_pages(struct etnaviv_gem_object *etnaviv_obj)
 		struct page **pages = pvec + pinned;
 
 		ret = pin_user_pages_fast(ptr, num_pages,
-					  FOLL_WRITE | FOLL_FORCE, pages);
+					  FOLL_WRITE | FOLL_FORCE | FOLL_LONGTERM,
+					  pages);
 		if (ret < 0) {
 			unpin_user_pages(pvec, pinned);
 			kvfree(pvec);
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
