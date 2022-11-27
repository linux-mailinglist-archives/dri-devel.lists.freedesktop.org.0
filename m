Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 789AA639C5B
	for <lists+dri-devel@lfdr.de>; Sun, 27 Nov 2022 19:31:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFF7D10E0C8;
	Sun, 27 Nov 2022 18:30:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A66310E0CC
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Nov 2022 18:30:55 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 k2-20020a17090a4c8200b002187cce2f92so11939116pjh.2
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Nov 2022 10:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jDF7fJniIMYLvPziDoJ8MkC8F8ub7ejPyCVqiyAzxbk=;
 b=AisgvCleW+MkXJB8X9DCovNuu4hxzk9hIOBWg1ZYt5+sNDOfIoZyWmifRAm4aN0H7I
 c8P9W9MQMq8C2OYcpbAuj1U+rAYWcPFXKZwUdfnY10rg9IKx7CxATGyoElfk6S1S8VPO
 1PdJvLOOkunkyhOsSyUGCZoRXLYGlD5jrvKEQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jDF7fJniIMYLvPziDoJ8MkC8F8ub7ejPyCVqiyAzxbk=;
 b=o5fS++vsiwP+5gUB8b1OQfmPVdIP4/pYyfC1UhjjOFX3h8S09LOIK9ty3r2iuW+Ykt
 dK/4hjXhs0DWCymPvZNQPBNePWQVfgzM99buHsuRUfi9A/tk3e0kndRXUSaEm4w1SqV3
 kG7pN31lcRWvVVQUrB/ADQ0zWSl3q8Qe2+cFzDOnT7oA4iRAmyuARMxXj4ZlSiclktRk
 1QQzxOYx29oTw1BuKfOQWZOER2MN4ydKscPj3U8RUjeuaA6UOtTsWZTkocjJI2ZEKrxX
 coZgtJH7PnTprsh8Bko1wDFBGTx6+UQqy3RmlazmFWNapjJbTw35i0UfozLH913T8PJ3
 R3/g==
X-Gm-Message-State: ANoB5pksLLUYHv7R2/JfiwdsPcS49w9k4KmUgQimhX79tHN18fn1DOQ6
 03QjEGXNr43egInJBQ+gtiNTOw==
X-Google-Smtp-Source: AA0mqf7vMt+NN5E0Qb1RrNycekHOmPvCA4lKOn3JC1pm9sJj9xn15AgZOivCj9HY2oPU8DHoxQGftA==
X-Received: by 2002:a17:903:491:b0:17f:73d6:4375 with SMTP id
 jj17-20020a170903049100b0017f73d64375mr28634744plb.24.1669573854418; 
 Sun, 27 Nov 2022 10:30:54 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 d17-20020a170902729100b00186727e5f5csm7056105pll.248.2022.11.27.10.30.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Nov 2022 10:30:53 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Ben Skeggs <bskeggs@redhat.com>
Subject: [PATCH] drm/nouveau/disp: Fix nvif_outp_acquire_dp() argument size
Date: Sun, 27 Nov 2022 10:30:41 -0800
Message-Id: <20221127183036.never.139-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3658; h=from:subject:message-id;
 bh=sZK5dE9btSjBkKxfA4jZ7gqAN7jjH8fOoys33f5siLw=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBjg6zRKOASHsDsI5HMr1hz1aZcJj50RsL9W8Nz5Ec5
 WMshrKaJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCY4Os0QAKCRCJcvTf3G3AJttfD/
 sHXTAYQIIIzN3AhaUwjNIR6S7WQm41hdKZf7A6wWb27QHSC2ACLJlTNHmYZatZCamyBAee3hh2oqHx
 7XFsahk/Ol4P6EbW01mVxCwKskddYuvUXLa8qUyhJC4bLcMzsTIEPc6YVwIgJjpxAX3pbY7gB5ESeS
 HT3MZCWZNWKTjuNID8ZXQxdYJ1/VRyviwStdrdIbYQqCchaHprlY7sOWqmBU8cYw6uFsagh0nbRBwl
 zs/Kjc5GftyjHyoLs4WaKuN9LaHvkj2XjasKuzfBbPFNW9yRzhi+C8dR/R+h+jKeWqkhEBdB6bcw2M
 cImYaS/PQSCVvpVKOas65BWndH40jdBfm6KKi/SuHjBxZlGYzlrfIE6V3i7R3i3Q4XGUsmI4JmlrpS
 Rkk8CzQimshj29kc2okst/XZw45BhnSgTCuR9iZJ+FWaFyE4qKCeI7E7WHRWjbGwbKXtOjbJODrxfE
 9gqZy9H8op3PjIjubv/HqBFwQIbsnSfPerlyrbWphGlXeLiJVoiD/sano2XoEkHDHyQ1ZX8ROyfn+i
 kGj3eG1NhGSQ52RfWTOA/wNxDOyKVDLcycCYmNkc+z6fmfSSel+YAF/gQnjYWkVjJV5ih+ecrvnbln
 mFU2tAYNru46y5SD4WffSIFjQL4i0Ytk+cuQryA4M52g/e58iWl8g/IRG+LA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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
Cc: Kees Cook <keescook@chromium.org>, Karol Herbst <kherbst@redhat.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 coverity-bot <keescook+coverity-bot@chromium.org>,
 dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Both Coverity and GCC with -Wstringop-overflow noticed that
nvif_outp_acquire_dp() accidentally defined its second argument with 1
additional element:

drivers/gpu/drm/nouveau/dispnv50/disp.c: In function 'nv50_pior_atomic_enable':
drivers/gpu/drm/nouveau/dispnv50/disp.c:1813:17: error: 'nvif_outp_acquire_dp' accessing 16 bytes in a region of size 15 [-Werror=stringop-overflow=]
 1813 |                 nvif_outp_acquire_dp(&nv_encoder->outp, nv_encoder->dp.dpcd, 0, 0, false, false);
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/nouveau/dispnv50/disp.c:1813:17: note: referencing argument 2 of type 'u8[16]' {aka 'unsigned char[16]'}
drivers/gpu/drm/nouveau/include/nvif/outp.h:24:5: note: in a call to function 'nvif_outp_acquire_dp'
   24 | int nvif_outp_acquire_dp(struct nvif_outp *, u8 dpcd[16],
      |     ^~~~~~~~~~~~~~~~~~~~

Avoid these warnings by defining the argument size using the matching
define (DP_RECEIVER_CAP_SIZE, 15) instead of having it be a literal
(and incorrect) value (16).

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1527269 ("Memory - corruptions")
Addresses-Coverity-ID: 1527268 ("Memory - corruptions")
Link: https://lore.kernel.org/lkml/202211100848.FFBA2432@keescook/
Link: https://lore.kernel.org/lkml/202211100848.F4C2819BB@keescook/
Fixes: 813443721331 ("drm/nouveau/disp: move DP link config into acquire")
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Dave Airlie <airlied@redhat.com>
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/gpu/drm/nouveau/include/nvif/outp.h | 3 ++-
 drivers/gpu/drm/nouveau/nvif/outp.c         | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/outp.h b/drivers/gpu/drm/nouveau/include/nvif/outp.h
index 45daadec3c0c..fa76a7b5e4b3 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/outp.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/outp.h
@@ -3,6 +3,7 @@
 #define __NVIF_OUTP_H__
 #include <nvif/object.h>
 #include <nvif/if0012.h>
+#include <drm/display/drm_dp.h>
 struct nvif_disp;
 
 struct nvif_outp {
@@ -21,7 +22,7 @@ int nvif_outp_acquire_rgb_crt(struct nvif_outp *);
 int nvif_outp_acquire_tmds(struct nvif_outp *, int head,
 			   bool hdmi, u8 max_ac_packet, u8 rekey, u8 scdc, bool hda);
 int nvif_outp_acquire_lvds(struct nvif_outp *, bool dual, bool bpc8);
-int nvif_outp_acquire_dp(struct nvif_outp *, u8 dpcd[16],
+int nvif_outp_acquire_dp(struct nvif_outp *outp, u8 dpcd[DP_RECEIVER_CAP_SIZE],
 			 int link_nr, int link_bw, bool hda, bool mst);
 void nvif_outp_release(struct nvif_outp *);
 int nvif_outp_infoframe(struct nvif_outp *, u8 type, struct nvif_outp_infoframe_v0 *, u32 size);
diff --git a/drivers/gpu/drm/nouveau/nvif/outp.c b/drivers/gpu/drm/nouveau/nvif/outp.c
index 7da39f1eae9f..c24bc5eae3ec 100644
--- a/drivers/gpu/drm/nouveau/nvif/outp.c
+++ b/drivers/gpu/drm/nouveau/nvif/outp.c
@@ -127,7 +127,7 @@ nvif_outp_acquire(struct nvif_outp *outp, u8 proto, struct nvif_outp_acquire_v0
 }
 
 int
-nvif_outp_acquire_dp(struct nvif_outp *outp, u8 dpcd[16],
+nvif_outp_acquire_dp(struct nvif_outp *outp, u8 dpcd[DP_RECEIVER_CAP_SIZE],
 		     int link_nr, int link_bw, bool hda, bool mst)
 {
 	struct nvif_outp_acquire_v0 args;
-- 
2.34.1

