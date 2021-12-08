Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AF846CAF9
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 03:39:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48B406E364;
	Wed,  8 Dec 2021 02:39:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5DAC6E073
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Dec 2021 02:39:40 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id j3so1502894wrp.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Dec 2021 18:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen.nl; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y2cG9RurA34K51qCt0uYNk1CDMkoujSFBImeM3uamz8=;
 b=UzOyzJv1zQBIjcFOw1Es8PZO4aLajWtYPSZ7cKoNVKnboa8mRra2EM6EQmzRUqQQTs
 vvLYdurxIQhdboidCqOZ23paP1jqwL367Be8uaYQFilhPo5am4PgqGJSJ7cDPh123QQ9
 oS49H5jjklopum9WtOyhg18iD8Bnfl9Uajk9A8ja0prPn4mjgVTPC97TY4KjntU2EF4X
 kXzjYltzH8dY+N1NqMxTEtieF5PbimF2FOYOBB+9U4PVNzO6x/DivrtSTK6AD5GFm1xx
 IaKrGHH8NiS/OYnZN7h2UpY2Qk9c06DRXhVLIxIp4hrHnpIHBN6ZeDhFrsO/6dGQJr8u
 vLJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y2cG9RurA34K51qCt0uYNk1CDMkoujSFBImeM3uamz8=;
 b=TKllaFpYpGPQT6LkM6VgjX1gWmyXhW6PAkrsBgKombaz16zCQpoGK08c65aghhdk8n
 tsHZooQsTBuTvjM/QyleLcAvZMZhAO501sH7t9/Q2ZS11Hys9FCQqeI9rDRmIn6n/QbS
 HEcHWWxRYK5Cmag5okl9bSXHnhdPkk5d3M2ZozSUbR9BMSt00rYPTc+RICPQZXbSrKj4
 dtMnMMmIsRDNN5qaBJS1Eol0dRGXa9PTLm0BQIY36Zw1TvZkvwmaCHs5Gne7WZ+OIXNo
 IcaEl2QuTHsJoiex9J/ieAEBEzh311RzIG4oPFa9veI4rarNgItqKI39DCHvYLi/wZql
 Ptig==
X-Gm-Message-State: AOAM530NOl0xL8CeQaIFAIWQgVKkXjojlPwQt+XEs/2Zl2e9Y4f1W8x3
 Ew3gNsE9jeRzIsVb8rS3BXtBKJG3GLGdeg==
X-Google-Smtp-Source: ABdhPJwjkZM/xSwajxgDmE8oCD81SLQpLOp7+iHdbxo8zb0q3rvqJsJskb1Ko0jsrCdVjIO3vz/+pw==
X-Received: by 2002:a05:6000:1788:: with SMTP id
 e8mr58984781wrg.45.1638931179330; 
 Tue, 07 Dec 2021 18:39:39 -0800 (PST)
Received: from bas-workstation.. ([2a02:aa12:a77f:2000:7285:c2ff:fe67:a82f])
 by smtp.gmail.com with ESMTPSA id 21sm1230098wmj.18.2021.12.07.18.39.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 18:39:38 -0800 (PST)
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/syncobj: Deal with signalled fences in
 drm_syncobj_find_fence.
Date: Wed,  8 Dec 2021 03:39:35 +0100
Message-Id: <20211208023935.17018-1-bas@basnieuwenhuizen.nl>
X-Mailer: git-send-email 2.34.1
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
Cc: stable@vger.kernel.org, christian.koenig@amd.com,
 lionel.g.landwerlin@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dma_fence_chain_find_seqno only ever returns the top fence in the
chain or an unsignalled fence. Hence if we request a seqno that
is already signalled it returns a NULL fence. Some callers are
not prepared to handle this, like the syncobj transfer functions
for example.

This behavior is "new" with timeline syncobj and it looks like
not all callers were updated. To fix this behavior make sure
that a successful drm_sync_find_fence always returns a non-NULL
fence.

v2: Move the fix to drm_syncobj_find_fence from the transfer
    functions.

Fixes: ea569910cbab ("drm/syncobj: add transition iotcls between binary and timeline v2")
Cc: stable@vger.kernel.org
Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
---
 drivers/gpu/drm/drm_syncobj.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index fdd2ec87cdd1..11be91b5709b 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -404,8 +404,17 @@ int drm_syncobj_find_fence(struct drm_file *file_private,
 
 	if (*fence) {
 		ret = dma_fence_chain_find_seqno(fence, point);
-		if (!ret)
+		if (!ret) {
+			/* If the requested seqno is already signaled
+			 * drm_syncobj_find_fence may return a NULL
+			 * fence. To make sure the recipient gets
+			 * signalled, use a new fence instead.
+			 */
+			if (!*fence)
+				*fence = dma_fence_get_stub();
+
 			goto out;
+		}
 		dma_fence_put(*fence);
 	} else {
 		ret = -EINVAL;
-- 
2.34.1

