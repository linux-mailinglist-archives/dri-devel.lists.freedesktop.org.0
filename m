Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A94A97176
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 17:45:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B087899C7;
	Tue, 22 Apr 2025 15:45:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FrYwLEmN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E45CE899C7;
 Tue, 22 Apr 2025 15:45:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C5F185C5CEA;
 Tue, 22 Apr 2025 15:42:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB6DAC4CEE9;
 Tue, 22 Apr 2025 15:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745336699;
 bh=BbtwK2smXn0Op0m1KEOnNdTqhkRUWhYr3xZpX7mRyNc=;
 h=Date:From:To:Cc:Subject:From;
 b=FrYwLEmNiG6+bWdHnb47cgV6A6v8/yVyaKvcFT8LkzBrmT20VrlRVND8yFW5fGLma
 c6NY9IGNVWmqNofE8u/Ykbfeku+fcKYuY3lflMaVySJUCmcX4oeLHLRJtDvnj0XaJ7
 TyzkHod0S2u0d51M4nvjGni+0RBiSMHyyWm/Vg5eGmLrgh0dfEV+xbUkDDJ9dmOSkD
 dXp5uY73cVjS+noZxxoum00SyJSMQcjdidj/WqgHKshhixOnIQDIQMdiEjMC+/pO+W
 A7RZtw60P7lJQXlE44mDbROjHe4x/eKqhRdkI+CQV8ywkRTbsowmb6UVIdgCo+SXZg
 VP/SukavonrQw==
Date: Tue, 22 Apr 2025 09:44:56 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-hardening@vger.kernel.org
Subject: [PATCH][next] drm/nouveau: disp: Use __member_size() helper
Message-ID: <aAe5eNDnRyGnxLMX@kspp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Use __member_size() to get the size of the flex-array member at compile
time, instead of the convoluted expression `__struct_size(p) - sizeof(*p)`

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 725331638a15..9bed728cb00e 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -776,7 +776,7 @@ nv50_hdmi_enable(struct drm_encoder *encoder, struct nouveau_crtc *nv_crtc,
 	const u8 rekey = 56; /* binary driver, and tegra, constant */
 	u32 max_ac_packet;
 	DEFINE_RAW_FLEX(struct nvif_outp_infoframe_v0, args, data, 17);
-	const u8 data_len = __struct_size(args) - sizeof(*args);
+	const u8 data_len = __member_size(args->data);
 	int ret, size;
 
 	max_ac_packet  = mode->htotal - mode->hdisplay;
-- 
2.43.0

