Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DCB52CFDE
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 11:55:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07C8A11B321;
	Thu, 19 May 2022 09:55:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CE2F11B330;
 Thu, 19 May 2022 09:55:15 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id gi33so397580ejc.3;
 Thu, 19 May 2022 02:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QRTohIh/SLP7A2b6PbdykDkDugeXiT078coAsmgcAFE=;
 b=VizyEkSp0aHl8tiiASc7hW3lQFDVEbNgbI/uV4bTHzxu/Haqt6WVA41p6cUYbt89ao
 Gdujg3gqABKy91Qz1tXUwC3mZXMz7NDwVWEpPUOg9PhovAZ9lscw3+fyPw1SRt5X9wNz
 qg3aN5R6p8fNsGP6Pidwip5MMe1CFPdNXpy6r0R8Kdg8vdF215/12DZYEAZbgBZaldO5
 bR4walEpDmhjy9Yu11Xsf2woP91Y/zeTuuJAQjD4iaLn2JRtpFAJO/CPnvvmyT3A0ZRg
 IBB/V8TACmSHNMECccTCbhTIlR7VUU4CTShoA1m4SkNuSvuR6dCen24NxhYczupsDQdq
 takw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QRTohIh/SLP7A2b6PbdykDkDugeXiT078coAsmgcAFE=;
 b=8Mf7+ivYe6R1TehF9A+kV7CmdzUow/g9w7oCtoqG9Z1g3NaRHHOxyvxO3zY4cYExSX
 ckgtgt5VRZ8a7Vz5tGEO6G1ARVdf3Qp8XQH+RGpen+n5GIxqYxevQJsJjut/6ieTVnyD
 RoYKy+aOLfGnysJuM/MYa8pMO+bYSVhPcsxEiJwwLoAlKjm8rvtotdp7CMyoWriTUACm
 p5iFs8c55kg2AAlv4z+KuT+7tzGlx1Vp77M0AxNDT9SuJ75wFKlToVvEmt5iz9xHUqD+
 Vcyehh5Fe+YSnHvZ56r6nlu0EkZ9yle7azi3xmE9K1E/gxBkuajOfF6kqy7TIv0jptCg
 fY+g==
X-Gm-Message-State: AOAM533GRBoJ2cQ/3b0BPOxQd/9vs9cKYWAoKrfUfHyOJ5u5eD0c2v5U
 h4XUqHvBsDos1fLHYaqPb5P9Na6Orw0=
X-Google-Smtp-Source: ABdhPJzYvm1Jt4ugctUxBNvBvaisZp0OjdQPbo+Sw84lIZ/Agf1JP2QTFDlRe2Zr615q5oN6jXnj7g==
X-Received: by 2002:a17:907:7dab:b0:6f4:6650:395d with SMTP id
 oz43-20020a1709077dab00b006f46650395dmr3396918ejc.82.1652954114733; 
 Thu, 19 May 2022 02:55:14 -0700 (PDT)
Received: from able.fritz.box (p57b0bdaa.dip0.t-ipconnect.de. [87.176.189.170])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a170906518600b006fe9c65ffb8sm388267ejk.92.2022.05.19.02.55.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 02:55:14 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 04/11] drm/ttm: move default BO destructor into VMWGFX
Date: Thu, 19 May 2022 11:55:01 +0200
Message-Id: <20220519095508.115203-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220519095508.115203-1-christian.koenig@amd.com>
References: <20220519095508.115203-1-christian.koenig@amd.com>
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
Cc: matthew.william.auld@gmail.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
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

