Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AFE7118A1
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 23:01:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A02010E767;
	Thu, 25 May 2023 21:01:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB2D210E765
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 21:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685048458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tJfvnTa7LvHqmI8tQ9doB+bZM4q5v1Nf/27PBhPpK8Q=;
 b=CCImSqb7Os0oaVTdFnNN36lZpCsUEuhXRtPVGzveebeRmxJHTH03MkKydSR6XbJ6BrXD/p
 J8gEkfJq4JIfrSvWohuTOui3rYsEzhd7umPAZwapGcK3lBaTRzSZcHaBJKt7T3c+b7+NZq
 9mdCH4GA3dwrv3agGCY2J11czAY9FGw=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-436-0PuS4o_4OmusgeH4aJie-w-1; Thu, 25 May 2023 17:00:57 -0400
X-MC-Unique: 0PuS4o_4OmusgeH4aJie-w-1
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-75b1351b76eso9770585a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 14:00:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685048457; x=1687640457;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tJfvnTa7LvHqmI8tQ9doB+bZM4q5v1Nf/27PBhPpK8Q=;
 b=BbsdV0cbhOkP+B9WuVZoarXPRV9VCyT3Z+PeRJhSDhE3KLJbX5qa0DVu6wZVVgmiUF
 nEhQNwSD0leMNIbDWh+nYF3sscd5SYY5g7EB3ml6vzV9EzkVsd90bTFiFqz8rAZQRbrs
 szbAaBIYTDn+JT0vr59SNPXxKP7L+y+WveYhiDIy2uG8y5Z3Dh7RmMCNK9Ds+ElLsEtp
 YHg9oL8TY/TTI43U27OaKv8V8v+vLqDGuLpt1muUtC7sqHQcEslyf/VhvHuPdnXRGBpt
 Fne4OvAaTPtWLna+EWmy+A0nAZHigrIGDw/QFlosGJPXtIX5vrNgTTzQNggBFcus0Hdp
 tIIQ==
X-Gm-Message-State: AC+VfDz/yFtLChGqiu8siDbfOeBYuT58J4TCiVCiFMLf2rNdrnOzFLZA
 vdFblBuwHyqLqN6m1z5ylRxh4RHktt5CyNK1dbKw80b3u+kHh+OJy/TFmuuuk9WNqkvHCm/Sr8P
 Lxx0pVJRfU5ornAXLIiqvlp/B/mGh
X-Received: by 2002:a05:620a:4894:b0:75b:23a0:d9c7 with SMTP id
 ea20-20020a05620a489400b0075b23a0d9c7mr2658qkb.29.1685048456901; 
 Thu, 25 May 2023 14:00:56 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7xll8jco9wkwI9OOHu1rNZaj2ifaVP4j38rDEla1Dsbharx5BlkOzrgfF9xnXt6hzd5Vaefg==
X-Received: by 2002:a05:620a:4894:b0:75b:23a0:d9c7 with SMTP id
 ea20-20020a05620a489400b0075b23a0d9c7mr2648qkb.29.1685048456666; 
 Thu, 25 May 2023 14:00:56 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 o15-20020ae9f50f000000b0075b0c1f4ad6sm684847qkg.0.2023.05.25.14.00.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 May 2023 14:00:56 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/radeon: remove unused variable rbo
Date: Thu, 25 May 2023 17:00:54 -0400
Message-Id: <20230525210054.3233539-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Tom Rix <trix@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

gcc with W=1 reports
drivers/gpu/drm/radeon/radeon_ttm.c:200:27: error: variable
  ‘rbo’ set but not used [-Werror=unused-but-set-variable]
  200 |         struct radeon_bo *rbo;
      |                           ^~~
This variable is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/radeon/radeon_ttm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 4eb83ccc4906..de4e6d78f1e1 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -197,7 +197,6 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
 {
 	struct ttm_resource *old_mem = bo->resource;
 	struct radeon_device *rdev;
-	struct radeon_bo *rbo;
 	int r;
 
 	if (new_mem->mem_type == TTM_PL_TT) {
@@ -210,7 +209,6 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
 	if (r)
 		return r;
 
-	rbo = container_of(bo, struct radeon_bo, tbo);
 	rdev = radeon_get_rdev(bo->bdev);
 	if (!old_mem || (old_mem->mem_type == TTM_PL_SYSTEM &&
 			 bo->ttm == NULL)) {
-- 
2.27.0

