Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1876FF8E7
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 19:54:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD76110E5C5;
	Thu, 11 May 2023 17:54:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECF0710E5B6
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 17:54:47 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-50bcae898b2so15862783a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 10:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683827686; x=1686419686;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EQScT8GkY2Eioro0tIS01FKpHQljEwNBJwJbRAB5I3k=;
 b=Svo6UN8Pbv71gJ70I0Gni20C5gG4GAiJs+Yp5rSmL84xqbB/yGpOnUV3QuigP/Yx2a
 Z0BIrLoew9ihGNebx0gT4Kjo/5i/wz3K3tBkhvWEzjfHE9T+GL2Lr2sQbfAO/m8ceHIv
 x6aDj8AkwcVnxSrEkBWDOR7EuRqwNeCZgqohFV9eYiYqkdfE+cr/3snjE6Xh0n2iBfl+
 27yLRtCP1iLjS6gF6leqjJtPGxwS0KUX2Y2f7tB01rSvfvcpf+G6nW81uAX8AQkSjzoP
 MbGe1nrCqmJajYxxGRGsEtpGAIUYif2tYz1d/goCrpjeiIVJ6xhLcm0YyjAYVXu+WUmO
 Lp3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683827686; x=1686419686;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EQScT8GkY2Eioro0tIS01FKpHQljEwNBJwJbRAB5I3k=;
 b=NbRdhBg+MeISGnEpamXIUaw2TzFq8FCfDZzQsggix3S2+Wjr31/VJMSSmvO9o9ZXLn
 JB4vubRehcynmnTNkOf2tl3n3TLc/IR8e9qJHxQJQKj2UdzG82wUu01ce8g7O2kEDdGh
 GYPr2zwinAU1l77v6w6XCuc2Aib3Zk5KEpD/sDZ+oQeDqKujYObpwebbZAngTiWUvuPR
 e4v2N65PLVd9Z4B2poKf0uf5FxzcQsqKXnhsqkZpt38L1AydgorJGzr7voq4HbYAJ8FJ
 uUAFesG+MKj/dMRrJhQGbYiX23Uuaym8ZowjYNMFBzVxJ3QqHCxfYV8Uz5jVMix8JvQL
 SFlw==
X-Gm-Message-State: AC+VfDzDsyN+Q1rYf0LH6MNij9NgsN1TRKjRrJTfx9A2iQfHeOuRp0yx
 f2VhcE4JyduF8eNbBmdZ46boXw==
X-Google-Smtp-Source: ACHHUZ6NPjqJnNGavsOCoRiaBb5w3G6IZ9ZGBFpmTNX8AUxhnLlj5X0g+1X2Ou+pSyzZuPTIG2891A==
X-Received: by 2002:aa7:c99a:0:b0:50b:c3f0:fb9d with SMTP id
 c26-20020aa7c99a000000b0050bc3f0fb9dmr17451185edt.41.1683827686036; 
 Thu, 11 May 2023 10:54:46 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d7cd:1be6:f89d:7218])
 by smtp.gmail.com with ESMTPSA id
 j5-20020aa7de85000000b0050bc4600d38sm3085610edv.79.2023.05.11.10.54.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 10:54:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] drm/nouveau: constify pointers to hwmon_channel_info
Date: Thu, 11 May 2023 19:54:43 +0200
Message-Id: <20230511175443.281970-1-krzysztof.kozlowski@linaro.org>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Statically allocated array of pointers to hwmon_channel_info can be made
const for safety.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/nouveau/nouveau_hwmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_hwmon.c b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
index e844be49e11e..db30a4c2cd4d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_hwmon.c
+++ b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
@@ -211,7 +211,7 @@ static const struct attribute_group temp1_auto_point_sensor_group = {
 
 #define N_ATTR_GROUPS   3
 
-static const struct hwmon_channel_info *nouveau_info[] = {
+static const struct hwmon_channel_info * const nouveau_info[] = {
 	HWMON_CHANNEL_INFO(chip,
 			   HWMON_C_UPDATE_INTERVAL),
 	HWMON_CHANNEL_INFO(temp,
-- 
2.34.1

