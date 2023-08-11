Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3A8778824
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 09:26:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B358510E672;
	Fri, 11 Aug 2023 07:26:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AC2B10E662;
 Fri, 11 Aug 2023 06:31:57 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1bba48b0bd2so12219045ad.3; 
 Thu, 10 Aug 2023 23:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691735517; x=1692340317;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LQ1M3C8oCeNHlAIM7S9dLfoMmUG2TNrYAIGvX32nZuI=;
 b=H5U8a3+cNKb3odFyPRMiD69LR83CpnTQuL2EE0SUyGd6z8cw9k9TLsGIdB0Fj/rtbI
 b2d1u+H2TVao9P2TDRsTLtZrvRlYq/QP+uVkJCFNeaWZut6Ac/NXxiMo6Yu170zs9NDh
 3Hzqqoy7cA01j3OCEXRIiaP13hczlbWD1iHKlbVpebB0tdgMBW1YfNkJZZQdTzZoTMhK
 rWCG1SMZzvXjHhUklsO5sQSV1QlimIMLQcg9wbokCwpwjI2krIfIYKiwc57pdwKRJ0Kw
 vFPtOpEZdnc7NfSqVskXYGDG3xjw8M6t9LK/Eke84vbsHI00Fldcf2T0jKDXytTK5alZ
 ro8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691735517; x=1692340317;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LQ1M3C8oCeNHlAIM7S9dLfoMmUG2TNrYAIGvX32nZuI=;
 b=GArci5Crkw3Kcf0CiUe0o8KmNfjXS6WRqZ4GRXU5zZ+9NailRJJq1sCBFYzWrixVBr
 Pq6NJZra7+pYlqsCO8NIoSoQj56+X8pp6u1FP/fr3Hr7XkgHVIzGagPMLV8fZeUqfRL/
 eou0dgXu6MeMwS6wXEObQAcx4CqCRSb7o+QTn8VQOiyewv4wr+8VtJQjUc90ILbYYaZu
 Ot8rUeHqr0dUzw8n4nUCmZvOLetux+dnSoTakmMDERQMhPy9A8pWXUqQGN8D4ZBJGM+c
 xewTMtnfgVQVxUB1AW+vIb94Y7X9cQHLFnrcYRW3oUO9zi3hwQLfVW0f/MMpi0G8H0f5
 Is9g==
X-Gm-Message-State: AOJu0YxuPB6XmpxRSjhqrkRZfGaTTikQC9nN02QoncIxztQheHJkVo3M
 ioyMenAirCSFRLWDHEQTGLwnounZrR65bg==
X-Google-Smtp-Source: AGHT+IHUA6rWDRY9pKGc706ugGSJVg1oSxlipohGOlhGHLZrkVDH3xKp7OVEKc6nm6fxdrAK0hXj0g==
X-Received: by 2002:a17:902:e549:b0:1bb:8725:f537 with SMTP id
 n9-20020a170902e54900b001bb8725f537mr811040plf.66.1691735516811; 
 Thu, 10 Aug 2023 23:31:56 -0700 (PDT)
Received: from rajgad.hsd1.ca.comcast.net
 ([2601:204:df00:9cd0:1eb3:d724:a7eb:7d6c])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a170902ee0300b001b9fef7f454sm2943580plb.73.2023.08.10.23.31.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Aug 2023 23:31:56 -0700 (PDT)
From: Atul Raut <rauji.raut@gmail.com>
To: bskeggs@redhat.com,
	kherbst@redhat.com,
	lyude@redhat.com
Subject: drm/nouveau: switch over to vmemdup_user()
Date: Thu, 10 Aug 2023 23:31:11 -0700
Message-Id: <20230811063110.152221-1-rauji.raut@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 11 Aug 2023 07:26:19 +0000
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
Cc: nouveau@lists.freedesktop.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use vmemdup_user() rather than duplicating its implementation.

This patch fixes the following Coccinelle warning:
./drivers/gpu/drm/nouveau/nouveau_gem.c:630:7-15: WARNING opportunity for vmemdup_user

Signed-off-by: Atul Raut <rauji.raut@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_gem.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index ab9062e50977..a244b39df213 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -627,15 +627,10 @@ u_memcpya(uint64_t user, unsigned nmemb, unsigned size)
 
 	size *= nmemb;
 
-	mem = kvmalloc(size, GFP_KERNEL);
-	if (!mem)
+	mem = vmemdup_user(userptr, size);
+	if (IS_ERR(mem))
 		return ERR_PTR(-ENOMEM);
 
-	if (copy_from_user(mem, userptr, size)) {
-		u_free(mem);
-		return ERR_PTR(-EFAULT);
-	}
-
 	return mem;
 }
 
-- 
2.34.1

