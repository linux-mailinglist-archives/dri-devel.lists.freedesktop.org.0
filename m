Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 174697C9C77
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 00:40:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B78610E0F0;
	Sun, 15 Oct 2023 22:40:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E70110E0E9
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Oct 2023 13:11:26 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40776b1ff73so14331055e9.2
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Oct 2023 06:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697375484; x=1697980284; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=o11HJjwzxDPmGkLeY91KFGMkBQ1VW8cU0/SV0Rl7Esc=;
 b=KBsXUw2Ndv2SHFiu+VX/UeXuivYkIDomUqghzqfJDjOZHMZTlcp7nk6EngyT5hBRuD
 DxL6ZbPKS6CQ4bZwZF46mbX9hRgJuexeCnOCqP/+5rQw5xcXTLTddqX2dVsjf64/hezW
 ehDE3rmqBobcQqRXAioDrQ++7RDR+6UofkbPGYttAOYv8xkHtCUNGNhy5qNksx108l1m
 OytzO5gsjaFNFIjTU4dIVeWgMB1+eLNF1mjVuGBcS/qQB8OqYCioOR+dPKkMsp5TAyCJ
 Zb30Odqyrs53guGn7yRxBAHpACp6znEgKv4KhqZrlr9//tKfZJSZitsj1Oj8A0EpyED3
 FMPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697375484; x=1697980284;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o11HJjwzxDPmGkLeY91KFGMkBQ1VW8cU0/SV0Rl7Esc=;
 b=Nn+3Jq2CgHEvqfeyeVeMu0YpTiPndBuTox/CrXHj/kTGBu08olg0yMbCHtUG3SqY4w
 2mHEfXyF7fwFyk0NvfuX4krncrLtGSkXGsd2uvfxqX5aQXn/crtQ+xAzk7PAq8fSv3ZY
 Yy7HsjOtKkUsrOykrjS47hLkq/CEQoZ7uUL+MAb5oWiwsYjEddDODOODTWfeW8irqWwN
 iV6V2DHigdsCgvMYnJUqkLrfKCHiGtdunfqVMNCKzDPQauQ2qAk+q7O5MtlMghjmJ0Tl
 Mu982mIwaxGTzxjHZXkyL2g4YcmR4U2c4aHi6JtsMZ9x0HaZqOi0FaZq7U97KiT9Bw6G
 SHGA==
X-Gm-Message-State: AOJu0YxOI3qPzgoHs7eGF+Apwey1RWd4oEG0mKZo7cfASKabFCBYDUvP
 AoDwSE0Wn6jZgMLvq87+xio=
X-Google-Smtp-Source: AGHT+IEzkCt3d3NFqv25/uXO5bvsjkDTqjCXWlWAUWwvWcDzzsFT7gyaHZMuVTXy1DQBLvywBfecWw==
X-Received: by 2002:a05:600c:290:b0:406:177e:5df7 with SMTP id
 16-20020a05600c029000b00406177e5df7mr27038881wmk.29.1697375484226; 
 Sun, 15 Oct 2023 06:11:24 -0700 (PDT)
Received: from localhost.localdomain
 (ptr-4x653mgnc6rxc3brvi5.18120a2.ip6.access.telenet.be.
 [2a02:1810:a404:e700:259e:a1b4:62cb:af3d])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a05600c139300b0040651505684sm4508763wmf.29.2023.10.15.06.11.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Oct 2023 06:11:23 -0700 (PDT)
From: Yussef Dalton <yussef.dalton@gmail.com>
To: tzimmermann@suse.de
Subject: [PATCH] drm/tiny: print 'struct resource *' correctly
Date: Sun, 15 Oct 2023 15:11:00 +0200
Message-ID: <20231015131100.331880-1-yussef.dalton@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 15 Oct 2023 22:39:59 +0000
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
Cc: Yussef Dalton <yussef.dalton@gmail.com>, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since format specifier %pr refers to a 'struct resource *', there is no
need to take the address of the 'res' variable since it is already of
type 'struct resource *'.

Signed-off-by: Yussef Dalton <yussef.dalton@gmail.com>
---
 drivers/gpu/drm/tiny/ofdrm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tiny/ofdrm.c b/drivers/gpu/drm/tiny/ofdrm.c
index 2d999a0facde..6372ab383747 100644
--- a/drivers/gpu/drm/tiny/ofdrm.c
+++ b/drivers/gpu/drm/tiny/ofdrm.c
@@ -1208,13 +1208,13 @@ static struct ofdrm_device *ofdrm_device_create(struct drm_driver *drv,
 
 	ret = devm_aperture_acquire_from_firmware(dev, fb_pgbase, fb_pgsize);
 	if (ret) {
-		drm_err(dev, "could not acquire memory range %pr: error %d\n", &res, ret);
+		drm_err(dev, "could not acquire memory range %pr: error %d\n", res, ret);
 		return ERR_PTR(ret);
 	}
 
 	mem = devm_request_mem_region(&pdev->dev, fb_pgbase, fb_pgsize, drv->name);
 	if (!mem) {
-		drm_warn(dev, "could not acquire memory region %pr\n", &res);
+		drm_warn(dev, "could not acquire memory region %pr\n", res);
 		return ERR_PTR(-ENOMEM);
 	}
 
-- 
2.41.0

