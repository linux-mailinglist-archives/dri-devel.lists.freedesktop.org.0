Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBB6B1E013
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 03:03:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41E5210E19A;
	Fri,  8 Aug 2025 01:03:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="dLPO0rnL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5324710E19A
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Aug 2025 01:03:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1754614970; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=l5A2KRmE8hy+m5DCBSIwK3wVu+4fHGAUirxtmwmLjzwWVLPSV2GWsa5mQKNVGUPJSu8i+sOQ7u8JqdtUYqB5lhq0xwtSB7V0yWgFb9pwL3dMr4DymMhaQZ5iOvql/RPOY5qtx2veagfdcul2OH8JhpNLGCfHNXSzUiKJ+6dPd6g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1754614970;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=CqlsM5eFyojY0kwTT9YlTdqpSfGKGhBS1ZnJ4HyXBXo=; 
 b=OPiH6JQvHticzgSMH+lK+UOgqU5zGewPKufZScmFU43Pd75wFF+KGOG9cdhr/6Z+3fADT5HDab3oGF92afxmFwIQG0QIzg7UMOMRN5I4qy6nPjJ6N27r2IAgdZvTJCgdrb6QyCQs92i4CjEYz0+Ip8bPgBLn/ZpmoSSTGhXK1PU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1754614970; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=CqlsM5eFyojY0kwTT9YlTdqpSfGKGhBS1ZnJ4HyXBXo=;
 b=dLPO0rnLkYCyeaZS148W+n2BtYKLN6o5jF5kwGdR5cwQIs5Fhz6kXTnKMt7ae1jj
 7Z7JO9hdXOEo4mEtg50fe8/0ZXa2W2oIK0Vk7apWWntaePdWlpUQ6shwZ5A6IwNjMqo
 1NR59AoStv0PE1cYtZYrmAgYFqSulIFx+r7Q/Zbw=
Received: by mx.zohomail.com with SMTPS id 1754614968543351.6309078864217;
 Thu, 7 Aug 2025 18:02:48 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Christopher Healy <healych@amazon.com>,
 Daniel Stone <daniels@collabora.com>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v2] drm/panfrost: Print RSS for tiler heap BO's in debugfs
 GEMS file
Date: Fri,  8 Aug 2025 02:02:34 +0100
Message-ID: <20250808010235.2831853-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Otherwise it would display the virtual allocation size, which is often
much bigger than the RSS.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Fixes: e48ade5e23ba ("drm/panfrost: show device-wide list of DRM GEM objects over DebugFS")
Tested-by: Christopher Healy <healych@amazon.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index bb73f2a68a12..85d6289a6eda 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -432,7 +432,7 @@ static void panfrost_gem_debugfs_bo_print(struct panfrost_gem_object *bo,
 	if (!refcount)
 		return;
 
-	resident_size = bo->base.pages ? bo->base.base.size : 0;
+	resident_size = panfrost_gem_rss(&bo->base.base);
 
 	snprintf(creator_info, sizeof(creator_info),
 		 "%s/%d", bo->debugfs.creator.process_name, bo->debugfs.creator.tgid);
-- 
2.50.0

