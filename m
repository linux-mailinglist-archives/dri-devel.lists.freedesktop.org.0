Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE1D3F1818
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 13:23:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D0C26E826;
	Thu, 19 Aug 2021 11:23:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEEAB6E826
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 11:23:05 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id x10so8542033wrt.8
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 04:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7PolFHl4BCa4E4HG380dOZoCiWwe/gYoL591bvSVGBo=;
 b=MUGcj75NEruHQKoBHz6y3OzpZz+BnR4yeHn9iw9hVQF+5QKA22Ax4jGzhSCjKWQZmU
 JCqJWdm0fJ1TpTcsxzq8ODuzKQfBnu4bjP5VmU3wQ0+eY3+s8Kmhl1Fnh/ybmxE9WZv6
 yRvy5pqgh+gByvZQAlcEpBSmos89dHhWFWuShAAk+8V5QBLUuMfBwhqFVYsRa4V5bKoG
 eW1bqhoTLvLFhqlUQqaevytmmneBtdL22N380k2YWHP2/zgPp4TefhOOYuSaYS7AM33H
 4FZ6Q+8xREiYgbE1O6W2ClldA55GyAq+ar2DZDLfmNjrbPFdjPhQiCln5P96FwMxLyKm
 Q7FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7PolFHl4BCa4E4HG380dOZoCiWwe/gYoL591bvSVGBo=;
 b=lvq822XLdTYovOAGjskZcRC6EzvJEtjODMGSN23JVqDRsrJt2lseUPc/Ua3wWeDgm7
 5n2aogM4Un3rLjevfC1YaeguO8EgVgZROcuk8Q+8EX1awgGKXheCtVxEeRd71kX7y8qF
 cFcX4PNN7G1+yautTmsUut5RTBCntUbBAlAx3vEiS8dVLDmxp8VPwE9LWPEG5A0iu5uu
 ib5Seh9K9vjm5owdGhCd1MUHjbrcOVOzi6IBQjm2X6vrFpZkuBGOmDcNf5Xyrqs6s//f
 /abNWoezr2pz0gkg9A0vmCF8HTBm/jLayvPTjobsJRj2l8UeUGU408DQlIZS1gxlc+DJ
 OLVA==
X-Gm-Message-State: AOAM530C0ipZ71e2XTLpbObO7h/RKM4bz9/nQnKv/HXMs17//GcrEXGg
 WD3xfjdh3er2m+h7YEpd/Do=
X-Google-Smtp-Source: ABdhPJz8CDAX5l4BP2wfFbZ6AML0Lin/n32NRpAJOPfTlU/1JgLGC2q8ibTlyRKz9oat+Y1Iv8DnGQ==
X-Received: by 2002:adf:f288:: with SMTP id k8mr3162716wro.350.1629372184426; 
 Thu, 19 Aug 2021 04:23:04 -0700 (PDT)
Received: from localhost.localdomain (arl-84-90-178-246.netvisao.pt.
 [84.90.178.246])
 by smtp.gmail.com with ESMTPSA id r1sm2700388wrt.24.2021.08.19.04.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 04:23:04 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Emma Anholt <emma@anholt.net>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH v2 2/5] drm: amdgpu: remove obsolete reference to config CHASH
Date: Thu, 19 Aug 2021 13:22:50 +0200
Message-Id: <20210819112253.16484-3-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210819112253.16484-1-lukas.bulwahn@gmail.com>
References: <20210819112253.16484-1-lukas.bulwahn@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 04ed8459f334 ("drm/amdgpu: remove chash") removes the chash
architecture and its corresponding config CHASH.

There is still a reference to CHASH in the config DRM_AMDGPU in
./drivers/gpu/drm/Kconfig.

Remove this obsolete reference to config CHASH.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 drivers/gpu/drm/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index f3bc90baca61..8fc40317f2b7 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -257,7 +257,6 @@ config DRM_AMDGPU
 	select HWMON
 	select BACKLIGHT_CLASS_DEVICE
 	select INTERVAL_TREE
-	select CHASH
 	help
 	  Choose this option if you have a recent AMD Radeon graphics card.
 
-- 
2.26.2

