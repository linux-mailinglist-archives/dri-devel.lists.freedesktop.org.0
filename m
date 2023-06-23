Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D8C73B10F
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 09:09:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1471710E5DA;
	Fri, 23 Jun 2023 07:09:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BE1B10E5DA
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 07:09:39 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f9c0abc8b1so4358695e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 00:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687504177; x=1690096177;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NUlOXzpEnkH3q1cc95AdkBJh0vWal6KWTs2QNs6rI+U=;
 b=mXg9l5wETaCUpr9HweJb7OH3tKGnZqNtzZghWCUyYBSNy66wufBr+GuOsdRmF5Zlmz
 3G+vFRtp0vWKGLQVMATg/IoybYw16t9hNqbVfPf+zqAjYnhzwXKM57KCx+dtwE92NtQr
 k/3BmaHh5NctWgVHexu9yzBaZOizwyZFG6tkYaO1UZyk3txSpGDMIO/y3jKGV0Js9hve
 Mc71wAeIvCr4aKp7+ubgjiIosjs26aKS8nd6KvU71jZKrRUPMtedSbxhOa40P/X39/8y
 DTe/1xvHKZ0QgQnAtDS+AI3xqC+QSgs8x5fPcaWoac+hiPYagq2ZZka5WraYlDzSRpud
 UK2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687504177; x=1690096177;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NUlOXzpEnkH3q1cc95AdkBJh0vWal6KWTs2QNs6rI+U=;
 b=Z94zvO61gVuZde5JDER+pgVrv9367N/1AUTh1ubAY89wXntxfhlmwu1RXT31QrMx/S
 yyK9MCrQyjfmwlZ6mrbRuSBlzLJowAayxTmaGvBCNjLy6XfYansKCilOW+MpMZjaVYRX
 hbajkKmXiHggQXpXkqyu6T3GJDn7nhW74fp6wzRsc+9xV0xjPObZt+7/v4WlcTXq7C6l
 wDzPGXVmOXNAiLD5RVh03YgDCIk5CSoEMk6/pa86dOiXFO8BFpSYwb2JsGeElioM7d4s
 IwLmMhxQ2dcnlkBvtB0yeSTEZRwnanxHJJ4Z2oDS3MTuDsKjSJA0Q0WlSZh3ynpQuqdg
 KETg==
X-Gm-Message-State: AC+VfDwgifeJ8hFmRVm6s6LKhH/7G3Zh2dFs2cTK7n1l8aFYEt/zQv2+
 l6iHyAxxul5rFdT6SM9t7abgoz5WMdo=
X-Google-Smtp-Source: ACHHUZ4EmklmpobWsc+ezXpeUpsClnC6sgtjG8ZisfSPVgMql2RTAg4X7DCZ0SOUIl2lIA8yK/ay2w==
X-Received: by 2002:a7b:ce8a:0:b0:3f9:8c3:6805 with SMTP id
 q10-20020a7bce8a000000b003f908c36805mr15356559wmj.7.1687504176837; 
 Fri, 23 Jun 2023 00:09:36 -0700 (PDT)
Received: from EliteBook.fritz.box ([2a00:e180:156c:b700:68ee:b0ee:362e:fab7])
 by smtp.gmail.com with ESMTPSA id
 a1-20020a05600c224100b003f9b44e5b7fsm1431914wmm.46.2023.06.23.00.09.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jun 2023 00:09:36 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	Yunxiang.Li@amd.com
Subject: [PATCH] drm/ttm: fix warning that we shouldn't mix && and ||
Date: Fri, 23 Jun 2023 09:09:35 +0200
Message-Id: <20230623070935.65102-1-christian.koenig@amd.com>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Trivial warning fix.

Signed-off-by: Christian König <christian.koenig@amd.com>
Fixes: 4481913607e5 ("drm/ttm: fix bulk_move corruption when adding a entry")
---
 drivers/gpu/drm/ttm/ttm_resource.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index e51dbc7a2d53..46ff9c75bb12 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -114,7 +114,7 @@ static void ttm_lru_bulk_move_del(struct ttm_lru_bulk_move *bulk,
 	struct ttm_lru_bulk_move_pos *pos = ttm_lru_bulk_move_pos(bulk, res);
 
 	if (unlikely(WARN_ON(!pos->first || !pos->last) ||
-		     pos->first == res && pos->last == res)) {
+		     (pos->first == res && pos->last == res))) {
 		pos->first = NULL;
 		pos->last = NULL;
 	} else if (pos->first == res) {
-- 
2.34.1

