Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6443951FD9D
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 15:10:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DADC910F18A;
	Mon,  9 May 2022 13:10:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD9D110F185
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 13:10:00 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id u3so19395975wrg.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 May 2022 06:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QRTohIh/SLP7A2b6PbdykDkDugeXiT078coAsmgcAFE=;
 b=qUfzvO7B3CrJdtlWLRtO3d7h9yyLLBKcus8B9P1HfydTDZnV2M5DORs+pNhVhCoft0
 y9U50ovciLwZJEQkmld/SSk5GXLhNCR67ftYFkzq+dpJRu8T6lC3at3rwQrNZN3FCXUZ
 9LRZ1B8p8jrEBRCpjtyQJ5fKT4fnlg6xmVgzFVOf+yXjDvCJpB5n5xtdB+gKu/Kx04MD
 7MzXXSJB3LltkCI/QQ78RDaOe9p4SA+MDYxWn56+HyJnp7dAnNlktaGx17JxDIaxN/Mv
 pB70kEEP4QfgZpeGzTn1xVaw0P02J+EdeMUdGWrQMzdbVpZMDD7czikTgKLQlvOwEY8I
 X+Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QRTohIh/SLP7A2b6PbdykDkDugeXiT078coAsmgcAFE=;
 b=iZyY9UK5KAmrExyqI+Q1+yl6GQJ1sYpsAvl7tjCmoWHurANF3S24ZVvrXqV/DsSc6y
 YnnpcoIm7aTlGGiXtPgB5J1ltCw4KBpK5xAd6MeTGfzGhwO3cj+8OBVIngJ8xwWyH7yE
 kc4HxphkVyplPvI+ALdk2RKucj+1z/6tMlhZnyF2sWzHVUV9xtltvOLI91Zbk/coAitP
 V2T089irfVfyKkK+riy9m7WccbNRhXQndnq+2+l5Ld13gT2pIWyPyUgxB9oW28YBJ5wR
 WXhUu7Yt644FZPKOiLMjNU9gnT9XjKSWqQNfe87YOCb5tzgOKfCF5DIP6pfSDlwtzzOr
 TZEw==
X-Gm-Message-State: AOAM531onF2cgIOyKE8dnDz8GJB9cGWoEMkNAkXOUA3zP7g8f++4CfCY
 GFj4T3+/GSxEDhnxiCAiMPo=
X-Google-Smtp-Source: ABdhPJzfcaig6n9YbnaCbwtlj793Aj52gRxs7fNZ/ET15orWUur/1zdmJ8o7dWiQlIQSiuFTdzu60Q==
X-Received: by 2002:a5d:4f8b:0:b0:20c:6970:fb3c with SMTP id
 d11-20020a5d4f8b000000b0020c6970fb3cmr13857090wru.554.1652101799298; 
 Mon, 09 May 2022 06:09:59 -0700 (PDT)
Received: from able.fritz.box (p57b0b3fd.dip0.t-ipconnect.de. [87.176.179.253])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a05600c2f9000b003942a244f50sm18683385wmn.41.2022.05.09.06.09.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 06:09:58 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: bob.beckett@collabora.com, dri-devel@lists.freedesktop.org, daniel@ffwll.ch
Subject: [PATCH 04/11] drm/ttm: move default BO destructor into VMWGFX
Date: Mon,  9 May 2022 15:09:44 +0200
Message-Id: <20220509130951.486344-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509130951.486344-1-christian.koenig@amd.com>
References: <20220509130951.486344-1-christian.koenig@amd.com>
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

It's the only driver using this.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
index 85a66014c2b6..c4f376d5e1d0 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
@@ -462,6 +462,9 @@ int vmw_bo_create(struct vmw_private *vmw,
 		return -ENOMEM;
 	}
 
+	if (!bo_free)
+		bo_free = vmw_bo_default_destroy;
+
 	ret = vmw_bo_init(vmw, *p_bo, size,
 			  placement, interruptible, pin,
 			  bo_free);
-- 
2.25.1

