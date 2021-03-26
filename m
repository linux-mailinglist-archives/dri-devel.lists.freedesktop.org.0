Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 611E034AA76
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 15:51:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C65F6F416;
	Fri, 26 Mar 2021 14:51:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B0D76F417
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 14:51:44 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id c8so5894120wrq.11
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 07:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4EQdWnddGJ/kQ9X+WOHcXmmOLEE1Ao3uU331cQ38SAg=;
 b=enao8mgcKZYIHmmSc8fP82R7Uvh5QdsPispc717XCpG6siaR54TOWpeF3DKjpLc+Ja
 79PmIeugt5218rNrH3KIVqmI4FL2tBxuFWQOx9vj5cNY35FpMtFflT+pwLSoJb8Sy4vO
 19mDrwlvSEu2rNPMAOwxQvhBH+9dCBWXkq3wU3gChs9cFfxr2UHT6LRktMB3c18OxpiZ
 83CE5WA6zDOlCUqEzGPIJxd4v00sdapJ9CTurSR+brPo5AYl8C2gjeMaxps4vHQ/4L5H
 2F9TY+3AcZ29uI1ynUFfPSaE0IdvTxFQbR1qE7gb43l9+vZnXbFsd/xyawtRdSAdzCK0
 Ec3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4EQdWnddGJ/kQ9X+WOHcXmmOLEE1Ao3uU331cQ38SAg=;
 b=kUVcuaJbUDtiegQmopS4Oehaoi8B5ODABhcRQZXM+7LImXb7N8FNZzkI/A07SGoQ75
 j4qY38jPqaCg/33ZrQe177p6tt+wVDXDPviJDorcx7eZaPoyed3MT9LfAKVriS/xcAAq
 ZtX1tGDzXQ6gs0aA+ZNY8oNhGHmxC40I7YsW049R5cTsumYwZy9Sfj30ZZ/KCXRTrqnw
 Wa93f9Ec115Fle7pToIJO/39kFBCKsz5kPAwmtCSo0gJGPfUwYLreBa6STdSXIGM+63x
 nmTven9cstWCpEQzJufAukJvkJdd/sXuuf1lxFt2vpe2wPjxJZF35ckywsCQFJN5iYz0
 L50g==
X-Gm-Message-State: AOAM531hezfsQw7tjLRVqgqxsdi66LKFfAqu2IAQbNOkLsCuOrLdeGoF
 B1ULtQZBm6eC1dACspPaSxM=
X-Google-Smtp-Source: ABdhPJwiV0JfMVHYmX9QVc6SlgIQK3InJMu/Yympz5YY5VgTY6Mefe9ZAZ/YHRIpFZvbvFX+mH+RMQ==
X-Received: by 2002:adf:e391:: with SMTP id e17mr14934194wrm.285.1616770303332; 
 Fri, 26 Mar 2021 07:51:43 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id i10sm13028664wrs.11.2021.03.26.07.51.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Mar 2021 07:51:42 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 06/10] drm/tegra: fb: Add diagnostics for framebuffer
 modifiers
Date: Fri, 26 Mar 2021 15:51:35 +0100
Message-Id: <20210326145139.467072-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210326145139.467072-1-thierry.reding@gmail.com>
References: <20210326145139.467072-1-thierry.reding@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, James Jones <jajones@nvidia.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

Add a debug message to let the user know when a framebuffer modifier is
not supported.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/fb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
index 01939c57fc74..350f33206076 100644
--- a/drivers/gpu/drm/tegra/fb.c
+++ b/drivers/gpu/drm/tegra/fb.c
@@ -86,6 +86,7 @@ int tegra_fb_get_tiling(struct drm_framebuffer *framebuffer,
 		break;
 
 	default:
+		DRM_DEBUG_KMS("unknown format modifier: %llx\n", modifier);
 		return -EINVAL;
 	}
 
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
