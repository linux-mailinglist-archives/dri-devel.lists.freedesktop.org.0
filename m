Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF11C9249E1
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:22:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 714BB10E6A5;
	Tue,  2 Jul 2024 21:22:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="gmnxE7WA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F55010E6A8;
 Tue,  2 Jul 2024 21:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8shIziYaH1I6kOcy98r2qE87n4FfKZ/MbO4p811IbiM=; b=gmnxE7WAsdbc4xx6JtWi80SL9Z
 LGNskCrCfY7H3AL/+BS9I4HeVTckf2+bAxMqXbCLuR77S3CW+g7Vi446yKfP17dEvhVzBkA1eNzIs
 YoMem5nCFUfD557HrucmH9/lZ5rms8dfKu/RZnpvZz+KvvDzeZMV/FYlTb/tPwCqRFtq0UebBL3ne
 DPnom9YTBweetrnH0B58WVq7wZw5oVsgchCfUAgiIrBsUC/yTBn9Y1UeIEMPT/lVIpLJ9qe5E4FXB
 9iFK8t4BejDAo5t++rTt1xoM3TqTq8fVxQ8UxbIOy59sG0Lv9VUUTZnBLcISOGOX+BEmL2k0UVCBD
 5WWweOUA==;
Received: from [191.19.134.16] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sOkxH-00ASeG-7s; Tue, 02 Jul 2024 23:22:27 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: kernel-dev@igalia.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 Simon Ser <contact@emersion.fr>, Pekka Paalanen <ppaalanen@gmail.com>,
 daniel@ffwll.ch, Daniel Stone <daniel@fooishbar.org>,
 =?UTF-8?q?=27Marek=20Ol=C5=A1=C3=A1k=27?= <maraeo@gmail.com>,
 Dave Airlie <airlied@gmail.com>, ville.syrjala@linux.intel.com,
 Xaver Hugl <xaver.hugl@gmail.com>, Joshua Ashton <joshua@froggi.es>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH v2 2/2] drm/atomic: Allow userspace to use damage clips with
 async flips
Date: Tue,  2 Jul 2024 18:22:15 -0300
Message-ID: <20240702212215.109696-2-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240702212215.109696-1-andrealmeid@igalia.com>
References: <20240702212215.109696-1-andrealmeid@igalia.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Allow userspace to use damage clips with atomic async flips. Damage
clips are useful for partial plane updates, which can be helpful for
clients that want to do flips asynchronously.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
v2 changes:
- new patch

 drivers/gpu/drm/drm_atomic_uapi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 2e1d9391febe..7609c798d73d 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1072,7 +1072,8 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
 
 		if (async_flip &&
 		    prop != config->prop_fb_id &&
-		    prop != config->prop_in_fence_fd) {
+		    prop != config->prop_in_fence_fd &&
+		    prop != config->prop_fb_damage_clips) {
 			ret = drm_atomic_plane_get_property(plane, plane_state,
 							    prop, &old_val);
 			ret = drm_atomic_check_prop_changes(ret, old_val, prop_value, prop);
-- 
2.45.2

