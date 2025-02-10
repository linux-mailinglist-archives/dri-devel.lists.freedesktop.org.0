Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38745A2E68F
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 09:37:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88B5710E4C6;
	Mon, 10 Feb 2025 08:37:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ethancedwards.com header.i=@ethancedwards.com header.b="Zum5sqxM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E74710E116;
 Mon, 10 Feb 2025 03:42:27 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4YrqsS1XtTz9sl9;
 Mon, 10 Feb 2025 04:33:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ethancedwards.com;
 s=MBO0001; t=1739158380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tRuwqs8KnCQigl941VXZN5uap3PzZB4mUUfaIPcppDI=;
 b=Zum5sqxM4Q4JadLtlN8RsIZGAEmp2nXh+dQCsajjGuCym3uOA8jSwQKWrZRVLJ0+JGOLzv
 fjv+l0WN++4bzhgvsdQQRpY0HSnuPZirOuAf3y7U5PLzJTHJkTFJePRDVZV4LitV3edu6e
 LOkycJegE4InZ6YLD7evKic1IRHLiwltgMswn8KLVP6d7CrbBxui+2K/vWBQLa4Sdnhwnb
 fdZeGbqMeWc4LnXQu0W1JeGaMtkdmwh/N9um/PnyYOyrw53Oypr/mfyCl8OTzXWkvvv45I
 xmVSE1eQ6dwr1HXxmv5p0zwjqbihex40Gg+ncRBQp/n7tOV/3KtcFLUPRu3SVg==
From: Ethan Carter Edwards <ethan@ethancedwards.com>
Date: Sun, 09 Feb 2025 22:32:33 -0500
Subject: [PATCH] drm/msm/dpu: Fix uninitialized variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-dpu-v1-1-0db666884f70@ethancedwards.com>
X-B4-Tracking: v=1; b=H4sIAFBzqWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIwNL3ZSCUt1k47TEZHOLtGQzQ3MloMqCotS0zAqwKdGxtbUA4F3dx1U
 AAAA=
X-Change-ID: 20250209-dpu-c3fac78fc617
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 Ethan Carter Edwards <ethan@ethancedwards.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1184;
 i=ethan@ethancedwards.com; h=from:subject:message-id;
 bh=e6u4jgCux0UDketL1vecCE7NvY4pCwpsgSfqIahNaEs=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0o0bkp2QXk4ekFKWGJEOXFoNThlVGp6e
 GhQcXlVeHBLOHNUdi9YbjVLaXljdFFLNTBiKyt4VDhoNXIzczNLCmg2M2M3NlUwT0xuc2Qvd2Vk
 YmlqbElWQmpJdEJWa3lSNVgrT2N0cER6UmtLTy8rNk5NSE1ZV1VDR2NMQXhTa0EKRS9uZncvQ0g
 zL0hRVkthdkxhK2xXWlFLanp4Y3ZQZmp6Vi9WTlNlYjdMd3F2ODJleGo3cEFzTWZ2dkRjU3FlVA
 pIeHhXT0R3TlhyQ25xT0Z1ZW1YbDNYZmU5YW5Qekt3Q2p4V3lBZ0JpWFUrUgo9dDY3OQotLS0tL
 UVORCBQR1AgTUVTU0FHRS0tLS0tCg==
X-Developer-Key: i=ethan@ethancedwards.com; a=openpgp;
 fpr=2E51F61839D1FA947A7300C234C04305D581DBFE
X-Mailman-Approved-At: Mon, 10 Feb 2025 08:37:43 +0000
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

There is a possibility for an uninitialized *ret* variable to be
returned in some code paths.

Fix this by initializing *ret* to 0.

Addresses-Coverity-ID: 1642546 ("Uninitialized scalar variable")
Fixes: 774bcfb731765d ("drm/msm/dpu: add support for virtual planes")
Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 098abc2c0003cde90ce6219c97ee18fa055a92a5..74edaa9ecee72111b70f32b832486aeebe545a28 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1164,7 +1164,7 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
 			       unsigned int num_planes)
 {
 	unsigned int i;
-	int ret;
+	int ret = 0;
 
 	for (i = 0; i < num_planes; i++) {
 		struct drm_plane_state *plane_state = states[i];

---
base-commit: a64dcfb451e254085a7daee5fe51bf22959d52d3
change-id: 20250209-dpu-c3fac78fc617

Best regards,
-- 
Ethan Carter Edwards <ethan@ethancedwards.com>

