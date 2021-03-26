Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 807B934AA72
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 15:51:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E8B26F414;
	Fri, 26 Mar 2021 14:51:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63A086F405
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 14:51:28 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 a132-20020a1c668a0000b029010f141fe7c2so5088908wmc.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 07:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dexBEjYiMkS4XXfyY7Y63BCfCtQuPvt6wAmmNMM9uiU=;
 b=sy0LpR6CO/+hGOGtblTJwkDRNfJ0OIYrkXpVb7gzm3NNWD+WbbNHcwjYquArjfkiLp
 3pqD/CIluuv2EH803a7w+8Zpruec3tTOpAo2v9DrUADG0Q1vvvb6t5KkdWBVl4aszjOs
 8WuiMFf8IJtBqfs2rjLhZBYeUQfTVeyUxvSLw2XQ/Q8x3QoT1c5Zb0O/zTD2e59YE3b8
 vRYwATWOzwE/06IhBA/Zbcvh1dmygCiWgw5r3tqYHhKd2DJ2O1zNkA77pygVOqb6CQMf
 Bbhaw4FCKRLPrklpt3UaeOBU5OtLlHNLwHuUVla0NBptfyCpPdwIetjAufT1nb2/0A4/
 wBHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dexBEjYiMkS4XXfyY7Y63BCfCtQuPvt6wAmmNMM9uiU=;
 b=WG3/8x3lRRIWXKtM5gDEfCp95AGuge6R8rGnWFwcQ0Wg9nMifUX86GgyLWEUD/10Ph
 Vt1mVTLioFwRjIhRf0+HNFCCdDV6KITEmdfjuxJ2PHvVHSse7N8pvvfCpmZrBBrWhc9j
 FXdzU88k1K57DFdywTCv0XeDTTR0leLCM4DTcraTaUus+O6hWeGtU2/CZTQcDwGNSNbK
 hultooJj0g1qOEgK9/u9Xf8yXSzvVXZe3cZuEBGFVhlqnIl0o7gOCdtj+wjlvp3wT060
 9I2fUN9YLlzB1W0qlCVo9s965/H6rAVjYO0tKAy9+JgSSF/cBYQe6N5L1LxGfmsN1oZ7
 QHbA==
X-Gm-Message-State: AOAM531prLlkornQp8LKSKDKeGKysnrcqDdYD1TItXleuWVrQfYqebLw
 yOagjMTFzgZQebkRYkArnAk=
X-Google-Smtp-Source: ABdhPJyAMzgOJyXp6zRFVElVkH/XLVwQcbL0T9qq9DXloPusNrJUNrrxtee7Loh7WIWQCUuT5ehcaQ==
X-Received: by 2002:a7b:c083:: with SMTP id r3mr13414453wmh.177.1616770287127; 
 Fri, 26 Mar 2021 07:51:27 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id r16sm8022566wrx.75.2021.03.26.07.51.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Mar 2021 07:51:26 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 02/10] drm/arm: malidp: Use fourcc_mod_is_vendor() helper
Date: Fri, 26 Mar 2021 15:51:31 +0100
Message-Id: <20210326145139.467072-3-thierry.reding@gmail.com>
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

Rather than open-coding the vendor extraction operation, use the newly
introduced helper macro.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/arm/malidp_planes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/arm/malidp_planes.c b/drivers/gpu/drm/arm/malidp_planes.c
index ddbba67f0283..cd218883cff8 100644
--- a/drivers/gpu/drm/arm/malidp_planes.c
+++ b/drivers/gpu/drm/arm/malidp_planes.c
@@ -165,7 +165,7 @@ bool malidp_format_mod_supported(struct drm_device *drm,
 		return !malidp_hw_format_is_afbc_only(format);
 	}
 
-	if ((modifier >> 56) != DRM_FORMAT_MOD_VENDOR_ARM) {
+	if (!fourcc_mod_is_vendor(modifier, ARM)) {
 		DRM_ERROR("Unknown modifier (not Arm)\n");
 		return false;
 	}
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
