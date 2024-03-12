Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BED587928D
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 11:56:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ED4B10F32D;
	Tue, 12 Mar 2024 10:55:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lACmhuZZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B380F10F32D
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 10:55:58 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-55a179f5fa1so7115288a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 03:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710240957; x=1710845757; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=lQ7BAjPZFtouBHqtKMFXHRT6Myq5DJTw7pOqNu0xeP0=;
 b=lACmhuZZy38WS3faqvWNVkI3/FmDtVAPtb7UJMH4+jSDy5B3Ofp+t3MaaCqmQal0Ws
 TqwCgCAPa4wB0eL7uwA5B1L8AP/q3qIeu7SELca8Clu48xLJFdF9xRnpcPTUe78dZscN
 sLS6S82uw6Xb/vUtNpaWc4kDglG+ZBidp8hFFq36qpu6lZ4KVCqLJCSdS9MIQX9VRVcD
 Uc+tSPRJSld6opC1YcORcnJyL0+r2mEHPceU0NYBRB5WSi8xojVq1OiJulZ1n2XxF3Ln
 G0UuDh3ApvbnhMA0I5PalzeF6cBBrjD+BFu9Y29tm7+gnfJ5ExDuBwDn66NhL2py1DGk
 14Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710240957; x=1710845757;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lQ7BAjPZFtouBHqtKMFXHRT6Myq5DJTw7pOqNu0xeP0=;
 b=KZiVQUl6zKu8dY/GPp7HyekSXCoa4Sz0frXe20fQn4iyZ8oWlBqyyuEpyvVnNAHZyf
 nxUl8MxEofv+T55uX4esqMJwtfF5/dF9uUt8v5e0fiGQqo5gLnGit53j9RkOOcyOY/eh
 YJytech2/xOVUHfyKdYK5QhAUCGquJlt5ziwLPyZqKOc3rNSee0C8t9wXN5HC6rq57Ug
 NQZOroZpyAKX5lg4E6RIklaeJqKfhbIhBSVgHDSIx4cJKoA/FEh1+DMWgqmaShDFb+1A
 9ji0RB21zmqSQ3zAaaGKw1k4ng7vfHNPaMlAKR9C1NIbdPm7c/qKPFO/PKRc8zQjXq5S
 E++A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7f2Ml/RehZ29xEYZG6poytFdGm7s7ZML9/Jw/PkHMXf13KmZI8yNcJ2O/IAGqyUYpT0IdyJlXozVXcH7sLyVfY8wzVa5afkqAM9CAS7cK
X-Gm-Message-State: AOJu0YxiYAgx9Y/vEl4kyY+W/8JpLlEXDtNzHWyLVR1eOktMyYIBAxi8
 ImYH7yc9RrPexnWlRmv/m3slQ7T4ZZcJI1AvZzN3//bb0VRWWDz7
X-Google-Smtp-Source: AGHT+IGGR1qp0mocLb3xxieuUdrD21Mo+ciOlWaBGTNRIRGMdVAGLeoquVVZGo9nxWzYdy+ZM/ylvw==
X-Received: by 2002:a50:d583:0:b0:567:658:412 with SMTP id
 v3-20020a50d583000000b0056706580412mr6578610edi.13.1710240956804; 
 Tue, 12 Mar 2024 03:55:56 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:15c3:3c00:1c99:688e:9d82:e8bf])
 by smtp.gmail.com with ESMTPSA id
 n6-20020a056402060600b005682ed4335esm3810727edv.91.2024.03.12.03.55.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Mar 2024 03:55:56 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: warn when resv objs are mixed in a bulk_move
Date: Tue, 12 Mar 2024 11:55:55 +0100
Message-Id: <20240312105555.3065-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
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

The BOs in a bulk move must share all the same reservation object
to make sure that we lock the whole bulk during eviction.

Actually document and enforce that with a warning.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_resource.c | 1 +
 include/drm/ttm/ttm_resource.h     | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 65155f2013ca..be8d286513f9 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -105,6 +105,7 @@ static void ttm_lru_bulk_move_add(struct ttm_lru_bulk_move *bulk,
 		pos->first = res;
 		pos->last = res;
 	} else {
+		WARN_ON(pos->first->bo->base.resv != res->bo->base.resv);
 		ttm_lru_bulk_move_pos_tail(pos, res);
 	}
 }
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index 7561023db43d..69769355139f 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -251,6 +251,9 @@ struct ttm_lru_bulk_move_pos {
  *
  * Container for the current bulk move state. Should be used with
  * ttm_lru_bulk_move_init() and ttm_bo_set_bulk_move().
+ * All BOs in a bulk_move structure need to share the same reservation object to
+ * ensure that the bulk as a whole is locked for eviction even if only one BO of
+ * the bulk is evicted.
  */
 struct ttm_lru_bulk_move {
 	struct ttm_lru_bulk_move_pos pos[TTM_NUM_MEM_TYPES][TTM_MAX_BO_PRIORITY];
-- 
2.34.1

